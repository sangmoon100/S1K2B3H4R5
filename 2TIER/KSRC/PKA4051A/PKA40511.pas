unit PKA40511;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids, Fempno,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn,
  OnTmaxPersonEdit, OnFocusButton, OnStringUtils;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel10: TPanel;
    BT_batch: TOnFocusButton;
    bt_find: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_exit: TOnFocusButton;
    BT_delete: TOnFocusButton;
    BB_Excel: TOnFocusButton;
    BT_input: TOnFocusButton;
    P_Help: TPanel;
    ED_year: TOnComboEdit;
    s_empno: TOnPersonPopupEdit;
    s_deptcode: TOnWinPopupEdit;
    OnGrDbGrid1: TOnGrDbGrid;
    e_empno: TOnPersonPopupEdit;
    E_TOT_YEARLY_CNT: TOnEdit;
    E_YEARLYPLAN_CNT: TOnEdit;
    E_USED_CNT: TOnEdit;
    E_PRE_USED_CNT: TOnEdit;
    E_YEARLY_CNT: TOnEdit;
    E_NEXT_YEARLY_CNT: TOnEdit;
    Label1: TLabel;
    OraQuery: TOraQuery;
    DataSource: TDataSource;
    tmp_oraqry: TOraQuery;
    OnGrDbGrid2: TOnGrDbGrid;
    OraQuery2: TOraQuery;
    DataSource2: TDataSource;
    E_UPDATEYN: TOnEdit;
    Label2: TLabel;
    E_LESS_1Y_CNT: TOnEdit;
    E_FISCAL_YEARLY: TOnEdit;
    BB_Excel_Use: TOnFocusButton;
    E_PREDIC_YEARLY: TOnEdit;
    Shape1: TShape;
    E_YEARLY_SUM: TOnEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bt_findClick(Sender: TObject);
    procedure BT_exitClick(Sender: TObject);
    procedure ED_yearChange(Sender: TObject);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure OnGrDbGrid1CellClick(Column: TColumn);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BB_ExcelClick(Sender: TObject);
    procedure BB_Excel_UseClick(Sender: TObject);
    procedure BT_inputClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_deleteClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Vempno      : String;
    GSYear      : String[4];     //���س⵵
    Mod_Flag    : String;

    //���庯��
    p_empno            : String;
    p_korname          : String;
    p_tot_yearly_cnt   : String;
    p_pre_used_cnt     : String;
    p_next_yearly_cnt  : String;
    p_yearly_cnt       : String;
    p_yearlyplan_cnt   : String;
    p_updateyn         : String;

    procedure clear_fields;
    procedure Retrieve; 
    procedure Detail_Retrieve;
    function  save_pkyearlt : Boolean;
    function  Insert_PKYEARLTLOG(v_modflag : string) : Boolean;
    function  Check_Valid_Year : Boolean;
    function  PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
  end;

var
  MainForm: TMainForm;
  WorkMode    : Integer;

implementation

