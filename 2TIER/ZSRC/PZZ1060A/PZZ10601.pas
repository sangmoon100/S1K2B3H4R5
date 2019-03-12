{============================= Program Header ========================================
PROGRAM-NAME    : PZZ1060A(�����˻���(�簳��))
SYSTEM-NAME     : �����λ�����
SUBSYSTEM-NAME  : ��Ÿ
Programmer      : �̻�
Version         : 1.00
Date            : 2017.11.10
Update contents
  1.00    2017.11.10   �̻�   �������α׷� �簳��                       �����˻���
  1.01    2018.04.23   �̻�   �ȳ��� �߰�
======================================================================================}

unit PZZ10601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Func,
  Db, MemDS, DBAccess, Ora, StdCtrls, OnListbox, Pass, Menus, ExtCtrls,
  ComCtrls, OnTreeview, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, Grids,
  DBGrids, OnGrDBGrid, OnRichEdit, Buttons, CheckLst, pelistbox, OnLineLabel,
  OnEditBtnCtrl, OnFocusButton, ComObj, ShellAPI, ImgList, Math;

type
  TInfoSearch2Main = class(TForm)
    Ora_Tree: TOraQuery;
    pn_Top: TPanel;
    pn_Bottom: TPanel;
    OnGrDbGrid1: TOnGrDbGrid;
    Ora_Grid: TOraQuery;
    ds_UserQuery: TDataSource;
    pn_Param: TPanel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    fb_Excute: TOnFocusButton;
    fb_txtSave: TOnFocusButton;
    fb_ExcelSave: TOnFocusButton;
    Label3: TLabel;
    Label4: TLabel;
    sb_Group: TScrollBox;
    Label2: TLabel;
    OnTreeView1: TOnTreeView;
    sb_List: TScrollBox;
    clb_Columns: TPeJeonCheckListBox;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    RE_SQL: TOnRichEdit;
    RE_Content: TOnRichEdit;
    pn_Sql: TPanel;
    Memo1: TMemo;
    sb_Help: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure OnTreeView1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_SearchClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure fb_ExcuteClick(Sender: TObject);
    procedure oed_Search1KeyPress(Sender: TObject; var Key: Char);
    procedure fb_ExcelSaveClick(Sender: TObject);
    procedure fb_txtSaveClick(Sender: TObject);
    procedure clb_ColumnsClickCheck(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OnTreeView1Click(Sender: TObject);
    procedure OnGrDbGrid1Enter(Sender: TObject);
  private
    { Private declarations }
    // ����� ���� ���� üũ
    procedure SQL_ParamCheck;

    // ����� ���� �ʵ� ��ȸ
    procedure SQL_FieldSearch;

    // ����� ���� ����
    procedure ExcuteUserQuery;

    // ���� ����
    function GenerateSql(P_DataSet : TOraQuery) : String;

    // ColRowToRangeStr ���� �࿭������ ��ȯ
    function CRToRS(Col, Row : Integer) : String;

    // filter�� '|'�� ��� Ȯ���� �κ��� ����
    function Tokenizer(P_String : String) : TStringList;

    // Number Type õ ���� ǥ��
    procedure NumberThousandSeperater(XL : Variant; DS : TOraQuery; Last : Integer);
  public
    { Public declarations }
    OriginSql  : String;
    ParamCnt   : Integer;
    CheckedCnt : Integer;
    arr_pn_Param : array of TPanel;
    arr_ed_Param : array of TEdit;
    arr_OnEd_Param : array of TOnEdit;
    SelFields : TStringList;
    Pempno2   : String;
    //procedure WMHotKey(var Message: TWMHotKey); message WM_HotKey;
  end;

var
  InfoSearch2Main: TInfoSearch2Main;

implementation

uses PZZ10602;
{$R *.DFM}

var
  UserAuth : TUserAuth;

// ����� ���� ���� üũ
procedure TInfoSearch2Main.SQL_ParamCheck;
var
  i : Integer;
  SectionLabel1 : TOnSectionLabel;
begin
  // �г� �ڽ� ��Ʈ�� �ʱ�ȭ
  for i := 0 to pn_Param.ControlCount - 1 do
  begin
    pn_Param.Controls[0].Free;
  end;

  with Ora_Grid do
  begin
    Close;
    Sql.Clear;

    Sql.Text := RE_SQL.Text;

    for i := 0 to Fields.Count - 1 do
    begin
      clb_Columns.Items.Add(Fields.Fields[i].FieldName);
    end;

    ParamCnt := Params.Count;

    // ���� üũ
    if ParamCnt > 0 then
    begin
      SetLength(arr_OnEd_Param, ParamCnt);

      // �� ����
      SectionLabel1 := TOnSectionLabel.Create(Self);

      SectionLabel1.Parent  := Pn_Param;
      SectionLabel1.Top     := 8;
      SectionLabel1.Left    := 8;
      SectionLabel1.Width   := 170;
      SectionLabel1.Caption := '�� ���ǰ� �Է�';
      SectionLabel1.Color   := clBlack;
      SectionLabel1.Font.Color  := clWhite;
      SectionLabel1.Font.Size   := 12;
      SectionLabel1.Transparent := False;

      for i := 0 to ParamCnt - 1 do
      begin
        // ���� �Է� ��������
        arr_OnEd_Param[i] := TOnEdit.Create(Self);

        arr_OnEd_Param[i].Parent     := pn_Param;
        arr_OnEd_Param[i].Top        := 60 + (35 * i);
        arr_OnEd_Param[i].Left       := 8;
        arr_OnEd_Param[i].Height     := 25;
        arr_OnEd_Param[i].Width      := 240;
        arr_OnEd_Param[i].EditLabel.Color      := $FF6612;
        arr_OnEd_Param[i].EditLabel.Font.Size  := 12;
        arr_OnEd_Param[i].EditLabel.Font.Style := [fsBold];
        arr_OnEd_Param[i].EditLabel.Font.Color := clWhite;
        arr_OnEd_Param[i].EditLabel.Caption    := Params[i].Name;
        arr_OnEd_Param[i].EditLabel.Width      := 140;
        arr_OnEd_Param[i].OnKeyPress           := oed_Search1KeyPress;

        // ���ĺ� �빮�� ����
        arr_OnEd_Param[i].EditInputMode.IMEkind := edit_hmEnglish;
        arr_OnEd_Param[i].CharCase := ecUpperCase;
      end;

    end
    else
    begin

    end;

    pn_Param.Visible     := True;

    SQL_FieldSearch;
  end;
end;

// ����� ���� ����
procedure TInfoSearch2Main.ExcuteUserQuery;
var
  i : Integer;
  OldSql : String;
begin
  CheckedCnt := 0;

  with Ora_grid do
  begin
    // �ʵ� ���� ���� üũ
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
      if clb_Columns.Checked[i] then inc(CheckedCnt);
    end;

    OnGrDbGrid1.Columns.Clear;

    Sql.Text := GenerateSql(Ora_grid);

    // ���� ��ȿ�� üũ
    if ParamCnt > 0 then
    begin
      for i := 0 to ParamCnt - 1 do
      begin
        if arr_OnEd_Param[i].Text = '' then
        begin
          Showmessage(arr_OnEd_Param[i].EditLabel.Caption+'��(��) �Է��̵��� �ʾҽ��ϴ�.');
          Exit;
        end; // end if

        // ���� �Է�
        ParamByName(arr_OnEd_Param[i].EditLabel.Caption).AsString := arr_OnEd_Param[i].Text;
      end; // end for
    end; // end if

    Open;

    SelFields := nil;

    // �÷����� ����
    for i :=0 to OnGrDbGrid1.Columns.Count - 1 do
    begin

      // Title > Text
      if OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption) > OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text) then
        OnGrDbGrid1.Columns[i].width := 10 + OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption)
      // Title < Text
      else
        OnGrDbGrid1.Columns[i].width := 10 + OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text);

      {Showmessage(IntToStr(OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth('��'))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth('2'))
                 );}
      //Showmessage(IntToStr(OnGrDbGrid1.Columns[i].Field.Size));
      //OnGrDbGrid1.Columns[i].width := 7 * OnGrDbGrid1.Columns[i].Field.Size;
    end;

    sb_Help.Panels[1].Text := '��ȸ�� �Ϸ�Ǿ����ϴ�.';

    fb_ExcelSave.Enabled := True;
    fb_txtSave.Enabled   := True;
  end; // end with
