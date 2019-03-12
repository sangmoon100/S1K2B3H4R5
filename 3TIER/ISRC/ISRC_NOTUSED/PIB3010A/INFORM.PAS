unit inform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, StdCtrls, ExtCtrls, Shdowpnl, OnFocusButton, jpeg, registry,
  OnEditBaseCtrl, OnEditStdCtrl, OnLineLabel, OnScheme, Db, Func,
  Tmax_DataSetText, Pass,  PDownLoad;

type
  TLoginForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    P_Gubun: TPanel;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    Shape6: TShape;
    SB_Ok: TOnFocusButton;
    E_empno: TOnEdit;
    E_password: TOnEdit;
    SB_Close: TOnFocusButton;
    BT_Pass: TOnFocusButton;
    BT_PassCreate: TOnFocusButton;
    SL_CallMSG: TOnSectionLabel;
    TDS_dml: TTMaxDataSet;
    Qr_PassInit: TTMaxDataSet;
    TDS_batch: TTMaxDataSet;
    Qr_tmp: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    FreePass: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_CloseClick(Sender: TObject);
    procedure BT_PassCreateClick(Sender: TObject);
    procedure SB_OkClick(Sender: TObject);
    procedure BT_PassClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_passwordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FreePassClick(Sender: TObject);
    procedure SF_MainCloseButton(Sender: TObject);
  private
    { Private declarations }
    GSHomeDir: string;
    FG_Cnt   : integer;
    function PLB_Get_Use : Boolean;
  public
    { Public declarations }

  end;

var
  LoginForm: TLoginForm;

implementation

uses PIB30100;

{$R *.DFM}

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TLoginForm.SB_CloseClick(Sender: TObject);
begin
  FM_Main.SelfCheck := '0';
  Close;
end;

procedure TLoginForm.BT_PassCreateClick(Sender: TObject);
var
     i : Integer;
     NewPass : String;
     vKorname, SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
     vSMSstr, vHandTel, vSendTel : String; //, vProgId, vRundate
