unit pka40410;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn,
  OnFocusButton, OnDBGrid, OnShapeLabel, Tmax_DataSetText, Tmax_session, OnInsaCommon;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    OnShapeLabel7: TOnShapeLabel;
    s_empno: TOnWinPopupEdit;
    s_deptcode: TOnWinPopupEdit;
    btn_search: TOnFocusButton;
    btn_add: TOnFocusButton;
    btn_save: TOnFocusButton;
    btn_del: TOnFocusButton;
    BT_exit: TOnFocusButton;
    btn_excel: TOnFocusButton;
    ora_pimeemp: TOraQuery;
    ds_pimeemp: TDataSource;
    OnGrDbGrid1: TOnGrDbGrid;
    grid_dept: TOnGrDbGrid;
    Panel25: TPanel;
    e_bigo: TMemo;
    Ora_pimeempfix: TOraQuery;
    ds_pimeempfix: TDataSource;
    OraQuery1: TOraQuery;
    btn_apply: TOnFocusButton;
    e_jobdept: TOnWinPopupEdit;
    e_jobdeptname: TOnEdit;
    e_eempno: TOnWinPopupEdit;
    e_useyn: TOnComboEdit;
    OnShapeLabel1: TOnShapeLabel;
    s_useyn: TOnEdit;
    use_Yes: TRadioButton;
    use_No: TRadioButton;
    use_All: TRadioButton;
    sfix_orgnum: TOnEdit;
    OnShapeLabel2: TOnShapeLabel;
    e_ekorname: TOnEdit;
    e_eorgnum: TOnEdit;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    SB_Help: TStatusBar;
    s_eempno: TOnWinPopupEdit;
    sfix_eempno: TOnWinPopupEdit;
    sfix_jobdept: TOnWinPopupEdit;
    procedure BT_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure s_empnoInitPopup(Sender: TObject);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure s_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure s_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
    procedure ds_pimeempfixDataChange(Sender: TObject; Field: TField);
    procedure btn_addClick(Sender: TObject);
    procedure e_eempnoInitPopup(Sender: TObject);
    procedure e_eempnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure e_jobdeptInitPopup(Sender: TObject);
    procedure e_jobdeptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure btn_applyClick(Sender: TObject);
    procedure s_eempnoInitPopup(Sender: TObject);
    procedure s_eempnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure sfix_eempnoInitPopup(Sender: TObject);
    procedure sfix_eempnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure sfix_jobdeptInitPopup(Sender: TObject);
    procedure sfix_jobdeptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    InsertMode    : boolean;
    HyunOrgNum    : String;
    ProgId, CmdStr   : String;  //���� ����...  
    procedure clear_fields;    
    procedure search_pimeemp;
    procedure search_pimeempfix;
    procedure excel_pimeemp;
    procedure excel_pimeempfix;
    procedure save_pimeempfix;
    procedure delete_pimeempfix;
  end;

var
  MainForm: TMainForm;

implementation

uses PKA40411, PKA40412;

{$R *.DFM}

procedure TMainForm.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
     FL_Date : String;
     FL_Sql  : String;
     FL_IDate: Integer;
begin
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  Application.ProcessMessages;

  //2016.05.16.hjku.. ������ ���� �̿ܿ��� ���Ұ�.. ����ȣM
  //����ȣ/HR��/SK ��ε��� ���� ��
  //�� ����� ������ �� �����ؼ� HR�� �̸���, ������, ������, ȫ����M �̷��� 5������ �ο��� �ּ���~

  if not((Copy(Pgrade,3,1) <= 'C') and
         ((Pempno='1884') or
          (Pempno='2684') or
          (Pempno='2128') or
          (Pempno='2325') or
          (Pempno='2563') or
          //�ڸ���M ��û���� �ڸ���M ���� �߰� - 2017.12.28 SangMoon Lee
          (Pempno='2317') or
          (copy(Pempno,1,1)='D')))
  then
  begin
    ShowMessage('������ ������ �����ϴ�. ���α׷��� �����մϴ�.');
    Application.Terminate;
    Exit;
  end;

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.Connect     := False;
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  try
       TMaxSession.Connect := True;
  except
       Application.MessageBox(PChar('�����λ� APP���� ���� ����'),'����',mb_ok);
       Application.Terminate;
       Exit;
  end;

  OraQuery1.Close;
  OraQuery1.SQL.Clear;
  OraQuery1.SQL.Add(' select value1  from pimvari      ' +
                    '  where gubun  = ''00''           ' +
                    '    and sgubun = ''0001''         ');
  OraQuery1.Open;
  HyunOrgNum := OraQuery1.FieldByName('value1').AsString;

  sfix_orgnum.Text := HyunOrgNum;
