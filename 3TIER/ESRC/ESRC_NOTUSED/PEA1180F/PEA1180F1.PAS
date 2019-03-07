{=============================== Program Header ================================
 PROGRAM-NAME   : 팀원 업무 목표 등록[PEA1180F]
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 팀원 업무 목표 등록
 Programmer     : ver 1.0
 Version        :
 Date           :
Update Contents
  버전    수정일         수정자       수정내용                   관련근거
  1.00    2013.03.25     이희용       신규개발                   HR팀 요청
================================================================================}

unit PEA1180F1;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  ExtCtrls, ComCtrls,Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme,
   OnPopupEdit, PeJeonLabel, OnEditMemo, kpaylib, Comobj, PDownLoad, OnRegistry,
   ShellApi, OnInternetFTP, OnEditCombo ;

  type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TDS_Com: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TDml: TTMaxDataSet;
    OnSchemeForm1: TOnSchemeForm;
    Shape1: TShape;
    Lempno: TLabel;
    Lsysdate: TLabel;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    ED_team: TOnWinPopupEdit;
    Panel10: TPanel;
    BBclose: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    BBupdate: TOnFocusButton;
    ON_JM1: TOnEdit;
    ON_JM2: TOnEdit;
    ON_JM3: TOnEdit;
    ON_JM4: TOnEdit;
    ON_JM5: TOnEdit;
    SB_Help: TStatusBar;
    ms1: TLabel;
    Shape3: TShape;
    OnSectionLabel4: TOnSectionLabel;
    Shape4: TShape;
    OM_JM2: TOnComboEdit;
    OnSectionLabel3: TOnSectionLabel;
    OM_JM3: TOnComboEdit;
    OM_JM4: TOnComboEdit;
    OM_JM5: TOnComboEdit;
    OE_JJ1: TMemo;
    OE_JJ2: TMemo;
    OE_JJ3: TMemo;
    OE_JJ4: TMemo;
    OE_JJ5: TMemo;
    Ed_empno: TOnWinPopupEdit;
    OM_JM1: TOnComboEdit;
    OE_JM5: TOnMemo;
    OE_JM4: TOnMemo;
    OE_JM3: TOnMemo;
    OE_JM2: TOnMemo;
    OE_JM1: TOnMemo;
    THintMail: TTMaxDataSet;
    Bt_eempcon: TOnFocusButton;
    Bt_eempcan: TOnFocusButton;
    procedure BBcloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure BBupdateClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure OM_JM1Change(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure OM_JM1GetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure Bt_eempconClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
    function CheckOfMember(Parameter: String): Boolean;
  public
    { Public declarations }
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, GSpEMP, FG_Date, SqlText : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfJimu : Boolean;
    sRabasdate, sOrgnum : String;
    Workemp1, Workemp2, Workemp3, Workemp4 : String;
    procedure SetNow;
    function Data_Check : boolean;
    procedure Select_BaseData;
    procedure ComponentClear;
    procedure SendMail;
    Function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  end;
var
  FM_Main: TFM_Main;

implementation

uses KeyEmpno, UEmpForm, UDeptForm;//, PEA1170F2, PEA1170F3;
{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);

  Lempno.Caption    := GSkorname + '(' + GSempno +')';
  Lsysdate.Caption  := Copy(FG_Date,1,4)+'/'+Copy(FG_Date,5,2)+'/'+Copy(FG_Date,7,2);
  Pgrade            := copy(GSgrade,3,1);

//  VarLoading;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  SetNow;

  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1,                                         ' +
                '       Value3 Field2, '''' Field3,  '''' Field4,  '''' Field5 ' +
                '  from pehrebas                                               ' +
                ' where rabasdate = ''00000000''                               ' +
                '   and gubun = ''00'' and sgubun = ''0001''                   ';

    ClearFieldInfo;
    AddField('Field1', ftString, 100);
    AddField('Field2', ftString, 100);
    AddField('Field3', ftString, 100);
    AddField('Field4', ftString, 100);
    AddField('Field5', ftString, 100);
    Open;

    sRabasdate := FieldByName('Field1').AsString;
    sOrgnum    := FieldByName('Field2').AsString;

    Close;
    Sql.Clear;
    SQL.Text := 'select Value1 Field1, Value2 Field2,              ' +
                '       Value3 Field3, Value4 Field4,  '''' Field5 ' +
                '  from pehrebas                                   ' +
                ' where rabasdate = '''+sRabasdate+'''             ' +
                '   and gubun     = ''11''  and   sgubun = ''0005''';
    Open;
    workemp1 := FieldByName('Field1').AsString;
    workemp2 := FieldByName('Field2').AsString;
    workemp3 := FieldByName('Field3').AsString;
    workemp4 := FieldByName('Field4').AsString;
  end;

  //평가담당자는 전사원 조회
  CheckOfMember(GSempno);
  CheckOfJimu := True;
  if  (GSempno = workemp1) or (GSempno = workemp2) or (GSempno = workemp3) or (GSempno = workemp4) or (copy(GSempno,1,1) = 'D') then
  Begin
    ED_team.Enabled  := True;
    Ed_empno.Enabled := True;
    Select_BaseData;
  End
  else
  Begin
    ED_team.Enabled  := False;
    Select_BaseData;
    if CheckOfJimu = False Then Close;
 End;
end;

function TFM_Main.CheckOfMember(Parameter: String): Boolean;
begin

  with TDS1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT  A.EMPNO, A.KORNAME, (SELECT DECODE(EMPNO, ''1973'', PAYRAYN, JobPAYRAYN) FROM PIMPMAS WHERE EMPNO = A.EMPNO AND PSTATE < ''80'') PAYRAYN,  ' +
                '        A.deptcode, (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.DEPTCODE) DEPTNAME,   ' +
                '        (SELECT CONYN FROM PEDUCDepT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE) CONYN,                   ' +
                '        '''' F7, '''' F8, '''' F9, '''' F10   ' +
                '  FROM PEHREMAS A '+
                ' WHERE A.RABASDATE = '''+ sRabasdate +''' '+
                '   AND A.EMPNO     = '''+ Parameter +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'   , ftString, 100);
    AddField('KORNAME' , ftString, 100);
    AddField('payrayn' , ftString, 100);
    AddField('deptcode', ftString, 100);
    AddField('DEPTNAME', ftString, 100);
    AddField('CONYN'   , ftString, 100);
    AddField('F7'      , ftString, 100);
    AddField('F8'      , ftString, 100);
    AddField('F9'      , ftString, 100);
    AddField('F10'     , ftString, 100);
    SQL.Text := SqlText;
    Open;

    if TDS1.RecordCount < 1 then CheckOfMember := False
    else
    Begin
      ED_EMPNO.Text := Fields[0].AsString +' - ' +Fields[1].AsString;
      GSdeptcode    := Fields[3].AsString;
      ED_team.Text  := Fields[4].AsString;

      if (Fields[2].AsString = 'N') Then
      Begin
        Ed_empno.Enabled   := False;
        CheckOfMember      := False;

        BBupdate.Visible   := True;
        Bt_Confirm.Visible := True;
        Bt_eempcon.Visible := False;
        Bt_eempcan.Visible := False;
      End
      Else
      Begin
        Ed_empno.Enabled   := True;
        CheckOfMember      := True;

        OM_JM1.ItemIndex := -1;
        OM_JM2.ItemIndex := -1;
        OM_JM3.ItemIndex := -1;
        OM_JM4.ItemIndex := -1;
        OM_JM5.ItemIndex := -1;
        OM_JM1.Enabled   := False;
        OM_JM2.Enabled   := False;
        OM_JM3.Enabled   := False;
        OM_JM4.Enabled   := False;
        OM_JM5.Enabled   := False;

        if (Fields[5].AsString = 'Y') Then Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

        BBupdate.Visible   := False;
        Bt_Confirm.Visible := False;
        Bt_eempcon.Visible := True;
        Bt_eempcan.Visible := True;
      End;
    End;
  end;
end;

procedure TFM_Main.SetNow;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text :=' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D, '+
               ' ''F2'', ''F3'', ''F4'', ''F5'' ' +
               ' FROM DUAL ' ;

    ClearFieldInfo;
    AddField('D' , ftString, 100);
    AddField('F2', ftString, 100);
    AddField('F3', ftString, 100);
    AddField('F4', ftString, 100);
    AddField('F5', ftString, 100);
    Open;

    GSsysdate := FieldByName('D').AsString;
  End;
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.ED_teamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if TeamForm.GSdeptcode <> '' then
  begin
      GSdeptcode   := TeamForm.GSdeptcode;
      ED_team.Text := TeamForm.GSdeptname;
  end;

  ComponentClear;
  Select_BaseData;
  Ed_empno.Text := '';
end;

procedure TFM_Main.ED_teamInitPopup(Sender: TObject);
begin
  TeamForm.Edit         := TOnWinPopupEdit(Sender);
  TeamForm.PG_Get_Dept;
  TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TFM_Main.Select_BaseData;
VAR sCONYN1, sCONYN2 : String;
begin
  SQLText :=  ' SELECT A.ITEMNO1, A.ITEMNAME1, A.ITEMDESC1, ' +
              '        A.ITEMNO2, A.ITEMNAME2, A.ITEMDESC2, ' +
              '        A.ITEMNO3, A.ITEMNAME3, A.ITEMDESC3, ' +
              '        A.ITEMNO4, A.ITEMNAME4, A.ITEMDESC4, ' +
              '        A.ITEMNO5, A.ITEMNAME5, A.ITEMDESC5, ' +
              '        A.CONYN , ''Field17'', ''Field18''   '+
              ' FROM PEDUCDepT A '+
              ' WHERE RABASDATE = '''+ sRabasdate +''' '+
              '   AND DEPTCODE  = '''+ GSdeptcode +''' ';

  with TDS_Com do
  begin
    Close;
    ServiceName := 'PEH2030A_sel1';
    ClearFieldInfo;
    AddField('ITEMNO1'  , ftString, 400);
    AddField('ITEMNAME1', ftString, 400);
    AddField('ITEMDESC1', ftString, 400);

    AddField('ITEMNO2'  , ftString, 400);
    AddField('ITEMNAME2', ftString, 400);
    AddField('ITEMDESC2', ftString, 400);

    AddField('ITEMNO3'  , ftString, 400);
    AddField('ITEMNAME3', ftString, 400);
    AddField('ITEMDESC3', ftString, 400);

    AddField('ITEMNO4'  , ftString, 400);
    AddField('ITEMNAME4', ftString, 400);
    AddField('ITEMDESC4', ftString, 400);

    AddField('ITEMNO5'  , ftString, 400);
    AddField('ITEMNAME5', ftString, 400);
    AddField('ITEMDESC6', ftString, 400);

    AddField('CONYN'    , ftString, 400);
    AddField('Field17'  , ftString, 400);
    AddField('Field18'  , ftString, 400);
    SQL.Text := SQLText;
    Open;

    sCONYN1 := fieldbyname('CONYN').AsString;

    if (sCONYN1 <> 'Y') Then
    Begin
      BBupdate.Enabled   := False;
      Bt_Confirm.Enabled := False;
      MessageDlg('소속부서의 직무역량 등록이 완료되지 않았습니다.', mtError,[mbOK],0);
      Application.Terminate;
      Exit;
    End
    Else
    Begin
      CheckOfJimu := True;
      ON_JM1.Text := Fields[0].AsString;
      OE_JM1.Text := Fields[1].AsString;
      OE_JJ1.Text := Fields[2].AsString;

      ON_JM2.Text := Fields[3].AsString;
      OE_JM2.Text := Fields[4].AsString;
      OE_JJ2.Text := Fields[5].AsString;

      ON_JM3.Text := Fields[6].AsString;
      OE_JM3.Text := Fields[7].AsString;
      OE_JJ3.Text := Fields[8].AsString;

      ON_JM4.Text := Fields[9].AsString;
      OE_JM4.Text := Fields[10].AsString;
      OE_JJ4.Text := Fields[11].AsString;

      ON_JM5.Text := Fields[12].AsString;
      OE_JM5.Text := Fields[13].AsString;
      OE_JJ5.Text := Fields[14].AsString;
    End;
  End;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    SqlText :=  ' SELECT '+
                '       (SELECT SNUM FROM PEDUCEMP  WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND EMPNO = A.EMPNO AND ITEMNO = '''+ ON_JM1.Text +''') SNUM1, '+
                '       (SELECT SNUM FROM PEDUCEMP  WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND EMPNO = A.EMPNO AND ITEMNO = '''+ ON_JM2.Text +''') SNUM2, '+
                '       (SELECT SNUM FROM PEDUCEMP  WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND EMPNO = A.EMPNO AND ITEMNO = '''+ ON_JM3.Text +''') SNUM3, '+
                '       (SELECT SNUM FROM PEDUCEMP  WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND EMPNO = A.EMPNO AND ITEMNO = '''+ ON_JM4.Text +''') SNUM4, '+
                '       (SELECT SNUM FROM PEDUCEMP  WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND EMPNO = A.EMPNO AND ITEMNO = '''+ ON_JM5.Text +''') SNUM5, '+
                '       CONYN, DECODE(EEMP_CONYN, ''Y'', ''결재완료'', ''N'', ''반려'', DECODE(CONYN, ''Y'', ''결재대기'', ''미등록'')) EEMP_CONYN, ''F8'', ''F9'', ''F10'' '+
                ' FROM PEDUCEMP A '+
                ' WHERE RABASDATE = '''+ sRabasdate +''' ' +
                '   AND DEPTCODE  = '''+ GSdeptcode +''' ' +
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' +
                '   AND ROWNUM    = 1 ';



    ClearFieldInfo;
    AddField('SNUM1', ftString, 100);
    AddField('SNUM2', ftString, 100);
    AddField('SNUM3', ftString, 100);
    AddField('SNUM4', ftString, 100);
    AddField('SNUM5', ftString, 100);
    AddField('CONYN', ftString, 100);
    AddField('EEMP_CONYN', ftString, 100);
    AddField('F8',    ftString, 100);
    AddField('F9',    ftString, 100);
    AddField('F10',   ftString, 100);
    SQL.Text := SQLText;
    Open;

    if TDS1.RecordCount < 1 then
    else
    Begin
      OM_JM1.Text  := Fields[0].AsString;
      OM_JM2.Text  := Fields[1].AsString;
      OM_JM3.Text  := Fields[2].AsString;
      OM_JM4.Text  := Fields[3].AsString;
      OM_JM5.Text  := Fields[4].AsString;

      sCONYN2 := fieldbyname('CONYN').AsString;

      if (sCONYN2 = 'Y') Then
      Begin
        BBupdate.Enabled   := False;
        Bt_Confirm.Enabled := False;

        OM_JM1.Enabled     := False;
        OM_JM2.Enabled     := False;
        OM_JM3.Enabled     := False;
        OM_JM4.Enabled     := False;
        OM_JM5.Enabled     := False;
      End Else
      Begin
        BBupdate.Enabled   := True;
        Bt_Confirm.Enabled := True;

        OM_JM1.Enabled     := True;
        OM_JM2.Enabled     := True;
        OM_JM3.Enabled     := True;
        OM_JM4.Enabled     := True;
        OM_JM5.Enabled     := True;
      End;
    End;
    If (fieldbyname('EEMP_CONYN').AsString <> '') Then
      ms1.Caption := fieldbyname('EEMP_CONYN').AsString + ' 자료입니다.';
  end;
end;

procedure TFM_Main.BBupdateClick(Sender: TObject);
var Checkinx, JobMode: String;
    i: Integer;
begin
  If Not (Data_Check) Then Exit;
  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT EMPNO,''field2'', ''field3'', ''field4'',''field5'' '+
                '  FROM PEDUCEMP  '+
                ' where rabasdate = '''+ sRabasdate +''' ' +
                '   AND DEPTCODE  = '''+ GSdeptcode +''' ' +
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'  ,ftString, 100);
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
    for i := 1 to 5 do
    Begin
      SQLText:= 'INSERT INTO PEDUCEMP                  '+#13+
                '   (RABASDATE, DEPTCODE,   EMPNO,     '+#13+
                '    ORGNUM,    ITEMNO,     SNUM,      '+#13+
                '    CONYN,     WRITEMAN,  WRITETIME)  '+#13+
                '  VALUES                              '+#13+
                '   ('''+ sRabasdate     +''',         '+#13+
                '    '''+ GSdeptcode     +''',         '+#13+
                '    '''+ Copy(Ed_empno.Text,1,4) +''','+#13+
                '    '''+ sOrgnum        +''',         '+#13+
                '    '''+ TOnEdit(Self.FindComponent('ON_JM'+IntToStr(i))).Text      +''', '+#13+
                '    '''+ TOnComboEdit(Self.FindComponent('OM_JM'+IntToStr(i))).Text +''', '+#13+
                '    '''+ 'N'            +''',         '+#13+
                '    '''+ GSempno        +''',         '+#13+
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+#13+
                '   ) ';

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
    End;
  end
  Else
  Begin
    for i := 1 to 5 do
    Begin
      SQLText := Format(
                'UPDATE PEDUCEMP  SET ' +#13+
                '       SNUM      = '''+ TOnComboEdit(Self.FindComponent('OM_JM'+IntToStr(i))).Text+ ''', ' +#13+
                '       WRITEMAN  = '''+ GSempno+''',     ' +#13+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
                ' WHERE RABASDATE = ''%s'' '   +#13+
                '  AND  DEPTCODE  = ''%s'' '   +#13+
                '  AND  EMPNO     = ''%s'' '   +#13+
                '  AND  ITEMNO    = ''%s'' ' ,
                [sRabasdate, GSdeptcode, Copy(Ed_empno.Text,1,4), TOnEdit(Self.FindComponent('ON_JM'+IntToStr(i))).Text]);
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
    End;
  End;

  MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
  Select_BaseData;
end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SQLTEXT : String;
  i : Integer;
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT DEPTCODE , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEDUCEMP                                                 '+
                ' WHERE RABASDATE = '''+ sRabasdate +''' '+
                '   AND DEPTCODE  = '''+ GSdeptcode +''' '+
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('DEPTCODE' , ftString,  100);
    AddField('field2'   , ftString,  100);
    AddField('field3'   , ftString,  100);
    AddField('field4'   , ftString,  100);
    AddField('field5'   , ftString,  100);
    Open;

    if  (RecordCount < 1 )  then
    Begin
      MessageDlg('임시저장 후 최종완료 하시기 바랍니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  If Not (Data_Check) Then Exit;

  if Application.MessageBox('최종완료된 자료는 수정할 수 없습니다. 최종완료 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  for i := 1 to 5 do
  Begin
    SQLText := Format(
              'UPDATE PEDUCEMP  SET ' +#13+
              '       SNUM      = '''+ TOnComboEdit(Self.FindComponent('OM_JM'+IntToStr(i))).Text+ ''', ' +#13+
              '       CONYN     = ''Y'',  ' +#13+
              '       EEMP_CONYN= '''',   ' +#13+
              '       WRITEMAN  = '''+ GSempno+''',     ' +#13+
              '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
              ' WHERE RABASDATE = ''%s'' '   +#13+
              '  AND  DEPTCODE  = ''%s'' '   +#13+
              '  AND  EMPNO     = ''%s'' '   +#13+
              '  AND  ITEMNO    = ''%s'' ' ,
              [sRabasdate, GSdeptcode, Copy(Ed_empno.Text,1,4), TOnEdit(Self.FindComponent('ON_JM'+IntToStr(i))).Text]);
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
  End;

  if NOT TDml.Execute then
    MessageDlg('최종완료 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
//  김현순 매니져 요청(메일 안 보내도록...)
//  SendMail;
    Select_BaseData;
  end;
end;

procedure TFM_Main.ComponentClear;
begin
  OE_JM1.Text := '';
  OE_JM2.Text := '';
  OE_JM3.Text := '';
  OE_JM4.Text := '';
  OE_JM5.Text := '';

  OE_JJ1.Text := '';
  OE_JJ2.Text := '';
  OE_JJ3.Text := '';
  OE_JJ4.Text := '';
  OE_JJ5.Text := '';

  OM_JM1.ItemIndex := -1;
  OM_JM2.ItemIndex := -1;
  OM_JM3.ItemIndex := -1;
  OM_JM4.ItemIndex := -1;
  OM_JM5.ItemIndex := -1;

  OM_JM1.Enabled := True;
  OM_JM2.Enabled := True;
  OM_JM3.Enabled := True;
  OM_JM4.Enabled := True;
  OM_JM5.Enabled := True;

  BBupdate.Enabled   := True;
  Bt_Confirm.Enabled := True;
  ms1.Caption        := '';
end;

function TFM_Main.Data_Check: boolean;
var i: Integer;
Begin
  Result := False;

  if (ED_team.Text  = '') Then Begin MessageDlg('부서를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); ED_team.SetFocus;  exit; End;
  if (Ed_empno.Text = '') Then Begin MessageDlg('사원를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); Ed_empno.SetFocus; exit; End;

  if (OM_JM1.Text = '') Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
  if (OM_JM2.Text = '') Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
  if (OM_JM3.Text = '') Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
  if (OM_JM4.Text = '') Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
  if (OM_JM5.Text = '') Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;

  for i := 1 to 5 do
  Begin
    case i of
    1 : begin
          if OM_JM2.ItemIndex = OM_JM1.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
          if OM_JM3.ItemIndex = OM_JM1.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
          if OM_JM4.ItemIndex = OM_JM1.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
          if OM_JM5.ItemIndex = OM_JM1.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
        end;
    2 : begin
          if OM_JM1.ItemIndex = OM_JM2.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
          if OM_JM3.ItemIndex = OM_JM2.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
          if OM_JM4.ItemIndex = OM_JM2.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
          if OM_JM5.ItemIndex = OM_JM2.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
        end;                  
    3 : begin                 
          if OM_JM1.ItemIndex = OM_JM3.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
          if OM_JM2.ItemIndex = OM_JM3.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
          if OM_JM4.ItemIndex = OM_JM3.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
          if OM_JM5.ItemIndex = OM_JM3.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
        end;                  
    4 : begin
          if OM_JM1.ItemIndex = OM_JM4.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
          if OM_JM2.ItemIndex = OM_JM4.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
          if OM_JM3.ItemIndex = OM_JM4.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
          if OM_JM5.ItemIndex = OM_JM4.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
        end;                  
    5 : begin                 
          if OM_JM1.ItemIndex = OM_JM5.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
          if OM_JM2.ItemIndex = OM_JM5.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
          if OM_JM3.ItemIndex = OM_JM5.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
          if OM_JM4.ItemIndex = OM_JM5.ItemIndex Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
        end;
    End;
  End;

  Result := True;
End;

procedure TFM_Main.OM_JM1Change(Sender: TObject);
var Sinx: Integer;
begin
  Sinx := TOnComboEdit(Self.FindComponent('OM_JM'+IntToStr(TOnComboEdit(Sender).tag))).ItemIndex;
  if ((Sinx = -1)) Then Exit;

  case TOnComboEdit(Sender).Tag of
  1 : begin
        if OM_JM2.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
        if OM_JM3.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
        if OM_JM4.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
        if OM_JM5.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM1.SetFocus; exit; End;
      end;
  2 : begin
        if OM_JM1.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
        if OM_JM3.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
        if OM_JM4.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
        if OM_JM5.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM2.SetFocus; exit; End;
      end;
  3 : begin
        if OM_JM1.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
        if OM_JM2.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
        if OM_JM4.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
        if OM_JM5.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM3.SetFocus; exit; End;
      end;
  4 : begin
        if OM_JM1.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
        if OM_JM2.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
        if OM_JM3.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
        if OM_JM5.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM4.SetFocus; exit; End;
      end;
  5 : begin
        if OM_JM1.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
        if OM_JM2.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
        if OM_JM3.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
        if OM_JM4.ItemIndex = Sinx Then Begin MessageDlg('개발우선 순위를 선택하시기 바랍니다.' ,mtError, [mbOK], 0); OM_JM5.SetFocus; exit; End;
      end;
  end;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  Fm_EmpForm.empno <> '' Then
  Begin
    OM_JM1.ItemIndex := -1;
    OM_JM2.ItemIndex := -1;
    OM_JM3.ItemIndex := -1;
    OM_JM4.ItemIndex := -1;
    OM_JM5.ItemIndex := -1;
    OM_JM1.Enabled   := False;
    OM_JM2.Enabled   := False;
    OM_JM3.Enabled   := False;
    OM_JM4.Enabled   := False;
    OM_JM5.Enabled   := False;
    If     (Fm_EmpForm.Query1.FieldByName('proc').AsString = '미등록') Then
    Begin
      Bt_eempcon.Visible := False;
      Bt_eempcan.Visible := False;
      MessageDlg('직무등록을 완료하지 않았습니다.' ,mtError,[mbOK],0);
      ms1.Caption := '미등록 자료입니다.';
    End
    Else If (Fm_EmpForm.Query1.FieldByName('proc').AsString = '결재완료') Then
    Begin
      Bt_eempcon.Visible := False;
      Bt_eempcan.Visible := False;

      ms1.Caption := '결재완료된 자료입니다.';
      Select_BaseData;
    End
    Else If (Fm_EmpForm.Query1.FieldByName('proc').AsString = '반려') Then
    Begin
      Bt_eempcon.Visible := False;
      Bt_eempcan.Visible := False;
      ms1.Caption := '반려된 자료입니다.';
    End
    Else
    Begin
      Bt_eempcon.Visible := True;
      Bt_eempcan.Visible := True;
      ms1.Caption := '결재대기중인 자료입니다.';
      Select_BaseData;
    End;
  End;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
  if (ED_team.Text = '') then
  Begin
    MessageDlg('부서를 선택하시기 바랍니다.' ,mtError,[mbOK],0);
    ED_team.SetFocus;
    System.Exit;
  End;

  Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
  Fm_EmpForm.empno       := Ed_empno.Text;
  Fm_EmpForm.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Ed_empnoInitPopup(Sender);
    Select_BaseData;
    Key := #0;
  end;
end;

procedure TFM_Main.OM_JM1GetImageIndex(Sender: TObject;
  const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_Main.SendMail;
var
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
  i : Integer;
begin

  with THintMail do
  begin
    SqlText   := Format(' SELECT EMPNO       field1 '+
                        '      , KORNAME     field2 '+
                        '      , ''field3''  field3 '+
                        '      , ''field4''  field4 '+
                        '      , ''field5''  field5 '+
                        '   FROM PIMEEMP            '+
                        '  WHERE FINDHIRE(EMPNO) NOT IN (''J'', ''P'', ''Q'', ''Y'') '+
                        '    AND PAYRAYN  = ''Y''   '+
                        '    AND orgnum   = ''%s''  '+
                        '    AND deptcode = ''%s''  '+
                        '  ORDER BY EMPNO ',[sOrgnum, GSdeptcode]);

    ServiceName := 'HINSA_select';
    Close;
    Sql.Text := SqlText;

    ClearFieldInfo;
    AddField('field1', ftString,  100);
    AddField('field2', ftString,  100);
    AddField('field3', ftString,  100);
    AddField('field4', ftString,  100);
    AddField('field5', ftString,  100);
    Open;

    SendProgID  := 'PEA1180F'; //프로그램 ID
    SendEmpno   := GSempno;    //발송자(로그인 사번)
    RcveEmpno   := FieldByName('field1').AsString;
    //  RcveEmpno   := 'Z113';
    MailSubject := '[ 직무역량의 우선 개발 순위 등록 ] ';
    MailBody    :=  '******************************************************************************' + chr(13) + chr(10) + chr(13) + chr(10) +
                     '(' + Ed_empno.Text +')팀원의 직무역량 우선순위 등록이 완료되었습니다.   '+ chr(13) + chr(10) + chr(13) + chr(10) +
                     ' 팀장께서는 '+ chr(13) + chr(10) +
                     '[종합인사시스템]▶[평가]▶[구성원 목표관리]▶[팀원 직무역량 우선순위 등록]에 접속하셔서 '+ chr(13) + chr(10) + chr(13) + chr(10) +
                     '팀원의 직무역량 개발 우선순위를 확인하여 주시기 바랍니다.' + chr(13) + chr(10) + chr(13) + chr(10) +
                     '******************************************************************************'  + chr(13) + chr(10);

    ReceiveYN   := 'N';
    Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);
  End;
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
    Close;
    SQL.Clear;
    SQL.Add('insert into PZHMAIL                             ');
    SQL.Add('values (to_char(sysdate,''yyyymmddhh24miss'' ), ');  //SENDTIME   메일발송 작업시간
    SQL.Add('        '''+ SendProgID   +''',                 ');  //SENDPROG   발송프로그램 ID
    SQL.Add('        '''+ SendEmpno    +''',                 ');  //SEND_PER   발신자 사번
    SQL.Add('        '''+ RcveEmpno    +''',                 ');  //RCVR_PER,  수신자 사번
    SQL.Add('        ''''                  ,                 ');  //REFR_PER   불필요(종합인사)
    SQL.Add('        '''+ MailSubject  +''',                 ');  //SUBJECT    메일제목
    SQL.Add('        ''''                  ,                 ');  //HEADER1    불필요(종합인사)
    SQL.Add('        '''+ MailBody     +''',                 ');  //BODY1      메일내용
    SQL.Add('        ''''                  ,                 ');  //TAIL1      불필요(종합인사)
    SQL.Add('        '''+ ReceiveYN    +''',                 ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
    SQL.Add('        ''N''                 ,                 ');  //EAI_FLAG
    SQL.Add('        ''''                  )                 ');  //EAI_DATE

    try
      Execute;
    except
      Result := false;
      exit;
    end;
    Result := True;
  end;
