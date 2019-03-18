unit PKG3020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids, Fempno,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn, OnFocusButton;
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
    SB_2: TOnSkinButton;
    SB_1: TOnSkinButton;
    Panel11: TPanel;
    SF_Main: TOnSchemeForm;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    E_dutydate2: TOnMaskEdit;
    E_bigo2: TOnEdit;
    OnGrDbGrid2: TOnGrDbGrid;
    Panel1: TPanel;
    E_dutydate1: TOnMaskEdit;
    E_bigo1: TOnEdit;
    E_Empno2: TOnPersonPopupEdit;
    E_empno1: TOnPersonPopupEdit;
    OnGrDbGrid1: TOnGrDbGrid;
    BBbatch: TOnFocusButton;
    BBexcel: TOnFocusButton;
    E_schdutydate1: TOnMaskEdit;
    E_schempno1: TOnPersonPopupEdit;
    Sb_Sch1: TOnFocusButton;
    E_schdutydate2: TOnMaskEdit;
    E_schempno2: TOnPersonPopupEdit;
    Sb_sch2: TOnFocusButton;
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
    procedure BBbatchClick(Sender: TObject);
    procedure Sb_Sch1Click(Sender: TObject);
  private
    { Private declarations }

  public
    Vempno      : String;
    procedure clear_fields;
    procedure open_grid;
    procedure delete_record;
    procedure insert_record;
    procedure update_record;
    Function  Check_Holidate(dutydate : String) : Boolean;
    { Public declarations }


  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;


implementation

uses PKG3020A2;

{$R *.DFM}

