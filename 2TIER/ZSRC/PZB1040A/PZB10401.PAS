{-------------------------------------------------------------------------------
PROGRAM-NAME    : PZB1040A(SMS 전송 관리)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 기타
Programmer      : 지순미
Version         : 1.00
Date            : 2014.07.01
Update   contents
  1.00   2014.07.01    지순미   신규프로그램개발
--------------------------------------------------------------------------------}

unit PZB10401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids,
  DBTables, Db, MemDS, DBAccess, Ora, OraError, Math, ImgList, OraSmart, OnSkinBtn,
  OnEditBtnCtrl, OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl,
  OnPopupEdit, OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn, OnEditMemo,
  OnFocusButton, OnShapeLabel, Func, Comobj;


type
  TMainForm = class(TForm)
    DS_List: TDataSource;
    Panel10: TPanel;
    BBInsert: TBitBtn;
    BBDelete: TBitBtn;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    BBexit: TBitBtn;
    P_Help: TPanel;
    Qry_List: TOraQuery;
    Notebook1: TNotebook;
    SB_2: TOnSkinButton;
    SB_1: TOnSkinButton;
    SB_3: TOnSkinButton;
    BBexcel: TBitBtn;
    SF_Main: TOnSchemeForm;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    BBsendsms: TBitBtn;
    Qry_Text: TOraQuery;
    Qry_ListEmpno: TStringField;
    Qry_ListKorname: TStringField;
    Qry_ListRetcont: TStringField;
    DS_Text: TDataSource;
    OpenDialog1: TOpenDialog;
    OraQuery1: TOraQuery;
    SB_4: TOnSkinButton;
    OnGrDbGrid1: TOnGrDbGrid;
    e_sendtel3: TOnEdit;
    e_sendtitle3: TOnEdit;
    e_sendbody3: TOnMemo;
    e_sendman: TOnEdit;
    e_sendcnt: TOnEdit;
    Qry_Log: TOraQuery;
    DS_Log: TDataSource;
    Qry_LogSENDTIME: TStringField;
    Qry_LogSENDMAN: TStringField;
    Qry_LogSENDCNT: TIntegerField;
    Qry_LogSENDTEL: TStringField;
    Qry_LogSMSTITLE: TStringField;
    Qry_LogSMSBODY: TStringField;
    Qry_LogSENDMANNM: TStringField;
    e_sendtime: TOnEdit;
    Qry_ListEMPTEXT: TStringField;
    BBsendmail: TBitBtn;
    e_sendgb: TOnEdit;
    Qry_LogSENDGB: TStringField;
    Query_exec: TOraQuery;
    e_sendtel2: TOnEdit;
    e_sendtitle2: TOnEdit;
    e_sendbody2: TOnMemo;
    DbGrid1: TOnGrDbGrid;
    Panel2: TPanel;
    e_empno: TOnWinPopupEdit;
    e_korname: TOnEdit;
    e_retcont: TOnEdit;
    e_emptext: TOnEdit;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    BT_All_ins: TOnFocusButton;
    BT_All_Del: TOnFocusButton;
    Bt_excel: TBitBtn;
    S_EmpList: TStringGrid;
    RadioGroup2: TRadioGroup;
    DbGrid2: TOnGrDbGrid;
    E_sempno: TOnEdit;
    E_skorname: TOnEdit;
    Label1: TLabel;
    e_sendtel1: TOnEdit;
    e_sendtitle1: TOnEdit;
    e_sendbody1: TOnMemo;
    Memo1: TMemo;
    OnFocusButton1: TOnFocusButton;
    E_Help: TOnMemo;
    BBcopy: TBitBtn;
    BBSearch: TOnFocusButton;
    E_Search2: TOnEdit;
    E_Search1: TOnEdit;
    OnEdit1: TOnEdit;
    R_all: TOnRadioButton;
    R_SMS: TOnRadioButton;
    R_Mail: TOnRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure DS_ListDataChange(Sender: TObject; Field: TField);
    procedure BBcancelClick(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure BBInsertClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure BBexcelClick(Sender: TObject);
    procedure e_EmpnoInitPopup(Sender: TObject);
    procedure e_EmpnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_All_DelClick(Sender: TObject);
    procedure BT_All_insClick(Sender: TObject);
    procedure BBsendsmsClick(Sender: TObject);
    procedure e_EmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_sEmpnoEnter(Sender: TObject);
    procedure E_sEmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Bt_excelClick(Sender: TObject);
    procedure e_sendtel1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure e_retcontExit(Sender: TObject);
    procedure e_sendtitle1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure e_sendbody1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure BBSearchClick(Sender: TObject);
    procedure E_Search1KeyPress(Sender: TObject; var Key: Char);
  private
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    { Private declarations }
  public
    VEmpno      : String;
    procedure clear_fields;
    procedure Open_grid;
    procedure Delete_record;
    procedure Insert_record;
    procedure Update_record;
    { Public declarations }


  end;

  type   Dempno = record
      tblempno  : String;
      tblemail  : String;
  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;
  Demptbl     : array[0..4] of Dempno;

implementation

uses PZB10402;

{$R *.DFM}

procedure TMainForm.clear_fields;
begin
  if      Notebook1.ActivePage = 'P1' then
  begin
       e_sendtel1.text    := '';
       e_sendtitle1.text  := '';
       e_sendbody1.text   := '';
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       e_Empno.text      := '';
       e_Korname.text    := '';
       e_Retcont.text    := '';
       e_Emptext.text    := '';
  end;
end;

procedure TMainForm.Open_grid;
begin
  if Notebook1.ActivePage = 'P1' then
  begin
       with Qry_Text do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select SENDTEL, SENDTITLE, SENDBODY             ');
            Sql.Add('  From Pysendtext                               ');
            SQL.Add(' Where WRITEMAN  = :WRITEMAN                    ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;
            Open;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       with Qry_List do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select Empno, Korname, Retcont, Emptext         ');
            Sql.Add('  From Pysendlist                               ');
            SQL.Add(' Where WRITEMAN  = :WRITEMAN                    ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
            Sql.Add(' Order By Empno                                 ');
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;
            Open;
       end;
       Qry_List.FieldByName('Empno'  ).Alignment := taCenter;
       Qry_List.FieldByName('Korname').Alignment := taCenter;
       Qry_List.FieldByName('Retcont').Alignment := taCenter;
       S_EmpList.Cells[0,0] := '  사번';
       S_EmpList.Cells[1,0] := '  개인별 전송 문구';
  end
  else if Notebook1.ActivePage = 'P3' then
  begin
       with Qry_Text do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select SENDTEL, SENDTITLE, SENDBODY             ');
            Sql.Add('  From Pysendtext                               ');
            SQL.Add(' Where WRITEMAN  = :WRITEMAN                    ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;
            Open;
       end;

       with Qry_List do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select Empno, Korname, Retcont, Emptext         ');
            Sql.Add('  From Pysendlist                               ');
            SQL.Add(' Where WRITEMAN  = :WRITEMAN                    ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
            Sql.Add(' Order By Empno                                 ');
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;
            Open;
       end;

       Qry_List.FieldByName('Empno'  ).Alignment := taCenter;
       Qry_List.FieldByName('Korname').Alignment := taCenter;
       Qry_List.FieldByName('Retcont').Alignment := taCenter;
  end
  else if Notebook1.ActivePage = 'P4' then
  begin
       with Qry_Log do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select Sendtime,  Sendman,                          ');
            Sql.Add('       b.Korname  Sendmannm,                        ');
            Sql.Add('       Sendcnt,   SENDGB,   SENDTEL,                ');
            Sql.Add('       SENDTITLE, SENDBODY                          ');
            Sql.Add('  From Pysendlog a, pymenuuser b                    ');
            Sql.Add(' where a.Sendman = b.empno                          ');

            if R_SMS.Checked then
                 Sql.Add('   and a.SENDGB = '''+R_SMS.Caption +'''       ');
            if R_Mail.Checked then
                 Sql.Add('   and a.SENDGB = '''+R_Mail.Caption+'''       ');

            if Trim(E_Search1.Text) <> '' then
            begin
                 Sql.Add('   and ((b.korname  like :SWRITEMAN       ) or ');
                 Sql.Add('        (b.empno    like upper(:SWRITEMAN)))   ');
                 ParamByName('SWRITEMAN').AsString   := '%'+E_Search1.Text+'%';
            end;

            if Trim(E_Search2.Text) <> '' then
            begin
                 Sql.Add('   and upper(SENDTITLE) like upper(:SSENDTITLE)');
                 ParamByName('SSENDTITLE').AsString   := '%'+E_Search2.Text+'%';
            end;
            Sql.Add(' Order By Sendtime desc                             ');
            Open;
       end;
  end;
end;

procedure TMainForm.Delete_record;
begin
  if Notebook1.ActivePage = 'P2' then
  begin
       with OraQuery1 do
       begin
            Close;
            SQL.Clear;
            SQL.Add('Delete From Pysendlist     ');
            SQL.Add(' Where Empno    = :Empno   ');
            SQL.Add('   and WRITEMAN = :WRITEMAN');   //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선

            ParamByName('Empno').AsString    := E_Empno.Text;
            ParamByName('WRITEMAN').AsString := PEmpno;
            ExecSQL;
       end;
  end;
end;

procedure TMainForm.Insert_record;
begin
  if      Notebook1.ActivePage = 'P1' then
  begin
       if (trim(e_sendtel1.text) = '') or (trim(e_sendtitle1.text) = '') or (trim(e_sendbody1.text) = '') then
       begin
            MessageBox(hAndle,'발신전화번호, 전송제목, 전송내용은 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            e_sendtel1.SetFocus;
            exit;
       end;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Insert Into PysendText                                         ');
            Sql.Add(' ( SENDTEL,  SENDTITLE,  SENDBODY,  WRITEMAN,  WRITETIME)       ');
            Sql.Add(' VALUES                                                         ');
            Sql.Add(' (:SENDTEL, :SENDTITLE, :SENDBODY, :WRITEMAN, :WRITETIME)       ');

            ParamByName('SENDTEL'   ).AsString   := e_sendtel1.Text;
            ParamByName('SENDTITLE' ).AsString   := e_sendtitle1.Text;
            ParamByName('SENDBODY'  ).AsString   := e_sendbody1.Text;
            ParamByName('WRITETIME' ).AsString   := fn_GetDateTimeStr;
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;

            ExecSQL;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       if (trim(E_Empno.text) = '') or (trim(E_Korname.text) = '') or (trim(E_Retcont.text) = '') then
       begin
            MessageBox(hAndle,'수신자사번, 성명, 전화번호는 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_Empno.SetFocus;
            exit;
       end;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Insert Into Pysendlist                                         ');
            Sql.Add(' ( Empno,  Korname,  Retcont,  Emptext,  WRITEMAN,  WRITETIME)  ');
            Sql.Add(' VALUES                                                         ');
            Sql.Add(' (:Empno, :Korname, :Retcont, :Emptext, :WRITEMAN, :WRITETIME)  ');

            ParamByName('Empno'     ).AsString := E_Empno.text;
            ParamByName('Korname'   ).AsString := E_Korname.text;
            ParamByName('Retcont'   ).AsString := E_Retcont.text;
            ParamByName('Emptext'   ).AsString := E_Emptext.text;
            ParamByName('writetime' ).AsString := fn_GetDateTimeStr;
            ParamByName('writeman'  ).AsString := PEmpno;

            ExecSQL;
       end;
  end;

  P_Help.Caption := '   새로운 데이터가 입력되었습니다...';
end;

procedure TMainForm.Update_record;
begin
  if NoteBook1.ActivePage = 'P1' then
  begin
       if (trim(e_sendtel1.text) = '') or (trim(e_sendtitle1.text) = '') or (trim(e_sendbody1.text) = '') then
       begin
            MessageBox(hAndle,'발신자전화번호, 전송제목, 전송내용은 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            e_sendtel1.SetFocus;
            exit;
       end;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Update Pysendtext              ');
            Sql.Add('    SET SENDTEL   = :SENDTEL,   ');
            Sql.Add('        SENDTITLE = :SENDTITLE, ');
            Sql.Add('        SENDBODY  = :SENDBODY,  ');
            Sql.Add('        WRITETIME = :WRITETIME, ');
            Sql.Add('        WRITEMAN  = :WRITEMAN   ');
            SQL.Add('  Where WRITEMAN  = :WRITEMAN   ');    //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선

            ParamByName('SENDTEL'   ).AsString   := e_sendtel1.Text;
            ParamByName('SENDTITLE' ).AsString   := e_sendtitle1.Text;
            ParamByName('SENDBODY'  ).AsString   := e_sendbody1.Text;
            ParamByName('WRITETIME' ).AsString   := fn_GetDateTimeStr;
            ParamByName('WRITEMAN'  ).AsString   := PEmpno;

            ExecSQL;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if (trim(E_Empno.text) = '') or (trim(E_Korname.text) = '') or (trim(E_Retcont.text) = '') then
       begin
            MessageBox(hAndle,'수신자사번, 성명, 전화번호는 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_Empno.SetFocus;
            exit;
       end;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Update Pysendlist              ');
            Sql.Add('    SET Korname    = :Korname,  ');
            Sql.Add('        Retcont    = :Retcont,  ');
            Sql.Add('        Emptext    = :Emptext,  ');
            Sql.Add('        WRITETIME  = :writetime,');
            Sql.Add('        WRITEMAN   = :writeman  ');
            SQL.Add('  Where Empno      = :Empno     ');
            SQL.Add('    and WRITEMAN   = :writeman  ');   //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선

            ParamByName('Korname'   ).AsString := E_Korname.text;
            ParamByName('Retcont'   ).AsString := E_Retcont.text;
            ParamByName('Emptext'   ).AsString := E_Emptext.text;
            ParamByName('writetime' ).AsString := fn_GetDateTimeStr;
            ParamByName('writeman'  ).AsString := PEmpno;
            ParamByName('Empno'     ).AsString := E_Empno.text;
            ExecSQL;
       end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  E_Help.Visible := False;

  OraConnect;

  VEmpno   := PEmpno;

  Application.ProcessMessages;

  L_CurDate.Caption  := fn_GetDateStr;
  L_UserName.Caption := PKorname+'('+PEmpno+')';
  Application.ProcessMessages;
end;

procedure TMainForm.FormShow(Sender: TObject);
var vSql, vGroupid, vAdmin : String;
begin
  {if (Copy(Pgrade,2,1) > 'C') then  //관리자 권한 이외에는 사용불가.   2017.04.17. dsa2000  주석처리
  begin
       MessageBox(hAndle,'관리자 권한 외에는 실행할 수 없습니다.','알 림',MB_OK or $0030);         Close;
  end;}
  
  /////2017.04.17. dsa2000 Func_ManagerChk에 의한 관리자 체크 추가.  //VarLoading;
  vAdmin := 'N';

  //등록된 관리그룹으로 체크
  vSql := 'Select Groupid From Pymenuuser Where Empno='''+Pempno+'''';
  vGroupid := OraSqlOpen(vSql);
  vSql := 'Select Func_ManagerChk(''2'',''5'',''PZB1040A'','''+vGroupid+''','''') vCnt From Dual'; //ShowMessage(OraSqlOpen(vSql));
  if OraSqlOpen(vSql) = '1' then vAdmin := 'Y';

  //등록된 사번으로 체크(일반사용자 전체에게 프로그램 Open시 등록된 사번으로 관리 가능)
  vSql := 'Select Func_ManagerChk(''2'',''5'',''PZB1040A'','''+Pempno+''','''') vCnt From Dual'; //ShowMessage(OraSqlOpen(vSql));
  if OraSqlOpen(vSql) = '1' then vAdmin := 'Y';

  if Copy(Pgrade,10,1) <= 'C' then vAdmin := 'Y'; //관리등급으로 체크

  if vAdmin <> 'Y' then
  begin
       MessageBox(hAndle,'관리자만 실행할 수 있습니다.'+#13+#13+'프로그램을 종료합니다.','알 림',MB_OK or $0030);
       Application.Terminate;
  end; /////////////////////////////////////////////////////////////////////////

  SB_1Click(SB_1);
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
  if MessageDlg('프로그램을 종료하시겠습니까?.',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  halt(1);
end;

procedure TMainForm.DS_ListDataChange(Sender: TObject; Field: TField);
var
  vBaseBody : String;
begin
  if NoteBook1.ActivePage = 'P1' then
  begin
       if (Qry_Text.RecordCount > 0) then
       begin
            with Qry_Text do
            begin
                 e_sendtel1.Text    :=  FieldByName('sendtel'  ).asstring;
                 e_sendtitle1.Text  :=  FieldByName('sendtitle').asstring;
                 e_sendbody1.text   :=  FieldByName('sendbody' ).asstring;

                 e_sendtel2.text    :=  FieldByName('sendtel'  ).asstring;
                 e_sendtitle2.Text  :=  FieldByName('sendtitle').asstring;
                 e_sendbody2.Text   :=  FieldByName('sendbody' ).asstring;
            end;

            WorkMode     := 2; { Update mode }
       end
       else begin
            WorkMode     := 1;
            Clear_Fields;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if not Qry_List.Eof then
       begin
            with Qry_List do
            begin
                 E_Empno.Text      := FieldByName('Empno'     ).asstring;
                 E_Korname.Text    := FieldByName('Korname'   ).asstring;
                 E_Retcont.Text    := FieldByName('Retcont'   ).asstring;
                 E_Emptext.Text    := FieldByName('Emptext'   ).asstring;
            end;

            WorkMode     := 2; { Update mode }

            E_Empno.enabled := false;
       end
       else begin
            WorkMode     := 0;
            Clear_Fields;
       end;
  end
  else if NoteBook1.ActivePage = 'P3' then
  begin
       vBaseBody    := Trim(Qry_Text.FieldByName('sendbody').AsString);

       if pos('%$',vBaseBody) > 0  then
            e_sendbody2.Text  := SearchAndReplace(vBaseBody, '%$', Qry_List.FieldByName('Emptext').AsString)
       else
            e_sendbody2.Text  := vBaseBody;
  end
  else if NoteBook1.ActivePage = 'P4' then
  begin
       with Qry_Log do
       begin
            e_sendtime.Text    := copy(FieldByName('Sendtime' ).asstring, 1,4)+'-'
                                + copy(FieldByName('Sendtime' ).asstring, 5,2)+'-'
                                + copy(FieldByName('Sendtime' ).asstring, 7,2)+' '
                                + copy(FieldByName('Sendtime' ).asstring, 9,2)+':'
                                + copy(FieldByName('Sendtime' ).asstring,11,2)+':'
                                + copy(FieldByName('Sendtime' ).asstring,13,2);
            e_sendman.Text     := FieldByName('Sendman'  ).asstring + ' - '
                                + FieldByName('Sendmannm').asstring;
            e_sendgb.Text      := FieldByName('Sendgb'   ).asstring;
            e_sendcnt.Text     := FieldByName('Sendcnt'  ).asstring + ' 건';
            e_sendtel3.Text    := FieldByName('sendtel'  ).asstring;
            e_sendtitle3.Text  := FieldByName('sendtitle').asstring;
            e_sendbody3.text   := FieldByName('sendbody' ).asstring;
       end;
       WorkMode     := 2; { Update mode }
  end;
end;

procedure TMainForm.BBcancelClick(Sender: TObject);
begin
  P_Help.Caption :='';
  open_grid;
end;

procedure TMainForm.BBDeleteClick(Sender: TObject);
begin
  P_Help.Caption :='';
  if WorkMode = 2 then
  begin
       if ( IDYes = Application.MessageBox(' 현재 데이터를 삭제하시겠습니까? ', '확 인',MB_YESNO ) ) then
       begin
            Delete_Record;
            Open_Grid;
            P_Help.Caption := '   삭제 작업이 완료되었습니다.';
       end;
  end
  else
       P_Help.Caption := '   등록된 자료에 한해서만 삭제 작업을 하실 수 있습니다...';
end;

procedure TMainForm.BBInsertClick(Sender: TObject);
begin
  P_Help.Caption :='';
  WorkMode := 1;
  Clear_Fields;

  if NoteBook1.ActivePage = 'P2' then
  begin
       E_Empno.enabled := true;
       E_Empno.SetFocus;
  end;
end;

procedure TMainForm.BBsaveClick(Sender: TObject);
begin
  P_Help.Caption :='';
  if NoteBook1.ActivePage = 'P2' then
  begin
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            SQL.Add('Select * From Pysendlist         ');
            SQL.Add(' Where Empno    = :Empno         ');
            SQL.Add('   and WRITEMAN = :WRITEMAN      ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
            ParamByName('Empno').AsString    := E_Empno.Text;
            ParamByName('WRITEMAN').AsString := PEmpno;
            Open;
            if OraQuery1.recordCount > 0 then WorkMode := 2
            else                              WorkMode := 1;
       end;
  end
  //2017.06.01 jissi 전송내역등록으로 복사 기능 추가
  else if NoteBook1.ActivePage = 'P4' then
  begin
       if MessageDlg('전송내용등록으로 복사 작업을 하시겠습니까?.',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

       SB_1Click(SB_1);
       e_sendtel1.Text   := e_sendtel3.Text;
       e_sendtitle1.Text := e_sendtitle3.Text;
       e_sendbody1.Text  := e_sendbody3.Text;
       MessageDlg('   전송내용등록으로 복사 작업이 완료되었습니다.'+#13#10#13#10+
                  '   복사된 내용을 등록하시려면 "저장"버튼을 눌러주시기 바랍니다.',mtInformation, [mbok], 0);
       system.Exit;
  end;

  if      WorkMode = 2 then
  begin
       Update_Record;
       Open_Grid;
  end
  else if WorkMode = 1 then
  begin
       Insert_Record;
       Open_Grid;
  end
  else if WorkMode = 0 then
  begin
       P_Help.Caption := '   저장작업은 "입력" 또는 "수정" 상태에서 가능합니다...';
       system.Exit;
  end;

  P_Help.Caption := '   '+TButton(Sender).Caption +' 작업이 완료되었습니다...';
end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
  P_Help.Caption :='';

  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;
  E_Help.Visible := False;

  TOnSkinButton(Sender).BtnDown := True;

  if      TOnSkinButton(Sender).Name = 'SB_1' then
  begin
       BBexcel.Enabled   := False;
       BBsendsms.Enabled := False;
       BBsendmail.Enabled:= False;
       BBcopy.Enabled    := False;    //2017.06.01 jissi 전송내역등록으로 복사 기능 추가

       BBInsert.Visible  := False;
       BBDelete.Visible  := False;
       BBsave.Visible    := True;
       BBcancel.Visible  := True;
  end
  else if TOnSkinButton(Sender).Name = 'SB_2' then
  begin
       BBexcel.Enabled   := True;
       BBsendsms.Enabled := False;
       BBsendmail.Enabled:= False;
       BBcopy.Enabled    := False;    //2017.06.01 jissi 전송내역등록으로 복사 기능 추가

       BBInsert.Visible  := True;
       BBDelete.Visible  := True;
       BBsave.Visible    := True;
       BBcancel.Visible  := True;
  end
  else if TOnSkinButton(Sender).Name = 'SB_3' then
  begin
       BBexcel.Enabled   := False;
       BBsendsms.Enabled := True;
       BBsendmail.Enabled:= True;
       BBcopy.Enabled    := False;    //2017.06.01 jissi 전송내역등록으로 복사 기능 추가

       BBInsert.Visible  := False;
       BBDelete.Visible  := False;
       BBsave.Visible    := False;
       BBcancel.Visible  := False;
  end
  else if TOnSkinButton(Sender).Name = 'SB_4' then
  begin
       BBexcel.Enabled   := True;
       BBsendsms.Enabled := False;
       BBsendmail.Enabled:= False;
       BBcopy.Enabled    := True;     //2017.06.01 jissi 전송내역등록으로 복사 기능 추가

       BBInsert.Visible  := False;
       BBDelete.Visible  := False;
       BBsave.Visible    := False;
       BBcancel.Visible  := False;
  end;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
  Open_grid;
end;

procedure TMainForm.BBexcelClick(Sender: TObject);
var XL, XArr   : Variant;
    i, j, k    : integer;
    SavePlace  : TBookmark;
begin
  P_Help.Caption :='   엑셀 변환할 자료를 검색중입니다.';
  if NoteBook1.ActivePage = 'P2' then
  begin
       if Qry_List.RecordCount < 1 then
       begin
            P_Help.Caption :='';
            showmessage('엑셀 변환할 자료가 없습니다.');
            exit;
       end;
       P_Help.Caption := '   Excel이 설치되어 있는지 검색하고 있습니다.';

       XArr := VarArrayCreate([1, Qry_List.Fields.Count], VarVariant); //Gird 출력시
       try
           XL := CreateOLEObject('Excel.Application');
       except
           MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
           P_Help.Caption := '';
           Exit;
       end;

       P_Help.Caption := '   자료를 변환하고 있습니다.';
       XL.WorkBooks.Add;                                 //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := '수신자 목록';         //시트명 부여


       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '사번';
       XArr[2]  := '성명';
       XArr[3]  := '전화번호';
       XArr[4]  := '개인별전송문구';

       XL.Range['A1', CHR(64 + Qry_List.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
       k := 1;
       for i := 1 to Qry_List.Fields.Count do     //Gird 출력시
       begin
            XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
            XL.Range[CHR(64 + i) + '1'].font.Size := 9;
            XL.Range[CHR(64 + i) + '1'].font.Bold := True;
       end;

       //검색된 자료를 excel에 export처리 시킨다.
       SavePlace := Qry_List.GetBookmark;
       Qry_List.DisableControls;
       Qry_List.First;

       for i := 1 to Qry_List.RecordCount do
       begin
            for j := 1 to Qry_List.Fields.Count do
            begin
                 if ((j = 1) or (j = 3)) then
                      XArr[j]  := ''''+Qry_List.Fields[j-1].AsString
                 else
                      XArr[j]  := Qry_List.Fields[j-1].AsString;
            end;

            XL.Range['A' + IntToStr(k+1), CHR(64 + Qry_List.Fields.Count) + IntToStr(k+1)].Value := XArr;
            inc(k);
            Qry_List.Next;
       end;

       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;                                          //가운데 정렬
       XL.Range['A2', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(64 + Qry_List.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                                           //자동정렬
       XL.Range['A2', 'A2'].Select;                                                            //A2열에 커서 위치시킴
       XL.Visible := true;                                                                     //엑셀자료 보여줌
       Screen.Cursor := crDefault;
       Qry_List.GotoBookmark(SavePlace);
       Qry_List.FreeBookmark(SavePlace);
       Qry_List.EnableControls;
  end
  else if NoteBook1.ActivePage = 'P4' then
  begin
       if Qry_Log.RecordCount < 1 then
       begin
            P_Help.Caption :='';
            showmessage('엑셀 변환할 자료가 없습니다.');
            exit;
       end;
       P_Help.Caption := '   Excel이 설치되어 있는지 검색하고 있습니다.';

       XArr := VarArrayCreate([1, Qry_Log.Fields.Count], VarVariant); //Gird 출력시
       try
           XL := CreateOLEObject('Excel.Application');
       except
           MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
           P_Help.Caption := '';
           Exit;
       end;

       P_Help.Caption := '   자료를 변환하고 있습니다.';
       XL.WorkBooks.Add;                                 //새로운 페이지 생성
       XL.Visible := false;
       XL.WorkSheets[1].Name := 'SMS_Mail 전송 Log';         //시트명 부여


       //컬럼명 지정_서브타이블 지정
       XArr[1]  := '전송일시';
       XArr[2]  := '전송자사번';
       XArr[3]  := '전송자성명';
       XArr[4]  := '전송구분';
       XArr[5]  := '전송건수';
       XArr[6]  := '발신전화번호';
       XArr[7]  := '전송제목';
       XArr[8]  := '전송내용';

       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
       k := 1;
       for i := 1 to Qry_Log.Fields.Count do     //Gird 출력시
       begin
            XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
            XL.Range[CHR(64 + i) + '1'].font.Size := 9;
            XL.Range[CHR(64 + i) + '1'].font.Bold := True;
       end;

       //검색된 자료를 excel에 export처리 시킨다.
       SavePlace := Qry_Log.GetBookmark;
       Qry_Log.DisableControls;
       Qry_Log.First;

       for i := 1 to Qry_Log.RecordCount do
       begin
            for j := 1 to Qry_Log.Fields.Count do
            begin
                 if ((j = 1) or (j = 2) or (j = 6)) then
                      XArr[j]  := ''''+Qry_Log.Fields[j-1].AsString
                 else
                      XArr[j]  := Qry_Log.Fields[j-1].AsString;
            end;

            XL.Range['A' + IntToStr(k+1), CHR(64 + Qry_Log.Fields.Count) + IntToStr(k+1)].Value := XArr;
            inc(k);
            Qry_Log.Next;
       end;

       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;                                          //가운데 정렬
       XL.Range['A2', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(64 + Qry_Log.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
       XL.Selection.Columns.AutoFit;                                                           //자동정렬
       XL.Range['A2', 'A2'].Select;                                                            //A2열에 커서 위치시킴
       XL.Visible := true;                                                                     //엑셀자료 보여줌
       Screen.Cursor := crDefault;
       Qry_Log.GotoBookmark(SavePlace);
       Qry_Log.FreeBookmark(SavePlace);
       Qry_Log.EnableControls;
  end;

  P_Help.Caption := '   추출 완료';
end;

procedure TMainForm.e_EmpnoInitPopup(Sender: TObject);
begin
  Fm_Emp.Edit          := TOnWinPopupEdit(Sender);
  Fm_Emp.E_Search.Text := e_Empno.text;
  Fm_Emp.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TMainForm.e_EmpnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_Emp.Empno <> '' then
  begin
       E_Empno.Text   := Fm_Emp.Empno;
       E_Korname.Text := Fm_Emp.Korname;
       E_Retcont.Text := Fm_Emp.Retcont;
       E_Emptext.Text := '';
  end;
end;

procedure TMainForm.BT_All_InsClick(Sender: TObject);
var
  iRow       : integer;
  All_emptxt : string;
begin
  if MessageDlg(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]+
                '을(를) 수신대상자 목록에 추가하시겠습니까?.',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

  if      RadioGroup2.ItemIndex = 0 then
       All_emptxt := 'Null'
  else if RadioGroup2.ItemIndex = 1 then
       All_emptxt := 'Empno||'' - ''||Korname'
  else if RadioGroup2.ItemIndex = 2 then
       All_emptxt := 'Korname';

  BT_All_DelClick(BT_All_Ins);
  with OraQuery1 do
  begin
       if RadioGroup1.ItemIndex <> 8 then
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Insert Into Pysendlist                                              ');
            SQL.Add(' (Empno, Korname, Retcont, Emptext, WRITEMAN, WRITETIME )            ');

            if      RadioGroup1.ItemIndex = 0 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And substr(empno,1,1) in                     ');
                 SQL.Add('                       (''0'',''1'',''2'',''3'',''4'',          ');
                 SQL.Add('                        ''5'',''6'',''7'',''8'',''9'')          ');
                 //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환) 무기계약직 제외
                 SQL.Add('                   And paycl not like ''H10%''                  ');
                 //2016.06.13 jissi 팀장은 파견직책이 아닌 소속직책으로 변경  SR-1606-0477
                 //SQL.Add('                   And Jobpayra > ''C11''                     ) ');
                 SQL.Add('                   And payra > ''C11''                        ) ');
            end
            else if RadioGroup1.ItemIndex = 1 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno not like ''I%''                    ');
                 //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환)
                 //SQL.Add('                   And Empno like ''J%'')                       ');
                 SQL.Add('                   And Paycl like ''H10%'')                     ');
            end
            else if RadioGroup1.ItemIndex = 2 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno like ''P%'')                       ');
            end
            else if RadioGroup1.ItemIndex = 3 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno like ''Y%'')                       ');
            end
            else if RadioGroup1.ItemIndex = 4 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno like ''I%'')                       ');
            end
            else if RadioGroup1.ItemIndex = 5 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno not like ''I%''                    ');
                 //2016.06.13 jissi 팀장은 파견직책이 아닌 소속직책으로 변경  SR-1606-0477
                 //SQL.Add('                   And Jobpayra =''C11'')                       ');
                 SQL.Add('                   And payra =''C11'')                          ');
            end
            else if RadioGroup1.ItemIndex = 6 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''70''                        ');
                 SQL.Add('                   And Empno like ''M%'')                       ');
            end
            else if RadioGroup1.ItemIndex = 7 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate like ''7%'')                      ');
            end

            else if RadioGroup1.ItemIndex = 9 then
            begin
                 SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')            ');
                 SQL.Add('        ,'+All_emptxt+'                                         ');
                 SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')  ');
                 SQL.Add('    From Pimpmas Where Pstate <   ''80'')                       ');
            end;
            ExecSQL;
       end
       else if RadioGroup1.ItemIndex = 8 then
       begin
            if trim(S_EmpList.Cells[0,1]) = '' then
            begin
                 MessageDlg('추출하려는 대상자를 먼저 선택해 주십시요', mtWarning, [mbYes], 0);
                 exit;
            end
            else
            begin
                 for iRow := 1 to S_EmpList.RowCount - 1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add(' Insert Into Pysendlist                                              ');
                      SQL.Add(' (Empno, Korname, Retcont, Emptext, WRITEMAN, WRITETIME )            ');
                      SQL.Add(' (Select Empno, Korname, replace(Retcont,''-'','''')                 ');
                      if  S_EmpList.Cells[1,iRow] = '' then
                      SQL.Add('        ,'+All_emptxt+'                                              ')
                      else
                      SQL.Add('        ,'''+ S_EmpList.Cells[1,iRow] +'''                           ');
                      SQL.Add('        ,'''+PEmpno+''', to_char(sysdate,''YYYYMMDDHH24MISS'')       ');
                      SQL.Add('    From Pimpmas Where Empno ='''+ S_EmpList.Cells[0,iRow] +''')     ');

                      ExecSQL;
                 end;
            end;
       end;
  end;

  Open_Grid;

  MessageDlg(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]+
             ' 수신대상자가 목록에서 추가되었습니다.', mtInformation, [mbok], 0);
end;

procedure TMainForm.BT_All_DelClick(Sender: TObject);
var iRow : integer;
begin
  if TOnFocusButton(Sender).Tag = 2 then
  begin
       if MessageDlg(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]+
                     '을(를) 수신대상자 목록에서 삭제하시겠습니까?.',
                     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  end;
  with OraQuery1 do
  begin
       if RadioGroup1.ItemIndex <> 8 then
       begin
            Close;
            Sql.Clear;
            Sql.Add(' Delete From Pysendlist                                              ');
            SQL.Add('  Where WRITEMAN = :WRITEMAN                                         ');    //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선

            if      RadioGroup1.ItemIndex = 0 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <  ''70''   ');
            SQL.Add('                                            And Empno not like ''I%''');
            SQL.Add('                     And substr(empno,1,1) in                        ');
            SQL.Add('                         (''0'',''1'',''2'',''3'',''4'',             ');
            SQL.Add('                          ''5'',''6'',''7'',''8'',''9'')             ');
            //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환) 무기계약직 제외
            SQL.Add('                     And paycl not like ''H10%''                     ');
            //2016.06.13 jissi 팀장은 파견직책이 아닌 소속직책으로 변경  SR-1606-0477
            //SQL.Add('                     And Jobpayra > ''C11''                       )  ');
            SQL.Add('                     And payra > ''C11''                          )  ');
            end
            else if RadioGroup1.ItemIndex = 1 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            SQL.Add('                                            And Empno not like ''I%''');
            //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환)
            //SQL.Add('                                            And Empno like ''J%''  ) ');
            SQL.Add('                                            And Paycl like ''H10%'') ');
            end
            else if RadioGroup1.ItemIndex = 2 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            SQL.Add('                                            And Empno like ''P%''  ) ');
            end
            else if RadioGroup1.ItemIndex = 3 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            SQL.Add('                                            And Empno like ''Y%''  ) ');
            end
            else if RadioGroup1.ItemIndex = 4 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            SQL.Add('                                            And Empno like ''I%''  ) ');
            end
            else if RadioGroup1.ItemIndex = 5 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            //2016.06.13 jissi 팀장은 파견직책이 아닌 소속직책으로 변경   SR-1606-0477
            //SQL.Add('                                              And Jobpayra =''C11'') ');
            SQL.Add('                                              And payra =''C11''   ) ');
            end
            else if RadioGroup1.ItemIndex = 6 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate <   ''70''  ');
            SQL.Add('                                            And Empno like ''M%''  ) ');
            end
            else if RadioGroup1.ItemIndex = 7 then
            begin
            SQL.Add('    And Empno in (Select Empno From Pimpmas Where Pstate like ''7%'')');
            end;

            ParamByName('WRITEMAN').AsString := PEmpno;
            ExecSQL;
       end
       else if RadioGroup1.ItemIndex = 8 then
       begin
            if trim(S_EmpList.Cells[0,1]) = '' then
            begin
                 MessageDlg('삭제하려는 대상자를 먼저 선택해 주십시요', mtWarning, [mbYes], 0);
                 exit;
            end
            else
            begin
                 for iRow := 1 to S_EmpList.RowCount - 1 do
                 begin
                      Close;
                      Sql.Clear;
                      Sql.Add(' Delete From Pysendlist                                          ');
                      SQL.Add('  Where WRITEMAN = :WRITEMAN                                     ');   //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
                      SQL.Add('    And Empno = Nvl('''+ S_EmpList.Cells[0,iRow] +''',''ZZZZ'')  ');
                      ParamByName('WRITEMAN').AsString := PEmpno;
                      ExecSQL;
                 end;
            end;
       end;


  end;

  if TOnFocusButton(Sender).Tag = 2 then
  begin
       Open_Grid;
       MessageDlg(RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]+
                  ' 수신대상자가 목록에서 삭제되었습니다.', mtInformation, [mbok], 0);
  end;
end;

procedure TMainForm.BBsendsmsClick(Sender: TObject);
var
  vSendTel, vSendTitle, vBaseBody, vSendBody, vReceiveTel : String;
  Mcnt, Ccnt, iIdx : integer;
const
    asEmpno : array[0..8] of string[4]  = ('D006','D025', 'D029', 'D031', 'D032', 'D033', 'D034', 'D035', 'D036'); //2017.09.22. jissi 이상문,송영일 추가
    asBmail : array[0..8] of string[5]  = ('Z113','Z983','Z1395','Z1213','Z2304','Z2305','Z2952','Z2807','Z2960');
begin
  P_Help.Caption :='';
  if (Copy(e_sendtel2.Text,1,2) <> '01') and (Copy(e_sendtel2.Text,1,1) <> '0')  then
  begin
       ShowMessage('"1.전송내용등록" 화면에서 발신전화번호에 지역번호와 함께 입력후 저장하시기 바랍니다.');
       exit;
  end;
  
  if Qry_List.RecordCount <= 0 then
  begin
       MessageDlg('수신자가 목록에 없습니다.'+#13#13+
                  '먼저 수신자를 등록해 주시기 바랍니다.', mtWarning, [mbok], 0);
       SB_1Click(SB_2);
       exit;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select sum(Decode(substr(a.Empno,1,1),     ''M''  ,1,0)) Mcnt, ');
       //2016.06.13 jissi 팀장은 파견직책이 아닌 소속직책으로 변경  SR-1606-0477
       //Sql.Add('       sum(Decode((select jobpayra from pimpmas                ');
       Sql.Add('       sum(Decode((select payra from pimpmas                   ');
       Sql.Add('                    where empno = a.empno),''C11'',1,0)) Ccnt  ');
       Sql.Add('  from PYSENDLIST a                                            ');
       SQL.Add(' Where WRITEMAN = :WRITEMAN                                    ');  //2017.06.14 jissi 사용자 동시 처리 점검 오류 개선
       ParamByName('WRITEMAN').AsString := PEmpno;
       Open;
       Mcnt := FieldByName('Mcnt').AsInteger;
       Ccnt := FieldByName('Ccnt').AsInteger;
       if      (Mcnt > 0) And (Ccnt > 0) then
       begin
            if MessageDlg(inttostr(Mcnt)+'명의 임원과 '+ inttostr(Ccnt)+'명의 팀장이 포함된 총 '+
                 inttostr(Qry_List.RecordCount)+'명의 수신자에게 '+TBitBtn(Sender).Caption+'하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
       end
       else if (Mcnt > 0) then
       begin
            if MessageDlg(inttostr(Mcnt)+'명의 임원이 포함된 총 '+
                 inttostr(Qry_List.RecordCount)+'명의 수신자에게 '+TBitBtn(Sender).Caption+'하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
       end
       else if (Ccnt > 0) then
       begin
            if MessageDlg(inttostr(Ccnt)+'명의 팀장이 포함된 총 '+
                 inttostr(Qry_List.RecordCount)+'명의 수신자에게 '+TBitBtn(Sender).Caption+'하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
       end
       else
       begin
            if MessageDlg(inttostr(Qry_List.RecordCount)+'명의 수신자에게 '+TBitBtn(Sender).Caption+'하시겠습니까?',
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
       end;
  end;

  P_Help.caption := '   '+TBitBtn(Sender).Caption+'중...';
  Application.ProcessMessages;

  Qry_Text.Close;
  Qry_Text.Open;

  vSendTel   := Trim(Qry_Text.FieldByName('SENDTEL').AsString);
  vSendTitle := Trim(Qry_Text.FieldByName('SENDTITLE').AsString);
  vBaseBody  := Trim(Qry_Text.FieldByName('SENDBODY').AsString);

  if not Qry_List.Active then Qry_List.Open;

  Qry_List.First;

  while not Qry_List.Eof do
  begin
       vSendBody    := '';
       vReceiveTel  := Trim(Qry_List.FieldByName('Retcont').AsString);

       if pos('%$',vBaseBody) > 0  then
            vSendBody  := SearchAndReplace(vBaseBody, '%$', Qry_List.FieldByName('Emptext').AsString)
       else
            vSendBody  := vBaseBody;
       if      TBitBtn(Sender).Tag = 1 then //SMS전송
       begin
            with OraQuery1 do
            begin
                 Close;
                 Sql.Clear;
                 Sql.Add('Call HPER.SENDSMS('''+vReceiveTel+''', '''+vSendTel+''', '''+vSendBody+''', '''+vSendTitle+''') ');
                 Execute;
            end;
       end
       else if TBitBtn(Sender).Tag = 2 then //Mail전송
       begin
            SendProgID  := 'PZB1040A';
            SendEmpno   := Pempno;
            if copy(Qry_List.FieldByName('EMPNO').AsString,1,1) = 'D' then
            begin
                 RcveEmpno   := 'Z983';
                 for iIdx := 0 to 8 do      //2017.09.22. jissi 이상문,송영일 추가
                 begin
                      if asEmpno[iIdx] = Qry_List.FieldByName('EMPNO').AsString then
                      begin
                           RcveEmpno  := asBmail[iIdx];
                           break;
                      end;
                 end;

                 //Mail 전송 Test
                 //RcveEmpno   := 'jipallas@partner.sk.com';
                 //RcveEmpno   := 'jbseo1226@sk.com';
            end
            else
                 RcveEmpno   := Qry_List.FieldByName('EMPNO').AsString;

            //Mail 전송 Test
            //MailSubject := vSendTitle+'_원문';
            //MailBody    := vSendBody;

            //MailSubject := vSendTitle+'_#13#10추가';
            //MailBody    := StringReplace(vSendBody,#13#10,#13#10#13#10,[rfReplaceAll]);

            //MailSubject := vSendTitle+'_#10추가';
            //MailBody    := StringReplace(vSendBody,#13#10,#13#10#10,[rfReplaceAll]);

            //MailSubject := vSendTitle+'_#13추가';
            //MailBody    := StringReplace(vSendBody,#13#10,#13#10#13,[rfReplaceAll]);

            MailSubject := vSendTitle;
            MailBody    := vSendBody;

            ReceiveYN   := 'N';
            //if ChkReceive.Checked then ReceiveYN := 'Y';

            if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            begin
                 MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                 exit;
            end;
       end;
       Qry_List.Next;
  end;

  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' Insert into Pysendlog                                                   ');
       Sql.Add(' ( SENDTIME, SENDMAN, SENDGB, SENDCNT, SENDTEL, SENDTITLE, SENDBODY )    ');
       Sql.Add(' VALUES                                                                  ');
       Sql.Add(' (:SENDTIME,:SENDMAN,:SENDGB,:SENDCNT,:SENDTEL,:SENDTITLE,:SENDBODY )    ');

       ParamByName('SENDTIME').AsString  := fn_GetDateTimeStr;
       ParamByName('SENDMAN' ).AsString  := PEmpno;
       ParamByName('SENDGB'  ).AsString  := TBitBtn(Sender).Caption;
       ParamByName('SENDCNT' ).AsInteger := Qry_List.RecordCount;
       ParamByName('SENDTEL' ).AsString  := vSendTel;
       ParamByName('SENDTITLE').AsString := vSendTitle;
       ParamByName('SENDBODY' ).AsString := vBaseBody;

       ExecSQL;
  end;

  P_Help.caption := '   '+TBitBtn(Sender).Caption+'을 완료 했습니다';
  Application.ProcessMessages;
end;

procedure TMainForm.e_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Key := #0;
       Fm_Emp.E_Search.text  := E_Empno.text;
       Fm_Emp.SqlOpen;
       Fm_Emp.Data_Select;

       if Fm_Emp.Empno <> '' then
       begin
            E_Korname.Text := Fm_Emp.Korname;
            E_Retcont.Text := Fm_Emp.Retcont;
       end;
  end;
end;

procedure TMainForm.E_sEmpnoEnter(Sender: TObject);
begin
  E_sEmpno.Text   := '';
  E_sKorname.Text := '';
end;

procedure TMainForm.E_sEmpnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
       if TOnEdit(Sender).tag = 1 then
            Qry_List.Locate('Empno',  E_sEmpno.Text,   [loPartialKey])
       else if TOnEdit(Sender).tag = 2 then
            Qry_List.Locate('Korname',E_sKorname.Text, [loPartialKey]);

       key := #10;
  end;
end;

procedure TMainForm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 8 then
  begin
       Bt_excel.Enabled   := true;
       BT_All_ins.Enabled := true;
  end
  else if RadioGroup1.ItemIndex = 9 then
  begin
       Bt_excel.Enabled   := false;
       BT_All_ins.Enabled := false;
  end
  else
  begin
       BT_All_ins.Enabled := true;
       Bt_excel.Enabled   := false;
  end;
end;

procedure TMainForm.Bt_excelClick(Sender: TObject);
var
  v           : Variant ;
  iRow, iCol  : integer ;
  CNT         : integer ;
  sEmpno, sImsiEmpno : String;
begin
  Try
       v := CreateOleObject('Excel.application');
  Except
       Messagedlg('Excel이 설치되어 있어야 합니다.',mtInformation,[mbOK],0);
       Exit;
  end;

  P_Help.Caption := '   수신자 리스트 파일 열기.....';

  if OpenDialog1.Execute then
       v.WorkBooks.open(OpenDialog1.FileName)
  else
       Exit;

  cnt := strToint(v.ActiveSheet.UsedRange.Rows.Count);

  begin
       S_EmpList.ColCount := 2;
       //2015.05 jissi 엑셀사번자료의 타이틀행 없이 순수 사번리스트만 받도록
       //S_EmpList.RowCount := cnt;
       S_EmpList.RowCount := cnt+1;

       for iRow := 1 to cnt do
       begin
            sImsiEmpno := v.cells[iRow, 1];
            if      length(sImsiEmpno) = 1 then sEmpno := Uppercase('000' + sImsiEmpno)
            else if length(sImsiEmpno) = 2 then sEmpno := Uppercase('00'  + sImsiEmpno)
            else if length(sImsiEmpno) = 3 then sEmpno := Uppercase('0'   + sImsiEmpno)
            else if length(sImsiEmpno) = 4 then sEmpno := Uppercase(        sImsiEmpno);

            {//2015.05 jissi 엑셀사번자료의 타이틀행 없이 순수 사번리스트만 받도록 수정
            S_EmpList.Rows[iRow-1].Clear;
            S_EmpList.Cells[0,iRow-1] := Trim(sEmpno);
            S_EmpList.Cells[1,iRow-1] := v.cells[iRow, 2];
            }
            S_EmpList.Rows[iRow].Clear;
            S_EmpList.Cells[0,iRow] := Trim(sEmpno);
            S_EmpList.Cells[1,iRow] := v.cells[iRow, 2];

       end;
  end;

  v.WorkBooks.Close;
  v.quit ;
  v := unassigned;
  P_Help.Caption := '';
  //////////////////////////////////////////////////////////////////////////////
end;

procedure TMainForm.e_sendtel1Exit(Sender: TObject);
begin
  e_sendtel1.Text := Trim(e_sendtel1.Text);
  if not IsNumber(e_sendtel1.Text) then
  begin
       Messagedlg('발신전화번호는 반드시 지역번호 포함한 숫자만 입력하세요.',mtWarning,[mbOK],0);
       //e_sendtel1.SetFocus;
  end;
end;

procedure TMainForm.e_retcontExit(Sender: TObject);
begin
  if not IsNumber(e_retcont.Text) then
  begin
       Messagedlg('수신자전화번호는 숫자만 입력하세요.',mtWarning,[mbOK],0);
       //e_retcont.SetFocus;
  end;
end;

procedure TMainForm.e_sendtitle1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    MoveText : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        MoveText := copy(e_sendtitle1.text, 1, Length(e_sendtitle1.text)-1);
        e_sendtitle1.Text := MoveText;
   end;
end;

procedure TMainForm.e_sendbody1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i : word;
    MoveText : string;
begin
   i := 222;
   if key = i then
   begin
        Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
        MoveText := copy(e_sendbody1.text, 1, Length(e_sendbody1.text)-1);
        e_sendbody1.Clear;
        e_sendbody1.Lines.Append(MoveText);
   end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with Query_exec do
  begin
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                           ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHH24MISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',               ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',               ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',               ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,               ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',               ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,               ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',               ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,               ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',               ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,               ');  //EAI_FLAG
       SQL.Add('        ''''                  )               ');  //EAI_DATE

       try
            ExecSql;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;

procedure TMainForm.OnFocusButton1Click(Sender: TObject);
begin
  E_Help.Left := 13;
  E_Help.Top  := 75;
  if E_Help.Visible = True then E_Help.Visible := False
  else                          E_Help.Visible := True;
end;

procedure TMainForm.BBSearchClick(Sender: TObject);
begin
  Open_grid;
end;

procedure TMainForm.E_Search1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Key := #0;
       BBSearchClick(Sender);
  end;
end;

end.