end;

procedure TFM_Main.Bt_eempconClick(Sender: TObject);
var
  SQLTEXT, sECONYN : String;
  i : Integer;
begin
  case TComponent(Sender).Tag of
    0: sECONYN := 'Y';
    1: sECONYN := 'N';
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT DEPTCODE , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEDUCEMP                                                 '+
                ' WHERE RABASDATE = '''+ sRabasdate +''' '+
                '   AND DEPTCODE  = '''+ GSdeptcode +''' '+
                '   AND CONYN     = ''Y''                '+
                '   AND EMPNO     = '''+ Copy(Ed_empno.Text,1,4) +''' ' ;

    ClearFieldInfo;
    AddField('DEPTCODE' , ftString,  100);
    AddField('field2'   , ftString,  100);
    AddField('field3'   , ftString,  100);
    AddField('field4'   , ftString,  100);
    AddField('field5'   , ftString,  100);
    Open;

    if  (RecordCount < 1 )  then
    Begin
      MessageDlg('해당 팀원이 최종완료 하지 않았습니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  If Not (Data_Check) Then Exit;

  If (sECONYN = 'Y') Then
  Begin
    if Application.MessageBox('결재처리 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End Else
  Begin
    if Application.MessageBox('반려처리 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;
  End;

  for i := 1 to 5 do
  Begin
    SQLText := Format(
              'UPDATE PEDUCEMP  SET ' +#13+
              '       CONYN = DECODE('''+ sECONYN+''', ''N'', '''', CONYN), ' +#13+
              '       EEMP_CONYN = '''+ sECONYN+''',  ' +#13+
              '       WRITEMAN   = '''+ GSempno+''',  ' +#13+
              '       WRITETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +#13+
              ' WHERE RABASDATE  = ''%s'' '   +#13+
              '  AND  DEPTCODE   = ''%s'' '   +#13+
              '  AND  EMPNO      = ''%s'' '   +#13+
              '  AND  ITEMNO     = ''%s'' ' ,
              [sRabasdate, GSdeptcode, Copy(Ed_empno.Text,1,4), TOnEdit(Self.FindComponent('ON_JM'+IntToStr(i))).Text]);
    TDml.Close;
    TDml.Sql.Clear;
    TDml.Sql.Text := SQLText;

    TDml.ServiceName := 'PIT1030A_DML';

    if NOT TDml.Execute then
    Begin
      MessageDlg('결재(반려) 작업 중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
      System.Exit;
    End;
  End;

  if NOT TDml.Execute then
    MessageDlg('결재(반려) 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
//  김현수 매니져 요청(메일 안 보내도록...)
//  SendMail;
    Select_BaseData;
    Bt_eempcon.Visible := False;
    Bt_eempcan.Visible := False;
  end;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.


