unit PEF4020A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, cdPass, DBGrids, Db, DBClient,
  peoutlookbtn, pepaser,  Tmax_DataSetText, NotesHana_TLB;

type
  TFm_Sub1 = class(TForm)
    Shape11: TShape;
    Label1: TLabel;
    Label13: TLabel;
    L_eempno: TLabel;
    Label14: TLabel;
    CB_empno: TComboBox;
    Label23: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    L_classnms: TLabel;
    L_classnmb: TLabel;
    L_classnmc: TLabel;
    L_classnmd: TLabel;
    L_TotalComp: TLabel;
    L_classnma: TLabel;
    LB_clasname: TListBox;
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
    L_evconyn: TLabel;
    Label5: TLabel;
    L_score: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    M_Mark1: TMemo;
    Bevel1: TBevel;
    BB_confirm: TPeJeonOutLookBtn;
    BB_save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    BB_EXIT: TPeJeonOutLookBtn;
    SB_classe: TSpeedButton;
    Label4: TLabel;
    Label8: TLabel;
    L_munjang3: TLabel;
    L_munjang5: TLabel;
    L_munjang8: TLabel;
    L_dot: TLabel;
    Label9: TLabel;
    CDS_Gen: TTMaxDataSet;
    Bt_Confirm: TPeJeonOutLookBtn;
    Bt_can: TPeJeonOutLookBtn;
    procedure FormCreate(Sender: TObject);
    procedure BB_ExitClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure SG_elementDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure LB_clasnameClick(Sender: TObject);
    procedure SG_elementKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG_classDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_classEnter(Sender: TObject);
    procedure SB_classsClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure CB_empnoChange(Sender: TObject);
    procedure SG_elementExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CB_ShowClassClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Bt_canClick(Sender: TObject);
  private
    var_empno : String;  // 피평가자 사번

//    Inter    : ILotusNotes_Hana;

    procedure Send_Mail(stitle,Destempno, DestKorname, Body, gubun : string);
    procedure Read_PESPEDET;     // 피평가자 평가 내역 READ
    function  Check_Edit1 : Boolean;                 //입력 값 체크

    procedure EmpnoAdd;
    procedure Retrieve_Data;
    function  IsDataModified: Boolean;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    function  SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    function  Get_KoreanCharPos(letter: string; WishCnt: Integer): Integer;
    { Private declarations }
  public
    Pempno, Pkorname, Password, Ppermission, var_evconyn: string;
    giindex   : Integer;
    gbInsert  : Boolean;

    // 20050512 추가
    Pdeptcode : String;   // 부서코드
    E1Empno, E2Empno : String;   // 1차, 2차 평가자

    { Public declarations }
    procedure showup_clasname(clasno: String);
    procedure Display_Sumup;
    function ChangeStrToGrade(Str: string): string;
    function ChangeGradeToStr(Grade: string): string;

    // 2005.05.18
    procedure Check_E2empno;
  end;

const
  // SG_HiddenData 의 index
  dCLASNO_IDX      = 0; // 평가항목구분
  dITEMNO_IDX      = 1; // 평가항목번호
  dITEMNAME_IDX    = 2; // 평가항목명
  dITEMDESC_IDX    = 3; // 평가항목내용
  dCLASS_IDX       = 4; // 평가등급
  dSCORE_IDX       = 5; // 평가점수
  dSSCORE_IDX      = 6; // 자기평가점수
  dMODIFIED_IDX    = 7; // 자료변동 여부
  dWEIGHT_IDX      = 8; // 항목가중치

  // SG_element의 index
  eITEMNAME_IDX    = 0; // 평가항목명
  eITEMDESC_IDX    = 1; // 평가항목내용
  eSSCORE_IDX      = 2; // 자기평가점수

 // SG_score의 index
  sCLASSs_IDX  = 0; // 등급s
  sCLASSa_IDX  = 1; // 등급a
  sCLASSb_IDX  = 2; // 등급b
  sCLASSc_IDX  = 3; // 등급c
  sCLASSd_IDX  = 4; // 등급d
  sCLASSe_IDX  = 5; // 등급e

var
  Fm_Sub1: TFm_Sub1;
  Running: Boolean;
implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, pef4020a1;

{----------------------------------Form Open-----------------------------------}
// 메일 보네기
procedure TFm_Sub1.Send_Mail(sTitle,Destempno,DestKorname, Body, gubun: string);
//var
//  SqlText : string;
//  Ltime   : string;
begin
{
  try
    if not Assigned(Inter) then
    begin
      try
         Inter := CoLotusNotes_Hana.Create;
      except
         begin
            Inter := nil;
            System.Exit;
         end;
      end;

      try
         while not Inter.GetInstance do
      except
         begin
            if Assigned(Inter) then
               Inter := nil;
            Close;
            System.Exit;
         end;
      end;
    end;

//  노츠 메일
    Inter.SendFrom   := Pkorname+' '+Pempno;
    Inter.SendTo     := DestEmpno;
    Inter.SendToName := DestKorname;
    // 테스트 메일 발송
    //Inter.SendTo     := 'ZB09';
    //Inter.SendToName := '권형근';
    Inter.CorName    := 'HANARO';
    Inter.Subject    := sTitle;
    Inter.Body       := Body;
    Inter.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
  end;
  Application.ProcessMessages;

  MessageDlg('['+Bt_Confirm.Caption+']작업이 처리되었습니다.'+#13#13+
             '      ',mtInformation,[mbOK],0);
  }
end;



procedure TFm_Sub1.FormCreate(Sender: TObject);
begin
 Running := False;
end;

procedure TFm_Sub1.FormShow(Sender: TObject);
var
  ParamVariant: String;
begin
  if Running then System.Exit;
  Running := True;

  Pempno   := PassEmp(CmdLine, 1);
  Pkorname := PassEmp(CmdLine, 2);
  Password := PassEmp(CmdLine, 3);
  Ppermission := copy(PassEmp(CmdLine,4),1,1);

  EmpnoAdd;

  if CB_empno.Items.Count = 0 then
  begin
    MessageBox(handle,'접속하신 사원은 동료 또는 하향 평가권한이 없습니다.'+#13+#13+
                      '프로그램을 종료합니다.','대상자오류',MB_ICONWARNING);
    MainForm.Close;
    Exit;
  end;

  ParamVariant := 'SELECT NVL(TO_CHAR(VALUE1), ''0''), NVL(TO_CHAR(VALUE2), ''0''), '+
                  '       NVL(TO_CHAR(VALUE3), ''0''), NVL(TO_CHAR(VALUE4), ''0''), '+
                  '       NVL(TO_CHAR(VALUE5), ''0''), NVL(TO_CHAR(VALUE6), ''0'')  '+
                  '  FROM PESPEBAS                                    '+ // 평가기준
                  ' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+
                  '   AND GUBUN = ''20'' AND SGUBUN = ''0001''       ';

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF4020A_sel2';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('VALUE1', ftFloat, 10);
    AddField('VALUE2', ftFloat, 10);
    AddField('VALUE3', ftFloat, 10);
    AddField('VALUE4', ftFloat, 10);
    AddField('VALUE5', ftFloat, 10);
    AddField('VALUE6', ftFloat, 10);
    SQL.Text := ParamVariant;
    Open;
  end;

  SB_classs.Hint := CDS_Gen.FieldByName('VALUE1').AsString; if SB_classs.Hint = '' then SB_classs.Hint := '0';  // 배점s
  SB_classa.Hint := CDS_Gen.FieldByName('VALUE2').AsString; if SB_classa.Hint = '' then SB_classa.Hint := '0';  // 배점a
  SB_classb.Hint := CDS_Gen.FieldByName('VALUE3').AsString; if SB_classb.Hint = '' then SB_classb.Hint := '0';  // 배점b
  SB_classc.Hint := CDS_Gen.FieldByName('VALUE4').AsString; if SB_classc.Hint = '' then SB_classc.Hint := '0';  // 배점c
  SB_classd.Hint := CDS_Gen.FieldByName('VALUE5').AsString; if SB_classd.Hint = '' then SB_classd.Hint := '0';  // 배점d
  SB_classe.Hint := CDS_Gen.FieldByName('VALUE6').AsString; if SB_classe.Hint = '' then SB_classe.Hint := '0';  // 배점e
  CDS_Gen.Close;

  Application.ProcessMessages;

  BB_CancelClick(BB_Cancel);