end;

// ����� ���� �ʵ� ��ȸ
procedure TInfoSearch2Main.SQL_FieldSearch;
var
  i : Integer;
begin
  // �ʵ� ����Ʈ �ʱ�ȭ
  clb_Columns.Clear;

  with Ora_Tree do
  begin
    Close;

    Sql.Clear;
    Sql.Text := RE_SQL.Text;

    Open;

    for i := 0 to Fields.Count - 1 do
    begin
      clb_Columns.Items.Add(Fields.Fields[i].FieldName);
    end;
  end;
end;

procedure TInfoSearch2Main.FormCreate(Sender: TObject);
var
  i, j : Integer;
  //tmp_Group : TStringList;
  TreeNode : TTreeNode;
begin
  // ȯ�� ����
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);
  UserAuth := TUserAuth.Create(Self);

  // ���� ���� �ʱ�ȭ
  TreeNode := OnTreeView1.Selected;
  //tmp_Group := TStringList.Create;

  { //���ʿ��� �κ����� �ּ�
  if not (UserAuth.UserAuthority) then
  begin
    Showmessage('�����˻� �� ���α׷��� ��� ������ �����ϴ�!');
    Close;
  end;
  }
  // � �����ڴ� ��� ����� ��������..
  Pempno2 := PassEmp(cmdline,1);
  if Copy(Pempno,1,1) = 'D' then
    Pempno := '0000';


  // �׷� ���� ��ȸ
  UserAuth.GroupAuthority(Pempno);

  if UserAuth.Ora_Auth.RecordCount = 0 then
  begin
    showmessage('��ȸ�� ������ �����ϴ�.');
    exit;
  end;

  // ���� �ִ� �׷츸 Ʈ���� ���
  for i := 0 to UserAuth.Ora_Auth.RecordCount - 1 do
  begin
    OnTreeView1.Items.Insert(TreeNode,UserAuth.Ora_Auth.FieldbyName('GROUPNAME').AsString);
    //tmp_Group.Add(UserAuth.Ora_Auth.FieldbyName('GROUPNAME').AsString);

    UserAuth.Ora_Auth.Next;
  end;
  UserAuth.Ora_Auth.Close;

  // ����Ű ���� - �𺧷��� F9�� �ȸ���
  {if RegisterHotKey(Self.Handle, GlobalAddAtom('SampleHotKeyForm'),
                    0, VK_F9) = False then
    ShowMessage('��Ű��� ����');}

  label3.Caption := '�� �����˻� �������(���)                                     ' + #13
                  + '1. ����� ���� �׷쿡�� ���� �����Ͽ� ����Ŭ��                 ' + #13
                  + '2. ���� ��������Ǹ� ������ üũ�ڽ� ����(Ư���ʵ常 ���� ����)' + #13
                  + '3. ���ǰ� �Է��� �䱸�ϴ� ���ǽ� ���ǰ� �Է�(������ Pass)      ';
  label4.Caption :=  #13 + '4. ����� "�����" ��ư Ŭ��                                   ' + #13
                  + '5. ����� "��Excel����" �Ǵ� "��Text����" Ŭ��                 ';

  // 1034 - 546
  pn_Bottom.Height := Floor(InfoSearch2Main.Height * 0.5);
