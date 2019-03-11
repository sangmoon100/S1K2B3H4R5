{* ======================= Program Header ======================================
 PROGRAM-NAME   : 파견사원 평가(PEF7010A.exe)
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 파견사원 평가
 Programmer     : 이희용
 Version        : 1.0
 Date           : 2013.03.06

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
    1.00      2013.03.06         이희용        설계명세서       최초개발본
============================================================================= *}
unit PEF7010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, PeJeonBtnDateEdit, MemDS, DBAccess, Func, Grids, JPEG,
  OnPimcalendar, ImgList, Buttons, OnDBGrid, DBGrids, OnGrDBGrid, QuickRpt,
  Qrctrls, OnLineLabel, OnEditNumCtl, OnTmaxPersonEdit, Ora, OnGraphicLib;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    TDml: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    TCSel: TTMaxDataSet;
    T_Grid: TTMaxDataSet;
    DS_Grid: TDataSource;
    TCDS1: TTMaxDataSet;
    Cphoto: TTMaxDataSet;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    perimage: TImage;
    DB_Grid: TOnGrDbGrid;
    L_YPLEVEL: TOnShapeLabel;
    L_JOBGUN: TOnShapeLabel;
    L_Korname1: TOnShapeLabel;
    OnWinPopupEdit5: TOnWinPopupEdit;
    E_E2OPINION1: TOnMemo;
    Panel3: TPanel;
    L_Korname: TOnShapeLabel;
    E_E2OPINION2: TOnMemo;
    Panel10: TPanel;
    Bt_insert: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    Bt_Srh: TOnFocusButton;
    Loginemp: TEdit;
    Ed_empno1: TOnShapeLabel;
    L_EXTDUTY: TOnMemo;
    Panel1: TPanel;
    RB2: TRadioButton;
    RB1: TRadioButton;
    Panel2: TPanel;
    L_DEPTNAME: TOnShapeLabel;
    Shape4: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    Phelpmsg: TPanel;
    ms1: TLabel;
    RG: TGroupBox;
    RB3: TRadioButton;
    RB4: TRadioButton;
    TCDS: TTMaxDataSet;
    procedure ExitBtnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_E2OPINION1Click(Sender: TObject);
    procedure DS_GridDataChange(Sender: TObject; Field: TField);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure DB_GridCellClick(Column: TColumn);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
    procedure LoginempKeyPress(Sender: TObject; var Key: Char);
    procedure RB3Click(Sender: TObject);
    procedure SendMail;


  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    procedure empPicture(mEmpno : string);

    procedure Csel_Open;
  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;
    CURDATE  : String;

    Pempno, Pkorname, Password, Ppermission: String;
    check       : Integer;
    EempFind    : Boolean;
    pOrgDeptList: String;
    FL_Start    : Boolean;
    FL_deptcode : String;
    function TCsel_gfd(p_loc: Integer): String;
    procedure Select_BaseData;
    function Data_Check : boolean;
    procedure ComponentClear;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  end;

var
  FM_Main: TFM_Main;
  FG_Group : String;
  FL_payrayn  : String;
  WorkEmp1 : String;
  FnEmpno  : String;
  Csel_SQL : String;
  Csel_ret : Boolean;
  sSQL     : String;

  jpegimage : TJpegImage;
implementation

uses UEmpForm;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//  TMaxSession.EnvFileName := 'd:\source\newhana.env';

  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;                                 
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  sTemp : String;
begin
  if FL_Start then
  begin
    FL_Start := False;
    SF_Main.Refresh;

    Pempno   := Hinsa_Param(CmdLine, 1);
    Pkorname := Hinsa_Param(CmdLine, 2);
    Password := Hinsa_Param(CmdLine, 3);
    Ppermission := copy(Hinsa_Param(CmdLine,7),1,1);
