unit PZZ1040A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Grids, DBGrids, pass, Csreg, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPersonEdit, OnFocusButton, ExtCtrls, OnScheme,
  Buttons, MemDS, DBAccess, Ora, ShellApi, OnEditNumCtl, ComCtrls,
  Func, Winsock, OnRadioBtn, OnInsaCommon;

type
  TF_DBCheck = class(TForm)
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    BT_Info2Order: TButton;
    Label1: TLabel;
    DataSource1: TDataSource;
    M_Check: TMemo;
    OraQuery1: TOraQuery;
    Q_MainGrid: TOraQuery;
    Q_DML1: TOraQuery;
    KillMemo: TMemo;
    Insert_Timer: TTimer;
    Kill_Timer_INFO: TTimer;
    Kill_Timer_EAI: TTimer;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    OraQuery2: TOraQuery;
    Timer_Hperson: TTimer;
    Q_DML3: TOraQuery;
    Q_DML2: TOraQuery;
    Memo2: TMemo;
    OraQuery3: TOraQuery;
    SF_Main: TOnSchemeForm;
    BT_Pzsqlhis: TButton;
    Btn_Session1: TOnFocusButton;
    Btn_Session3: TOnFocusButton;
    BT_css_empv: TOnFocusButton;
    BT_Close: TOnFocusButton;
    BT_CertInsert: TButton;
    procedure Btn_Session1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_Info2OrderClick(Sender: TObject);
    procedure BT_CertInsertClick(Sender: TObject);
    procedure Btn_Session3Click(Sender: TObject);
    procedure Insert_TimerTimer(Sender: TObject);
    procedure BT_P_CONF_CloseClick(Sender: TObject);
    procedure Kill_Timer_INFOTimer(Sender: TObject);
    procedure Kill_Timer_EAITimer(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure Timer_HpersonTimer(Sender: TObject);
    procedure BT_css_empvClick(Sender: TObject);
    procedure BT_PzsqlhisClick(Sender: TObject);
  private
    { Private declarations }
    vKillSql : String;

  public
    { Public declarations }
    procedure MOUSEWHEELMessage(var Msg: TMsg; var handled: Boolean);
  end;

var
  F_DBCheck: TF_DBCheck;
  LocalName : String;

implementation

{$R *.DFM}
function GetLocalIP: string;
var
  WSAData : TWSAData; //Winsock
  HostEnt : PHostEnt;
  HostName, IPAddress: String;
begin
  WSAStartup(2, WSAData);
  SetLength(HostName, 255);
  GetHostname(PChar(HostName), 255);
  SetLength(HostName, StrLen(PChar(HostName)));
  HostEnt := GetHostByName(PChar(HostName));

  with HostEnt^ do
    IPAddress := Format('%d.%d.%d.%d',[Byte(h_addr^[0]), Byte(h_addr^[1]),
                        Byte(h_addr^[2]), Byte(h_addr^[3])]);
                        
  WSACleanup;

  LocalName := UpperCase(Trim(HostName));
  Result    := Trim(IPAddress);
end;

procedure TF_DBCheck.FormCreate(Sender: TObject);
begin
  F_DBCheck.Top  := 430;
  F_DBCheck.Left := -15;
  Application.ProcessMessages;

  OraConnect;

  Application.OnMessage := MOUSEWHEELMessage; //디비그리드에서 마우스 휠작동을 위한 Application Message 설정.
end;

procedure TF_DBCheck.FormShow(Sender: TObject);
begin
  Insert_Timer.Interval    := 60 * 1000 * 2;  //분.
  Kill_Timer_EAI.Interval  :=      1000 * 1;  //초.
  Kill_Timer_INFO.Interval :=      1000 * 1;  //초.
  Timer_Hperson.Interval   :=      1000 * 30; //초.

  KillMemo.Clear;
  Memo2.Visible := False;

  //Btn_Session1Click(Sender);
  SF_Main.Caption.Text := ' [ DB Check ] - ' + GetLocalIP + ' ' + LocalName;
end;

procedure TF_DBCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TF_DBCheck.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

////////////////////////////////////////////////////////////////////////////////

//디비그리드에서 마우스 휠작동을 위한 Application Message 구현.
procedure TF_DBCheck.MOUSEWHEELMessage(var Msg: TMsg; var handled: Boolean);
begin
  if Msg.Message = WM_MOUSEWHEEL then
  begin
       if  (ActiveControl = TControl(DBGrid2)) then
       Begin
            if Msg.wParam > 0 then
            begin
                 keybd_event(VK_UP, VK_UP, 0, 0);
                 keybd_event(VK_UP, VK_UP, KEYEVENTF_KEYUP, 0);
            end
            else if Msg.wParam < 0 then begin
                 keybd_event(VK_DOWN, VK_DOWN, 0, 0);
                 keybd_event(VK_DOWN, VK_DOWN, KEYEVENTF_KEYUP, 0);
            end;
            ActiveControl.Invalidate;
       end;
  end;
end;

procedure TF_DBCheck.Btn_Session1Click(Sender: TObject);
begin
  With Q_MainGrid do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select S.SID, P.SPID PID, S.SERIAL# SERIAL, S.USERNAME,                   ');
       Sql.Add('       S.MACHINE, S.TERMINAL, S.PROGRAM, S.LOGON_TIME,                    ');
       Sql.Add('       decode(S.MACHINE, ''SKCC14D00495'',''강'', ''SKCC14D00543'',''이'',');
       Sql.Add('                         ''SKCC14D00487'',''송'', ''SKCC14D00541'',''정'',');
       Sql.Add('                         ''SKCC14D00488'',''하'',                         ');
       Sql.Add('       decode(S.TERMINAL,''SKCC14D00495'',''강'', ''SKCC14D00543'',''이'',');
       Sql.Add('                         ''SKCC14D00487'',''송'', ''SKCC14D00541'',''정'',');
       Sql.Add('                         ''SKCC14D00488'',''하'',                         ');
       Sql.Add('           nvl((Select Korname||''-''||S.OSUSER From Pimpmas              ');
       Sql.Add('                 Where Empno = Substr(S.TERMINAL,-4)), S.OSUSER))) OSUSER,');
       Sql.Add('       (Select distinct Progname From Pymenulist                          ');
       Sql.Add('         Where Tier=2 And Progid = Substr(S.PROGRAM,1,8)) Progname        ');
       Sql.Add('  From V$SESSION S, V$PROCESS P                                           ');
       Sql.Add(' Where S.PADDR = P.ADDR                                                   ');
       Sql.Add('   And UPPER(S.OSUSER) NOT IN (''ORACLE11'',''TMAX'',''CUBEONE'',''EAI'',''TOMADM'') ');//System User 제외.
       Sql.Add(' ORDER BY S.USERNAME, S.MACHINE                                           ');//Memo1.Lines.Add(Sql.Text);
       Open;
  end;
  M_Check.Lines.Text :=  Q_MainGrid.Sql.Text;
end;

procedure TF_DBCheck.Btn_Session3Click(Sender: TObject);
begin
  With Q_MainGrid do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select distinct USERNAME, OSUSER, MACHINE, TERMINAL, PROGRAM,');
       Sql.Add('       to_char(logon_time,''YYYY-MM-DD'') logon_time         ');
       Sql.Add('  From hper.pzdblog                                          ');
       Sql.Add(' Where to_char(logon_time,''YYYYMMDD'')                      ');
       Sql.Add('    >= to_char(sysdate-30,''YYYYMMDD'')                      ');
       Sql.Add(' ORDER BY USERNAME, MACHINE, logon_time                      ');
       Open;
  end;
  M_Check.Lines.Text :=  Q_MainGrid.Sql.Text;
end;

//비인가자 & 비인가 Program 기준으로 DB 접속자 Insert...........................
procedure TF_DBCheck.BT_CertInsertClick(Sender: TObject);
var vChkHoli : Boolean;
begin
  vChkHoli := False;
  With Q_DML1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select to_char(sysdate,''hh24'') vTime, ');
       Sql.Add('       to_char(sysdate,''D'')    vday   ');
       Sql.Add('  From dual                             ');
       Open;

       //Cron 작업시간에는 인가자 Log 안남기도록...
       if (FieldByName('vTime').AsString >= '05') And
          (FieldByName('vTime').AsString <= '06') then vChkHoli := False;

       Close;
       Sql.Clear;
       Sql.Add('Insert Into hper.PZDBLOG                                                 ');
       Sql.Add('      (INSERTTIME, SID, PID, SERIAL, USERNAME, OSUSER,                   ');
       Sql.Add('       MACHINE, TERMINAL, PROGRAM, LOGON_TIME)                           ');
       Sql.Add('Select to_char(sysdate,''yyyymmddhh24mi'') InsertTime,                   ');
       Sql.Add('       S.SID,       P.SPID PID,  S.SERIAL# SERIAL,                       ');
       Sql.Add('       S.USERNAME,  S.OSUSER,    S.MACHINE,                              ');
       Sql.Add('       S.TERMINAL,  S.PROGRAM,   S.LOGON_TIME                            ');
       Sql.Add('  From V$SESSION S,  V$PROCESS P                                         ');
       Sql.Add(' Where S.PADDR = P.ADDR                                                  ');
       Sql.Add('   And UPPER(S.OSUSER) NOT IN (''ORACLE11'',''TMAX'',''CUBEONE'',''EAI'')');//System User 제외.
       Sql.Add('   And UPPER(S.PROGRAM) NOT IN (''PDB_CHECK.EXE'')                       ');
       Sql.Add(' ORDER BY S.USERNAME, S.TERMINAL                                   ');
       ExecSql;
  end;
end;

procedure TF_DBCheck.BT_P_CONF_CloseClick(Sender: TObject);
begin
  OraQuery1.Close;
end;

procedure TF_DBCheck.BT_Info2OrderClick(Sender: TObject);
begin
  // 정보검색2(Select * From AQTABLES) - 사용자 질의 정렬시키는 SQL
  with Q_DML1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Update AQUSERQUERY A                                   ');
       Sql.Add('   SET SEQNO =                                         ');
       Sql.Add('   (Select SUBSTR(GROUPNAME,1,2)||SUBSTR(QUERYNAME,1,3)');
       Sql.Add('      From AQUSERQUERY B                               ');
       Sql.Add('     Where A.USERID    = B.USERID                      ');
       Sql.Add('       And A.GROUPNAME = B.GROUPNAME                   ');
       Sql.Add('       And A.QUERYNAME = B.QUERYNAME )                 ');
       ExecSQL;
  end;
  MessageDlg('정렬 완료', mtInformation, [mbOk], 0);
end;

procedure TF_DBCheck.Insert_TimerTimer(Sender: TObject);  //저장구문은 분 단위로...
begin
  BT_CertInsertClick(Sender);

  Btn_Session1Click(Sender);
end;

procedure TF_DBCheck.OnFocusButton1Click(Sender: TObject);
begin
  ShellExecute(0,'Open','http://broadnet.skbroadband.com/','','',SW_SHOWNORMAL);
end;

procedure TF_DBCheck.OnFocusButton3Click(Sender: TObject);
begin
  ShellExecute(0,'Open','http://mail.sk.com/owa/','','',SW_SHOWNORMAL);
end;

procedure TF_DBCheck.BT_css_empvClick(Sender: TObject);
var i : Integer;
begin
  M_Check.Text := '';
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;  //ft_eempfind(jobpayrayn, empno)
       Sql.Add('Select empno From Pimpmas Where (Pstate<''80'' or Pstate=''82'') Order by 1');
       Open;
  end;

  i := 0;
  while not OraQuery1.eof do
  begin
       with OraQuery2 do
       begin
            i := i + 1;
            Close;
            Sql.Clear;
            Sql.Add('Select empno, korname, deptcode, Eempno ');
            Sql.Add('  from css_empv                         ');
            Sql.Add(' where empno = :vEmpno                  ');
            ParamByName('vEmpno').AsString := OraQuery1.FieldByName('Empno').AsString;
            Open;
            {
            Label1.Caption := OraQuery2.FieldByName('empno').AsString;
            Label2.Caption := OraQuery2.FieldByName('korname').AsString;
            Label3.Caption := '직상위자 : ' + OraQuery2.FieldByName('eempno').AsString;  }

            Memo2.Visible := True;
            //////////////////////////////////////////////////////////////////////////////
            if OraQuery2.RecordCount <> 1 then //Showmessage(FieldByName('empno').AsString);
            begin
                 M_Check.Lines.Add(' 직상위자 중복 - ' +
                                 OraQuery2.FieldByName('empno').AsString   +' '+
                                 OraQuery2.FieldByName('korname').AsString +' '+
                                 OraQuery2.FieldByName('deptcode').AsString );
                 Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+'');
            end;

            if OraQuery2.FieldByName('Eempno').AsString = '' then //Showmessage(FieldByName('empno').AsString);
            begin
                 M_Check.Lines.Add(' 직상위자 Null - ' +
                                 OraQuery2.FieldByName('empno').AsString   +' '+
                                 OraQuery2.FieldByName('korname').AsString +' '+
                                 OraQuery2.FieldByName('deptcode').AsString );
                 Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+'');
            end
            else
            begin
                 if length(OraQuery2.FieldByName('korname').AsString) = 6 then
                    Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+
                                    OraQuery2.FieldByName('empno').AsString   +' '+
                                    OraQuery2.FieldByName('korname').AsString +
                                    '   -> 직상위자 : ' + OraQuery2.FieldByName('eempno').AsString)
                 else if length(OraQuery2.FieldByName('korname').AsString) < 5 then
                    Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+
                                    OraQuery2.FieldByName('empno').AsString   +' '+
                                    OraQuery2.FieldByName('korname').AsString +
                                    '     -> 직상위자 : ' + OraQuery2.FieldByName('eempno').AsString)
                 else if length(OraQuery2.FieldByName('korname').AsString) < 6 then
                    Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+
                                    OraQuery2.FieldByName('empno').AsString+' '+
                                    OraQuery2.FieldByName('korname').AsString +
                                    '    -> 직상위자 : ' + OraQuery2.FieldByName('eempno').AsString)
                 else if length(OraQuery2.FieldByName('korname').AsString) = 8 then
                    Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+
                                    OraQuery2.FieldByName('empno').AsString+' '+
                                    OraQuery2.FieldByName('korname').AsString +
                                    '  -> 직상위자 : ' + OraQuery2.FieldByName('eempno').AsString)
                 else if length(OraQuery2.FieldByName('korname').AsString) = 10 then
                    Memo2.Lines.Add(copy('    '+inttostr(i),Length('    '+inttostr(i))-4,5)+'  '+
                                    OraQuery2.FieldByName('empno').AsString+' '+
                                    OraQuery2.FieldByName('korname').AsString +
                                    '-> 직상위자 : ' + OraQuery2.FieldByName('eempno').AsString);
            end;
       end;

       OraQuery1.Next;
  end;

  ShowMessage(IntToStr(i)+' 건   작업 완료');
