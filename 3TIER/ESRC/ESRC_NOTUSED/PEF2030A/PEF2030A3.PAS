unit pef2030a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient,
  peoutlookbtn, pegradpanl, Tmax_DataSetText, OnInsaCommon;

type
  TFm_Sub2 = class(TForm)
    Label13: TLabel;
    L_eempno: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    L_FistTxt: TLabel;
    CB_empno: TComboBox;
    L_munjang7: TLabel;
    L_munjang4: TLabel;
    L_munjang3: TLabel;
    L_dot: TLabel;
    L_munjang5: TLabel;
    L_munjang6: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    L_TotalComp: TLabel;
    L_e2score: TLabel;
    Label3: TLabel;
    LB_brchnm: TListBox;
    Panel7: TPanel;
    SG_class: TStringGrid;
    P_ControlButton: TPanel;
    SB_classs: TSpeedButton;
    SB_classa: TSpeedButton;
    SB_classb: TSpeedButton;
    SB_classc: TSpeedButton;
    SB_classd: TSpeedButton;
    SG_element: TStringGrid;
    SG_HiddenData: TStringGrid;
    CB_ShowClass: TCheckBox;
    Lable1: TLabel;
    L_conyn: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    E_e1empno: TEdit;
    Label6: TLabel;
    L_score: TLabel;
    Label9: TLabel;
    L_e1score: TLabel;
    L_classnms: TLabel;
    L_classnmb: TLabel;
    L_classnmc: TLabel;
    L_classnmd: TLabel;
    L_classnma: TLabel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Shape1: TShape;
    Label18: TLabel;
    BB_confirm: TPeJeonOutLookBtn;
    BB_Exit: TPeJeonOutLookBtn;
    BB_Save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    L_Save: TLabel;
    L_Cancel: TLabel;
    L_Confirm: TLabel;
    CDS_Gen: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BB_ExitClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure CB_ShowClassClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CB_empnoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LB_brchnmClick(Sender: TObject);
    procedure SG_elementDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_elementExit(Sender: TObject);
    procedure SG_classDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_classEnter(Sender: TObject);
    procedure SG_elementKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB_classsClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
  private
    var_empno : String;
    procedure EmpnoAdd;
    procedure Retrieve_Data;
    function  IsDataModified: Boolean;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    { Private declarations }
  public
    Pempno, Pkorname, Password, Ppermission, var_e2conyn, var_e1score: string;
    gsSelfYn  : String; //자기평가완료여부
    giindex   : Integer;
    Running: Boolean;
    procedure showup_brchnm(brcseqno: String);
    procedure Display_Sumup;
    { Public declarations }
  end;
  
const
  // SG_HiddenData 의 index
  dBRCHSEQNO_IDX   = 0; // 평가요소번호
  dITEMSEQNO_IDX   = 1; // 평가항목번호
  dITEMNM_IDX      = 2; // 평가항목명
  dITEMCONTENT_IDX = 3; // 평가항목내용
  dCLASS_IDX       = 4; // 평가등급
  dSCORE_IDX       = 5; // 평가점수
  dSSCORE_IDX      = 6; // 자기평가점수
  d1SCORE_IDX      = 7; // 1차평가점수
  dMODIFIED_IDX    = 8; // 자료변동 여부

  // SG_element의 index
  eITEMNM_IDX      = 0; // 평가항목명
  eITEMCONTENT_IDX = 1; // 평가항목내용
  eSSCORE_IDX      = 2; // 자기평가점수
  e1SCORE_IDX      = 3; // 1차평가점수

 // SG_score의 index
  sCLASSs_IDX  = 0; // 등급s
  sCLASSa_IDX  = 1; // 등급a
  sCLASSb_IDX  = 2; // 등급b
  sCLASSc_IDX  = 3; // 등급c
  sCLASSd_IDX  = 4; // 등급d

var
  Fm_Sub2: TFm_Sub2;


implementation
{$R *.DFM}
uses Hinsa_TmaxDM, pef2030a1;

{----------------------------------Form Open-----------------------------------}

procedure TFm_Sub2.FormCreate(Sender: TObject);
begin
 Running := False;
end;

procedure TFm_Sub2.FormShow(Sender: TObject);
var
  ParamVariant: String;
  CompIp: String;
  TempMemo : String;
begin
  if Running then System.Exit;
  Running := True;