end;

procedure TMainForm.s_empnoInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TMainForm.s_deptcodeInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TMainForm.s_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if DeptForm.GSdeptcode <> '' then
    begin
        s_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;

        //Retrieve;
    end;
end;

procedure TMainForm.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
      // Retrieve;
  end;
end;

procedure TMainForm.s_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       //Retrieve;
  end;
end;

procedure TMainForm.s_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       s_empno.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;

       //Retrieve;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    InsertMode := false;

    use_Yes.Checked    := true;
    use_No.Checked     := false;
    use_All.Checked    := false;
    
    pageControl1.ActivePage := Tabsheet1;
    pageControl1Change(nil);
end;

procedure TMainForm.clear_fields;
begin
  if pageControl1.ActivePage = Tabsheet1 then
  begin
  end
  else if pageControl1.ActivePage = Tabsheet2 then
  begin
    e_eorgnum.text     := '';
    e_eempno.text      := '';
    e_ekorname.text    := '';
    e_jobdept.text     := '';
    e_jobdeptname.text := '';

    e_useyn.text       := 'Y';
    e_bigo.text        := '';



    e_jobdept.Enabled  := false;    
  end
  ;
end;

procedure TMainForm.btn_searchClick(Sender: TObject);
begin
    clear_fields;

    InsertMode := false;

    btn_search.enabled := true;
    btn_add.enabled    := true;
    btn_save.enabled   := true;
    btn_del.enabled    := true;
    btn_excel.Enabled  := true;
    btn_apply.Enabled  := false;

    if pageControl1.ActivePage = Tabsheet1 then
    begin
        btn_add.enabled    := false;
        btn_save.enabled   := false;
        btn_del.enabled    := false;
    end
    else if pageControl1.ActivePage = Tabsheet2 then
    begin
        btn_apply.Enabled  := true;
    end;

    if      pageControl1.ActivePage = Tabsheet1 then search_pimeemp
    else if pageControl1.ActivePage = Tabsheet2 then search_pimeempfix
    ;
    
    SB_help.Panels[1].Text := '';
end;

procedure TMainForm.search_pimeemp;
begin
  with ora_pimeemp do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT  A.EMPNO                                                                                         ');
    Sql.Add('       ,A.KORNAME                                                                                       ');
    Sql.Add('       ,PAYRA                                                                                           ');
    Sql.Add('       ,(SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND A.PAYRA = PYCCODE.CODENO) PAYRANM     ');
    Sql.Add('       ,A.ORGNUM                                                                                        ');
    Sql.Add('       ,A.JOBDEPT                                                                                       ');
    Sql.Add('       ,B.DEPTNAME                                                                                      ');
    Sql.Add('       ,A.EEMPNO                                                                                        ');
    Sql.Add('       ,A.EKORNAME                                                                                      ');
    Sql.Add('       ,EPAYRA                                                                                          ');
    Sql.Add('       ,(SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND A.EPAYRA = PYCCODE.CODENO) EPAYRANM   ');
    Sql.Add('       ,A.EORGNUM                                                                                       ');
    Sql.Add('       ,A.EJOBDEPT                                                                                      ');
    Sql.Add('       ,C.DEPTNAME EDEPTNAME                                                                            ');
    Sql.Add('  FROM PIMEEMP A, PYCDEPT B, PYCDEPT C                                                                  ');
    Sql.Add(' WHERE A.ORGNUM    = B.ORGNUM                                                                           ');
    Sql.Add('   AND A.JOBDEPT   = B.DEPTCODE                                                                         ');
    Sql.Add('   AND A.EORGNUM   = C.ORGNUM                                                                           ');
    Sql.Add('   AND A.EDEPTCODE = C.DEPTCODE                                                                         ');
    if(s_empno.text <> '') then
      SQL.Add(' AND A.EMPNO LIKE   ''' + trim(copy(s_empno.text,1,4))   + '%''   ');

    if(s_eempno.text <> '') then
      SQL.Add(' AND A.EEMPNO LIKE  ''' + trim(copy(s_eempno.text,1,4))   + '%''  ');

    if(s_deptcode.text <> '') then
      SQL.Add(' AND A.JOBDEPT LIKE ''' + trim(copy(s_deptcode.text,1,6)) + '%''  ');

    Sql.Add('  ORDER BY A.JOBDEPT, a.EMPNO                                       ');

    Open;
  end;
