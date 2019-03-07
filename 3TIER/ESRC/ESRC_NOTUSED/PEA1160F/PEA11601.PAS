{=============================== Program Header ================================
 PROGRAM-NAME   : 1,2차 평가담당자 조회[PEA1160F]
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 1,2차 평가담당자
 Programmer     : 1,2차 평가담당자 내역조회
 Version        :
 Date           :
Update Contents
  버전    수정일        수정자       수정내용                관련근거
  1.00    2012.10.22     이희용   신규개발                   HR팀 요청
================================================================================}

unit PEA11601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme;

type
  TFpea11601 = class(TForm)
    TMaxSession: TTMaxSession;
    SF_Main: TOnSchemeForm;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Eempno: TTMaxPersonPopupEdit;
    deptname: TOnEdit;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    E1Empno: TOnEdit;
    E1deptname: TOnEdit;
    E2deptname: TOnEdit;
    E2Empno: TOnEdit;
    Jobfield: TOnEdit;
    Dutykind: TOnEdit;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Shape5: TShape;
    OnSectionLabel3: TOnSectionLabel;
    BBupdate: TOnFocusButton;
    BBclose: TOnFocusButton;
    PUpdate: TGroupBox;
    EEdit: TMemo;
    BBMail: TOnFocusButton;
    Shape7: TShape;
    Label4: TLabel;
    TDS_Com: TTMaxDataSet;
    Label5: TLabel;
    procedure BBcloseClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoReadEnded(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBupdateClick(Sender: TObject);
    procedure BBMailClick(Sender: TObject);
  private
    { Private declarations }
    DBErrMsg : Array[0..255] of char;
    function CheckOfMember(Parameter: String): Boolean;
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  public
    { Public declarations }
    GSempno, GSkorname, GSpass, GSgrade, userid, word, GSsysdate, GSpEMP, FG_Date, SqlText : String;
    GSorgnum, GSdeptcode, GSempnoOf, GSkornameOf : String;
    GSintrate : Real;
    CheckOfGrid : Boolean;
    sRabasdate, sOrgnum : String;
    Workemp1, Workemp2, Workemp3, Workemp4 : String;
    procedure SetNow;
  end;

var
  Fpea11601: TFpea11601;

implementation

uses KeyEmpno;
{$R *.DFM}

procedure TFpea11601.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  Fpea11601.Height := 350;
end;

procedure TFpea11601.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);

  Lempno.Caption    := GSkorname + '(' + GSempno +')';
  Lsysdate.Caption  := Copy(FG_Date,1,4)+'/'+Copy(FG_Date,5,2)+'/'+Copy(FG_Date,7,2);
  Pgrade            := copy(GSgrade,3,1);

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
  if  (GSempno = workemp1) or (GSempno = workemp2) or (GSempno = workemp3) or (GSempno = workemp4) or (copy(GSempno,1,1) = 'D') then
  Begin
    Eempno.Enabled := True;
    CheckOfMember(GSempno);
  End
  else
  Begin
    Eempno.Enabled := False;

    if not CheckOfMember(GSempno) then
    begin
      MessageDlg('평가대상자가 아닙니다.', mtWarning, [mbOK], 0);
      Close;
    end;
  End;
end;

procedure TFpea11601.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Eempno.PL_get_singledata;
    Eempno.Text := Copy(Eempno.empno,1,4);

    Key := #0;

    if not CheckOfMember(Trim(Copy(Eempno.Text,1,4))) then
    begin
      MessageDlg('평가대상자가 아닙니다.', mtWarning, [mbOK], 0);
      Eempno.Text := '';
      Exit;
    end;

  end;
end;

procedure TFpea11601.EempnoReadEnded(Sender: TObject);
begin
  Eempno.Text := Copy(Eempno.empno,1,4);
  CheckOfMember(Trim(Copy(Eempno.Text,1,4)));
end;