end;


procedure TInfoSearch2Main.OnTreeView1DblClick(Sender: TObject);
var
  i, j, Level, LineCnt : Integer;
  SelTreeNode : TTreeNode;
  GroupName : String;
begin
  // ���� ���� �ʱ�ȭ
  SelTreeNode := OnTreeView1.Selected;
  GroupName := SelTreeNode.Text;
  Level := SelTreeNode.Level;

  fb_ExcelSave.Enabled := False;
  fb_txtSave.Enabled   := False;

  with Ora_Tree, OnTreeView1 do
  begin

    if Level = 0 then  // �ֻ��� �϶�
    begin
      Close;

      Sql.Clear;
      Sql.Add('SELECT QUERYNAME              ');
      Sql.Add('  FROM AQUSERQUERY            ');
      Sql.Add(' WHERE GROUPNAME = :GroupName ');
      //Sql.Add('   AND USERID = :Pempno       ');
      Sql.Add(' ORDER BY                     ');
      Sql.Add('       SEQNO                  ');

      ParamByName('GroupName').AsString := GroupName;
      //ParamByName('Pempno').AsString    := Pempno;

      Open;

      if SelTreeNode.Count = 0 then // �ڽĳ�尡 ���� ����
      begin                         // ������ �߰�, ������ �н�
        for i := 0 to Ora_Tree.RecordCount - 1 do
        begin
          Items.AddChild(SelTreeNode,Ora_Tree.FieldbyName('QUERYNAME').AsString);
          Ora_Tree.Next;
        end; // for end

        // ��ħ
        SelTreeNode.Expand(True);
      end
    end
    else if Level = 1 then // ���� �϶�
    begin
      CheckBox1.Checked := False;
      Close;

      Sql.Clear;
      Sql.Add('SELECT USERSQL, CONTENT      ');
      Sql.Add('  FROM AQUSERQUERY            ');
      Sql.Add(' WHERE QUERYNAME = :GroupName ');
      //Sql.Add('   AND USERID = :Pempno       ');
      Sql.Add(' ORDER BY                     ');
      Sql.Add('       SEQNO                  ');

      ParamByName('GroupName').AsString := GroupName;
      //ParamByName('Pempno').AsString    := Pempno;

      Open;

      Label1.Caption := GroupName;
      RE_SQL.Lines.Text     := Ora_Tree.FieldbyName('USERSQL').AsString;
      RE_Content.Lines.Text := Ora_Tree.FieldbyName('CONTENT').AsString;
      // �����ڸ� SQL���� ���̰�
      if Copy(Pempno2,1,1) = 'D' then
      begin
        Memo1.Lines.Text := RE_SQL.Text;
        Memo1.Visible := True;
      end;
      OriginSql := RE_SQL.Text;

      // �Ķ���� üũ
      SQL_ParamCheck;

      fb_Excute.Enabled := True;
      CheckBox1.Checked := True;
    end;
  end; // with end

  OnTreeView1.Height := sb_Group.Height - Floor(sb_Group.Height * 0.1);;
  sb_Group.BringToFront;