end;

{------------------------------사용자정의 함수---------------------------------}
procedure TFm_Sub1.EmpnoAdd;
var
  ParamVariant: String;
begin
  L_eempno.Caption := Pkorname+' 님이 평가하실 피평가자는';
  CB_empno.Items.Clear;

  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT NVL(DECODE(T.GUBUN,''1'',''하향'',''0'',''동료'',''2'',''하향'',''몰라'')||''  ''||RPAD(M.KORNAME, 6, '' '')||''(''||T.EMPNO||'')''||''  ''||T.EVCONYN ,'' '') NAME '+
                  '  FROM PESPETOT T, PESPEMAS M                        ' +
                  ' WHERE T.RABASDATE = '''+MainForm.var_rabasdate+''' ' +
                  '   AND t.EEMPNO    = '''+Pempno+'''                 ' +
                  '   AND T.RABASDATE = M.RABASDATE                    ' +
                  '   AND T.EMPNO     = M.EMPNO                        ' +
                  '   AND M.EVALYN    = ''Y''                          ' +  //31.03 대상여부 체크 정규용 추가 (2004.11.18)
                  ' ORDER BY T.EMPNO                                   ' ;

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    While Not Eof do
    begin
      CB_empno.Items.Add(DataModule_Tmax.Csel_gfd(1));
      Next;
    end;
  end;
  CB_empno.ItemIndex := 0;
end;

procedure TFm_Sub1.Retrieve_Data;
var
  ParamVariant: String;
  i, j, cnt   : Integer;
  TempStr: String;
begin
  screen.Cursor := crHourGlass;
  giindex := CB_empno.Itemindex;
  //피평가자 사번 구하기..
  i := Pos(')', CB_empno.Text);
  var_empno := Copy(CB_empno.Text, i-4, 4); // 피평가자 사번



  //피평가자 부서코드 구하기..
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT DEPTCODE FROM PESPEMAS                                  '+ // 평가요소
                  ' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                  '   AND EMPNO     = '''+var_empno+'''   ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  DataModule_Tmax.TMaxDataSet_HInsa.Open;
  Pdeptcode := DataModule_Tmax.Csel_gfd(1); // 부서코드
  DataModule_Tmax.TMaxDataSet_HInsa.Close;


  // 평가요소를 구한다
  LB_clasname.Items.Clear;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
  ParamVariant := 'SELECT NVL(TO_CHAR(CLASNO), ''0'') || '';'' || NVL(CLASNAME, '' '') '+
                  '  FROM PESPECLAS                                  '+ // 평가요소
                  ' WHERE RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
//                  '   AND gubun     = '''+MainForm.Pgubun+'''        '+ //
                  ' ORDER BY CLASNO                                  ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
    LB_clasname.Items.AddObject(DataModule_Tmax.Csel_gfd(2), // 평가요소명
                                TObject( StrToInt(DataModule_Tmax.Csel_gfd(1)) )); // 평가요소번호
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;

  // StringGrid 초기화
  for i := SG_HiddenData.FixedCols to SG_HiddenData.ColCount - 1 do
    for j := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  SG_HiddenData.RowCount := 2;


  // 20050512 수정
//  if MainForm.Pgubun = '1' then
  if MainForm.var_gsEvcno = '1' then
     // 평가항목과 피평가자의 평가점수를 읽어온다
     ParamVariant := 'SELECT NVL(B.EMPNO, '' ''),        '+
                     '       NVL(TO_CHAR(A.CLASNO), ''0''), NVL(TO_CHAR(A.ITEMNO), ''0''),           '+
                     '       NVL(A.ITEMNAME, '' ''), NVL(A.ITEMDESC, '' ''), NVL(B.EVGRADE , '' ''), '+
                     '       NVL(TO_CHAR(B.EVSCORE), ''0''), NVL(TO_CHAR(A.WEIGHT), ''0'')           '+
                     '  FROM PESPEITEM A, PESPEDET B                       '+ // 평가항목, 자기평가
                     ' WHERE A.RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                     '   AND B.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '   AND B.EEMPNO(+) = '''+pempno+'''                 '+ // 평가자사번
                     '   AND A.RABASDATE = B.RABASDATE (+)                '+
                     '   AND A.CLASNO    = B.CLASNO    (+)                '+
                     '   AND A.ITEMNO    = B.ITEMNO    (+)                '+
                     ' ORDER BY A.CLASNO, A.ITEMNO                       '

//  else if MainForm.Pgubun = '2' then
  else if MainForm.var_gsEvcno = '2' then
     // 평가항목과 피평가자의 평가점수를 읽어온다
     ParamVariant := 'SELECT NVL(B.EMPNO, '' ''), '+
                     '       NVL(TO_CHAR(A.CLASNO), ''0''), '+
                     '       NVL(TO_CHAR(A.ITEMNO), ''0''), '+
                     '       NVL(A.ITEMNAME, '' ''), '+
                     '       NVL(A.ITEMDESC, '' ''), '+
                     '       NVL(B.EVGRADE , '' ''), '+
                     '       NVL(TO_CHAR(B.EVSCORE), ''0''), '+
                     '       NVL(TO_CHAR(A.WEIGHT ), ''0'')  '+
                     'FROM PESPEITEM A, PESPEDET B                       '+ // 평가항목, 자기평가
                     'WHERE A.RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                     '  AND b.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '  AND B.EEMPNO(+) = '''+MainForm.Peempno+'''       '+ // 평가자사번
                     '  AND A.RABASDATE = B.RABASDATE (+)                '+
                     '  AND A.CLASNO    = B.CLASNO    (+)                '+
                     '  AND A.ITEMNO    = B.ITEMNO    (+)                '+
                     'ORDER BY  A.CLASNO, A.ITEMNO                       '

  else
     // 평가항목과 피평가자의 평가점수를 읽어온다
     ParamVariant := 'SELECT NVL(B.EMPNO, '' ''), '+
                     '       NVL(TO_CHAR(A.CLASNO), ''0''), '+
                     '       NVL(TO_CHAR(A.ITEMNO), ''0''), '+
                     '       NVL(A.ITEMNAME, '' ''), '+
                     '       NVL(A.ITEMDESC, '' ''), '+
                     '       NVL(B.EVGRADE , '' ''), '+
                     '       NVL(TO_CHAR(B.EVSCORE), ''0''), '+
                     '       NVL(TO_CHAR(A.WEIGHT ), ''0'')  '+
                     'FROM PESPEITEM A, PESPEDET B                       '+ // 평가항목, 자기평가
                     'WHERE A.RABASDATE = '''+MainForm.var_rabasdate+''' '+ // 평가기준일
                     '  AND b.EMPNO (+) = '''+var_empno+'''              '+ // 피평가자사번
                     '  AND B.EEMPNO(+) = '''+MainForm.Peempno+'''       '+ // 평가자사번
                     '  AND A.RABASDATE = B.RABASDATE (+)                '+
                     '  AND A.CLASNO    = B.CLASNO    (+)                '+
                     '  AND A.ITEMNO    = B.ITEMNO    (+)                '+
                     'ORDER BY  A.CLASNO, A.ITEMNO                       ';

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF4020A_sel1';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EMPNO'        , ftString,  4   );
//    AddField('EVCNO'        , ftFloat ,  2   );
    AddField('CLASNO'       , ftFloat ,  2   );
    AddField('ITEMNO'       , ftFloat ,  2   );
    AddField('ITEMNAME'     , ftString,  30  );
    AddField('ITEMDESC'     , ftString,  200 );
    AddField('EVGRADE'      , ftString,  1   );
    AddField('EVSCORE'      , ftFloat ,  8   );
    AddField('WEIGHT'       , ftFloat ,  7   );
    SQL.Text := ParamVariant;
    Open;
  end;

  while not CDS_Gen.Eof do
  begin
    if SG_HiddenData.Cells[dCLASNO_IDX, SG_HiddenData.RowCount-1] <> '' then
      SG_HiddenData.RowCount := SG_HiddenData.RowCount + 1;
    SG_HiddenData.Cells[dCLASNO_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('clasno').AsString; // 평가요소번호
    SG_HiddenData.Cells[dITEMNO_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemno').AsString; // 평가항목번호
    SG_HiddenData.Cells[dITEMNAME_IDX, SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemname').AsString; // 평가항목명
    SG_HiddenData.Cells[dITEMDESC_IDX, SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('itemdesc').AsString; // 평가항목내용
    SG_HiddenData.Cells[dCLASS_IDX   , SG_HiddenData.RowCount-1] := ChangeGradeToStr(CDS_Gen.FieldByName('evgrade').AsString); // 평가등급
    if Trim(CDS_Gen.FieldByName('evscore').AsString) = '' then
      SG_HiddenData.Cells[dSCORE_IDX , SG_HiddenData.RowCount-1] := '0'
    else
      SG_HiddenData.Cells[dSCORE_IDX   , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('evscore').AsString; // 평가점수
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.RowCount-1] := 'N'; // 자료 변동 여부
    SG_HiddenData.Cells[dWEIGHT_IDX  , SG_HiddenData.RowCount-1] := CDS_Gen.FieldByName('weight').AsString; // 평가등급

    if trim(CDS_Gen.FieldByName('EMPNO').AsString) = '' then
        gbInsert := True
    else
        gbInsert := False;
    CDS_Gen.Next;
  end;

  CDS_Gen.Close;

  Display_Sumup;

  // 20050512 수정
//  if MainForm.Pgubun = '1' then
  if MainForm.var_gsEvcno = '1' then
     ParamVariant := 'SELECT NVL(        EVCONYN           ,'' ''),         '+
                     '       NVL(TO_CHAR(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       NVL(        MARK1             ,'' ''),         '+
                     '       NVL(        MARK2             ,'' ''),         '+
                     '       NVL(        MARK3             ,'' '')          '+
                     ' FROM PESPETOT                                        '+
                     ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''     '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+pempno+'''                     '  // 평가자사번