procedure TMainForm.clear_fields;
begin
  if Notebook1.ActivePage = 'P1' then
  begin
       E_dutydate1.Enabled := False;
       E_empno1.Enabled    := False;
       E_bigo1.Enabled     := False;

       E_dutydate1.Text    := '';
       E_empno1.Text       := '';
       E_bigo1.Text        := '';
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       E_dutydate2.Enabled := False;
       E_empno2.Enabled    := False;
       E_bigo2.Enabled     := False;

       E_dutydate2.Text    := '';
       E_empno2.Text       := '';
       E_bigo2.Text        := '';
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
            Sql.Add('  SELECT DUTYDATE, EMPNO,                                     ');
            Sql.Add('         (SELECT KORNAME FROM PIMPMAS                         ');
            Sql.Add('           WHERE EMPNO = A.EMPNO) KORNAME,                    ');
            Sql.Add('         BIGO                                                 ');
            Sql.Add('    FROM PKHOLIEMP A                                          ');
            Sql.Add('   WHERE DUKIND   = ''00''                                    ');
            if E_schdutydate1.Text <> '' then
                 Sql.Add('AND DUTYDATE = '''+E_schdutydate1.Text+'''               ');
            if trim(E_schempno1.Text) <> '' then
                 Sql.Add('AND EMPNO like '''+Copy(E_schempno1.Text,1,4)+'''||''%'' ');

            Sql.Add('  Order by substr(DUTYDATE,1,4) desc, 1, 2, 3                 ');
            Open;

            fieldbyname('DUTYDATE' ).Alignment := taCenter;
            fieldbyname('EMPNO'   ).Alignment  := taCenter;
            fieldbyname('KORNAME' ).Alignment  := taCenter;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       with OraQuery do
       begin
            Close;
            Sql.Clear;
            Sql.Add('  SELECT DUTYDATE, EMPNO,                                     ');
            Sql.Add('         (SELECT KORNAME FROM PIMPMAS                         ');
            Sql.Add('           WHERE EMPNO = A.EMPNO) KORNAME,                    ');
            Sql.Add('         BIGO                                                 ');
            Sql.Add('    FROM PKHOLIEMP A                                          ');
            Sql.Add('   WHERE DUKIND   = ''49''                                    ');
            if E_schdutydate2.Text <> '' then
                 Sql.Add('AND DUTYDATE = '''+E_schdutydate2.Text+'''               ');
            if trim(E_schempno2.Text) <> '' then
                 Sql.Add('AND EMPNO like '''+Copy(E_schempno2.Text,1,4)+'''||''%'' ');
            Sql.Add('  Order by substr(DUTYDATE,1,4) desc, 1, 2, 3                 ');
            Open;

            fieldbyname('DUTYDATE' ).Alignment := taCenter;
            fieldbyname('EMPNO'   ).Alignment  := taCenter;
            fieldbyname('KORNAME' ).Alignment  := taCenter;
       end;
  end;
end;

procedure TMainForm.delete_record;
begin
  if      Notebook1.ActivePage = 'P1' then
  begin
       with tmp_oraqry do
       begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM PKHOLIEMP                           ');
            SQL.Add(' WHERE DUKIND   = ''00''                        ');
            SQL.Add('   AND DUTYDATE = :dutydate                     ');
            SQL.Add('   AND EMPNO    = :empno                        ');

            ParamByName('dutydate').AsString := E_dutydate1.Text;
            ParamByName('empno'   ).AsString := copy(E_empno1.Text,1,4);

            ExecSQL;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       with tmp_oraqry do
       begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM PKHOLIEMP                           ');
            SQL.Add(' WHERE DUKIND   = ''49''                        ');
            SQL.Add('   AND DUTYDATE = :dutydate                     ');
            SQL.Add('   AND EMPNO    = :empno                        ');

            ParamByName('dutydate').AsString := E_dutydate2.Text;
            ParamByName('empno'   ).AsString := copy(E_empno2.Text,1,4);

            ExecSQL;
       end;
  end;
  P_Help.Caption := '   데이터가 삭제되었습니다...';
  Open_Grid;
end;

procedure TMainForm.insert_record;
begin
  if Notebook1.ActivePage = 'P1' then
  begin
       if not Check_Holidate(E_dutydate1.Text) then
       begin
            MessageBox(handle,'일자가 휴일이 아닙니다.','자료오류',MB_OK);
            E_dutydate1.SetFocus;
            exit;
       end;

       if trim(E_Empno1.text) = '' then
       begin
            MessageBox(handle,'특이자 사번을 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_empno1.SetFocus;
            exit;
       end;

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' INSERT  INTO  PKHOLIEMP                                    ');
            Sql.Add('        ( DUTYDATE,   EMPNO,    DUKIND,    BIGO,            ');
            Sql.Add('          WRITETIME,  WRITEMAN)                             ');
            Sql.Add(' VALUES (:dutydate,:empno,  ''00'', :bigo,                  ');
            Sql.Add('         TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), :writeman) ');

            ParamByName('dutydate').AsString := E_dutydate1.Text;
            ParamByName('empno'  ).AsString  := copy(E_empno1.Text,1,4);
            ParamByName('bigo'    ).AsString := E_bigo1.Text;
            ParamByName('writeman').AsString := PEmpNo;

            ExecSQL;
       end;
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       if Check_Holidate(E_dutydate2.Text) then
       begin
            MessageBox(handle,'일자가 평일이 아닙니다.','자료오류',MB_OK);
            E_dutydate2.SetFocus;
            exit;
       end;

       if trim(E_Empno2.text) = '' then
       begin
            MessageBox(handle,'특이자 사번을 반드시 입력하셔야 합니다.','자료오류',MB_OK);
            E_empno2.SetFocus;
            exit;
       end;

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(' INSERT  INTO  PKHOLIEMP                                    ');
            Sql.Add('        ( DUTYDATE,   EMPNO,    DUKIND,    BIGO,            ');
            Sql.Add('          WRITETIME,  WRITEMAN)                             ');
            Sql.Add(' VALUES (:dutydate,:empno,  ''49'', :bigo,                  ');
            Sql.Add('         TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), :writeman) ');

            ParamByName('dutydate').AsString := E_dutydate2.Text;
            ParamByName('empno'   ).AsString := copy(E_empno2.Text,1,4);
            ParamByName('bigo'    ).AsString := E_bigo2.Text;
            ParamByName('writeman').AsString := PEmpNo;

            ExecSQL;
       end;
  end;
  P_Help.Caption := '   새로운 데이터가 입력되었습니다...';
  Open_Grid;
end;

procedure TMainForm.update_record;
begin
  if NoteBook1.ActivePage = 'P1' then
  begin
       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PKHOLIEMP                                            ');
            Sql.Add('   SET BIGO      = :bigo,                                   ');
            Sql.Add('       WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''),  ');
            Sql.Add('       WRITEMAN  = :writeman                                ');
            SQL.Add(' WHERE DUKIND    = ''00''                                   ');
            SQL.Add('   AND DUTYDATE  = :dutydate                                ');
            SQL.Add('   AND EMPNO     = :empno                                   ');

            ParamByName('dutydate').AsString := E_dutydate1.Text;
            ParamByName('empno'   ).AsString := copy(E_empno1.Text,1,4);
            ParamByName('bigo'    ).AsString := E_bigo1.Text;
            ParamByName('writeman').AsString := PEmpNo;

            ExecSQL;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE PKHOLIEMP                                            ');
            Sql.Add('   SET BIGO      = :bigo,                                   ');
            Sql.Add('       WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''),  ');
            Sql.Add('       WRITEMAN  = :writeman                                ');
            SQL.Add(' WHERE DUKIND    = ''49''                                   ');
            SQL.Add('   AND DUTYDATE  = :dutydate                                ');
            SQL.Add('   AND EMPNO     = :empno                                   ');

            ParamByName('dutydate').AsString := E_dutydate2.Text;
            ParamByName('empno'  ).AsString  := copy(E_empno2.Text,1,4);
            ParamByName('bigo'    ).AsString := E_bigo2.Text;
            ParamByName('writeman').AsString := PEmpNo;

            ExecSQL;
       end;
  end;
  P_Help.Caption := '   내용이 변경되었습니다...';
  Open_Grid;
end;

Function TMainForm.Check_Holidate(dutydate : String) : Boolean;
var
  tem : string;
begin
  result := False;
  Tem := ' SELECT HOLIDATE          ' +
         '   FROM PKCHOLI           ' +
  Format('  WHERE HOLIDATE = ''%s'' ',[dutydate]);

  with tmp_oraqry do
  begin
       Close;
       Sql.Clear;
       Sql.Add(Tem);
       Open;
  end;

  if tmp_oraqry.RecordCount > 0 then
       result := True
  else
  begin
       Tem := ' SELECT TO_CHAR(TO_DATE('''+dutydate+''',''YYYYMMDD''),''D'') dday  FROM dual';

       with tmp_oraqry do
       begin
            Close;
            Sql.Clear;
            Sql.Add(Tem);
            Open;
       end;

       if (tmp_oraqry.fields[0].Asinteger = 1) or     //주일
          (tmp_oraqry.fields[0].Asinteger = 7) then   //토요일
       begin
            result := True;
       end
       else
       begin
            result := False;
       end;
  end;

  tmp_oraqry.Close;
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

  E_schempno1.Session := Ora_Session;
  E_schempno2.Session := Ora_Session;
  E_empno1.Session    := Ora_Session;
  E_empno2.Session    := Ora_Session;

  // PSTATE 7C 사용으로 SQL 에러 발생으로 수정 - Lee SangMoon 2018.03.20
  E_schempno1.Sql := ' Select empno, korname, paycl, payra, orgnum, deptcode, pstate, paydunm, empdate,                '+#13+
                     '        (Select codename From pyccode Where codeid=''I113'' and A.payra =codeno    ) payraname,  '+#13+
                     '        (Select codename From pyccode Where codeid=''I112'' and A.paycl =codeno    ) payclname,  '+#13+
                     '        (Select deptname From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptname,   '+#13+
                     '        (Select deptna3  From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptna3     '+#13+
                     '  From pimpmas  A                                                                                '+#13+
                     ' Where ( Empno LIKE ''%s'' or Korname LIKE ''%s'' )                                              '+#13+
                     '   And ( EMPNO in (Select empno from PKHOLIEMP where dukind = ''00''))                           '+#13+
                     //' Order By decode(sign(pstate-81),1, ''80'', pstate), 5,6, empno                                  ';
                     ' Order By pstate, 5,6, empno                                                                      ';

  E_schempno2.Sql := ' Select empno, korname, paycl, payra, orgnum, deptcode, pstate, paydunm, empdate,                '+#13+
                     '        (Select codename From pyccode Where codeid=''I113'' and A.payra =codeno    ) payraname,  '+#13+
                     '        (Select codename From pyccode Where codeid=''I112'' and A.paycl =codeno    ) payclname,  '+#13+
                     '        (Select deptname From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptname,   '+#13+
                     '        (Select deptna3  From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptna3     '+#13+
                     '  From pimpmas  A                                                                                '+#13+
                     ' Where ( Empno LIKE ''%s'' or Korname LIKE ''%s'' )                                              '+#13+
                     '   And ( EMPNO in (Select empno from PKHOLIEMP where dukind = ''49''))                           '+#13+
                     //' Order By decode(sign(pstate-81),1, ''80'', pstate), 5,6,empno                                   ';
                     ' Order By pstate, 5,6,empno                                                                      ';

  E_empno1.Sql    := ' Select empno, korname, paycl, payra, orgnum, deptcode, pstate, paydunm, empdate,                '+#13+
                     '        (Select codename From pyccode Where codeid=''I113'' and A.payra =codeno    ) payraname,  '+#13+
                     '        (Select codename From pyccode Where codeid=''I112'' and A.paycl =codeno    ) payclname,  '+#13+
                     '        (Select deptname From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptname,   '+#13+
                     '        (Select deptna3  From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptna3     '+#13+
                     '  From pimpmas  A                                                                                '+#13+
                     ' Where ( Empno LIKE ''%s'' or Korname LIKE ''%s'' )                                              '+#13+
                     //' Order By decode(sign(pstate-81),1, ''80'', pstate), empno                                       ';
                     ' Order By pstate, 5,6,empno                                                                      ';

  E_empno2.Sql    := ' Select empno, korname, paycl, payra, orgnum, deptcode, pstate, paydunm, empdate,                '+#13+
                     '        (Select codename From pyccode Where codeid=''I113'' and A.payra =codeno    ) payraname,  '+#13+
                     '        (Select codename From pyccode Where codeid=''I112'' and A.paycl =codeno    ) payclname,  '+#13+
                     '        (Select deptname From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptname,   '+#13+
                     '        (Select deptna3  From pycdept Where orgnum=A.orgnum and deptcode=A.deptcode) deptna3     '+#13+
                     '  From pimpmas  A                                                                                '+#13+
                     ' Where ( Empno LIKE ''%s'' or Korname LIKE ''%s'' )                                              '+#13+
                     //' Order By decode(sign(pstate-81),1, ''80'', pstate), empno                                       ';
                     ' Order By pstate, 5,6,empno                                                                      ';


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
                 E_dutydate1.Text := fieldbyname('DUTYDATE').asstring;
                 E_empno1.Text    := fieldbyname('EMPNO').asstring + ' - '+
                                     fieldbyname('KORNAME').asstring;
                 E_bigo1.Text     := fieldbyname('BIGO').asstring;
            end;

            WorkMode              := 2; { update mode }

            E_dutydate1.enabled   := false;
            E_empno1.enabled      := false;
            E_bigo1.enabled       := true;
       end
       else
       begin
            WorkMode              := 0;
            Clear_Fields;
       end;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       if not oraquery.Eof then
       begin
            with oraquery do
            begin
                 E_dutydate2.Text := fieldbyname('DUTYDATE').asstring;
                 E_empno2.Text    := fieldbyname('EMPNO').asstring + ' - '+
                                     fieldbyname('KORNAME').asstring;
                 E_bigo2.Text     := fieldbyname('BIGO').asstring;
            end;

            WorkMode              := 2; { update mode }

            E_dutydate2.enabled   := false;
            E_empno2.enabled      := false;
            E_bigo2.enabled       := true;
       end
       else
       begin
            WorkMode              := 0;
            Clear_Fields;
       end;
  end;
end;

procedure TMainForm.BBcancelClick(Sender: TObject);
begin
  if   NoteBook1.ActivePage = 'P1' then
  begin
       E_schdutydate1.Text := '';
       E_schempno1.Text    := '';
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       E_schdutydate2.Text := '';
       E_schempno2.Text    := '';
  end;
  open_grid;
  P_Help.Caption := ' ';
end;

procedure TMainForm.BBdeleteClick(Sender: TObject);
begin
  if WorkMode = 2 then
  begin
       if ( IDYes = Application.MessageBox(' 현재 데이터를 삭제하시겠습니까? ', '확 인',MB_YESNO ) ) then
       begin
            Delete_Record;
       end;
  end
  else
       P_Help.Caption := '   등록된 자료에 한해서만 삭제 작업을 하실 수 있습니다...';
end;

procedure TMainForm.BBinsertClick(Sender: TObject);
begin
  WorkMode := 1;
  Clear_Fields;

  if      NoteBook1.ActivePage = 'P1' then
  begin
       E_dutydate1.enabled := true;
       E_empno1.enabled    := true;
       E_bigo1.enabled     := true;

       E_dutydate1.SetFocus;
  end
  else if NoteBook1.ActivePage = 'P2' then
  begin
       E_dutydate2.enabled := true;
       E_empno2.enabled    := true;
       E_bigo2.enabled     := true;

       E_dutydate2.SetFocus;
  end;
end;

procedure TMainForm.BBsaveClick(Sender: TObject);
begin
  if WorkMode = 2 then
  begin
       Update_Record;

       System.Exit;
  end;

  if WorkMode = 1 then
  begin
       Insert_Record;

       System.Exit;
  end;

  if WorkMode = 0 then
       P_Help.Caption := '   저장작업은 "입력"상태나 "수정"상태에서 가능합니다...';
end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  BBexcel.Enabled  := True;
  BBinsert.Enabled := True;
  BBdelete.Enabled := True;
  BBsave.Enabled   := True;
  BBcancel.Enabled := True;

  Application.ProcessMessages;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);
  BBexcel.Caption := TOnSkinButton(Sender).Caption +' 엑셀추출';
  BBbatch.Caption := TOnSkinButton(Sender).Caption +' 일괄처리';

  BBcancelClick(Sender);
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

  //시트명 부여
  if      Notebook1.ActivePage = 'P1' then
  begin
       if      (trim(E_schdutydate1.Text) =  '') and (trim(E_schempno1.Text) =  '') then
            XL.WorkSheets[1].Name := SB_1.Caption+'_전체'
       else if (trim(E_schdutydate1.Text) =  '') and (trim(E_schempno1.Text) <> '') then
            XL.WorkSheets[1].Name := SB_1.Caption+'_'+copy(E_schempno1.Text,1,4)
       else if (trim(E_schdutydate1.Text) <> '') and (trim(E_schempno1.Text) =  '') then
            XL.WorkSheets[1].Name := SB_1.Caption+'_'+E_schdutydate1.Text
       else if (trim(E_schdutydate1.Text) <> '') and (trim(E_schempno1.Text) <> '') then
            XL.WorkSheets[1].Name := SB_1.Caption+'_'+E_schdutydate1.Text+'_'+copy(E_schempno1.Text,1,4);
  end
  else if Notebook1.ActivePage = 'P2' then
  begin
       if      (trim(E_schdutydate2.Text) =  '') and (trim(E_schempno2.Text) =  '') then
            XL.WorkSheets[1].Name := SB_2.Caption+'_전체'
       else if (trim(E_schdutydate2.Text) =  '') and (trim(E_schempno2.Text) <> '') then
            XL.WorkSheets[1].Name := SB_2.Caption+'_'+copy(E_schempno2.Text,1,4)
       else if (trim(E_schdutydate2.Text) <> '') and (trim(E_schempno2.Text) =  '') then
            XL.WorkSheets[1].Name := SB_2.Caption+'_'+E_schdutydate2.Text
       else if (trim(E_schdutydate2.Text) <> '') and (trim(E_schempno2.Text) <> '') then
            XL.WorkSheets[1].Name := SB_2.Caption+'_'+E_schdutydate2.Text+'_'+copy(E_schempno2.Text,1,4);
  end;

  //TITLE NAME 설정
  //XL.Range['A1'].value := '';
  //XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to OraQuery.Fields.Count do
  begin
       if      Notebook1.ActivePage = 'P1' then
            XArr[i]  := OnGrDbGrid1.Columns[i-1].Title.Caption
       else if Notebook1.ActivePage = 'P2' then
            XArr[i]  := OnGrDbGrid2.Columns[i-1].Title.Caption;
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
            if j = 2 then
                 XArr[j]  := ''''+OraQuery.Fields[j-1].AsString
            else
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

procedure TMainForm.BBbatchClick(Sender: TObject);
begin
  Application.CreateForm(TFM_Batch, FM_Batch);

  try
       if Notebook1.ActivePage = 'P1' then
       begin
            FM_Batch.Tag                := 1;
            FM_Batch.E_example1.Visible := true;
            FM_Batch.E_example2.Visible := false;
       end
       else if Notebook1.ActivePage = 'P2' then
       begin
            FM_Batch.Tag                := 2;
            FM_Batch.E_example1.Visible := false;
            FM_Batch.E_example2.Visible := true;
       end;

       FM_Batch.P_Title.Caption := BBbatch.Caption;
       FM_Batch.ShowModal;
  finally
       FM_Batch.Free;
       BBcancelClick(Sender);
  end;
end;

procedure TMainForm.Sb_Sch1Click(Sender: TObject);
begin
  open_grid;
end;

end.


