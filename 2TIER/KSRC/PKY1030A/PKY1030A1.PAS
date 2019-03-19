{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKY1030A(근태 미등록/미결재  조회 및 일괄 등록/결재)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME :
 Programmer     : 지순미
 Version        : 1.00
 Date           : 2017.01.20

Update Contents
   Version    date(yy.mm.dd)     programmer      description
    1.0       2017.01.20         지순미          PKA4130C 정규직 소스에서 분리
============================================================================= *}
unit PKY1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, pedbgrid, Buttons, Db, DBTables, pass, Mask,
  DBClient, ExtCtrls,FormMon1, Kylib1, Func, Ora, MemDS, DBAccess, 
  OnCheckBox;

type
  TFM_Main = class(TForm)
    GroupBox1: TGroupBox;
    cbx_pstate: TComboBox;
    GroupBox2: TGroupBox;
    DataSource1: TDataSource;
    btn_find_a: TBitBtn;
    DBGrid1: TDBGrid;
    btn_find_s: TBitBtn;
    Label3: TLabel;
    cbx_pstate_to: TComboBox;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    maintitle: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ME_findmon: TMaskEdit;
    Lsysdate: TLabel;
    Lempno: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    cbx_payra_f: TComboBox;
    cbx_payra_t: TComboBox;
    Label8: TLabel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
    total_work: TLabel;
    Panel18: TPanel;
    Panel11: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    mail_sub1: TEdit;
    Mail1: TMemo;
    Panel22: TPanel;
    btn_mail: TBitBtn;
    Chk_all: TCheckBox;
    chk_all_s: TCheckBox;
    btn_mail_s: TBitBtn;
    Panel15: TPanel;
    mail_sub2: TEdit;
    Mail2: TMemo;
    total_con: TLabel;
    SBfr: TSpeedButton;
    Btn_exit: TBitBtn;
    Panel13: TPanel;
    cbx_pstate1: TComboBox;
    cbx_pstate1_to: TComboBox;
    cbx_payra1_t: TComboBox;
    cbx_payra1_f: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel14: TPanel;
    btn_save: TBitBtn;
    btn_save1: TBitBtn;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    Panel17: TPanel;
    Panel20: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    btn_dutyin: TBitBtn;
    btn_sign: TBitBtn;
    cbx_dutycode: TComboBox;
    Panel25: TPanel;
    Query1: TOraQuery;
    Query3: TOraQuery;
    Query2: TOraQuery;
    Query4: TOraQuery;
    Query1ROWNUM: TFloatField;
    Query1EMPNO: TStringField;
    Query1KORNAME: TStringField;
    Query1CODENAME: TStringField;
    Query1ORGNUM: TStringField;
    Query1DEPTCODE: TStringField;
    Query1EMPDATE: TStringField;
    Query1PAYRA: TStringField;
    Query3ROWNUM: TFloatField;
    Query3EMPNO: TStringField;
    Query3KORNAME: TStringField;
    Query3CODENAME: TStringField;
    Query3EEMPNO: TStringField;
    Query3EKORNAME: TStringField;
    Query3JOBDEPT: TStringField;
    Query3PAYRA: TStringField;
    Query3PSTATE: TStringField;
    Query3PAYRANAME: TStringField;
    GroupBox3: TGroupBox;
    rb_mail1: TRadioButton;
    rb_sms1: TRadioButton;
    GroupBox4: TGroupBox;
    rb_mail2: TRadioButton;
    rb_sms2: TRadioButton;
    Query1RETCONT: TStringField;
    GroupBox5: TGroupBox;
    cb_leave1: TOnCheckBox;
    cb_dayoff1: TOnCheckBox;
    GroupBox6: TGroupBox;
    cb_leave2: TOnCheckBox;
    cb_dayoff2: TOnCheckBox;
    Panel9: TPanel;
    ed_OFFITEL: TEdit;
    Query3ERETCONT: TStringField;
    Query5: TOraQuery;
    Edit1: TEdit;
    C_GubunNM: TPanel;
    C_Gubun: TComboBox;

    procedure btn_find_aClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Chk_allClick(Sender: TObject);
    procedure btn_mailClick(Sender: TObject);
    procedure btn_find_sClick(Sender: TObject);
    procedure chk_all_sClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btn_mail_sClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Btn_exitClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ME_findmonChange(Sender: TObject);
    procedure cbx_pstateChange(Sender: TObject);
    procedure cbx_pstate_toChange(Sender: TObject);
    procedure cbx_payra_fChange(Sender: TObject);
    procedure cbx_payra_tChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbx_pstate1Change(Sender: TObject);
    procedure cbx_pstate1_toChange(Sender: TObject);
    procedure cbx_payra1_fChange(Sender: TObject);
    procedure cbx_payra1_tChange(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_save1Click(Sender: TObject);
    procedure btn_dutyinClick(Sender: TObject);
    procedure btn_signClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure rb_mail1Click(Sender: TObject);
    procedure rb_sms1Click(Sender: TObject);
    procedure rb_mail2Click(Sender: TObject);
    procedure rb_sms2Click(Sender: TObject);
    procedure C_GubunChange(Sender: TObject);


private
    { Private declarations }
    cflag    : boolean; // 근태미등록 전체선택해제
    cflag_s  : boolean; // 근태미결재 전체선택해제
    Pemplist : string;  // 미결재자 명단
    chk_temp : string;
    Curdate  : String;
    GS_Friday : String;
    YmanagerYN : boolean;

    D : array[1..42] of string;    // 팀장,실장,담당를 제외한 사원근태
    P : array[1..42] of string;    // 팀장,실장,담당 근태           02/12/12
    h : integer;        // 처음요일
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    HandTel,  SendTel,  SmsBody,  SmsSubject : String;
    procedure SetCalender;        // Calender Set
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
    procedure SetMessages(flag:integer);        // 메시지 초기화
    Function  SendEMessages(Rcvemp,Pemplist,rcvtel:string) : Boolean;        // 메시지 전송
    Function  Send_Sms(HandTel, SendTel, SmsSubject,SmsBody : String) : Boolean;
public
    { Public declarations }
     chk_color   : array[1..5000] of char; //근태미등록선택
     chk_color_s : array[1..5000] of char; //근태미결재선택
  end;

var
    FM_Main: TFM_Main;

implementation

uses ComObj;
{$R *.DFM}

//달력생성
procedure TFM_Main.SetCalender;                     // Calender Set
var
     i,j,k  : integer;
     F      : String[1];
     CDay   : TDateTime;
     dukind : string;
     s      : array[1..10] of integer; //20021212 전산요청
     qq : TOraQuery;
begin
     For i := 1 to 42 do
     begin
          D[i]:= '';
          P[i]:= '';
     end;

     for i :=1 to 10 do
     begin
          s[i] := 0;
     end;

     F := DateSeparator;                     // System Date Format Mask
     j := DaysOfMonth(StrToInt(copy(ME_findmon.Text,1,4)),StrToInt(copy(ME_findmon.Text,5,2))); //그달의 총일수
     dukind := copy(cbx_dutycode.Text ,1,2);              //근태코드

     //기준년월의 토,일셋팅   20021212전산요청에의한 수정
     for i := 1 to j do
     begin
          CDay := StrToDate(copy(ME_findmon.Text,1,4)+F+copy(ME_findmon.Text,5,2)+F+inttostr(i));
          Case DayOfWeek(CDay) of
              1 : begin
                      D[i]:='49';
                      p[i]:='49';
                  end;
              2 : begin
                      D[i]:=dukind;
                      p[i]:=dukind;
                  end;
              3 : begin
                      D[i]:=dukind;
                      p[i]:=dukind;
                  end;
              4 : begin
                      D[i]:=dukind;
                      p[i]:=dukind;
                  end;
              5 : begin
                      D[i]:=dukind;
                      p[i]:=dukind;
                  end;
              6 : begin
                      D[i]:=dukind;
                      p[i]:=dukind;
                  end;
              7 : begin
                      D[i]:='49';
                      p[i]:='49';
                  end;
          end;
     end;

     // 공휴일설정
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add(' select holidate from pkcholi                          ' +
                       '  where substr(holidate,1,6) = '''+ME_findmon.Text+''' ');
               Open;

               First;
               while NOT eof do
               begin
                   for i := 1 to j do
                   begin
                       if ME_findmon.Text+formatfloat('00',i) = FieldByName('HOLIDATE').AsString then
                            D[i]:='49';
                   end;
                   next;
               end;
          end;
     Finally
          qq.Free;
     end;
end;



//-------------------------------main--------------------
procedure TFM_Main.btn_find_aClick(Sender: TObject);
var
     i,j     : integer;
     Field   : TField;
     t_paste,t_paste_to,t_payra_f,t_payra_t : string;
     day_qry : String;
begin
     //2013.08.19.hjku. 미등록 대상자 추출 오류 해결하기 위해 추가...
     j := DaysOfMonth(StrToInt(copy(ME_findmon.Text,1,4)),StrToInt(copy(ME_findmon.Text,5,2))); //그달의 총일수

     for i := 1 to j do
     begin
          if i=1 then day_qry := 'nvl(DD'+inttostr(i)+' ,''99'')=''99'' '+#13#10
                 else day_qry := day_qry + 'OR nvl(DD'+inttostr(i)+' ,''99'')=''99'' '+#13#10;
     end;

     chk_all.Enabled    := true;
     btn_mail.Enabled   := true;
     btn_dutyin.Enabled := true;
     btn_save.enabled   := true;

{수정 2008.07.28
     t_paste    := copy(cbx_pstate.text ,1,2);
     t_paste_to := copy(cbx_pstate_to.text ,1,2);
     t_payra_f  := copy(cbx_payra_f.text ,1,2);
     t_payra_t  := copy(cbx_payra_t.text ,1,2);
}
     t_paste    := trim(copy(cbx_pstate.text ,1,3));
     t_paste_to := trim(copy(cbx_pstate_to.text ,1,3));
     t_payra_f  := trim(copy(cbx_payra_f.text ,1,3));
     t_payra_t  := trim(copy(cbx_payra_t.text ,1,3));

     for j := 1 to 5000 do
         chk_color[j] := 'N' ;  //근태미등록선택 초기화

     //근태미등록 Select
     with Query1 do
     begin
         Close ;
         sql.Clear ;
         Sql.Add(' SELECT rownum,  A.empno, A.korname, A.codename,  A.empdate,                       ' +#13#10+
                 '        A.orgnum, A.deptcode,  B.codename payra, RETCONT                           ' +#13#10+
                 '  FROM (                                                                           ' +#13#10+
                 '        SELECT  d.empno, i.korname, c.codename, i.empdate ,                        ' +#13#10+
                 '                i.orgnum, i.deptcode,  i.payra,                                    ' +#13#10+
                 '                TRANSLATE(RETCONT,''0123456789''||RETCONT,''0123456789'') RETCONT  ' +#13#10+
                 '          FROM  pimpmas i, pyccode c ,                                             ' +#13#10+
                 '                (                                                                  ' +#13#10+
                 '                 select empno from pimpmas                                         ' +#13#10+
                 '                  minus                                                            ' +#13#10+
                 '                 select empno from pkhduty                                         ' +#13#10+
                 '                  where duyymm = ''' + ME_findmon.text + '''                       ' +#13#10+
 //일부근태등록한 사람도 추출되도록 수정 2008.07.29
 //2013.08.19.hjku. 오류 수정
                 {'                    AND not (nvl(DD1 ,''-1'')=''99'' OR nvl(DD2 ,''-1'')=''99''  ' +
                 '                         OR  nvl(DD3 ,''-1'')=''99'' OR nvl(DD4 ,''-1'')=''99''  ' +
                 '                         OR  nvl(DD5 ,''-1'')=''99'' OR nvl(DD6 ,''-1'')=''99''  ' +
                 '                         OR  nvl(DD7 ,''-1'')=''99'' OR nvl(DD8 ,''-1'')=''99''  ' +
                 '                         OR  nvl(DD9 ,''-1'')=''99'' OR nvl(DD10,''-1'')=''99''  ' +
                 '                         OR  nvl(DD11,''-1'')=''99'' OR nvl(DD12,''-1'')=''99''  ' +
                 '                         OR  nvl(DD13,''-1'')=''99'' OR nvl(DD14,''-1'')=''99''  ' +
                 '                         OR  nvl(DD15,''-1'')=''99'' OR nvl(DD16,''-1'')=''99''  ' +
                 '                         OR  nvl(DD17,''-1'')=''99'' OR nvl(DD18,''-1'')=''99''  ' +
                 '                         OR  nvl(DD19,''-1'')=''99'' OR nvl(DD20,''-1'')=''99''  ' +
                 '                         OR  nvl(DD21,''-1'')=''99'' OR nvl(DD22,''-1'')=''99''  ' +
                 '                         OR  nvl(DD23,''-1'')=''99'' OR nvl(DD24,''-1'')=''99''  ' +
                 '                         OR  nvl(DD25,''-1'')=''99'' OR nvl(DD26,''-1'')=''99''  ' +
                 '                         OR  nvl(DD27,''-1'')=''99'' OR nvl(DD28,''-1'')=''99''  ' +
                 '                         OR  nvl(DD29,''-1'')=''99'' OR nvl(DD30,''-1'')=''99''  ' +
                 '                         OR  nvl(DD31,''-1'')=''99'')                            ' +}
                 '                    AND not (' + day_qry + ')                                    ' +#13#10+
                 '                ) d                                                              ' +#13#10+
                 '         WHERE i.empno = d.empno                                                 ' +#13#10+
                 '           AND substr(i.empdate,1,6) <=''' + ME_findmon.text + '''               ' +#13#10+
                 '           AND i.pstate = c.codeno                                               ' +#13#10+
                 '           AND c.codeid = ''I114''                                               ' +#13#10+
                 '           AND i.pstate BETWEEN ''' + t_paste  + ''' AND ''' + t_paste_to + '''  ' +#13#10+
                 '           AND i.payra  between ''' + t_payra_f+ ''' and ''' + t_payra_t  + '''  ');

          //2014.03.18.hjku 조회조건(현원만,말일휴직자제외,말일휴가자제외) 추가... 홍원영M 요청
          Sql.Add('           AND i.pstateyn=''Y''                                                  ');

          if(cb_leave1.Checked) then
             sql.Add('and  not exists(select 1  from pihvaca where i.empno = empno and to_char(last_day(to_date(''' + ME_findmon.text + ''',''YYYYMM'')),''YYYYMMDD'') between HUFRDATE and HUTODATE)');

          if(cb_dayoff1.Checked) then
             sql.Add('and  not exists(select 1  from pihanno where i.empno = empno and ancode in (''511'',''512'') and to_char(last_day(to_date(''' + ME_findmon.text + ''',''YYYYMM'')),''YYYYMMDD'') Between nvl(anfrdate,''00000000'') And nvl(antodate,''99999999''))');

{삭제 2008.07.28
           if  t_payra_f <= '27' then
           begin
               if t_payra_t <= '27' then
                  sql.Add(' and i.payra between '''+t_payra_f+''' and '''+t_payra_t+''' '+
                          ' and i.paycl between ''10'' and ''E0''                       ')
               else
                  sql.Add('and (( i.payra BETWEEN '''+t_payra_f+''' AND ''27'' '+
                          'and i.paycl between ''10'' and ''E0'')              '+
                          ' or i.payra BETWEEN ''28'' AND '''+ t_payra_t+''')  ');
           end
           else
           begin   //  if t_payra_t > '27' then
                  sql.Add(' AND i.payra BETWEEN ''' + t_payra_f + ''' AND ' + ''''+ t_payra_t + '''' );
           end;
}
          sql.Add(')A, pyccode B                                                ' +
                  'WHERE A.payra  = B.codeno                                    ' +
                  '  AND B.codeid = ''I113''                                    ' +
                  '  AND A.empno not like ''M%'' and A.empno <>''Q018''         ' );
          sql.Add('  and a.empno like ''Y%''                                    ' );

          //memo1.text := sql.Text;

          //SQL.SAVETOFILE('C:\BB.SQL');
          Open;

          //2016.10.10 eyha 기능주석처리
          {if  copy(Pempno,1,1) ='Y' then
          begin
                if (t_payra_f <> 'K11') OR (t_payra_t <> 'K11') then
                   MessageDlg('파견직 사원입니다. 정규직 작업을 조회했으니 확인 해 보세요....',mtError, [mbOk], 0);

          end;}

          total_work.Caption := '총 ' + inttostr(query1.recordcount)+'건이 조회되었습니다' ;
          if query1.RecordCount <= 0 then
          begin
              chk_all.Enabled  := false;
              btn_mail.Enabled := false;
              btn_dutyin.Enabled := false;
              close;
              exit;
          end;
     end;  // End of(with Query1 do)

     total_work.Caption := '총 ' + inttostr(query1.recordcount)+'건이 조회되었습니다' ;

     SetMessages(1); //메시지 초기화
{
      //메일제목
     mail_sub1.Text  := '[필독] ' +copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미등록 알림.';
     mail1.Lines.Text:='안녕하십니까 HR팀입니다.' + #13#10+
                       '현재 본인의 ' + copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2) + '월 근태가 미등록인 상태입니다.' + #13#10+
                       '즉시, 근태등록 화면에서 본인의 근무지 확인 및 근태를 등록하여 주시기 바랍니다.' + #13#10+
                       '근태가 등록/결재되지 않으면 익월 급여지급시 식대교통비 산정에 불이익이 있을 수 있습니다.' + #13#10+  #13#10+
                       '감사합니다' + #13#10;
}
end;

procedure TFM_Main.DBGrid1DblClick(Sender: TObject);
var
     i: integer;
begin
     if not query1.active then exit;

     for i := 1 TO Query1.RecordCount do
     begin
          if      chk_all.Checked       then chk_color[i] := 'Y'
          else if not chk_all_s.checked then chk_color[i] := 'N';
     end;

     Query1.DisableControls;
     Query1.Next;
     if not Query1.Eof then Query1.Prior;
     Query1.EnableControls ;
     cflag := false;
end;

procedure TFM_Main.Chk_allClick(Sender: TObject);
var
     i : integer;
begin
     //전체선택 또는 해제에 따라 그리드 더블클릭 call
     if chk_all.Checked then
     begin
          cflag := false;
          DBGrid1DblClick(sender);//DBGrid1CellClick(sender);
     end
     else if not chk_all.Checked then
     begin
          cflag := true;
          DBGrid1DblClick(sender);//DBGrid1CellClick;
     end;
     chk_temp :='N';
end;

procedure TFM_Main.btn_mailClick(Sender: TObject);
var
     i ,chk_cnt : integer;
     Selemp  : TStringList;
     TmpTitle,TmpBody, sTemp : string;
begin
     total_work.Caption  := '';

     if(not IsNumber(ed_OFFITEL.Text)) then
     begin
        MessageDlg('연락받을 전화번호는 숫자만 입력하십시오...',mtError, [mbOk], 0);
        ed_OFFITEL.SetFocus();
        exit;
     end;

     if(ed_OFFITEL.text='') then
     begin
        MessageDlg('연락받을 전화번호를 입력하십시오...',mtError, [mbOk], 0);
        ed_OFFITEL.SetFocus();
        exit;
     end;

     if not Query1.Active then system.Exit;

     // 사원선택 체크
     chk_cnt := 0;
     for i := 1 to query1.RecordCount do
     begin
          if chk_color[i] ='Y' then chk_cnt := chk_cnt +1;
     end;

     if chk_cnt <= 0 then
     begin
          total_work.Caption := '먼저 메일을 보낼 사원을 클릭으로 선택하세요!';
          exit;
     end;

     query1.First;

     for i := 1 to query1.RecordCount do
     begin
          if chk_color[i] ='Y' then
          begin
              { if Inter = nil then System.exit ;
               try
                   Inter.SendFrom   := fpka4130.pKorname + ' ' + fpka4130.Pempno ;    //parksh 030506
                   Inter.SendTo     := Query1.FieldByName('empno').AsString;  //'Z113';
                   Inter.SendToName := Query1.FieldByName('korname').AsString;//'강륜종';
                   Inter.CorName    := 'HANARO';
                   Inter.Subject    := mail_sub1.Text;
                   Inter.Body       := mail1.Text ;
                   Inter.SendMail;
               except
                   MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
                   Halt;
               end; //try }

               if(rb_mail1.Checked) then
               begin
                   //////////////////////////////////////////////////////////////////////////////
                   //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
                   SendProgID  := 'PKY1030A';
                   SendEmpno   := Pempno;
                   RcveEmpno   := Query1.FieldByName('empno').AsString;
                   MailSubject := mail_sub1.Text;
                   MailBody    := mail1.Text;
                   ReceiveYN   := 'N';
                   //if ChkReceive.Checked then ReceiveYN := 'Y';

                   if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                   begin
                        MessageDlg('사번'+RcveEmpno+'의 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                        exit;
                   end;
                   //////////////////////////////////////////////////////////////////////////////
               end
               else if(rb_sms1.Checked) then
               begin
                   //////////////////////////////////////////////////////////////////////////////
                   HandTel    := Query1.FieldByName('RETCONT').AsString;
                   SendTel    := ed_OFFITEL.Text;
                   SmsSubject := mail_sub1.Text;
                   SmsBody    := mail1.Text;
                   RcveEmpno  := Query1.FieldByName('empno').AsString;

                   if not Send_Sms(HandTel, SendTel, SmsSubject,SmsBody) then
                   begin
                        MessageDlg('사번'+RcveEmpno+'의 SMS 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                        exit;
                   end;
                   //////////////////////////////////////////////////////////////////////////////
               end;
          end;
          query1.next;
     end; //end of for
     total_work.Caption := '메일/SMS가 성공적으로 발송되었습니다.';
end;

procedure TFM_Main.btn_find_sClick(Sender: TObject);
var
     i,j     : integer;
     Field : TField;
     t_paste1,t_paste1_to,t_payra1_f,t_payra1_t : string;
     day_qry : String;     
begin
     query3.close;
     chk_all_s.Enabled := true;
     btn_mail_s.Enabled:= true;
     btn_save1.Enabled   := true;
     btn_sign.Enabled   := true;

{2008.07.28 수정
     t_paste1   := copy(cbx_pstate1.text ,1,2);
     t_paste1_to:= copy(cbx_pstate1_to.text ,1,2);
     t_payra1_f := copy(cbx_payra1_f.text ,1,2);
     t_payra1_t := copy(cbx_payra1_t.text ,1,2);
}
     t_paste1    := trim(copy(cbx_pstate.text ,1,3));
     t_paste1_to := trim(copy(cbx_pstate_to.text ,1,3));
     t_payra1_f  := trim(copy(cbx_payra_f.text ,1,3));
     t_payra1_t  := trim(copy(cbx_payra_t.text ,1,3));
     
     //2013.08.19.hjku. 미등록 대상자 추출 오류 해결하기 위해 추가...
     j := DaysOfMonth(StrToInt(copy(ME_findmon.Text,1,4)),StrToInt(copy(ME_findmon.Text,5,2))); //그달의 총일수

     for i := 1 to j do
     begin
          if i=1 then day_qry := 'nvl(DD'+inttostr(i)+' ,''99'')=''99'' '+#13#10
                 else day_qry := day_qry + 'OR nvl(DD'+inttostr(i)+' ,''99'')=''99'' '+#13#10;
     end;

     for j := 1 to 5000 do
         chk_color_s[j] := 'N' ;   //근태미결재선택 초기화
         
     //2014.03.18.hjku. 오류로 인해 삭제...
     //query3.Open;

     //근태미결재 Select
     with Query3 do
     begin
          Close ;
          sql.Clear ;
          sql.Add ('SELECT rownum,     P.empno,   P.korname, P.codename , P.eempno ,                                         '+#13+
                   '       P.ekorname, P.jobdept, P.payra,   P.payraname, P.pstate, ERETCONT                                 '+#13+
                   '  FROM (SELECT  A.empno,   A.korname,  A.codename, A.eempno,  A.ekorname,                                '+#13+
                   '                A.jobdept, A.payra,    B.codename  payraname, A.pstate,                                  '+#13+
                   '                TRANSLATE(RETCONT,''0123456789''||RETCONT,''0123456789'') ERETCONT                       '+#13+
                   '          FROM (SELECT  p.empno,  p.payra,  p.korname,  c.codename,   p.pstate,                          '+#13+
                   '                        DECODE(d.deptcode,null,p.eempno,d.empno)      eempno  ,                          '+#13+
                   '                        DECODE(d.deptcode,null,p.ekorname, d.korname) ekorname,                          '+#13+
                   '                        p.jobdept                                                                        '+#13+
                   '                  FROM (SELECT p.empno,   p.korname,p.eempno,   p.ekorname,                              '+#13+
                   '                               p.jobdept, p.pstate, p.deptcode, p.orgnum, p.payra                        '+#13+
                   '                          FROM pkhduty a, pimeemp p, pimpmas i                                           '+#13+
                   '                         WHERE a.empno            = p.empno                                              '+#13+
                   '                           and a.empno            = i.empno                                              ');

          //2014.03.18.hjku 조회조건(현원만,말일휴직자제외,말일휴가자제외) 추가... 홍원영M 요청
          Sql.Add('                           AND i.pstateyn=''Y''                                                  ');

          if(cb_leave2.Checked) then
             sql.Add('                           AND  not exists(select 1  from pihvaca where i.empno = empno and to_char(last_day(to_date(''' + ME_findmon.text + ''',''YYYYMM'')),''YYYYMMDD'') between HUFRDATE and HUTODATE)');

          if(cb_dayoff2.Checked) then
             sql.Add('                           AND  not exists(select 1  from pihanno where i.empno = empno and ancode in (''511'',''512'') and to_char(last_day(to_date(''' + ME_findmon.text + ''',''YYYYMM'')),''YYYYMMDD'') Between nvl(anfrdate,''00000000'') And nvl(antodate,''99999999''))');
                   

          sql.Add ('                           AND a.duyymm           = '''+ me_findmon.Text + '''                           '+#13+
                   '                           AND not (' + day_qry + ')                                                     '+#13+
                   '                           AND nvl(a.conyn,''N'') <>''Y'') p ,                                           '+#13+
                   '               pyccode c,  pkcotman d                                                                    '+#13+
                   '         WHERE p.pstate   = c.codeno    AND C.codeid = ''I114''                                          '+#13+
                   '           AND P.orgnum   = d.orgnum(+) AND P.deptcode = d.deptcode(+)                                   '+#13+
                   '           AND '''+ copy(curdate,1,8) +''' BETWEEN d.jobfrdate(+) AND NVL(d.jobtodate(+),''99999999'')   '+#13+
                   '           AND d.jobkind(+) = ''1''                                                                      '+#13+
                   '         order by p.eempno ) A,  pyccode B, PIMPMAS C                                                    '+#13+
                   ' WHERE A.EEMPNO = C.EMPNO                                                                                '+#13+
                   '   AND B.codeid = ''I113''  AND A.payra = B.codeno                                                       '+#13+
                   '   AND A.pstate BETWEEN ''' + t_paste1 +'''    AND '''+ t_paste1_to +'''                                 '+#13+
                   '   AND A.payra  BETWEEN ''' + t_payra1_f + ''' AND '''+ t_payra1_t  +'''                                 ');

          sql.Add ('   and a.empno like ''Y%''                                                                               ');

          sql.Add (' GROUP BY  A.eempno, A.ekorname, A.empno , A.korname, A.codename, A.jobdept,                             '+#13+
                   '           A.payra,  B.codename, A.pstate,c.RETCONT ) P                                                  ');

          //memo2.Text := sql.Text;
          Open;
          //SQL.SAVETOFILE('C:\AA.SQL');
          if query3.RecordCount <= 0 then
          begin
               chk_all_s.Enabled  := false;
               btn_mail_s.Enabled := false;
               close;       //
               exit;
          end;
     end;  // End of(with Query3 do)


     //2016.10.10 eyha 기능주석처리
     {if  copy(Pempno,1,1) ='Y' then
     begin
           if (t_payra1_f <> 'K11') or (t_payra1_t <> 'K11') then
              MessageDlg('파견직 사원입니다. 정규직 작업을 조회했으니 확인 해 보세요....',mtError, [mbOk], 0);
     end;}

     total_con.Caption := '총 ' + inttostr(query3.recordcount)+'건이 조회되었습니다' ;

     SetMessages(2); //메시지 초기화
{
     mail_sub2.text := '[필독] ' +copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미결재 알림';
     Mail2.Lines.Text:='안녕하십니까 HR팀입니다.'                                                          +#13#10+
                       '팀원들의 '+ copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2) + '월 근태가 미결재 상태입니다.' +#13#10+
                       '즉시, 근태등록 화면에서 해당 팀원들의 근태를 결재하여 주시기 바랍니다.              '+#13#10+
                       '근태가 결재되지 않으면 익월 급여지급시 식대교통비 산정에 불이익이 있을 수 있습니다.' +#13#10+
                       '결재권자인 팀장 본인의 근태는 본인이 결재하셔야 하며,'                               +#13#10+
                       '당월에 휴가/출장/교육 등의 특이 근태가 있는 직원의 근태결재는 해당내역에 이상여부를' +#13#10+
                       '다시 한번 확인하여주시기 바랍니다.  감사합니다.';
}
end;

procedure TFM_Main.chk_all_sClick(Sender: TObject);
var
     i : integer;
begin
     //전체선택 또는 해제에 따라 그리드 더블클릭 call(근태 미결재)
     //query3.first ;
     if chk_all_s.Checked then
     begin
          cflag_s := false;
          DBGrid2DblClick(Sender);
     end
     else if not chk_all_s.Checked then
     begin
          cflag_s := true;
          DBGrid2DblClick(Sender);
     end;
end;

procedure TFM_Main.DBGrid2DblClick(Sender: TObject);
var
     i :integer;
begin
    if not query3.active then exit;

     //더블클릭했을때 체크박스가 전체 선택인지 해지인지 또는 한줄 선택인지 에따라 chk_color[]의 값을 넣어줌(근태미결재)
    for i := 1 TO Query3.RecordCount do
    begin
         if          chk_all_s.Checked then chk_color_s[i] := 'Y'
         else if not chk_all_s.checked then chk_color_s[i] := 'N';
    end;

    Query3.DisableControls;
    Query3.Next;
    if not Query3.Eof then
         Query3.Prior;

    Query3.EnableControls ;
    cflag_s := false;
end;

procedure TFM_Main.btn_mail_sClick(Sender: TObject);
var
     i        : integer;
     Selemp   : TStringList;
     sTemp,sTemp2,tkorname    : string;
     ptemp    : string;  // 결재권자
     ptempname: string;  // 결재권자성명
     ptel     : string;  //결재자 휴대전화
     Pemplist, Pemplist1, Pemplist2 : STring;
     first    : Boolean ;
     chk_cnt  : integer;
begin
     total_con.caption := '';

     if(not IsNumber(ed_OFFITEL.Text)) then
     begin
        MessageDlg('연락받을 전화번호는 숫자만 입력하십시오...',mtError, [mbOk], 0);
        ed_OFFITEL.SetFocus();
        exit;
     end;

     if(ed_OFFITEL.text='') then
     begin
        MessageDlg('연락받을 전화번호를 입력하십시오...',mtError, [mbOk], 0);
        ed_OFFITEL.SetFocus();
        exit;
     end;

     // 사원선택 체크
     chk_cnt := 0;
     for i := 1 to query3.RecordCount do
     begin
          if chk_color_s[i] = 'Y' then  chk_cnt := chk_cnt +1;
     end;

     if chk_cnt <= 0 then
     begin
          total_con.Caption := '먼저 메일을 보낼 사원을 클릭으로 선택하세요!';
          exit;
     end;
     //////////////////////////////////////////////////////////////////////////////
     query3.First;
     for i := 1 to  query3.RecordCount do
     begin
          if chk_color_s[i] ='Y' then
          begin
               ptemp     := Query3.FieldByName('eempno').AsString;
               ptel      := Query3.FieldByName('ERETCONT').AsString;
               ptempname := Query3.FieldByName('ekorname').AsString;
               break;
          end;
          query3.next;
     end;

     //////////////////////////////////////////////////////////////////////////////
     Pemplist :=  #13#10+'*** 미결재 사원 명단 ***';
     query3.First;
     for i := 1 to query3.RecordCount  do
     begin
          if chk_color_s[i] = 'Y' then
          begin
               if ptemp = query3.fieldbyname('eempno').AsString then
               begin
                    stemp     := query3.fieldbyname('eempno').AsString;
                    Pemplist  := Pemplist + #13+
                                 query3.fieldbyname('empno').AsString   +'  '+
                                 query3.fieldbyname('korname').AsString;
               end
               else //메일 보내기
               begin
                    {//////////////////////////////////////////////////////////////////////////////
                    //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
                    SendProgID  := 'PKA4130C';
                    SendEmpno   := Pempno;
                    RcveEmpno   := ptemp; //'Z113';
                    MailSubject := mail_sub2.Text;
                    MailBody    := mail2.Text + Pemplist;
                    ReceiveYN   := 'N';
                    //if ChkReceive.Checked then ReceiveYN := 'Y';

                    if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
                         total_con.Caption := '결재자 사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
                    else
                    begin
                         total_con.Caption := '실패 결재자 사번 : '+ RcveEmpno;
                         MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                         exit;
                    end;
                    }
                    if not SendeMessages(ptemp,Pemplist,ptel) then exit;
                    Pemplist :=  #13#10+'*** 미결재 사원 명단 ***'+ #13#10 ;
               end;
               ptemp := Query3.FieldByName('eempno').AsString;
          end; //if~

          if ptemp <> stemp then  //피결재자가 1명만 있을경우 피 결재자 List가 안나오는 버그 해결...    dsa2000 2007.08.
          begin
               Pemplist  := Pemplist + #13+
                            query3.fieldbyname('empno').AsString   +'  '+
                            query3.fieldbyname('korname').AsString;
          end;

          query3.next;
     end; //for ~


     if  i = query3.RecordCount+1 then  //마지막...
     begin
          if not SendeMessages(ptemp,Pemplist,ptel) then exit;
          
          {//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
          MailBody    := '';
          SendProgID  := 'PKA4130C';
          SendEmpno   := Pempno;
          RcveEmpno   := ptemp; //'Z113';
          MailSubject := mail_sub2.Text;
          MailBody    := mail2.Text + Pemplist;     // edit1.text := MailBody;
          ReceiveYN   := 'N';
          //if ChkReceive.Checked then ReceiveYN := 'Y';

          if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
               total_con.Caption := '결재자 사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다'
          else
          begin
               total_con.Caption := '실패 결재자 사번 : '+ RcveEmpno;
               MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
               exit;
          end;
          }
     end;

     total_con.Caption := '메일/SMS 가 성공적으로 발송되었습니다.' ;
end;

procedure TFM_Main.SBfrClick(Sender: TObject);
var
     MonthForm : TMonthForm;
//     Month2Form : TMonth2Form;
begin

    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then
        ME_findmon.Text := Copy(MonthForm.DayCaption,1,4)+Copy(MonthForm.DayCaption,5,2);
    Finally 
        MonthForm.Free; 
    End;

{     Try
          Month2Form := TMonth2Form.Create(nil);
          Month2Form.rdaycaption := ME_findmon.Text;
          Month2Form.ShowModal;
          ME_findmon.text :=month2form.daycaption;
     Finally
          Month2Form.Free;
     end;}
end;

procedure TFM_Main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     //chk_color[]에 따라 미등록근태 선택된 row에 색깔 넣기
     with(Sender as TDBGrid).Canvas do
     begin
          if chk_color[Query1rownum.Asinteger] = 'Y' then
          begin
               Brush.Color := $00FFFF80 ;
               Font.color  := clBlack ;
               FillRect(Rect);
               TextOut(Rect.Left,Rect.Top,column.Field.AsString  );
          end
          else
          begin
               Brush.Color := clwindow;
               Font.color  := clBlack ;
               FillRect(Rect);
               TextOut(Rect.Left,Rect.Top,column.Field.AsString);
          end;
     end;
end;

procedure TFM_Main.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin   //chk_color[]에 따라 미결재근태 선택된 row에 색깔 넣기
     with(Sender as TDBGrid).Canvas do
     begin
          if chk_color_s[Query3rownum.Asinteger] = 'Y' then
          begin
               Brush.Color := $00FFFF80 ;
               Font.color  := clBlack ;
               FillRect(Rect);
               TextOut(Rect.Left,Rect.Top,column.Field.AsString);
          end
          else
          begin
               Brush.Color := clwindow;
               Font.color  := clBlack ;
               FillRect(Rect);
               TextOut(Rect.Left,Rect.Top,column.Field.AsString);
          end;
     end;
end;

procedure TFM_Main.Btn_exitClick(Sender: TObject);
begin
     close;
end;

procedure TFM_Main.DBGrid1CellClick(Column: TColumn);
begin
     if not query1.active then exit;
     //더블클릭했을때 체크박스가 전체 선택인지 해지인지 또는 한줄 선택인지 에따라 chk_color[]의 값을 넣어줌
     begin
          if chk_color[Query1rownum.Asinteger] = 'Y'  then
          begin
               chk_color[Query1rownum.Asinteger] := 'N'  ;
               //chk_all.Checked := false  ;
          end
          else
               chk_color[Query1rownum.Asinteger] := 'Y';
     end;

     Query1.DisableControls;
     Query1.Next;

     if not Query1.Eof then Query1.Prior;

     Query1.EnableControls ;
     cflag := false;
end;

procedure TFM_Main.DBGrid2CellClick(Column: TColumn);
begin
     if not query3.active then
          exit;

     if chk_color_s[Query3rownum.Asinteger] = 'Y'  then
          chk_color_s[Query3rownum.Asinteger] := 'N'
     else
          chk_color_s[Query3rownum.Asinteger] := 'Y';

     Query3.DisableControls;
     Query3.Next;

     if not Query3.Eof then
          Query3.Prior;

     Query3.EnableControls ;
     cflag_s := false;
end;

procedure TFM_Main.ME_findmonChange(Sender: TObject);
begin
     query1.Close;
     total_work.Caption  := '';
     query3.Close;
     total_con.Caption  := '';

     chk_all.Checked := false;
     chk_all_s.Checked := false;

     with query2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select                                                                                    ' );
          SQL.Add('to_char(NEXT_DAY(last_day(to_date('''+ME_findmon.text+''',''YYYYMM'')), 6),''YYYYMMDD'') as friday ' );
          SQL.Add('from dual                                                                                 ' );
          Open;

          GS_Friday := FieldByName('friday').AsString;
          edit1.text := GS_Friday;
     end;
end;

procedure TFM_Main.cbx_pstateChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TFM_Main.cbx_pstate_toChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TFM_Main.cbx_payra_fChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TFM_Main.cbx_payra_tChange(Sender: TObject);
begin
     query1.close;
     total_con.Caption  := '';
     chk_all.Checked := false;
end;

procedure TFM_Main.FormActivate(Sender: TObject);
var
     i : integer;
begin
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Application.ProcessMessages;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then  //fn_YmanagerCheck -> Func.Pas Library에 선언.
     begin
          maintitle.Color := clTeal;
          maintitle.Caption := '근태 미등록/미결재 조회 및 일괄등록/일괄결재 [파견직]';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     cflag               := false;
     cflag_s             := false;
     chk_all.Enabled     := false;
     chk_all_s.Enabled   := false;
     btn_mail.Enabled    := false;
     btn_mail_s.Enabled  := false;
     btn_dutyin.Enabled  := false;
     mail_sub1.Text      := '';
     mail_sub1.Text      := '';
     mail1.Text          := '';
     mail2.Text          := '';
     btn_save.Enabled       := false;
     btn_save1.Enabled       := false;
     btn_sign.Enabled       := false;

     curdate := fn_GetDateTimeStr;

     //현재시간표시
     Lsysdate.caption := copy(curdate,1,4)+'/'+copy(curdate,5,2)+'/'+copy(curdate,7,2);
     Lempno.caption   := pKorname+'('+pEmpno+')';

     //조회월??
     //2012.06.14 kth 전월로 셋팅되고 변경
     ME_findmon.Text :=  formatDateTime('yyyymm',IncMonth(EncodeDate(strtoint(copy(curdate,1,4)),
                                                                     strtoint(copy(curdate,5,2)),
                                                                     strtoint(copy(curdate,7,2))),-1)) ;
     total_work.Caption := '';
     total_con.Caption := '';

     //인사상태 목록 세팅
     query2.close;
     query2.sql.clear;
     query2.sql.add('SELECT rpad(codeno,4,'' '')|| codename "pstate"            ' +
                    '  FROM pyccode                                             ' +
                    ' WHERE codeid = ''I114''                                   ' +
                    '   AND useyn  = ''Y''                                      ' +
                    '   AND codeno < ''80''                                     ' );
     query2.Open;
     query2.first ;

     for i := 0 TO query2.RecordCount -1 do
     begin
          cbx_pstate.Items.Add(query2.FieldByName('pstate').Asstring );
          cbx_pstate_to.Items.Add(query2.FieldByName('pstate').Asstring );
          cbx_pstate1.Items.Add(query2.FieldByName('pstate').Asstring );
          cbx_pstate1_to.Items.Add(query2.FieldByName('pstate').Asstring );
          query2.next ;
     end;

     cbx_pstate.ItemIndex := 0;
     cbx_pstate_to.ItemIndex := query2.RecordCount-1 ;
     cbx_pstate1.ItemIndex := 0;
     cbx_pstate1_to.ItemIndex := query2.RecordCount-1 ;

     //직위셋팅
     query2.close;
     query2.sql.clear;
//     query2.sql.add('SELECT codeno||'' ''|| codename "payra"                    ' +
     query2.sql.add('SELECT rpad(codeno,4,'' '')|| codename "payra"             ' +
                    '  FROM pyccode                                             ' +
                    ' where codeid = ''I113''  AND useyn = ''Y''  AND codeno >= ''11''               ' +
                    ' order by codeno   ' );

     //일반직 관리자여부에 따른 직위조회 구분. Ymanager -> Func Library에 선언.
//     if Ymanager then query2.sql.add(' AND codeno = ''H1''                  ')  //일반직 관리자일 경우.       KHT 주석
//     else             query2.sql.add(' AND codeno >= ''11'' AND codeno <> ''H1'' '); //정규직 관리자일 경우.  KTH 주석
//수정 2008.07.28     else             query2.sql.add(' AND codeno BETWEEN ''11'' AND ''E2'' '); //정규직 관리자일 경우.

     query2.Open;
     query2.first ;

     for i := 0 TO query2.RecordCount -1 do
     begin
          cbx_payra_f.Items.Add(query2.FieldByName('payra').Asstring );
          cbx_payra_t.Items.Add(query2.FieldByName('payra').Asstring );
          cbx_payra1_f.Items.Add(query2.FieldByName('payra').Asstring );
          cbx_payra1_t.Items.Add(query2.FieldByName('payra').Asstring );
          query2.next ;
     end;

     cbx_payra_f.ItemIndex := 0;
     cbx_payra_t.ItemIndex := query2.RecordCount-1 ;

     cbx_payra1_f.ItemIndex := 0;
     cbx_payra1_t.ItemIndex := query2.RecordCount-1 ;

     //  근태코드 셋팅
     query2.close;
     query2.sql.clear;
     query2.sql.add('SELECT dukind||'' ''|| duname "dutycode" ' +
                    '  FROM pkcducod ORDER BY dukind          ' );
     query2.Open;
     query2.first ;

     FOR i := 0 TO query2.RecordCount -1 DO
     begin
          cbx_dutycode.Items.Add(query2.FieldByName('dutycode').Asstring );
          query2.next ;
     end;

     cbx_dutycode.ItemIndex := 0;

     //2014.03.17.hjku..담당자연락처 추가   개발중
     with query2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD('SELECT TRANSLATE(OFFITEL,''0123456789''||OFFITEL,''0123456789'')  OFFITEL ');
          SQL.ADD('  FROM PIMPMAS                                                            ');
          SQL.ADD(' WHERE EMPNO = '''+Pempno+'''                                             ');
          //SQL.ADD('   and OFFITEL is not null                                                ');
          Open;

          ed_OFFITEL.Text := FieldByName('OFFITEL').AsString;
     end;

     C_Gubun.ItemIndex := 1;

     {
     //2015.10.20 eyha 정규직과 파견직 동시에 작업가능하도록 처리 홍원영M 요청
     with query2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD('SELECT Nvl(VALUE1,''ZZZZ'') VALUE1, ');
          SQL.ADD('       Nvl(VALUE2,''ZZZZ'') VALUE2, ');
          SQL.ADD('       Nvl(VALUE3,''ZZZZ'') VALUE3, ');
          SQL.ADD('       Nvl(VALUE4,''ZZZZ'') VALUE4, ');
          SQL.ADD('       Nvl(VALUE5,''ZZZZ'') VALUE5  ');
          SQL.ADD('  FROM PKCVARI                      ');
          SQL.ADD(' WHERE gubun = ''PY''               ');
          Open;

          if (Pempno = FieldByName('VALUE1').AsString) OR
             (Pempno = FieldByName('VALUE2').AsString) OR
             (Pempno = FieldByName('VALUE3').AsString) OR
             (Pempno = FieldByName('VALUE4').AsString) OR
             (Pempno = FieldByName('VALUE5').AsString) then
          begin
            C_Gubun.Enabled   := True;

            C_Gubun.ItemIndex := 0;

            C_GubunChange(nil);

            maintitle.Color   := clPurple;
            maintitle.Caption := '근태 미등록/미결재 조회 및 일괄등록/일괄결재 [정규직/파견직]';
          end else begin
            YmanagerYN := Ymanager;

            if YmanagerYN  then
               C_Gubun.ItemIndex := 1
             else
               C_Gubun.ItemIndex := 0;

            C_Gubun.Enabled   := False;
          end;
     end;
     }

     ME_findmonChange(self);
end;

procedure TFM_Main.cbx_pstate1Change(Sender: TObject);
begin
     query3.close;
     total_con.Caption  := '';
     chk_all_s.Checked := false;
end;


procedure TFM_Main.cbx_pstate1_toChange(Sender: TObject);
begin
     query3.close;
     total_con.Caption  := '';
     chk_all_s.Checked := false;
end;


procedure TFM_Main.cbx_payra1_fChange(Sender: TObject);
begin
     query3.close;
     total_con.Caption  := '';
     chk_all_s.Checked := false;
end;


procedure TFM_Main.cbx_payra1_tChange(Sender: TObject);
begin
     query3.close;
     total_con.Caption  := '';
     chk_all_s.Checked := false;
end;


procedure TFM_Main.btn_saveClick(Sender: TObject);
var
     i :integer;
     temp : String ;
begin
     if not query1.active then
          exit;

     if savedialog1.Execute then
     begin
         with TStringList.Create do
         try
              Add(pchar('사번,성명,인사상태,입사일,직위') );

              query1.First;

              while not query1.Eof do
              begin
                  Add(Format('%s,%s,%s,%s,%s',
                            [
                            query1.Fields[1].AsString,
                            query1.Fields[2].AsString,
                            query1.Fields[3].AsString,
                            query1.Fields[4].AsString,
                            query1.Fields[5].AsString
                            ]));
                  query1.next;
              end;
              SaveToFile(SaveDialog1.FileName);
              total_work.Caption  :='조회된 근태 미등록 사원이 파일로 저장되었습니다. ';
         finally
              Free;
         end; // end of try
     end;
end;

procedure TFM_Main.btn_save1Click(Sender: TObject);
begin
     if not query3.active then
          exit;
     if savedialog1.Execute then
     begin
         with TStringList.Create do
         try
             Add(pchar('사번,성명,인사상태,사원직위,결재자사번,결재자성명') );
             query3.First;

             while not query3.Eof do
             begin
                 Add(Format('%s,%s,%s,%s,%s,%s',
                   [
                   query3.Fields[1].AsString,
                   query3.Fields[2].AsString,
                   query3.Fields[3].AsString,
                   query3.Fields[8].AsString,
                   query3.Fields[4].AsString,
                   query3.Fields[5].AsString

                   ]))    ;
                 query3.next;
             end;
             SaveToFile(SaveDialog1.FileName);
             total_con.Caption  :='조회된 근태 미결재 사원이 파일로 저장되었습니다. ';
         finally
             Free;
         end; // end of try
     end;
end;

procedure TFM_Main.btn_dutyinClick(Sender: TObject);       //근태등록   PARKSH 20021202
var
     i ,j ,chk_cnt : integer;
begin
   SetCalender;                            // 달력생성

   // 사원선택 체크
   chk_cnt := 0;
   for i := 1 to query1.RecordCount do
   begin
       if chk_color[i] ='Y' then
           chk_cnt := chk_cnt +1;
   end;

   if chk_cnt <= 0 then
   begin
       total_work.Caption := '먼저 근태를 등록할 사원을 선택하세요!';
       exit;
   end;

   If IDCANCEL = Application.MessageBox('신규자료를 등록하시겠습니까?',
                                       '작업안내', mb_OKCancel) then exit;
   Query1.First ;

   for i := 1 to query1.RecordCount do
   begin
        //2017.11.22 jissi  달력생성 위치 이동으로 개인별 달력 초기화
        SetCalender;                            // 달력생성
        if chk_color[i] ='Y'  then
        begin
            try
                Query4.Close;
                Query4.SQL.Clear;
                Query4.SQL.ADD('SELECT COUNT(*) CNT FROM PKHDUTY                              ');
                Query4.SQL.Add(' WHERE EMPNO = '''+ Query1.FieldByName('empno').AsString +''' ');
                Query4.SQL.ADD('   AND DUYYMM = '''+ ME_findmon.Text +'''                     ');
                Query4.Open;
                Query4.first;
                if  Query4.FieldByName('CNT').Asinteger > 0 then
                begin
                     MessageBox(handle,pchar('사번 '+Query1.FieldByName('empno').AsString+' '+Query1.FieldByName('korname').AsString+'님의 ' +
                                        ME_findmon.Text + '월 근태가 존재합니다. 다시 조회하신후 등록하시기 바랍니다. 오류...'),'등록오류',MB_ICONWARNING);
                     exit;
                end;

                //2017.11.22 jissi 기준년월 당월입사자 입사일이전 일자 근태 불입 처리 기능 추가
                Query4.Close;
                Query4.SQL.Clear;
                Query4.SQL.ADD('SELECT EMPDATE  FROM PIMPMAS                                  ');
                Query4.SQL.Add(' WHERE EMPNO = '''+ Query1.FieldByName('empno').AsString +''' ');
                Query4.Open;

                if  copy(Query4.FieldByName('EMPDATE').AsString,1,6) = ME_findmon.Text then
                begin
                     for j := 1 to 31 do
                     begin
                          if j < strtoint(copy(Query4.FieldByName('EMPDATE').AsString,7,2)) then
                          begin
                               if D[j] = '00' then
                               begin
                                    D[j] := '97';
                                    P[j] := '97';
                               end;
                          end;
                     end;
                end;
                ///////////////////////////////////////////////////////////////////////////////

                //insert
                Query4.Close;
                Query4.SQL.Clear;
                Query4.SQL.ADD(' INSERT INTO PKHDUTY                                         ');
                Query4.SQL.ADD('       (DUYYMM, EMPNO, KORNAME, ORGNUM, DEPTCODE,            ');
                Query4.SQL.ADD('        DD1,DD2,DD3,DD4,DD5,DD6,DD7,DD8,DD9,DD10,            ');
                Query4.SQL.ADD('        DD11,DD12,DD13,DD14,DD15,DD16,DD17,DD18,DD19,DD20,   ');
                Query4.SQL.ADD('        DD21,DD22,DD23,DD24,DD25,DD26,DD27,DD28,DD29,DD30,   ');
                Query4.SQL.ADD('        DD31, WORKTYPE, WRITETIME, WRITEMAN)                 ');  //2015.08.20 eyha 근무시간설정을 09:00로 디폴트 처리요청
                Query4.SQL.ADD(' VALUES ( '''+ME_findmon.Text+''',                           ');
                Query4.SQL.Add('          '''+Query1.FieldByName('empno').AsString+''',      ');
                Query4.SQL.ADD('          '''+Query1.FieldByName('korname').AsString+''',    ');
                Query4.SQL.Add('          '''+Query1.FieldByName('orgnum').AsString+''',     ');
                Query4.SQL.Add('          '''+Query1.FieldByName('deptcode').AsString+''',   ');

                //직위가 실장, 팀장, 담당일 경우 둘째,네째 토요일을 정상근무로    전산처리요청 02/12/12
                //그 외의 사원은 첫째주 토요일은 정상근무, 아닐경우 근태코드로
                //==> 주 5일 근무제에 따른 토요휴일로 인하여 모든 토요일은 휴일로 Setting 되도록 수정.   2004.08.  dsa2000 ...
                if (Query1.FieldByName('payra').AsString='실장') or
                   (Query1.FieldByName('payra').AsString='팀장') or
                   (Query1.FieldByName('payra').AsString='담당') then
                begin
                     Query4.SQL.ADD(''''+P[1]+''',  '''+P[2]+''',  '''+P[3]+''',  '''+P[4]+''',  '''+P[5]+''',');
                     Query4.SQL.ADD(''''+P[6]+''',  '''+P[7]+''',  '''+P[8]+''',  '''+P[9]+''',  '''+P[10]+''',');
                     Query4.SQL.ADD(''''+P[11]+''', '''+P[12]+''', '''+P[13]+''', '''+P[14]+''', '''+P[15]+''',');
                     Query4.SQL.ADD(''''+P[16]+''', '''+P[17]+''', '''+P[18]+''', '''+P[19]+''', '''+P[20]+''',');
                     Query4.SQL.ADD(''''+P[21]+''', '''+P[22]+''', '''+P[23]+''', '''+P[24]+''', '''+P[25]+''',');
                     Query4.SQL.ADD(''''+P[26]+''', '''+P[27]+''', '''+P[28]+''', '''+P[29]+''', '''+P[30]+''',');
                     Query4.SQL.ADD(''''+P[31]+''',');
                end
                else
                begin
                     Query4.SQL.ADD(''''+D[1]+''',  '''+D[2]+''',  '''+D[3]+''',  '''+D[4]+''',  '''+D[5]+''',');
                     Query4.SQL.ADD(''''+D[6]+''',  '''+D[7]+''',  '''+D[8]+''',  '''+D[9]+''',  '''+D[10]+''',');
                     Query4.SQL.ADD(''''+D[11]+''', '''+D[12]+''', '''+D[13]+''', '''+D[14]+''', '''+D[15]+''',');
                     Query4.SQL.ADD(''''+D[16]+''', '''+D[17]+''', '''+D[18]+''', '''+D[19]+''', '''+D[20]+''',');
                     Query4.SQL.ADD(''''+D[21]+''', '''+D[22]+''', '''+D[23]+''', '''+D[24]+''', '''+D[25]+''',');
                     Query4.SQL.ADD(''''+D[26]+''', '''+D[27]+''', '''+D[28]+''', '''+D[29]+''', '''+D[30]+''',');
                     Query4.SQL.ADD(''''+D[31]+''',');
                end  ;

                Query4.SQL.ADD('''A'','''+curdate+''','''+pEmpno+''' ) ');    //2015.08.20 eyha 근무시간설정을 09:00로 디폴트 처리요청

                Query4.ExecSQL;
            except
                MessageBox(handle,'저장 실패하였습니다...','오류',MB_ICONERROR);
                exit;
            end; //try
        end;
        Query1.next;

    end; //end of for }

    //재조회
    btn_find_aClick(Sender);
    total_work.Caption := '근태 등록이 성공적으로 완료되었습니다'   ;
end;

procedure TFM_Main.btn_signClick(Sender: TObject);
var
    i ,chk_cnt_s : integer;
begin
// 사원선택 체크
   chk_cnt_s := 0;
   for i := 1 to query3.RecordCount do
   begin
       if chk_color_s[i] ='Y' then
           chk_cnt_s := chk_cnt_s +1;
   end;

   if chk_cnt_s <= 0 then
   begin
       total_con.Caption := '먼저 근태를 결재할 사원을 선택하세요!';
       exit;
   end;

   If IDCANCEL = Application.MessageBox('결재를 하시겠습니까?',
                                       '작업안내', mb_OKCancel) then exit;
   Query3.First ;
   for i := 1 to query3.RecordCount do
    begin
        if chk_color_s[i] ='Y'  then
        begin
            try
                Query4.Close;
                Query4.SQL.Clear;
                Query4.SQL.ADD('SELECT COUNT(*) CNT  FROM PKHDUTY                              ');
                Query4.SQL.Add(' WHERE EMPNO = '''+ Query3.FieldByName('empno').AsString +'''  ');
                Query4.SQL.ADD('   AND DUYYMM = '''+ ME_findmon.Text +'''                      ');
                Query4.SQL.ADD('   AND CONYN = ''Y''                                           ');
                Query4.Open;
                Query4.first;
                If  Query4.FieldByName('CNT').Asinteger > 0 then
                begin
                   MessageBox(handle,pchar('사번 '+Query3.FieldByName('empno').AsString+' '+Query3.FieldByName('kornapme').AsString+'님의 ' +
                                      ME_findmon.Text + '월 근태는 이미 결재되어있습니다. 다시 조회하신후 결재하시기 바랍니다. 오류...'),'등록오류',MB_ICONWARNING);
                   exit;
                end;


                //update
                Query4.Close;
                Query4.SQL.Clear;
                Query4.SQL.ADD(' UPDATE PKHDUTY                                               ');
                //Query4.SQL.ADD('    SET WRITETIME = '''+curdate+''',                          ');
                //Query4.SQL.Add('        WRITEMAN = '''+pEmpno+''',                            ');
                Query4.SQL.ADD('   SET  CONYN = ''Y'',                                        ');
                Query4.SQL.Add('        CONTIME = '''+curdate+''',                            ');
                Query4.SQL.Add('        CONMAN = '''+pEmpno+'''                               ');
                Query4.SQL.ADD('  WHERE DUYYMM = '''+ME_findmon.Text+'''                      ');
                Query4.SQL.ADD('    AND EMPNO = '''+Query3.FieldByName('empno').AsString+'''  ');
                Query4.ExecSQL;

            except
                MessageBox(handle,'저장 실패하였습니다...','오류',MB_ICONERROR);
                exit;
            end; //try
        end;
        Query3.next;

    end; //end of for }

    //재조회
   btn_find_sClick(Sender);
   total_con.Caption := '근태 결재가 성공적으로 완료되었습니다.' ;
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with Query2 do
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
            ExecSql;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;
end;

procedure TFM_Main.DBGrid1TitleClick(Column: TColumn);
begin
// 정렬
end;

procedure TFM_Main.rb_mail1Click(Sender: TObject);
begin
     SetMessages(1);
end;

procedure TFM_Main.rb_sms1Click(Sender: TObject);
begin
     SetMessages(1);
end;

procedure TFM_Main.rb_mail2Click(Sender: TObject);
begin
     SetMessages(2);
end;

procedure TFM_Main.rb_sms2Click(Sender: TObject);
begin

     //MessageDlg('사번'+Sender.ClassName+'의 SMS 전송이 실패 하였습니다...',mtError, [mbOk], 0);

     //(Sender as TDBGrid).Canvas do
     SetMessages(2);
end;

procedure TFM_Main.SetMessages(flag:integer);
begin

     if(flag=1) then
     begin
         if(rb_mail1.Checked) then
         begin
             mail_sub1.Text  := '[필독]' +copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미등록 알림.';
             mail1.Lines.Text:='안녕하십니까? HR팀입니다.' + #13#10+
                               '현재 본인의 ' + copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2) + '월 근태가 미등록인 상태입니다.' + #13#10+
                               '즉시, 근태등록 화면에서 본인의 근무지 확인 및 근태를 등록하여 주시기 바랍니다.' + #13#10+
                               '근태가 등록/결재되지 않으면 익월 급여지급시 식대교통비 산정에 불이익이 있을 수 있습니다.' + #13#10+  #13#10+
                               '감사합니다' + #13#10;
         end
         //2014.04.01.hjku 문자 수정.. 홍원영M 요청...
         else if(rb_sms1.Checked) then
         begin
             mail_sub1.Text  := copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미등록 알림.';
             mail1.Lines.Text:=copy(me_findmon.Text,1,4)+'년 '+copy(me_findmon.Text,5,2) + '월 근태등록이 '+copy(GS_Friday,5,2)+'/'+copy(GS_Friday,7,2)+'(금) 종료됩니다.' + #13#10+
                               '원활한 근태 마감을 위해 등록 및 결재 바랍니다.'   + #13#10+
                               '등록 및 결재가 어려우신 경우 연락 부탁 드립니다.' ;
         end;
     end
     else
     begin
         if(rb_mail2.Checked) then
         begin
             mail_sub2.text := '[필독] ' +copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미결재 알림';
             Mail2.Lines.Text:='안녕하십니까 HR팀입니다.'                                                          +#13#10+
                               '팀원들의 '+ copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2) + '월 근태가 미결재 상태입니다.' +#13#10+
                               '즉시, 근태등록 화면에서 해당 팀원들의 근태를 결재하여 주시기 바랍니다.              '+#13#10+
                               '근태가 결재되지 않으면 익월 급여지급시 식대교통비 산정에 불이익이 있을 수 있습니다.' +#13#10+
                               '결재권자인 팀장 본인의 근태는 본인이 결재하셔야 하며,'                               +#13#10+
                               '당월에 휴가/출장/교육 등의 특이 근태가 있는 직원의 근태결재는 해당내역에 이상여부를' +#13#10+
                               '다시 한번 확인하여주시기 바랍니다.  감사합니다.';
         end
         else if(rb_sms2.Checked) then
         begin
             mail_sub2.text := copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2)+ '월 근태 미결재 알림';
             Mail2.Lines.Text:='안녕하십니까 HR팀입니다.'                                                          +#13#10+
                               '팀원들의 '+ copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,2) + '월 근태가 미결재 상태입니다.' +#13#10+
                               '즉시, 근태등록 화면에서 해당 팀원들의 근태를 결재하여 주시기 바랍니다.              '+#13#10+
                               '근태가 결재되지 않으면 익월 급여지급시 식대교통비 산정에 불이익이 있을 수 있습니다.' +#13#10+
                               '결재권자인 팀장 본인의 근태는 본인이 결재하셔야 하며,'                               +#13#10+
                               '당월에 휴가/출장/교육 등의 특이 근태가 있는 직원의 근태결재는 해당내역에 이상여부를' +#13#10+
                               '다시 한번 확인하여주시기 바랍니다.  감사합니다.';
         end;
     end;
end;

//2014.03.17.hjku 문자전송 추가
Function TFM_Main.Send_Sms(HandTel, SendTel, SmsSubject, SmsBody : String) : Boolean;
begin
  with Query2 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('call HPER.SENDSMS (                           ');
       SQL.Add('        '''+ HandTel    +''',                 ');  //문자수신번호
       SQL.Add('        '''+ SendTel    +''',                 ');  //문자발신번호
       SQL.Add('        '''+ SmsBody    +''',                 ');  //문자내용
       SQL.Add('        '''+ SmsSubject +'''                  ');  //문자제목
       SQL.Add('                         )                    ');  

       try
            ExecSql;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

//2014.03.17.hjku 문자전송 추가
Function TFM_Main.SendeMessages(Rcvemp,Pemplist,rcvtel:string) : Boolean;
begin
    result := false;
    if(rb_mail2.Checked) then
    begin
        //////////////////////////////////////////////////////////////////////////////
        //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
        SendProgID  := 'PKY1030A';
        SendEmpno   := Pempno;
        RcveEmpno   := rcvemp; //'Z113';
        MailSubject := mail_sub2.Text;
        MailBody    := mail2.Text + Pemplist;
        ReceiveYN   := 'N';
        //if ChkReceive.Checked then ReceiveYN := 'Y';

        if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
             total_con.Caption := '결재자 사번 : '+ RcveEmpno + '에게 메일이 성공적으로 발송되었습니다.'
        else
        begin
             total_con.Caption := '실패 결재자 사번 : '+ RcveEmpno;
             MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
             exit;
        end;
        //////////////////////////////////////////////////////////////////////////////
    end
    else if(rb_sms2.Checked) then
    begin
        //////////////////////////////////////////////////////////////////////////////
        HandTel    := rcvtel;
        SendTel    := ed_OFFITEL.Text;
        SmsSubject := mail_sub2.Text;
        //2014.04.25.hjku. SMS 전송시 미결재 명단은 제외... 홍원영M 요청
        //SmsBody    := mail2.Text + Pemplist;
        SmsBody    := mail2.Text;
        RcveEmpno  := rcvemp;

        if not Send_Sms(HandTel, SendTel, SmsSubject,SmsBody) then
        begin
             MessageDlg('사번'+RcveEmpno+'의 SMS 전송이 실패 하였습니다...',mtError, [mbOk], 0);
             exit;
        end;
        //////////////////////////////////////////////////////////////////////////////
    end;
    result := true;
end;

procedure TFM_Main.C_GubunChange(Sender: TObject);
begin
  if C_Gubun.ItemIndex = 0 then
    YmanagerYN := False
  else
    YmanagerYN := True;
end;

end.
