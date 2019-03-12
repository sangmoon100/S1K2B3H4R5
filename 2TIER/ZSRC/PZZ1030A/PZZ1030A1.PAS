unit PZZ1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Db,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, Mask, jpeg,
  pebtnedit, OnFocusButton, Winsock, Clipbrd, comobj, Menus, OnRegistry, Psock,
  NMsmtp, Func, CsReg, MemDS, DBAccess, Ora, OnInsaCommon;

type
  TFM_InsaMan = class(TForm)
    Panel1: TPanel;
    p_Login: TPanel;
    GroupBox2: TGroupBox;
    e_ID: TEdit;
    BT_Login: TOnFocusButton;
    e_Pass: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    passShrBtn: TButton;
    BT_PassUpdate: TButton;
    BT_PicSave: TButton;
    Label8: TLabel;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    E_Body: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    BT_PassSave: TButton;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DataGrid: TStringGrid;
    ColumnGrid: TStringGrid;
    pg_Bar: TProgressBar;
    E_Tname: TEdit;
    M_CreScript: TMemo;
    Label22: TLabel;
    Panel2: TPanel;
    SF_Main: TOnSchemeForm;
    Shape1: TShape;
    M_Check: TMemo;
    L_Juminid: TLabel;
    P_Help: TPanel;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    BT_SendMail: TButton;
    E_ToEmpno: TEdit;
    E_FrKorname: TEdit;
    E_ToKorname: TEdit;
    E_FrEmpno: TEdit;
    Label12: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    ImageShape: TShape;
    Image1: TImage;
    Shape3: TShape;
    BT_FieldOpen: TButton;
    Label25: TLabel;
    e_payra2: TEdit;
    Label26: TLabel;
    E_Empdate: TEdit;
    Label27: TLabel;
    E_EEmpno: TEdit;
    e_Empno: TEdit;
    e_name: TEdit;
    e_deptname: TEdit;
    e_JobdeptNM: TEdit;
    e_jobdept: TEdit;
    e_deptcd: TEdit;
    e_fincode1: TEdit;
    e_fincode2: TEdit;
    e_Paycl: TEdit;
    e_payraYN: TEdit;
    e_JobpayraYN: TEdit;
    e_payra1: TEdit;
    e_Pstate: TEdit;
    e_jobexemp: TEdit;
    e_Groupid: TEdit;
    e_GroupName: TEdit;
    E_Password: TEdit;
    e_passtime: TEdit;
    e_Grade: TEdit;
    Label28: TLabel;
    E_skmail: TEdit;
    E_OffiTel: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    E_Superempcode: TEdit;
    E_Pimeemp: TEdit;
    BT_ChkSql: TOnFocusButton;
    BT_Close: TOnFocusButton;
    E_Subject: TEdit;
    Label11: TLabel;
    SaveDialog1: TSaveDialog;
    E_HandTel: TEdit;
    Label17: TLabel;
    BT_OffiTel: TButton;
    BT_Handp: TButton;
    dbg_Det: TDBGrid;
    dbg_Mas: TDBGrid;
    btn_Search: TButton;
    E_Date1: TOnDateEdit;
    Panel5: TPanel;
    E_Date2: TOnDateEdit;
    RG1: TRadioGroup;
    Label31: TLabel;
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_Date1Enter(Sender: TObject);
    procedure passShrBtnClick(Sender: TObject);
    procedure BT_PassUpdateClick(Sender: TObject);
    procedure E_PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure e_EmpnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_PicSaveClick(Sender: TObject);
    procedure BT_LoginClick(Sender: TObject);
    procedure e_PassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl1Change(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure e_EmpnoExit(Sender: TObject);
    procedure btn_OpenFileClick(Sender: TObject);
    procedure Btn_InputClick(Sender: TObject);
    procedure ColumnGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_SendMailClick(Sender: TObject);
    procedure e_nameEnter(Sender: TObject);
    procedure BT_PassSaveClick(Sender: TObject);
    procedure e_EmpnoEnter(Sender: TObject);
    procedure e_nameExit(Sender: TObject);
    procedure E_PasswordEnter(Sender: TObject);
    procedure E_PasswordExit(Sender: TObject);
    procedure E_TnameEnter(Sender: TObject);
    procedure ColumnGridKeyPress(Sender: TObject; var Key: Char);
    procedure DataGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BT_FieldOpenClick(Sender: TObject);
    procedure InsertClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure E_PasswordDblClick(Sender: TObject);
    procedure e_EmpnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_SuperempcodeDblClick(Sender: TObject);
    procedure BT_ChkSqlClick(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_OffiTelClick(Sender: TObject);
    procedure E_offitelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_HandTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure e_nameClick(Sender: TObject);
    procedure e_nameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RG1Click(Sender: TObject);
    
  private
    FL_PassWd : String;
    vOrgnum   : String;
    procedure ChangeSever;
    procedure AllEditClear;
    procedure AllEditWrite;
    procedure AllDataRoad;
    function  FL_DeCode(const instring : string):String;
    function  ReadTname : Boolean;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    { Private declarations }
  public

    { Public declarations }
  end;
var
  FM_InsaMan: TFM_InsaMan;
  iJPG      : TJPEGImage;
  stream    : TMemoryStream;
  clpBrd    : TClipboard;
  RecordSet : OleVariant;
  vNewPass  : String;  //Random 생성되는 숫자 10자리.
  WorkPCname, WorkEmpno, WorkKorname : String;
  vGubun    : String;
const
  PASS_KEY = CHR(VK_RETURN);

{
type
  TRGBMode = (mRGB, mBGR);
const
  BPP = 4;
  DefaultPixelFormat=pf32bit;
var
  ChnR, ChnG, ChnB: Pointer; // 채널 데이타의 포인터
  P: Pointer;                // 이미지 데이타의 포인터...
  W, H: Integer;             // 이미지의 가로와 세로 크기
  LineSize: Integer;         // 한 라인의 길이
  DataSize: Integer;         // 이미지 데이타의 길이
  ChnSize : Integer;         // 채널 데이타의 길이
  RGBMode : TRGBMode;
  ShiftVal_R, ShiftVal_G, ShiftVal_B: Byte; // RGB 모드에 따른 R, G, B 의 쉬프트값..
}

implementation

uses PDM, PZZ1030A2;

{$R *.DFM}

procedure TFM_InsaMan.ChangeSever;
begin
  with DM do
  begin
       Ora_Session.Connected := False;
       Ora_Session.ConnectPrompt := False;
       Ora_Session.Options.Net   := True;

       if RG1.ItemIndex = 0 then //운영 : 메뉴에서 실행하므로 하드코딩 삭제.
       begin
            Ora_Session.Username  := Hinsa_Param(cmdline,5);
            Ora_Session.PassWord  := Hinsa_Param(cmdline,6);
            Ora_Session.Server    := Hinsa_Param(cmdline,7) +':'+Hinsa_Param(cmdline,9) +':'+Hinsa_Param(cmdline,8);
       end
       else
       begin                     //개발 : 패스워드 하드코딩 유지(2016.09.01)
            Ora_Session.Username  := 'hperson';
            Ora_Session.PassWord  := 'qlenfrl5$';
            Ora_Session.Server    := '12.4.11.207:1522:insa';
       end;

       Ora_Session.Connected := True;
  end;
end;

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
    IPAddress := Format('%d.%d.%d.%d',[Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);

  WSACleanup;

  WorkPCname := UpperCase(Trim(HostName));
  Result     := Trim(IPAddress);
end;

procedure TFM_InsaMan.btn_SearchClick(Sender: TObject);
var
  iSum : Integer;
begin
  iSum := 0;
  with DM.qry_Mas do
  begin
       DisableControls;
       Close;
       SQL.Clear;
       Sql.Add('Select nvl(Substr(a.ancode, 1, 3), ''  '') ||''('' ||b.codename || '')'' 발령코드,'+
               '       decode(a.Andetcode,NULL, ''---'',                                          '+
               '              a.Andetcode || decode(c.codename,NULL,''(코드없음)'',''('' ||c.codename||'')'')) 발령세부코드,'+
               '       Count(*) 총건수                 '+
               '  From pihanno a, pyccode b, pyccode c '+
               ' Where Substr(a.ANUPDTIME,1,8) between '''+ E_Date1.NoFormatDate + ''' And '''+ E_Date2.NoFormatDate + ''' '+
               '   And a.anupdyn in (''Y'', ''y'')                           '+
               '   And b.codeid =''I300'' And  b.codeno = a.ancode           '+
               '   And c.codeid(+) =''I310'' And  c.codeno(+) = a.Andetcode  '+
               ' GROUP BY a.ancode,a.Andetcode, b.codename,c.codename        ');
       Open;

       while not EOF do
       begin
            iSum := iSum + StrToInt(FieldByName('총건수').AsString);
            next;
       end;
       
       First;
       if   EOF then P_Help.Caption := '발령건이 없습니다!!   '
       else          P_Help.Caption := IntToStr(iSum) + '건의 경신된 발령건이 있습니다!!   ';
       EnableControls;
  end;
end;

procedure TFM_InsaMan.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  PageControl1.Visible    := False;
  L_Juminid.Caption       := '';
end;

procedure TFM_InsaMan.FormShow(Sender: TObject);
var vSysdate : String;
begin
  SF_Main.Caption.Text := '[종합인사관리 PZZ1030A]  - ' + GetLocalIP + ' - ' + WorkPCname;

  if  WorkPCname = 'SKCC14D00495' then
  begin
       WorkEmpno   := 'Z113';
       WorkKorname := '강륜종';
       PageControl1.Visible := True;
  end
  else if WorkPCname = 'SKCC14D00488' then
  begin
       WorkEmpno   := 'Z1213';
       WorkKorname := '하은영';
       PageControl1.Visible := True;
  end
  else if WorkPCname = 'SKCC14D00543' then
  begin
       WorkEmpno   := 'Z2952';
       WorkKorname := '이상문';
       PageControl1.Visible := True;
  end
  else if WorkPCname = 'SKCC14D00487' then
  begin
       WorkEmpno   := 'Z2960';
       WorkKorname := '송영일';
       PageControl1.Visible := True;
  end
  else if WorkPCname = 'SKCC16D00448' then
  begin
       WorkEmpno   := 'Z3211';
       WorkKorname := '정한구';
       PageControl1.Visible := True;
  end
  else if WorkPCname = 'HRIS' then  //파일서버
  begin
       WorkEmpno   := 'HRIS';
       WorkKorname := 'HRIS';
       PageControl1.Visible := True;
  end;

  //////////////////////////////////////////////////////////////////////////////
  //OraConnect;    //DB접속
  ChangeSever;

  //GetLocalTime(SystemTime);
  E_Date1.Date := Fn_GetDateTime - 7;
  E_Date2.Date := Fn_GetDateTime; //SystemTimeToDateTime(SystemTime);

  {//HR팀 특정인에게 프로그램 배포시
  if (WorkPCname = 'SKB2563') then
  begin
       with DM.OraQuery1 do
       begin
            Close;
            SQL.Clear;
            SQL.Add('Select groupid From pymenuuser');
            SQL.Add(' Where Empno = ''2563''       ');
            Open;
            if Fields[0].AsString = 'G011' then PageControl1.Visible := True;
            Close;
       end;
  end;}

  DataGrid.ColWidths[0]   := 40;
  ColumnGrid.ColWidths[0] := 40;
  ColumnGrid.Cells[0,0]   := '필드';
end;

procedure TFM_InsaMan.E_Date1Enter(Sender: TObject);
begin
  P_Help.Caption := '';
end;

function TFM_InsaMan.FL_DeCode(const instring : string):String;
var
  i : integer;
  outstring: String;
begin
  for i := 1 to Length(inString) do
  begin
       outstring := outstring  + Char(Byte(inString[i]) XOR Byte(chr(vk_return)));
  end;
  Result := outstring;
end;

procedure TFM_InsaMan.passShrBtnClick(Sender: TObject);
begin
  with DM.OraQuery3 do
  begin
       Close;
       sql.Clear; //도급인력 추가 2014.03.
       Sql.Add('Select A.Empno, B.Korage, A.Password, A.Grade, A.Groupid, E.Groupname, B.Fincode,             '+
               '       Nvl(GroupEmpdate,''미등록'') GroupEmpdate, B.Payrayn, B.Jobpayrayn, A.Passtodate,      '+
               '       Nvl(C.Juminid,B.Juminid)                            Juminid,                           '+
               '       Decode(c.Empno,'''',b.Pstate,nvl(c.Retdate,''10'')) Pstate,                            '+
               '       Nvl(C.Kname,B.Korname)                              Korname,                           '+
               '       Nvl(C.Empdate,B.Empdate)                            Empdate,                           '+
               '       Nvl(C.Empdate,B.OrgEmpdate)                         OrgEmpdate,                        '+
               '       Nvl(C.Retdate,B.Retdate)                            Retdate,                           '+
               '       Nvl(C.Orgnum,B.Orgnum)                              Orgnum,                            '+
               '       Nvl(C.Deptcode,B.Deptcode)                          Deptcode,                          '+
               '       Nvl(C.Skemail,B.Skemail)                            Skemail,                           '+
               '       Nvl(C.Otel,B.Offitel)                               Offitel,                           '+
               '       Nvl(C.Handp,B.Retcont)                              Handtel,                           '+
               '      (Select Deptname||'' ''||Deptna3 From Pycdept                                           '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Deptcode)) Deptname,'+
               '      (Select Deptname||'' ''||Deptna3 From Pycdept                                           '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Jobdept)) JobdeptNM,'+
               '      (Select Deptcode                 From Pycdept                                           '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Jobdept)) Jobdeptcd,'+
               '      (Select Codename||''-''||B.Paycl    From Pyccode                                        '+
               '        Where Codeid=''I112'' And Codeno=B.Paycl)                                   Paycl,    '+

               '      (Select Codename||''-''||Nvl(C.Payra,B.Payra) From Pyccode                              '+
               '        Where Codeid=''I113'' And Codeno=Nvl(C.Payra,B.Payra))                      Payra,    '+
               '      (Select Codename||''-''||B.Jobpayra From Pyccode                                        '+
               '        Where Codeid=''I113'' And Codeno=B.Jobpayra)                                Jobpayra, '+

               '      (Select Codename From Pyccode Where Codeid=''I118'' And Codeno=Nvl(C.Payra,B.Payra)) TokPayra,'+
               '      (Select Codename From Pyccode Where Codeid=''I118'' And Codeno=B.Jobpayra) TokJobpayra, '+

               '  Nvl((Select Codename||''-''||B.Pstate   From Pyccode                                        '+
               '        Where Codeid=''I114'' And Codeno=Decode(c.Empno,'''',Pstate,nvl(c.Retdate,''10''))),''Null'') Pstatenm'+
               '  From Pymenuuser A, Pimpmas B, Pymenugroup E, Pzsubmas C                                     '+
               ' Where B.Empno(+) = A.Empno                                                                   '+
               '   And C.Empno(+) = A.Empno                                                                   '+
               '   And E.Groupid  = A.Groupid                                                                 ');

            if (vGubun='사번') and (Length(e_Empno.Text)=4) then Sql.Add('  And a.Empno = '''+ UpperCase(e_Empno.Text)+''' ');
            if (vGubun='성명') and (Length(e_name.Text) >0) then Sql.Add('  And (b.Korname like ''%'+ UpperCase(e_name.Text)+'%'' or C.kname like ''%'+ UpperCase(e_name.Text)+'%'')');

            Sql.Add(' Order By Decode(c.Empno,'''',b.Pstate,nvl(c.Retdate,''10'')), B.juminid ');
            open;
            if RecordCount > 1 then  SubForm.Showmodal;

       if not DM.OraQuery3.Active then
       begin
            AllEditClear;
            e_Empno.SetFocus;
            System.Exit;
       end;

       if Eof then
       begin
            P_Help.Caption := '해당 사번의 데이터는 없습니다!! ';
            AllEditClear;
            e_Empno.SetFocus;
       end
       else AllEditWrite;
  end;

  AllDataRoad;