end;

procedure TF_DBCheck.BT_PzsqlhisClick(Sender: TObject);
begin
  with OraQuery3 do
  begin
       Close;
       Sql.Clear;        // --Module Is Not Null
       Sql.Add('Insert Into Hper.Pzsqlhis');
       Sql.Add('Select To_Char(Last_Active_Time,''YYYYMMDDHH24MISS'') Last_Active_Time, Parsing_Schema_Name, Module, Sql_Text,  ');
       Sql.Add('       Sql_Fulltext, To_Char(Sysdate,''YYYYMMDDHH24MISS'')                                                      ');
       Sql.Add('  From V$SQL                                                                                                    ');
       Sql.Add(' Where Module Not In (''PZZ1010A.EXE'',''PZZ1020A.EXE'',''PZZ1030A.EXE'',''PZZ1040A.EXE'',''PZDBCheck.exe'',''PZInsaMan.EXE'',''PZSAPMailSend.exe'',''pksendmsg@mis2 (TNS V1-V3)'')');
       Sql.Add('   And Parsing_Schema_Name Not In (''SYS'',''SYSTEM'',''ONM'',''DBSNMP'',''BACKUPADMIN'',''EXFSYS'',''XSERVER'')');
       Sql.Add('   And Upper(Trim(Sql_Text)) Not Like ''SELECT%''                                                               ');
       Sql.Add('   And To_Char(Last_Active_Time,''YYYYMMDD'') > ( Select Max(Last_Active_Time) From Hper.Pzsqlhis )             ');
     //Sql.Add(' Order By Last_Active_Time Desc;');
       ExecSql;
  end;
  M_Check.Lines.Add('저장완료');
