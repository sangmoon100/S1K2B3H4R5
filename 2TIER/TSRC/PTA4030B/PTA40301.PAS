unit PTA40301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGridEh,  OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl,  OnScheme, OnEditCombo, OnFocusButton,
  ExtCtrls,  OnInsaCommon, Db,  OnPopupEdit,  //Comobj, ComCtrls, ExtCtrls, Datelib,
  Mask, func, pebtnedit, peNumedit, MemDS, DBAccess, Ora;

type
  TfrmMain = class(TForm)
    SF_Sub: TOnSchemeForm;
    DBGridEh1: TDBGridEh;
    ED_Gubun: TOnComboEdit;
    BBSearch: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton4: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    DS_Grid1: TDataSource;
    SaveDialog1: TSaveDialog;
    Ed_Empno: TOnComboEdit;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    ED_Korname: TOnEdit;
    ED_Juminid: TOnEdit;
    ED_Curaddr: TOnEdit;
    ED_Retcont: TOnEdit;
    ED_Telno: TOnEdit;
    ED_Email: TOnEdit;
    ED_paycl: TOnEdit;
    ED_Lschgr: TOnEdit;
    ED_Lmajor: TOnEdit;
    ED_Pstate: TOnEdit;
    OnEdit10: TOnEdit;
    OnEdit13: TOnEdit;
    DS_Grid2: TDataSource;
    Ora_Session: TOraSession;
    Q_Grid1: TOraQuery;
    Q_Grid2: TOraQuery;
    Q_Com: TOraQuery;
    Q_Grid1RABASDATE: TStringField;
    Q_Grid1LECTIME: TStringField;
    Q_Grid1EDUNAME: TStringField;
    Q_Grid1EDUCOMENT: TStringField;
    Q_Grid2EDU_DATE: TStringField;
    Q_Grid2EDU_TITLE: TStringField;
    Q_Text: TOraQuery;
    OnFocusButton1: TOnFocusButton;
    Q_Grid1EMPNO: TStringField;
    Q_Grid2EMPNO: TStringField;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure BBSearchClick(Sender: TObject);
    procedure OnFocusButton4Click(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure EditTextClear;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure ED_GubunChange(Sender: TObject);
    procedure Ed_EmpnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
        FG_empno   : string;
        FG_korname : string;
        FG_pass    : string;
        FG_grade   : string;
        FG_sysdate : string;

  end;

var
  frmMain: TfrmMain;

implementation

uses PTA40302;
{$R *.DFM}

procedure TfrmMain.EditTextClear;
begin
     ED_Korname.Text  := '';
     ED_Juminid.Text  := '';
     ED_Curaddr.Text  := '';
     ED_Retcont.Text  := '';
     ED_Telno.Text    := '';
     ED_Email.Text    := '';
     ED_paycl.Text    := '';
     ED_Lschgr.Text   := '';
     ED_Lmajor.Text   := '';
     ED_Pstate.Text   := '';

     Q_Grid1.Close;
     Q_Grid2.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
     Application.ProcessMessages;

     Ora_Session.Connected     := False;
     Ora_Session.ConnectPrompt := False;
     Ora_Session.Options.Net   := True;

     Ora_Session.Username      := HInsa_param(cmdline,5);
     Ora_Session.Password      := HInsa_param(cmdline,6);
     Ora_Session.Server        := HInsa_param(cmdline,7) + ':' + HInsa_param(cmdline,9) + ':'+HInsa_param(cmdline,8);

     try
       Ora_Session.Connected := True;
     except on E : Exception do
       Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
     end;

     FG_empno   := HInsa_param(cmdline,1);
     FG_korname := HInsa_param(cmdline,2);
     FG_pass    := HInsa_param(cmdline,3);
     FG_grade   := HInsa_param(cmdline,4);

     if Copy(FG_grade,5,1) <= 'C' then
     begin
          frmMain.Refresh ;
     end else
     begin
          MessageBox(handle,'권한이 없습니다.','에러',mb_ok);
          frmMain.close;
          exit;
     end;

     try
       Ora_Session.Connected  := True;
     except on E : Exception do
       Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+
                                    E.Message),'알 림',MB_OK);
     end;

     //////////////////////////////////////////////////////////////////////////////

     with Q_Com do
     begin
          Close;
          Sql.Clear;
          //현재날짜
          Sql.Add('select To_Char(sysdate,''YYYYMMDD'') FGSYSDATE         ');
          Sql.Add('  from dual                                            ');

          Open;

          if not Q_Com.eof then
          begin
             FG_sysdate   := FieldbyName('FGSYSDATE').AsString;
          end;
     end;
     with Q_Text do
     begin
          Close;
          Sql.Clear;
          //현재날짜
          Sql.Add('select corpname corpname from pkcpbas         ');
          Open;

          if not Q_Text.eof then
          begin
             OnEdit13.Text   := FieldbyName('corpname').AsString;
          end;
     end;

     ED_GubunChange(Self);