//  Pempno   := Hinsa_Param(CmdLine, 1);
  Pempno   := MainForm.Pempno; 
  Pkorname := Hinsa_Param(CmdLine, 2);
  Password := Hinsa_Param(CmdLine, 3);
  Ppermission := copy(Hinsa_Param(CmdLine,4),1,1);

  EmpnoAdd;

  if CB_empno.Items.Count = 0 then
  begin
    MessageBox(handle,'접속하신 사원은 특정직평가 2차평가권한이 없습니다.'+#13+#13+
                      '프로그램을 종료합니다.','대상자오류',MB_ICONWARNING);
    Mainform.Close;
    Exit;
  end;

  {
  ParamVariant := 'SELECT BRCSEQNO, ITEMSEQNO, ITEMNM, ITEMCONTENT, WEIGHT, '+
                  'SGRADE, AGRADE, BGRADE, CGRADE, DGRADE '+ // 배점
                  'FROM PECSPITEM '+ // 평가기준
                  'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }
ParamVariant :=  'SELECT  '+
' nvl(to_char(brcseqno     ),''0''),   '+
' nvl(to_char(itemseqno    ),''0''),   '+
' nvl(        itemnm        ,'' ''),   '+
' nvl(        itemcontent   ,'' ''),   '+
' nvl(to_char(weight       ),''0''),   '+
' nvl(to_char(sgrade       ),''0''),   '+
' nvl(to_char(agrade       ),''0''),   '+
' nvl(to_char(bgrade       ),''0''),   '+
' nvl(to_char(cgrade       ),''0''),   '+
' nvl(to_char(dgrade       ),''0'')    '+
' FROM PECSPITEM '+ // 평가기준
' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ';

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF2030A_sel3';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('BRCSEQNO'     , ftFloat ,  5   );
    AddField('ITEMSEQNO'    , ftFloat ,  5   );
    AddField('ITEMNM'       , ftString,  30  );
    AddField('ITEMCONTENT'  , ftString,  150 );
    AddField('WEIGHT'       , ftFloat ,  6   );
    AddField('SGRADE'       , ftFloat ,  6   );
    AddField('AGRADE'       , ftFloat ,  6   );
    AddField('BGRADE'       , ftFloat ,  6   );
    AddField('CGRADE'       , ftFloat ,  6   );
    AddField('DGRADE'       , ftFloat ,  6   );
    SQL.Text := ParamVariant;
    Open;
  end;

  SB_classs.Hint     := CDS_Gen.FieldByName('SGRADE').AsString;   // 배점s
  SB_classa.Hint     := CDS_Gen.FieldByName('AGRADE').AsString;   // 배점a
  SB_classb.Hint     := CDS_Gen.FieldByName('BGRADE').AsString;   // 배점b
  SB_classc.Hint     := CDS_Gen.FieldByName('CGRADE').AsString;   // 배점c
  SB_classd.Hint     := CDS_Gen.FieldByName('DGRADE').AsString;  // 배점d
  CDS_Gen.Close;

  Application.ProcessMessages;

  BB_CancelClick(BB_Cancel);
end;

{------------------------------사용자정의 함수---------------------------------}
procedure TFm_Sub2.EmpnoAdd;
var
  ParamVariant: String;
begin
  L_eempno.Caption := Pkorname+' 님의 피평가자는';
  CB_empno.Items.Clear;

  {
  ParamVariant := ' SELECT GUBUN||''  ''||RPAD(KORNAME, 6, '' '')||' +
                  '       ''(''||EMPNO||'')''||''  ''||ECONYN NAME    ' +
                  'FROM                                               ' +
                  '  (SELECT EMPNO, KORNAME, ''1차'' GUBUN, CONYN,    ' +
                  '          DECODE(E1CONYN, ''Y'', ''완료'', ''미완료'') ECONYN '+
                  '     FROM PEMSPMAS                                   ' +
                  '    WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ' +
                  '      AND E1EMPNO   = '''+Pempno+'''                 ' +
                  '      AND EXYN      = ''Y''                          ' +
                  '   UNION ' +
                  '   SELECT EMPNO, KORNAME, ''2차'' GUBUN, CONYN,    ' +
                  '          DECODE(E2CONYN, ''Y'', ''완료'', ''미완료'') ECONYN '+
                  '     FROM PEMSPMAS                                   ' +
                  '    WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ' +
                  '      AND E2EMPNO   = '''+Pempno+'''                 ' +
                  '      AND EXYN      = ''Y'' )                        ' +
                  'ORDER BY GUBUN ASC, EMPNO ASC  ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  }
ParamVariant :=  'SELECT  '+
' nvl(        GUBUN||''  ''||RPAD(KORNAME, 6, '' '')||''(''||EMPNO||'')''||''  ''||ECONYN ,'' '') NAME '+
'FROM                                               ' +
'  (SELECT EMPNO, KORNAME, ''1차'' GUBUN, CONYN,    ' +
'          DECODE(E1CONYN, ''Y'', ''완료'', ''미완료'') ECONYN '+
'     FROM PEMSPMAS                                   ' +
'    WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ' +
'      AND E1EMPNO   = '''+Pempno+'''                 ' +
'      AND EXYN      = ''Y''                          ' +
'   UNION ' +
'   SELECT EMPNO, KORNAME, ''2차'' GUBUN, CONYN,    ' +
'          DECODE(E2CONYN, ''Y'', ''완료'', ''미완료'') ECONYN '+
'     FROM PEMSPMAS                                   ' +
'    WHERE RABASDATE = '''+MainForm.var_rabasdate+''' ' +
'      AND E2EMPNO   = '''+Pempno+'''                 ' +
'      AND EXYN      = ''Y'' )                        ' +
'ORDER BY GUBUN ASC, EMPNO ASC  ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
//    Open;
    While Not Eof do
    begin
      CB_empno.Items.Add(DataModule_Tmax.Csel_gfd(1));
      Next;
    end;
//    Close;
  end;
  CB_empno.ItemIndex := 0;
end;

procedure TFm_Sub2.Retrieve_Data;
var
  ParamVariant: String;
  i, j, cnt   : Integer;
  TempMemo    : String;
begin
  screen.Cursor := crHourGlass;
  //피평가자 사번 구하기..
  giindex := CB_empno.Itemindex;
  i := Pos(')', CB_empno.Text);
  var_empno := Copy(CB_empno.Text, i-4, 4); // 피평가자 사번

  {
  ParamVariant := 'SELECT E1EMPNO, E1KORNAME, E1CONYN, NVL(E1SCORE, 0) E1SCORE, '+
                  '       NVL(SCORE, 0) SCORE, E2CONYN  '+
                  'FROM PEMSPMAS '+
                  'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '  AND EMPNO     = '''+var_empno+''' '; //피평가자사번
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }
ParamVariant :=  'SELECT  '+
' nvl(        e1empno      ,'' ''),   '+
' nvl(        e1korname    ,'' ''),   '+
' nvl(        e1conyn      ,'' ''),   '+
' nvl(to_char(e1score     ),''0''),   '+
' nvl(to_char(score       ),''0''),   '+
' nvl(        e2conyn      ,'' '')    '+
'FROM PEMSPMAS '+
'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
'  AND EMPNO     = '''+var_empno+''' '; //피평가자사번

  with CDS_Gen do begin
    Close;
    ServiceName := 'PEF2030A_sel4';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('E1EMPNO'      , ftString,  4   );
    AddField('E1KORNAME'    , ftString,  12  );
    AddField('E1CONYN'      , ftString,  1   );
    AddField('E1SCORE'      , ftFloat ,  12  );
    AddField('SCORE'        , ftFloat ,  12  );
    AddField('E2CONYN'      , ftString,  1   );
    SQL.Text := ParamVariant;
    Open;
  end;

  E_e1empno.Text  := CDS_Gen.FieldByName('E1KORNAME').AsString + '(' +
                     CDS_Gen.FieldByName('E1EMPNO').AsString + ')';
  L_conyn.Caption := CDS_Gen.FieldByName('E1CONYN').AsString;
  L_score.Caption := CDS_Gen.FieldByName('SCORE').AsString;
  L_e1score.Caption := CDS_Gen.FieldByName('E1SCORE').AsString;
  var_e1score     := CDS_Gen.FieldByName('E1SCORE').AsString;
  var_e2conyn     := CDS_Gen.FieldByName('E2CONYN').AsString;
  CDS_Gen.Close;

  //2006.11.22 하은영
  L_conyn.Caption := 'Y';
  
  if (L_conyn.Caption = 'N') or (var_e2conyn = 'Y') then
  begin
    L_dot.Visible      := False;
    L_munjang3.Visible := False;
    L_munjang4.Visible := False;
    L_munjang5.Visible := False;
    L_munjang6.Visible := False;
    L_munjang7.Visible := False;
    L_Save.Visible     := False;
    L_Cancel.Visible   := False;
    L_Confirm.Visible  := False;
    BB_save.Visible    := False;
    BB_Cancel.Visible  := False;
    BB_confirm.Visible := False;
  end
  else
  begin
    L_dot.Visible      := True;
    L_munjang3.Visible := True;
    L_munjang4.Visible := True;
    L_munjang5.Visible := True;
    L_munjang6.Visible := True;
    L_munjang7.Visible := True;
    L_Save.Visible     := True;
    L_Cancel.Visible   := True;
    L_Confirm.Visible  := True;
    BB_save.Visible    := True;
    BB_Cancel.Visible  := True;
    BB_confirm.Visible := True;
  end;

  // 평가요소를 구한다
  LB_brchnm.Items.Clear;
  {
  ParamVariant := 'SELECT BRCSEQNO, BRCHNM '+ // 평가요소번호, 평가요소명
                  'FROM PECSPBRC '+ // 평가요소
                  'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  'ORDER BY BRCSEQNO ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }

ParamVariant :=  'SELECT  '+
' nvl(to_char(brcseqno),''0'') || '';'' ||   '+
' nvl(        brchnm   ,'' '')    '+
' FROM PECSPBRC '+ // 평가요소
' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
' ORDER BY BRCSEQNO ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
    LB_brchnm.Items.AddObject(DataModule_Tmax.Csel_gfd(2), // 평가요소명
                              TObject( StrToInt(DataModule_Tmax.Csel_gfd(1)) )); // 평가요소번호
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
//  CDM.CDS_Gen.Close;

  Application.ProcessMessages;

  // StringGrid 초기화
  for i := SG_HiddenData.FixedCols to SG_HiddenData.ColCount - 1 do
    for j := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  SG_HiddenData.RowCount := 2;

  // 평가항목과 피평가자의 평가점수를 읽어온다
  {
  ParamVariant := 'SELECT a.BRCSEQNO, a.ITEMSEQNO, a.ITEMNM, a.ITEMCONTENT, '+  // 평가요소번호, 평가항목번호, 평가항목명, 평가항목내용
                  '       b.GRADE, b.SCORE SCORE, '+
                  '       a.WEIGHT WEIGHT         '+  // 평가등급
                  'FROM PECSPITEM a, PEMSPSCORE b '+ // 평가항목, 자기평가
                  'WHERE a.RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '  AND b.EKIND  = ''2'' '+ // 평가구분
                  '  AND a.RABASDATE = b.RABASDATE '+
                  '  AND b.EMPNO     = '''+var_empno+''' '+ // 피평가자사번
                  '  AND a.BRCSEQNO  = b.BRCSEQNO '+
                  '  AND a.ITEMSEQNO = b.ITEMSEQNO '+
                  'ORDER BY a.BRCSEQNO, a.ITEMSEQNO ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }
ParamVariant :=  'SELECT  '+
' nvl(to_char(a.brcseqno                                ),''0''),   '+
' nvl(to_char(a.itemseqno                               ),''0''),   '+
' nvl(        a.itemnm                                   ,'' ''),   '+
' nvl(        a.itemcontent                              ,'' ''),   '+
' nvl(        b.grade                                    ,'' ''),   '+
' nvl(to_char(b.score                                   ),''0''),   '+
' nvl(to_char(a.weight                                  ),''0'')    '+
' FROM PECSPITEM a, PEMSPSCORE b '+ // 평가항목, 자기평가
' WHERE a.RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
'  AND b.EKIND  = ''2'' '+ // 평가구분
'  AND a.RABASDATE = b.RABASDATE '+
'  AND b.EMPNO     = '''+var_empno+''' '+ // 피평가자사번
'  AND a.BRCSEQNO  = b.BRCSEQNO '+
'  AND a.ITEMSEQNO = b.ITEMSEQNO '+
' ORDER BY a.BRCSEQNO, a.ITEMSEQNO ';

  with CDS_Gen do begin
    Close;
    ServiceName := 'PEF2030A_sel2';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('BRCSEQNO'     , ftFloat ,  5   );
    AddField('ITEMSEQNO'    , ftFloat ,  5   );
    AddField('ITEMNM'       , ftString,  30  );
    AddField('ITEMCONTENT'  , ftString,  150 );
    AddField('GRADE'        , ftString,  1   );
    AddField('SCORE'        , ftFloat ,  6   );
    AddField('WEIGHT'       , ftFloat ,  6   );
    SQL.Text := ParamVariant;
    Open;
  end;

  while not CDS_Gen.Eof do
  begin
    if SG_HiddenData.Cells[dBRCHSEQNO_IDX, SG_HiddenData.RowCount-1] <> '' then
      SG_HiddenData.RowCount := SG_HiddenData.RowCount + 1;

    SG_HiddenData.Cells[dBRCHSEQNO_IDX, SG_HiddenData.RowCount-1] :=
        CDS_Gen.FieldByName('brcseqno').AsString; // 평가요소번호
    SG_HiddenData.Cells[dITEMSEQNO_IDX, SG_HiddenData.RowCount-1] :=
        CDS_Gen.FieldByName('itemseqno').AsString; // 평가항목번호
    SG_HiddenData.Cells[dITEMNM_IDX, SG_HiddenData.RowCount-1] :=
        CDS_Gen.FieldByName('itemnm').AsString; // 평가항목명
    SG_HiddenData.Cells[dITEMCONTENT_IDX, SG_HiddenData.RowCount-1] :=
        CDS_Gen.FieldByName('itemcontent').AsString; // 평가항목내용
    SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.RowCount-1] :=
        CDS_Gen.FieldByName('grade').AsString; // 평가등급
    if Trim(CDS_Gen.FieldByName('score').AsString) = '' then
      SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.RowCount-1] := '0'
    else
      SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.RowCount-1] :=
          CDS_Gen.FieldByName('score').AsString; // 평가점수
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.RowCount-1] := 'N'; // 자료 변동 여부

    CDS_Gen.Next;
  end;
  CDS_Gen.Close;
  {
  ParamVariant := 'SELECT GRADE '+
                  'FROM PEMSPSCORE  '+ // 평가항목, 자기평가
                  'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '  AND EKIND  = ''S'' '+ // 평가구분
                  '  AND EMPNO  = '''+var_empno+''' '+ // 사번
                  'ORDER BY BRCSEQNO, ITEMSEQNO ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }
ParamVariant :=  'SELECT  '+
' nvl(        grade                                    ,'' '')   '+
' FROM PEMSPSCORE  '+ // 평가항목, 자기평가
' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
'  AND EKIND  = ''S'' '+ // 평가구분
'  AND EMPNO  = '''+var_empno+''' '+ // 사번
' ORDER BY BRCSEQNO, ITEMSEQNO ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    SG_HiddenData.Cells[dSSCORE_IDX, i] := DataModule_Tmax.Csel_gfd(1); //  자기평가점수
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
//  CDM.CDS_Gen.Close;
  {
  ParamVariant := 'SELECT GRADE '+
                  'FROM PEMSPSCORE  '+ // 평가항목, 자기평가
                  'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '  AND EKIND  = ''1'' '+ // 평가구분
                  '  AND EMPNO  = '''+var_empno+''' '+ // 사번
                  'ORDER BY BRCSEQNO, ITEMSEQNO ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
  }
 ParamVariant :=  'SELECT  '+
' nvl(        grade                                    ,'' '')   '+
'FROM PEMSPSCORE  '+ // 평가항목, 자기평가
'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
'  AND EKIND  = ''1'' '+ // 평가구분
'  AND EMPNO  = '''+var_empno+''' '+ // 사번
'ORDER BY BRCSEQNO, ITEMSEQNO ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    SG_HiddenData.Cells[d1SCORE_IDX, i] := DataModule_Tmax.Csel_gfd(1); //  자기평가점수
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
//  CDM.CDS_Gen.Close;

  Display_Sumup; // 화면의 평가점수/등급을 구한다

  cnt := 0;
  for i := 0 to SG_HiddenData.RowCount - 1 do
  begin
    if Trim(SG_HiddenData.Cells[dCLASS_IDX, i]) <> '' then
      cnt := cnt + 1;
  end;

  L_TotalComp.Caption := '총 '+IntToStr(SG_HiddenData.RowCount - 1)+'개의 평가항목중 '+
                         IntToStr(cnt)+'개를 등록하셨습니다';
  screen.Cursor := crArrow;
end;

procedure TFm_Sub2.showup_brchnm(brcseqno: String);
var
  i, j: Integer;
begin
  // StringGrid 초기화
  for i := SG_element.FixedCols to SG_element.ColCount - 1 do
    for j := SG_element.FixedCols to SG_element.RowCount -1 do
      SG_element.Cells[i, j] := '';
  SG_element.RowCount := 1;

  for i := SG_class.FixedCols to SG_class.ColCount - 1 do
    for j := SG_class.FixedCols to SG_class.RowCount -1 do
      SG_class.Cells[i, j] := '';
  SG_class.RowCount := 1;

  SG_HiddenData.Tag := -1;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do // 평가항목 갯수만큼
    if SG_HiddenData.Cells[dBRCHSEQNO_IDX, i] = brcseqno then
    begin
      if SG_HiddenData.Tag = -1 then
        SG_HiddenData.Tag := i; // SG_HiddenData.Tag 에 현재 평가요소의 시작 index를 저장한다

      if SG_element.Cells[SG_element.FixedCols, SG_element.RowCount-1] <> '' then
      begin
        SG_element.RowCount := SG_element.RowCount + 1;
        SG_class.RowCount   := SG_class.RowCount + 1;
      end;

      SG_element.Cells[eITEMNM_IDX, SG_element.RowCount-1] :=
          SG_HiddenData.Cells[dITEMNM_IDX, i]; // 평가항목명
      SG_element.Cells[eITEMCONTENT_IDX, SG_element.RowCount-1] :=
          SG_HiddenData.Cells[dITEMCONTENT_IDX, i]; // 평가항목내용
      {SG_element.Cells[eSSCORE_IDX, SG_element.RowCount-1] :=
          SG_HiddenData.Cells[dSSCORE_IDX, i]; // 자기평가점수}
      SG_element.Cells[e1SCORE_IDX, SG_element.RowCount-1] :=
          SG_HiddenData.Cells[d1SCORE_IDX, i]; // 1차평가점수

      if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classs.Caption then // 등급s
        SG_class.Cells[sCLASSs_IDX, SG_class.RowCount-1] := SB_classs.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classa.Caption then // 등급a
        SG_class.Cells[sCLASSa_IDX, SG_class.RowCount-1] := SB_classa.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classb.Caption then // 등급b
        SG_class.Cells[sCLASSb_IDX, SG_class.RowCount-1] := SB_classb.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classc.Caption then // 등급c
        SG_class.Cells[sCLASSc_IDX, SG_class.RowCount-1] := SB_classc.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classd.Caption then // 등급d
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := SB_classd.Caption
      else
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := '';
    end;

  SG_element.SetFocus;
end;

function TFm_Sub2.IsDataModified: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
end;

procedure TFm_Sub2.Display_Sumup;
var
  i : Integer;
  sumscore : Double;
begin
  sumscore := 0;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do // 평가항목 갯수만큼
  begin
    if (SG_HiddenData.Cells[dSCORE_IDX, i] = '0') or (SG_HiddenData.Cells[dSCORE_IDX, i] = '') then continue;
    sumscore := sumscore + StrToFloat(SG_HiddenData.Cells[dSCORE_IDX, i]);
  end;

  if  sumscore > 0 then
    L_e2score.Caption := FloatToStr(sumscore); // 평가점수
end;

procedure TFm_Sub2.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if CB_name.Items.Count < 5 then
    CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5 then
    CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then
    CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then
    CB_name.DropDownCount := 20
  else
    CB_name.DropDownCount := CB_name.Items.Count + 1;
end;

{------------------------------버튼클릭---------------------------------}
procedure TFm_Sub2.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data;
  if LB_brchnm.Items.Count = 0 then
  begin
    MessageBox(handle,'등록된 평가요소가 하나도 없습니다','확 인',
               MB_OK or $0030 );
    System.Exit;
  end;

  LB_brchnm.ItemIndex := 0;
  LB_brchnmClick(Sender);
  SG_element.SetFocus;
end;

procedure TFm_Sub2.BB_ExitClick(Sender: TObject);
begin
{===============================================================================
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
   30.10      2000.07.11         윤형식          전2000-06-       메일에러시 메시지출력 제거, 닫기시 최종완료처리 by 하병수
===============================================================================}
  if (BB_Save.Visible) and
     (IsDataModified) then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if BB_confirm.Visible = True then
  begin
{    if MessageBox(handle,PChar('평가하신 내용은 현재 임시저장된 상태입니다.'+#13#13+
                               '평가결과를 확정하고'+#13#13+
                               '최종완료를 하시겠습니까?'), '확 인',
                  MB_YESNO or $0020) = IDYES then
      BB_SaveClick(BB_confirm)
    else}
      MainForm.Close;
  end;

  if BB_confirm.Visible = False then
    MainForm.Close;
end;

{------------------------------- Event ----------------------------------}
procedure TFm_Sub2.LB_brchnmClick(Sender: TObject);
begin
  if LB_brchnm.ItemIndex = -1 then
    System.Exit;
  showup_brchnm(IntToStr(Integer(LB_brchnm.Items.Objects[LB_brchnm.ItemIndex])));
end;

procedure TFm_Sub2.SG_elementDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
    SG_element.Canvas.Brush.Color := $00CFFBFC;
    SG_element.Canvas.Font.Color  := clBlack;
  end;

  SG_element.Canvas.FillRect(Rect); // cell의 영역을 그린다
  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if (Col = eITEMCONTENT_IDX) and // 평가항목내용
     (SG_element.RowCount > (SG_element.VisibleRowCount+SG_element.FixedRows)) then
    Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_element.Cells[Col,Row];
  DrawText(SG_element.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then
    System.Exit;
  if not SG_element.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_element.Row < SG_element.TopRow then // 현재 row 가 화면위에 있다
    SG_element.Row := SG_element.TopRow
  else if SG_element.Row > (SG_element.TopRow + SG_element.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_element.Row := SG_element.TopRow + SG_element.VisibleRowCount-1;

  SG_class.TopRow := SG_element.TopRow;
  SG_class.Row    := SG_element.Row;

  // 버튼의 top 위치를 계산
  P_ControlButton.Top := (SG_element.Row - SG_element.TopRow) * (SG_element.DefaultRowHeight + SG_element.GridLineWidth) + 2;
  // 점수를 버튼에 반영
  SB_classs.Down := False;
  SB_classa.Down := False;
  SB_classb.Down := False;
  SB_classc.Down := False;
  SB_classd.Down := False;
  if SB_classs.Caption = SG_HiddenData.Cells[dCLASS_IDX, // 배점(점수)
                                             SG_HiddenData.Tag+SG_element.Row] then
    SB_classs.Down := True
  else if SB_classa.Caption = SG_HiddenData.Cells[dCLASS_IDX,
                                                  SG_HiddenData.Tag+SG_element.Row] then
    SB_classa.Down := True
  else if SB_classb.Caption = SG_HiddenData.Cells[dCLASS_IDX,
                                                  SG_HiddenData.Tag+SG_element.Row] then
    SB_classb.Down := True
  else if SB_classc.Caption = SG_HiddenData.Cells[dCLASS_IDX,
                                                  SG_HiddenData.Tag+SG_element.Row] then
    SB_classc.Down := True
  else if SB_classd.Caption = SG_HiddenData.Cells[dCLASS_IDX,
                                                  SG_HiddenData.Tag+SG_element.Row] then
    SB_classd.Down := True;

  P_ControlButton.Visible := True;
end;

procedure TFm_Sub2.CB_empnoChange(Sender: TObject);
begin
  if CB_empno.ItemIndex < 0 then
    System.Exit;

  if IsDataModified then
  begin
    CB_empno.ItemIndex := giindex;
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.',
               '작업순서오류',MB_ICONWARNING);
    Exit;
  end;

  if Trim(Copy(CB_empno.Text, 1, Pos(' ', CB_empno.Text))) = '1차' then
  begin
    MainForm.var_EmpList := CB_empno.Text;
    MainForm.SubFormCreate('1차');
    Exit;
  end;

  BB_CancelClick(BB_Cancel);
end;

procedure TFm_Sub2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BB_Save.Visible) and
     (IsDataModified) then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장 또는 취소하세요.','작업순서오류',MB_ICONWARNING);
    CanClose := False;
    System.Exit;
  end;
  CanClose := True;
end;

procedure TFm_Sub2.CB_ShowClassClick(Sender: TObject);
begin
  SG_class.Refresh;
  SG_element.SetFocus;
end;

procedure TFm_Sub2.SG_elementExit(Sender: TObject);
begin
  P_ControlButton.Visible := False;
end;

procedure TFm_Sub2.SG_classDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if (SG_class.Cells[sCLASSs_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSa_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSb_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSc_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSd_IDX, Row] <> '') then
    SG_class.Canvas.Brush.Color := SG_class.Font.Color;

  if CB_ShowClass.Checked then // 등급을 보이게...
    SG_class.Canvas.Font.Color := SG_element.Font.Color
  else
    SG_class.Canvas.Font.Color := SG_class.Font.Color;

  SG_class.Canvas.FillRect(Rect); // cell의 영역을 그린다
  Rect.Top := Rect.Top + 30;
  A := SG_class.Cells[Col, Row];
  DrawText(SG_class.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_CENTER {or DT_VCENTER});
end;

procedure TFm_Sub2.SG_classEnter(Sender: TObject);
begin
  SG_element.SetFocus;
end;

procedure TFm_Sub2.SG_elementKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_element.Row = 0) and
     (LB_brchnm.ItemIndex > 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    LB_brchnm.ItemIndex := LB_brchnm.ItemIndex - 1;
    LB_brchnmClick(Sender);
    SG_element.Row := SG_element.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
     (SG_element.Row = SG_element.RowCount-1) and
     (LB_brchnm.ItemIndex < (LB_brchnm.Items.Count-1)) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    LB_brchnm.ItemIndex := LB_brchnm.ItemIndex + 1;
    LB_brchnmClick(Sender);
    SG_element.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFm_Sub2.SB_classsClick(Sender: TObject);
var
  i,cnt : Integer;
begin
  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있다
  if SG_HiddenData.Tag = -1 then
    System.Exit;

  if L_conyn.Caption = 'N' then
  begin
    MessageBox(handle,'1차평가점수등록이 완료되지 않은 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if not BB_Save.Visible then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료나 평가기간이 지난 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  // 버튼이 눌리면 점수반영
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dCLASS_IDX, // 등급
                        SG_HiddenData.Tag+SG_element.Row] := TSpeedButton(Sender).Caption;
    SG_HiddenData.Cells[dSCORE_IDX, // 등급
                        SG_HiddenData.Tag+SG_element.Row] := TSpeedButton(Sender).Hint;
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_element.Row] := 'Y'; // 자료 변동 여부

    SG_class.Cells[sCLASSs_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSa_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSb_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSc_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSd_IDX, SG_element.Row] := '';
    if SB_classs.Down then
      SG_class.Cells[sCLASSs_IDX, SG_element.Row] := SB_classs.Caption
    else if SB_classa.Down then
      SG_class.Cells[sCLASSa_IDX, SG_element.Row] := SB_classa.Caption
    else if SB_classb.Down then
      SG_class.Cells[sCLASSb_IDX, SG_element.Row] := SB_classb.Caption
    else if SB_classc.Down then
      SG_class.Cells[sCLASSc_IDX, SG_element.Row] := SB_classc.Caption
    else if SB_classd.Down then
      SG_class.Cells[sCLASSd_IDX, SG_element.Row] := SB_classd.Caption;
  end
  else
  begin
    SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row] := '';
    SG_HiddenData.Cells[dSCORE_IDX, // 등급
                        SG_HiddenData.Tag+SG_element.Row] := '0';
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_element.Row] := 'Y'; // 자료 변동 여부

    SG_class.Cells[sCLASSs_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSa_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSb_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSc_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSd_IDX, SG_element.Row] := '';
  end;

  cnt := 0;
  for i := 0 to SG_HiddenData.RowCount - 1 do
  begin
    if Trim(SG_HiddenData.Cells[dCLASS_IDX, i]) <> '' then
      cnt := cnt + 1;
  end;

  L_TotalComp.Caption := '총 '+IntToStr(SG_HiddenData.RowCount - 1)+'개의 평가항목중 '+
                         IntToStr(cnt)+'개를 등록하셨습니다';
  Display_Sumup;
end;

procedure TFm_Sub2.BB_SaveClick(Sender: TObject);
var
  i, j : Integer;
  ParamVariant: String;
  var_sysdate, lstotscore : String;
  lie1ratio, lie2ratio : Integer;
  lstBody     : TstringList;
begin
  {
  try
    if CDM.RemoteServer1.connected = False then
      CDM.RemoteServer1.connected := True;
  except
    begin
      Application.MessageBox('서버실행실패','에러',mb_ok);
      Exit;
    end;
  end;
  }
  SG_element.SetFocus;
  if var_e2conyn = 'Y' then // 1차평가완료여부
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if Sender = BB_save then
  begin
    if not IsDataModified then
    begin
      MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.','작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;
  end
  else
  begin
    if IsDataModified then
    begin
      MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;

    // 본인의 등급과 등급들이 일치하는것이 하나도 없다면 입력안할걸로 간주
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
      if (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classs.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classa.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classb.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classc.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classd.Caption) then
      begin
        MessageBox(handle,'아직 입력되지 않은 평가항목이 있습니다.  확인하세요','작업순서오류',MB_ICONWARNING);
        for j := 0 to LB_brchnm.Items.Count-1 do
          if SG_HiddenData.Cells[dBRCHSEQNO_IDX, i] = IntToStr(Integer(LB_brchnm.Items.Objects[j])) then
          begin
            LB_brchnm.ItemIndex := j;
            LB_brchnmClick(Sender);
            Break;
          end;
        for j := 0 to SG_element.RowCount-1 do
          if SG_HiddenData.Cells[dITEMNM_IDX, i] = SG_element.Cells[eITEMNM_IDX, j] then
          begin
            SG_element.Row := j;
            Break;
          end;
        System.Exit;
      end;

    if MessageBox(handle,PChar('최종완료를 하시면 등록하신 점수에 대해 수정하실 수 없습니다.'+#13+#13+
                               '등록하신 점수에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                               '최종완료를 하시겠습니까?'), '확 인',
                  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
      System.exit;
  end;
  Application.ProcessMessages;

  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
      Continue;

    ParamVariant := 'UPDATE PEMSPSCORE '+ // 1차평가
                    'SET '+
                    '  GRADE = '''+SG_HiddenData.Cells[dCLASS_IDX, i]+''', '+ // 등급
                    '  SCORE = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+''' '+ // 점수
                    'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                    '  AND EMPNO     = '''+var_empno+''' '+ // 피평가자사번
                    '  AND BRCSEQNO  = '''+SG_HiddenData.Cells[dBRCHSEQNO_IDX, i]+''' '+
                    '  AND ITEMSEQNO = '''+SG_HiddenData.Cells[dITEMSEQNO_IDX, i]+''' '+
                    '  AND EKIND     = ''2'' ';

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
      begin
//        result := False;
//        Exit;
      end;

  end;

  Display_Sumup; // 화면의 평가점수/등급을 구한다

  if Sender = BB_confirm then // 최종확인
  begin
    var_e2conyn := 'Y'; // 2차평가완료여부

    //ParamVariant := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D '+
    //                'FROM DUAL ' ;
    //CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
    //CDM.CDS_Gen.Open;
    var_sysdate :=  DataModule_Tmax.Tfunc_GetTime;  // CDM.CDS_Gen.FieldByName('D').AsString;
    {
    ParamVariant := 'SELECT NVL(VALUE3, 0) E1VALUE, NVL(VALUE4, 0) E2VALUE '+ // 평가마스터
                    '  FROM PEHSPBAS       '+
                    'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '; // 피평가자사번
    CDM.RemoteServer1.AppServer.Query_GenUPDATE(OLEVariant(ParamVariant));
    CDM.CDS_Gen.Open;
    }
ParamVariant :=  'SELECT  '+
'  nvl(  NVL(VALUE3, 0)   ,'' '') || '';'' ||   '+
'  nvl(  NVL(VALUE4, 0)   ,'' '') e2value   '+
'  FROM PEHSPBAS       '+
'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '; // 피평가자사번

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;

    lie1ratio := StrToInt(DataModule_Tmax.Csel_gfd(1)); //1차평가비중
    lie2ratio := StrToInt(DataModule_Tmax.Csel_gfd(2)); //2차평가비중
//    CDM.CDS_Gen.Close;

    //하향평가 총점 계산(각 평가에 대한 비중에 따라...)
    lstotscore := FloatToStr((StrToFloat(var_e1score) * lie1ratio + StrToFloat(L_e2score.Caption) * lie2ratio) / 100);

    ParamVariant := 'UPDATE PEMSPMAS '+ // 평가마스터
                    'SET E2CONYN   = ''Y'', '+
                    '    E2SCORE   = '''+L_e2score.Caption+''', '+ // 점수
                    '    TOTSCORE  = '''+lstotscore+''',  '+
                    '    WRITETIME = '''+var_sysdate+''', '+
                    '    WRITEEMP  = '''+Pempno+'''       '+
                    'WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                    '  AND EMPNO    = '''+var_empno+''' '; // 피평가자사번

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
      begin
//        result := False;
//        Exit;
      end;

  end;
//  CDM.CDS_Gen.Close;

  // 저장했으므로 변동여부는 all 'N'
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    SG_HiddenData.Cells[dMODIFIED_IDX, i] := 'N';

  if Sender = BB_save then
    MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0)
  else
  begin
    EmpnoAdd;
    CB_empno.ItemIndex := giindex;
    BB_CancelClick(BB_Cancel);
    MessageDlg('입력하신 평가자료를 최종 완료하였습니다.',mtInformation,[mbOk],0);
  end;
end;

end.