end;


procedure TInfoSearch2Main.FormDestroy(Sender: TObject);
begin
  //UnRegisterHotKey(Self.Handle, GlobalAddAtom('SampleHotKeyForm'));
  InfoSearch2Main := nil;
end;

procedure TInfoSearch2Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;


procedure TInfoSearch2Main.Btn_SearchClick(Sender: TObject);
begin
   ExcuteUserQuery;
end;

procedure TInfoSearch2Main.CheckBox1Click(Sender: TObject);
var
  i, not_cnt : Integer;
begin
  if clb_Columns.Items.Count = 0 then
  begin
    CheckBox1.Checked := False;
    Exit;
  end;

  not_cnt := 0;

  // ��ü üũ ���
  if CheckBox1.Checked then
  begin
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
       clb_Columns.Checked[i] := True;
    end;
  end
  else
  begin
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
      if not clb_Columns.Checked[i] then
      begin
        inc(not_cnt);
      end; // if end
    end; // for end

    if not_cnt <> 0 then
      CheckBox1.Checked := False
    else
    begin
      for i := 0 to clb_Columns.Items.Count - 1 do
      begin
        clb_Columns.Checked[i] := False;
      end; // for end
    end; // if end
  end; // with end
end;

// ���� ����
function TInfoSearch2Main.GenerateSql(P_DataSet: TOraQuery): String;
var
  i : Integer;
