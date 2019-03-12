unit POPUP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnEditMemo, OnScheme;

type
  TFm_quest = class(TForm)
    Panel2: TPanel;
    m_body: TOnMemo;
    SF_quest: TOnSchemeForm;
    Sb_Confirm: TOnFocusButton;
    m_title: TOnEdit;
    TDS_Com: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure Sb_ConfirmClick(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    GsEmpno, GsKorname, GsPayraname, GsDeptname, Gsbigo: String;
    GsHopesayu: WideString;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    function Rcv_Email_List: string;
    function RemoveSpecialChar(sSrc: string): string;
    Function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;    


  end;

var
  Fm_quest : TFm_quest;

implementation
uses PIU3040A1;
{$R *.DFM}

procedure TFm_quest.FormCreate(Sender: TObject);
begin
//    close;
end;

procedure TFm_quest.Sb_ConfirmClick(Sender: TObject);
begin
    SendProgID  := 'PIU3040A';
    SendEmpno   := FM_Mainform.FG_empno;
    RcveEmpno   := Rcv_Email_List;
    MailSubject := RemoveSpecialChar(m_title.text);
    MailBody    := RemoveSpecialChar(m_body.text);
    ReceiveYN   := 'N';

    if(trim(MailSubject)='') then
    begin
         MessageDlg('제목을 입력해 주세요!! ', mtInformation, [mbok], 0) ;
         m_title.SetFocus;
         exit;
    end;

    if(trim(MailBody)='') then
    begin
         MessageDlg('내용을 입력해 주세요!! ', mtInformation, [mbok], 0) ;
         m_body.SetFocus;
         exit;
    end;

    if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('문의 메일을 전송하였습니다...',mtInformation, [mbOk], 0)
    else
       MessageDlg('문의 메일 전송을 실패하였습니다...',mtError, [mbOk], 0);

    //close;
end;
function TFm_quest.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result := '';
  for I:=1 to Length(sSrc) do
    //if (sSrc[I] in [' ','A'..'Z', 'a'..'z', '0'..'9','(',')']) or (ByteType(sSrc, I)<>mbSingleByte) then
    if not(sSrc[I] in ['''','$','#']) then
      result := result + sSrc[I];
end;

//2017.07.21.hjku.. 이메일 수신 리스트 추가.. 김진호M 요청
function TFm_quest.Rcv_Email_List: string;
var
  I: integer;
begin
     result := '';
     FM_Mainform.PL_Com_Contructor;

     with FM_Mainform.TDS_com do
     begin
          //////////////////////////////////////////////////////////////////////
          Close;
          Sql.Clear;
          sql.add('SELECT EMPNO, SDATE, EDATE, '''',''''       ');
          sql.add('  FROM PZPRGUSER                            ');
          sql.add(' WHERE PROGEXE       =''PIU3040A''          ');
          sql.add('   AND NVL(USEYN,''N'')=''Y''               ');
          sql.add('   AND NVL(GRADE,'' '')=''E''               ');
          Open;
          first;

          i:= 0;

          while not EOF do
          begin
            i := i + 1;

            if(i=1) then result := FieldByName('field1').AsString
            else result := result +';' + FieldByName('field1').AsString;

            if(i=10)then break;
            
            next;
          end;
     end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFm_quest.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     with TDS_Com do
     begin
          ServiceName := 'PIT1030A_DML';
          Close;
          SQL.Clear;
          SQL.Add('insert into PZHMAIL                         ');
          SQL.Add('values (to_char(sysdate,''YYYYMMDDHH24MISS''),');  //SENDTIME   메일발송 작업시간
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
               Execute
          except
               Result := false;
               exit;
          end;
          Result := True;
     end;
end;


end.