end;


procedure TF_DBCheck.Kill_Timer_INFOTimer(Sender: TObject); //Kill 구문은 초 단위로..
begin
{  With Q_DML1 do  //SESSION KILL
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select S.SID,       P.SPID PID,  S.SERIAL# SERIAL,                 ');
       Sql.Add('       S.USERNAME,  S.OSUSER,    S.MACHINE,                        ');
       Sql.Add('       S.TERMINAL,  S.PROGRAM,   S.LOGON_TIME                      ');
       Sql.Add('  From V$SESSION S, V$PROCESS P                                    ');
       Sql.Add(' Where S.PADDR = P.ADDR                                            ');
       Sql.Add('   And UPPER(S.USERNAME) in (''HPERINFO'')                         ');
       Sql.Add('   And UPPER(S.PROGRAM)  Not in (''PZB1010A.EXE'',''PZB1030A.EXE'')');
       Open;

       vKillSql := '';
       if Q_DML1.RecordCount > 0 then
       begin
            BT_CertInsertClick(Sender);  //Kill 전에 저장.

            KillMemo.Lines.Add(FieldByName('LOGON_TIME').AsString +' - '+
                               FieldByName('USERNAME').AsString   +' - '+
                               FieldByName('TERMINAL').AsString  );

            vKillSql := 'Alter System Kill Session '              +''''+
                        IntToStr(FieldByName('SID').AsInteger)    +','+
                        IntToStr(FieldByName('SERIAL').AsInteger) +'''';
       end;

       Close;
       Sql.Clear;
       Sql.Add ( vKillSql );
       if vKillSql <> '' then ExecSQL;
       {Select * From v$session a, v$lock b, dba_objects c
         Where a.sid  = b.sid
           And b.id1  = c.object_id
           And b.type = 'TM'
           And c.object_name = 'OSS_GLOSSARY';
  end;                                          }
end;

procedure TF_DBCheck.Kill_Timer_EAITimer(Sender: TObject);
begin
{  With Q_DML2 do  //SESSION KILL
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select S.SID,       P.SPID PID,  S.SERIAL# SERIAL,                                ');
       Sql.Add('       S.USERNAME,  S.OSUSER,    S.MACHINE,                                       ');
       Sql.Add('       S.TERMINAL,  S.PROGRAM,   S.LOGON_TIME                                     ');
       Sql.Add('  From V$SESSION S, V$PROCESS P                                                   ');
       Sql.Add(' Where S.PADDR = P.ADDR                                                           ');
       Sql.Add('   And UPPER(S.USERNAME) in (''EAI'',''HPERSON'',''HPER'')                        ');
       Sql.Add('   And UPPER(S.PROGRAM)  in (''PINSAM.EXE'',''TORANGEMAIN.EXE'' ,''GOLDEN32.EXE'',');
       Sql.Add('                             ''TOAD.EXE''  ,''ACTIVESQLNET.EXE'',''SQLPLUSW.EXE'',');
       Sql.Add('                             ''SQL DEVELOPER'',''ORAN-C.EXE''  )                  ');
       Open;

       vKillSql := '';
       if Q_DML2.RecordCount > 0 then
       begin
            BT_CertInsertClick(Sender);  //Kill 전에 저장.

            KillMemo.Lines.Add(FieldByName('LOGON_TIME').AsString +' - '+
                               FieldByName('USERNAME').AsString   +' - '+
                               FieldByName('TERMINAL').AsString    );

            vKillSql := 'Alter System Kill Session '               +''''+
                        IntToStr(FieldByName('SID').AsInteger)     +','+
                        IntToStr(FieldByName('SERIAL').AsInteger)  +'''';
       end;

       Close;
       Sql.Clear;
       Sql.Add ( vKillSql );
       if vKillSql <> '' then ExecSQL;
  end;}
end;

procedure TF_DBCheck.Timer_HpersonTimer(Sender: TObject);
var X : Integer;
begin
{  With OraQuery2 do
  begin
       Close;      //미인가 접속자 알림.
       Sql.Clear;
       Sql.Add('Select S.SID,       P.SPID PID,  S.SERIAL# SERIAL,                       ');
       Sql.Add('       S.USERNAME,  S.OSUSER,    S.MACHINE,                              ');
       Sql.Add('       S.TERMINAL,  S.PROGRAM,   S.LOGON_TIME                            ');
       Sql.Add('  From V$SESSION S, V$PROCESS P                                          ');
       Sql.Add(' Where S.PADDR = P.ADDR                                                  ');
       Sql.Add('   And UPPER(S.USERNAME) in (''HPERSON'',''HPER'')                       ');
       Sql.Add('   And UPPER(S.OSUSER)   Not Like ''TMAX''                               ');
       Open;
  end;

  if OraQuery2.RecordCount > 0 then
  begin
       with Q_DML3 do
       begin  //저장.
            Close;
            Sql.Clear;
            Sql.Add('Insert Into hper.PZDBLOG                                                 ');
            Sql.Add('      (INSERTTIME, SID, PID, SERIAL, USERNAME, OSUSER,                   ');
            Sql.Add('       MACHINE, TERMINAL, PROGRAM, LOGON_TIME)                           ');
            Sql.Add('Select to_char(sysdate,''yyyymmddhh24mi'') InsertTime,                   ');
            Sql.Add('       S.SID,       P.SPID PID,  S.SERIAL# SERIAL,                       ');
            Sql.Add('       S.USERNAME,  S.OSUSER,    S.MACHINE,                              ');
            Sql.Add('       S.TERMINAL,  S.PROGRAM,   S.LOGON_TIME                            ');
            Sql.Add('  From V$SESSION S,  V$PROCESS P                                         ');
            Sql.Add(' Where S.PADDR = P.ADDR                                                  ');
            Sql.Add('   And UPPER(S.USERNAME) in (''HPERSON'',''HPER'')                       ');
            Sql.Add('   And UPPER(S.OSUSER)   <> ''TMAX''                                     ');
            Sql.Add(' ORDER BY S.USERNAME, S.MACHINE                                          ');
            ExecSql;
       end;

       //KillMemo.Lines.Add('미저장 인가자 접속.');          //while not OraQuery2.Eof do
       for X := 1 to OraQuery2.RecordCount do
       begin
            KillMemo.Lines.Add( Copy(OraQuery2.FieldByName('LOGON_TIME').AsString,1,16)+' - '+
                                     OraQuery2.FieldByName('OSUSER').AsString          +' - '+
                                     OraQuery2.FieldByName('MACHINE').AsString         +' - '+
                                     OraQuery2.FieldByName('PROGRAM').AsString         );
       end;
       OraQuery2.Close;
  end;  }
end;

end.