begin

  with P_DataSet do
  begin
    // 1. �ʵ� ����
    // �ʵ� ���� ���� ���
    if (CheckedCnt > 0) and (CheckedCnt <> clb_Columns.Items.Count)  then
    begin
      SelFields := TStringList.Create;

      //Close;
      Sql.Clear;
      SQL.Text := OriginSql;
      Open;
      for i := 0 to P_DataSet.FieldList.Count - 1 do
      begin
        if clb_Columns.Checked[i] then
        begin
          IntToStr(SelFields.Add(clb_Columns.Items[i]));
        end;
      end;

      Sql.Clear;
      Sql.Add('Select              ');
      Sql.Add('                    ');
      // ������ �ʵ� �����ֱ�
      for i := 0 to SelFields.Count - 1 do
      begin
        if i = 0 then
          Sql.Add('       "'+SelFields.Strings[i] + '"' )
        else
          Sql.Add('      ,"'+SelFields.Strings[i] + '"' );
      end;
      Sql.Add('  from              ');
      Sql.Add('      (             ');
      Sql.Add(        OriginSql     );
      Sql.Add('      ) T1          ');

    end
    else
    begin
      Sql.Clear;
      //SQL.Text := OriginSql;
      Sql.Add('Select              ');
      Sql.Add('       *            ');
      Sql.Add('  from              ');
      Sql.Add('      (             ');
      Sql.Add(        OriginSql     );
      Sql.Add('      ) T1          ');

    end; // end if


  end;

  //pn_Condition.Visible := True;

  Result := P_DataSet.Sql.Text;
end;

procedure TInfoSearch2Main.fb_ExcuteClick(Sender: TObject);
begin
  ExcuteUserQuery;

  sb_Group.SendToBack;
end;

procedure TInfoSearch2Main.oed_Search1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    ExcuteUserQuery;
end;

// Excel ����
procedure TInfoSearch2Main.fb_ExcelSaveClick(Sender: TObject);
var
  XL, XArr : Variant;
  i, k : integer;
  FieldCnt : Integer;
