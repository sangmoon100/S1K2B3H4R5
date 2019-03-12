unit UValueForm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo;

type
  TValueForm2 = class(TForm)
    BB_Save  : TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    CB_ShowClass1: TCheckBox;
    SG_Image1: TStringGrid;
    Panel7: TPanel;
    SG_Score1: TStringGrid;
    P_ControlButton1: TPanel;
    SB_S1: TSpeedButton;
    SB_A1: TSpeedButton;
    SB_B1: TSpeedButton;
    SB_C1: TSpeedButton;
    SB_D1: TSpeedButton;
    P_Info: TPeJeonLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    SG_HiddenData1: TStringGrid;
    L_Score1: TPanel;
    Panel1: TPanel;
    TDS1: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    SG_ItemImage1: TStringGrid;
    Label3: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    L_Total1: TLabel;
    L_Yes1: TLabel;
    procedure BB_CancelClick(Sender: TObject);
    procedure SG_Image1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Image1Exit(Sender: TObject);
    procedure SG_Score1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score1Enter(Sender: TObject);
    procedure CB_ShowClass1Click(Sender: TObject);
    procedure DataSave(Sender: TObject);
    procedure SG_Image1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_S1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SG_ItemImage1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    var_paycl   : String; //직급별 평가표번호를 불어오기위해 추가.  dsa2000 2008.09.
    var_stday   : String;   // 평가기준일
    var_Ekind   : String;   // 능력, 태도
    var_itemno  : Integer;   // 항목번호
    empno    : String;   // 자기평가자 사번
    Pevcno   : String;   // 평가표 번호
    Pjobkind : String;
    var_sscore, var_dscore: Real;
    procedure Retrieve_Data1;
    procedure ShowImage1;
    procedure ShowSum1;
    function  IsDataModified1: Boolean;
    procedure OnlyVisible;
    procedure MakeVisible;
    function Csel_gfd(p_loc: Integer): String;
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
  mITEMDESC_IDX = 0; // 평가항목내용

  WIDTH_SGIMAGE_COL1 = 90;

  // SG_ItemImage 의 index
  mIMAGENAME_IDX = 0; // 항목명
  mIMAGEDESC_IDX = 1; // 항목내용
  mIMAGEBIGO_IDX = 2; // 항목비고

  dS_IDX  = 0;
  dA_IDX  = 1;
  dB_IDX  = 2;
  dC_IDX  = 3;
  dD_IDX  = 4;

var
  ValueForm2: TValueForm2;
  //S, A, B, C, D 등급 점수/표시 (S = '100')
  var_ScrS, var_ScrA, var_ScrB, var_ScrC, var_ScrD : String;
  var_GrdS, var_GrdA, var_GrdB, var_GrdC, var_GrdD : String;

implementation
{$R *.DFM}
uses     HMainForm2;

{------------------------------- Main ----------------------------------}
procedure TValueForm2.FormShow(Sender: TObject);
var
  ParamVariant: String;