// 사우회원인지 여부 체크 리턴값은 TRUE or FALSE
function TFpea11601.CheckOfMember(Parameter: String): Boolean;
begin
//  Eempno.Text :=  GSempno + ' ' + GSkorname;
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    Sql.Text := ' SELECT EMPNO     ||'' ''||KORNAME EMPNO, ' +
                '        DEPTCODE  ||'' ''||(SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = '''+ sOrgnum +''' AND DEPTCODE =A.DEPTCODE)   DEPTCODE, ' +
                '        JOBGUN    ||'' ''||(SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I115'' AND CODENO = A.JOBGUN) JOBGUN, ' +
                '        JOBKIND   ||'' ''||(SELECT DUTYKINDNAME FROM PISHRDUKIND WHERE DUTYKIND = A.JOBKIND) JOBKIND,           ' +
                '        E1EMPNO   ||'' ''||E1KORNAME E1EMPNO,                                                                   ' +
                '        E1DEPTCODE||'' ''||(SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = '''+ sOrgnum +''' AND DEPTCODE =A.E1DEPTCODE) E1DEPTCODE, ' +
                '        E2EMPNO   ||'' ''||E2KORNAME E1EMPNO,                                                                   ' +
                '        E2DEPTCODE||'' ''||(SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = '''+ sOrgnum +''' AND DEPTCODE =A.E2DEPTCODE) E2DEPTCODE, ' +
                '        DEPTCODE  ||'' ''||(SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = '''+ sOrgnum +''' AND DEPTCODE =A.DEPTCODE)   DEPTCODE, ' +
                '        ''feild9'',''feild10'' ' +
                ' FROM PEHREMAS A ' +
                ' WHERE A.RABASDATE = '''+ sRabasdate +''' ' +
                '   AND A.EMPNO     = '''+ Parameter  +''' ' ;

    ClearFieldInfo;
    AddField('EMPNO'      , ftString, 100);
    AddField('DEPTCODE'   , ftString, 100);
    AddField('JOBGUN'     , ftString, 100);
    AddField('JOBKIND'    , ftString, 100);
    AddField('E1EMPNO'    , ftString, 100);
    AddField('E1DEPTCODE' , ftString, 100);
    AddField('E2EMPNO'    , ftString, 100);
    AddField('E2DEPTCODE' , ftString, 100);
    AddField('field9'     , ftString, 100);
    AddField('field10'    , ftString, 100);
    Open;

    if RecordCount <= 0 then CheckOfMember := False
    else
    Begin
      Eempno.Text     := Fields[0].AsString;
      deptname.Text   := Fields[1].AsString;
      Jobfield.Text   := Fields[2].AsString;
      Dutykind.Text   := Fields[3].AsString;
      E1Empno.Text    := Fields[4].AsString;
      E1deptname.Text := Fields[5].AsString;
      E2Empno.Text    := Fields[6].AsString;
      E2deptname.Text := Fields[7].AsString;

      CheckOfMember := True;
    End;
  end;
end;

procedure TFpea11601.SetNow;
begin
  with TDS_Com do
  begin
    ServiceName := 'HINSA_select10';
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

procedure TFpea11601.BBupdateClick(Sender: TObject);
begin
  Fpea11601.Height := 495;
end;

procedure TFpea11601.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpea11601.BBMailClick(Sender: TObject);
var
   SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
  SendProgID  := 'PEA1160F';
  SendEmpno   := Copy(Eempno.Text,1,4);
  RcveEmpno   := workemp1;               //hr팀 2015년 평가담당자(이명노 M)

  MailSubject := ' (' +Eempno.Text + ') 구성원이 평가 기초자료 변경을 요청했습니다..';
  MailBody    := EEdit.Text;
  ReceiveYN   := 'N';
  exit;
  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
  Begin
    MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
    Fpea11601.Height := 350;

    EEdit.Text := '';
  End
  else
  begin
    MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
    exit;
  end
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert
Function TFpea11601.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDS_Com do
  begin
       ServiceName := 'PKA4040A_dml';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                         ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
       SQL.Add('        ''''                  )             ');  //EAI_DATE

       try
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

end.

