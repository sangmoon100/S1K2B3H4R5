{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG4010G(초과근무 결제 메일 발송 프로그램)
 SYSTEM-NAME    : 급여/근태
 SUBSYSTEM-NAME :
 Programmer     : 김태호
 Version        : 10.01
 Date           : 2009.06

Update Contents
   Version    date(yy.mm.dd)     programmer      description
    1.1       2009.06.16        김태호          메일전송자 : 최슬기 OR 이승철
============================================================================= *}
unit PKG40101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, pedbgrid, Buttons, Db, DBTables, pass, Mask,
  DBClient, ExtCtrls,FormMon1, Kylib1, Func, Ora, MemDS, DBAccess;

type
  TfpkG4010 = class(TForm)
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Panel1: TPanel;
    maintitle: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ME_findmon: TMaskEdit;
    Lsysdate: TLabel;
    Lempno: TLabel;
    Panel16: TPanel;
    total_work: TLabel;
    Panel19: TPanel;
    mail_sub1: TEdit;
    Mail1: TMemo;
    Panel22: TPanel;
    Chk_all: TCheckBox;
    total_con: TLabel;
    SBfr: TSpeedButton;
    Btn_exit: TBitBtn;
    btn_save: TBitBtn;
    SaveDialog1: TSaveDialog;
    Query1: TOraQuery;
    Query3: TOraQuery;
    Query2: TOraQuery;
    Panel18: TPanel;
    Panel11: TPanel;
    btn_mail: TBitBtn;
    btn_find_a: TBitBtn;
    Query1ROWNUM: TFloatField;
    Query1EMPNO: TStringField;
    Query1KORNAME: TStringField;
    Query1CONEMPNO: TStringField;
    Query1CONKORNAME: TStringField;
    Query1DEPTCODE: TStringField;
    Query1DEPTNAME: TStringField;

    procedure btn_find_aClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Chk_allClick(Sender: TObject);
    procedure btn_mailClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Btn_exitClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ME_findmonChange(Sender: TObject);
    procedure cbx_pstateChange(Sender: TObject);
    procedure cbx_pstate_toChange(Sender: TObject);
    procedure cbx_payra_fChange(Sender: TObject);
    procedure cbx_payra_tChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_save1Click(Sender: TObject);
    procedure btn_signClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);


private
    { Private declarations }
    chk_temp : string;
    Curdate  : String;

    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
public
    { Public declarations }
     chk_color   : array[1..5000] of char; //근태미등록선택
     chk_color_s : array[1..5000] of char; //근태미결재선택
  end;

var
    fpkG4010: TfpkG4010;

implementation

uses ComObj;
{$R *.DFM}


//-------------------------------main--------------------
procedure TfpkG4010.btn_find_aClick(Sender: TObject);
var
     i,j     : integer;
     Field   : TField;
     t_paste,t_paste_to,t_payra_f,t_payra_t : string;
begin
     chk_all.Enabled    := true;
     btn_mail.Enabled   := true;
     btn_save.enabled   := true;

     for j := 1 to 5000 do
         chk_color[j] := 'N' ;  //미등록선택 초기화

     //초과근무 미등록 Select
     with Query1 do
     begin
          Close ;
          Sql.Clear ;
          Sql.Add('SELECT rownum,t.*                                                                                                      ' +
                 '   FROM                                                                                                                 ' +
                 '     ( SELECT DISTINCT H.EMPNO ,H.KORNAME ,M.CONEMPNO ,M.CONKORNAME ,                       ' +
                 '                      H.DEPTCODE ,(SELECT DEPTNAME FROM PYCDEPT D WHERE D.ORGNUM =                              ' +
                 ' 	                                              (SELECT value1 from pimvari where gubun=''00'' and sgubun=''0001'') ' +
                 ' 	                                                  AND D.DEPTCODE = H.DEPTCODE) DEPTNAME                             ' +
                 '         FROM PKHYMAS M,PKHOTHIS H                                                                                      ' +
                 '        WHERE M.YEMPNO = H.EMPNO                                                                                        ' +
                 '  AND OVTMDATE LIKE '''+ me_findmon.Text +'%''                                                                          ' +
                 '  AND H.CONYN =''N''                                                                                                    ' +
                 '     ) t                                                                                                                ' );

          Open;

          total_work.Caption := '총 ' + inttostr(query1.recordcount)+'건이 조회되었습니다' ;
          if query1.RecordCount <= 0 then
          begin
              chk_all.Enabled  := false;
              btn_mail.Enabled := false;
              close;
              exit;
          end;
     end;  // End of(with Query1 do)

     total_work.Caption := '총 ' + inttostr(query1.recordcount)+'건이 조회되었습니다' ;

      //메일제목
     mail_sub1.Text  := '[필독] ' +copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,6)+ '월 운전직 초과근무 미등록 알림.';
     mail1.Lines.Text:='안녕하십니까 HR팀입니다.' + #13#10+
                       '현재 ' + copy(me_findmon.Text,1,4)+'-'+copy(me_findmon.Text,5,6) + '월 운전직 초과근무 결제가 미등록인 상태입니다.' + #13#10+
                       '운전직 초과근무 등록/조회 화면에서 결제 처리하여 주시기 바랍니다.' + #13#10+
                       '감사합니다' + #13#10;
end;

procedure TfpkG4010.DBGrid1DblClick(Sender: TObject);
var
     i: integer;