(*
  if Not ((Pempno = '2563') or (Pempno = '2096') or (Pempno = '2545') or (Copy(Pempno,1,1) = 'D')) Then
  Begin
    MessageDlg('평가 담당자가 아닙니다.', mtInformation, [mbOK], 0);
    ExitBtnClick(Sender);
  End;
*)
  with TDS1 do
    begin
      Close;
      ServiceName := 'SHR0SSEL';
      ClearFieldInfo;
      AddField('SEL_DATA',ftString,5000);
      sql.Clear;
      sql.Add(Format('select Groupid from pymenuuser '+
                     ' Where empno =  ''%s''         '
                     ,[Pempno]));
      Open;

      FG_Group := FieldByName('SEL_DATA').AsString;
    end;

    if (Workemp1 = Pempno) or (Copy(Pempno,1,1) = 'D')
       or (FG_Group = 'G001') or (FG_Group = 'G011')  then
    begin
      Loginemp.Text    := Pempno;   //사번기억
      Loginemp.Visible := True;
      Bt_Srh.Visible   := True;
    end
    else
    begin
      Loginemp.Text    := Pempno;   //사번기억
      Loginemp.Visible := False;
      Bt_Srh.Visible   := False;
    end;

    Bt_SrhClick(sender);
  end;
end;                 