uses {PKA40503,} PKA40512;
{$R *.DFM}


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
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

  Vempno   := Pempno;

  Application.ProcessMessages;

  //������ ���� �̿ܿ��� ���Ұ�.
  if (Copy(Pgrade,3,1) > 'C') then
  begin
       MessageBox(handle,'������ ���� �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
       Close;
  end;

  Application.ProcessMessages;

  FL_Date    := copy(fn_GetDateStr,1,4);

  if not IsNumber(FL_Date) then
    System.Exit;

  FL_IDate := strtoint(FL_Date);
  ED_year.Items.Clear;
  ED_year.KeyItems.Clear;
  ED_year.Items.Add(IntToStr(FL_IDate-2)+' ��');
  ED_year.Items.Add(IntToStr(FL_IDate-1)+' ��');
  ED_year.Items.Add(FL_Date+' ��');
  ED_year.Items.Add(IntToStr(FL_IDate+1)+' ��');
  ED_year.KeyItems.Add(IntToStr(FL_IDate-2));
  ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
  ED_year.KeyItems.Add(FL_Date);
  ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
  ED_year.ItemIndex := 2;

  //s_empno.Text     := Pempno + ' - ' + Pkorname;
  clear_fields;
end;

procedure TMainForm.clear_fields;
begin
  Mod_Flag                 := 'U';
  e_empno.Text             := '';
  e_empno.Enabled          := false;

  E_TOT_YEARLY_CNT.Text    := '';
  E_PRE_USED_CNT.Text      := '';
  E_NEXT_YEARLY_CNT.Text   := '';
  E_YEARLY_CNT.Text        := '';
  E_YEARLYPLAN_CNT.Text    := '';
  E_USED_CNT.Text          := '';

  BT_delete.Enabled        := true;
  E_USED_CNT.Enabled       := false;
end;

procedure TMainForm.Retrieve;
begin
  clear_fields;

  with OraQuery do
  begin
    Close;
    Sql.Clear;
         Sql.Add(' SELECT YEARLY_YY,                                                                                      ');
         Sql.Add('        A.EMPNO,                                                                                        ');
         Sql.Add('        B.KORNAME,                                                                                      ');
         Sql.Add('        B.DEPTCODE,                                                                                     ');
         Sql.Add('        C.DEPTNAME,                                                                                     ');
         Sql.Add('        TO_CHAR(TO_DATE(NVL(b.GROUPEMPDATE,b.EMPDATE),''YYYY-MM-DD''),''YYYY-MM-DD'') EMPDATE,          ');
         Sql.Add('        b.TOTCOMDUDD TOTCOMDUDD,                                                                        ');
         Sql.Add('        nvl(TOT_YEARLY_CNT,0)       TOT_YEARLY_CNT,                                                     ');
         Sql.Add('        nvl(PRE_USED_CNT,0)         PRE_USED_CNT,                                                       ');
         Sql.Add('        nvl(NEXT_YEARLY_CNT,0)      NEXT_YEARLY_CNT,                                                    ');
         Sql.Add('        nvl(YEARLY_CNT,0)           YEARLY_CNT,                                                         ');
         Sql.Add('        nvl(YEARLYPLAN_CNT,0)       YEARLYPLAN_CNT,                                                     ');
         Sql.Add('        upper(nvl(NOTICE_YN,''N'')) NOTICE_YN,                                                          ');
         Sql.Add('        upper(nvl(ASSIGN_YN,''N'')) ASSIGN_YN,                                                          ');
         Sql.Add('        nvl(payutil.GET_DUTY_CNT(a.EMPNO,a.YEARLY_YY||''0101'',a.YEARLY_YY||''1231'',''1''),0) USED_CNT,');
         Sql.Add('        b.COMDUYY COMDUYY,                                                                              ');
         Sql.Add('        b.COMDUMM COMDUMM,                                                                              ');
         Sql.Add('        a.UPDATEYN UPDATEYN,                                                                            ');
         Sql.Add('        (SELECT FISCAL_YEARLY FROM D034_FISCAL_YEARLY d WHERE d.EMPNO = b.EMPNO) FISCAL_YEARLY          ');
         Sql.Add('   FROM PKYEARLT a, PIMPMAS b, PYCDEPT c                                                                ');
         Sql.Add('  WHERE YEARLY_YY  = :yearly_yy                                                                         ');
         Sql.Add('    AND a.EMPNO    = b.EMPNO                                                                            ');
         Sql.Add('    AND b.ORGNUM   = c.Orgnum                                                                           ');
         Sql.Add('    AND b.DEPTCODE = c.Deptcode                                                                         ');
         Sql.Add('    AND NVL(b.GROUPEMPDATE,b.EMPDATE) >= ''20170530''                                                   ');

    if Trim(ParseString(s_deptcode.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (c.deptcode like ''' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  or     ');
      SQL.Add('      c.DEPTNAME like ''' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  )      ');
    end;

    if Trim(ParseString(s_empno.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (a.EMPNO   like ''' + Trim(ParseString(s_empno.text,'-',1)) + '%''  or         ');
      SQL.Add('      a.korname like ''' + Trim(ParseString(s_empno.text,'-',1)) + '%''  )          ');
    end;

    Sql.Add('  ORDER BY EMPNO                                         ');

    ParamByName('yearly_yy').AsString := GSYear;
    Open;

    fieldbyname('EMPNO'     ).Alignment := taCenter;
  end;


end;

procedure TMainForm.bt_findClick(Sender: TObject);
begin
    P_Help.Caption := '';
    Retrieve;
end;

procedure TMainForm.BT_exitClick(Sender: TObject);
begin
    if MessageBox(handle,'���� �Ͻðڽ��ϱ�?','Ȯ ��',MB_YESNO or $0030) = ID_YES then  halt(1);
end;

procedure TMainForm.ED_yearChange(Sender: TObject);
begin
    GSYear := ED_year.KeyItems[ED_year.ItemIndex];

    if(trim(copy(E_empno.text,1,4))<>'') then
       Retrieve;

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
  end;
end;

procedure TMainForm.Detail_Retrieve;
begin
  with OraQuery2 do
  begin
    Close;
    Sql.Clear;
         Sql.Add('SELECT NVL(MON,0) MON                                                                 ');
         Sql.Add('      ,DECODE(ACCYN,''Y'',''�߻�'',''N'',''�̹߻�'','''') ACCYN                       ');
         Sql.Add('      ,CASE WHEN (TRIM(ACCDATE) IS NOT NULL) THEN TO_CHAR(TO_DATE(ACCDATE,''YYYY-MM-DD''),''YYYY-MM-DD'')  ');
         Sql.Add('       ELSE NULL                                                                      ');
         Sql.Add('       END ACCDATE                                                                    ');
         Sql.Add('      ,DECODE(USEYN,''Y'',''���'',''N'',''�̻��'',''X'',''�̹߻�'','''') USEYN      ');
         Sql.Add('  FROM PKNWYRDET                                                                      ');
         Sql.Add(' WHERE EMPNO = :empno                                                                 ');
         Sql.Add(' ORDER BY EMPNO, MON                                                                  ');

    ParamByName('empno').AsString := OraQuery.FieldByName('EMPNO').AsString;
    Open;

    //fieldbyname('EMPNO'     ).Alignment := taCenter;
  end;
end;

procedure TMainForm.OnGrDbGrid1CellClick(Column: TColumn);
begin
  if OraQuery.RecordCount > 0 then
    Detail_Retrieve;
end;

procedure TMainForm.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    P_Help.Caption := '';
    Retrieve;
  end;
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
var
  tmp_fiscal : String;
begin
  with OraQuery do
  begin
    e_empno.Text          := FieldByName('EMPNO').AsString + ' - ' +
                             FieldByName('KORNAME').AsString;
    E_TOT_YEARLY_CNT.text := FieldByName('TOT_YEARLY_CNT').AsString;
    E_PRE_USED_CNT.text   := FieldByName('PRE_USED_CNT').AsString;
    E_NEXT_YEARLY_CNT.text:= FieldByName('NEXT_YEARLY_CNT').AsString;

    E_YEARLY_CNT.text     := FieldByName('YEARLY_CNT').AsString;
    E_YEARLYPLAN_CNT.text := FieldByName('YEARLYPLAN_CNT').AsString;
    E_USED_CNT.text       := FieldByName('USED_CNT').AsString;
    E_UPDATEYN.text       := FieldByName('UPDATEYN').AsString;

    // 1�� �̸� �Ի��� ���� �߻� ����
    if FieldByName('COMDUYY').AsInteger > 0 then
      E_LESS_1Y_CNT.Text := IntToStr(11)
    else
      E_LESS_1Y_CNT.Text := FieldByName('COMDUMM').AsString;

    // ȸ��⵵ �߻� ����
    tmp_fiscal := FloatToStr(FieldByName('FISCAL_YEARLY').AsInteger);

    // �Ի�⵵�� ���� ������
    // �Ի��ͳ��̸� �߻� ������ ǥ��
    if Copy(FieldByName('EMPDATE').AsString,1,4) = ED_year.KeyItems[ED_year.ItemIndex] then
    begin
      E_FISCAL_YEARLY.Text := '0';
      E_PREDIC_YEARLY.Text := tmp_fiscal;
    end
    else
    begin
      E_FISCAL_YEARLY.Text := tmp_fiscal;
      E_PREDIC_YEARLY.Text := '0';
    end;

    E_YEARLY_SUM.Text  := FloatToStr(StrToFloat(E_PRE_USED_CNT.Text) + StrToFloat(E_USED_CNT.Text));

    Detail_Retrieve;
  end;

  if(E_TOT_YEARLY_CNT.text='') then E_TOT_YEARLY_CNT.text := '0';
  if(E_PRE_USED_CNT.text='')   then E_PRE_USED_CNT.text   := '0';
  if(E_YEARLY_CNT.text='')     then E_YEARLY_CNT.text     := '0';
  if(E_YEARLYPLAN_CNT.text='') then E_YEARLYPLAN_CNT.text := '0';
  if(E_USED_CNT.text='')       then E_USED_CNT.text       := '0';
  if(E_LESS_1Y_CNT.text='')    then E_LESS_1Y_CNT.text    := '0';
  if(E_FISCAL_YEARLY.text='')  then E_FISCAL_YEARLY.text  := '0';
  if(E_PREDIC_YEARLY.text='')  then E_PREDIC_YEARLY.text  := '0';
end;

procedure TMainForm.BB_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if OraQuery.RecordCount < 1 then
  begin
    showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
    exit;
  end;
  P_Help.Caption := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 14], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  p_help.caption := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '1�� �̸� ������� ���';  //��Ʈ�� �ο�
  XL.Range['A1:N2'].Merge;               //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := GSYear+'�� 1�� �̸� ������ϳ���';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����

  XArr[ 1]  := '�����ȣ'        ;
  XArr[ 2]  := '�������'        ;
  XArr[ 3]  := '�μ��ڵ�'        ;
  XArr[ 4]  := '�μ���'          ;
  XArr[ 5]  := '�Ի���'          ;
  XArr[ 6]  := '�ټ��ϼ�'        ;
  XArr[ 7]  := '��� �߻������ϼ�'      ;
  XArr[ 8]  := '���� ��뿬���ϼ�'      ;
  XArr[ 9]  := '�ͳ� ����뿬���ϼ�'    ;
  XArr[10]  := '��� ��밡�� �����ϼ�' ;
  XArr[11]  := '��������ǥ'    ;
  XArr[12]  := '��������ϼ�'    ;
  XArr[13]  := '�����ϷῩ��'    ;
  XArr[14]  := '���ñ�ϷῩ��';

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
  SavePlace := tmp_oraqry.GetBookmark;
  OraQuery.DisableControls;
  OraQuery.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  OraQuery.RecordCount do
  begin
     XArr[ 1]  := ''''+OraQuery.FieldbyName('EMPNO').AsString;
     XArr[ 2]  := OraQuery.FieldByName('KORNAME').AsString;
     XArr[ 3]  := OraQuery.FieldByName('DEPTCODE').AsString;
     XArr[ 4]  := OraQuery.FieldByName('DEPTNAME').AsString;
     XArr[ 5]  := OraQuery.FieldByName('EMPDATE').AsString;
     XArr[ 6]  := OraQuery.FieldByName('TOTCOMDUDD').AsString;
     XArr[ 7]  := OraQuery.FieldbyName('TOT_YEARLY_CNT').AsString;
     XArr[ 8]  := OraQuery.FieldbyName('PRE_USED_CNT').AsString;
     XArr[ 9]  := OraQuery.FieldbyName('NEXT_YEARLY_CNT').AsString;
     XArr[10]  := OraQuery.FieldbyName('YEARLY_CNT').AsString;
     XArr[11]  := OraQuery.FieldbyName('YEARLYPLAN_CNT').AsString;
     XArr[12]  := OraQuery.FieldByName('used_cnt').AsString;
     XArr[13]  := OraQuery.FieldByName('NOTICE_YN').AsString;
     XArr[14]  := OraQuery.FieldByName('ASSIGN_YN').AsString;

     XL.Range['A' + IntToStr(k+1), 'N' + IntToStr(k+1)].Value := XArr;
     inc(k);
     OraQuery.Next;
  end;
  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
   XL.Range['A1', 'N' + IntToStr(k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
   XL.Range['A1', 'N' + IntToStr(k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
   XL.Range['A1', 'N' + IntToStr(k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
   XL.Range['A1', 'N' + IntToStr(k)].font.name := '���� ���';//'����ü';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //��� ����
   XL.Range['A3', 'N' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'N' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //��������
   XL.Range['A1', 'N' + IntToStr(k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
   XL.Selection.Columns.AutoFit;                                //�ڵ�����
   XL.Range['A4', 'A4'].Select;                                 //A4���� Ŀ�� ��ġ��Ŵ
   XL.Visible := true;                                          //�����ڷ� ������
   Screen.Cursor := crDefault;
   OraQuery.GotoBookmark(SavePlace);
   OraQuery.FreeBookmark(SavePlace);
   OraQuery.EnableControls;
   p_help.caption := '';
end;

procedure TMainForm.BB_Excel_UseClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if OraQuery.RecordCount < 1 then
  begin
    showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
    exit;
  end;
  P_Help.Caption := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 14], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  p_help.caption := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '1�� �̸� ���� ��볻��';  //��Ʈ�� �ο�
  XL.Range['A1:I2'].Merge;               //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := GSYear+'�� 1�� �̸� ���� ��볻��';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����

  XArr[ 1]  := '�����ȣ'   ;
  XArr[ 2]  := '�������'   ;
  XArr[ 3]  := '�μ��ڵ�'   ;
  XArr[ 4]  := '�μ���'     ;
  XArr[ 5]  := '�Ի���'     ;
  XArr[ 6]  := '����'       ;
  XArr[ 7]  := '�߻�����'   ;
  XArr[ 8]  := '�߻���'     ;
  XArr[ 9]  := '��뿩��'   ;

  XL.Range['A3' , 'I3'].Value := XArr;
  k := 3;
  for i := 1 to 9 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := tmp_oraqry.GetBookmark;
  OraQuery.DisableControls;
  OraQuery.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  OraQuery2.RecordCount do
  begin
     XArr[ 1]  := ''''+OraQuery.FieldbyName('EMPNO').AsString;
     XArr[ 2]  := OraQuery.FieldByName('KORNAME').AsString;
     XArr[ 3]  := OraQuery.FieldByName('DEPTCODE').AsString;
     XArr[ 4]  := OraQuery.FieldByName('DEPTNAME').AsString;
     XArr[ 5]  := OraQuery.FieldByName('EMPDATE').AsString;
     XArr[ 6]  := OraQuery2.FieldByName('MON').AsString;
     XArr[ 7]  := OraQuery2.FieldbyName('ACCYN').AsString;
     XArr[ 8]  := OraQuery2.FieldbyName('ACCDATE').AsString;
     XArr[ 9]  := OraQuery2.FieldbyName('USEYN').AsString;

     XL.Range['A' + IntToStr(k+1), 'I' + IntToStr(k+1)].Value := XArr;
     inc(k);
     OraQuery.Next;
  end;
  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
   XL.Range['A1', 'I' + IntToStr(k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
   XL.Range['A1', 'I' + IntToStr(k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
   XL.Range['A1', 'I' + IntToStr(k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
   XL.Range['A1', 'I' + IntToStr(k)].font.name := '���� ���';//'����ü';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //��� ����
   XL.Range['A3', 'I' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'I' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //��������
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //��������
   XL.Range['A1', 'I' + IntToStr(k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
   XL.Selection.Columns.AutoFit;                                //�ڵ�����
   XL.Range['A4', 'A4'].Select;                                 //A4���� Ŀ�� ��ġ��Ŵ
   XL.Visible := true;                                          //�����ڷ� ������
   Screen.Cursor := crDefault;
   OraQuery.GotoBookmark(SavePlace);
   OraQuery.FreeBookmark(SavePlace);
   OraQuery.EnableControls;
   p_help.caption := '';
end;

procedure TMainForm.BT_inputClick(Sender: TObject);
begin
  clear_fields;
  
  Mod_Flag := 'I';
  e_empno.Enabled    := true;
  BT_delete.Enabled  := false;
end;

function TMainForm.save_pkyearlt: Boolean;
var
    i : Integer;
begin
    result := false;

    //2015.01.12.hjku.. �����ϱ� ���� ��ü �α� ���� �߰�..
    if not(Insert_PKYEARLTLOG('C')) then System.exit;

    with tmp_oraqry do
    begin
         Close;
         Sql.Clear;
         sql.add('MERGE INTO PKYEARLT P                                                                                                 ');
         sql.add('  USING (SELECT EMPNO,                                                                                                ');
         sql.add('                KORNAME,                                                                                              ');
         sql.add('                '''+GSYear+'''               YEARLY_YY,                                                               ');
         sql.add('                nvl('+p_tot_yearly_cnt+',0)  TOT_YEARLY_CNT,                                                          ');
         sql.add('                nvl('+p_pre_used_cnt+',0)    PRE_USED_CNT,                                                            ');
         sql.add('                nvl('+p_next_yearly_cnt+',0) NEXT_YEARLY_CNT,                                                         ');
         sql.add('                nvl('+p_yearly_cnt+',0)      YEARLY_CNT,                                                              ');
         sql.add('                nvl('+p_yearlyplan_cnt+',0)  YEARLYPLAN_CNT,                                                          ');
         sql.add('                '''+Pempno+''' WRITEID,                                                                               ');
         sql.add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24miss'') WRITETIME,                                                      ');
         sql.add('                nvl('''+p_updateyn+''',''N'') UPDATEYN                                                                ');
         sql.add('           FROM PIMPMAS                                                                                               ');
         sql.add('          WHERE EMPNO ='''+copy(p_empno,1,4)+''') V1                                                                  ');
         sql.add('    ON (P.YEARLY_YY = V1.YEARLY_YY AND P.EMPNO = V1.EMPNO)                                                            ');
         sql.add('WHEN MATCHED THEN UPDATE SET                                                                                          ');
         sql.add('                        P.KORNAME         = V1.KORNAME,                                                               ');
         sql.add('                        P.TOT_YEARLY_CNT  = V1.TOT_YEARLY_CNT,                                                        ');
         sql.add('                        P.PRE_USED_CNT    = V1.PRE_USED_CNT,                                                          ');
         sql.add('                        P.NEXT_YEARLY_CNT = V1.NEXT_YEARLY_CNT,                                                       ');
         sql.add('                        P.YEARLY_CNT      = V1.YEARLY_CNT,                                                            ');
         sql.add('                        P.YEARLYPLAN_CNT  = V1.YEARLYPLAN_CNT,                                                        ');
         sql.add('                        P.WRITEID         = V1.WRITEID,                                                               ');
         sql.add('                        P.WRITETIME       = V1.WRITETIME,                                                             ');
         sql.add('                        P.UPDATEYN        = V1.UPDATEYN                                                               ');
         sql.add('WHEN NOT MATCHED THEN INSERT( P.YEARLY_YY, P.EMPNO, P.KORNAME, P.TOT_YEARLY_CNT, P.PRE_USED_CNT, P.NEXT_YEARLY_CNT, P.YEARLY_CNT, P.YEARLYPLAN_CNT, P.WRITEID, P.WRITETIME,P.UPDATEYN)');
         sql.add('                      VALUES(V1.YEARLY_YY,V1.EMPNO,V1.KORNAME,V1.TOT_YEARLY_CNT,V1.PRE_USED_CNT,V1.NEXT_YEARLY_CNT,V1.YEARLY_CNT,V1.YEARLYPLAN_CNT,V1.WRITEID,V1.WRITETIME,V1.UPDATEYN)');

         ExecSQL;
    end;

    result := true;
end;

function TMainForm.Insert_PKYEARLTLOG(v_modflag: string): Boolean;
var
    Tem : string;
begin
    Insert_PKYEARLTLOG := false;

    with tmp_oraqry do
    begin
        Close;
        sql.Clear;
        sql.add('INSERT INTO PKYEARLTLOG                                     ');
        sql.add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') MODTIME,       ');
        sql.add('       ''' + v_modflag + ''' MODFLAG,                       ');
        sql.add('       ''' + Pempno + ''' MODEMP,                           ');
        sql.add('       ''PKA4050A'' PIPROGID,                               ');
        sql.add('       A.* FROM PKYEARLT A                                  ');
        Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''                         ');
        Sql.Add('   AND Empno   = '''+copy(p_empno,1,4)+'''                  ');
        EXECSQL;
     end;

    Insert_PKYEARLTLOG := true;
end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TMainForm.BT_deleteClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt : real;
begin
    if(trim(E_YEARLY_CNT.text)='')     then E_YEARLY_CNT.text     := '0';
    if(trim(E_YEARLYPLAN_CNT.text)='') then E_YEARLYPLAN_CNT.text := '0';
    if(trim(E_USED_CNT.text)='')       then E_USED_CNT.text       := '0';

    if not(Check_Valid_Year) then
    begin
        MessageDlg('���¸����� �⵵�� ������ �� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(trim(GSYear) ='') then
    begin
        MessageDlg('���س⵵�� �������� �ʽ��ϴ�.', MtWarning, [mbok], 0);
        ED_year.SetFocus;
        Exit;
    end;

    if(trim(copy(E_empno.text,1,4)) ='') then
    begin
        MessageDlg('���õ� ����� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    frdate := GSYear + '0101';
    todate := GSYear + '1231';

    used_cnt := PL_Get_Duty_Cnt(copy(E_empno.text,1,4),frdate, todate,'1');

    if( used_cnt > 0) then
    begin
        MessageDlg('����� ������ �����Ͽ� ������ �� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    if MessageDlg('�����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    //2015.01.12.hjku.. �����ϱ� ���� ��ü �α� ���� �߰�..
    if not(Insert_PKYEARLTLOG('D')) then System.exit;

    with tmp_oraqry do
    begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM  PKYEARLT                             ');
        Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''               ');
        Sql.Add('   AND Empno   = '''+copy(E_empno.text,1,4)+'''   ');

         //memo1.text := sql.text;

         ExecSQL;
    end;
    P_Help.Caption := '�����Ǿ����ϴ�.';

    Retrieve;
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt : real;
    iPos : Integer;
begin
    if(trim(E_TOT_YEARLY_CNT.text)='')  then E_TOT_YEARLY_CNT.text  := '0';
    if(trim(E_PRE_USED_CNT.text)='')    then E_PRE_USED_CNT.text    := '0';
    if(trim(E_NEXT_YEARLY_CNT.text)='') then E_NEXT_YEARLY_CNT.text := '0';

    if(trim(E_YEARLY_CNT.text)='')      then E_YEARLY_CNT.text      := '0';
    if(trim(E_YEARLYPLAN_CNT.text)='')  then E_YEARLYPLAN_CNT.text  := '0';
    if(trim(E_USED_CNT.text)='')        then E_USED_CNT.text        := '0';

    if not(Check_Valid_Year) then
    begin
        MessageDlg('���¸����� �⵵�� ������ �� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(trim(GSYear) ='') then
    begin
        MessageDlg('���س⵵�� �������� �ʽ��ϴ�.', MtWarning, [mbok], 0);
        ED_year.SetFocus;
        Exit;
    end;

    if(trim(copy(E_empno.text,1,4)) ='') then
    begin
        MessageDlg('���õ� ����� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;
    {//2017.03.06.hjku.. �ͳ� ���� ������ڷ� �����Ƿ� �ش� ���� ����.. ����ȣM ��û
    if( strtofloat(E_TOT_YEARLY_CNT.text) <=0 ) then
    begin
        MessageDlg('�߻������ϼ��� 0���� Ŀ�� �մϴ�.', MtWarning, [mbok], 0);
        E_TOT_YEARLY_CNT.SetFocus;
        Exit;
    end;


    if( strtofloat(E_TOT_YEARLY_CNT.text) <=strtofloat(E_PRE_USED_CNT.text) ) then
    begin
        MessageDlg('���⵵ ��뿬���ϼ��� ���س⵵ �߻������ϼ����� Ŭ �� �����ϴ�.', MtWarning, [mbok], 0);
        E_PRE_USED_CNT.SetFocus;
        Exit;
    end;}

    E_YEARLY_CNT.text := floattostr(strtofloat(E_TOT_YEARLY_CNT.text)
                                   -strtofloat(E_PRE_USED_CNT.text)
                                   +strtofloat(E_NEXT_YEARLY_CNT.text));

    frdate := GSYear + '0101';
    todate := GSYear + '1231';

    used_cnt := PL_Get_Duty_Cnt(copy(E_empno.text,1,4),frdate, todate,'1');

    if(used_cnt > 0) and( used_cnt > strtofloat(E_YEARLY_CNT.text)) then
    begin
        MessageDlg('��밡�ɿ����� ��뿬������ ���� �� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(strtofloat(E_YEARLYPLAN_CNT.text) > 0) and( strtofloat(E_YEARLY_CNT.text) < strtofloat(E_YEARLYPLAN_CNT.text)) then
    begin
        MessageDlg('��������ǥ�� �����ϼ����� Ŭ �� �����ϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    //showmessage(FloatToStr(StrToFloat(E_NEXT_YEARLY_CNT.Text)/0.5));

    // �ͳ� ������ϼ� 0.5 �Է°����ϰ� 0.5 ��� üũ - 2017.12.26 �ڸ��M ��û SangMoon Lee
    iPos := Pos( '.',FloatToStr(StrToFloat(E_NEXT_YEARLY_CNT.Text)/0.5) );

    if( iPos <> 0 ) then
    begin
        MessageDlg('�ͳ� ������ϼ��� 0.5�� ������� �մϴ�.', MtWarning, [mbok], 0);
        Exit;
    end;

    if MessageDlg('�����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    p_empno            := copy(e_empno.text,1,4);
    p_tot_yearly_cnt   := e_tot_yearly_cnt.text;
    p_pre_used_cnt     := e_pre_used_cnt.text;
    p_next_yearly_cnt  := e_next_yearly_cnt.text;    
    p_yearly_cnt       := e_yearly_cnt.text;
    p_yearlyplan_cnt   := e_yearlyplan_cnt.text;
    p_updateyn         := E_UPDATEYN.Text;

    if not save_PKYEARLT then  MessageDlg('���� ����!!!', MtWarning, [mbok], 0);


    Retrieve;
end;

function TMainForm.Check_Valid_Year: Boolean;
begin
  result := false;

  with tmp_oraqry do
  begin
    Close;
    Sql.Clear;
    Sql.Add('select case when substr(Knteyymm,5,2) = ''12'' then case when (substr(Knteyymm,1,4) < ''' + GSYear + ''') then ''Y'' else ''N'' end ');
    Sql.Add('     when (substr(Knteyymm,1,4) <= ''' + GSYear + ''') then ''Y''                                                                   ');
    Sql.Add('     else ''N'' end valid                                                                                                           ');
    Sql.Add('  from pkcpbas                                                                                                                      ');

    Open;

    if(FieldByName('valid').AsString='Y') then result := true
    else result := false;
  end;
end;

function TMainForm.PL_Get_Duty_Cnt(empno, fromdate, todate,
  flag: String): real;
begin
    result := 0.0;

    with tmp_oraqry do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select nvl(payutil.GET_DUTY_CNT('''+empno+''','''+fromdate+''','''+todate+''','''+flag+'''),0) used_cnt from dual  ');

        Open;

        if(RecordCount > 0) then
             result := FieldByName('used_cnt').AsFloat
        else result := 0.0;
    end;
end;

end.
