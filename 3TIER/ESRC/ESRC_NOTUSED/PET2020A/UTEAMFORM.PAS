unit UTeamForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo;

type
  TTeamForm = class(TForm)
    CB_ShowClass: TCheckBox;
    PageControl1: TPageControl;
    BB_Save  : TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    Panel7: TPanel;
    P_ControlButton: TPanel;
    SB_S: TSpeedButton;
    SB_A: TSpeedButton;
    SB_B: TSpeedButton;
    SB_C: TSpeedButton;
    SB_D: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    L_Total: TLabel;
    L_Yes: TLabel;
    TabSheet3: TTabSheet;
    TDS1: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    L_jobkind: TLabel;
    SG_Score: TStringGrid;
    OM_Merit_C1: TOnMemo;
    OM_Merit_C2: TOnMemo;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    TDml: TTMaxDataSet;
    Lb1: TLabel;
    P_Info: TPeJeonLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    L_Score: TPanel;
    SG_HiddenData: TStringGrid;
    SG_Image: TStringGrid;
    procedure BB_CancelClick(Sender: TObject);
    procedure SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ImageExit(Sender: TObject);
    procedure SG_ScoreDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ScoreEnter(Sender: TObject);
    procedure CB_ShowClassClick(Sender: TObject);
    procedure SB_YesNoClick(Sender: TObject);
    procedure DataSave(Sender: TObject);
    procedure SG_ImageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    var_stday: String;   // 평가기준일
    empno    : String;   // 자기평가자 사번
    var_sscore, var_dscore: Real;
    procedure Retrieve_Data;
    procedure ShowImage;
    function  IsDataModified: Boolean;
    procedure OnlyVisible;
    procedure MakeVisible;
    function Csel_gfd(p_loc: Integer): String;
    procedure InUpMerit;
    procedure ShowSum;
  end;

const
  // SG_HiddenData 의 index
  dITEMNO_IDX   = 0; // 평가항목번호
  dITEMNAME_IDX = 1; // 평가항목명
  dIMAGENO_IDX  = 2; // 평가이미지번호
  dITEMDESC_IDX = 3; // 평가이미지내용
  dSCORE_IDX    = 4; // 평가점수
  dMODIFIED_IDX = 5; // 자료변동여부
  dISNEW_IDX    = 6; // 테이블에 없는 레코드 여부(Y,N)

  // SG_Image 의 index
  mITEMNAME_IDX = 0;
  mITEMDESC_IDX = 1; // 평가이미지내용

  WIDTH_SGIMAGE_COL1 = 120;

  // SG_Item 의 index
  iITEMNAME_IDX = 0; // 항목명
  iITEMDESC_IDX = 1; // 항목내용
  iITEMNO_IDX   = 2; // 항목번호

  dS_IDX  = 0;
  dA_IDX  = 1;
  dB_IDX  = 2;
  dC_IDX  = 3;
  dD_IDX  = 4;

var
  TeamForm: TTeamForm;
  //S, A, B, C, D 등급 점수/표시 (S = '100')
  var_ScrS, var_ScrA, var_ScrB, var_ScrC, var_ScrD : String;
  var_GrdS, var_GrdA, var_GrdB, var_GrdC, var_GrdD : String;

implementation
{$R *.DFM}
uses
  HMainForm;

{------------------------------- Main ----------------------------------}
procedure TTeamForm.FormShow(Sender: TObject);
var
  ParamVariant: String;
