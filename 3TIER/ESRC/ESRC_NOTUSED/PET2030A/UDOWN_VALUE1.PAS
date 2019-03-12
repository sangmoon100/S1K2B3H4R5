unit UDown_Value1;  //1차 상사평가

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, Pass, DBGrids, Db, DBClient,
  peoutlookbtn, pepaser, Mask, pebtnedit, peNumedit,
  PeJeonVertLabel, PeJeonLabel, pegradpanl, ComCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, Tmax_DataSetText;

type
  TFDown_Value1 = class(TForm)
    BB_Save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label13: TLabel;
    SG_Image01: TStringGrid;
    SG_ItemImage01: TStringGrid;
    SG_HiddenData01: TStringGrid;
    CB_ShowClass01: TCheckBox;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total01: TLabel;
    L_Yes01: TLabel;
    L_duname: TLabel;
    LT_Self: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    L_eempno: TLabel;
    Label5: TLabel;
    CB_empno: TLabel;
    Label14: TLabel;
    Panel7: TPanel;
    SG_Score01: TStringGrid;
    P_ControlButton01: TPanel;
    SB_S01: TSpeedButton;
    SB_A01: TSpeedButton;
    SB_B01: TSpeedButton;
    SB_C01: TSpeedButton;
    SB_D01: TSpeedButton;
    Panel1: TPanel;
    OM_Merit_V2: TOnMemo;
    OM_Merit_V1: TOnMemo;
    M_Opnion1: TOnMemo;
    OnMemo1: TOnMemo;
    TDml: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BB_ExitClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure SG_ItemImage01DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Image01DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Image01Exit(Sender: TObject);
    procedure SG_Score01DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01Enter(Sender: TObject);
    procedure CB_ShowClass01Click(Sender: TObject);
    procedure SB_YesNo01Click(Sender: TObject);
    procedure DataSave(Sender: TObject);
    procedure SG_Image01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    gsEkind   : String; //능력, 태도
    procedure OnlyVisible;
    procedure Retrieve_Data01;
    procedure ShowImage01;
    function SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    procedure ShowSum01;
//    procedure NotesConnect;
    { Private declarations }
  public
    Pempno, Pkorname, Password, Ppermission: string;
    var_Able1   : String; //능력, 태도 평가확인 여부
    gsItemIdx   : Integer;
    var_itemno  : String; //평가표번호
    var_empno   : String; //피평가자 사번
    var_korname : String; //피평가자 성명
    Running: Boolean;

    iWidth_ItemName :Integer;
    iWidth_ItemDesc :Integer;
    iWidth_SelfScore :Integer;

//==============================================================================//
//  31.32     2002.06.06      손종운    동료평가조회기능 추가
//==============================================================================//
    iWidth_LTitle :Integer;
    iLeft_LTCount :Integer;
    iLeft_LTTot   :Integer;
    iLeft_LTDept  :Integer;
    iLeft_LTCol   :Integer;
    iLeft_LTSelf  :Integer;
    iLeft_LTot    :Integer;
    iLeft_LDept   :Integer;
    iLeft_LCol    :Integer;
    iLeft_LSelf   :Integer;
    iLeft_LTtitle :Integer;
//==============================================================================//
    function IsDataModified01: Boolean;
    procedure InUpMerit(Parameter: String);
  end;