begin
  if Trim(OnGrDbGrid1.Fields[0].Text) = '' then
  begin
    Showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�!');
    Exit;
  end;

  sb_Help.Panels[1].Text := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  FieldCnt := OnGrDbGrid1.FieldCount;
  XArr := VarArrayCreate([1, FieldCnt], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
    sb_Help.Panels[1].Text := '';
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  SB_help.Panels[1].Text := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := Label1.Caption;  //��Ʈ�� �ο�
  XL.Range['A1:'+CRToRS(FieldCnt,2)].Merge; //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := Label1.Caption;
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����
  for i := 1 to FieldCnt do
  begin
    XArr[i]  := OnGrDbGrid1.Fields[i-1].FieldName;
  end;

  XL.Range['A3' , CRToRS(FieldCnt,3)].Value := XArr;
  for i := 1 to FieldCnt do
  begin
    XL.Range[CRToRS(i,3)].HorizontalAlignment := 3;
    XL.Range[CRToRS(i,3)].Interior.Color:= $00CBF0B3;
    XL.Range[CRToRS(i,3)].font.Size := 10;
    XL.Range[CRToRS(i,3)].font.Bold := True;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  k := 3;
  Ora_Grid.DisableControls;
  Ora_Grid.First;

  while(true) do
  begin
    for i := 1 to FieldCnt do
    begin
      // FieldType�� ���� ������ ���
      // ���� Ÿ��
      if Ora_Grid.Fields[i-1].DataType in [ftSmallint, ftInteger] then
        XArr[i]  := Ora_Grid.Fields[i-1].AsInteger
      // �Ǽ� Ÿ��
      else if Ora_Grid.Fields[i-1].DataType in [ftWord, ftFloat] then
        XArr[i]  := Ora_Grid.Fields[i-1].AsFloat
      // ���� Ÿ��
      else if Ora_Grid.Fields[i-1].DataType = ftString then
        XArr[i]  := Ora_Grid.Fields[i-1].AsString;
    end;
    XL.Range['A'+IntToStr(k+1) , CRToRS(FieldCnt,k+1)].NumberFormat := AnsiChar('@');
    XL.Range['A'+IntToStr(k+1) , CRToRS(FieldCnt,k+1)].Value := XArr;
    inc(k);
    Ora_Grid.Next;
    if Ora_Grid.Eof then Break;
  end;
  
  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.LineStyle   := 1;  //�׵θ����� �����.  1�� �Ǽ�
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.Weight      := 2;  //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.ColorIndex  := 1;  //�׵θ��� ������  1�� ������
  XL.Range['A1', CRToRS(FieldCnt,k)].font.name := '���� ���';  //'����ü';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;   //��� ����
  XL.Range['A3', CRToRS(FieldCnt,k)].font.Size           := 9;
  XL.Range['A4', CRToRS(FieldCnt,k)].HorizontalAlignment := 1;  //��������
  XL.Range['A1', CRToRS(FieldCnt,k)].Select;                    //�ڷḦ ��� SELECT�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
  XL.Selection.Columns.AutoFit;                                 //�ڵ�����
  NumberThousandSeperater(XL,Ora_Grid,k);                       //���� Ÿ�� õ ���� ǥ��
  XL.Range['A4', 'A4'].Select;                                  //A4���� Ŀ�� ��ġ��Ŵ
  XL.ActiveWindow.FreezePanes := True;
  XL.Visible := true;                                           //�����ڷ� ������
  Screen.Cursor := crDefault;
  Ora_Grid.EnableControls;
  SB_help.Panels[1].Text := '';
end;

function TInfoSearch2Main.CRToRS(Col, Row: Integer): String;
const
  ALPHA_COUNT = 26;
var
  Col_Str : String;
begin
  col_str := chr(ord('A') + ((col - 1) div alpha_count) - 1);
  if ((col - 1) div alpha_count) = 0 then
    col_str := chr(ord('A') + ((col - 1) mod alpha_count))
  else
    col_str := col_str + chr(ord('A') + ((col - 1) mod alpha_count));

  result := col_str + IntToStr(row);
end;

// Text ����
procedure TInfoSearch2Main.fb_txtSaveClick(Sender: TObject);
var
  sl,sl2 : TStringList;
  i  : Integer;
  tmp,FN : String;
  sd  : TSaveDialog;
begin
  sl := TStringList.Create;
  sd := TSaveDialog.Create(Self);

  Ora_Grid.DisableControls;
  // ��� ����
  for i := 0 to Ora_Grid.FieldCount - 1 do
  begin
    if i = Ora_Grid.FieldCount - 1 then
      tmp := tmp + Ora_Grid.Fields[i].FieldName
    else
      tmp := tmp + Ora_Grid.Fields[i].FieldName + ',';
  end;
  sl.Add(tmp);
  sl.Add('');

  tmp := '';
  Ora_Grid.First;
  // �׸��� ������ ����
  while(True) do
  begin
    tmp := '';
    for i := 0 to Ora_Grid.FieldCount - 1 do
    begin
      if i = Ora_Grid.FieldCount - 1 then
        tmp := tmp + Ora_Grid.Fields[i].Text
      else
        tmp := tmp + Ora_Grid.Fields[i].Text + ',';
    end;

    sl.Add(tmp);
    Ora_Grid.Next;
    if Ora_Grid.Eof then Break;
  end;

  sd.FilterIndex := 1;
  sd.InitialDir  := 'C:\Users\%USERNAME%\Desktop';
  sd.Filter := '�ؽ�Ʈ����(.txt)|*.txt';
  sl2 := Tokenizer(sd.Filter);

  // Ȯ�ν� ����
  if sd.Execute then
  begin
    if Pos(sl2[sd.FilterIndex],sd.FileName) = 0 then
      FN := sd.FileName+sl2[sd.FilterIndex]
    else
      FN := sd.FileName;
    sl.SaveToFile(FN);
    ShellExecute(0, 'open', PChar(FN), nil, '', SW_SHOWNORMAL);
  end;

  sd.Free;
  sl.Free;

end;

// filter�� '|'�� ��� Ȯ���� �κ��� ����
function TInfoSearch2Main.Tokenizer(P_String: String): TStringList;
var
  sl : TStringList;
  len, i : Integer;
  tmp : String;  // �۾� �� ���ڿ�
  tmp_Value, Value : String;
begin
  // Local ���� �ʱ�ȭ
  sl := TStringList.Create;
  sl.Capacity := 3;
  sl.Insert(0,'');
  len := Length(P_String);
  i := 1;

  // �ӽ� ���� tmp�� '|' �� ���� �� ����..
  while(Pos('|',tmp) = 0) do
  begin
    tmp := Copy(P_String,Pos('|',P_String)+1,len);              // 1. �������� '|' ã�Ƽ� +1 ���� ������ ����
    len := Length(tmp);                                         // 1. �۾� �� ���� ����
    tmp_Value := Copy(P_String,1,Pos('|',P_String)-1);          // 2. �������� '|' ã�Ƽ� ó������ -1���� ����
    Value := Copy(P_String,Pos('|',P_String)+1,Pos('|',tmp)-1); // 2. �� ���� ��
    Value := Copy(Value,Pos('*',Value)+1,Length(Value));
    tmp := Copy(tmp,Pos('|',tmp)+1,len);

    sl.Insert(i,Value);
    inc(i);
  end;

  Result := sl;

end;
{
procedure TInfoSearch2Main.WMHotKey(var Message: TWMHotKey);
begin
  Show;
  if fb_Excute.Enabled then
    ExcuteUserQuery;
  //if Message.HotKey = GlobalFindAtom('VK_F10') then
  //showmessage(FloatToStr(Message.HotKey)+'/'+FloatToStr(Message.Result));
  //showmessage(FloatToStr(GlobalFindAtom('VK_F9')));
  //showmessage(FloatToStr(VK_F9));
end;}

procedure TInfoSearch2Main.clb_ColumnsClickCheck(Sender: TObject);
var
  i, not_cnt : Integer;
begin
  not_cnt := 0;
  with clb_Columns do
  begin
    for i := 0 to Items.Count - 1 do
    begin
      if not Checked[i] then
      begin
        inc(not_cnt);
      end; // if end
    end; // for end

    if not_cnt <> 0 then
      CheckBox1.Checked := False
    else
      CheckBox1.Checked := True;

  end; // with end
end;

procedure TInfoSearch2Main.NumberThousandSeperater(XL: Variant; DS : TOraQuery; Last : Integer);
var
  i, FieldCnt : Integer;
begin
  FieldCnt := DS.FieldCount;
  for i := 1 to FieldCnt do
  begin
    // ���� Ÿ���̸�...
    if DS.Fields[i-1].DataType in [ftSmallint, ftInteger, ftWord, ftFloat] then
      XL.Range[CRToRS(i,4), CRToRS(i,Last)].NumberFormatLocal := '###,###,###,##0'
    else
      XL.Range[CRToRS(i,4), CRToRS(i,Last)].NumberFormat := AnsiChar('@');
  end;
end;

procedure TInfoSearch2Main.FormResize(Sender: TObject);
begin
  //showmessage('onResize ' + FloatToStr(InfoSearch2Main.Height * 0.5) + '/' + IntToStr(Floor(InfoSearch2Main.Height * 0.5)));
  pn_Bottom.Height := Floor(InfoSearch2Main.Height * 0.5);
  pn_Bottom.Top := InfoSearch2Main.Height - pn_Bottom.Height;
end;

procedure TInfoSearch2Main.OnTreeView1Click(Sender: TObject);
begin
  //pn_Bottom.SendToBack;
  sb_Group.BringToFront;
end;

procedure TInfoSearch2Main.OnGrDbGrid1Enter(Sender: TObject);
begin
  sb_Group.SendToBack;
  //pn_Bottom.BringToFront;
end;

end.