begin
  Application.ProcessMessages;
  var_stday := FM_Main.Lrabasdate;

  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('VALUE1'       , ftString    ,  100  );
      AddField('VALUE2'       , ftString    ,  100  );
      AddField('VALUE3'       , ftString    ,  100  );
      AddField('VALUE4'       , ftString    ,  100  );
      AddField('VALUE5'       , ftString    ,  100  );

       //S, A, B, C, D 점수읽기
      ParamVariant := 'SELECT  Value1 , Value2 , Value3 , Value4 , Value5  '+
                      '   FROM pehabas ' +
                      '  WHERE rabasdate = '''+var_stday+''' ' +
                      '    AND gubun     = ''11'' ' +
                      '    AND sgubun    = ''0006'' ';
      Close;
      Sql.Text := ParamVariant;
      Open;

      var_ScrS  := FieldByName('VALUE1').AsString;
      var_ScrA  := FieldByName('VALUE2').AsString;
      var_ScrB  := FieldByName('VALUE3').AsString;
      var_ScrC  := FieldByName('VALUE4').AsString;
      var_ScrD  := FieldByName('VALUE5').AsString;
  end;

  var_GrdS  := SB_S.Caption;
  var_GrdA  := SB_A.Caption;
  var_GrdB  := SB_B.Caption;
  var_GrdC  := SB_C.Caption;
  var_GrdD  := SB_D.Caption;

  PageControl1Change(nil);
end;

procedure TTeamForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ( FM_Main.BT_Save.Visible) and
     (IsDataModified) then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
    CanClose := False;
    System.Exit;
  end;
  CanClose := True;
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TTeamForm.Retrieve_Data;
var
  ParamVariant: String;
  i, j : Integer;
begin
  Application.ProcessMessages;

  // SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  for i := 0 to SG_HiddenData.ColCount - 1 do
    for j := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  SG_HiddenData.RowCount := SG_HiddenData.FixedRows+1;

  self.empno    := FM_Main.Ed_empno.empno;

  ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') || '';'' ||  '+
                  '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)) ,'' '')|| '';'' ||  '+
                  '         SNUM                         || '';'' ||  '+
                  '         nvl(        ITEMDESC ,'' '') || '';'' ||  '+
                  '         nvl(to_char(SCORE   ),''0'') || '';'' ||  '+
                  '         nvl(        empno    ,'' '')  from (  '+
                  '  SELECT nvl(to_char(A.ITEMNO),''0'') ITEMNO,' +
                  '        CASE  WHEN A.ITEMNO = ''99'' THEN ' +
                  '             (SELECT ITEMNAME5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                  '        ELSE ' +
                  '             (SELECT ITEMNAME FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                  '        END ITEMNAME, ' +
                  '        A.SNUM, ' +
                  '        CASE WHEN A.ITEMNO = ''99'' THEN ' +
                  '             (SELECT ITEMDESC5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                  '        ELSE ' +
                  '             (SELECT ITEMDESC FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                  '        END ITEMDESC, ' +
                  '        (SELECT EMPNO FROM PESUS WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EMPNO AND ITEMNO = A.ITEMNO AND ekind = ''직무역량'') EMPNO, ' +
                  '        (SELECT SCORE FROM PESUS WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EMPNO AND ITEMNO = A.ITEMNO AND ekind = ''직무역량'') SCORE ' +
                  ' FROM PEJNOEMP A ' +
                  ' WHERE A.RABASDATE = '''+var_stday+''' ' +
                  '   AND A.DEPTCODE  = '''+FM_Main.GsDeptcode+''' ' +
                  '   AND A.EMPNO     = '''+FM_Main.Ed_empno.empno+''' ' +
                  ' ORDER BY SNUM) ' ;

  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PTA1010B_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 2000);
    ClearParamInfo;
    SQL.Text := ParamVariant;     FM_Main.Edit1.Text := SQL.Text;
    Open;
  end;

  while not TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData.Cells[dITEMNO_IDX, SG_HiddenData.RowCount-1] <> '' then
      SG_HiddenData.RowCount := SG_HiddenData.RowCount + 1;

    SG_HiddenData.Cells[dITEMNO_IDX, SG_HiddenData.RowCount-1] :=
        Csel_gfd(1); // 평가항목번호
    SG_HiddenData.Cells[dITEMNAME_IDX, SG_HiddenData.RowCount-1] :=
        Csel_gfd(2); // 평가항목명
    SG_HiddenData.Cells[dIMAGENO_IDX, SG_HiddenData.RowCount-1] :=
        Csel_gfd(3); // 평가이미지번호
    SG_HiddenData.Cells[dITEMDESC_IDX, SG_HiddenData.RowCount-1] :=
        Csel_gfd(4); // 평가이미지내용
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.RowCount-1] :=
        Csel_gfd(5); // 평가점수

    if Trim(Csel_gfd(6)) = '' then
      SG_HiddenData.Cells[dISNEW_IDX, SG_HiddenData.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData.Cells[dISNEW_IDX, SG_HiddenData.RowCount-1] := 'N';

    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.RowCount-1] := 'N'; // 자료 변동 여부

    L_jobkind.Caption := '( 직종 : '+ Csel_gfd(7) +' )';

    TMaxDataSet_HInsa.Next;
  end;

  ShowSum;
  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    ParamVariant := ' SELECT MERIT_EAY field1, MERIT_EAN field2, ''field3'', ''field4'',''field5''  '+
                    ' FROM PEHRUMER  ' +
                    ' where rabasdate  = ''' + var_stday +''' ' +
                    '   AND empno      = ''' + FM_Main.Ed_empno.empno +''' ' ;

    ClearFieldInfo;
    AddField('field1' ,ftString, 2000);
    AddField('field2' ,ftString, 2000);
    AddField('field3' ,ftString, 2000);
    AddField('field4' ,ftString, 2000);
    AddField('field5' ,ftString, 2000);
    SQL.Text := ParamVariant;
    Open;

    OM_Merit_C1.Text := Fields[0].AsString;
    OM_Merit_C2.Text := Fields[1].AsString;
  end;
end;

function TTeamForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TTeamForm.ShowSum;
var
  i, j, k: Integer;
begin
  j := 0; k := 0;

  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    if SG_HiddenData.Cells[dSCORE_IDX, i] <> '0' then
    begin
      inc(j);
      k := k + StrToIntDef(SG_HiddenData.Cells[dSCORE_IDX, i],0);
    end
    else
  end;
  L_Total.Caption := IntToStr(SG_HiddenData.RowCount - SG_HiddenData.FixedRows);//+'개';
  L_Yes.Caption   := IntToStr(j);

  if StrToIntDef(L_Yes.Caption,0) > 0 then
    L_score.caption := Format('%3.2f',[k /StrToInt( L_Total.caption )])
  else
    L_score.caption := '0.00';

end;

procedure TTeamForm.ShowImage;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image.ColCount - 1 do
    for j := 0 to SG_Image.RowCount -1 do
      SG_Image.Cells[i, j] := '';
  SG_Image.RowCount := SG_Image.FixedRows+1;

  for i := 0 to SG_Score.ColCount - 1 do
    for j := 0 to SG_Score.RowCount -1 do
      SG_Score.Cells[i, j] := '';
  SG_Score.RowCount := SG_Score.FixedRows+1;

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData.Tag := -1;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
//    if SG_HiddenData.Cells[dITEMNO_IDX, i] = asItemNO then
    begin
      // SG_HiddenData.Tag 에 현재 평가항목의 시작 index 저장
      if SG_HiddenData.Tag = -1 then
        SG_HiddenData.Tag := i;

      if SG_Image.Cells[SG_Image.FixedCols, SG_Image.RowCount-1] <> '' then
      begin
        SG_Image.RowCount := SG_Image.RowCount + 1;
        SG_Score.RowCount := SG_Score.RowCount + 1;
      end;

//유효성
// 이미지내용 넣기..
//      SG_Image.Cells[mITEMDESC_IDX, SG_Image.RowCount-1] := IntToStr(i + 1) + '. ' + SG_HiddenData.Cells[dITEMDESC_IDX, i];
        SG_Image.Cells[mITEMDESC_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i];


      SG_Image.Cells[mITEMNAME_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i];

      SG_Score.Cells[dS_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dA_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dB_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dC_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dD_IDX , SG_Score.RowCount-1] := '';

      //버튼상태반영
           if SG_HiddenData.Cells[dSCORE_IDX, i] = var_ScrS  then SG_Score.Cells[dS_IDX , SG_Score.RowCount-1] := var_GrdS
      else if SG_HiddenData.Cells[dSCORE_IDX, i] = var_ScrA  then SG_Score.Cells[dA_IDX , SG_Score.RowCount-1] := var_GrdA
      else if SG_HiddenData.Cells[dSCORE_IDX, i] = var_ScrB  then SG_Score.Cells[dB_IDX,  SG_Score.RowCount-1] := var_GrdB
      else if SG_HiddenData.Cells[dSCORE_IDX, i] = var_ScrC  then SG_Score.Cells[dC_IDX , SG_Score.RowCount-1] := var_GrdC
      else if SG_HiddenData.Cells[dSCORE_IDX, i] = var_ScrD  then SG_Score.Cells[dD_IDX,  SG_Score.RowCount-1] := var_GrdD;

    end;
  end;

  // SG_Image에 포크스를 준다
  SG_Image.SetFocus;
end;

procedure TTeamForm.OnlyVisible;
begin
  P_Info.Visible     := False;
  FM_Main.BT_Save.Visible    := False;
  BB_Cancel.Visible  := False;
end;

procedure TTeamForm.MakeVisible;
begin
  P_Info.Visible     := True;
  FM_Main.BT_Save.Visible    := True;
  BB_Cancel.Visible  := True;
end;

function TTeamForm.IsDataModified: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
end;

{------------------------------버튼클릭---------------------------------}
procedure TTeamForm.SB_YesNoClick(Sender: TObject);
var
  lsScore: String;
begin
  // SG_HiddenData.Tag 에 현재 평가항목의 시작 index가 저장되어 있다
  if SG_HiddenData.Tag = -1 then
    Exit;

  if not  FM_Main.BT_Save.Visible then
  begin
    MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  //평가점수 계산
       if TSpeedButton(Sender).Caption = var_GrdS  then  lsScore :=  var_ScrS
  else if TSpeedButton(Sender).Caption = var_GrdA  then  lsScore :=  var_ScrA
  else if TSpeedButton(Sender).Caption = var_GrdB  then  lsScore :=  var_ScrB
  else if TSpeedButton(Sender).Caption = var_GrdC  then  lsScore :=  var_ScrC
  else if TSpeedButton(Sender).Caption = var_GrdD  then  lsScore :=  var_ScrD
  else lsScore := '0';

  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := lsScore;
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';

    SG_Score.Cells[dS_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dA_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dB_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dC_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dD_IDX , SG_Image.Row] := '';

         if SB_S.Down  then SG_Score.Cells[dS_IDX , SG_Image.Row] := var_GrdS
    else if SB_A.Down  then SG_Score.Cells[dA_IDX , SG_Image.Row] := var_GrdA
    else if SB_B.Down  then SG_Score.Cells[dB_IDX,  SG_Image.Row] := var_GrdB
    else if SB_C.Down  then SG_Score.Cells[dC_IDX , SG_Image.Row] := var_GrdC
    else    SG_Score.Cells[dD_IDX,  SG_Image.Row] := var_GrdD ;

  end else
  begin
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := '0';
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';

    SG_Score.Cells[dS_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dA_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dB_IDX,  SG_Image.Row] := '';
    SG_Score.Cells[dC_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dD_IDX,  SG_Image.Row] := '';
  end;
end;

procedure TTeamForm.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data; // 선택한 피평가자의 자료를 읽는다
  ShowImage;
end;

procedure TTeamForm.DataSave(Sender: TObject);
var
  i, j: Integer;
  ParamVariant: String;
begin
  Application.ProcessMessages;

  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
      Continue;

    if SG_HiddenData.Cells[dSCORE_IDX, i] = '' then // 평가점수가 null
    begin
      ParamVariant := 'DELETE FROM pesus ' + // 능력태도자기평가
                      'WHERE rabasdate = '''+var_stday+''' ' +
                      '  AND empno     = '''+FM_Main.Ed_empno.empno+''' ' + // 피평가자
                      '  AND ekind     = ''직무역량''   ' +
                      '  AND itemno    = '+SG_HiddenData.Cells[dITEMNO_IDX,  i]+' ' +
                      '  AND imageno   = '+SG_HiddenData.Cells[dIMAGENO_IDX, i]+' ';

      FM_Main.Cupd_SQL := ParamVariant;
      FM_Main.Cupd_Exec;

      SG_HiddenData.Cells[dISNEW_IDX, i] := 'Y'; // 신규로 설정
    end
    else if SG_HiddenData.Cells[dISNEW_IDX, i] = 'Y' then // 신규이면...
    begin
      ParamVariant := 'INSERT INTO pesus ' + // 능력태도상향평가
                      '    (rabasdate, empno,  ekind, ' +
                      '     itemno, imageno, score) ' +
                      'VALUES('''+var_stday+''', ' +
                      '       '''+FM_Main.Ed_empno.empno+''', '+ // 자기평가자(접속자사번)
                      '       ''직무역량'', ' +
                      '       '+SG_HiddenData.Cells[dITEMNO_IDX,  i]+', '+
                      '       '+SG_HiddenData.Cells[dIMAGENO_IDX, i]+', '+
                      '       '+SG_HiddenData.Cells[dSCORE_IDX, i]+') ';

      FM_Main.Cupd_SQL := ParamVariant;
      FM_Main.Cupd_Exec;

      SG_HiddenData.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
    end
    else
    begin
      ParamVariant := 'UPDATE pesus ' + // 능력태도자기평가
                      '   SET score     = '+SG_HiddenData.Cells[dSCORE_IDX, i]+' ' +
                      'WHERE rabasdate = '''+var_stday+''' ' +
                      '  AND empno     = '''+FM_Main.Ed_empno.empno+''' ' + // 평가자
                      '  AND ekind     = ''직무역량''   ' +
                      '  AND itemno    = '+SG_HiddenData.Cells[dITEMNO_IDX,  i]+' ' +
                      '  AND imageno   = '+SG_HiddenData.Cells[dIMAGENO_IDX, i]+' ';

      FM_Main.Cupd_SQL := ParamVariant;
      FM_Main.Cupd_Exec;

      SG_HiddenData.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
    end;
  end;

  InUpMerit;

  if Sender =  BB_Save then // 최종확인
  begin
    // 저장했으므로 변동여부는 all 'N'
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
      SG_HiddenData.Cells[dMODIFIED_IDX, i] := 'N';
    MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0)
  end;
end;

procedure TTeamForm.InUpMerit;
var SqlText, JobMode : String;
begin
//  평가 장점/단점 서술형 입력 테이블 생성할것.
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT empno,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEHRUMER  '+
                ' where rabasdate  = ''' + var_stday +''' ' +
                '   AND empno      = ''' + FM_Main.Ed_empno.empno  +''' ' ;

    ClearFieldInfo;
    AddField('empno'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  ( TDS1.RecordCount < 1 )  then JobMode :='I'
    else                               JobMode :='U';
  end;

  if JobMode = 'I' then
  begin
    SQLText:= 'INSERT INTO PEHRUMER                  ' +
              '   (RABASDATE, EMPNO,     MERIT_EAY,  ' +
              '    MERIT_EAN, WRITEEMP,  WRITETIME)  ' +
              '  VALUES                              ' +
              '   ('''+ var_stday        +''',       ' +
              '    '''+ FM_Main.Ed_empno.empno +''', ' +
              '    '''+ OM_Merit_C1.Text +''',       ' +
              '    '''+ OM_Merit_C2.Text +''',       ' +
              '    '''+ FM_Main.GSempno  +''',       ' +
              '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
              '   ) ';
  end
  Else
  Begin
    SQLText := Format(
              'UPDATE PEHRUMER SET ' +
              '       MERIT_EAY = '''+OM_Merit_C1.Text+''', '+
              '       MERIT_EAN = '''+OM_Merit_C2.Text+''', '+
              '       WRITEEMP  = '''+FM_Main.GSempno +''', '+
              '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
              ' WHERE RABASDATE = ''%s'' '+
              '  AND  EMPNO     = ''%s'' ' ,
              [var_stday, FM_Main.Ed_empno.empno]);
  End;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End;
end;

{------------------------------ Event ---------------------------------}
procedure TTeamForm.SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin

  if gdSelected in State then
  begin
    SG_Image.Canvas.Brush.Color := SG_Score.Font.Color;
    SG_Image.Canvas.Font.Color  := clBlack;
  end;

  SG_Image.Canvas.FillRect(Rect);

  SG_Image.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL1;

  if SG_Image.VisibleRowCount < SG_Image.RowCount then
    SG_Image.ColWidths[mITEMDESC_IDX] := SG_Image.Width -  SG_Image.ColWidths[mITEMNAME_IDX] - 16
  else
    SG_Image.ColWidths[mITEMDESC_IDX] := SG_Image.Width -  SG_Image.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image.RowCount > (SG_Image.VisibleRowCount+SG_Image.FixedRows) then
    Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image.Cells[Col, Row];
  DrawText(SG_Image.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then
    System.Exit;
  if not SG_Image.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image.Row < SG_Image.TopRow then // 현재 row 가 화면위에 있다
    SG_Image.Row := SG_Image.TopRow
  else if SG_Image.Row > (SG_Image.TopRow + SG_Image.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image.Row := SG_Image.TopRow + SG_Image.VisibleRowCount-1;

  SG_Score.TopRow := SG_Image.TopRow;
  SG_Score.Row    := SG_Image.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton.Top := (SG_Image.Row - SG_Image.TopRow) *
                         (SG_Image.DefaultRowHeight + SG_Image.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S.Down   := False;
  SB_A.Down   := False;
  SB_B.Down   := False;
  SB_C.Down   := False;
  SB_D.Down   := False;


  //버튼상태반영
       if SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrS  then  SB_S.Down  := True
  else if SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrA  then  SB_A.Down  := True
  else if SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrB  then  SB_B.Down  := True
  else if SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrC  then  SB_C.Down  := True
  else if SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrD  then  SB_D.Down  := True;

   P_ControlButton.Visible := True;
end;

procedure TTeamForm.SG_ImageExit(Sender: TObject);
begin
  P_ControlButton.Visible := False;
end;

procedure TTeamForm.SG_ScoreDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  liLeft   : Integer;
  liTop    : Integer;
  lsBuffer : String;
  i        : integer;
  bColor   : Boolean;
begin
  bColor := False;
  for i := 0 to SG_Score.ColCount -1 do
    if SG_Score.Cells[i, Row] <> '' then
    begin
      bColor := True;
      break;
    end;
  if bColor then
    SG_Score.Canvas.Brush.Color := $00FFF9EC //SG_Score.Font.Color;
  else
    SG_Score.Canvas.Brush.Color := SG_Image.Color; ///$00F0FFFF;

  if CB_ShowClass.Checked then // 등급을 보이게...
    SG_Score.Canvas.Font.Color := SG_Image.Font.Color
  else
    SG_Score.Canvas.Font.Color := SG_Score.Font.Color;

  SG_Score.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score.Cells[Col, Row];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TTeamForm.SG_ScoreEnter(Sender: TObject);
begin
  SG_Image.SetFocus;
end;

procedure TTeamForm.CB_ShowClassClick(Sender: TObject);
begin
  SG_Score.Refresh;
  SG_Image.SetFocus;
end;

procedure TTeamForm.SG_ImageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image.Row = 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    ShowImage;
    SG_Image.Row := SG_Image.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image.Row = SG_Image.RowCount-1) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    ShowImage;
    SG_Image.Row := 0;
    Key := VK_ESCAPE;
  end;

end;

procedure TTeamForm.PageControl1Change(Sender: TObject);
begin
  if ( FM_Main.BT_Save.Visible) and (IsDataModified) then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.',
               '작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  L_jobkind.Visible  := True;
  Lb1.Visible := True;

  BB_CancelClick(Sender);
end;

procedure TTeamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := cafree;
end;

end.
procedure TTeamForm.SG_HiddenDataClick(Sender: TObject);
begin

end;