begin
  Application.ProcessMessages;

  Pevcno      := '1';
  //self.Pjobkind    := '11170';         //직종
  var_Ekind := 'Values';
  var_stday := FM_Main2.Lrabasdate;

  with TDS1 do
  begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('VALUE1'       , ftString    ,  100  );
       AddField('VALUE2'       , ftString    ,  100  );
       AddField('VALUE3'       , ftString    ,  100  );
       AddField('VALUE4'       , ftString    ,  100  );
       AddField('VALUE5'       , ftString    ,  100  );

       ParamVariant := 'SELECT paycl, ''F2'', ''F3'', ''F4'', ''F5'' '+    //dsa2000 2008.10.
                       '  FROM pehamas                               '+
                       ' WHERE rabasdate = '''+var_stday+'''         '+
                       '   AND empno     = '''+FM_Main2.Ed_empno.empno+''' ';
       Close;
       Sql.Text := ParamVariant;
       Open;
       var_paycl   := Fields[0].AsString;


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

  var_GrdS  := SB_S1.Caption;
  var_GrdA  := SB_A1.Caption;
  var_GrdB  := SB_B1.Caption;
  var_GrdC  := SB_C1.Caption;
  var_GrdD  := SB_D1.Caption;

  PageControl1.ActivePage := TabSheet1;
  PageControl1Change(nil);
end;

procedure TValueForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (FM_Main2.BT_Save.Visible) and (IsDataModified1) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TValueForm2.Retrieve_Data1;
var
  ParamVariant: String;
d  i, j : Integer;
begin
  Application.ProcessMessages;

  ParamVariant := 'SELECT                                '+
                  '       nvl(abconyn   ,'' '') ,        '+
                  '       nvl(beconyn   ,'' '') ,        '+
                  '       nvl(duconyn   ,'' '') ,        '+
                  '       nvl(valconyn   ,'' '') ,       '+
                  '       ''FIELD5'' FIELD5              '+
                  '  FROM pesms                          '+ // 능력태도자기종합
                  ' WHERE rabasdate = '''+var_stday+'''  '+
                  '   AND empno     = '''+FM_Main2.Ed_empno.empno+''' '; // 평가자(접속자사번)

  with TDS1 do
  begin
       Close;
       ServiceName := 'HINSA_select';
       Sql.Text := ParamVariant;

       ClearFieldInfo;
       AddField('ABCONYN'      , ftString    ,  100  );
       AddField('BECONYN'      , ftString    ,  100  );
       AddField('DUCONYN'      , ftString    ,  100  );
       AddField('VALCONYN'     , ftString    ,  100  );
       AddField('FIELD5'       , ftString    ,  100  );
       Open;
  end;

//  if    (FM_Main2.Lrvalconyn = 'Y') and (var_Ekind = 'Values')   and (TDS1.FieldByName('VALCONYN').AsString = 'Y') then OnlyVisible
//  else                                                                                                                  MakeVisible;

  self.empno    := FM_Main2.Ed_empno.empno;
  self.Pevcno   := FM_Main2.Levcno;
  self.Pjobkind := FM_Main2.Ljobkind;

  // 항목번호, 이미지번호,이미지내용, 평가점수
  ParamVariant := 'SELECT                                               '+
                  '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
                  '       nvl(        a.imagename   ,'' '') || '';'' || '+
                  '       nvl(        a.imageno,     ''0'') || '';'' || '+
                  '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
                  '       nvl(        a.imagebigo   ,'' '')             '+
                  '  FROM pehacd a                                      '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
                  ' WHERE a.rabasdate = '''+var_stday+'''               '+
                  '   AND a.evcno     = '+Pevcno+'                      '+ // 평가표번호
                  '   AND a.ekind     = ''Values''                      '+ // 평가구분
                  '   AND a.paycl     = '''+var_paycl  +'''             '+
                  '   ORDER BY a.itemno, a.imageno                      ';

  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := ParamVariant;
       Open;
  end;

  i:= 0;
  while not TMaxDataSet_HInsa.EOF do
  begin
       SG_ItemImage1.Cells[0,   i] := Csel_gfd(2); // 평가이미지명
       SG_ItemImage1.Cells[1,   i] := Csel_gfd(4); // 평가이미지내용
       //SG_ItemImage1.Cells[2,   i] := Csel_gfd(5); // 평가이미지비고

       i := i + 1;
       TMaxDataSet_HInsa.Next;
  end;

  // SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  for i := 0 to SG_HiddenData1.ColCount - 1 do
       for j := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
            SG_HiddenData1.Cells[i, j] := '';
  SG_HiddenData1.RowCount := SG_HiddenData1.FixedRows+1;

  // 항목번호, 이미지번호,이미지내용, 평가점수
  ParamVariant := 'SELECT                                               '+
                  '       nvl(to_char(a.itemno      ),''0'') || '';'' ||'+
                  '       nvl(        a.itemname     ,'' '') || '';'' ||'+
                  '       nvl(        ''0'',          ''0'') || '';'' ||'+
                  '       nvl(        a.itemdesc     ,'' '') || '';'' ||'+
                  '       nvl(to_char(b.score       ),''0'') || '';'' ||'+
                  '       nvl(        b.empno        ,'' '')            '+
                  '  FROM pehac a, pesds b                              '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
                  ' WHERE a.rabasdate = '''+var_stday+'''               '+
                  '   AND a.evcno     = '+Pevcno+'                      '+ // 평가표번호
                  '   AND a.ekind     = ''Values''                      '+ // 평가구분
                  '   AND a.rabasdate = b.rabasdate(+)                  '+
                  '   AND a.ekind     = b.ekind(+)                      '+
                  '   AND b.empno(+)  = '''+FM_Main2.Ed_empno.empno+'''  '+ // 피평가자사번
                  '   AND a.itemno    = b.itemno(+)                     '+
                  '   AND a.paycl     = '''+var_paycl  +'''             '+
                  '   ORDER BY a.itemno                                 ';


  with TMaxDataSet_HInsa do
  begin
       Close;
       ServiceName := 'PTA1010B_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 2000);
       ClearParamInfo;
       SQL.Text := ParamVariant;
       Open;
  end;

  while not TMaxDataSet_HInsa.EOF do
  begin
       if SG_HiddenData1.Cells[dITEMNO_IDX, SG_HiddenData1.RowCount-1] <> '' then
         SG_HiddenData1.RowCount := SG_HiddenData1.RowCount + 1;

       SG_HiddenData1.Cells[dITEMNO_IDX,   SG_HiddenData1.RowCount-1] :=     Csel_gfd(1); // 평가항목번호
       SG_HiddenData1.Cells[dITEMNAME_IDX, SG_HiddenData1.RowCount-1] :=     Csel_gfd(2); // 평가항목명
       SG_HiddenData1.Cells[dIMAGENO_IDX,  SG_HiddenData1.RowCount-1] :=     Csel_gfd(3); // 평가이미지번호
       SG_HiddenData1.Cells[dITEMDESC_IDX, SG_HiddenData1.RowCount-1] :=     Csel_gfd(4); // 평가이미지내용
       SG_HiddenData1.Cells[dSCORE_IDX,    SG_HiddenData1.RowCount-1] :=     Csel_gfd(5); // 평가점수

       if Trim(Csel_gfd(6)) = '' then
            SG_HiddenData1.Cells[dISNEW_IDX, SG_HiddenData1.RowCount-1] := 'Y' // 테이블에 없는 레코드
       else
            SG_HiddenData1.Cells[dISNEW_IDX, SG_HiddenData1.RowCount-1] := 'N';

       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.RowCount-1] := 'N'; // 자료 변동 여부

       TMaxDataSet_HInsa.Next;
  end;

  // 점수등록현황
  ShowSum1;
end;

function TValueForm2.Csel_gfd(p_loc: Integer): String;
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

procedure TValueForm2.ShowSum1;
var
  i, j, k: Integer;
begin
  j := 0; k := 0;

  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
       if SG_HiddenData1.Cells[dSCORE_IDX, i] <> '0' then
       begin
            inc(j);
            k := k + StrToIntDef(SG_HiddenData1.Cells[dSCORE_IDX, i],0);
       end;
  end;
  L_Total1.Caption := IntToStr(SG_HiddenData1.RowCount - SG_HiddenData1.FixedRows);//+'개';
  L_Yes1.Caption   := IntToStr(j);

  if StrToIntDef(L_Yes1.Caption,0) > 0 then
       L_score1.caption := Format('%3.2f',[k /StrToInt( L_Total1.caption )])
  else
       L_score1.caption := '0.00';
end;

procedure TValueForm2.ShowImage1;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image1.ColCount - 1 do
       for j := 0 to SG_Image1.RowCount -1 do
            SG_Image1.Cells[i, j] := '';

  SG_Image1.RowCount := SG_Image1.FixedRows+1;

  for i := 0 to SG_Score1.ColCount - 1 do
       for j := 0 to SG_Score1.RowCount -1 do
            SG_Score1.Cells[i, j] := '';

  SG_Score1.RowCount := SG_Score1.FixedRows+1;

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData1.Tag := -1;
  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
  begin
   //    if SG_HiddenData.Cells[dITEMNO_IDX, i] = asItemNO then
       begin
            // SG_HiddenData.Tag 에 현재 평가항목의 시작 index 저장
            if SG_HiddenData1.Tag = -1 then
                 SG_HiddenData1.Tag := i;

            if SG_Image1.Cells[SG_Image1.FixedCols, SG_Image1.RowCount-1] <> '' then
            begin
                 SG_Image1.RowCount := SG_Image1.RowCount + 1;
                 SG_Score1.RowCount := SG_Score1.RowCount + 1;
            end;

   //유효성
   // 이미지내용 넣기..
   //       SG_Image1.Cells[mITEMDESC_IDX, SG_Image1.RowCount-1] := IntToStr(i + 1) + '. ' + SG_HiddenData1.Cells[dITEMDESC_IDX, i];
            SG_Image1.Cells[mITEMDESC_IDX, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[dITEMDESC_IDX, i];

   //         SG_Image1.Cells[mITEMNAME_IDX, SG_Image1.RowCount-1] := SG_HiddenData1.Cells[dITEMNAME_IDX, i];

            SG_Score1.Cells[dS_IDX , SG_Score1.RowCount-1] := '';
            SG_Score1.Cells[dA_IDX , SG_Score1.RowCount-1] := '';
            SG_Score1.Cells[dB_IDX , SG_Score1.RowCount-1] := '';
            SG_Score1.Cells[dC_IDX , SG_Score1.RowCount-1] := '';
            SG_Score1.Cells[dD_IDX , SG_Score1.RowCount-1] := '';

            //버튼상태반영
                 if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrS  then SG_Score1.Cells[dS_IDX , SG_Score1.RowCount-1] := var_GrdS
            else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrA  then SG_Score1.Cells[dA_IDX , SG_Score1.RowCount-1] := var_GrdA
            else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrB  then SG_Score1.Cells[dB_IDX,  SG_Score1.RowCount-1] := var_GrdB
            else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrC  then SG_Score1.Cells[dC_IDX , SG_Score1.RowCount-1] := var_GrdC
            else if SG_HiddenData1.Cells[dSCORE_IDX, i] = var_ScrD  then SG_Score1.Cells[dD_IDX,  SG_Score1.RowCount-1] := var_GrdD;

       end;
  end;

  if  PageControl1.ActivePage = TabSheet1 then
       SG_Image1.SetFocus;
end;

procedure TValueForm2.OnlyVisible;
begin
  P_Info.Visible             := False;
  FM_Main2.BT_Save.Visible   := False;
  BB_Cancel.Visible          := False;
end;

procedure TValueForm2.MakeVisible;
begin
  P_Info.Visible             := True;
  FM_Main2.BT_Save.Visible   := True;
  BB_Cancel.Visible          := True;
end;

function TValueForm2.IsDataModified1: Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount -1 do
       if SG_HiddenData1.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
       begin
            Result := True;
            Break;
       end;
end;

{------------------------------버튼클릭---------------------------------}
procedure TValueForm2.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data1;
  if   PageControl1.ActivePage = TabSheet1 then ShowImage1;
end;

procedure TValueForm2.DataSave(Sender: TObject);
var
  i, j: Integer;
  ParamVariant: String;
begin
  if var_Ekind = '' then
    System.Exit;

  Application.ProcessMessages;

  if Sender =  BB_Save then
  begin
       if not (IsDataModified1) then
       begin
            MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.',
                       '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
       if L_total1.Caption <> L_Yes1.Caption then
       begin
            if IDYES <> MessageBox(handle,pChar('평가하지 않은 항목이 있습니다.'+#13+#13+
                                    '저장하시겠습니까?'),'알림',MB_YESNO + MB_DEFBUTTON2) then
               System.Exit;
       end;
  end;
  if  PageControl1.ActivePage = TabSheet1 then
  begin
       for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
       begin
            if SG_HiddenData1.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
                 Continue;

            if SG_HiddenData1.Cells[dSCORE_IDX, i] = '' then // 평가점수가 null
            begin
                 ParamVariant := 'DELETE FROM pesds ' + // 능력태도자기평가
                                 'WHERE rabasdate = '''+var_stday+''' ' +
                                 '  AND empno     = '''+FM_Main2.Ed_empno.empno+''' ' + // 피평가자
                                 '  AND ekind     = '''+var_Ekind+'''   ' +
                                 '  AND itemno    = '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+' ' +
                                 '  AND imageno   = '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+' ';

                 FM_Main2.Cupd_SQL := ParamVariant;
                 FM_Main2.Cupd_Exec;

                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'Y'; // 신규로 설정
            end
            else if SG_HiddenData1.Cells[dISNEW_IDX, i] = 'Y' then // 신규이면...
            begin
                 ParamVariant := 'INSERT INTO pesds ' + // 능력태도상향평가
                                 '    (rabasdate, empno,  ekind, ' +
                                 '     itemno, imageno, score) ' +
                                 'VALUES('''+var_stday+''', '+
                                 '       '''+FM_Main2.Ed_empno.empno+''', '+ // 자기평가자(접속자사번)
                                 '       '''+var_Ekind+''', ' +
                                 '       '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+', '+
                                 '       '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+', '+
                                 '       '+SG_HiddenData1.Cells[dSCORE_IDX,   i]+') ';

                 FM_Main2.Cupd_SQL := ParamVariant;
                 FM_Main2.Cupd_Exec;

                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end
            else
            begin
                 ParamVariant := 'UPDATE pesds ' + // 능력태도자기평가
                                 '   SET score     = '+SG_HiddenData1.Cells[dSCORE_IDX, i]+' ' +
                                 'WHERE rabasdate = '''+var_stday+''' ' +
                                 '  AND empno     = '''+FM_Main2.Ed_empno.empno+''' ' + // 평가자
                                 '  AND ekind     = '''+var_Ekind+'''   ' +
                                 '  AND itemno    = '+SG_HiddenData1.Cells[dITEMNO_IDX,  i]+' ' +
                                 '  AND imageno   = '+SG_HiddenData1.Cells[dIMAGENO_IDX, i]+' ';

                 FM_Main2.Cupd_SQL := ParamVariant;
                 FM_Main2.Cupd_Exec;

                 SG_HiddenData1.Cells[dISNEW_IDX, i] := 'N'; // 신규 아님
            end;
       end;
  end;

  if Sender =  BB_Save then // 최종확인
  begin
       // 저장했으므로 변동여부는 all 'N'
       if  PageControl1.ActivePage = TabSheet1 then
       begin
            for i := SG_HiddenData1.FixedRows to SG_HiddenData1.RowCount-1 do
                 SG_HiddenData1.Cells[dMODIFIED_IDX, i] := 'N';
            MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0)
       end;
  end;
end;

{------------------------------ Event ---------------------------------}
procedure TValueForm2.SG_Image1DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin

  if gdSelected in State then
  begin
       SG_Image1.Canvas.Brush.Color := SG_Score1.Font.Color;
       SG_Image1.Canvas.Font.Color  := clBlack;
  end;

  SG_Image1.Canvas.FillRect(Rect);

  SG_Image1.ColWidths[mITEMDESC_IDX] := WIDTH_SGIMAGE_COL1;

  Rect.Top   := Rect.Top   + 44;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image1.RowCount > (SG_Image1.VisibleRowCount+SG_Image1.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image1.Cells[Col, Row];
  DrawText(SG_Image1.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_CENTER or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData1.Tag = -1 then
       System.Exit;
  if not SG_Image1.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
       System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image1.Row < SG_Image1.TopRow then // 현재 row 가 화면위에 있다
       SG_Image1.Row := SG_Image1.TopRow
  else if SG_Image1.Row > (SG_Image1.TopRow + SG_Image1.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_Image1.Row := SG_Image1.TopRow + SG_Image1.VisibleRowCount-1;

  SG_Score1.TopRow := SG_Image1.TopRow;
  SG_Score1.Row    := SG_Image1.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton1.Top := (SG_Image1.Row - SG_Image1.TopRow) *
                          (SG_Image1.DefaultRowHeight + SG_Image1.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S1.Down   := False;
  SB_A1.Down   := False;
  SB_B1.Down   := False;
  SB_C1.Down   := False;
  SB_D1.Down   := False;


  //버튼상태반영
       if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrS  then  SB_S1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrA  then  SB_A1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrB  then  SB_B1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrC  then  SB_C1.Down  := True
  else if SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag + SG_Image1.Row] = var_ScrD  then  SB_D1.Down  := True;

   P_ControlButton1.Visible := True;
end;

procedure TValueForm2.SG_Image1Exit(Sender: TObject);
begin
  P_ControlButton1.Visible := False;
end;

procedure TValueForm2.SG_Score1DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  liLeft   : Integer;
  liTop    : Integer;
  lsBuffer : String;
  i        : integer;
  bColor   : Boolean;
begin
  bColor := False;
  for i := 0 to SG_Score1.ColCount -1 do
       if SG_Score1.Cells[i, Row] <> '' then
       begin
            bColor := True;
            break;
       end;
  if bColor then
       SG_Score1.Canvas.Brush.Color := $00FFF9EC //SG_Score.Font.Color;
  else
       SG_Score1.Canvas.Brush.Color := SG_Image1.Color; ///$00F0FFFF;

  if CB_ShowClass1.Checked then // 등급을 보이게...
       SG_Score1.Canvas.Font.Color := SG_Image1.Font.Color
  else
       SG_Score1.Canvas.Font.Color := SG_Score1.Font.Color;

  SG_Score1.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score1.Cells[Col, Row];
  liLeft   := (((Rect.Right - Rect.Left)
              - SG_Score1.Canvas.TextWidth(lsBuffer))  div 2) + Rect.Left;
  liTop    := (((Rect.Bottom - Rect.Top)
              - SG_Score1.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score1.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TValueForm2.SG_Score1Enter(Sender: TObject);
begin
  SG_Image1.SetFocus;
end;

procedure TValueForm2.CB_ShowClass1Click(Sender: TObject);
begin
  SG_Score1.Refresh;
  SG_Image1.SetFocus;
end;

procedure TValueForm2.SG_Image1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image1.Row = 0) then
  begin
       // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
       ShowImage1;
       SG_Image1.Row := SG_Image1.RowCount-1;
       Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image1.Row = SG_Image1.RowCount-1) then
  begin
       // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
       ShowImage1;
       SG_Image1.Row := 0;
       Key := VK_ESCAPE;
  end;

end;

procedure TValueForm2.PageControl1Change(Sender: TObject);
begin
  if var_Ekind <> '' then
  begin
       if (FM_Main2.BT_Save.Visible) and (IsDataModified1) then
       begin
            MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.',
                       '작업순서오류',MB_ICONWARNING);
            System.Exit;
       end;
  end;
  
  if PageControl1.ActivePage = TabSheet1 then
  begin
       var_Ekind  := 'Values';
       var_Itemno :=  TabSheet1.Tag;
       {FM_Main2.BT_Save.Caption := 'Values1 저장';
        if (FM_Main2.Lrvalconyn = 'Y') then        //업적평가를 완료하면 저장버튼 비활성화
         begin
           FM_Main2.BT_Save.Enabled    := false;
           FM_Main2.Bt_Confirm.Enabled := false;
         end; }
  end;

  BB_CancelClick(Sender);

end;

procedure TValueForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    Action := cafree;
end;

procedure TValueForm2.SB_S1Click(Sender: TObject);
var
  lsScore: String;
begin
  // SG_HiddenData1.Tag 에 현재 평가항목의 시작 index가 저장되어 있다
  if SG_HiddenData1.Tag = -1 then
       Exit;

  if var_Ekind = '' then
       System.Exit;

  if not  FM_Main2.BT_Save.Visible then
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
       SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := lsScore;
       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';

       SG_Score1.Cells[dS_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dA_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dB_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dC_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dD_IDX , SG_Image1.Row] := '';

            if SB_S1.Down  then SG_Score1.Cells[dS_IDX , SG_Image1.Row] := var_GrdS
       else if SB_A1.Down  then SG_Score1.Cells[dA_IDX , SG_Image1.Row] := var_GrdA
       else if SB_B1.Down  then SG_Score1.Cells[dB_IDX,  SG_Image1.Row] := var_GrdB
       else if SB_C1.Down  then SG_Score1.Cells[dC_IDX , SG_Image1.Row] := var_GrdC
       else    SG_Score1.Cells[dD_IDX,  SG_Image1.Row] := var_GrdD ;

  end
  else
  begin
       SG_HiddenData1.Cells[dSCORE_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := '0';
       SG_HiddenData1.Cells[dMODIFIED_IDX, SG_HiddenData1.Tag+SG_Image1.Row] := 'Y';

       SG_Score1.Cells[dS_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dA_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dB_IDX,  SG_Image1.Row] := '';
       SG_Score1.Cells[dC_IDX , SG_Image1.Row] := '';
       SG_Score1.Cells[dD_IDX,  SG_Image1.Row] := '';
  end;
  // 점수등록현황
  ShowSum1;
end;

procedure TValueForm2.FormCreate(Sender: TObject);
begin
  FM_Main2.V_MainForm2_close := 'Y'
end;

procedure TValueForm2.SG_ItemImage1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_ItemImage1.Canvas.Brush.Color := clWhite;
       SG_ItemImage1.Canvas.Font.Color  := clBlack;
  end;

  SG_ItemImage1.Canvas.FillRect(Rect);

  SG_ItemImage1.ColWidths[mIMAGENAME_IDX] := WIDTH_SGIMAGE_COL1;

  if SG_ItemImage1.VisibleRowCount < SG_Image1.RowCount then
       SG_ItemImage1.ColWidths[mIMAGEDESC_IDX] := SG_ItemImage1.Width -  SG_ItemImage1.ColWidths[mIMAGENAME_IDX] - 16
  else
       SG_ItemImage1.ColWidths[mIMAGEDESC_IDX] := SG_ItemImage1.Width -  SG_ItemImage1.ColWidths[mIMAGENAME_IDX];


  Rect.Top   := Rect.Top   + 22;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 2;
  if SG_ItemImage1.RowCount > (SG_ItemImage1.VisibleRowCount+SG_ItemImage1.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_ItemImage1.Cells[ACol, ARow];
  DrawText(SG_ItemImage1.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_ItemImage1.Row < SG_ItemImage1.TopRow then // 현재 row 가 화면위에 있다
       SG_ItemImage1.Row := SG_ItemImage1.TopRow
  else if SG_ItemImage1.Row > (SG_ItemImage1.TopRow + SG_ItemImage1.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_ItemImage1.Row := SG_ItemImage1.TopRow + SG_ItemImage1.VisibleRowCount-1;
end;

end.