//  else if MainForm.Pgubun = '2' then
  else if MainForm.var_gsEvcno = '2' then
     ParamVariant := 'SELECT NVL(        EVCONYN           ,'' ''),         '+
                     '       NVL(TO_CHAR(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       NVL(        MARK1             ,'' ''),         '+
                     '       NVL(        MARK2             ,'' ''),         '+
                     '       NVL(        MARK3             ,'' '')          '+
                     ' FROM PESPETOT                                        '+
                     ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''     '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+MainForm.Peempno+'''           ' // 평가자사번

  else
     ParamVariant := 'SELECT NVL(        EVCONYN           ,'' ''),         '+
                     '       NVL(TO_CHAR(NVL(EVSCORE, 0)  ),''0'') EVSCORE, '+
                     '       NVL(        MARK1             ,'' ''),         '+
                     '       NVL(        MARK2             ,'' ''),         '+
                     '       NVL(        MARK3             ,'' '')          '+
                     ' FROM PESPETOT                                        '+
                     ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''     '+ // 평가기준일
                     '   AND EMPNO     = '''+var_empno+'''                  '+ // 피평가자사번
                     '   AND EEMPNO    = '''+MainForm.Peempno+'''           '; // 평가자사번

  With CDS_Gen do begin
    Close;
    ServiceName := 'PEF3020A_sel3';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EVCONYN'        , ftString,  1   );
    AddField('EVSCORE'        , ftFloat ,  8   );
    AddField('MARK1'          , ftString,  300 );
    AddField('MARK2'          , ftString,  300 );
    AddField('MARK3'          , ftString,  300 );
    SQL.Text := ParamVariant;
    Open;
  end;

  if CDS_Gen.FieldByName('EVCONYN').AsString = 'N' then
    L_evconyn.Font.Color := clRed
  else L_evconyn.Font.Color := clBlue;
  L_evconyn.Caption := CDS_Gen.FieldByName('EVCONYN').AsString;
  L_score.Caption   := CDS_Gen.FieldByName('EVSCORE').AsString;

  M_Mark1.Clear;
  M_Mark1.SelStart := 0;
  M_Mark1.Perform(EM_SCROLLCARET, 0, 0);

  TempStr := CDS_Gen.FieldByName('MARK1').AsString
            +CDS_Gen.FieldByName('MARK2').AsString
            +CDS_Gen.FieldByName('MARK3').AsString;
  if TempStr <> '' then
    while Pos(#10#10, TempStr) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
      TempStr := SearchAndReplace(TempStr, #10#10, #13#10);
  M_Mark1.Text := TempStr;

  CDS_Gen.Close;

//  if MainForm.Peempno = pempno then
     Check_E2empno;

  if (L_evconyn.Caption = 'Y') then        // 최종완료 = 'Y'
  begin
    BB_save   .Visible := False;
    BB_Cancel .Visible := False;
    BB_confirm.Visible := False;
    M_Mark1.ReadOnly   := True;
    M_Mark1.Color      := $00E6E6E6;
    P_ControlButton.Visible := False;
  end
  else
  begin
    if MainForm.var_gsEvcno = '2' then   // 2차 평가자
//    if E2EmpCnt = '' then                  // 작업자가 최종평가자냐
    begin
       BB_save   .Visible := False;
       BB_Cancel .Visible := False;
       BB_confirm.Visible := True;
       M_Mark1.ReadOnly   := True;
       M_Mark1.Color      := $00E6E6E6;
       P_ControlButton.Visible := False;
    end
    else if E2Empno = '' then      // 1차 평가자가 최종평가자일 경우
//    else if pempno = E2EmpCnt then         // 작업자가 최종평가자가 아니냐
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := True;
       M_Mark1.ReadOnly   := False;
       M_Mark1.Color      := clWhite;
       P_ControlButton.Visible := True;
    end
    else                                   // 작업자가 최종평가자가 아니냐
    begin
       BB_save   .Visible := True;
       BB_Cancel .Visible := True;
       BB_confirm.Visible := False;
       M_Mark1.ReadOnly   := False;
       M_Mark1.Color      := clWhite;
       P_ControlButton.Visible := True;
    end;

    if MainForm.var_gsevcno = '0' then // 동료평가이면
    begin
      M_Mark1.ReadOnly   := True;
      M_Mark1.Color      := $00E6E6E6;
      {
      if L_evconyn.Caption = 'Y' then
         BB_confirm.Visible := False
      else
         BB_confirm.Visible := True;
      }
    end
    else
    begin
      if MainForm.var_gsEvcno = '2' then
      begin
         M_Mark1.ReadOnly   := True;
         M_Mark1.Color      := $00E6E6E6;
      end
      else
      begin
         M_Mark1.ReadOnly   := False;
         M_Mark1.Color      := clWhite;
      end;

      {
      if E2EmpCnt = '' then
      begin
         M_Mark1.ReadOnly   := True;
         M_Mark1.Color      := $00E6E6E6;
      end
      else
      begin
         M_Mark1.ReadOnly   := False;
         M_Mark1.Color      := clWhite;
      end;
      }
    end;
  end;

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

procedure TFm_Sub1.showup_clasname(clasno: String);
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
  begin
    if SG_HiddenData.Cells[dCLASNO_IDX, i] = clasno then
    begin
      if SG_HiddenData.Tag = -1 then
        SG_HiddenData.Tag := i; // SG_HiddenData.Tag 에 현재 평가요소의 시작 index를 저장한다

      if SG_element.Cells[SG_element.FixedCols, SG_element.RowCount-1] <> '' then
      begin
        SG_element.RowCount := SG_element.RowCount + 1;
        SG_class.RowCount   := SG_class.RowCount + 1;
      end;

      SG_element.Cells[eITEMNAME_IDX, SG_element.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i]; // 평가항목명
      SG_element.Cells[eITEMDESC_IDX, SG_element.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i]; // 평가항목내용
      SG_element.Cells[eSSCORE_IDX,   SG_element.RowCount-1] := SG_HiddenData.Cells[dSSCORE_IDX, i]; // 자기평가점수

      if SG_HiddenData.Cells[dCLASS_IDX, i] =  SB_classs.Caption then // 등급s
        SG_class.Cells[sCLASSs_IDX, SG_class.RowCount-1] := SB_classs.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classa.Caption then // 등급a
        SG_class.Cells[sCLASSa_IDX, SG_class.RowCount-1] := SB_classa.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classb.Caption then // 등급b
        SG_class.Cells[sCLASSb_IDX, SG_class.RowCount-1] := SB_classb.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classc.Caption then // 등급c
        SG_class.Cells[sCLASSc_IDX, SG_class.RowCount-1] := SB_classc.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classd.Caption then // 등급d
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := SB_classd.Caption
      else if SG_HiddenData.Cells[dCLASS_IDX, i] = SB_classe.Caption then // 등급e
        SG_class.Cells[sCLASSe_IDX, SG_class.RowCount-1] := SB_classe.Caption
      else
        SG_class.Cells[sCLASSd_IDX, SG_class.RowCount-1] := '';
    end;
  end;

  SG_element.SetFocus;
end;

function TFm_Sub1.IsDataModified: Boolean;
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

  if M_Mark1.Modified then // 의견1
    Result := True
end;

procedure TFm_Sub1.Display_Sumup;
var
  i : Integer;
  sumscore : Double;
begin
  sumscore := 0;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do // 평가항목 갯수만큼
  begin
    if SG_HiddenData.Cells[dSCORE_IDX, i] = '0' then continue;
    sumscore := sumscore + StrToFloat(SG_HiddenData.Cells[dSCORE_IDX, i]);
  end;
  L_score.Caption := FloatToStr(sumscore); // 평가점수
end;

procedure TFm_Sub1.Adjust_DropDownRows(CB_name: TComboBox);
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

{------------------------------- Button Click ----------------------------------}
procedure TFm_Sub1.BB_saveClick(Sender: TObject);
var
  i, j, iCnt, iIndex : Integer;
  ParamVariant: String;
  lstBody     : TstringList;
  TempStr: String;
  sMark : array[1..3] of String;
begin
  SG_element.SetFocus;
  if L_evconyn.Caption = 'Y' then // 1차평가완료여부
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


{-------------------------------------------------------------------------------
    Version  date(yyyy.mm.dd) programmer  description       relevant doc.no
    31.01    2001.05.25       윤형식      전화2001.         평가표번호 3 추가 -- 총무팀장의 하향평가(비서등)
-------------------------------------------------------------------------------}
//    if (MainForm.var_gsevcno = '1') and (trim(M_Mark1.Text) = '') then // 하향평가의 경우 종합의견은 필수항목
    if (MainForm.var_gsevcno <> '0') and (trim(M_Mark1.Text) = '') then // 하향평가의 경우 종합의견은 필수항목
    begin
      MessageBox(handle,'종합의견이 없습니다. 종합의견사항은 필수입력 사항입니다.','필수항목오류',MB_ICONWARNING);
      System.Exit;
    end;

    // 본인의 등급과 등급들이 일치하는것이 하나도 없다면 입력안할걸로 간주
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
      if (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classs.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classa.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classb.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classc.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classd.Caption) and
         (SG_HiddenData.Cells[dCLASS_IDX, i] <> SB_classe.Caption) then
      begin
        MessageBox(handle,'아직 입력되지 않은 평가항목이 있습니다.  확인하세요','작업순서오류',MB_ICONWARNING);
        for j := 0 to LB_clasname.Items.Count-1 do
          if SG_HiddenData.Cells[dCLASNO_IDX, i] = IntToStr(Integer(LB_clasname.Items.Objects[j])) then
          begin
            LB_clasname.ItemIndex := j;
            LB_clasnameClick(Sender);
            Break;
          end;
        for j := 0 to SG_element.RowCount-1 do
          if SG_HiddenData.Cells[dITEMNAME_IDX, i] = SG_element.Cells[eITEMNAME_IDX, j] then
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

  if not gbInsert then // insert
  begin
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    begin
      if SG_HiddenData.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
         Continue;

//      if MainForm.Pgubun = '1' then
      if MainForm.var_gsEvcno = '1' then
         ParamVariant := 'UPDATE PESPEDET                                                                  '+ // 1차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                                '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+pempno+'''                                                '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   '