procedure TFM_Main.Bt_SrhClick(Sender: TObject);
begin

  Csel_SQL := 'SELECT A.jobdept||'';''||DECODE(B.useyn, ''Y'', ''Y'', A.jobpayrayn)||'';''||'+#13+
              '      (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.jobdept) DEPTNAME '+#13+
              '       FROM  pimpmas A, pimeempfix B '+#13+
              ' WHERE a.ORGNUM  = b.eORGNUM(+)      '+#13+
              '   AND a.jobdept = b.ejobdept(+)     '+#13+
              '   AND a.empno   = b.eempno(+)       '+#13+
              '   AND (A.empno = '''+ Loginemp.Text +''') ';
  Csel_Open;
  FL_deptcode := TCsel_gfd(1);
  FL_payrayn  := TCsel_gfd(2);
  L_DEPTNAME.LabelCaption := TCsel_gfd(3);

  if (FL_payrayn = 'N') Then
  Begin
    if Not((FG_Group = 'G001') or (FG_Group = 'G011')) Then
    Begin
      MessageDlg('평가 담당자가 아닙니다.'+#13+
                 '프로그램을 종료합니다.',mtInformation,[mbOk],0);
      ExitBtnClick(ExitBtn);
      System.exit;
    End;
  End
  Else Select_BaseData;
end;

procedure TFM_Main.Select_BaseData;
begin
  sSQL :=  'SELECT A.EMPNO, A.KORNAME, '+
           '       DECODE(FINDHIRE(A.EMPNO), ''J'',''무기계약직'', ''P'',''계약직'',''Q'',''계약직'',''Y'',''파견직'', '''') PSTATE, '+
           '       SUBSTR(A.EMPDATE   ,1,4)||''-''||SUBSTR(A.EMPDATE   ,5,2)||''-''||SUBSTR(A.EMPDATE   ,7,2) EMPDATE,    '+
           '       SUBSTR(A.OTDUFRDATE,1,4)||''-''||SUBSTR(A.OTDUFRDATE,5,2)||''-''||SUBSTR(A.OTDUFRDATE,7,2) OTDUFRDATE, '+
           '       SUBSTR(A.OTDUTODATE,1,4)||''-''||SUBSTR(A.OTDUTODATE,5,2)||''-''||SUBSTR(A.OTDUTODATE,7,2) OTDUTODATE, '+
           '       Ceil(TO_DATE(OTDUTODATE, ''YYYYMMDD'') - SYSDATE )                                         JANDATE,    '+
           '      (SELECT EXTYN FROM PEPYMAS WHERE A.EMPNO = EMPNO)                                           EXTYN,      '+
           '      (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I702'' AND A.TJOBDUTY   = CODENO)            JOBGUN,     '+
           '      (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I703'' AND A.TDUTYCLASS = CODENO)            YPLEVEL     '+
           '  FROM PIMPMAS A '+
           ' WHERE PSTATE < ''80''   '+
           '   AND EMPNO Like ''Y%'' '+
           '   AND EXISTS (SELECT * FROM PIMEEMP ' +
           '               WHERE EMPNO = A.EMPNO ' +
           '                 AND EEMPNO = '''+ Loginemp.Text +''' )' ;

  if RB1.Checked Then
     sSQL := sSQL + ' AND TO_CHAR(TO_DATE(OTDUTODATE, ''YYYYMMDD'') - TO_DATE(TO_CHAR(SYSDATE, ''YYYYMMDD''), ''YYYYMMDD'')) <= 45';

  sSQL := sSQL + 'Order By 7';

  with T_Grid do
  begin
    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('EMPNO'      , ftString, 100);
    AddField('KORNAME'    , ftString, 100);
    AddField('PSTATE'     , ftString, 100);
    AddField('EMPDATE'    , ftString, 100);
    AddField('OTDUFRDATE' , ftString, 100);
    AddField('OTDUTODATE' , ftString, 100);
    AddField('JANDATE'    , ftString, 100);
    AddField('EXTYN'      , ftString, 100);
    AddField('JOBGUN'     , ftString, 100);
    AddField('YPLEVEL'    , ftString, 100);
    ClearParamInfo;
    SQL.Text := sSQL;
    Open;
  end;
end;

procedure TFM_Main.DB_GridCellClick(Column: TColumn);
begin
  DS_GridDataChange(DB_Grid,T_Grid.Fields[0]);
end;

procedure TFM_Main.DS_GridDataChange(Sender: TObject; Field: TField);
var
  sCONYN, ssSQL, sEXT : String;
begin
  ComponentClear;
  sEXT := '';

  if T_Grid.fieldbyname('EMPNO').AsString = '' Then
  Begin
    MessageDlg('평가 대상자가 존재하지 않습니다.',mtInformation,[mbOk],0);
    Exit;
  End;

  Ed_empno1.ValueCaption  := T_Grid.fieldbyname('EMPNO').AsString;
  L_Korname1.ValueCaption := T_Grid.fieldbyname('KORNAME').AsString;
  L_JOBGUN.ValueCaption   := T_Grid.fieldbyname('JOBGUN').AsString;
  L_YPLEVEL.ValueCaption  := T_Grid.fieldbyname('YPLEVEL').AsString;
  empPicture(Ed_empno1.ValueCaption);

  ssSQL :='SELECT EMPNO, EMPDATE, GROUPEMPDATE, '+
          '       To_Char(Add_months(To_Date(nvl(GROUPEMPDATE, EMPDATE),''YYYYMMDD''),12),''YYYYMMDD'') EMPDATE12, '+
          '       To_Char(SYSDATE, ''YYYYMMDD'') TODAY '+
          '  FROM PIMPMAS         '+
          ' WHERE PSTATE < ''80'' '+
          '   AND EMPNO = '''+ Ed_empno1.ValueCaption +''' ';

  With TCDS do
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('EMPNO'       , ftString, 100);
       AddField('EMPDATE'     , ftString, 100);
       AddField('GROUPEMPDATE', ftString, 100);
       AddField('EMPDATE12'   , ftString, 100);
       AddField('TODAY'       , ftString, 100);
       ClearParamInfo;
       SQL.Text := ssSQL;
       Open;

       sEXT := 'N';
       if Fieldbyname('TODAY').AsString <= Fieldbyname('EMPDATE12').AsString Then sEXT := 'Y';
  end;

  ssSQL :='SELECT EMPNO,   KORNAME,   EXTYN,   E2OPINION1, '+
          '       E1MPNO,  E1KORNAME, EXTDUTY, E2OPINION2, '+
          '       CONYN,   ''field10'' '+
          '  FROM PEPYMAS '+
          ' WHERE EMPNO = '''+ Ed_empno1.ValueCaption +''' ';

  With TCDS do
  begin
    Close;
    ServiceName := 'HINSA_select10';
    ClearFieldInfo;
    AddField('EMPNO'      , ftString, 100);
    AddField('KORNAME'    , ftString, 100);
    AddField('EXTYN'      , ftString, 100);
    AddField('E2OPINION1' , ftString, 100);
    AddField('E1MPNO'     , ftString, 100);
    AddField('E1KORNAME'  , ftString, 100);
    AddField('EXTDUTY'    , ftString, 100);
    AddField('E2OPINION2' , ftString, 100);
    AddField('CONYN'      , ftString, 100);
    AddField('field10'    , ftString, 100);
    ClearParamInfo;
    SQL.Text := ssSQL;
    Open;

    if   TCDS.RecordCount > 0 Then
    begin
         if   Fieldbyname('EXTYN').AsString = 'Y' Then RB3.Checked := True
         Else                                          RB4.Checked := True;
         Ed_empno.Text          := fieldbyname('E1MPNO').AsString;
         L_Korname.ValueCaption := fieldbyname('E1KORNAME').AsString;
         L_EXTDUTY.Text         := fieldbyname('EXTDUTY').AsString;
         sCONYN                 := fieldbyname('CONYN').AsString;
    end;
  end;

  /////////////////////////////////////////////////////////////////////////
  ssSQL := 'Select Empno, Korname, E1mpno, E2opinion1, E2opinion2 '+
           '  FROM PEPYMAS    '+
           ' WHERE EMPNO = '''+ Ed_empno1.ValueCaption +''' ';

  With TCDS do  //dsa2000
  begin
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('Empno'      , ftString, 2000);
       AddField('Korname'    , ftString, 2000);
       AddField('E1mpno'     , ftString, 2000);
       AddField('E2opinion1' , ftString, 2000);
       AddField('E2opinion2' , ftString, 2000);
       ClearParamInfo;
       SQL.Text := ssSQL;
       Open;
       E_E2OPINION1.text := FieldByName('E2OPINION1').AsString;
       E_E2OPINION2.text := FieldByName('E2OPINION2').AsString;
  end;

  if sCONYN = 'Y' then //팀장완료 최종완료
  begin
       Bt_insert.Enabled    := False;
       Bt_Confirm.Enabled   := False;
       RG.Enabled           := False;
       RB3.Enabled          := False;
       RB4.Enabled          := False;
       E_E2OPINION1.Enabled := False;
       Ed_empno.Enabled     := False;
       L_EXTDUTY.Enabled    := False;
       E_E2OPINION2.Enabled := False;
       ms1.Visible          := True;
  end
  else
  begin
       Bt_insert.Enabled    := True;
       Bt_Confirm.Enabled   := True;
       RG.Enabled           := True;
       RB3.Enabled          := True;
       RB4.Enabled          := True;

       if  sEXT = 'Y' Then RB3.Enabled := True
       Else                RB3.Enabled := False;

       E_E2OPINION1.Enabled := True;
       Ed_empno.Enabled     := True;
       L_EXTDUTY.Enabled    := True;
       E_E2OPINION2.Enabled := True;
       Bt_insert.Enabled    := True;
       Bt_Confirm.Enabled   := True;
       ms1.Visible          := False;
  end;
end;

function TFM_Main.TCsel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('SEL_DATA').AsString;
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

procedure TFM_Main.Csel_Open;
begin
  Csel_ret := False;
  with TCsel do
  begin
  Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 5000);
       ClearParamInfo;
       SQL.Text := Csel_SQL;
       Open;
       if  RecordCount > 0 then     Csel_ret := True;
  end;
end;

procedure TFM_Main.Bt_insertClick(Sender: TObject);
var SQLText, Checkinx, JobMode: String;
begin
  If Not (Data_Check) Then Exit;

  if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

  with TCDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT empno , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEPYMAS                                                 '+
                ' WHERE empno   = ''' + ED_empno1.ValueCaption + '''            ';

    ClearFieldInfo;
    AddField('EMPNO'     , ftString,  100);
    AddField('field2'    , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    if  ( TCDS1.RecordCount < 1 )  then JobMode :='I'
    else                                JobMode :='U';
  end;

  If      RB3.Checked = True Then Checkinx := 'Y'
  else if RB4.Checked = True Then Checkinx := 'N'
  else    Checkinx := '';

  if JobMode = 'I' then
  begin
    SQLText:= 'INSERT INTO PEPYMAS                                   '+#13+
              '   (EMPNO,  KORNAME,    EXTYN,   E2OPINION1,          '+#13+
              '    E1MPNO, E1KORNAME,  EXTDUTY, E2OPINION2,          '+#13+
              '    WRITEMAN, WRITETIME)                              '+#13+
              '  VALUES                                              '+#13+
              '   ('''+ Ed_empno1.ValueCaption     +''',             '+#13+
              '    '''+ L_Korname1.ValueCaption    +''',             '+#13+
              '    '''+ Checkinx                   +''',             '+#13+
              '    '''+ E_E2OPINION1.Lines.Text    +''',             '+#13+
//              '    '''+ E_E2OPINION1.Text          +''',             '+#13+
              '    '''+ Ed_empno.Text              +''',             '+#13+
              '    '''+ L_Korname.ValueCaption     +''',             '+#13+
              '    '''+ L_EXTDUTY.Text             +''',             '+#13+
              '    '''+ E_E2OPINION2.Lines.Text    +''',             '+#13+
//              '    '''+ E_E2OPINION2.Text          +''',             '+#13+
              '    '''+ Pempno                     +''',             '+#13+
              '    TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')               '+#13+
              '   ) ';

  end
  Else
  Begin
    SQLText := Format(
              'UPDATE PEPYMAS  SET                                       ' +#13+
              '       KORNAME     = '''+L_Korname1.ValueCaption+''',     ' +#13+
              '       EXTYN       = '''+Checkinx+''' ,                   ' +#13+
              '       E2OPINION1  = '''+E_E2OPINION1.Lines.Text+''',     ' +#13+
              '       E1MPNO      = '''+Ed_empno.Text+''' ,              ' +#13+
              '       E1KORNAME   = '''+L_Korname.ValueCaption+''',      ' +#13+
              '       EXTDUTY     = '''+L_EXTDUTY.Text+''',              ' +#13+
              '       E2OPINION2  = '''+E_E2OPINION2.Lines.Text+''',     ' +#13+
              '       WRITEMAN    = '''+Pempno+''',                      ' +#13+
              '       WRITETIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')' +#13+
              ' WHERE EMPNO       = ''%s'' ' ,
              [Ed_empno1.ValueCaption ]);

  End;
  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Select_BaseData;
  end;

end;

procedure TFM_Main.Bt_ConfirmClick(Sender: TObject);
var
  SQLTEXT  : String;
begin
  with TCDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Text := 'SELECT empno , ''field2'', ''field3'', ''field4'',''field5''   '+
                '  FROM PEPYMAS                                                 '+
                ' WHERE empno   = ''' + ED_empno1.ValueCaption + '''            ';

    ClearFieldInfo;
    AddField('EMPNO'     , ftString,  100);
    AddField('field2'    , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    if  ( TCDS1.RecordCount < 1 )  then
    Begin
      MessageDlg('입력된 자료가 존재하지 않습니다.' ,mtError, [mbOK], 0);
      Exit;
    End;
  end;

  If Not (Data_Check) Then Exit;

  if Application.MessageBox('최종완료된 자료는 수정할 수 없습니다. 최종완료 하시겠습니까?','작업안내',mb_yesno) = id_no then system.exit;

//  Bt_insertClick(Sender);
  SQLText := Format(
            'UPDATE PEPYMAS  SET      ' +#13+
            '       CONYN   = ''Y'',  ' +#13+
            '       WRITEMAN  = '''+Pempno+''',                        ' +#13+
            '       WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
            ' WHERE EMPNO     = ''%s'' ' ,
            [Ed_empno1.ValueCaption]);

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
    MessageDlg('최종완료 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' , mtError,[mbOK],0)
  else
  begin
    MessageDlg('최종완료 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Bt_insert.Enabled  := False;
    Bt_Confirm.Enabled := False;
  end;

  SendMail;
end;

procedure TFM_Main.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  MemoText : string;
begin
  i := 222;
  if  key = i then
  begin
    Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
    MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
    TOnMemo(Sender).Clear;
    TOnMemo(Sender).Lines.Append(MemoText);
  end;
end;

procedure TFM_Main.E_E2OPINION1Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',E_E2OPINION1.Text) > 0) then E_E2OPINION1.Text := '';
  if (Pos('(Max 1000Byte)',E_E2OPINION2.Text) > 0) then E_E2OPINION2.Text := '';

  E_E2OPINION1.Font.Color := clBlack;
  E_E2OPINION2.Font.Color := clBlack;
end;

procedure TFM_Main.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.empPicture(mEmpno : string);
var
  FL_Image   : TStream;
  GifHeader  : TOnGifHeader;
  JpegHeader : TOnJpegHeader;
begin
  perimage.Picture := nil;

  with Cphoto do
    begin
      ServiceName := 'PIB2020B_pic';
      Close;
      ClearParamInfo;
      AddParam('empno', 4 , '1000');

      ParamInfo[0].Value := mEmpno;

      ClearFieldInfo;
      AddField('EMPNO', ftString,  4);
      AddField('PHOTO', ftBlob,    0);
      Open;

      if Cphoto.RecordCount = 0 then
        begin
          Close;
          System.Exit;
        end;

      try
        FL_Image := nil;
        FL_Image := TDataSet(Cphoto).CreateBlobStream(TBlobField(FieldByName('photo')),bmRead);
        FL_Image.Seek(0,soFromBeginning);
        ReadPicCheck(FL_Image, GifHeader, Sizeof(GifHeader));
        if (UpperCase(GifHeader.Signature) = 'GIF') then
          ReadGifBlob(FL_Image, perimage)
        else
          begin
            FL_Image.Seek(0,soFromBeginning);
            ReadPicCheck(FL_Image, JpegHeader, Sizeof(JpegHeader));
            if (JpegHeader.StartImage <> $d8ff) and (JpegHeader.Reserved <> $e0ff) then
              perimage.Picture.Assign(TBlobField(FieldByName('photo')))
            else
              ReadJpegBlob(FL_Image, perimage);
          end;
      finally
      end;
    end;
  Cphoto.Close;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if  Fm_EmpForm.Korname <> '' then
  begin
       Ed_empno.Text           := Fm_EmpForm.empno;
       L_korname.ValueCaption  := Fm_EmpForm.Korname;
//       Select_BaseData;
  end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
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
  //  Select_BaseData;      //dsa2000
    Key := #0;
  end;
end;

procedure TFM_Main.RB1Click(Sender: TObject);
begin
  if (RB1.Checked = True) Then  RB2.Checked := False;
  if (RB2.Checked = True) Then  RB1.Checked := False;

  Select_BaseData;
end;

procedure TFM_Main.LoginempKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Bt_SrhClick(sender);
end;

function TFM_Main.Data_Check: boolean;
Begin
  Result := False;

  if trim(Ed_empno1.ValueCaption ) = '' Then Begin MessageDlg('사원을 선택하시기 바랍니다..' ,mtError, [mbOK], 0); exit; End;
  if (RB3.Checked = False) Then
  Begin
    if (RB4.Checked = False) Then
    Begin
      MessageDlg('계약 연장여부를 선택 하시기 바랍니다.' ,mtError, [mbOK], 0);  RG.SetFocus; Exit;
    End;
  End;

  If (RB4.Checked = True) Then
  Begin
    if trim(E_E2OPINION1.Text) = '' Then Begin MessageDlg('의견을 입력하시기 바랍니다.' ,mtError, [mbOK], 0); E_E2OPINION1.SetFocus; exit; End;
    if trim(Ed_empno.Text)     = '' Then Begin MessageDlg('담당자을 선택하시기 바랍니다..' ,mtError, [mbOK], 0); Ed_empno.SetFocus; exit; End;
    if trim(L_EXTDUTY.Text)    = '' Then Begin MessageDlg('활용직무을 입력하시기 바랍니다..' ,mtError, [mbOK], 0); L_EXTDUTY.SetFocus; exit; End;
    if trim(E_E2OPINION2.Text) = '' Then Begin MessageDlg('요청사항을 입력하시기 바랍니다.' ,mtError, [mbOK], 0); E_E2OPINION2.SetFocus; exit; End;
  End;

  Result := True;
End;

procedure TFM_Main.ComponentClear;
begin
  Bt_insert.Enabled    := False;
  Bt_Confirm.Enabled   := False;
  RG.Enabled           := False;
  E_E2OPINION1.Enabled := False;
  Ed_empno.Enabled     := False;
  L_EXTDUTY.Enabled    := False;
  E_E2OPINION2.Enabled := False;

  Ed_empno1.ValueCaption  := '';
  L_Korname1.ValueCaption := '';
  L_JOBGUN.ValueCaption   := '';
  L_YPLEVEL.ValueCaption  := '';

  perimage.picture.Graphic := nil;

  RB3.Checked := False;
  RB4.Checked := False;

  E_E2OPINION1.Lines.Clear;
  L_EXTDUTY.Lines.Clear;
  E_E2OPINION2.Lines.Clear;

  Ed_empno.Text          := '';
  L_Korname.ValueCaption := '';
  L_JOBGUN.ValueCaption  := '';
  L_YPLEVEL.ValueCaption := '';
end;


procedure TFM_Main.RB3Click(Sender: TObject);
begin
  if (RB3.Checked = True) Then  RB4.Checked := False;
  if (RB4.Checked = True) Then  RB3.Checked := False;
end;

procedure TFM_Main.SendMail;
var
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
  ssSQL, sValue1, sValue2, sValue3 : String;
begin
  ssSQL := 'SELECT VALUE1, VALUE2, VALUE3, '+
           '       '''' F4, '''' F5        '+
           '  FROM PEAVARI        '+
           ' WHERE S_NO = ''001'' ';

  With TCDS do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('VALUE1', ftString, 100);
    AddField('VALUE2', ftString, 100);
    AddField('VALUE3', ftString, 100);
    AddField('F4'    , ftString, 100);
    AddField('F5'    , ftString, 100);
    ClearParamInfo;
    SQL.Text := ssSQL;
    Open;

    sValue1 := Fieldbyname('VALUE1').AsString;
    sValue2 := Fieldbyname('VALUE2').AsString;
    sValue3 := Fieldbyname('VALUE3').AsString;
  end;


  SendProgID  := 'PEF7010A';
  SendEmpno   := Pempno;
  MailSubject :=  '파견사원 계약만료 안내';
  MailBody    :=  '**************************************************' + chr(13) + chr(10) + chr(13) + chr(10) +
                   L_Korname1.ValueCaption+'('+Ed_empno1.ValueCaption+') 사원의 평가가 완료 되었습니다. ' + chr(13) + chr(10) + chr(13) + chr(10) +
                  '종합인사 ▶ 평가 ▶ 파견사원 평가관리에서 '+ chr(13) + chr(10) +
                  '파견사원의 계약기간을 확인하시기 바랍니다.' + chr(13) + chr(10) + chr(13) + chr(10) +
                  '**************************************************'  + chr(13) + chr(10);

  ReceiveYN   := 'N';


  //HR팀 담당자에게 전송
  Send_WebHint(SendProgID, SendEmpno, sValue1, MailSubject, MailBody, ReceiveYN);
  Send_WebHint(SendProgID, SendEmpno, sValue2, MailSubject, MailBody, ReceiveYN);
end;

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
      ServiceName := 'PIT1030A_DML';
      if NOT Execute then Exit;
   except
      Result := false;
      exit;
   end;
   Result := True;

  end;
end;

end.