end;

procedure TfrmMain.OnFocusButton2Click(Sender: TObject);
begin
     if Q_Text.RecordCount <= 0 then
     begin
        MessageBox(handle,'먼저 화면출력할 사원을 정확히 입력한 후 조회버튼을 누르십시오.','확인',MB_OK);
        exit;
     end;
     QuickReport1.Preview;
     Q_Grid1.First;
     Q_Grid2.First;
end;

procedure TfrmMain.BBSearchClick(Sender: TObject);
begin
     if (Ed_empno.Text = '') or (Ed_empno.Text = ' - ') then
     begin
          MessageBox(handle,'조회할 사원을 정확히 입력십시오.','확인',MB_OK);
          exit;
     end;

     with Q_Text do
     begin
          Close;
          SQL.Clear;
          Sql.Add('select distinct a.empno, b.Korname, b.juminid, b.curaddr, b.RETCONT, b.TELNO, b.E_mail,                               ');
          Sql.Add(' (select codename from pyccode where codeid =''I113'' and b.payra  = codeno) Payraname,                               ');
          Sql.Add(' (select codename from pyccode where codeid =''I221'' and b.lschgr = codeno) lschgrname,                              ');
          Sql.Add(' (select codename from pyccode where codeid =''C103'' and b.LMAJORCODE = codeno) LMAJORname,                          ');
          Sql.Add(' case when FINDHIRE(a.empno) in (''Y'',''M'',''J'',''P'',''Q'') then ''비정규직'' else ''정규직'' end  Pstatename,   ');          Sql.Add(' (select corpname corpname from pkcpbas) corpname                                                                     ');
          Sql.Add('  from pimpmas b , pedulhis a                                                                                         ');
          Sql.Add(' where a.empno  = b.empno                                                                                             ');
          Sql.Add('   and a.empno  = ''' + copy(Ed_empno.Text,1,4) + '''                                                                 ');
          Sql.Add(' Order by a.empno                                                                                                     ');

          Open;

          if Q_Text.RecordCount<=0 then
          begin
            MessageBox(handle,'조회 결과가 없습니다.','확인',MB_OK);
            exit;
          end
          else
          begin
            ED_Korname.Text  := Q_TEXT.Fields[ 1].AsString;
            ED_Juminid.Text  := Q_TEXT.Fields[ 2].AsString;
            ED_Curaddr.Text  := Q_TEXT.Fields[ 3].AsString;
            ED_Retcont.Text  := Q_TEXT.Fields[ 4].AsString;
            ED_Telno.Text    := Q_TEXT.Fields[ 5].AsString;
            ED_Email.Text    := Q_TEXT.Fields[ 6].AsString;
            ED_paycl.Text    := Q_TEXT.Fields[ 7].AsString;
            ED_Lschgr.Text   := Q_TEXT.Fields[ 8].AsString;
            ED_Lmajor.Text   := Q_TEXT.Fields[ 9].AsString;
            ED_Pstate.Text   := Q_TEXT.Fields[10].AsString;
          end;
     end;

     with Q_Grid1 do
     begin
          Close;
          SQL.Clear;
          Sql.Add('Select x.EMPNO,                                                   ');
          Sql.Add('       x.RABASDATE,                                               ');
          Sql.Add('	  x.EDUNAME,                                                 ');
          Sql.Add('	  x.LECTIME,                                                 ');
          Sql.Add('	  x.EDUCOMENT                                                ');
          Sql.Add('  from                                                            ');
          Sql.Add('    (select rownum rowseq, a.* from                               ');
          Sql.Add('       (select  a.EMPNO,                                          ');
          Sql.Add('	           To_char(To_date(a.RABASDATE,''YYYYMMDD''),''YYYY/MM/DD'') RABASDATE,');
          Sql.Add('	           To_char(a.LECTIME,''999.9'') LECTIME,             ');
          Sql.Add('	           a.EDUNAME,                                        ');
          Sql.Add('	           a.EDUCOMENT                                       ');
          Sql.Add('          from pedulhis a                                         ');
          Sql.Add('         where a.empno = ''' + copy(Ed_empno.Text,1,4) + '''      ');
          Sql.Add('           and substr(nvl(a.coment,'' ''),1,2) <> ''조정''                    ');
	  Sql.Add('	 Order by a.empno, a.Rabasdate desc)  a)  x,                 ');
          Sql.Add('       (Select rownum Rowseq from pimpmas where rownum <= 36) y   ');
          Sql.Add(' Where x.Rowseq(+) = y.Rowseq                                     ');
          Sql.Add(' Order by x.EMPNO,x.RABASDATE asc                                 ');
          Open;

     end;

     with Q_grid2 do
     begin
          Close;
          Sql.Clear;
          Sql.Add('Select x.EMPNO,                                                   ');
          Sql.Add('       x.Edu_date,                                                ');
          Sql.Add('	  x.Edu_title                                                ');
          Sql.Add('  from                                                            ');
          Sql.Add('      (Select rownum Rowseq, a.* from                             ');
          Sql.Add('        (select distinct a.empno, a.Korname,                      ');
          Sql.Add('	            To_char(To_date(b.Edu_date_from,''YYYYMMDD''),''YYYY/MM/DD'')||''~''||To_char(To_date(b.Edu_date_to,''YYYYMMDD''),''YYYY/MM/DD'') Edu_date, ');
          Sql.Add('	            b.Edu_title                                      ');
          Sql.Add('          from pedulhis a, pedu2item b                            ');
          Sql.Add('         where a.empno = b.empno                                  ');
          Sql.Add('	      and a.empno = ''' + copy(Ed_empno.Text,1,4) + '''      ');
          Sql.Add('           and b.EDU_TYPE in (''3003'',''3004'')                  ');
          Sql.Add('           and rownum <= 10                                       ');
          Sql.Add('	    Order by a.empno, Edu_date desc) a ) x,                  ');
          Sql.Add('	  (Select rownum Rowseq from pimpmas where rownum <= 10) y   ');
          Sql.Add(' Where x.Rowseq(+) = Y.Rowseq                                     ');
          Sql.Add(' Order by x.empno, x.Edu_date asc                                 ');
          Open;

     end;

end;

procedure TfrmMain.OnFocusButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMain.OnFocusButton3Click(Sender: TObject);
begin
     if Q_Text.RecordCount <= 0 then
     begin
        MessageBox(handle,'먼저 Excel 변환할 사원을 정확히 입력한 후 조회버튼을 누르십시오.','확인',MB_OK);
        exit;
     end;
     if (Ed_empno.Text = '') or (Ed_empno.Text = ' - ') then
     begin
        MessageBox(handle,'조회할 사원을 정확히 입력십시오.','확인',MB_OK);
        exit;
     end;

     if SaveDialog1.Execute then
     begin
         with TStringList.Create do
         try
           Add(pchar('강 사 이 력 서' ));
           Add(pchar('성명'    + #9 + Ed_Korname.Text + #9 +'주민번호' + #9 + ED_Juminid.Text   ));
           Add(pchar('주소'    + #9 + ED_Curaddr.Text                                           ));
           Add(pchar('휴대폰'  + #9 + ED_Retcont.Text + #9 +'전화번호' + #9 + ED_Telno.Text     ));
           Add(pchar('이메일'  + #9 + ED_Email.Text   + #9 +'직책'     + #9 + ED_paycl.Text     ));
           Add(pchar('최종학력'+ #9 + ED_Lschgr.Text  + #9 +'전공'     + #9 + ED_Lmajor.Text    ));
           Add(pchar('주당근로시간'+ #9 + '1월 80시간 이상 1주 18시간 이상'                     ));
           Add(pchar('채용형태'+ #9 + ED_Lschgr.Text  + #9 +'현직장명' + #9 + 'SK브로드밴드(주)'));

           Add(pchar('강의이력' ));
           Add(pchar('날짜'    +#9+
                     '과정명'  +#9+
                     '시간'    +#9+
                     '교육내용' ));

           while not Q_Grid1.Eof do
           begin
             Add(Format('%s'+#9+                              //  '날짜(강의이력)'
                        '%s'+#9+                              //  '과정명(강의이력)'
                        '%s'+#9+                              //  '시간(강의이력)'
                        '%s',                                 //  '교육내용강의이력)'

                   [ Q_Grid1.Fields[ 1].AsString,             //  '날짜(강의이력)'
                     Q_Grid1.Fields[ 2].AsString,             //  '과정명(강의이력)'
                     Q_Grid1.Fields[ 3].AsString,             //  '시간(강의이력)'
                     Q_Grid1.Fields[ 4].AsString ]));         //  '교육내용강의이력)'
             Q_Grid1.Next;
           end; // end of while

           Add(pchar('교육수료이력'));
           Add(pchar('날짜'    +#9+
                     '과정명'      ));

           while not Q_Grid2.Eof do
           begin
             Add(Format('%s'+#9+                              //  '날짜(교육수료이력)'
                        '%s',                                 //  '과정명(교육수료이력)'

                   [ Q_Grid2.Fields[ 1].AsString,             //  '날짜(강의이력)'
                     Q_Grid2.Fields[ 2].AsString ]));         //  '교육내용강의이력)'
             Q_Grid2.Next;
           end; // end of while
           Add(pchar('위의 내용은 사실과 다름없음을 확인합니다.'));
           Add(pchar(FG_sysdate));
           Add(pchar('SK브로드밴드(주)'));

           SaveDialog1.FileName := trim(copy(ED_empno.text,8,20))+'강의이력.xls';
           SaveToFile(SaveDialog1.FileName);

         finally
           Q_Grid1.First;
           Q_Grid2.First;
         end; // end of try
     end; //end of SaveDialog1.Execute
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Q_Text.Close;
  Q_Grid1.Close;
  Q_Grid2.Close;
  Action := CaFree;
end;

procedure TfrmMain.OnFocusButton1Click(Sender: TObject);
begin
     if Q_Text.RecordCount <= 0 then
     begin
        MessageBox(handle,'먼저 인쇄할 사원을 정확히 입력한 후 조회버튼을 누르십시오.','확인',MB_OK);
        exit;
     end;
     QuickReport1.Print;
     Q_Grid1.First;
     Q_Grid2.First;
end;

procedure TfrmMain.ED_GubunChange(Sender: TObject);
begin
     with Q_Com do
     begin
          Close;
          Sql.Clear;
          //강사명
          Sql.Add('select distinct EMPNO,                                               ');
          Sql.Add('       (Select KORNAME from pimpmas Where empno = a.EMPNO)  KORNAME  ');
          Sql.Add('  from pedulhis a                                                    ');
          if Ed_Gubun.Text = '비정규직' then
          begin
             Sql.Add('Where FINDHIRE(empno) in (''J'',''Q'',''P'',''M'',''Y'')        ');
          end
          else
          if Ed_Gubun.Text = '정규직' then
          begin
             Sql.Add('Where FINDHIRE(empno) not in (''J'',''Q'',''P'',''M'',''Y'')    ');
          end;
          Open;

          Ed_Empno.Items.Clear;
          while not Q_Com.eof do
          begin
             Ed_Empno.Items.Add(FieldbyName('EMPNO').AsString + ' - ' + FieldbyName('KORNAME').AsString);
             next;
          end;
          Ed_Empno.itemindex := -1;
     end;

     EditTextClear;
end;

procedure TfrmMain.Ed_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
       with Q_Com do
       begin
          Close;
          Sql.Clear;
          //강사명
          Sql.Add('select distinct a.empno, b.Korname, b.juminid, b.curaddr, b.RETCONT, b.TELNO, b.E_mail,                                 ');
          Sql.Add(' (select codename from pyccode where codeid =''I113'' and b.payra  = codeno) Payraname,                                 ');
          Sql.Add(' (select codename from pyccode where codeid =''I221'' and b.lschgr = codeno) lschgrname,                                ');
          Sql.Add(' (select codename from pyccode where codeid =''C103'' and b.LMAJORCODE = codeno) LMAJORname,                            ');
          Sql.Add(' case when FINDHIRE((a.empno) in (''Y'',''M'',''J'',''P'',''Q'') then ''비정규직'' else ''정규직'' end  Pstatename     ');
          Sql.Add('  from pimpmas b , pedulhis a                                                                                           ');
          Sql.Add(' where a.empno = b.empno                                                                                                ');
          Sql.Add('   and ((a.empno Like ''%' + Ed_empno.Text + '%'')                                                                      ');
          Sql.Add('        or (B.Korname Like ''%' + Ed_empno.Text + '%''))                                                                ');

          edit1.text := sql.Text;
          open;
          if RecordCount <= 0 then
          begin
              MessageBox(handle,'조회할 사원을 정확히 입력해주세요.','확인',MB_OK);
              exit;
          end;

          Ed_empno.Text := fieldbyname('empno').AsString + ' - ' + fieldbyname('Korname').AsString;
       end;
    end;
end;

end.