begin
  with Qr_PassInit do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add(Format('SELECT empno, korname, substr(juminid,1,6), retcont, '+
                      '       to_char(sysdate,''YYYYMMDDHH24MISS'')         '+
                      '  FROM pimpmas                                       '+
                      ' WHERE empno = ''%s'' ',[E_Empno.Text]));
       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       Open;

       if (RecordCount = 0) then
       begin
            MessageDlg('SK브로드밴드 정직원이 맞으십니까? 미등록 사번입니다.'+#13+
                       '종합인사정보시스템 담당자에게 임원 급여 Password 초기화를 요청하시기 바랍니다.', mtInformation, [mbOK], 0);
            System.Exit;
       end;

       vKorname := FieldByName('field2').AsString;
       vHandTel := RemoveChar(FieldByName('field4').AsString,'-');

       if (copy(FM_Main.GSempno,1,1) = 'D') then
       begin
            vKorname := '종합인사임원관리자';
            vHandTel := '01063215242';
       end
       else if (FM_Main.GSempno  =  FM_Main.gsZMANAGER1) or
               (FM_Main.GSempno  =  FM_Main.gsZMANAGER2) or
               (FM_Main.GSempno  =  FM_Main.gsZMANAGER3) or
               (FM_Main.GSempno  =  FM_Main.gsZMANAGER4) or
               (FM_Main.GSempno  =  FM_Main.gsZMANAGER5) then
       begin
             ServiceName := 'HINSA_select';
             Close;
             Sql.Clear;
             Sql.Add(Format('SELECT empno, korname, substr(juminid,1,6), retcont, '+
                            '       to_char(sysdate,''YYYYMMDDHH24MISS'')         '+
                            '  FROM pimpmas                                       '+
                            ' WHERE empno = ''%s'' ',[FM_Main.GSempno]));
             ClearFieldInfo;
             AddField('field1' , ftString, 100);
             AddField('field2' , ftString, 100);
             AddField('field3' , ftString, 100);
             AddField('field4' , ftString, 100);
             AddField('field5' , ftString, 100);
             Open;

             if (RecordCount = 0) then
             begin
                  MessageDlg('SK브로드밴드 정직원이 맞으십니까? 미등록 사번입니다.'+#13+
                             '종합인사정보시스템 담당자에게 임원 급여 Password 초기화를 요청하시기 바랍니다.', mtInformation, [mbOK], 0);
                  System.Exit;
             end;

             vKorname := FieldByName('field2').AsString;
             vHandTel := RemoveChar(FieldByName('field4').AsString,'-');
       end;

       vSendTel := '0262666400';
  end;


  if MessageDlg(' 임원 급여 Password를 초기화하여 '+ vKorname +'('+ E_empno.Text +')-('+vHandTel+')'+#13+
                ' 에게 SMS 발송 하시겠습니까?', mtInformation, [mbOK, mbCancel], 0) <> mrOk then
  begin
       MessageDlg('SMS 발송이 취소되었습니다.', mtInformation, [mbOK], 0);
       System.Exit;
  end;

  ///////////////////////////////////////////////////////////////////////////
  //////신규 비번 생성...
  Randomize;
  NewPass := '';
  for i := 1 to 10 do
  begin
       NewPass := NewPass + InttoStr(Random(10));
  end;

  //메일발송
  ReceiveYN  := 'N';
  MailSubject:= '[종합인사 임원 급여 Password 초기화 안내]';
  MailBody   := ' 종합인사시스템입니다.                           '+#13#10+
                ' 귀하의 임원 급여 초기화된 Password는 아래와 같습니다.'+#13#10+
                '                  '+NewPass+'                    '+#13#10+
                ' [임원 급여 Password 변경]에서 초기화 Password를 '+#13#10+
                ' 기존 Password 란에 넣으셔서 Password 변경후에   '+#13#10+
                ' 로그인하시면 됩니다. 감사합니다.                ';

  try
       with Qr_PassInit do //비번 업데이트...
       begin
            ServiceName := 'HINSA_dml';
            Close;
            SQL.Clear;
            Sql.Text := Format('update PKZMPMAS                                           '+
                               '   set password  = ''%s'',                                '+
                               '       writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''),'+
                               '       writeman  = ''%s''                                 '+
                               ' where empno     = ''%s''',[NewPass, E_empno.Text, E_empno.Text]);
            Execute;
       end;

       //2014.11.11 SMS전송방식 변경.   dsa2000
       vSMSstr := 'Call HPER.SENDSMS ('+ ''''+vHandTel+''', '''+vSendTel+''', '''+MailBody+''', '''+MailSubject+''' )';
       with Qr_PassInit do
       begin
            ServiceName := 'HINSA_dml';
            Close;
            SQL.Clear;
            SQL.Add(vSMSstr);
            Execute;
       end;

       /////////////////////////////////////////////////////////////////////////

       if Trim(vHandTel) <> '' then
            MessageDlg('임원 급여 Password SMS 전송이 성공하였습니다. ', mtInformation, [mbOK], 0);
  except
       MessageDlg('임원 급여 Password SMS 전송이 실패 하였습니다...',mtError, [mbOk], 0);
  end;
end;

function TLoginForm.PLB_Get_Use : Boolean;
var
  FL_pstate      : String;
  FL_Cnt         : Integer;
begin
  Result := False;
  FL_Cnt := 0;

  with Qr_tmp do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add(Format('SELECT empno, password,                '+
                      '       to_char(sysdate, ''YYYYMMDD''), '+
                      '       korname, Pstate                 '+
                      '  FROM PKZMPMAS                        '+
                      ' WHERE empno = ''%s''                  '+
                      '   And Password = XX1.Enc_Varchar2_Ins(''%s'',11,''PWSD'',''PKZMPMAS'',''PASSWORD'') '
                      ,[Trim(E_empno.Text), E_password.Text]));
       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       Open;

       FL_pstate  := FieldByName('field5').AsString;
       FL_Cnt     := Qr_tmp.RecordCount;
       Close;
  end;


  IF (FL_Cnt = 0) then
  begin
       MessageDlg('◆ 입력하신 임원 급여 Password가 틀립니다.'#13+
                  '    다시 입력하여 주시기 바랍니다. '#13#13+
                  '◆ 임원 급여 Password를 잊으셨을 경우에는    '#13+
                  '    "암호초기화＆SMS 전송" 을 이용 바랍니다.',mtWarning,[mbOK],0);

       Inc(FG_Cnt);
       if FG_Cnt >= 5 then
       begin
            MessageDlg('임원 급여 Password 입력이 5번 틀리셨습니다.'#13#13+
                       '프로그램을 종료합니다.',mtWarning,[mbOK],0);
            Application.ProcessMessages;
            Self.Close;
       end;
       E_password.SetFocus;
       System.Exit;
  end;

  if Trim(FL_pstate) <> '' then
  begin
       if (FL_pstate >= '80') and (FL_pstate <> '82') then
       begin
            MessageDlg('본인은 퇴직자입니다...'#13#13+
                       '종합인사정보 시스템을 사용할 수 없습니다...',mtWarning,[mbOK],0);
            System.Exit;
       end;
  end;

  Result := True;