const
  // 평가이미지내용(태도) Width
  WIDTH_SGIMAGE_COL1  = 60;
  WIDTH_SGIMAGE_SCORE = 62;

  // SG_HiddenData 의 index
  dITEM_IDX       =  0; // 평가항목번호
  dITEMNAME_IDX   =  1; // 평가항목명
  dIMAGE_IDX      =  2; // 평가이미지번호
  dITEMDESC_IDX   =  3; // 평가이미지내용
  dCSCORE_IDX     =  4; //동료평가점수
  dSSCORE_IDX     =  5; //자기평가점수
  dSCORE_IDX      =  6; // 평가점수(처음)
  dTMPSCORE_IDX   =  7; // 변동될 평가점수
  dMODIFIED_IDX   =  8; // 자료변동여부
  dOBJYN_IDX      =  9; // 이의신청여부
  dOBJSAYU_IDX    = 10; // 피평가자이의신청내용
  dOBJOPINION1_IDX = 12; // 1차 평가자평가소견
  dOBJOPINION2_IDX = 13; // 2차 평가자평가소견

  // SG_Image 의 index
  mITEMNAME_IDX  = 0;
  mITEMDESC_IDX  = 1; // 평가이미지내용
  mCOLSCORE_IDX  = 2; // 평가이미지내용
  mSELFSCORE_IDX = 3; // 평가이미지내용


 // SG_Score의 index
  dS_IDX  = 0;
  dA_IDX  = 1;
  dB_IDX  = 2;
  dC_IDX  = 3;
  dD_IDX  = 4;

  var_ScrS = '100';
  var_ScrA = '90';
  var_ScrB = '80';
  var_ScrC = '70';
  var_ScrD = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';
var
  FDown_Value1: TFDown_Value1;

Implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, kpaylib, HSubForm, HMainForm;


{----------------------------------Form Open-----------------------------------}

procedure TFDown_Value1.FormCreate(Sender: TObject);
begin
  Running := True;
  iWidth_ItemName := SG_Image01.ColWidths[mITEMNAME_IDX];
  iWidth_ItemDesc := SG_Image01.ColWidths[mITEMDESC_IDX];
  iWidth_SelfScore:= SG_Image01.ColWidths[mSELFSCORE_IDX];
end;

procedure TFDown_Value1.FormShow(Sender: TObject);
var
  ParamVariant: String;
  CompIp: String;
  iy, ix : Integer;
  TempStr : String;
begin

  if Running = false then System.Exit;

  Running := True;
  iy := 0;
  Application.ProcessMessages;
  L_eempno.Caption := Pkorname+' 님이 평가하실 구성원은';
  CB_empno.Caption := var_korname;

  gsEkind     := 'Attitude';

  PageControl1.ActivePage := TabSheet1;
//  PageControl1Change(nil);
  Retrieve_Data01;
  ShowImage01;
end;

{------------------------------사용자정의 함수---------------------------------}
procedure TFDown_Value1.Retrieve_Data01;
var
  ParamVariant: String;
  i, j        : Integer;
  TempStr     : String;
