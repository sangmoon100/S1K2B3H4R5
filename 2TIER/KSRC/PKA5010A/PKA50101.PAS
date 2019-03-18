unit PKA50101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids, Fempno,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn;
  //timeftp,Datelib,pass, codeText,ImgList,jpeg,

type
  TMainForm = class(TForm)
    DataSource: TDataSource;
    Panel10: TPanel;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    BBexit: TBitBtn;
    P_Help: TPanel;
    OraQuery: TOraQuery;
    tmp_oraqry: TOraQuery;
    Notebook1: TNotebook;
    Panel187: TPanel;
    SB_2: TOnSkinButton;
    SB_1: TOnSkinButton;
    Panel11: TPanel;
    SB_3: TOnSkinButton;
    Panel12: TPanel;
    OnGrDbGrid2: TOnGrDbGrid;
    OnGrDbGrid3: TOnGrDbGrid;
    e_botyymm: TOnEdit;
    e_botdate: TOnEdit;
    e_workemp1: TOnEdit;
    e_workemp2: TOnEdit;
    BBexcel: TBitBtn;
    SF_Main: TOnSchemeForm;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    E_empno: TOnWinPopupEdit;
    E_conempno: TOnPersonPopupEdit;
    E_botyymm1: TOnMaskEdit;
    Panel1: TPanel;
    R_conyn1: TOnRadioButton;
    R_conN1: TOnRadioButton;
    R_conY1: TOnRadioButton;
    R_con1: TOnRadioButton;
    SB_4: TOnSkinButton;
    Panel2: TPanel;
    OnGrDbGrid4: TOnGrDbGrid;
    E_BOTYYMM2: TOnMaskEdit;
    Panel3: TPanel;
    R_conyn2: TOnRadioButton;
    R_conN2: TOnRadioButton;
    R_conY2: TOnRadioButton;
    R_con2: TOnRadioButton;
    BBmail: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BBcancelClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure BBexcelClick(Sender: TObject);
    procedure E_empnoInitPopup(Sender: TObject);
    procedure E_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_botyymm1Click(Sender: TObject);
    procedure R_conyn1Click(Sender: TObject);
    procedure BBmailClick(Sender: TObject);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  public
    Vempno      : String;
    procedure clear_fields;
    procedure open_grid;
    procedure delete_record;
    procedure insert_record;
    procedure update_record;
    { Public declarations }


  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;


implementation

uses PKA50102;

{$R *.DFM}

procedure TMainForm.clear_fields;
begin
  if Notebook1.ActivePage = 'P2' then
  begin
       E_empno.text       := '';
       E_conempno.text    := '';
  end;
end;