//      else if MainForm.Pgubun = '2' then
      else if MainForm.var_gsEvcno = '2' then
         ParamVariant := 'UPDATE PESPEDET                                                                  '+ // 1차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                                '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+MainForm.Peempno+'''                                      '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   '
      else
         ParamVariant := 'UPDATE PESPEDET                                                                  '+ // 1차평가
                         '   SET EVGRADE   = '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i])+''', '+ // 등급
                         '       EVSCORE   = '''+SG_HiddenData.Cells[dSCORE_IDX, i]+'''                    '+ // 점수
                         ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                                '+ // 평가기준일
                         '   AND EMPNO     = '''+var_empno+'''                                             '+ // 피평가자사번
                         '   AND EEMPNO    = '''+MainForm.Peempno+'''                                      '+
                         '   AND CLASNO    = '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+'''                   '+
                         '   AND ITEMNO    = '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+'''                   ';

      DataModule_Tmax.Cupd_SQL := ParamVariant;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
        begin
//          result := False;
//          Exit;
        end;

    end;
  end
  else
  begin
    for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    begin
      //if SG_HiddenData.Cells[dMODIFIED_IDX, i] <> 'Y' then // 자료변동 여부
      //  Continue;

//      if MainForm.Pgubun = '1' then
      if MainForm.var_gsEvcno = '1' then
         ParamVariant := 'INSERT INTO PESPEDET                                               '+
                         '  (RABASDATE,                                                      '+
                         '   EMPNO    ,                                                      '+
                         '   EEMPNO   ,                                                      '+
                         '   CLASNO   ,                                                      '+
                         '   ITEMNO   ,                                                      '+
                         '   EVGRADE  ,                                                      '+
                         '   EVSCORE)                                                        '+
                         'VALUES                                                             '+
                         '  ('''+MainForm.var_rabasdate+'''             ,                    '+
                         '   '''+var_empno+'''                          ,                    '+ // 피평가자사번
                         '   '''+pempno+'''                             ,                    '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',                    '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',                    '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')                    '  // 점수
//      else if MainForm.Pgubun = '2' then
      else if MainForm.var_gsEvcno = '2' then
         ParamVariant := 'INSERT INTO PESPEDET                                               '+
                         '  (RABASDATE,                                                      '+
                         '   EMPNO    ,                                                      '+
                         '   EEMPNO   ,                                                      '+
                         '   CLASNO   ,                                                      '+
                         '   ITEMNO   ,                                                      '+
                         '   EVGRADE  ,                                                      '+
                         '   EVSCORE)                                                        '+
                         'VALUES                                                             '+
                         '  ('''+MainForm.var_rabasdate+'''             ,                    '+
                         '   '''+var_empno+'''                          ,                    '+ // 피평가자사번
                         '   '''+MainForm.Peempno+'''                   ,                    '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',                    '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',                    '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')                    '  // 점수
      else
         ParamVariant := 'INSERT INTO PESPEDET                                               '+
                         '  (RABASDATE,                                                      '+
                         '   EMPNO    ,                                                      '+
                         '   EEMPNO   ,                                                      '+
                         '   CLASNO   ,                                                      '+
                         '   ITEMNO   ,                                                      '+
                         '   EVGRADE  ,                                                      '+
                         '   EVSCORE)                                                        '+
                         'VALUES                                                             '+
                         '  ('''+MainForm.var_rabasdate+'''             ,                    '+
                         '   '''+var_empno+'''                          ,                    '+ // 피평가자사번
                         '   '''+MainForm.Peempno+'''                   ,                    '+
                         '   '''+SG_HiddenData.Cells[dCLASNO_IDX, i]+''',                    '+
                         '   '''+SG_HiddenData.Cells[dITEMNO_IDX, i]+''',                    '+
                         '   '''+ChangeStrToGrade(SG_HiddenData.Cells[dCLASS_IDX, i]) +''',  '+ // 등급
                         '   '''+SG_HiddenData.Cells[dSCORE_IDX, i] +''')                    '; // 점수

      DataModule_Tmax.Cupd_SQL := ParamVariant;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
        begin
//          result := False;
//          Exit;
        end;

    end;
  end;

  // 주소를 분리
  if M_Mark1.Modified then
  begin
    for iIndex := 1 downto 3 do
        sMark[iIndex] := '';

    iIndex := 1; iCnt := 1;
    TempStr := M_Mark1.Text;
    while (iCnt > -1) and (iIndex < 4) do
    begin
        iCnt := Get_KoreanCharPos(TempStr, 300);
        if iCnt > -1 then
        begin
            sMark[iIndex] := copy(TempStr,1,iCnt);
            TempStr       := copy(TempStr,iCnt+1,length(TempStr)-iCnt);
        end
        else
        begin
            sMark[iIndex] := TempStr;
            TempStr       := '';
        end;
        inc(iIndex);
    end;
    TempStr := '       mark1     = '''+sMark[1]+'''    ,          ' +
               '       mark2     = '''+sMark[2]+'''    ,          ' +
               '       mark3     = '''+sMark[3]+'''    ,          ' ;
  end
  else
    TempStr := '';

//  if MainForm.Pgubun = '1' then
  if MainForm.var_gsEvcno = '1' then
     ParamVariant := 'UPDATE peSPEtot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr                                                      +
                     '       writeemp  = '''+Pempno+'''         ,               ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+MainForm.var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+Pempno+'''                         '