end;

procedure TMainForm.search_pimeempfix;
begin
  with Ora_pimeempfix do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT  A.EORGNUM                                                                                       ');
    Sql.Add('       ,A.EEMPNO                                                                                        ');
    Sql.Add('       ,C.KORNAME EKORNAME                                                                              ');
    Sql.Add('       ,A.EJOBDEPT                                                                                      ');
    Sql.Add('       ,B.DEPTNAME                                                                                      ');
    Sql.Add('       ,A.USEYN                                                                                         ');
    Sql.Add('       ,A.BIGO                                                                                          ');
    Sql.Add('       ,A.WRITETIME                                                                                     ');
    Sql.Add('       ,A.WRITEEMP                                                                                      ');
    Sql.Add('  FROM PIMEEMPFIX A, PYCDEPT B, PIMPMAS C                                                               ');
    Sql.Add(' WHERE A.EORGNUM   = B.ORGNUM                                                                           ');
    Sql.Add('   AND A.EJOBDEPT  = B.DEPTCODE                                                                         ');
    Sql.Add('   AND A.EEMPNO    = C.EMPNO                                                                            ');

    if(trim(sfix_orgnum.text) <> '') then
      SQL.Add(' AND A.EORGNUM = ''' + trim(sfix_orgnum.text) + '''       ');

    if(trim(sfix_eempno.text) <> '') then
      SQL.Add(' AND A.EEMPNO LIKE ''' + trim(copy(sfix_eempno.text,1,4)) + '%''       ');

    if(trim(sfix_jobdept.text) <> '') then
      SQL.Add(' AND A.EJOBDEPT LIKE ''' + trim(copy(sfix_jobdept.text,1,6)) + '%''       ');

         if(use_Yes.Checked) then
           SQL.Add(' and nvl(a.useyn,''N'') = ''Y''  ')
    else if(use_No.Checked) then
           SQL.Add(' and nvl(a.useyn,''N'') = ''N''  ');

    Sql.Add('  ORDER BY a.EEMPNO                                                                                     ');

    Open;
  end;

end;


procedure TMainForm.PageControl1Change(Sender: TObject);
begin
    btn_searchClick(self);
end;

procedure TMainForm.btn_excelClick(Sender: TObject);
begin
        if pageControl1.ActivePage = Tabsheet1 then excel_pimeemp
  else  if pageControl1.ActivePage = Tabsheet2 then excel_pimeempfix
  ;
end;