begin
     if not query1.active then exit;

     for i := 1 TO Query1.RecordCount do
     begin
          if      chk_all.Checked       then chk_color[i] := 'Y';
     end;

     Query1.DisableControls;
     Query1.Next;
     if not Query1.Eof then Query1.Prior;
     Query1.EnableControls ;
end;

procedure TfpkG4010.Chk_allClick(Sender: TObject);
var
     i : integer;
begin
     //전체선택 또는 해제에 따라 그리드 더블클릭 call
     if chk_all.Checked then
     begin
          DBGrid1DblClick(sender);//DBGrid1CellClick(sender);
     end
     else if not chk_all.Checked then
     begin
          DBGrid1DblClick(sender);//DBGrid1CellClick;
     end;
     chk_temp :='N';
end;

procedure TfpkG4010.btn_mailClick(Sender: TObject);
var
     i ,chk_cnt : integer;
     Selemp  : TStringList;
     TmpTitle,TmpBody, sTemp : string;
begin
     total_work.Caption  := '';

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
               SendProgID  := 'PKG4010G';
               SendEmpno   := Pempno;
               RcveEmpno   := Query1.FieldByName('CONEMPNO').AsString;
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
          end;
          query1.next;
     end; //end of for
     total_work.Caption := '메일이 성공적으로 발송되었습니다';
end;

procedure TfpkG4010.SBfrClick(Sender: TObject);
var
     MonthForm : TMonthForm;
begin

    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
        ME_findmon.Text := Copy(MonthForm.DayCaption,1,4)+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
end;

procedure TfpkG4010.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfpkG4010.Btn_exitClick(Sender: TObject);
begin
     close;
end;

procedure TfpkG4010.DBGrid1CellClick(Column: TColumn);
begin
     if not query1.active then exit;
     //더블클릭했을때 체크박스가 전체 선택인지 해지인지 또는 한줄 선택인지 에따라 chk_color[]의 값을 넣어줌
     begin
          if chk_color[Query1rownum.Asinteger] = 'Y'  then
          begin
               chk_color[Query1rownum.Asinteger] := 'N'  ;
               chk_all.Checked := false  ;
          end
          else
               chk_color[Query1rownum.Asinteger] := 'Y';
     end;

     Query1.DisableControls;
     Query1.Next;

     if not Query1.Eof then Query1.Prior;

     Query1.EnableControls ;
end;

procedure TfpkG4010.ME_findmonChange(Sender: TObject);
begin
     query1.Close;
     total_work.Caption  := '';
     total_con.Caption  := '';

     chk_all.Checked := false;
end;

procedure TfpkG4010.cbx_pstateChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TfpkG4010.cbx_pstate_toChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TfpkG4010.cbx_payra_fChange(Sender: TObject);
begin
     query1.close;
     total_work.Caption  := '';
     chk_all.Checked := false;
end;

procedure TfpkG4010.cbx_payra_tChange(Sender: TObject);
begin
     query1.close;
     total_con.Caption  := '';
     chk_all.Checked := false;
end;

procedure TfpkG4010.FormActivate(Sender: TObject);
var
     i : integer;
begin
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Application.ProcessMessages;

     if (Copy(Pgrade,3,1) > 'C') then
     begin
          MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;


     chk_all.Enabled     := false;
     btn_mail.Enabled    := false;
     mail_sub1.Text      := '';
     mail_sub1.Text      := '';
     mail1.Text          := '';
     btn_save.Enabled       := false;

     curdate := fn_GetDateTimeStr;

     //현재시간표시
     Lsysdate.caption := copy(curdate,1,4)+'/'+copy(curdate,5,2)+'/'+copy(curdate,7,2);
     Lempno.caption := pEmpno+' '+ pKorname ;


     with Query2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT TO_CHAR(ADD_MONTHS(TO_DATE(CALCMON, ''YYYYMM''),1), ''YYYYMM'') CALCMON FROM PKCOTBAS ');
          Open;
     end;


     //조회월??
     ME_findmon.Text := copy(Query2.fieldByName('CALCMON').AsString,1,6) ;
//K     ME_findmon.Text := copy(curdate,1,6) ;
     total_work.Caption := '';
     total_con.Caption := '';

end;

procedure TfpkG4010.btn_save1Click(Sender: TObject);
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

procedure TfpkG4010.btn_signClick(Sender: TObject);
begin
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TfpkG4010.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
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

procedure TfpkG4010.FormCreate(Sender: TObject);
begin
     OraConnect;
end;

procedure TfpkG4010.btn_saveClick(Sender: TObject);
begin
     if not query1.active then
          exit;

     if savedialog1.Execute then
     begin
         with TStringList.Create do
         try
              Add(pchar('사번,성명,결제자사번,결제자명,부서코드,부서명') );

              query1.First;

              while not query1.Eof do
              begin
                  Add(Format('%s,%s,%s,%s,%s',
                            [
                            query1.Fields[1].AsString,
                            query1.Fields[2].AsString,
                            query1.Fields[3].AsString,
                            query1.Fields[4].AsString,
                            query1.Fields[5].AsString,
                            query1.Fields[6].AsString
                            ]));
                  query1.next;
              end;
              SaveToFile(SaveDialog1.FileName);
              total_work.Caption  :='조회된 초과 근무 미등록 사원이 파일로 저장되었습니다. ';
         finally
              Free;
         end; // end of try
     end;
end;

end.