begin
  //피평가자 사번 구하기..
  Application.ProcessMessages;

  ParamVariant := ' SELECT  nvl(E1ATCONYN,''N'') E1ATCONYN, ' +
                  '        (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME,  ' +
                  '        (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' AND CODENO = A.PAYRA )  CLNAME, ' +
                  '        '''' F4, '''' F5 ' +
                  ' FROM PEJNOMAS A '+
                  ' WHERE A.rabasdate = '''+sRabasdate+''' '+
                  '   AND A.empno     = '''+var_empno+'''  '+
                  '   AND A.e1empno   = '''+Pempno+'''     ';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'HINSA_select';
    SQL.Text := ParamVariant;
    ClearFieldInfo;
    AddField('E1ATCONYN', ftString, 100);
    AddField('DEPTNAME' , ftString, 100);
    AddField('CLNAME'   , ftString, 100);
    AddField('F4'       , ftString, 100);
    AddField('F5'       , ftString, 100);
    Open;

    if Eof then
    begin
      MessageDlg('상사평가 피평가자가 아닙니다.', mtError, [mbOK], 0);
      screen.Cursor := crDefault;
      Close;
      Exit;
    end;

    CB_empno.Hint := '소속: '+ FieldByName('DEPTNAME').AsString + ' '+
                     'BAND: '+ FieldByName('CLNAME').AsString;

    if FieldByName('E1ATCONYN').AsString <> 'Y' then
    Begin
      var_Able1 := 'N'; //Values 평가확인여부
      OM_Merit_V1.ReadOnly := False;
      OM_Merit_V2.ReadOnly := False;
    End
    else
    Begin
      var_Able1 := 'Y';
      OM_Merit_V1.ReadOnly := True;
      OM_Merit_V2.ReadOnly := True;
    End;

  end; //with DM.QueryTemp

  //SG_ItemImage01의 값을 지운다..
  for i := 0 to SG_ItemImage01.ColCount - 1 do
    for j := 0 to SG_ItemImage01.RowCount -1 do
      SG_ItemImage01.Cells[i, j] := '';

  i := 0; j := 0;

  ParamVariant := 'SELECT '+
                  '       nvl(to_char(a.BRCSEQNO    ),''0'') || '';'' ||'+
                  '       nvl(        a.ITEMNM       ,'' '') || '';'' ||'+
                  '       nvl(to_char(a.ITEMSEQNO   ),''0'') || '';'' ||'+
                  '       nvl(        a.ITEMCONTENT  ,'' '') || '';'' ||'+
                  '       nvl(to_char(b.score       ),''0'') || '';'' ||'+
                  '       nvl(        b.empno        ,'' '')            '+
                  '  FROM PECJNITEM a, PESUS b                          '+
                  ' WHERE a.rabasdate = '''+sRabasdate+'''              '+
                  '   AND a.rabasdate = b.rabasdate(+)                  '+
                  '   AND a.brcseqno  = c.imageno(+)                    '+
                  '   AND b.EKIND(+)  = ''Attitude''                    '+
                  '   AND b.empno(+)  = '''+var_empno+'''               '+
                  '   AND a.ITEMSEQNO = b.imageno(+)                    '+
                  '   ORDER BY a.ITEMSEQNO ASC  ';

  //항목을 가져와서 SG_ItemImage01.에 넣고..
  DataModule_Tmax.Csel_SQL :=  ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
      inc(i);
      SG_ItemImage01.Cells[0, i-1] := DataModule_Tmax.Csel_gfd(2);
      SG_ItemImage01.Cells[1, i-1] := DataModule_Tmax.Csel_gfd(4);
      SG_ItemImage01.Cells[2, i-1] := DataModule_Tmax.Csel_gfd(5);

      DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  //SG_HiddenData01에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  SG_HiddenData01.RowCount := 1;
  for i := 0 to SG_HiddenData01.ColCount - 1 do
    for j := 0 to SG_HiddenData01.RowCount -1 do
      SG_HiddenData01.Cells[i, j] := '';

  i := 0; j := 0;

  //항목번호, 이미지번호,이미지내용, 자기평가점수, 상사1차평가점수,
  ParamVariant := ' SELECT  NVL(TO_CHAR(A.BRCSEQNO),'' '') ITEMNO,       '+
                  '         NVL(A.ITEMNM,'' '') ITEMNAME,                '+
                  '         NVL(TO_CHAR(A.ITEMSEQNO),'' '') IMAGENO,     '+
                  '         NVL(A.ITEMCONTENT,'' '') IMAGEDESC ,         '+
                  '         NVL('''',''0'')  CSCORE,                     '+
                  '         NVL('''',''0'')  DSCORE,                     '+
                  '         NVL('''',''0'')  TSCORE,                     '+
                  '         NVL(TO_CHAR(FLOOR(c.score)),'' '') sscore ,  '+
                  '         NVL(TO_CHAR(FLOOR(b.score)),'' '') lascore,  '+
                  '         '''' OBJYN, '''' OBJSAYU, '''' OBJOPINION, '''' OBJOPINION2 '+
                  ' FROM PECJNITEM A, pesul B,                                          '+
                  '      (SELECT imageno, score,OBJYN, OBJSAYU, OBJOPINION  FROM pesus  '+
                  '       WHERE rabasdate = '''+sRabasdate+''' '+
                  '       AND empno       = '''+var_empno +''' '+
                  '       AND ekind       = ''Attitude'') c    '+
                  ' WHERE a.rabasdate = b.rabasdate(+)         '+
                  '   AND a.ITEMSEQNO = b.imageno  (+)         '+
                  '   AND A.rabasdate = '''+sRabasdate+'''     '+
                  '   AND b.EKIND(+)  = ''Attitude''           '+
                  '   AND B.empno(+)  = '''+var_empno +'''     '+
                  '   AND B.eempno(+) = '''+Pempno+'''         '+
                  '   AND A.ITEMSEQNO  = C.imageno(+)          '+
                  '   ORDER BY A.ITEMSEQNO ASC                 ';


  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    SQL.Clear;
    ServiceName := 'PET1020A_seld';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('ITEMNO'     , ftString  ,    2 );
    AddField('ITEMNAME'   , ftString  ,   50 );
    AddField('IMAGENO'    , ftString  ,    2 );
    AddField('IMAGEDESC'  , ftString  ,  600 );
    AddField('CSCORE'     , ftString  ,    3 );
    AddField('DSCORE'     , ftString  ,    3 );
    AddField('TSCORE'     , ftString  ,    3 );
    AddField('SSCORE'     , ftString  ,    3 );
    AddField('LASCORE'    , ftString  ,    3 );
    AddField('OBJYN'      , ftString  ,    1 );
    AddField('OBJSAYU'    , ftString  ,  200 );
    AddField('OBJOPINION1', ftString  ,  200 );
    AddField('OBJOPINION2', ftString  ,  200 );
    SQL.Text := ParamVariant;
    Open;

    while not Eof do
    begin
      inc(i);
      SG_HiddenData01.RowCount := i;
      SG_HiddenData01.Cells[dITEM_IDX,     i-1] := FieldByName('itemno').AsString;   //항목번호
      SG_HiddenData01.Cells[dITEMNAME_IDX, i-1] := FieldByName('itemname').AsString; //항목명
      SG_HiddenData01.Cells[dIMAGE_IDX,    i-1] := FieldByName('imageno').AsString;  //이미지번호
      SG_HiddenData01.Cells[dITEMDESC_IDX, i-1] := FieldByName('imagedesc').AsString;//이미지내용IntToStr(i)+') '+

      SG_HiddenData01.Cells[dSSCORE_IDX,   i-1] := FieldByName('sscore').AsString;  //자기평가점수
      SG_HiddenData01.Cells[dSCORE_IDX,    i-1] := FieldByName('lascore').AsString; //점수
      SG_HiddenData01.Cells[dTMPSCORE_IDX, i-1] := FieldByName('lascore').AsString; //점수
      SG_HiddenData01.Cells[dMODIFIED_IDX, i-1] := 'N'; //변동여부

      SG_HiddenData01.Cells[dOBJYN_IDX,     i-1] := FieldByName('OBJYN').AsString;        // 이의신청여부
      SG_HiddenData01.Cells[dOBJSAYU_IDX,   i-1] := FieldByName('OBJSAYU').AsString;      // 피평가자이의신청내용
      SG_HiddenData01.Cells[dOBJOPINION1_IDX,i-1] := FieldByName('OBJOPINION1').AsString; // 평가자평가소견
      SG_HiddenData01.Cells[dOBJOPINION2_IDX,i-1] := FieldByName('OBJOPINION2').AsString; // 평가자평가소견

      Next;
    end;

    Close;
  end;

  ShowSum01;
  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    ParamVariant := ' SELECT MERIT_JVY, MERIT_JVN, ''field3'', ''field4'',''field5''  '+
                    '  FROM PEHRUMER  '+
                    ' where rabasdate  = ''' + sRabasdate +''' ' +
                    '   AND empno      = ''' + var_empno  +''' ' ;

    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('field3'    ,ftString, 2000);
    AddField('field4'    ,ftString, 2000);
    AddField('field5'    ,ftString, 2000);
    SQL.Text := ParamVariant;
    Open;

    OM_Merit_V1.Text := Fields[0].AsString;
    OM_Merit_V2.Text := Fields[1].AsString;

  End;
end;

procedure TFDown_Value1.ShowSum01;
var
  i, j, k, l, m, n, o, p: Integer;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0; n := 0; o := 0; p := 0;

  for i := 0 to SG_HiddenData01.RowCount -1 do
  begin
    if (SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = '0') or
       (SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = '') then
      inc(k)                                                      //1차 미실시
    else
    begin
      inc(j);                                                     //1차 평가
      l := l + StrToInt(SG_HiddenData01.Cells[dTMPSCORE_IDX, i]);   //1차 점수
    end;
    m := M + StrToIntdef(SG_HiddenData01.Cells[dSSCORE_IDX, i], 0 );//자기평가합
    n := N + StrToIntdef(SG_HiddenData01.Cells[dCSCORE_IDX, i], 0 );//동료평가합
  end;

  if (SG_HiddenData01.RowCount = 1) and (SG_HiddenData01.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total01.Caption := IntToStr(j+k);
  L_Yes01.Caption   := IntToStr(j);
end;

procedure TFDown_Value1.ShowImage01;
var
  i, j : Integer;
begin
  SG_Image01.RowCount := 1;
  for i := 0 to SG_Image01.ColCount - 1 do
    for j := 0 to SG_Image01.RowCount -1 do
      SG_Image01.Cells[i, j] := '';

  SG_Score01.RowCount := 1;
  for i := 0 to SG_Score01.ColCount - 1 do
    for j := 0 to SG_Score01.RowCount -1 do
      SG_Image01.Cells[i, j] := '';

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData01.Tag := -1;

  if SG_HiddenData01.Cells[0,0] = '' then
  begin
    MessageBox(handle,'등록된 항목이 하나도 없습니다','확 인', MB_OK or $0030 );
    P_ControlButton01.Visible := False;
    screen.Cursor := crDefault;
    Exit;
  end;

  for i := 0 to SG_HiddenData01.RowCount -1 do
  begin
   // if SG_HiddenData01.Cells[dITEM_IDX, i] = asItemNum then
    begin
      if SG_HiddenData01.Tag = -1 then  SG_HiddenData01.Tag := i;
      if SG_Image01.Cells[0,0] <> '' then
      begin
        SG_Image01.RowCount := SG_Image01.RowCount + 1;
        SG_Score01.RowCount := SG_Score01.RowCount + 1;
      end;

      //이미지내용 넣기..
      SG_Image01.Cells[mITEMNAME_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMNAME_IDX, i];
      SG_Image01.Cells[mITEMDESC_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMDESC_IDX, i];

      SG_Score01.Cells[dS_IDX , SG_Score01.RowCount-1] := '';
      SG_Score01.Cells[dA_IDX , SG_Score01.RowCount-1] := '';
      SG_Score01.Cells[dB_IDX , SG_Score01.RowCount-1] := '';
      SG_Score01.Cells[dC_IDX , SG_Score01.RowCount-1] := '';
      SG_Score01.Cells[dD_IDX , SG_Score01.RowCount-1] := '';

      // 자기평가점수 보여주기
       SG_Image01.Cells[2, SG_Image01.RowCount -1] :='';
           if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrS  then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdS
      else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrA  then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdA
      else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrB  then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdB
      else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrC  then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdC
      else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrD  then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdD;

      // 상사1차
           if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = var_ScrS  then SG_Score01.Cells[dS_IDX , SG_Score01.RowCount-1] := var_GrdS
      else if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = var_ScrA  then SG_Score01.Cells[dA_IDX , SG_Score01.RowCount-1] := var_GrdA
      else if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = var_ScrB  then SG_Score01.Cells[dB_IDX , SG_Score01.RowCount-1] := var_GrdB
      else if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = var_ScrC  then SG_Score01.Cells[dC_IDX , SG_Score01.RowCount-1] := var_GrdC
      else if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = var_ScrD  then SG_Score01.Cells[dD_IDX , SG_Score01.RowCount-1] := var_GrdD ;
    end;
  end;
  SG_Image01.SetFocus;
end;

function TFDown_Value1.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while(nPos > 0)do
  begin
    Delete( sSrc, nPos, nLenLookFor );
    Insert( sReplaceWith, sSrc, nPos );
    nPos := Pos( sLookFor, sSrc );
    
  end;
  Result := sSrc;
end;

function TFDown_Value1.IsDataModified01: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to SG_HiddenData01.RowCount -1 do
    if SG_HiddenData01.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
end;

procedure TFDown_Value1.OnlyVisible;
begin
  if ((gsEkind = 'Attitude') and (var_Able1 = 'Y'))  then
  begin
    BB_save.Visible    := False;
    BB_Cancel.Visible  := False;
  end else
  begin
    BB_save.Visible    := True;
    BB_Cancel.Visible  := True;
  end;
end;

procedure TFDown_Value1.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if      CB_name.Items.Count < 5  then CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5  then CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then CB_name.DropDownCount := 20
  else                                  CB_name.DropDownCount := CB_name.Items.Count + 1;
end;

{------------------------------버튼클릭---------------------------------}

procedure TFDown_Value1.SB_YesNo01Click(Sender: TObject);
var
  lsScore : String;
begin
  if SG_HiddenData01.Tag = -1 then Exit;

  if ((gsEkind = 'Attitude')   and (var_Able1 = 'Y')) then //현제 능력평가이면서 평가완료가 되었을때..
  begin
      MessageBox(handle,'이미 평가가 완료된 자료는 '+
                       '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
      Exit;
  end;

  //평가점수 계산
       if trim(TSpeedButton(Sender).Caption) = var_GrdS  then  lsScore :=  var_ScrS
  else if trim(TSpeedButton(Sender).Caption) = var_GrdA  then  lsScore :=  var_ScrA
  else if trim(TSpeedButton(Sender).Caption) = var_GrdB  then  lsScore :=  var_ScrB
  else if trim(TSpeedButton(Sender).Caption) = var_GrdC  then  lsScore :=  var_ScrC
  else if trim(TSpeedButton(Sender).Caption) = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := lsScore;
    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';

    SG_Score01.Cells[dS_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dA_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dB_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dC_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dD_IDX , SG_Image01.Row] := '';

         if SB_S01.Down  then SG_Score01.Cells[dS_IDX , SG_Image01.Row] := var_GrdS
    else if SB_A01.Down  then SG_Score01.Cells[dA_IDX , SG_Image01.Row] := var_GrdA
    else if SB_B01.Down  then SG_Score01.Cells[dB_IDX , SG_Image01.Row] := var_GrdB
    else if SB_C01.Down  then SG_Score01.Cells[dC_IDX , SG_Image01.Row] := var_GrdC
    else if SB_D01.Down  then SG_Score01.Cells[dD_IDX , SG_Image01.Row] := var_GrdD ; //if SB_D.Down

  end else
  begin
    SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := '';
    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';

    SG_Score01.Cells[dS_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dA_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dB_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dC_IDX , SG_Image01.Row] := '';
    SG_Score01.Cells[dD_IDX , SG_Image01.Row] := '';
  end;
end;

procedure TFDown_Value1.BB_CancelClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
       Retrieve_Data01;
       ShowImage01;
  end;
end;

procedure TFDown_Value1.DataSave(Sender: TObject);
var
  i, j, aiTotSrc, v_tmp : Integer;
  ParamVariant  : String;
  lsUpdateValue : String;
  TempScore     : String;
  lstBody       : TstringList;
  lsEmpName     : String;
begin
  if (var_Able1 = 'Y') and (gsEkind = 'Attitude') then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.',
               '작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if PageControl1.ActivePage = TabSheet1 then
  begin
    Screen.Cursor := crHourGlass;

    ParamVariant := ' DELETE FROM pesul ' +
                    ' WHERE rabasdate = '''+sRabasdate+''' ' +
                    '   AND empno     = '''+var_empno +''' ' +
                    '   AND ekind     = '''+gsEkind   +''' ' ;

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then Exit;

    for i := 0 to SG_HiddenData01.RowCount -1 do
    begin
      ParamVariant := 'INSERT INTO pesul ' +
                      '    (rabasdate, empno,   eempno, ekind, ' +
                      '     itemno,    imageno, score)         ' +
                      ' VALUES('''+sRabasdate+''', '+
                      '        '''+var_empno+''',    '+
                      '        '''+Pempno+''',    '+
                      '        '''+gsEkind+''',   ' +
                      '        '+SG_HiddenData01.Cells[dITEM_IDX,  i]+',    '+
                      '        '+SG_HiddenData01.Cells[dIMAGE_IDX, i]+',    '+
                      '        '+SG_HiddenData01.Cells[dTMPSCORE_IDX, i]+') ';

      DataModule_Tmax.Cupd_SQL := ParamVariant;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
          Exit;
      end;
    end; //End of Loop..

    Screen.Cursor :=  crDefault;

    //점수 저장후에 임시점수---> 점수,  변동여부 ---> 'N'
    aiTotSrc := 0;
    for i := 0 to SG_HiddenData01.RowCount -1 do
    begin
    if SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = '1' then
     Inc(aiTotSrc);

    SG_HiddenData01.Cells[dSCORE_IDX, i] := SG_HiddenData01.Cells[dTMPSCORE_IDX, i];
    SG_HiddenData01.Cells[dMODIFIED_IDX, i] := 'N';
    end;

    MessageDlg('입력하신 '+gsEkind+' 평가 자료를 저장하였습니다.',mtInformation,[mbOk],0);
  end;

  InUpMerit(var_empno);
end;

{------------------------------ㄱㅣ ㅌ ㅏ---------------------------------}
procedure TFDown_Value1.BB_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFDown_Value1.SG_ItemImage01DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  i        : Integer;
begin
  if (gdSelected in State) then
  begin
    SG_ItemImage01.Canvas.Brush.Color := clWhite;//$00CFFBFC;//$00FFE8D0;//$00FEEDED;
    SG_ItemImage01.Canvas.Font.Color  := clBlack;
  end;
  lsBuffer := SG_ItemImage01.Cells[Col, Row];
  SG_ItemImage01.Canvas.FillRect(Rect);
  if SG_ItemImage01.VisibleRowCount < SG_ItemImage01.RowCount then
    SG_ItemImage01.ColWidths[1] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[0] - 16
  else
    SG_ItemImage01.ColWidths[1] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[0];

  Rect.Top   := Rect.Top   + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 10;

  DrawText(SG_ItemImage01.Canvas.Handle, PChar(lsBuffer), StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
end;


procedure TFDown_Value1.SG_Image01DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
  A: String;
begin

  if gdSelected in State then
  begin
    SG_Image01.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image01.Canvas.Font.Color  := clBlack;
    SG_Image01.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image01.Cells[Col, Row];
  SG_Image01.Canvas.FillRect(Rect);

  if SG_Image01.VisibleRowCount < SG_Image01.RowCount then
    SG_Image01.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore - 16
  else
    SG_Image01.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore;

  if Col = 0 then
  begin
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image01.Canvas.Handle, PChar(lsBuffer), StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (Col = 2) or (Col = 3) then
  begin
    liLeft := (((Rect.Right - Rect.Left) - SG_Image01.Canvas.TextWidth(lsBuffer))  div 2) + Rect.Left-2;
    liTop  := (((Rect.Bottom - Rect.Top) - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image01.Canvas.Font.Style := [fsBold];
    SG_Image01.Canvas.Font.Size  := 9;
    SG_Image01.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 40; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image01.Canvas.Handle, PChar(lsBuffer),StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  if SG_HiddenData01.Tag = -1 then System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image01.Row < SG_Image01.TopRow then // 현재 row 가 화면위에 있다
    SG_Image01.Row := SG_Image01.TopRow
  else if SG_Image01.Row > (SG_Image01.TopRow + SG_Image01.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image01.Row := SG_Image01.TopRow + SG_Image01.VisibleRowCount-1;

  SG_Score01.TopRow := SG_Image01.TopRow;
  SG_Score01.Row    := SG_Image01.Row;
  // 버튼의 top 위치를 계산
  P_ControlButton01.Top := (SG_Image01.Row - SG_Image01.TopRow) *
                         (SG_Image01.DefaultRowHeight + SG_Image01.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S01.Down   := False;
  SB_A01.Down   := False;
  SB_B01.Down   := False;
  SB_C01.Down   := False;
  SB_D01.Down   := False;

  //버튼상태반영
       if SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrS  then  SB_S01.Down  := True
  else if SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrA  then  SB_A01.Down  := True
  else if SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrB  then  SB_B01.Down  := True
  else if SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrC  then  SB_C01.Down  := True
  else if SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag + SG_Image01.Row] = var_ScrD  then  SB_D01.Down  := True;

  P_ControlButton01.Visible := True;
end;

procedure TFDown_Value1.SG_Image01Exit(Sender: TObject);
begin
  P_ControlButton01.Visible := False;
end;

procedure TFDown_Value1.SG_Score01DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;

 i : Integer;
begin
  SG_Score01.Canvas.Brush.Color := SG_Image01.Color; ///$00F0FFFF;
  for i := 0 to SG_Score01.ColCount -1 do
    if SG_Score01.Cells[i, Row] <> '' then
    begin
      SG_Score01.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;

  if CB_ShowClass01.Checked then // 등급을 보이게...
    SG_Score01.Canvas.Font.Color := SG_Image01.Font.Color
  else
    SG_Score01.Canvas.Font.Color := SG_Score01.Font.Color;

  SG_Score01.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score01.Cells[Col, Row];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score01.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score01.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFDown_Value1.SG_Score01Enter(Sender: TObject);
begin
  SG_Image01.SetFocus;
end;

procedure TFDown_Value1.CB_ShowClass01Click(Sender: TObject);
begin
  SG_Score01.Refresh;
end;

procedure TFDown_Value1.SG_Image01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and (SG_Image01.Row = 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    ShowImage01;
    SG_Image01.Row := SG_Image01.RowCount-1;
    Key := VK_ESCAPE;
  end else
  if (Key = VK_DOWN) and (SG_Image01.Row = SG_Image01.RowCount-1) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    ShowImage01;
    SG_Image01.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFDown_Value1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BB_Save.Visible) and (IsDataModified01) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TFDown_Value1.PageControl1Change(Sender: TObject);
begin
  if gsEkind <> '' then
  begin
    if (BB_Save.Visible) and ((IsDataModified01)) then 
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;
  end;
  L_Total01.Caption := '0';
  L_Yes01.Caption   := '0';

  gsEkind := 'Attitude';
  BB_CancelClick(Sender);
end;

procedure TFDown_Value1.InUpMerit(Parameter: String);
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
                ' where rabasdate  = ''' + sRabasdate +''' ' +
                '   AND empno      = ''' + var_empno  +''' ' ;

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
              '   (RABASDATE, EMPNO,     MERIT_JVY,  ' +
              '    MERIT_JVN, WRITEEMP,  WRITETIME)  ' +
              '  VALUES                              ' +
              '   ('''+ sRabasdate       +''',       ' +
              '    '''+ Parameter        +''',       ' +
              '    '''+ OM_Merit_V1.Text +''',       ' +
              '    '''+ OM_Merit_V2.Text +''',       ' +
              '    '''+ HSubForm.GSempno +''',       ' +
              '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
              '   ) ';
  end
  Else
  Begin
    SQLText := Format(
              'UPDATE PEHRUMER SET ' +
              '       MERIT_JVY = '''+ OM_Merit_V1.Text +''', '+
              '       MERIT_JVN = '''+ OM_Merit_V2.Text +''', '+
              '       WRITEEMP  = '''+ HSubForm.GSempno +''', '+
              '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
              ' WHERE RABASDATE = ''%s'' '+
              '  AND  EMPNO     = ''%s'' ' ,
              [sRabasdate, Parameter]);
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

end.