procedure TMainForm.open_grid;
begin
  if Notebook1.ActivePage = 'P1' then
  begin
       with OraQuery do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' SELECT BOTYYMM, BOTDATE, WORKEMP1, WORKEMP2  ');
            Sql.Add('   FROM PKBOTBAS                              ');
            Open;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       with OraQuery do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' SELECT EMPNO,                                                         ');
            Sql.Add('       (select KORNAME from pimpmas where empno=a.empno)    KORNAME,   ');
            Sql.Add('       (select DEPTNAME from pycdept                                   ');
            Sql.Add('         where (orgnum,deptcode)                                       ');
            Sql.Add('             = (select orgnum,deptcode from pimpmas                    ');
            Sql.Add('                 where empno=a.empno)) DEPTNAME,                       ');
            Sql.Add('        CONEMPNO,                                                      ');
            Sql.Add('       (select KORNAME from pimpmas where empno=a.conempno) CONKORNAME ');
            Sql.Add('   FROM PKBOTEMP a                                                     ');
            Sql.Add('  ORDER BY EMPNO                                                       ');
            Open;

            fieldbyname('EMPNO'     ).Alignment := taCenter;
            fieldbyname('KORNAME'   ).Alignment := taCenter;
            fieldbyname('CONEMPNO'  ).Alignment := taCenter;
            fieldbyname('CONKORNAME').Alignment := taCenter;
       end;
  end
  else if Notebook1.ActivePage = 'P3' then
  begin
       with OraQuery do
       begin
            Close;
            Sql.Clear;
            Sql.add('Select substr(Workdate,1,6) BOTYYMM,  empno,                                  ');
            Sql.add('      (Select Korname from pimpmas where empno =a.empno) KORNAME,             ');
            Sql.add('      (Select orgnum  from pimpmas where empno =a.empno) ORGNUM,              ');
            Sql.add('      (Select deptcode from pimpmas where empno =a.empno) DEPTCODE,           ');
            Sql.add('      (Select deptname from pycdept where (orgnum,deptcode) =                 ');
            Sql.add('                                          (select orgnum,deptcode             ');
            Sql.add('                                             from pimpmas                     ');
            Sql.add('                                            where empno =a.empno)) DEPTNAME,  ');
            Sql.add('      (Select CONEMPNO from PKBOTEMP where empno =a.EMPNO) CONEMPNO,          ');
            Sql.add('      (Select Korname  from pimpmas                                           ');
            Sql.add('        where empno =(Select CONEMPNO from PKBOTEMP                           ');
            Sql.add('                       where empno =a.EMPNO))       CONKORNAME,               ');
            Sql.add('       sum(CALCTIME) CALCTIME, sum(CALCPAY) CALCPAY,                          ');
            Sql.add('       Decode(conyn,''N'',''비승인'',''Y'',''승인'',''미결재'') CONYN         ');
            Sql.add('  From PKBOTHIS a                                                             ');
            Sql.add(' Where Workdate like '''+ Trim(E_botyymm1.Text)  + '''||''%''                 ');
            if      R_conYN1.Checked then
            Sql.add('   And Conyn   is  NULL                                                       ')
            else if R_conN1.Checked  then
            Sql.add('   And Conyn   = ''N''                                                        ')
            else if R_conY1.Checked  then
            Sql.add('   And Conyn   = ''Y''                                                        ');
            Sql.add(' Group By substr(Workdate,1,6),empno,CONYN                                    ');
            Sql.add(' order By empno,CONEMPNO                                                      ');
            Open;

            fieldbyname('BOTYYMM'   ).Alignment := taCenter;
            fieldbyname('EMPNO'     ).Alignment := taCenter;
            fieldbyname('KORNAME'   ).Alignment := taCenter;
            fieldbyname('ORGNUM'    ).Alignment := taCenter;
            fieldbyname('DEPTCODE'  ).Alignment := taCenter;
            fieldbyname('CONEMPNO'  ).Alignment := taCenter;
            fieldbyname('CONKORNAME').Alignment := taCenter;
            TFloatField(FieldByName('CALCPAY')).DisplayFormat := '#,###';
       end;
  end
  else if Notebook1.ActivePage = 'P4' then
  begin
       with OraQuery do
       begin
            Close;
            Sql.Clear;
            Sql.add('Select empno,                                                                 ');
            Sql.add('      (Select Korname  from pimpmas where empno =a.empno) KORNAME,            ');
            Sql.add('       WORKDATE, TIMEFROM, TIMETO, OTDESC,                                    ');
            Sql.add('       CALCTIME,  CALCPAY,                                                    ');
            Sql.add('       Decode(conyn,''N'',''비승인'',''Y'',''승인'',''미결재'') CONYN, CONSAYU');
            Sql.add('  From PKBOTHIS a                                                             ');
            Sql.add(' Where Workdate like '''+ Trim(E_botyymm2.Text)  + '''||''%''                 ');
            if      R_conYN2.Checked then
            Sql.add('   And Conyn   is  NULL                                                       ')
            else if R_conN2.Checked  then
            Sql.add('   And Conyn   = ''N''                                                        ')
            else if R_conY2.Checked  then
            Sql.add('   And Conyn   = ''Y''                                                        ');
            Sql.add(' order By empno,Workdate                                                      ');
            Open;

            fieldbyname('EMPNO'    ).Alignment := taCenter;
            fieldbyname('KORNAME'  ).Alignment := taCenter;
            fieldbyname('WORKDATE' ).Alignment := taCenter;
            fieldbyname('TIMEFROM' ).Alignment := taCenter;
            fieldbyname('TIMETO'   ).Alignment := taCenter;
            TFloatField(FieldByName('CALCPAY' )).DisplayFormat := '#,###';
       end;
  end;
end;

procedure TMainForm.delete_record;
begin
  if Notebook1.ActivePage = 'P2' then
  begin
       with tmp_oraqry do
       begin
            Close;
            SQL.Clear;
            SQL.Add('delete from PKBOTEMP                                     ');
            SQL.Add(' where empno = :empno                                    ');

            ParamByName('empno').AsString := E_empno.Hint;
            execsql;
       end;
  end;
end;

procedure TMainForm.insert_record;
begin
  if Notebook1.ActivePage = 'P2' then
  begin
       if trim(E_Empno.text) = '' then
       begin
            MessageBox(handle,'비서수당 대상자를 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_empno.SetFocus;
            exit;
       end;

       if trim(E_conEmpno.text) = ''  then
       begin
            MessageBox(handle,'비서수당 결재자를 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_conEmpno.SetFocus;
            exit;
       end;

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' INSERT INTO PKBOTEMP ( EMPNO, CONEMPNO, WRITEMAN, WRITETIME) ');
            Sql.Add('               VALUES (:empno,:conempno,:WRITEMAN,:WRITETIME) ');

            ParamByName('empno'     ).AsString := E_empno.Hint;
            ParamByName('conempno'  ).AsString := E_conempno.empno;
            ParamByName('writetime' ).AsString := fn_GetDateTimeStr;
            ParamByName('writeman'  ).AsString := PEmpNo;

            ExecSQL;
       end;
  end;

  P_Help.Caption := '   새로운 데이터가 입력되었습니다...';
end;

procedure TMainForm.update_record;
begin
  if NoteBook1.ActivePage = 'P1' then
  begin
       if (trim(e_botyymm.text) = '') or (trim(e_botdate.text) = '') or (trim(e_workemp1.text) = '') then
       begin
            MessageBox(handle,'비서수당 등록기준월, 등록마감일, 담당자사번1은 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            e_botyymm.SetFocus;
            exit;
       end;

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' UPDATE PKBOTBAS SET                                      ');
            Sql.Add('     BOTYYMM   = :BOTYYMM,                                ');
            Sql.Add('     BOTDATE   = :BOTDATE,                                ');
            Sql.Add('     WORKEMP1  = :WORKEMP1,                               ');
            Sql.Add('     WORKEMP2  = :WORKEMP2,                               ');
            Sql.Add('     WRITETIME = :writetime,                              ');
            Sql.Add('     WRITEMAN  = :writeman                                ');

            ParamByName('BOTYYMM').AsString     := e_botyymm.Text;
            ParamByName('BOTDATE').AsString     := e_botdate.Text;
            ParamByName('WORKEMP1').AsString    := e_workemp1.Text;
            ParamByName('WORKEMP2').AsString    := e_workemp2.Text;
            ParamByName('WRITETIME').AsString   := fn_GetDateTimeStr;
            ParamByName('WRITEMAN').AsString    := PEmpNo;

            ExecSQL;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if trim(E_empno.text) = '' then
       begin
            MessageBox(handle,'비서수당 대상자를 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_empno.SetFocus;
            exit;
       end;

       if trim(E_conempno.text) = ''  then
       begin
            MessageBox(handle,'비서수당 결재자를 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_conempno.SetFocus;
            exit;
       end;

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' UPDATE PKBOTEMP SET                                      ');
            Sql.Add('        CONEMPNO   = :conempno,                           ');
            Sql.Add('        WRITETIME  = :writetime,                          ');
            Sql.Add('        WRITEMAN   = :writeman                            ');
            SQL.Add('  where EMPNO      = :empno                               ');

            ParamByName('conempno'  ).AsString := E_conempno.empno;
            ParamByName('writetime' ).AsString := fn_GetDateTimeStr;
            ParamByName('writeman'  ).AsString := PEmpNo;

            ParamByName('empno'     ).AsString := E_empno.Hint;

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
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  Vempno   := Pempno;

  Application.ProcessMessages;

  //관리자 권한 이외에는 사용불가.
  if (Copy(Pgrade,3,1) > 'C') then
  begin
       MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
       Close;
  end;

  L_CurDate.Caption  := fn_GetDateStr;
  L_UserName.Caption := Pkorname+'('+PEmpno+')';
  Application.ProcessMessages;

  SB_1Click(SB_1);
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까?','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  if NoteBook1.ActivePage = 'P1' then
  begin
       if not oraquery.Eof then
       begin
            with oraquery do
            begin
                 e_botyymm.Text  := fieldbyname('BOTYYMM').asstring;
                 e_botdate.Text  := fieldbyname('BOTDATE').asstring;

                 e_workemp1.text := fieldbyname('WORKEMP1').asstring;
                 e_workemp2.text := fieldbyname('WORKEMP2').asstring;

                 e_botyymm1.Text  := fieldbyname('BOTYYMM').asstring;
                 e_botyymm2.Text  := fieldbyname('BOTYYMM').asstring;
            end;

            WorkMode := 2; { update mode }
       end
       else begin
            WorkMode     := 0;
            Clear_Fields;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if not oraquery.Eof then
       begin
            with oraquery do
            begin
                 E_empno.Text        := fieldbyname('empno'     ).asstring + ' - ' +
                                        fieldbyname('korname'   ).asstring;
                 E_empno.Hint        := fieldbyname('empno'     ).asstring;

                 E_conempno.Text     := fieldbyname('conempno'  ).asstring + ' - ' +
                                        fieldbyname('conkorname').asstring;
                 E_conempno.empno    := fieldbyname('conempno'  ).asstring;
            end;

            WorkMode := 2; { update mode }

            E_empno.enabled := false;
       end
       else begin
            WorkMode     := 0;
            Clear_Fields;
       end;
  end;
end;

procedure TMainForm.BBcancelClick(Sender: TObject);
begin
  open_grid;
end;

procedure TMainForm.BBdeleteClick(Sender: TObject);
begin
  if WorkMode = 2 then
  begin
       if ( IDYes = Application.MessageBox(' 현재 데이터를 삭제하시겠습니까? ', '확 인',MB_YESNO ) ) then
       begin
            Delete_Record;
            Open_Grid;
            P_Help.Caption := '';
       end;
  end
  else
       P_Help.Caption := '   등록된 자료에 한해서만 삭제 작업을 하실 수 있습니다...';
end;

procedure TMainForm.BBinsertClick(Sender: TObject);
begin
  WorkMode := 1;
  Clear_Fields;

  if NoteBook1.ActivePage = 'P2' then
  begin
       E_Empno.enabled    := true;

       E_Empno.SetFocus;
  end;
end;

procedure TMainForm.BBsaveClick(Sender: TObject);
begin
  if WorkMode = 2 then
  begin
       Update_Record;
       Open_Grid;
       System.Exit;
  end;

  if WorkMode = 1 then
  begin
       Insert_Record;
       Open_Grid;
       System.Exit;
  end;

  if WorkMode = 0 then
       P_Help.Caption := '   저장작업은 "입력"상태나 "수정"상태에서 가능합니다...';
end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;
  SB_4.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  if      TOnSkinButton(Sender).Name = 'SB_1' then
  begin
       BBexcel.Enabled  := False;
       BBmail.Visible   := False;

       BBinsert.Enabled := False;
       BBdelete.Enabled := False;
       BBsave.Enabled   := True;
       BBcancel.Enabled := True;
  end
  else if TOnSkinButton(Sender).Name = 'SB_2' then
  begin
       BBexcel.Enabled  := True;
       BBmail.Visible   := False;

       BBinsert.Enabled := True;
       BBdelete.Enabled := True;
       BBsave.Enabled   := True;
       BBcancel.Enabled := True;
  end
  else if TOnSkinButton(Sender).Name = 'SB_3' then
  begin
       BBexcel.Enabled  := True;
       BBmail.Visible   := True;

       BBinsert.Enabled := False;
       BBdelete.Enabled := False;
       BBsave.Enabled   := False;
       BBcancel.Enabled := False;
  end
  else if TOnSkinButton(Sender).Name = 'SB_4' then
  begin
       BBexcel.Enabled  := True;
       BBmail.Visible   := False;

       BBinsert.Enabled := False;
       BBdelete.Enabled := False;
       BBsave.Enabled   := False;
       BBcancel.Enabled := False;
  end;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
  open_grid;
end;

procedure TMainForm.BBexcelClick(Sender: TObject);
var XL, XArr   : Variant;
    i, j, k    : integer;
    SavePlace  : TBookmark;
begin
  P_Help.Caption :=' 엑셀 변환할 자료를 검색중입니다.';

  if OraQuery.RecordCount < 1 then
  begin
       P_Help.Caption :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  P_Help.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, OraQuery.Fields.Count], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      P_Help.Caption := '';
      Exit;
  end;

  P_Help.Caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add;                                 //새로운 페이지 생성
  XL.Visible := false;
  if      Notebook1.ActivePage = 'P2' then
       XL.WorkSheets[1].Name := '비서수당 대사자'                            //시트명 부여
  else if Notebook1.ActivePage = 'P3' then
       XL.WorkSheets[1].Name := '개인별 비서수당 합계_'+E_botyymm1.Text      //시트명 부여
  else if Notebook1.ActivePage = 'P4' then
       XL.WorkSheets[1].Name := '개인별 등록 이력_'+E_botyymm2.Text;         //시트명 부여

  //TITLE NAME 설정
  //XL.Range['A1'].value := '';
  //XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to OraQuery.Fields.Count do
  begin
       if Notebook1.ActivePage = 'P2' then
            XArr[i]  := OnGrDbGrid2.Columns[i-1].Title.Caption
       else if Notebook1.ActivePage = 'P3' then
            XArr[i]  := OnGrDbGrid3.Columns[i-1].Title.Caption
       else if Notebook1.ActivePage = 'P4' then
            XArr[i]  := OnGrDbGrid4.Columns[i-1].Title.Caption;
  end;

  XL.Range['A1', CHR(64 + OraQuery.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
  k := 1;
  for i := 1 to OraQuery.Fields.Count do     //Gird 출력시
  begin
       XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '1'].font.Size := 9;
       XL.Range[CHR(64 + i) + '1'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := OraQuery.GetBookmark;
  OraQuery.DisableControls;
  OraQuery.First;

  for i := 1 to OraQuery.RecordCount do
  begin
       for j := 1 to OraQuery.Fields.Count do
       begin
            XArr[j]  := OraQuery.Fields[j-1].AsString;
       end;
       
       XL.Range['A' + IntToStr(k+1), CHR(64 + OraQuery.Fields.Count) + IntToStr(k+1)].Value := XArr;
       inc(k);
       OraQuery.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;                                            //가운데 정렬
  XL.Range['A2', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].font.Size := 9;
  XL.Range['A2', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['A1', CHR(64 + OraQuery.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                                             //자동정렬
  XL.Range['A2', 'A2'].Select;                                                              //A2열에 커서 위치시킴
  XL.Visible := true;                                                                       //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  OraQuery.GotoBookmark(SavePlace);
  OraQuery.FreeBookmark(SavePlace);
  OraQuery.EnableControls;
  P_Help.Caption := '추출 완료';
end;


procedure TMainForm.E_empnoInitPopup(Sender: TObject);
begin
  Fm_Emp.Edit          := TOnWinPopupEdit(Sender);
  Fm_Emp.E_Search.Text := '';
  Fm_Emp.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TMainForm.E_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_Emp.empno <> '' then
  begin
       E_empno.Text             := Fm_Emp.empno + ' - ' + Fm_Emp.Korname;
       E_empno.Hint             := Fm_Emp.empno;
       E_conempno.Text          := Fm_Emp.Eempno + ' - ' + Fm_Emp.EKorname;
       E_conempno.empno         := Fm_Emp.Eempno;
  end;
end;

procedure TMainForm.E_botyymm1Click(Sender: TObject);
begin
  Try
       MonthForm := TMonthForm.Create(Application);
       MonthForm.rDayCaption := TOnMaskEdit(Sender).Text;
       MonthForm.ShowModal;
       TOnMaskEdit(Sender).Text := MonthForm.DayCaption; //Copy(MonthForm.DayCaption,1,4)+ '-'+ Copy(MonthForm.DayCaption,5,2);
  Finally
       MonthForm.Free;
  End;
end;

procedure TMainForm.R_conyn1Click(Sender: TObject);
begin
  if R_Conyn1.Checked then
       BBmail.Enabled := True
  else
       BBmail.Enabled := False;
  open_grid;
end;

procedure TMainForm.BBmailClick(Sender: TObject);
var
     i          : integer;
     SavePlace  : TBookmark;
begin
  P_Help.Caption  := '';

  if OraQuery.RecordCount < 1 then
  begin
       MessageDlg('조회된 미결재 내역이 없습니다.', MtWarning, [mbok], 0);
       system.Exit;
  end;

  if ( IDYes = Application.MessageBox('조회된 미결재 내역의 결재권자에게 메일을 전송하시겠습니까? ', '확 인',MB_YESNO ) ) then
  begin
       SavePlace := OraQuery.GetBookmark;
       OraQuery.DisableControls;

       OraQuery.First;

       for i := 1 to OraQuery.RecordCount do
       begin
            //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
            SendProgID  := 'PKA5010A';
            SendEmpno   := Pempno;
            RcveEmpno   := OraQuery.FieldByName('CONEMPNO').AsString;
            {2017.10.31 jissi 메일내역의 경로문구 변경
            MailSubject := '[비서수당 결재를 요청드립니다.]';
            MailBody    := copy(E_botyymm1.Text,1,4)+'년 '+copy(E_botyymm1.Text,5,2)+'월 '+
                           OraQuery.FieldByName('EMPNO').AsString+'-'+OraQuery.FieldByName('KORNAME').AsString+
                           ' 사원의 비서수당 결재를 요청 드립니다.'+#13+#13+#13+
                           '종합인사시스템 - 인사/인력개발 - 근태/초과근무/휴가 - 비서수당 등록 및 결재';
            }
            MailSubject := '[비서수당 결재를 요청드립니다.]';
            MailBody    := copy(E_botyymm1.Text,1,4)+'년 '+copy(E_botyymm1.Text,5,2)+'월 '+
                           OraQuery.FieldByName('EMPNO').AsString+'-'+OraQuery.FieldByName('KORNAME').AsString+
                           ' 사원의 비서수당 결재를 요청 드립니다.'+#13+#13+#13+
                           '위치 : My HR -> 급여 -> 초과근무';
            ReceiveYN   := 'N';
            //if ChkReceive.Checked then ReceiveYN := 'Y';

            if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            begin
                 MessageDlg('사원 '+OraQuery.FieldByName('EMPNO').AsString+'-'+OraQuery.FieldByName('KORNAME').AsString+
                            '의 결재권자 '+RcveEmpno+'-'+OraQuery.FieldByName('CONKORNAME').AsString+
                            '에게 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                 exit;
            end;
            //////////////////////////////////////////////////////////////////////////////
            OraQuery.next;
       end; //end of for

       OraQuery.GotoBookmark(SavePlace);
       OraQuery.FreeBookmark(SavePlace);
       OraQuery.EnableControls;

       MessageDlg('제목:'+MailSubject+#13+
                  MailBody+#13+
                  '사원의 결재권자에게 메일 전송하였습니다...',mtInformation,[mbOk], 0);

       P_Help.Caption := '메일이 성공적으로 발송되었습니다';
  end;
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with tmp_oraqry do
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

end.


