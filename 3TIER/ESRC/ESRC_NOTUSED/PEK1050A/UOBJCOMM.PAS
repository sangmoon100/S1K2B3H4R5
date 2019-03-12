unit UObjComm;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, pegradpanl, kpaylib, OnScheme;

type
  TObjCommForm = class(TForm)
    Label5: TLabel;
    SF_Main: TOnSchemeForm;
    Pa_Title: TPeJeonGrdPanel;
    E_e1ObjComment: TMemo;
    B_Save: TPeJeonOutLookBtn;
    procedure B_SaveClick(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure E_e1ObjCommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
  public
    { Public declarations }
    Lrabasdate : string;
    Lempno     : string;
  end;

var
  ObjCommForm: TObjCommForm;

implementation
 uses HMainForm;
{$R *.DFM}

procedure TObjCommForm.B_SaveClick(Sender: TObject);
var  SqlText : string;
begin
   if B_Save.Caption = ' 반려사유 저장 ' then
   begin
        SqlText := 'UPDATE peactfile                                            '+
                   '   SET rvalconyn    = ''N'',                                '+
                   '       rvalcondate  = Null ,                                '+
                   '       e1valconyn   = ''R'',                                '+
                   '       e1valcondate = TO_CHAR(SYSDATE,''YYYYMMDD'') ,       '+
                   '       e1ObjComment = '''+ trim(E_e1ObjComment.Text)  +''', '+
                   '       Writeemp     = '''+ FM_Main.Pempno       +''',      '+
                   '       Writetime    = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                   ' WHERE RABASYM      = '''+ FM_Main.LRabasYM      +'''       '+ //01월로 지정하여
                   '   AND empno        = '''+ FM_Main.ED_empno.Text +'''       ';

        FM_Main.Cupd_SQL := Sqltext;
        FM_Main.Cupd_Exec;
        if not FM_Main.Cupd_ret then
        begin
             Messagedlg('APP-Server Error',mtError,[mbOK],0);
             FM_Main.LE1valconyn := 'R';
             Exit;
        end;
        MessageDlg('반려사유를 저장하였습니다.',mtinformation,[mbOK],0);

        //////////////////////////////////////////////////////////////////////////////
        //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
        SendProgID  := 'PEK1050A';
        SendEmpno   := FM_Main.Le1empno;
        RcveEmpno   := FM_Main.Ed_empno.Text;
        MailSubject := '[팀장 Action Contract Reflection] 반려';
        MailBody    := FM_Main.LRabasYY+'년 '+FM_Main.LRabasMM+FM_Main.Rabasname+'팀장 Action Contract Reflection을 반려하였습니다.'+#13+#13+
                       '내용 수정후 최종완료하시기 바랍니다.'+#13+#13+
                       '[화면위치 안내] : 종합인사시스템 - 평가 - Action Contract - 팀장Action Contract Reflection ';
        ReceiveYN   := 'N';

        if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
        begin
             MessageDlg(' 결재상신 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
             exit;
        end
        else MessageDlg(' 결재상신 메일전송을 성공 하였습니다...',mtError, [mbOk], 0);
        //////////////////////////////////////////////////////////////////////////////

        close;
   end
   else
        Close;
end;

procedure TObjCommForm.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
  begin
    Releasecapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TObjCommForm.E_e1ObjCommentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(TMemo(Sender).text, 1, Length(TMemo(Sender).text)-1);
          TMemo(Sender).Clear;
          TMemo(Sender).Lines.Append(ViewText);
     end;
end;

Function TObjCommForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with FM_Main.TMaxDML_HInsa do
  begin
       ServiceName := 'PIT1030A_DML';
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