end;

procedure TFM_InsaMan.BT_OffiTelClick(Sender: TObject);
begin
  with DM.OraQuery3 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select A.Empno, B.Korage, A.Password, A.Grade, A.Groupid, E.Groupname, B.Fincode,             '+
               '       Nvl(GroupEmpdate,''미등록'') GroupEmpdate, B.Payrayn, B.Jobpayrayn, A.Passtodate,      '+
               '       Nvl(C.Juminid,B.Juminid)                            Juminid,                           '+
               '       Decode(c.Empno,'''',b.Pstate,nvl(c.Retdate,''10'')) Pstate,                            '+
               '       Nvl(C.Kname,B.Korname)                              Korname,                           '+
               '       Nvl(C.Empdate,B.Empdate)                            Empdate,                           '+
               '       Nvl(C.Empdate,B.OrgEmpdate)                         OrgEmpdate,                        '+
               '       Nvl(C.Retdate,B.Retdate)                            Retdate,                           '+
               '       Nvl(C.Orgnum,B.Orgnum)                              Orgnum,                            '+
               '       Nvl(C.Deptcode,B.Deptcode)                          Deptcode,                          '+
               '       Nvl(C.Skemail,B.Skemail)                            Skemail,                           '+
               '       Nvl(C.Otel,B.Offitel)                               Offitel,                           '+
               '       Nvl(C.Handp,B.Retcont)                              Handtel,                           '+
               '      (Select Deptname||'' ''||Deptna3 From Pycdept                                           '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Deptcode)) Deptname,'+
               '      (Select Deptname||'' ''||Deptna3 From Pycdept                                           '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Jobdept)) JobdeptNM,'+
               '      (Select Deptcode               From Pycdept                                             '+
               '        Where Orgnum=Nvl(C.Orgnum,B.Orgnum) And Deptcode=Nvl(C.Deptcode,B.Jobdept)) Jobdeptcd,'+
               '      (Select Codename||''-''||B.Paycl    From Pyccode                                        '+
               '        Where Codeid=''I112'' And Codeno=B.Paycl)                                   Paycl,    '+
               '      (Select Codename||''-''||Nvl(C.Payra,B.Payra) From Pyccode                              '+
               '        Where Codeid=''I113'' And Codeno=Nvl(C.Payra,B.Payra))                      Payra,    '+
               '      (Select Codename||''-''||B.Jobpayra From Pyccode                                        '+
               '        Where Codeid=''I113'' And Codeno=B.Jobpayra)                                Jobpayra, '+

               '      (Select Codename From Pyccode Where Codeid=''I118'' And Codeno=Nvl(C.Payra,B.Payra)) TokPayra,'+
               '      (Select Codename From Pyccode Where Codeid=''I118'' And Codeno=B.Jobpayra) TokJobpayra, '+
                              
               '  Nvl((Select Codename||''-''||B.Pstate   From Pyccode                                        '+
               '        Where Codeid=''I114'' And Codeno=Decode(c.Empno,'''',Pstate,nvl(c.Retdate,''10''))),''Null'') Pstatenm'+
               '  From Pymenuuser A, Pimpmas B, Pymenugroup E, Pzsubmas C                                     '+
               ' Where B.Empno(+) = A.Empno                                                                   '+
               '   And C.Empno(+) = A.Empno                                                                   '+
               '   And E.Groupid  = A.Groupid                                                                 ');

       if TButton(Sender).Tag = 1 then Sql.Add('  And Nvl(C.Otel,B.Offitel) like ''%'+ E_OffiTel.Text +'''   ');
       if TButton(Sender).Tag = 2 then Sql.Add('  And Nvl(C.Handp,B.Retcont) like ''%'+ E_HandTel.Text +'''   ');      //M_Check.Text := Sql.Text;
       open;
       if RecordCount > 1 then  SubForm.Showmodal;

       if not DM.OraQuery3.Active then
       begin
            AllEditClear;
            e_Empno.SetFocus;
            System.Exit;
       end;

       if Eof then
       begin
            P_Help.Caption := '해당 전화번호 데이터는 없습니다!! ';
            AllEditClear;
            e_Empno.SetFocus;
       end
       else AllEditWrite;
  end;

  AllDataRoad;
end;

procedure TFM_InsaMan.BT_PassUpdateClick(Sender: TObject);
begin
  if length(e_Empno.Text) <> 4 then
  begin
       showmessage('사번부터 입력하세요');
       Exit;
  end;

  if mrYes = MessageDlg(e_name.Text + '님의 패스워드를 유지하시겠습니까?',mtWarning, [mbYes, mbNo], 0) then
  begin
       with DM.OraQuery1 do
       begin
            Close;
            sql.Clear;
            Sql.Add('UPDATE PYMENUUSER '+
                    '   SET PASSTODATE = to_char(Add_months(SYSDATE,5), ''YYYYMMDD''), '+
                    '       Writetime  = to_char(sysdate, ''YYYYMMDDHH24MISS'')        '+
                    ' Where Empno = '''+ UpperCase(e_Empno.Text) +'''                  ');
            Execsql;
            showmessage('업데이트 완료');
            passShrBtnClick(Sender);
       end;
  end;
end;

procedure TFM_InsaMan.E_PasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Control then Showmessage('보안상 복사하실 수 없습니다');
end;

procedure TFM_InsaMan.e_EmpnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
       vGubun := '사번';
       passShrBtnClick(sender);
       BT_SendMail.Caption := 'P/W 메일전송';
  end;
end;

procedure TFM_InsaMan.e_nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
       vGubun := '성명';
       passShrBtnClick(sender);
       BT_SendMail.Caption := 'P/W 메일전송';
  end;
end;

procedure TFM_InsaMan.BT_PicSaveClick(Sender: TObject);
begin
 if SaveDialog1.Execute then iJPG.SaveToFile(SaveDialog1.FileName);
end;

procedure TFM_InsaMan.AllEditClear;
var
  i : integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
       if (Components[i] is TEdit) then (Components[i] as TEdit).Clear;
  end;
end;

procedure TFM_InsaMan.AllEditWrite;
begin
  with DM.OraQuery3 do
  begin
       e_Groupid.Text   := FieldByName('groupid').AsString;
       e_GroupName.Text := FieldByName('groupname').AsString;
       e_payra1.Text    := FieldByName('payra').AsString   +' '+FieldByName('Tokpayra').AsString;
       e_payra2.Text    := FieldByName('jobpayra').AsString+' '+FieldByName('Tokjobpayra').AsString;
       e_deptname.Text  := FieldByName('deptname').AsString;
       e_name.Text      := FieldByName('Korname').AsString;
       e_passtime.Text  := copy(FieldByName('passtodate').AsString,1,4) + '년 ' +
                           copy(FieldByName('passtodate').AsString,5,2) + '월 ' +
                           copy(FieldByName('passtodate').AsString,7,2) + '일';
       e_Empno.Text     := FieldByName('Empno').AsString;
       e_Paycl.Text     := FieldByName('paycl').AsString;
       e_Grade.Text     := FieldByName('grade').AsString;
       e_deptcd.Text    := FieldByName('orgnum').AsString + FieldByName('Deptcode').AsString;
       e_Pstate.Text    := FieldByName('PstateNM').AsString;
       e_jobdept.Text   := FieldByName('orgnum').AsString + FieldByName('jobdeptcd').AsString;
       e_JobdeptNM.Text := FieldByName('jobdeptNM').AsString;
       e_payraYN.Text   := FieldByName('payrayn').AsString;
       e_JobpayraYN.Text:= FieldByName('jobpayrayn').AsString;
       E_skmail.Text    := FieldByName('skemail').AsString;
       E_OffiTel.Text   := FieldByName('OffiTel').AsString;
       E_HandTel.Text   := FieldByName('HandTel').AsString;

       E_Empdate.Text   := '⊙최초:' + FieldByName('Empdate').AsString     +' '+
                           '⊙SKB:' + FieldByName('OrgEmpdate').AsString   +' '+
                           '⊙그룹:' + FieldByName('GroupEmpdate').AsString;

       if FieldByName('Retdate').AsString <> '' then
          E_Empdate.Text  := E_Empdate.Text + ' ⊙퇴사: ' + FieldByName('Retdate').AsString;

       L_Juminid.Caption  := Copy(FieldByName('juminid').AsString,1,7)+FieldByName('Korage').AsString;

       //2013.12. Add.....................................................
       with DM.OraQuery1 do
       begin
            Close;
            SQL.Clear;
            SQL.Add('Select Aid, Bpw From ZZZlog       ');
            SQL.Add(' Where Aid = '''+e_Empno.Text+''' ');
            Open;
            E_Password.Text := FieldByName('BPW').AsString;
       end;
  end;
  P_Help.Caption     := ' 조회 완료 ';
end;

procedure TFM_InsaMan.AllDataRoad;
var
  rect : TRect;
  i : Integer;
begin
  with DM.OraQuery2 do
  begin
       Close;
       SQL.Clear;
       SQL.Add(' Select A.superempcode,   A.defaultdept,         b.fincode,               '+
               '       (Select Korname From Pimpmas Where Empno = A.superempcode) Korname,'+
               '        EEmpno, EKorname, B.Writetime, B.Writeemp,                        '+
               '       (Select Superempcode From Erp_Hap_Ap04 Where Empcode=A.Superempcode) SuperEmp2 '+
               '    From erp_hap_ap04 A, Pimpmas B, PIMEEMP C                             '+
               '  Where A.empcode = B.Empno                                               '+
               '    And A.empcode = C.Empno                                               '+
               '    And A.empcode = '''+ DM.OraQuery3.FieldByName('Empno').AsString + ''' '+
               '  Order By B.Pstate, B.Empno ');
       Open;
       if FieldByName('EEmpno').AsString <> '' then
       begin
            e_jobexemp.Text  := FieldByName('Superempcode').AsString +' - '+
                                FieldByName('Korname').AsString  +' ★ '+
                                FieldByName('SuperEmp2').AsString +'(2차)';
            E_EEmpno.Text    := FieldByName('EEmpno').AsString +' - '+
                                FieldByName('EKorname').AsString;
            e_fincode1.Text  := FieldByName('defaultdept').AsString;
            e_fincode2.Text  := FieldByName('fincode').AsString;

            e_fincode1.Color := $00AAD5D5;
            e_fincode2.Color := $00AAD5D5;
            if FieldByName('defaultdept').AsString = '' then e_fincode1.Color := clRed;
            if FieldByName('fincode').AsString     = '' then e_fincode2.Color := clRed;
       end;
  end;

  iJPG   := TJPEGImage.Create;
  stream := TMemoryStream.Create;
  rect   := image1.Canvas.ClipRect;

  with DM.OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select Empno, photo From cimphot Where Empno = :Empno');
       ParamByName('Empno').AsString := UpperCase(Trim(e_Empno.Text));
       Open;

       TBLOBField(FieldByName('photo')).SaveToStream(stream);
       stream.Position := 0;
       iJPG.LoadFromStream(stream);

       if   Stream.Size = 0 then image1.Visible := False
       else if Stream.Size <> 0 then
       begin
            image1.Visible := True;
            if DM.OraQuery3.FieldByName('Pstate').AsString >= '80' then iJPG.grayscale := True;
            image1.Canvas.StretchDraw(rect,iJPG);
            //GrayScale;
       end;
  end;

  //2004.10.29  유효성 추가 --> 패스워드 문의시 rAndom()을 이용 10자리 패스워드를 생성해 메일로 보내준다.
  RAndomize;
  vNewPass := '';
  for i := 1 to 10 do
  begin
       vNewPass := vNewPass + IntToStr(RAndom(10));
  end;

  //EnCode(Trim( E_NewPass.Text),FL_PassWd, PASS_KEY);

  E_Body.Clear;
  E_Body.Lines.Add('**************************************************');
  E_Body.Lines.Add(' 안녕하세요. 종합인사시스템입니다.                ');
  E_Body.Lines.Add(' 귀하의 비밀번호는 아래와 같이 초기화 되었습니다. ');
  E_Body.Lines.Add('                                                  ');
  E_Body.Lines.Add('              '+  vNewPass  +'                    ');
  E_Body.Lines.Add('                                                  ');
  E_Body.Lines.Add(' 로그인창의 "사용자 암호변경"후 사용하기 바랍니다.');
  E_Body.Lines.Add('**************************************************');

  E_FrEmpno.Text   := WorkEmpno;
  E_FrKorname.Text := WorkKorname;

  if   Copy(e_Empno.Text,1,1) = 'Z' then E_ToEmpno.Text := WorkEmpno    //Z사번은 방문예약담당자로 Hint 아이디가 다르다.
  else                                   E_ToEmpno.Text := e_Empno.Text;

  E_ToKorname.Text := e_name.Text;
  E_Subject.Text := '[종합인사 비밀번호 문의에 대한 답변입니다.]';
  iJPG.Free;
  stream.Free;

  if POS('퇴직',e_pstate.Text) > 0 then ImageShape.Brush.Color := clSilver
  else                                  ImageShape.Brush.Color := clWhite;

  M_Check.Lines.Add(' ');
  M_Check.Lines.Add('최종PimpmasWrite : ' + DM.OraQuery2.FieldByName('Writeemp').AsString +' - '+
                                            DM.OraQuery2.FieldByName('Writetime').AsString );
                                   
  with DM.OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select Max(Logintime) From Pymenulog2 ');
       SQL.Add(' Where Logintime>''201601'' And Loginyn=''1'' ');
       SQL.Add('   And IP Not Like ''14.8.220%'' ');
       SQL.Add('   And Loginid ='''+UpperCase(Trim(e_Empno.Text))+''' ');
       Open;
       M_Check.Lines.Add('최종LoginSuccess : ' + Fields[0].AsString);
  end;
end;

procedure TFM_InsaMan.BT_LoginClick(Sender: TObject);
begin
  if (Trim(e_ID.Text) = 'dlstk') And (Trim(e_Pass.Text) = 'whdgkqdlstk') then
  begin
       pagecontrol1.Visible := true;
       P_Help.Visible := True;
  end
  else
  begin
       pagecontrol1.Visible := False;
       showmessage('로그인 안됨!!');
       e_ID.Clear;
       e_Pass.Clear;
       e_ID.SetFocus;
  end;
end;

procedure TFM_InsaMan.e_PassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then BT_LoginClick(Sender);
end;

procedure TFM_InsaMan.PageControl1Change(Sender: TObject);
begin
  Application.ProcessMessages;
  P_Help.Caption := '';
  if      PageControl1.ActivePage = TabSheet1 then e_Empno.SetFocus
  else if PageControl1.ActivePage = TabSheet2 then btn_SearchClick(Sender)
  else if PageControl1.ActivePage = TabSheet3 then ReadTname;
end;

procedure TFM_InsaMan.TabSheet1Show(Sender: TObject);
begin
  e_Empno.SetFocus;
end;

procedure TFM_InsaMan.e_EmpnoExit(Sender: TObject);
begin
  e_Empno.Text := UpperCase(e_Empno.Text);
  e_Empno.Color:= $00D9FFFF;
  if Copy(e_Empno.Text,1,1) = 'D' then  BT_PassSave.Visible := True;
end;

procedure TFM_InsaMan.btn_OpenFileClick(Sender: TObject);
var
 i, j, iRowCnt,iColCnt : integer;
 Excel : variant;
begin
  try
       Excel := CreateOleObject('Excel.application');
  except
       ShowMessage('Excel이 설치되어 있지 않습니다!!!');
       Exit;
  end;

  if   OpenDialog1.Execute then Excel.workbooks.open(OpenDialog1.FileName)
  else                          System.Exit;

  iRowCnt := StrToInt(Excel.ActiveSheet.UsedRange.Rows.Count);
  iColCnt := StrToInt(Excel.ActiveSheet.UsedRange.Columns.Count);

  DataGrid.RowCount := iRowCnt;
  DataGrid.ColCount := iColCnt+1;

  Application.ProcessMessages;
  pg_Bar.Max := iRowCnt;
  Try
    for i := 0 to iRowCnt-1 do
    begin
         for j := 0 to DataGrid.ColCount  do
         begin
              if      (i = 0) And (j =  0) then DataGrid.Cells[j, i] := '순번'
              else if (j = 0) And (i <> 0) then DataGrid.Cells[j, i] := IntToStr(i)
              else                              DataGrid.Cells[j, i] := Excel.cells[i+1, j];
         end;
         pg_Bar.Position := i+1;
    end;
  except
       Excel.WorkBooks.Close;
       Excel.quit;
       Excel := unassigned;
  end;

  Excel.WorkBooks.Close;
  Excel.quit;
  Excel := unassigned;
  pg_Bar.Position := 0;
end;
              
Function TFM_InsaMan.ReadTname : Boolean;
begin
  Result := False;
  with DM.OraQuery1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select * From all_objects     ');
       Sql.Add(' Where object_name =:TNAME    ');
       sql.Add('   And object_type =''TABLE'' ');
       ParamByName('TNAME').AsString := Trim(UPPERCASE(e_tname.Text));
       Open;
       if not Eof then  Result := True;
  end;
end;

procedure TFM_InsaMan.Btn_InputClick(Sender: TObject);
var
  i,j, SaveCount : integer;
  CreScript , SqlStr : String;
begin
  SaveCount := 0;
  if Length(e_tname.Text) < 5 then
  begin
       MessageDlg('테이블명은 최소 5자 이상 이여야 합니다.', mtWarning, [mbOK], 0);
       System.Exit;
  end;

  if ReadTname then
  begin
       if (MessageDlg('해당 테이블이 존재합니다. '
                   +#13+#10+#13+#10+'존재하는 테이블에 저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
       begin
            Try
                 SaveCount := 0;
                 for i := 1 to DataGrid.RowCount - 1 do
                 begin
                      SqlStr := 'insert into '+ Trim(e_tname.Text) + '( ';

                      for j:= 1 to ColumnGrid.ColCount-1 do
                        SqlStr := SqlStr + ColumnGrid.Cells[j, 0]+',';

                      SqlStr := Copy(SqlStr,1, length(SqlStr) -1) + ') values (';

                      for j:= 1 to DataGrid.ColCount-1 do
                        SqlStr := SqlStr + QuotedStr(DataGrid.Cells[j, i])+',';

                      SqlStr := Copy(SqlStr,1, length(SqlStr) -1) + ')';

                      DM.OraQuery1.Close;
                      DM.OraQuery1.Sql.Text := SqlStr;
                      DM.OraQuery1.ExecSql;
                      inc(SaveCount);
                 end;
            Finally
                 M_CreScript.Lines.Add('총 '+IntToStr(SaveCount)+'건 저장 완료');
            end;
       end
  end;
end;

procedure TFM_InsaMan.ColumnGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  DataGrid.Col := ACol;
end;

procedure TFM_InsaMan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_InsaMan.BT_SendMailClick(Sender: TObject);
var
  SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
  if Trim(vNewPass) = '' then Exit;
  
  if MessageDlg('('+E_ToEmpno.Text+')'+e_name.Text+
                ' 님에게 메일을 보내실래요?', mtInformation, [mbOK, mbCancel], 0) <> mrOk then
  begin
       MessageDlg('메일 발송이 취소되었습니다.~~~', mtInformation, [mbOK], 0);
       System.Exit;
  end;

  //////////////////////////////////////////////////////////////////////////////
  SendProgID  := 'INSAMAN';
  SendEmpno   := E_FrEmpno.text;
  RcveEmpno   := E_ToEmpno.Text;
  MailSubject := E_Subject.Text;
  MailBody    := E_Body.Lines.Text;
  ReceiveYN   := 'N';

  if not Send_WebHint(SendProgID, Copy(SendEmpno,1,4), RcveEmpno, MailSubject, MailBody, ReceiveYN) then
  begin
       MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
       exit;
  end;
  //////////////////////////////////////////////////////////////////////////////

  //Random()을 이용 10자리 패스워드를 생성해 메일로 보내준다.
  with DM.OraQuery1  do
  begin
       Close;
       Sql.Text := Format('update pymenuuser                                               '+
                          '   set password  = ''%s'',                                      '+
                          '       PASSTODATE= to_char(Add_months(SYSDATE,1),''YYYYMMDD''), '+
                          '       writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''),      '+
                          '       writeman  = ''%s''                                       '+
                          ' Where Empno     = ''%s''                                       '
                          ,[ vNewPass, Copy(SendEmpno,1,4), E_Empno.Text]);
//                      ' ,[ FL_PassWd, Copy(SendEmpno,1,4), E_Empno.Text]);
       ExecSql;
  end;
  BT_SendMail.Font.Color := clRed;
  BT_SendMail.Caption    := '전송완료.';
end;

procedure TFM_InsaMan.e_nameEnter(Sender: TObject);
begin
  e_Empno.Clear;
  e_name.Color := clWhite;
  e_name.imemode := imHanguel;
end;

procedure TFM_InsaMan.BT_PassSaveClick(Sender: TObject);
begin  //EnCode(Trim( E_Password.Text),FL_PassWd, PASS_KEY);
  if e_Empno.Text <> '' then
  begin
       if TButton(Sender).Name ='BT_PassSave' then
       begin
            if MessageDlg('패스워드를 저장하시겠습니다?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then system.exit;
       end;

       with DM.OraQuery1 do
       begin
            Close;
            SQL.Clear;
            Sql.Add('UPDATE PYMENUUSER                                                 '+
                    '   SET PASSWORD   = '''+ E_Password.Text +''',                    '+
                    '       PASSTODATE = to_char(Add_months(SYSDATE,5), ''YYYYMMDD''), '+
                    '       Writetime  = to_char(sysdate, ''YYYYMMDDHH24MISS'')        '+
                    ' Where Empno      = '''+ UpperCase(e_Empno.Text) +'''             ');
            ExecSql;

            if e_Empno.Text='M163' then
            begin
            Close;
            SQL.Clear;
            Sql.Add('UPDATE PKZMPMAS                                    '+
                    '   SET PASSWORD = '''+ E_Password.Text +'''        '+
                    ' Where Empno    = '''+ UpperCase(e_Empno.Text) +'''');
            //ExecSql;
            end;
                        
            P_Help.Caption := ' 패스워드 저장 완료  ';
       end;
  end
  else MessageDlg('조회먼저 하세요~~', mtWarning, [mbOK], 0);
end;

procedure TFM_InsaMan.e_EmpnoEnter(Sender: TObject);
begin
  e_name.Clear;
  e_Empno.Color   := clWhite;
  e_Empno.ImeMode := imSAlpha;
  e_Empno.SetFocus;
end;

procedure TFM_InsaMan.e_nameExit(Sender: TObject);
begin
  e_name.Color := $00FFF2E6;
end;

procedure TFM_InsaMan.E_PasswordEnter(Sender: TObject);
begin
  E_Password.Color := clWhite;
end;

procedure TFM_InsaMan.E_PasswordExit(Sender: TObject);
begin
  E_Password.Color := $00DFDFFF;
end;

procedure TFM_InsaMan.E_PasswordDblClick(Sender: TObject);
begin
  clpBrd := TClipboard.Create;
  clpBrd.clear;
  clpBrd.AsText := E_Password.Text;
  clpBrd.Free;
end;

procedure TFM_InsaMan.E_TnameEnter(Sender: TObject);
begin
  P_Help.Caption := '생성 할 테이블 명을 입력하세요!!   ';
end;

procedure TFM_InsaMan.ColumnGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       if ColumnGrid.ColCount < DataGrid.ColCount  then
       begin
           ColumnGrid.ColCount := ColumnGrid.ColCount+1;
           ColumnGrid.Col      := ColumnGrid.Col + 1;
       end;
  end;
end;

procedure TFM_InsaMan.DataGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if ColumnGrid.ColCount = DataGrid.ColCount then
    ColumnGrid.ColWidths[ACol] := DataGrid.ColWidths[ACol] ;
end;

procedure TFM_InsaMan.BT_FieldOpenClick(Sender: TObject);
var
  i : Integer;
begin
  ColumnGrid.Cells[0, 0] := '필드';

  DM.OraQuery1.Close;
  DM.OraQuery1.Sql.Text := 'Select COLUMN_NAME From ALL_TAB_COLUMNS  '+
                           ' Where TABLE_NAME ='''+UpperCase(Trim(E_Tname.Text))+''' '+
                           '   And Owner = ''HPERSON'' '+
                           ' ORDER BY COLUMN_ID ';
  DM.OraQuery1.Open;

  if DM.OraQuery1.Eof And DM.OraQuery1.Bof then
  begin
       M_CreScript.Lines.Add('테이블이 없네요.');
       System.Exit;
  end;

  ColumnGrid.ColCount := DM.OraQuery1.RecordCount +1 ;
  i := 1;
  DM.OraQuery1.First;
  while not DM.OraQuery1.Eof do
  begin
       ColumnGrid.Cells[i, 0] := DM.OraQuery1.FieldByName('COLUMN_NAME').AsString;
       inc(i);
       DM.OraQuery1.Next;
  end;
end;

procedure TFM_InsaMan.InsertClick(Sender: TObject);
var
  i,j : Integer;
begin
  j := ColumnGrid.Col;
  for i:= j to ColumnGrid.ColCount-1 do
     ColumnGrid.Cells[i+1,0]:=ColumnGrid.Cells[i,0];
  ColumnGrid.Cells[j,0] :='';
  ColumnGrid.ColCount   := ColumnGrid.ColCount + 1;
end;

procedure TFM_InsaMan.DeleteClick(Sender: TObject);
var
  i,j : Integer;
begin
  j := ColumnGrid.Col;
  for i:= j to ColumnGrid.ColCount-1 do
     ColumnGrid.Cells[i,0]:=ColumnGrid.Cells[i+1,0];

  ColumnGrid.ColCount := ColumnGrid.ColCount - 1;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_InsaMan.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with DM.OraQuery1 do
  begin
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
            ExecSql;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;

procedure TFM_InsaMan.e_EmpnoClick(Sender: TObject);
begin
  e_Empno.Clear;
  e_name.Clear;  
end;

procedure TFM_InsaMan.E_SuperempcodeDblClick(Sender: TObject);
begin
  clpBrd := TClipboard.Create;
  clpBrd.clear;
  clpBrd.AsText := 'Select Empcode 사번, Empname 성명, Defaultdept 재무부서코드, Superempcode 결재자 '+#13+
                   '  From Erp_Hap_Ap04                                                              '+#13+
                   ' Where Trandate= To_Char(Sysdate,''YYYYMMDD'')                                   '+#13+
                   '   And Nocrt   = (Select Max(Nocrt) From Erp_Hap_Ap04 Where Trandate=To_Char(Sysdate,''YYYYMMDD'')) '+#13+
                   '   And Empcode In (Select Empno From Pimpmas Where Pstate < ''80'')              '+#13+
                   ' Order  By 1                                                                     ';
  clpBrd.Free;
end;

procedure TFM_InsaMan.BT_ChkSqlClick(Sender: TObject);
var vMaxEmp : String;
begin
  M_Check.Text := '';
  with DM.OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select Decode(Substr(Empno,1,1),''M'',0,''P'',5,''Y'',6, Substr(Empno,1,1)) A,');
       Sql.Add('       Max(Empno) Empno                                   ');
       Sql.Add('  From Pimpmas                                            ');
       Sql.Add(' Where Pstate < ''80''                                    ');
       Sql.Add('   And Empno Not Like ''I%''                              '); //인턴제외.
       Sql.Add('   And Empno  > ''2000''                                  ');
       Sql.Add(' Group by Substr(Empno,1,1)                               ');
       Sql.Add(' Union Select 7, ''도급''||Max(Empno) Empno From Pzsubmas ');
       Sql.Add(' Union Select 8, ''외주''||Max(Empno) Empno From Pzmoutmas');
       Sql.Add(' Order By 1, 2                                            ');
       Open;
       first;
       while not DM.OraQuery1.Eof do
       begin
            vMaxEmp := vMaxEmp + '★'+ FieldByName('Empno').AsString;
            Next;
       end;
       M_Check.Lines.Add('[Max사번] ' + vMaxEmp);
       M_Check.Lines.Add(' ');

       
       ///////M_Check.Lines.Add('SKT파견자 : YF55 YF59 YF60 YF61 ');
       Close;
       Sql.Clear;
       Sql.Add('Select a, b, c, d, e, f, g, h, i, j, k, l  From                                           ');
       Sql.Add(' (Select Count(*) a From PIMEEMP                                                        ),');
       Sql.Add(' (Select Count(*) b From Pimpmas  Where Pstate <''80''                                  ),');
       Sql.Add(' (Select Count(*) c From Pimpmas  Where Pstate <''80'' And Substr(Empno,1,1) in (''0'',''1'',''2'',''3'') And Paycl<>''H10''),');
       Sql.Add(' (Select Count(*) d From Pimpmas  Where Pstate <''80'' And Paycl=''H10'')                ,');
       Sql.Add(' (Select Count(*) e From Pimpmas  Where Pstate <''80'' And Substr(Empno,1,1) in (''P'') ),');
       Sql.Add(' (Select Count(*) f From Pimpmas  Where Pstate <''80'' And Substr(Empno,1,1) in (''Y'') ),');
       Sql.Add(' (Select Count(*) g From Pimpmas  Where Pstate <''80'' And Substr(Empno,1,1) in (''I'') ),'); //인턴.
       Sql.Add(' (Select Count(*) h From Pimpmas  Where Pstate <''80'' And Substr(Empno,1,1) in (''M'') ),'); //임원
       Sql.Add(' (Select Count(*) i From Pkzmpmas Where Pstate <''80'' And Substr(Empno,1,2) in (''M9'')),'); //임원(M9)
       Sql.Add(' (Select Count(*) j From Pzsubmas Where Retdate is null                                 ),'); //도급직(U)
       Sql.Add(' (Select Count(*) l From Pzmoutmas Where StateYN = ''Y''                                ),'); //외주인력(OLD-Drmpmas)
       Sql.Add(' (Select Count(*) k From Pimpmas  Where Pstate <''80'' And PstateYN = ''N''             ) '); //현원포함여부N
       Open;

       M_Check.Lines.Add('[PIMEEMP~ 재직자] '+ Fn_Left_Space(IntToStr(FieldByName('a').AsInteger)+ '명',6));
       M_Check.Lines.Add('[인사Master 재직] '+ Fn_Left_Space(IntToStr(FieldByName('b').AsInteger)+ '명',6));
       M_Check.Lines.Add('[정규직0123 인원] '+ Fn_Left_Space(IntToStr(FieldByName('c').AsInteger)+ '명',6));
       M_Check.Lines.Add('[무기직(H10)인원] '+ Fn_Left_Space(IntToStr(FieldByName('d').AsInteger)+ '명',6));
       M_Check.Lines.Add('[계약직(P~) 인원] '+ Fn_Left_Space(IntToStr(FieldByName('e').AsInteger)+ '명',6));
       M_Check.Lines.Add('[파견직(Y~) 인원] '+ Fn_Left_Space(IntToStr(FieldByName('f').AsInteger)+ '명',6));
       M_Check.Lines.Add('[인  턴(I~) 인원] '+ Fn_Left_Space(IntToStr(FieldByName('g').AsInteger)+ '명',6));
       M_Check.Lines.Add('[임  원(M~) 인원] '+ Fn_Left_Space(IntToStr(FieldByName('h').AsInteger)+ '명',6));
       M_Check.Lines.Add('[사외이/고문(M9)] '+ Fn_Left_Space(IntToStr(FieldByName('i').AsInteger)+ '명',6));
       M_Check.Lines.Add('[도급직(U~) 인원] '+ Fn_Left_Space(IntToStr(FieldByName('j').AsInteger)+ '명',6));
       M_Check.Lines.Add('[외주인력   인원] '+ Fn_Left_Space(IntToStr(FieldByName('k').AsInteger)+ '명',6));
       M_Check.Lines.Add('[현원포함N  인원] '+ Fn_Left_Space(IntToStr(FieldByName('l').AsInteger)+ '명',6));

       ////////////////////////////////////////////////////////////////////////////
       Close;
       Sql.Clear;
       Sql.Add('Select Empno, Korname, Deptcode, Jobdept, Fincode From Pimpmas');
       Sql.Add(' Where Pstate < ''80'' ');
       Sql.Add('   And Jobdept in (Select Deptcode From Pycdept Where ORGNUM='''+vOrgnum+''' And EXISTON=''1'' And FINCODE Is Null)');//And Chanmode<>''3''
       Open;

       if RecordCount > 0 then
       begin
            M_Check.Lines.Add('');
            M_Check.Lines.Add('[PIMPMAS Fincode Null 발생] : ' + IntToStr(RecordCount)+ '개');
            M_Check.Lines.Add(Sql.Text);
       end;

       ////////////////////////////////////////////////////////////////////////////
       Close;
       Sql.Clear;
       Sql.Add('Select * From PIMEEMP Where Trim(EEmpno) is null ');
       Open;
       if RecordCount > 0 then
       begin
            M_Check.Lines.Add('[Pimeemp-EEmpno Null 발생] : ' + IntToStr(RecordCount)+'명' );
            M_Check.Lines.Add(Sql.Text);
       end;

       Close; 
       Sql.clear;
       Sql.Add('Select Jobdept, EEmpno, Count(*)                      ');
       Sql.Add('  From (Select Distinct Jobdept, EEmpno From Pimeemp) ');
       Sql.Add(' Group By Jobdept, EEmpno                             ');
       Sql.Add('Having Count(*) > 1                                   ');
       Open;
       
       if RecordCount > 0 then
       begin
            M_Check.Lines.Add('');
            ShowMessage('Pimeemp 중복발생 !!! ');
            M_Check.Lines.Add('Pimeemp 중복발생 !!! ');
            M_Check.Lines.Add(Sql.Text);
       end;

       ////////////////////////////////////////////////////////////////////////////
       Close;
       Sql.Clear;
       Sql.Add('Select * From Pimpmas ');
       Sql.Add(' Where Pstate <''80'' And Payra <=''C11'' And (Payrayn=''N'' Or Jobpayrayn=''N'') ');
       Open;
       if RecordCount > 0 then
       begin
            M_Check.Lines.Add('');
            //ShowMessage('Pimpmas 보임여부 오류자 발생 !!! ');
            M_Check.Lines.Add('Pimpmas 보임여부 오류자 발생 !!! ');
            M_Check.Lines.Add(Sql.Text);
       end;

       Close;
  end;
end;

procedure TFM_InsaMan.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_InsaMan.E_offitelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TButton(Sender).Tag := 1;
  if Key = vk_return then BT_OffitelClick(Sender);
end;

procedure TFM_InsaMan.E_HandTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TButton(Sender).Tag := 2;
  if Key = vk_return then BT_OffitelClick(Sender);
end;

procedure TFM_InsaMan.e_nameClick(Sender: TObject);
begin
  e_Empno.Clear;
  e_name.Clear;
end;


{procedure TFM_Main.GrayScale;
{var
   i: Integer;
   ImageP: PDWORD; // 32bit 이미지 데이타의 한 점을 가리킬 포인터
   PR, PG, PB: PBYTE; // 8bit 채널 데이타의 한 점을 가리킬 포인터
   TempByte: Byte;
function GetRGBMode: TRGBMode; // RGB, BGR 중에서 어느쪽이 지원되는지 알아본다.
   var
     TempBMP: TBitmap;
     P: PDWORD;
   begin
     TempBMP:=TBitmap.Create;
     TempBMP.PixelFormat:=pf32bit;
     TempBMP.Width :=1;
     TempBMP.Height:=1;
     TempBMP.Canvas.Pixels[0,0]:=clRed; // 붉은 색으로 칠해주고...
     P:=TempBMP.ScanLine[0];
     if P^=$FF then
     begin
       Result:=mBGR;
     end
     else
     begin
       Result:=mRGB;
     end;
     TempBMP.Free;
   end;
begin
    // 이미지의 비트맵 포맷을 32비트로...
   image3.Picture.Bitmap.PixelFormat:=DefaultPixelFormat;
   // 이미지 정보를 얻고...
   with image3.Picture.Bitmap do
   begin
     W:=Width;
     H:=Height;
     P:=ScanLine[H-1];
     LineSize:=DWORD(ScanLine[0])-DWORD(ScanLine[1]);
     DataSize:=LineSize*H;
     ChnSize :=DataSize div 4; // 32비트 이미지를 8비트 채널로 저장할 것이므로...
   end;

   // 그래픽카드가 RGB 방식인지 BGR 방식인지 살펴보고...
   RGBMode:=GetRGBMode;
   // RGB 모드에 따라 쉬프트값을 바꿔주고...
   if RGBMode=mRGB then // B 가 하위바이트이면...
   begin
     ShiftVal_R:=16;
     ShiftVal_G:=8;
     ShiftVal_B:=0;
   end
   else // R 이 하위바이트이면...
   begin
     ShiftVal_R:=0;
     ShiftVal_G:=8;
     ShiftVal_B:=16;
   end;
   for i:=0 to ChnSize-1 do
   begin
     ImageP :=Pointer(DWORD(P)+i shl 2); // Pointer(DWORD(P)+i*4);
     PR     :=Pointer(DWORD(ChnR)+i);
     PG     :=Pointer(DWORD(ChnG)+i);
     PB     :=Pointer(DWORD(ChnB)+i);
//     TempByte:=(PR^{*3} //+ PG^ {shl 2} + PB^) {shr 3}; // gray := ( R*3 + G*4 + B ) shr 3;
//     ImageP^:=TempByte or TempByte shl 8 or TempByte shl 16;
//   end;
//   Image3.Repaint;
// end;

procedure TFM_InsaMan.RG1Click(Sender: TObject);
begin
  ChangeSever;
end;

end.