procedure TMainForm.excel_pimeemp;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //��ü�ڷ� �����Ҷ�..}
  if ora_pimeemp.RecordCount < 1 then
  begin
    showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
    exit;
  end;
  SB_help.Panels[1].Text := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 14], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
    SB_help.Panels[1].Text := '';
    Exit;
  end;

  SB_help.Panels[1].Text := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '���°����� ��Ȳ';  //��Ʈ�� �ο�
  XL.Range['A1:N2'].Merge;               //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := '���°����� ��Ȳ';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����

  XArr[ 1]  := '���'              ;
  XArr[ 2]  := '����'              ;
  XArr[ 3]  := '��å�ڵ�'          ;
  XArr[ 4]  := '��å��'            ;
  XArr[ 5]  := '��������'          ;
  XArr[ 6]  := '�ٹ��μ��ڵ�'      ;
  XArr[ 7]  := '�ٹ��μ���'        ;
  XArr[ 8]  := '�����ڻ��'        ;
  XArr[ 9]  := '�����ڼ���'        ;
  XArr[10]  := '��������å�ڵ�'    ;
  XArr[11]  := '��������å��'      ;
  XArr[12]  := '��������������'    ;
  XArr[13]  := '�����ڱٹ��μ��ڵ�';
  XArr[14]  := '�����ڱٹ��μ���'  ;

  XL.Range['A3' , 'N3'].Value := XArr;
  k := 3;
  for i := 1 to 14 do
  begin
    XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
    XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
    XL.Range[CHR(64 + i) + '3'].font.Size := 10;
    XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := ora_pimeemp.GetBookmark;
  ora_pimeemp.DisableControls;
  ora_pimeemp.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  ora_pimeemp.RecordCount do
  begin
    XArr[ 1] := '''' + ora_pimeemp.FieldbyName('EMPNO').AsString;
    XArr[ 2] := ora_pimeemp.FieldByName('KORNAME').AsString;
    XArr[ 3] := ora_pimeemp.FieldbyName('PAYRA').AsString;
    XArr[ 4] := ora_pimeemp.FieldbyName('PAYRANM').AsString;
    XArr[ 5] := ora_pimeemp.FieldByName('ORGNUM').AsString;
    XArr[ 6] := ora_pimeemp.FieldByName('JOBDEPT').AsString;
    XArr[ 7] := ora_pimeemp.FieldByName('DEPTNAME').AsString;
    XArr[ 8] := '''' + ora_pimeemp.FieldByName('EEMPNO').AsString;
    XArr[ 9] := ora_pimeemp.FieldByName('EKORNAME').AsString;
    XArr[10] := ora_pimeemp.FieldByName('EPAYRA').AsString;
    XArr[11] := ora_pimeemp.FieldByName('EPAYRANM').AsString;
    XArr[12] := ora_pimeemp.FieldByName('EORGNUM').AsString;
    XArr[13] := ora_pimeemp.FieldbyName('EJOBDEPT').AsString;
    XArr[14] := ora_pimeemp.FieldbyName('EDEPTNAME').AsString;

    XL.Range['A' + IntToStr(k+1), 'N' + IntToStr(k+1)].Value := XArr;
    inc(k);
    ora_pimeemp.Next;
  end;
  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
   XL.Range['A1', 'N' + IntToStr(k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
   XL.Range['A1', 'N' + IntToStr(k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
   XL.Range['A1', 'N' + IntToStr(k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
   XL.Range['A1', 'N' + IntToStr(k)].font.name := '���� ����';//'����ü';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //��� ����
   XL.Range['A3', 'N' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'N' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   XL.Range['A1', 'N' + IntToStr(k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
   XL.Selection.Columns.AutoFit;                                //�ڵ�����
   XL.Range['A4', 'A4'].Select;                                 //A4���� Ŀ�� ��ġ��Ŵ
   XL.Visible := true;                                          //�����ڷ� ������
   Screen.Cursor := crDefault;
   ora_pimeemp.GotoBookmark(SavePlace);
   ora_pimeemp.FreeBookmark(SavePlace);
   ora_pimeemp.EnableControls;
   SB_help.Panels[1].Text := '';
end;

procedure TMainForm.excel_pimeempfix;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //��ü�ڷ� �����Ҷ�..}
  if Ora_pimeempfix.RecordCount < 1 then
  begin
       showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
       exit;
  end;
  SB_help.Panels[1].Text := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 7], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
    SB_help.Panels[1].Text := '';
    Exit;
  end;

  SB_help.Panels[1].Text := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '���� ���� Ư���� ����';  //��Ʈ�� �ο�
  XL.Range['A1:G2'].Merge;               //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := '���� ���� Ư���� ����';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����

  XArr[ 1]  := '��������'  ;
  XArr[ 2]  := '����ٹ��μ��ڵ�';
  XArr[ 3]  := '����ٹ��μ���'  ;
  XArr[ 4]  := '�����ڻ��'      ;
  XArr[ 5]  := '�����ڼ���'      ;
  XArr[ 6]  := '��뿩��'        ;
  XArr[ 7]  := '��    ��'        ;

  XL.Range['A3' , 'G3'].Value := XArr;
  k := 3;
  for i := 1 to 7 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := Ora_pimeempfix.GetBookmark;
  Ora_pimeempfix.DisableControls;
  Ora_pimeempfix.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  Ora_pimeempfix.RecordCount do
  begin
     XArr[ 1]  := Ora_pimeempfix.FieldbyName('EORGNUM').AsString;
     XArr[ 2]  := Ora_pimeempfix.FieldbyName('EJOBDEPT').AsString;
     XArr[ 3]  := Ora_pimeempfix.FieldByName('DEPTNAME').AsString;
     XArr[ 4]  := '''' + Ora_pimeempfix.FieldByName('EEMPNO').AsString;
     XArr[ 5]  := Ora_pimeempfix.FieldbyName('EKORNAME').AsString;
     XArr[ 6]  := Ora_pimeempfix.FieldByName('USEYN').AsString;
     XArr[ 7]  := Ora_pimeempfix.FieldByName('BIGO').AsString;

     XL.Range['A' + IntToStr(k+1), 'G' + IntToStr(k+1)].Value := XArr;
     inc(k);
     Ora_pimeempfix.Next;
  end;
  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
   XL.Range['A1', 'G' + IntToStr(k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
   XL.Range['A1', 'G' + IntToStr(k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
   XL.Range['A1', 'G' + IntToStr(k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
   XL.Range['A1', 'G' + IntToStr(k)].font.name := '���� ����';//'����ü';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //��� ����
   XL.Range['A3', 'G' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'G' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   XL.Range['A1', 'G' + IntToStr(k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
   XL.Selection.Columns.AutoFit;                                //�ڵ�����
   XL.Range['A4', 'A4'].Select;                                 //A4���� Ŀ�� ��ġ��Ŵ
   XL.Visible := true;                                          //�����ڷ� ������
   Screen.Cursor := crDefault;
   Ora_pimeempfix.GotoBookmark(SavePlace);
   Ora_pimeempfix.FreeBookmark(SavePlace);
   Ora_pimeempfix.EnableControls;

   SB_help.Panels[1].Text := '';
end;

procedure TMainForm.ds_pimeempfixDataChange(Sender: TObject;
  Field: TField);
begin
    with Ora_pimeempfix do
    begin
        e_eorgnum.Text     := FieldByName('EORGNUM').AsString;
        e_eempno.Text      := FieldByName('EEMPNO').AsString;
        e_ekorname.Text    := FieldByName('EKORNAME').AsString;        
        e_jobdept.Text     := FieldByName('EJOBDEPT').AsString;
        e_jobdeptname.Text := FieldByName('DEPTNAME').AsString;
        e_useyn.Text       := FieldByName('USEYN').AsString;
        e_bigo.Text        := FieldByName('BIGO').AsString;

    end;
    btn_del.Enabled := true;
  end;

procedure TMainForm.btn_addClick(Sender: TObject);
begin
  InsertMode := true;

  clear_fields;
  
  e_jobdept.Enabled := true;
end;

procedure TMainForm.e_eempnoInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TMainForm.e_eempnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       e_eempno.Text    := EmpForm.GSempnoS;
       e_ekorname.Text  := EmpForm.GSkornameS;
  end;
end;

procedure TMainForm.e_jobdeptInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TMainForm.e_jobdeptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if DeptForm.GSdeptcode <> '' then
    begin
        e_eorgnum.Text     := DeptForm.GSorgnum;
        e_jobdept.Text     := DeptForm.GSdeptcode;
        e_jobdeptname.Text := DeptForm.GSdeptname;
    end;  
end;

procedure TMainForm.btn_saveClick(Sender: TObject);
begin
  if pageControl1.ActivePage = Tabsheet2 then save_pimeempfix
  ;
end;

procedure TMainForm.save_pimeempfix;
begin
    if(trim(e_eempno.Text)='') then
    begin
        MessageBox(handle,'�����ڻ�� �Է��� �ʼ��Դϴ�.','�� ��',MB_OK or $0030);
        e_eempno.Setfocus;
        system.Exit;
    end;

    if(trim(e_jobdept.Text)='') then
    begin
        MessageBox(handle,'����ٹ��μ� �Է��� �ʼ��Դϴ�.','�� ��',MB_OK or $0030);
        e_jobdept.Setfocus;
        system.Exit;
    end;

    if(trim(e_jobdept.text)='') then e_eorgnum.Text := HyunOrgNum;

    if MessageDlg('�Է��Ͻ� �ڷ�� �����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;

        if(InsertMode) then
        begin
            Sql.Add('SELECT * FROM PIMEEMPFIX WHERE eorgnum=''' + e_eorgnum.text + ''' and EJOBDEPT =''' + e_jobdept.text + ''' and useyn =''Y'' ');
            Open;

            if (OraQuery1.RecordCount > 0) then
               if MessageDlg('������ ��ϵ� �ٹ��μ� ������ �ڷᰡ �����մϴ�. ���� �ڷ� �������� �����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

            Close;
            Sql.Clear;
        end;
        
        Sql.Add('MERGE INTO PIMEEMPFIX P                                                                                         ');
        Sql.Add('  USING (SELECT ''' + trim(e_eorgnum.Text) + ''' EORGNUM,                                                       ');
        Sql.Add('                ''' + trim(e_jobdept.Text) + ''' EJOBDEPT,                                                      ');
        Sql.Add('                ''' + trim(e_eempno.Text) + ''' EEMPNO,                                                         ');
        Sql.Add('                NVL(''' + trim(e_useyn.Text) + ''',''N'') USEYN,                                                ');
        Sql.Add('                ''' + trim(e_bigo.Text) + ''' BIGO,                                                             ');
        Sql.Add('                ''' + trim(Pempno) + ''' WRITEEMP,                                                              ');
        Sql.Add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME                                                 ');
        Sql.Add('           FROM DUAL) V1                                                                                        ');
        Sql.Add('     ON (P.EORGNUM = V1.EORGNUM AND P.EJOBDEPT = V1.EJOBDEPT)                                                   ');
        Sql.Add('WHEN MATCHED THEN UPDATE SET                                                                                    ');
        Sql.Add('                        P.EEMPNO    = V1.EEMPNO,                                                                ');
        Sql.Add('                        P.USEYN     = V1.USEYN,                                                                 ');
        Sql.Add('                        P.BIGO      = V1.BIGO,                                                                  ');
        Sql.Add('                        P.WRITEEMP  = V1.WRITEEMP,                                                              ');
        Sql.Add('                        P.WRITETIME = V1.WRITETIME                                                              ');
        Sql.Add('WHEN NOT MATCHED THEN INSERT( P.EORGNUM,  P.EJOBDEPT,  P.EEMPNO,  P.USEYN,  P.BIGO,  P.WRITEEMP,  P.WRITETIME)  ');
        Sql.Add('                      VALUES(V1.EORGNUM, V1.EJOBDEPT, V1.EEMPNO, V1.USEYN, V1.BIGO, V1.WRITEEMP, V1.WRITETIME)  ');

        ExecSQL;
    end;

    btn_searchClick(self);
end;


procedure TMainForm.btn_delClick(Sender: TObject);
begin
  InsertMode := false;
  
  if pageControl1.ActivePage = Tabsheet2 then delete_pimeempfix
  ;

  btn_searchClick(self);
end;

procedure TMainForm.delete_pimeempfix;
begin
  if(trim(e_jobdept.Text)='') then
  begin
      MessageBox(handle,'���õ� �ٹ��μ��� �����ϴ�.','�� ��',MB_OK or $0030);
      e_jobdept.Setfocus;
      system.Exit;
  end;

  if(trim(e_jobdept.text)='') then e_eorgnum.Text := HyunOrgNum;

  if MessageDlg(' �����Ͻ� �ڷḦ �����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

  with OraQuery1 do
  begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM PIMEEMPFIX                                                             ');
      Sql.Add(' WHERE EORGNUM=''' + e_eorgnum.text + ''' AND EJOBDEPT =''' + e_jobdept.text + ''' ');

      ExecSQL;
  end;
end;

procedure TMainForm.btn_applyClick(Sender: TObject);
begin
  SB_help.Panels[1].Text := '���� ������ �ݿ� ��...';

  if MessageDlg('������ ���°����� ������ �Ϻ� ����5�ð� �ݿ��˴ϴ�.'+#13#10 +
                 '�������� ���� �����ڸ� �ݿ��Ͻðڽ��ϱ�?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes
  then
  begin
    SB_help.Panels[1].Text := '';
    System.Exit;
  end;

  ProgId  := 'insaeemp';
  CmdStr  := '/hper/insa/HINSA/proc/bin/Ibin/insaeemp' ;

  with TDS_batch do
  begin
    Close;
    ServiceName := 'HINSA_batch';
    ClearFieldInfo;
    ClearParamInfo;
    AddParam('cmdstr', 300, CmdStr);
    Execute;
  end;
  SB_help.Panels[1].Text := '���°����� �ݿ��� �Ϸ��Ͽ����ϴ�.';

  //btn_searchClick(self);
end;

procedure TMainForm.s_eempnoInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TMainForm.s_eempnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       s_eempno.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;
  end;
end;

procedure TMainForm.sfix_eempnoInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TMainForm.sfix_eempnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       sfix_eempno.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;
  end;
end;

procedure TMainForm.sfix_jobdeptInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TMainForm.sfix_jobdeptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if DeptForm.GSdeptcode <> '' then
    begin
        sfix_jobdept.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;
    end;
end;

end.