end;

procedure TLoginForm.SB_OkClick(Sender: TObject);
begin
  if   PLB_Get_Use then FM_Main.SelfCheck := '1'  //로그인 성공
  else                  FM_Main.SelfCheck := '0'; //로그인 실패.

  FM_Main.vEmpno :=  E_empno.Text;

  if (FM_Main.SelfCheck = '1') and (IsNumber(Trim(E_password.Text))) then
  begin
       MessageDlg('초기화하여 부여받은 비밀번호는 "임원 급여 Password 변경" 후 로그인 하시기 바랍니다.',mtInformation,[mbOK],0);
       BT_PassClick(Self);
       E_password.Text := '';
  end
  else if (FM_Main.SelfCheck = '1') then
  begin
       Application.ProcessMessages;
       Self.Close;
  end
  else
       E_password.Text := '';
end;

procedure TLoginForm.BT_PassClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, 'PKZ2030A');  //Call하는 단위 프로그램의 버젼을 체크..
  FM_DownLoad.FL_UserID := pEmpno;
  if (not FM_DownLoad.FL_VersionCHK ) or
     (not FileExists(GSHomeDir+'\Bin\3tier\PKZ2030A.EXE')) then
  begin
       //2016.06.09 jissi OS계정 보안강화 개선
       //FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Kbin','PKZ2030A.EXE','PKZ2030A',FM_DownLoad.FL_ProgVer); //단위 프로그램 다운받기.
       FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Kbin','PKZ2030A.EXE','PKZ2030A',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
       FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
       LSfilename := GSHomeDir+'\Bin\3Tier\PKZ2030A.EXE ,'
                   + E_empno.Text       +','+Passemp(cmdline,2) +','+'@@@@@'+','
                   + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6)+','
                   + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9)+','//+' '+','+' '+','+' '+','
                   + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                   //2016.06.09 jissi OS계정 보안강화 개선
                   //+ Passemp(cmdline,13);
                   + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15) ;

       strpcopy( LAarg, LSfilename );
       winexec(LAarg, SW_SHOWNORMAL);

       FM_DownLoad.Close;  // 다운로드 폼 닫기.
  end;
end;

procedure TLoginForm.FormShow(Sender: TObject);
const
  ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var reg : TRegistry;
begin
  VarLoading;  //2016.06.09 jissi OS계정 보안강화 개선
  //////////////////////////////////////////////////////////////////////////////
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if reg.OpenKey(ObjName,False) then
     GSHomeDir := reg.ReadString('NewHomeDir');
  reg.CloseKey;
  reg.Free;
  //////////////////////////////////////////////////////////////////////////////
  FG_Cnt := 0;
  //2015.05.26 jissi 관리자들 임원본인확인 Pass 가능하도록
  //if Copy(E_empno.Text,1,1) <> 'M' then
  if Copy(FM_Main.GSempno,1,1) <> 'M' then
  begin
       FreePass.Visible := True;
       E_empno.Enabled  := True;
  end
  else
  begin
       FreePass.Visible := False;
       E_empno.Enabled  := False;
  end;
  //2015.03.26 jissi 문의사항 고정문구=> 테이블 필드에서 읽도록 변경
  with Qr_tmp do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add('SELECT Callmsg,                        ');
       Sql.Add('       '''','''','''',''''             ');
       Sql.Add('  FROM PKZCPBAS                        ');
       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       Open;
       SL_CallMSG.Caption := FieldByName('field1').AsString;
       Close;
  end;
  E_password.SetFocus;
end;

procedure TLoginForm.E_passwordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then SB_OkClick(Sender);
end;

procedure TLoginForm.FreePassClick(Sender: TObject);
begin
  FM_Main.SelfCheck := '1';
  Close;
end;

procedure TLoginForm.SF_MainCloseButton(Sender: TObject);
begin
  SB_CloseClick(Sender);
end;

end.