//  else if MainForm.Pgubun = '2' then
  else if MainForm.var_gsEvcno = '2' then
     ParamVariant := 'UPDATE peSPEtot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr                                                      +
                     '       writeemp  = '''+Pempno+'''         ,                 ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+MainForm.var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+MainForm.Peempno+'''               '
  else
     ParamVariant := 'UPDATE peSPEtot                                           ' +
                     '   SET EVSCORE   = '''+L_score.Caption+''',               ' + // 점수
                     TempStr                                                      +
                     '       writeemp  = '''+Pempno+'''         ,                 ' +
                     '       writetime = to_char(sysdate,''YYYYMMDDHH24MISSD'') ' +
                     ' WHERE rabasdate = '''+MainForm.var_rabasdate+'''         ' +
                     '   AND empno     = '''+var_empno+'''                      ' +
                     '   AND eempno    = '''+MainForm.Peempno+'''               ' ;

  DataModule_Tmax.Cupd_SQL := ParamVariant;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
    begin
//      result := False;
//      Exit;
    end;

  Display_Sumup; // 화면의 평가점수/등급을 구한다

  if Sender = BB_confirm then // 최종확인
  begin
    var_evconyn := 'Y'; // 1차평가완료여부

//    if MainForm.Pgubun = '1' then
    if MainForm.var_gsEvcno = '1' then
       ParamVariant := 'UPDATE PESPETOT                                            '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                                  '+
                       '       EVSCORE   = '''+L_score.Caption+''',                '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                          '+
                       ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''          '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                       '+ // 피평가자사번
                       '   AND EEMPNO    = '''+pempno+'''                          '  // 평가자사번
    else if MainForm.var_gsEvcno = '2' then
       ParamVariant := 'UPDATE PESPETOT                                            '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                                  '+
                       '       EVSCORE   = '''+L_score.Caption+''',                '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                          '+
                       ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''          '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                       '+ // 피평가자사번
                       '   AND EEMPNO    = '''+MainForm.Peempno+'''                '  // 평가자사번
    else
       ParamVariant := 'UPDATE PESPETOT                                            '+ // 평가마스터
                       '   SET EVCONYN   = ''Y'',                                  '+
                       '       EVSCORE   = '''+L_score.Caption+''',                '+ // 점수
                       '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD''), '+
                       '       WRITEEMP  = '''+Pempno+'''                          '+
                       ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''          '+ // 평가기준일
                       '   AND EMPNO     = '''+var_empno+'''                       '+ // 피평가자사번
                       '   AND EEMPNO    = '''+MainForm.Peempno+'''                '; // 평가자사번

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
      begin
//        result := False;
//        Exit;
      end;

  end;

  // 저장했으므로 변동여부는 all 'N'
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
    SG_HiddenData.Cells[dMODIFIED_IDX, i] := 'N';

  // 저장했으므로 입력여부는 False
  gbInsert := False;
  M_Mark1.Modified := False;

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

procedure TFm_Sub1.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data;

  if LB_clasname.Items.Count = 0 then
  begin
    MessageBox(handle,'등록된 평가요소가 하나도 없습니다','확 인',
               MB_OK or $0030 );
    System.Exit;
  end;

  LB_clasname.ItemIndex := 0;
  LB_clasnameClick(Sender);
  SG_element.SetFocus;
end;

procedure TFm_Sub1.BB_ExitClick(Sender: TObject);
begin
  if IsDataModified then
  begin
      if MessageBox(handle,PChar('수정된 자료가 있습니다. 변경된 자료를 저장하시겠습니까?'), '확 인',
                    MB_YESNO or MB_DEFBUTTON2) <> IDYES then
      mainform.close
      else BB_saveClick(BB_SAVE);
  end;
  MainForm.Close;
end;

{------------------------------- Event ----------------------------------}
procedure TFm_Sub1.LB_clasnameClick(Sender: TObject);
begin
  if LB_clasname.ItemIndex = -1 then
     System.Exit;

  showup_clasname(IntToStr(Integer(LB_clasname.Items.Objects[LB_clasname.ItemIndex])));
end;

procedure TFm_Sub1.SG_elementDrawCell(Sender: TObject; Col, Row: Integer;
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
  if (Col = eITEMDESc_IDX) and // 평가항목내용
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
  SB_classe.Down := False;

  SB_classs.Down := (SB_classs.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classa.Down := (SB_classa.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classb.Down := (SB_classb.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classc.Down := (SB_classc.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classd.Down := (SB_classd.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);
  SB_classe.Down := (SB_classe.Caption = SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row]);

//  if E2Empno = '' then                  // 작업자가 최종평가자냐
  if MainForm.var_gsEvcno = '2' then                  // 작업자가 최종평가자냐
     P_ControlButton.Visible := False
  else
     P_ControlButton.Visible := True;
end;

procedure TFm_Sub1.SG_elementExit(Sender: TObject);
begin
  P_ControlButton.Visible := False;
end;

procedure TFm_Sub1.SB_classsClick(Sender: TObject);
var
  i,cnt        : Integer;
  btn_Caption  : String;  // 정규용 추가
begin
  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있다
  if SG_HiddenData.Tag = -1 then
    System.Exit;

  //if L_conyn.Caption = 'N' then
  //begin
  //  MessageBox(handle,'자기평가점수등록이 완료되지 않은 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
  //  System.Exit;
  //end;

  if not BB_Save.Visible then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료나 평가기간이 지난 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  // 버튼이 눌리면 점수반영
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dCLASS_IDX, SG_HiddenData.Tag+SG_element.Row] := TSpeedButton(Sender).Caption;
    //SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_element.Row] := TSpeedButton(Sender).Hint;
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_element.Row] :=
       floattostr(strtofloat(SG_HiddenData.Cells[dWEIGHT_IDX, SG_HiddenData.Tag+SG_element.Row]) * strtofloat(TSpeedButton(Sender).Hint));
    SG_HiddenData.Cells[dMODIFIED_IDX,SG_HiddenData.Tag+SG_element.Row] := 'Y'; // 자료 변동 여부

    SG_class.Cells[sCLASSs_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSa_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSb_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSc_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSd_IDX, SG_element.Row] := '';
    SG_class.Cells[sCLASSe_IDX, SG_element.Row] := '';
    if SB_classs.Down then
      SG_class.Cells[sCLASSs_IDX, SG_element.Row] := SB_classs.Caption
    else if SB_classa.Down then
      SG_class.Cells[sCLASSa_IDX, SG_element.Row] := SB_classa.Caption
    else if SB_classb.Down then
      SG_class.Cells[sCLASSb_IDX, SG_element.Row] := SB_classb.Caption
    else if SB_classc.Down then
      SG_class.Cells[sCLASSc_IDX, SG_element.Row] := SB_classc.Caption
    else if SB_classd.Down then
      SG_class.Cells[sCLASSd_IDX, SG_element.Row] := SB_classd.Caption
    else if SB_classe.Down then
      SG_class.Cells[sCLASSe_IDX, SG_element.Row] := SB_classe.Caption;
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

procedure TFm_Sub1.SG_classDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if (SG_class.Cells[sCLASSs_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSa_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSb_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSc_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSd_IDX, Row] <> '') or
     (SG_class.Cells[sCLASSe_IDX, Row] <> '') then
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

procedure TFm_Sub1.SG_classEnter(Sender: TObject);
begin
  SG_element.SetFocus;
end;

procedure TFm_Sub1.SG_elementKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_element.Row = 0) and
     (LB_clasname.ItemIndex > 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    LB_clasname.ItemIndex := LB_clasname.ItemIndex - 1;
    LB_clasnameClick(Sender);
    SG_element.Row := SG_element.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
     (SG_element.Row = SG_element.RowCount-1) and
     (LB_clasname.ItemIndex < (LB_clasname.Items.Count-1)) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    LB_clasname.ItemIndex := LB_clasname.ItemIndex + 1;
    LB_clasnameClick(Sender);
    SG_element.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFm_Sub1.CB_empnoChange(Sender: TObject);
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

  BB_CancelClick(BB_Cancel);
end;

procedure TFm_Sub1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFm_Sub1.CB_ShowClassClick(Sender: TObject);
begin
  SG_class.Refresh;
  SG_element.SetFocus;
end;

function TFm_Sub1.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,
  nLenLookFor : integer;
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

function TFm_Sub1.Get_KoreanCharPos(letter: string; WishCnt: Integer): Integer;
var
  i, k, msb: integer;
begin
  if System.Length(letter) < WishCnt then
  begin
    Get_KoreanCharPos := -1;
    System.Exit;
  end;

  msb := 0;
  for i := 1 to WishCnt do
    if (Integer(letter[i]) and Integer($80)) = Integer($80) then
      Inc(msb);

  if (msb mod 2) = 0 then {'$80'인것이 짝수개이면 완성된 한글문장}
    Get_KoreanCharPos := WishCnt
  else
    Get_KoreanCharPos := WishCnt - 1;
end;

function TFm_Sub1.ChangeStrToGrade(Str: String):String;
begin
  Result := '';
  if Str = '탁월' then
    Result := 'S'
  else if Str = '우수' then
    Result := 'A'
  else if Str ='보통' then
    Result := 'B'
  else if Str ='미흡' then
    Result := 'C'
  else if Str ='저조' then
    Result := 'D'
  else if Str ='불량' then
    Result := 'E';
end;

function TFm_sub1.ChangeGradeToStr(Grade: string):String;
begin
  Result := '';
  if Grade = 'S' then
    Result := '탁월'
  else if Grade = 'A' then
    Result := '우수'
  else if Grade ='B' then
    Result := '보통'
  else if Grade ='C' then
    Result := '미흡'
  else if Grade ='D' then
    Result := '저조'
  else if Grade ='E' then
    Result := '불량';
end;


// 결제 또는 결제상신
procedure TFm_Sub1.Bt_ConfirmClick(Sender: TObject);
{
var
  Lgubun     : integer;
  Param      : OleVariant;
  Save       : integer;    // 내역보관 유,무,이력보관(0, 1, 2)
  Msg        : string;
  DbSet      : TDataSet;
  ToMail     : string;
  detail_cnt :integer;
  sendtime   : String;
}
begin
{
  //전체비중 합계
  if Eda_weight.Value <> 100 then
    begin
      MessageDlg('전체비중 합계가 100 이어야 합니다.',mtError, [mbOk], 0);
      System.Exit;
    end;

  //입력값 체크
  if not Check_Edit1 then
      System.Exit;

  DM.DBSet1.First;
  detail_cnt := 0;
  while not DM.DBSet1.Eof do
    begin
      if Trim(DM.DBSet1.FieldByName('detailtask1').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask2').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask3').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask4').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask5').AsString)  <> '' then
         inc(detail_cnt);

      DM.DBSet1.Next;
    end;
  if detail_cnt < 3 then
    begin
      MessageDlg('세부추진 활동이 3개 이상이어야 합니다.',mtError, [mbOk], 0);
      System.Exit;
    end;

  if Lwork = '피평가자' then
    Msg := '['+Bt_Confirm.Caption+']를 하시면 업무목표 내용을 편집할 수 없습니다.'#13#13+
           '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?'
  else if Lwork = '1차' then
  begin
    if (gsLastConEv = '2차')  then
      Msg := '['+Bt_Confirm.Caption+']를 하시면 업무목표 내용을 편집할 수 없습니다.'#13#13+
             '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?'
    else
      Msg := '['+Bt_Confirm.Caption+'] 하시겠습니까?'
  end
  else
    Msg := '['+Bt_Confirm.Caption+'] 하시겠습니까?';

  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
      System.Exit;


  Save := 0;
  ToMail := '';

  // 2005.03.17 수정작업
  if Pa_jobgun.Hint <> '22' then  // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
  begin
    DbSet := Grid1.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.'+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
      Lgubun := 0;
      ToMail := '1차메일';
    end;

    if Lwork = '1차' then Lgubun := 1;

    if Lwork = '2차' then Lgubun := 2;

    if Lgubun = 1 then // 1차결재자
    begin
      if trim(DbSet.FieldByName('e1prjview').AsString) = '' then
      begin
      end;
      if (gsLastConEv = '2차') and (Trim(Le2empno) <> '') then
      begin
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.'+#13+
             '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
             '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
             '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
           Save := 2 // 내역보관
        else                    //결재상신
           Save := 1; // 내역보관
    end;

//      if Lgubun = 2 then
    if (gsLastConEv = '2차') and (Lgubun = 2) then // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
      end;

//        Save := 1; // 내역보관
      if Bt_Confirm.Caption = '결재' then
        Save := 2 // 내역보관
      else                    //결재상신
        Save := 1; // 내역보관
    end;

    St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);
    DM.gsLastConEv := gsLastConEv;
    DM.FSvr_ConfirmSql(1,Lgubun,Save,Param);

  end;

  // 2005.03.17 수정
  if Pa_jobgun.Hint = '22' then // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
  begin
     DbSet := Grid2.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.'+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
      Lgubun := 0;
      ToMail := '1차메일';
    end;

    if Lwork = '1차' then
      Lgubun := 1;

    if Lwork = '2차' then
      Lgubun := 2;

    if Lgubun = 1 then  // 1차결재자
    begin
      if (gsLastConEv = '2차') and (Trim(Le2empno) <> '') then
      begin
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.'+#13+
             '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
             '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
             '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
          Save := 2 // 내역보관
        else
          Save := 1; // 내역보관
    end;

    if (gsLastConEv = '2차') and (Lgubun = 2) then  // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
      end;
//            Save := 1; // 내역보관
      if Bt_Confirm.Caption = '결재' then
        Save := 2 // 내역보관
      else
        Save := 1; // 내역보관
    end;

    St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);
     DM.gsLastConEv := gsLastConEv;
    DM.FSvr_ConfirmSql(2,Lgubun,Save,Param);
  end;

  sendtime := GetBaseYear(3);
  sendtime := copy(sendtime,1,4)+'년'+copy(sendtime,5,2)+'월'+copy(sendtime,7,2)+'일 '+
              copy(sendtime,9,2)+':'+copy(sendtime,11,2)+':'+copy(sendtime,13,2);

  // 메일을 보낸다.
  if ToMail = '1차메일' then
    Send_Mail('업무목표설정 1차평가자 확인요청',
              Le1empno, Le1korname,
              '목표설정을 완료했습니다.'+#13+#13+
                ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                '★확인방법:종합인사정보시스템 ▶[평가] ▶[사원목표관리] ▶[개인별 업무목표 등록/결재]',
              '0' );
  if ToMail = '2차메일' then
    Send_Mail('개인업무목표설정 확인요청',
              Le2empno, Le2korname,
              '['+DbSet.FieldByName('korname').AsString+']사원이 개인업무목표를 설정하였습니다.'+#13+#13+
                ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                '★확인방법:종합인사정보시스템 ▶[평가] ▶[사원목표관리] ▶[개인별 업무목표 등록/결재]',
              '0' );

  St_Help.Panels[0].Text := '';
  Ed_empno.SetFocus;
}
end;


// 반 려
procedure TFm_Sub1.Bt_canClick(Sender: TObject);
{
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
  Lgubun : integer;
  ToMail : string;
}
begin
{
  Msg := '[반려] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
    System.Exit;

  St_Help.Panels[0].Text := ' 반려 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);

  Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);

  if (Lwork = '1차') then
  begin
    Tomail := '피평가자';
    DM.FSvr_UpdateSql(4,1,Param); //반려, 1차, (평가기준일,접속자사번,피평가자사번)
                                  //e1prjobjyn = 'Y', rprjconyn = 'N', rprjcondate = ''

    MessageDlg('피평가자에게 반려메일이 발송됩니다.'#13+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
  end;

  if (gsLastConEv = '2차') and (Lwork = '2차') then
  begin
    Tomail := '모두';
    DM.FSvr_UpdateSql(4,2,Param); //반려, 2차, (평가기준일,접속자사번,피평가자사번)
                                  //e2prjobjyn = 'Y', e1prjconyn  = 'N', e1prjcondate = '',
                                  //rprjconyn  = 'N', rprjcondate = ''
  end;

  // 메일을 보낸다.
  if ToMail = '피평가자' then
    Send_Mail('목표설정 1차평가자 반려메일',
              Ed_empno.LabelHint,Ed_empno.Text,
              '목표설정을 반려했습니다. 다시 설정하여 주십시오.',
              '1');
  if ToMail = '모두' then
  begin
    MessageDlg('피평가자에게 반려메일이 발송됩니다.'#13+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
  end;

   Ed_empno.SetFocus;
}
end;


// 입력 값 체크
function TFm_Sub1.Check_Edit1 : Boolean;
begin
{
  Result := False;

  DM.DBSet1.First;

  while not DM.DBSet1.Eof do
  begin
    if Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)  = '' then
    begin
      MessageDlg('중점추진업무 항목 필수 입력.',mtError,[mbOK],0);
      System.Exit;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '' then
    begin
      MessageDlg('세부추진활동은 반드시 하나 이상 등록하셔야 하며' + #13#13 +
                 ' 세부추진활동을 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
      System.Exit;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동1 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end
    end
    else
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT1').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS1').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동2 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

      if (Trim(DM.DBSet1.FieldByName('VALIDX2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS2').AsString) <> '') then
      begin
        MessageDlg('세부추진활동2를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT2').AsInteger = 0) or
           (Trim(DM.DBSet1.FieldByName('VALIDX2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('SRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('ARESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('BRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('CRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('DRESULTCLASS2').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동3 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

      if (Trim(DM.DBSet1.FieldByName('VALIDX3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS3').AsString) <> '') then
      begin
        MessageDlg('세부추진활동3를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT3').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS3').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) = '' then
    begin
      if Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '' then
      begin
        MessageDlg('세부추진활동4 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

      if (Trim(DM.DBSet1.FieldByName('VALIDX4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS4').AsString) <> '') then
      begin
        MessageDlg('세부추진활동4를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT4').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS4').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '' then
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT5').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS5').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동5를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    DM.DBSet1.Next;
  end;

  Result := True;
}
end;


// 피평가자 평가내역 읽어오기
procedure TFm_Sub1.Read_PESPEDET;
//var
//   ParamVariant: String;
begin
{
   if MainForm.Pgubun = '1' then
      ParamVariant := 'SELECT NVL(EMPNO, '' '')           VALUE1, NVL(EEMPNO, '' '')          VALUE2, '+
                      '       NVL(TO_CHAR(CLASNO), ''0'') VALUE3, NVL(TO_CHAR(ITEMNO), ''0'') VALUE4, '+
                      '       NVL(EVGRADE, '' '')         VALUE5, NVL(TO_CHAR(EVSCORE),''0'') VALUE6  '+
                      '  FROM PESPEDET                                                                '+
                      ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                              '+ // 평가기준
                      '   AND EMPNO     = '''+var_empno             +'''                              '+
                      '   AND EEMPNO    = '''+pempno                +'''                              '
   else if MainForm.Pgubun = '2' then
      ParamVariant := 'SELECT NVL(EMPNO, '' '')           VALUE1, NVL(EEMPNO, '' '')          VALUE2, '+
                      '       NVL(TO_CHAR(CLASNO), ''0'') VALUE3, NVL(TO_CHAR(ITEMNO), ''0'') VALUE4, '+
                      '       NVL(EVGRADE, '' '')         VALUE5, NVL(TO_CHAR(EVSCORE),''0'') VALUE6  '+
                      '  FROM PESPEDET                                                                '+ // 평가기준
                      ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                              '+
                      '   AND EMPNO     = '''+var_empno             +'''                              '+
                      '   AND EEMPNO    = '''+MainForm.Peempno      +'''                              ';

   With CDS_Gen do begin
      Close;
      ServiceName := 'PEF4020A_sel2';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('VALUE1', ftFloat, 10);
      AddField('VALUE2', ftFloat, 10);
      AddField('VALUE3', ftFloat, 10);
      AddField('VALUE4', ftFloat, 10);
      AddField('VALUE5', ftFloat, 10);
      AddField('VALUE6', ftFloat, 10);
      SQL.Text := ParamVariant;
      Open;
   end;
}
end;


function TFm_Sub1.Check_E2empno;
var
  ParamVariant: String;
begin
   DataModule_Tmax.TMaxDataSet_HInsa.Close;
   if MainForm.var_gsEvcno = '1' then // 1차 평가자
      ParamVariant :=  'SELECT NVL(A.EEMPNO, '' '') ||'';''|| NVL(B.EEMPNO, '' '') VALUE  '+
                       '  FROM PESPETOT A,                                                        '+
                       '      (SELECT RABASDATE, EMPNO, EEMPNO FROM PESPETOT                      '+
                       '        WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                  '+
                       '          AND EMPNO     = '''+var_empno+'''                               '+
                       '          AND GUBUN     = ''2'') B                                        '+
                       ' WHERE A.RABASDATE = '''+MainForm.var_rabasdate+'''                       '+
                       '   AND A.EMPNO     = '''+var_empno+'''                                    '+
                       '   AND A.EEMPNO    = '''+pempno+'''                                       '+
                       '   and A.GUBUN     = '''+MainForm.Pgubun+'''                              '+
                       '   AND A.RABASDATE = B.RABASDATE(+)                                       '+
                       '   AND A.EMPNO     = B.EMPNO    (+)                                       '

   else if MainForm.var_gsEvcno = '2' then  // 2차 평가자
      ParamVariant :=  'SELECT NVL(A.EEMPNO, '' '') ||'';''|| NVL(B.EEMPNO, '' '') VALUE  '+
                       '  FROM PESPETOT A,                                                        '+
                       '      (SELECT RABASDATE, EMPNO, EEMPNO FROM PESPETOT                      '+
                       '        WHERE RABASDATE = '''+MainForm.var_rabasdate+'''                  '+
                       '          AND EMPNO     = '''+var_empno+'''                               '+
                       '          AND GUBUN     = ''2'') B                                        '+
                       ' WHERE A.RABASDATE = '''+MainForm.var_rabasdate+'''                       '+
                       '   AND A.EMPNO     = '''+var_empno+'''                                    '+
                       '   AND A.EEMPNO    = '''+MainForm.Peempno+'''                             '+
                       '   and A.GUBUN     = '''+MainForm.Pgubun+'''                              '+
                       '   AND A.RABASDATE = B.RABASDATE(+)                                       '+
                       '   AND A.EMPNO     = B.EMPNO    (+)                                       ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  if (MainForm.var_gsEvcno = '0') or (MainForm.var_gsEvcno = '3') then  // 동표 & 특이평가자
  begin
     E1Empno := '';
     E2Empno := '';
  end
  else
  begin
     E1Empno := DataModule_Tmax.Csel_gfd(1);
     E2Empno := DataModule_Tmax.Csel_gfd(2);
  end;
  DataModule_Tmax.TMaxDataSet_HInsa.Close;
{
  ParamVariant :=  'SELECT NVL(EEMPNO, '' '') VALUE FROM PESPETOT       '+
                   ' WHERE RABASDATE = '''+MainForm.var_rabasdate+'''   '+ // 평가기준일
                   '   AND EMPNO     = '''+var_empno+'''                '+ // 피평가자사번
                   '   AND EEMPNO    = '''+pempno+'''                   '; // 평가자사번

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  E2EmpCnt := DataModule_Tmax.Csel_gfd(1);
}
end;


end.
