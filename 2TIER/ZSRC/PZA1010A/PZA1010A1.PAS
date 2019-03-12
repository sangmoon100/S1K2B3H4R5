unit PZA1010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnGifimage, jpeg, OnScheme, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnShapeLabel, OnLineLabel, ComCtrls, ImgList, StdCtrls,
  OnFocusButton, OnSkinBtn, Grids, DBGrids, OnGrDBGrid, OnEditCombo,
  OnEditNumCtl, OnPopupEdit, OnEditMemo, Db, MemDS, DBAccess, Ora,
  OraError, OnInsaCommon, CheckLst, OnListbox, OnCheckbox, OnListview,
  OnPersonEdit, OnEditMdate, OnRegistry, OnOneInstance, OnRichEdit,
  OnMemDataset, OnExcelExp, OnRadioBtn, Func, Menus, TmaxFunc;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    SB_Help: TStatusBar;
    Panel2: TPanel;
    PG_Work: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    BT_Save: TOnFocusButton;
    BT_Delete: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Find: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    EDS_tier: TOnComboEdit;
    EDS_gubun: TOnComboEdit;
    EDS_progname: TOnEdit;
    BT_Add: TOnFocusButton;
    EDS1_groupname: TOnEdit;
    Grid2: TOnGrDbGrid;
    ED1_content: TOnMemo;
    ED1_groupname: TOnEdit;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    Ora_Qry1: TOraQuery;
    DataSource1: TDataSource;
    Ora_Save: TOraQuery;
    Ora_Check: TOraQuery;
    ED1_groupid: TOnEdit;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    Ora_Qry2: TOraQuery;
    DataSource2: TDataSource;
    OnShapeLabel5: TOnShapeLabel;
    EDS2_groupname: TOnWinPopupEdit;
    Grid3: TOnGrDbGrid;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    Ora_Qry3: TOraQuery;
    DataSource3: TDataSource;
    ED2_prog: TOnButtonEdit;
    LV_prog: TOnListView;
    BT_res: TOnFocusButton;
    LV_res: TOnListView;
    OnShapeLabel9: TOnShapeLabel;
    EDS3_empno: TOnPersonPopupEdit;
    Grid4: TOnGrDbGrid;
    OnShapeLabel10: TOnShapeLabel;
    ED3_groupname: TOnWinPopupEdit;
    EDS3_passtodate: TOnDateEdit;
    ED3_empno: TOnPersonPopupEdit;
    ED3_passtodate: TOnDateEdit;
    ED3_grade: TOnEdit;
    ED3_lockyn: TOnComboEdit;
    EDS3_lockyn: TOnComboEdit;
    Ora_Qry4: TOraQuery;
    DataSource4: TDataSource;
    PG_Sub: TPageControl;
    SubTab1: TTabSheet;
    SubTab2: TTabSheet;
    ED_tier: TOnComboEdit;
    ED_gubun: TOnComboEdit;
    ED_progname: TOnEdit;
    ED_progid: TOnEdit;
    ED_progexe: TOnEdit;
    ED_version: TOnEdit;
    ED_useyn: TOnComboEdit;
    ED_position: TOnEdit;
    ED_upper_progid: TOnWinPopupEdit;
    ED_content: TOnMemo;
    ED_progorder: TOnNumberEdit;
    ED_Help: TOnRichEdit;
    OnShapeLabel11: TOnShapeLabel;
    BT_File: TOnFocusButton;
    DLG_Open: TOpenDialog;
    TabSheet5: TTabSheet;
    EDS4_infofr: TOnDateEdit;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    Grid5: TOnGrDbGrid;
    EDS4_infoto: TOnDateEdit;
    PG_info: TPageControl;
    TAB_info1: TTabSheet;
    ED4_infotitle: TOnEdit;
    TAB_info2: TTabSheet;
    OnShapeLabel14: TOnShapeLabel;
    BT_File2: TOnFocusButton;
    ED4_content: TOnRichEdit;
    ED4_infonum: TOnNumberEdit;
    ED4_infofr: TOnDateEdit;
    ED4_infoto: TOnDateEdit;
    Ora_Qry5: TOraQuery;
    DataSource5: TDataSource;
    ED4_infobmp: TImage;
    OnShapeLabel15: TOnShapeLabel;
    BT_Bmp: TOnFocusButton;
    TabSheet6: TTabSheet;
    ED6_seialno: TOnNumberEdit;
    ED6_filename: TOnEdit;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel17: TOnShapeLabel;
    Grid6: TOnGrDbGrid;
    DataSource6: TDataSource;
    Ora_Qry6: TOraQuery;
    ED6_registry: TOnEdit;
    ED6_exeyn: TOnComboEdit;
    ED6_downyn: TOnComboEdit;
    ED6_value: TOnEdit;
    ED6_installdir: TOnComboEdit;
    ED6_version: TOnEdit;
    PM_menu: TPopupMenu;
    PM_M1: TMenuItem;
    PM_M2: TMenuItem;
    FB_Excel: TOnFocusButton;
    On_Excel: TOnExcelExport;
    EDS_exe: TOnEdit;
    TabSheet7: TTabSheet;
    OnShapeLabel18: TOnShapeLabel;
    GGrid1: TOnGrDbGrid;
    ED_tier_P: TOnComboEdit;
    ED_gubun_P: TOnComboEdit;
    GGrid2: TOnGrDbGrid;
    GGrid3: TOnGrDbGrid;
    OnShapeLabel19: TOnShapeLabel;
    OnShapeLabel20: TOnShapeLabel;
    BT_Add_P: TOnFocusButton;
    BT_Del_P: TOnFocusButton;
    DataSource7: TDataSource;
    Ora_Qry7: TOraQuery;
    L_prognm_P: TOnShapeLabel;
    MD_Data7: TOnMemData;
    MD_Data7tier: TStringField;
    MD_Data7gubun: TStringField;
    MD_Data7progid: TStringField;
    MD_Data7groupid: TStringField;
    MD_Data7groupname: TStringField;
    DataSource8: TDataSource;
    MD_Data8: TOnMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    Ora_Qry9: TOraQuery;
    DataSource9: TDataSource;
    ED_progid_P: TOnEdit;
    BT_VersionUp: TOnFocusButton;
    RB1: TOnRadioButton;
    RB2: TOnRadioButton;
    RB3: TOnRadioButton;
    ED4_infotext: TOnMemo;
    ED4_infoyn: TOnComboEdit;
    CB_user: TCheckBox;
    CB_LockYN: TCheckBox;
    procedure ComboGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_FindClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_DeleteClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure ED_gubunChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormPaint(Sender: TObject);
    procedure ED_upper_progidInitPopup(Sender: TObject);
    procedure ED_upper_progidCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure ED_progidExit(Sender: TObject);
    procedure PG_WorkChange(Sender: TObject);
    procedure EDS2_groupnameInitPopup(Sender: TObject);
    procedure EDS2_groupnameCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure ED2_progButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BT_resClick(Sender: TObject);
    procedure EDS2_groupnameChange(Sender: TObject);
    procedure Grid3ApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure Grid4ApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
    procedure BT_FileClick(Sender: TObject);
    procedure PG_SubChange(Sender: TObject);
    procedure DataSource5DataChange(Sender: TObject; Field: TField);
    procedure BT_BmpClick(Sender: TObject);
    procedure PG_infoChange(Sender: TObject);
    procedure DataSource6DataChange(Sender: TObject; Field: TField);
    procedure PM_M1Click(Sender: TObject);
    procedure PM_M2Click(Sender: TObject);
    procedure FB_ExcelClick(Sender: TObject);
    procedure EDS_FindKeyPress(Sender: TObject; var Key: Char);
    procedure ED2_progKeyPress(Sender: TObject; var Key: Char);
    procedure BT_Add_PClick(Sender: TObject);
    procedure BT_Del_PClick(Sender: TObject);
    procedure GGrid1CellClick(Column: TColumn);
    procedure GGrid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure CB_LockYNClick(Sender: TObject);
    procedure BT_VersionUpClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure CB_userClick(Sender: TObject);
  private
    { Private declarations }
    FL_Start : Boolean;
    FL_Ins1  : Boolean;
    FL_Ins2  : Boolean;
    FL_Ins3  : Boolean;
    FL_Ins4  : Boolean;
    FL_Ins6  : Boolean;

    procedure FL_Ora_Qry1Find;
    procedure FL_Ora_Qry1Save;
    procedure FL_Ora_Qry1Delete;
    procedure FL_Ora_Qry2Find;
    procedure FL_Ora_Qry2Save;
    procedure FL_Ora_Qry2Delete;
    procedure FL_Ora_Qry3Find;
    procedure FL_Ora_Qry3Save;
    procedure FL_Ora_Qry3Delete;
    procedure FL_Ora_Qry4Find;
    procedure FL_Ora_Qry4Save;
    procedure FL_Ora_Qry4Delete;
    procedure FL_Ora_Qry5Find;
    procedure FL_Ora_Qry5Save;
    procedure FL_Ora_Qry5Delete;
    procedure FL_Ora_Qry6Find;
    procedure FL_Ora_Qry6Save;
    procedure FL_Ora_Qry6Delete;
    procedure FL_Ora_Qry7Find;
    procedure FL_Ora_Qry7Save;    

    function  FL_Get_Order : Integer;
    function  FL_Get_infonum : Integer;
    procedure FL_Get_Help;
    procedure FL_Get_InfoContent;
    function  FL_Get_Serial : Integer;
    procedure PL_Prog_Select(AValue : Boolean);

    procedure GridData_Move(FromGrid, ToGrid : TDBGrid; FromDataSet, ToDataSet : TDataSet);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
const
  PassKey : Char = Chr(VK_RETURN);
  
implementation

{$R *.DFM}

uses PZA1010A2, PZA1010A3;

var
  Fm_Menu : TFM_Menu;
  Fm_Prev : TFM_Prev;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  PG_Work.ActivePage := TabSheet1;  
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
  begin
      FL_Start := False;
      SF_Main.Refresh;

      Hinsa_InitComboBox(Self,11,0);
      PG_Work.SetFocus;
      SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';
      Application.ProcessMessages;

      OraConnect;

      Fm_Menu := TFM_Menu.Create(Self);
      Fm_Prev := TFM_Prev.Create(Self);
      SB_Help.Panels[1].Text := '';

      FL_Ins1  := True;
      FL_Ins2  := True;
      FL_Ins3  := True;
      FL_Ins4  := True;
      FL_Ins6  := True;
      PG_Work.ActivePage.ImageIndex := 0;
      EDS_exe.SetFocus;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Fm_Menu.Free;
  Fm_Prev.Free;
  Fm_Menu := nil;
  Fm_Prev := nil;
  CanClose := True;
end;

procedure TMainForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BT_FindClick(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 데이타 조회중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);
  if PG_Work.ActivePage = TabSheet1 then  FL_Ora_Qry1Find;
  if PG_Work.ActivePage = TabSheet2 then  FL_Ora_Qry2Find;
  if PG_Work.ActivePage = TabSheet3 then  FL_Ora_Qry3Find;
  if PG_Work.ActivePage = TabSheet4 then  FL_Ora_Qry4Find;
  if PG_Work.ActivePage = TabSheet5 then  FL_Ora_Qry5Find;
  if PG_Work.ActivePage = TabSheet6 then  FL_Ora_Qry6Find;
  if PG_Work.ActivePage = TabSheet7 then  FL_Ora_Qry7Find;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.BT_AddClick(Sender: TObject);
begin
  if PG_Work.ActivePage = TabSheet1 then
  begin
      FL_Ins1 := True;
      ED_tier.Enabled   := True;
      ED_gubun.Enabled  := True;
      ED_progid.Enabled := True;
      Hinsa_InitComponent(Self,11);
      Hinsa_InitComboBox(Self,11,0);
      ED_Help.Lines.Clear;
      PG_Sub.ActivePage := SubTab1;
      ED_progid.SetFocus;
  end;

  if PG_Work.ActivePage = TabSheet2 then
  begin
      FL_Ins2 := True;
      ED1_groupid.Enabled := True;
      Hinsa_InitComponent(Self,22);
      ED1_groupid.SetFocus;
  end;
  if PG_Work.ActivePage = TabSheet4 then
  begin
      FL_Ins3 := True;
      ED3_empno.empno   := '';
      ED3_empno.Text    := '';
      ED3_empno.Enabled := True;
      Hinsa_InitComponent(Self,33);
      Hinsa_InitComboBox(Self,33,0);
      ED3_empno.SetFocus;
  end;
  if PG_Work.ActivePage = TabSheet5 then
  begin
      ED4_infonum.Enabled := True;
      ED4_infofr.Enabled  := True;
      ED4_infoto.Enabled  := True;
      FL_Ins4             := True;
      ED4_infobmp.Picture := nil;
      Hinsa_InitComponent(Self,55);
      ED4_content.Lines.Clear;
      ED4_infonum.Value := FL_Get_infonum;
      PG_info.ActivePage := TAB_info1;
      ED4_infofr.SetFocus;
  end;
  if PG_Work.ActivePage = TabSheet6 then
  begin
      ED6_seialno.Enabled := True;
      FL_Ins6             := True;
      Hinsa_InitComponent(Self,66);
      Hinsa_InitComboBox(Self,66,0);
      ED6_seialno.Value := FL_Get_Serial;
      ED6_filename.SetFocus;
  end;
end;

procedure TMainForm.BT_SaveClick(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 데이타 저장중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);
  if PG_Work.ActivePage = TabSheet1 then FL_Ora_Qry1Save;
  if PG_Work.ActivePage = TabSheet2 then FL_Ora_Qry2Save;
  if PG_Work.ActivePage = TabSheet3 then FL_Ora_Qry3Save;
  if PG_Work.ActivePage = TabSheet4 then FL_Ora_Qry4Save;
  if PG_Work.ActivePage = TabSheet5 then FL_Ora_Qry5Save;
  if PG_Work.ActivePage = TabSheet6 then FL_Ora_Qry6Save;
  if PG_Work.ActivePage = TabSheet7 then FL_Ora_Qry7Save;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.BT_DeleteClick(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 데이타 삭제중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);
  if PG_Work.ActivePage = TabSheet1 then FL_Ora_Qry1Delete;
  if PG_Work.ActivePage = TabSheet2 then FL_Ora_Qry2Delete;
  if PG_Work.ActivePage = TabSheet3 then FL_Ora_Qry3Delete;
  if PG_Work.ActivePage = TabSheet4 then FL_Ora_Qry4Delete;
  if PG_Work.ActivePage = TabSheet5 then FL_Ora_Qry5Delete;
  if PG_Work.ActivePage = TabSheet6 then FL_Ora_Qry6Delete;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.ComboGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TMainForm.ED_progidExit(Sender: TObject);
begin
  ED_progexe.Text := ED_progid.Text;
end;

procedure TMainForm.ED_gubunChange(Sender: TObject);
begin
  {if TOnComboEdit(Sender).ItemIndex = 7 then //if TOnComboEdit(Sender).ItemIndex = 6 then dsa2000
  begin
       ED_tier.ItemIndex    := 0;
       ED_progid.Text       := 'P0000000';
       ED_upper_progid.Text := '00000000';
       ED_progname.Text     := '종합인사정보시스템';
       ED_progid.ReadOnly   := True;
       ED_progname.ReadOnly := True;
  end
  else
  begin
       ED_progid.ReadOnly   := False;
       ED_progname.ReadOnly := False;
  end;}
end;

procedure TMainForm.PG_WorkChange(Sender: TObject);
begin
  if PG_Work.ActivePage = TabSheet1 then EDS_exe.SetFocus;

  if   PG_Work.ActivePage = TabSheet3 then
  begin
       BT_Add.Enabled    := False;
       BT_Delete.Enabled := True;
  end
  else if PG_Work.ActivePage = TabSheet7 then
  begin
       BT_Add.Enabled    := False;
       BT_Delete.Enabled := False;
  end
  else
  begin
       BT_Add.Enabled    := True;
       BT_Delete.Enabled := True;
  end;

  if PG_Work.ActivePage = TabSheet2 then  FL_Ora_Qry2Find;
  if PG_Work.ActivePage = TabSheet4 then  EDS3_lockyn.ItemIndex := 0;
  if PG_Work.ActivePage = TabSheet5 then  FL_Ora_Qry5Find;
  if PG_Work.ActivePage = TabSheet6 then  FL_Ora_Qry6Find;
end;

procedure TMainForm.PG_SubChange(Sender: TObject);
begin
  if PG_Sub.ActivePage = SubTab2 then
  begin
      if Ora_Qry1.Active then FL_Get_Help;
  end;
end;

procedure TMainForm.PG_infoChange(Sender: TObject);
begin
  if PG_info.ActivePage = TAB_info2 then
  begin
      if Ora_Qry5.Active then FL_Get_InfoContent;
  end;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Hinsa_FieldDisplay(Self,Ora_Qry1,4,11);
  FL_Get_Help;
  ED_tier.Enabled   := False;
  ED_gubun.Enabled  := False;
  ED_progid.Enabled := False;
  FL_Ins1           := False;
end;

procedure TMainForm.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  Hinsa_FieldDisplay(Self,Ora_Qry2,5,22);
  ED1_groupid.Enabled := False;
  FL_Ins2             := False;
end;

procedure TMainForm.DataSource4DataChange(Sender: TObject; Field: TField);
var
  FL_Out : String;
begin
  Hinsa_FieldDisplay(Self,Ora_Qry4,5,33);
  ED3_empno.Text    := Ora_Qry4.FieldByName('korname').AsString;
  if ED3_empno.Text = '' then  ED3_empno.Text := Ora_Qry4.FieldByName('empno').AsString;
  ED3_empno.empno   := Ora_Qry4.FieldByName('empno').AsString;
  ED3_groupname.Hint:= Ora_Qry4.FieldByName('groupid').AsString;

  //Decode(Ora_Qry4.FieldByName('password').AsString, FL_Out, PassKey);  //2013.11. 비밀번호 삭제(암호화 작업)
  //ED3_password.Text := FL_Out;
  ED3_empno.Enabled := False;
  FL_Ins3           := False;
end;

procedure TMainForm.DataSource5DataChange(Sender: TObject; Field: TField);
begin
  Hinsa_FieldDisplay(Self,Ora_Qry5,5,55);
  ED4_infoyn.Text     := Ora_Qry5.FieldByName('infoyn').AsString;
  ED4_infobmp.Picture := nil;
  ED4_infobmp.Picture.Assign(Ora_Qry5.FieldByName('infobmp'));
  FL_Get_InfoContent;
  ED4_infonum.Enabled := False;
  ED4_infofr.Enabled  := False;
  //ED4_infoto.Enabled  := False;
  FL_Ins4             := False;
end;

procedure TMainForm.DataSource6DataChange(Sender: TObject; Field: TField);
begin
  Hinsa_FieldDisplay(Self,Ora_Qry6,5,66);
  ED6_seialno.Enabled := False;
  FL_Ins6 := False;
  if ED6_installdir.ItemIndex < 0 then ED6_installdir.Text := Ora_Qry6.FieldByName('installdir').AsString;
end;

procedure TMainForm.ED_upper_progidInitPopup(Sender: TObject);
begin
  Fm_Menu.Edit := TOnWinPopupEdit(Sender);
  Fm_Menu.BT_FindClick(Fm_Menu.BT_Find);
  TOnWinPopupEdit(Sender).PopupControl := Fm_Menu;
end;

procedure TMainForm.ED_upper_progidCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then TOnWinPopupEdit(Sender).Text := Fm_Menu.Ora_qry1.FieldByName('progid').AsString;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  if FL_Text <> TOnWinPopupEdit(Sender).Text then ED_progorder.Value := FL_Get_Order;
end;

procedure TMainForm.EDS2_groupnameInitPopup(Sender: TObject);
begin
  Fm_Prev.Edit := TOnWinPopupEdit(Sender);
  Fm_Prev.Data_Find;
  TOnWinPopupEdit(Sender).PopupControl := FM_Prev;
end;

procedure TMainForm.EDS2_groupnameCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
begin
  if Accept then
  begin
       TOnWinPopupEdit(Sender).Text := Fm_Prev.Ora_qry1.FieldByName('groupname').AsString;
       TOnWinPopupEdit(Sender).Hint := Fm_Prev.Ora_qry1.FieldByName('groupid').AsString;
       if TOnWinPopupEdit(Sender).Name = 'EDS2_groupname' then BT_FindClick(Sender);
  end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TMainForm.EDS2_groupnameChange(Sender: TObject);
begin
  LV_Prog.Items.Clear;
  LV_res.Items.Clear;
end;

procedure TMainForm.ED2_progButtonClick(Sender: TObject; ButtonIndex: Integer);
var
  FL_Sql  : String;
  FL_Item : TListItem;
begin
  Ora_Check.Session := Ora_Session;
  with Ora_Check do
  begin
      Close;
      Sql.Clear;

      FL_Sql := 'SELECT A.progname, A.progid, A.gubun, A.tier, '+
                '       DECODE(A.tier,''1'',''공통'',          '+
                '                     ''2'',''2Tier'',         '+
                '                     ''3'',''3Tier'') tiername'+
                '  FROM pymenulist A                           '+
                ' WHERE (A.tier = ''2''                        '+
                '    OR  A.tier = ''3'')                       '+
                '   AND A.progname LIKE ''%s''                 '+
                '   AND NOT EXISTS                             '+
                '       (SELECT progid                         '+
                '          FROM pymenuright                    '+
                '         WHERE groupid = ''%s''               '+
                '           AND tier    = A.tier               '+
                '           AND gubun   = A.gubun              '+
                '           AND progid  = A.progid)            '+
                ' Order By A.progname                          ';
      FL_Sql := Format(FL_Sql,['%'+ED2_prog.Text+'%', EDS2_groupname.Hint]);
      Sql.Text := FL_Sql;
      Open;

      LV_Prog.Items.Clear;
      while not Eof do
      begin
           FL_Item := LV_Prog.Items.Add;
           FL_Item.SubItems.Add(FieldByName('tiername').AsString);
           FL_Item.SubItems.Add(FieldByName('progname').AsString);
           FL_Item.SubItems.Add(FieldByName('tier').AsString);
           FL_Item.SubItems.Add(FieldByName('gubun').AsString);
           FL_Item.SubItems.Add(FieldByName('progid').AsString);
           Next;
      end;
      Close;
    end;
end;

procedure TMainForm.BT_resClick(Sender: TObject);
var
  FL_Sql  : String;
  FL_Item : TListItem;
begin
  Ora_Check.Session := Ora_Session;
  with Ora_Check do
  begin
       Close;
       Sql.Clear;

       FL_Sql := 'SELECT A.menu_level, A.progname, A.tier, A.gubun, A.progid, '+
                 '       DECODE(A.tier,''1'',''공통'',    '+
                 '                     ''2'',''2Tier'',  '+
                 '                     ''3'',''3Tier'') tiername, A.useyn '+
                 '  FROM '+
                 '  (    '+
                 '    SELECT LEVEL - 1 menu_level, SUBSTR(RPAD('' '', (LEVEL-1)*4) || progname,1,50) progname, '+
                 '           tier, gubun, progid, useyn, progorder '+
                 '      FROM pymenulist          '+
                 '     START WITH tier = ''1'' AND gubun = ''0'' AND progid = ''P0000000''  '+
                 '     CONNECT BY upper_progid = PRIOR progid '+
                 '  ) A  '+
                 ' WHERE EXISTS '+
                 '       (SELECT progid      '+
                 '          FROM pymenuright '+
                 '         WHERE groupid = ''%s''   '+
                 '           AND tier    = A.tier   '+
                 '           AND gubun   = A.gubun  '+
                 '           AND progid  = A.progid)'+
                 '    OR A.tier  = ''1'' '+
                 '   AND A.useyn = ''Y'' ';
       FL_Sql := Format(FL_Sql,[EDS2_groupname.Hint]);
       Sql.Text := FL_Sql;
       Open;
       LV_res.Items.Clear;
       while not Eof do
       begin
            FL_Item := LV_res.Items.Add;
            FL_Item.Caption := FieldByName('tiername').AsString;
            FL_Item.SubItems.Add(FieldByName('progname').AsString);
            Next;
       end;
       Close;
  end;
end;

procedure TMainForm.BT_FileClick(Sender: TObject);
begin
  DLG_Open.DefaultExt := '*.rtf';
  DLG_Open.Filter     := '도움말화일|*.rtf';
  if DLG_Open.Execute then
  begin
       if TComponent(Sender).Name = 'BT_File' then ED_Help.Lines.LoadFromFile(DLG_Open.FileName)
       else                                        ED4_content.Lines.LoadFromFile(DLG_Open.FileName);
  end;
end;

procedure TMainForm.BT_BmpClick(Sender: TObject);
begin
  DLG_Open.DefaultExt := '*.bmp';
  DLG_Open.Filter     := '도움말화일|*.bmp';
  if DLG_Open.Execute then
  begin
      ED4_infobmp.Picture.LoadFromFile(DLG_Open.FileName);
  end;
end;

procedure TMainForm.Grid3ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if Ora_Qry3.FieldByName('progname').AsString = '미 존재 프로그램목록' then
  begin
       Canvas.Font.Color := clRed;
       Canvas.Font.Style := [fsStrikeOut];
  end;
end;

procedure TMainForm.Grid4ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (Ora_Qry4.FieldByName('groupname').AsString = '') or (Ora_Qry4.FieldByName('korname').AsString = '') then
  begin
      Canvas.Font.Color := clRed;
      Canvas.Font.Style := [fsStrikeOut];
  end;
end;

//dsa2000  2016.11.16 Add
procedure TMainForm.FL_Ora_Qry1Find;
var
  FL_Sql : String;
  FL_And : Integer;
begin
  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
  begin
       Close;
       Sql.Clear;

       FL_Sql := 'SELECT A.menu_level, A.tier,                                        '+
                 '       DECODE(A.tier, ''1'',''공통'',                               '+
                 '                      ''2'',''2Tier'',                              '+
                 '                      ''3'',''3Tier'') tiername,                    '+
                 '       DECODE(A.gubun,''0'',''종합인사정보시스템'',                 '+
                 '                      ''1'',''인사'',                               '+
                 '                      ''2'',''급여'',                               '+
                 '                      ''3'',''평가'',                               '+
                 '                      ''4'',''복리후생/우리사주'',                  '+
                 '                      ''5'',''기타'',                               '+
                 '                      ''6'',''방문예약'',                           '+//방문예약 미사용
                 '                      ''7'',''교육'' )    gubunname,                '+
                 '       A.gubun, A.progid, A.progname, A.progexe, A.upper_progid,    '+
                 '       A.version, A.useyn, A.position, A.content, A.progorder       '+
                 '  FROM                                                              '+
                 '  (                                                                 '+
                 '    SELECT LEVEL - 1 menu_level, SUBSTR(RPAD('' '', (LEVEL-1)*4) || progname,1,50) progname, '+
                 '           tier,  gubun, progid, progexe, upper_progid,             '+
                 '           version, useyn, position, content, progorder             '+
                 '      FROM pymenulist                                               '+
                 '     START WITH tier = ''1'' AND gubun = ''0'' AND progid = ''%s''  '+
                 '     CONNECT BY upper_progid = PRIOR progid                         '+
                 '  ) A                                                               '+
                 ' WHERE A.progname Like ''%s''                                       ';

       FL_And := 0;
       if EDS_tier.ItemIndex > 0 then
       begin
            FL_And := 1;
            FL_Sql := FL_Sql +  ' AND A.tier = ''%s'' ';
       end;
       if EDS_gubun.ItemIndex > 0 then
       begin
            if  FL_And = 1 then FL_And := 3
            else                FL_And := 2;
            FL_Sql := FL_Sql +  ' AND A.gubun = ''%s'' ';
       end;
       if FL_And = 0 then FL_Sql := Format(FL_Sql,['P0000000', '%'+ EDS_progname.Text +'%']);
       if FL_And = 1 then FL_Sql := Format(FL_Sql,['P0000000', '%'+ EDS_progname.Text +'%',EDS_tier.KeyItems[EDS_tier.ItemIndex]]);
       if FL_And = 2 then FL_Sql := Format(FL_Sql,['P0000000', '%'+ EDS_progname.Text +'%',EDS_gubun.KeyItems[EDS_gubun.ItemIndex]]);
       if FL_And = 3 then FL_Sql := Format(FL_Sql,['P0000000', '%'+ EDS_progname.Text +'%',
                                    EDS_tier.KeyItems[EDS_tier.ItemIndex], EDS_gubun.KeyItems[EDS_gubun.ItemIndex]]);
       if EDS_exe.Text <> '' then FL_Sql := FL_Sql + Format(' AND A.progexe LIKE ''%s''',['%'+ UpperCase(EDS_exe.Text) +'%']);

       Sql.Text := FL_Sql + ' Order By A.gubun, A.progid, A.tier ';     //Memo1.Text := sql.text;
       Open;
  end;
end;

procedure TMainForm.FL_Ora_Qry2Find;
var
  FL_Sql : String;
begin
  Ora_Qry2.Session := Ora_Session;
  with Ora_Qry2 do
  begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT groupid, groupname, content '+
                '  FROM pymenugroup                 '+
                ' WHERE groupname LIKE ''%s''       '+
                ' Order By 1                        ';
      FL_Sql := Format(FL_Sql,['%'+EDS1_groupname.Text+'%']);

      Sql.Text := FL_Sql;
      Open;
  end;
end;

procedure TMainForm.FL_Ora_Qry3Find;
var
  FL_Sql, vTier : String;
begin
  if      RB1.Checked then vTier := '%'
  else if RB2.Checked then vTier := '2'
  else if RB3.Checked then vTier := '3';

  Ora_Qry3.Session := Ora_Session;
  with Ora_Qry3 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := 'SELECT DECODE(B.tier, ''1'',''공통'',                    '+#13+
                 '                      ''2'',''2Tier'',                   '+#13+
                 '                      ''3'',''3Tier'') tiername,         '+#13+
                 '       DECODE(B.gubun,''0'',''종합인사정보시스템'',      '+#13+
                 '                      ''1'',''인사'',                    '+#13+
                 '                      ''2'',''급여'',                    '+#13+
                 '                      ''3'',''평가'',                    '+#13+
                 '                      ''4'',''복리후생/우리사주'',       '+#13+
                 '                      ''5'',''기타'',                    '+#13+
                 '                      ''6'',''방문예약'',                '+#13+//미사용
                 '                      ''7'',''교육'' )    gubunname,     '+#13+
                 '       B.tier, B.gubun, B.progid,                        '+#13+
                 '       NVL(A.progname,''미 존재 프로그램목록'') progname '+#13+
                 '  FROM pymenulist A, pymenuright B                       '+#13+
                 ' WHERE B.groupid = '''+ EDS2_groupname.Hint +'''         '+#13+
                 '   AND B.tier    = A.tier(+)                             '+#13+
                 '   AND B.gubun   = A.gubun(+)                            '+#13+
                 '   AND B.progid  = A.progid(+)                           '+#13+
                 '   AND B.tier    like '''+ vTier + '''                   '+#13+
                 ' Order By B.gubun, B.progid, B.tier                      ';
       Sql.Text := FL_Sql;     //Edit1.Text := sql.text;
       Open;
  end;
end;

procedure TMainForm.RB1Click(Sender: TObject);
begin
  BT_FindClick(Sender);
end;

procedure TMainForm.FL_Ora_Qry4Find;
var
  FL_Sql, FL_Lockyn : String;
begin
  if       EDS3_lockyn.ItemIndex = 0 then FL_Lockyn := '%'
  else if  EDS3_lockyn.ItemIndex = 1 then FL_Lockyn := 'N'
  else if  EDS3_lockyn.ItemIndex = 2 then FL_Lockyn := 'Y';

  Ora_Qry4.Session := Ora_Session;
  with Ora_Qry4 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := 'SELECT A.empno, A.groupid,                                     '+
//                 '       A.passtodate, A.lockyn, A.grade, B.groupname, C.korname '+
                 '       A.passtodate, A.lockyn, A.grade, B.groupname,           '+ 
                 '       Decode(C.korname,Null,(select kname from pzsubmas where A.empno = empno),C.korname) korname '+  ////도급인력 추가 2014.03.
                 '  FROM pymenuuser A, pymenugroup B, pimpmas C                  '+
                 ' WHERE (A.empno      LIKE ''%s'' or  A.korname LIKE   ''%s'')  '+
                 '   AND C.empno(+)   = A.empno                                  '+
                 '   AND B.groupid    = A.groupid                                '+
                 '   AND A.lockyn     like ''%s''                                ';
                 
       if EDS3_passtodate.NoFormatDate <> '00000000' then FL_Sql := FL_Sql + '  AND A.passtodate <= ''%s'' ';

       FL_Sql := FL_Sql + ' Order By A.empno ';

       if   EDS3_passtodate.NoFormatDate <> '00000000' then
            FL_Sql := Format(FL_Sql,[EDS3_empno.Text+'%','%'+EDS3_empno.Text+'%', FL_Lockyn, EDS3_passtodate.Text])
       else FL_Sql := Format(FL_Sql,[EDS3_empno.Text+'%','%'+EDS3_empno.Text+'%', FL_Lockyn ]);
       Sql.Text := FL_Sql;
       Open;
       
       FieldByName('passtodate').EditMask := '!9999-99-99;0;';
     {
       if (Copy(Ora_Qry4.FieldByName('empno').AsString,1,1) = 'U') then //도급인력 추가 2014.03.
       begin
            Close;
            Sql.Clear;
            FL_Sql := 'SELECT A.empno, A.groupid,                                     '+
                      '       A.passtodate, A.lockyn, A.grade, B.groupname, C.kname korname  '+
                      '  FROM pymenuuser A, pymenugroup B, Pzsubmas C                 '+
                      ' WHERE (A.empno      LIKE ''%s'' or  A.korname LIKE   ''%s'')  '+
                      '   AND C.empno(+)   = A.empno                                  '+
                      '   AND B.groupid    = A.groupid                                '+
                      '   AND A.lockyn     like ''%s''                                ';

            if EDS3_passtodate.NoFormatDate <> '00000000' then FL_Sql := FL_Sql + '  AND A.passtodate <= ''%s'' ';

            FL_Sql := FL_Sql + ' Order By A.empno ';

            if   EDS3_passtodate.NoFormatDate <> '00000000' then
                 FL_Sql := Format(FL_Sql,[EDS3_empno.Text+'%','%'+EDS3_empno.Text+'%', FL_Lockyn, EDS3_passtodate.Text])
            else FL_Sql := Format(FL_Sql,[EDS3_empno.Text+'%','%'+EDS3_empno.Text+'%', FL_Lockyn ]);

            Sql.Text := FL_Sql;
            Open;

            FieldByName('passtodate').EditMask := '!9999-99-99;0;';
       end;      }
  end;
end;

procedure TMainForm.FL_Ora_Qry5Find;
var
  FL_Sql : String;
begin
  Ora_Qry5.Session := Ora_Session;
  with Ora_Qry5 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := 'SELECT infonum, infotitle, infofr, infoto, infobmp, infotext, infoyn '+
                 '  FROM pyinfo       '+
                 ' WHERE infonum >= 0 ';
       if EDS4_infofr.NoFormatDate <> '00000000' then
          FL_Sql := FL_Sql + Format('   AND infofr >= ''%s'' ',[EDS4_infofr.NoFormatDate]);
       if EDS4_infoto.NoFormatDate <> '00000000' then
          FL_Sql := FL_Sql + Format('   AND infoto <= ''%s'' ',[EDS4_infoto.NoFormatDate]);
       FL_Sql   := FL_Sql + ' Order By infofr DESC, infoto DESC   ';
       Sql.Text := FL_Sql;
       Open;
       FieldByName('infofr').EditMask := '!9999-99-99;0;';
       FieldByName('infoto').EditMask := '!9999-99-99;0;';
  end;
end;

procedure TMainForm.FL_Ora_Qry6Find;
var
  FL_Sql : String;
begin
  Ora_Qry6.Session := Ora_Session;
  with Ora_Qry6 do
  begin
       Close;
       Sql.Clear;

       FL_Sql := 'SELECT seialno, filename, installdir, registry, value,    '+
                 '       DECODE(exeyn, ''Y'',''예'',''아니오'') exeynname,  '+
                 '       DECODE(downyn,''Y'',''예'',''아니오'') downynname, '+
                 '       exeyn, downyn, version                             '+
                 '  FROM pymenudown                                         '+
                 ' Order By downyn desc, installdir, filename               ';
       Sql.Text := FL_Sql;
       Open;
  end;
end;

procedure TMainForm.CB_userClick(Sender: TObject);
begin
  BT_FindClick(Sender);
  SB_Help.Panels[1].Text := '조회 완료.';
end;

procedure TMainForm.FL_Ora_Qry7Find;
var
  FL_Sql : String;
begin
  if ED_tier_P.ItemIndex < 0 then
  begin
       MessageDlg('계층 구분을 입력하셔야죠!!', mtError, [mbOk],0);
       System.Exit;
  end;

  if ED_gubun_P.ItemIndex < 0 then
  begin
       MessageDlg('업무 구분을 입력하셔야죠!!', mtError, [mbOk],0);
       System.Exit;
  end;

  Ora_Qry7.Session := Ora_Session;
  with Ora_Qry7 do
  begin
       Close;
       Sql.Clear;
       Sql.Text  := 'SELECT PROGID, PROGNAME  '+
                    '  FROM PYMENULIST              '+
                    ' WHERE TIER    = '''+ED_tier_P.KeyItems[ED_tier_P.ItemIndex]+'''   '+
                    '   AND GUBUN   = '''+ED_gubun_P.KeyItems[ED_gubun_P.ItemIndex]+''' '+
                    '   AND PROGID  = '''+Trim(ED_progid_P.Text)+''' ';
       Open;

       if Eof then
       begin
            L_prognm_P.ValueFont.Color := clRed;
            L_prognm_P.ValueCaption    := '프로그램명 Error ';
            System.Exit;
       end
       else
       begin
            L_prognm_P.ValueFont.Color := clBlack;
            L_prognm_P.ValueCaption    := FieldByName('PROGNAME').AsString ;
       end;
  end;

  Ora_Qry7.Session := Ora_Session;
  with Ora_Qry7 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := 'SELECT A.TIER, A.GUBUN, A.PROGID, B.GROUPID, B.GROUPNAME               '+
                 '  FROM PYMENURIGHT A, PYMENUGROUP B                                    '+
                 ' WHERE A.GROUPID(+) = B.GROUPID                                        '+
                 '   AND A.TIER(+)    = '''+ED_tier_P.KeyItems[ED_tier_P.ItemIndex]+'''  '+
                 '   AND A.GUBUN(+)   = '''+ED_gubun_P.KeyItems[ED_gubun_P.ItemIndex]+''''+
                 '   AND A.PROGID(+)  = '''+Trim(ED_progid_P.Text)+'''                   ';

       //dsa2000  등록된 사원이 있는 경우만 그룹List 나타나도록....
       if CB_user.Checked then FL_Sql := FL_Sql + ' Order By B.GROUPID '
       else                    FL_Sql := FL_Sql + '   and b.groupid in (select distinct groupid from pymenuuser where lockyn=''N'')'+
                                                  ' Order By B.GROUPID ';
       Sql.Text := FL_Sql;
       Open;

       Ora_Qry7.First;
       MD_Data7.Close;
       MD_Data8.Close;
       MD_Data7.Open;
       MD_Data8.Open;
       while not Eof do
       begin
            if FieldByName('progid').AsString ='' then   //미등록 그룹 그리드
            begin
                 MD_Data7.Append;
                 MD_Data7.FieldByName('tier').AsString      := FieldByName('tier').AsString ;
                 MD_Data7.FieldByName('gubun').AsString     := FieldByName('gubun').AsString ;
                 MD_Data7.FieldByName('progid').AsString    := FieldByName('progid').AsString ;
                 MD_Data7.FieldByName('groupid').AsString   := FieldByName('groupid').AsString ;
                 MD_Data7.FieldByName('groupname').AsString := FieldByName('groupname').AsString ;
                 MD_Data7.Post;
            end
            else       //등록 그룹 그리드
            begin
                 MD_Data8.Append;
                 MD_Data8.FieldByName('tier').AsString      := FieldByName('tier').AsString ;
                 MD_Data8.FieldByName('gubun').AsString     := FieldByName('gubun').AsString ;
                 MD_Data8.FieldByName('progid').AsString    := FieldByName('progid').AsString ;
                 MD_Data8.FieldByName('groupid').AsString   := FieldByName('groupid').AsString ;
                 MD_Data8.FieldByName('groupname').AsString := FieldByName('groupname').AsString ;
                 MD_Data8.Post;
            end;
            Ora_Qry7.Next;
       end;
       MD_Data7.First;
       MD_Data8.First;
  end;
end;

procedure TMainForm.FL_Ora_Qry1Save;
var
  FL_Sql  : String;
  FL_Key1 : String;
  FL_Key2 : String;
  FL_Key3 : String;
  FStream : TMemoryStream;
begin
  if Trim(ED_progid.Text) = '' then
    begin
      Application.MessageBox('프로그램ID를 입력하세요...','알 림',MB_OK);
      ED_progid.SetFocus;
      System.Exit;
    end;
  if Trim(ED_progname.Text) = '' then
    begin
      Application.MessageBox('프로그램명을 입력하세요...','알 림',MB_OK);
      ED_progname.SetFocus;
      System.Exit;
    end;
  if Trim(ED_upper_progid.Text) = '' then
    begin
      Application.MessageBox('상위 프로그램ID를 입력하세요...','알 림',MB_OK);
      ED_upper_progid.SetFocus;
      System.Exit;
    end;
  if ED_tier.ItemIndex > 0 then
    if ED_gubun.ItemIndex = 7 then //if ED_gubun.ItemIndex = 6 then  dsa2000
      begin
        Application.MessageBox('업무구분이 [종합인사정보시스템]이 될 수 없습니다...','알 림',MB_OK);
        ED_gubun.SetFocus;
        System.Exit;
      end;

  FStream := TMemoryStream.Create;
  try
    ED_Help.Lines.SaveToStream(FStream);
    if FStream.Size >= 4096000 then
      begin
        Application.MessageBox('도움말 정보크기가 너무 큽니다. 사이즈를 줄이세요...','알 림',MB_OK);
        FStream.Free;
        System.Exit;
      end;

    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        if FL_Ins1 then
          begin
            FL_Sql := Format('INSERT INTO pymenulist '+
                             '  (tier,  gubun, progid, progname, progexe, upper_progid,  '+
                             '   version, useyn, position, content, progorder, writeman, writetime) '+
                             'VALUES '+
                             '  (''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',      '+
                             '   ''%s'',''%s'',''%s'',''%s'', %d, ''%s'',''%s'') ',
                      [ED_tier.KeyItems[ED_tier.ItemIndex],
                       ED_gubun.KeyItems[ED_gubun.ItemIndex],
                       ED_progid.text,
                       ED_progname.text,
                       ED_progexe.text,
                       ED_upper_progid.text,
                       ED_version.text,
                       ED_useyn.KeyItems[ED_useyn.ItemIndex],
                       ED_position.text,
                       ED_content.text,
                       ED_progorder.AsInteger,
                       Pempno,
                       Fn_GetDateTimeStr]);
            Sql.Text := FL_Sql;
            ExecSql;

            FL_Sql := Format('INSERT INTO pymenuhelp '+
                             '  (tier,  gubun, progid, help, writeman, writetime) '+
                             'VALUES '+
                             '  (''%s'',''%s'',''%s'', :phelp, ''%s'',''%s'') ',
                      [ED_tier.KeyItems[ED_tier.ItemIndex],
                       ED_gubun.KeyItems[ED_gubun.ItemIndex],
                       ED_progid.text,
                       Pempno,
                       Fn_GetDateTimeStr]);
            Sql.Text := FL_Sql;
            ParamByName('phelp').LoadFromStream(FStream, ftBlob);
            ExecSql;
          end
        else
          begin
            FL_Sql := Format('UPDATE pymenulist SET  '+
                             '  progname    = ''%s'','+
                             '  progexe     = ''%s'','+
                             '  upper_progid= ''%s'','+
                             '  version     = ''%s'','+
                             '  useyn       = ''%s'','+
                             '  position    = ''%s'','+
                             '  progorder   =   %d  ,'+
                             '  content     = ''%s'','+
                             '  writeman    = ''%s'','+
                             '  writetime   = ''%s'' '+
                             ' WHERE tier   = ''%s'' '+
                             '   AND gubun  = ''%s'' '+
                             '   AND progid = ''%s'' ',
                      [ED_progname.text,
                       ED_progexe.text,
                       ED_upper_progid.text,
                       ED_version.text,
                       ED_useyn.KeyItems[ED_useyn.ItemIndex],
                       ED_position.text,
                       ED_progorder.AsInteger,
                       ED_content.text,
                       Pempno,
                       Fn_GetDateTimeStr,
                       ED_tier.KeyItems[ED_tier.ItemIndex],
                       ED_gubun.KeyItems[ED_gubun.ItemIndex],
                       ED_progid.text]);
            Sql.Text := FL_Sql;
            ExecSql;

            if PG_Sub.ActivePage = SubTab2 then
              begin
                FL_Sql := Format('UPDATE pymenuhelp SET  '+
                                 '  help        = :phelp,'+
                                 '  writeman    = ''%s'','+
                                 '  writetime   = ''%s'' '+
                                 ' WHERE tier   = ''%s'' '+
                                 '   AND gubun  = ''%s'' '+
                                 '   AND progid = ''%s'' ',
                          [Pempno,
                           Fn_GetDateTimeStr,
                           ED_tier.KeyItems[ED_tier.ItemIndex],
                           ED_gubun.KeyItems[ED_gubun.ItemIndex],
                           ED_progid.text]);

                Sql.Text := FL_Sql;
                ParamByName('phelp').LoadFromStream(FStream, ftBlob);
                ExecSql;
              end;
          end;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      FStream.Free;
      FStream := nil;
      System.Exit;
    end;
  end;
  FStream.Free;
  FStream := nil;
  
  FL_Key1 := ED_tier.KeyItems[ED_tier.ItemIndex];
  FL_Key2 := ED_gubun.KeyItems[ED_gubun.ItemIndex];
  FL_Key3 := ED_progid.text;

  Ora_Qry1.Session := Ora_Session;
  if Ora_Qry1.Active then
    begin
      Ora_Qry1.Refresh;
      Ora_Qry1.Locate('tier;gubun;progid',VarArrayOf([FL_Key1,FL_Key2,FL_Key3]),[loCaseInsensitive]);
    end;
  FL_Ins1 := False;
end;

procedure TMainForm.FL_Ora_Qry2Save;
var
  FL_Sql  : String;
  FL_Key1 : String;
begin
  if Trim(ED1_groupid.Text) = '' then
    begin
      Application.MessageBox('그룹ID를 입력하세요...','알 림',MB_OK);
      ED1_groupid.SetFocus;
      System.Exit;
    end;
  if Trim(ED1_groupname.Text) = '' then
    begin
      Application.MessageBox('그룹명을 입력하세요...','알 림',MB_OK);
      ED1_groupname.SetFocus;
      System.Exit;
    end;
    
  try
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        if FL_Ins2 then
          begin
            FL_Sql := Format('INSERT INTO pymenugroup '+
                             '  (groupid, groupname, content, writeman, writetime)  '+
                             'VALUES '+
                             '  (''%s'',''%s'',''%s'', ''%s'',''%s'') ',
                      [ED1_groupid.text,
                       ED1_groupname.text,
                       ED1_content.text,
                       Pempno,
                       Fn_GetDateTimeStr]);
          end
        else
          begin
            FL_Sql := Format('UPDATE pymenugroup SET '+
                             '  groupname = ''%s'','+
                             '  content   = ''%s'','+
                             '  writeman  = ''%s'','+
                             '  writetime = ''%s'' '+
                             ' WHERE groupid = ''%s''  ',
                      [ED1_groupname.text,
                       ED1_content.text,
                       Pempno,
                       Fn_GetDateTimeStr,
                       ED1_groupid.text]);
          end;
        Sql.Text := FL_Sql;
        ExecSql;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      System.Exit;
    end;
  end;   

  FL_Key1 := ED1_groupid.text;

  Ora_Qry2.Session := Ora_Session;
  if Ora_Qry2.Active then
    begin
      Ora_Qry2.Refresh;
      Ora_Qry2.Locate('groupid',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
  FL_Ins2 := False;
end;

procedure TMainForm.FL_Ora_Qry3Save;
var
  FL_Sql  : String;
  FL_I    : Integer;
  FL_Item : TListItem;
begin
  if Trim(EDS2_groupname.Text) = '' then
    begin
      Application.MessageBox('그룹명선택을  입력하세요...','알 림',MB_OK);
      EDS2_groupname.SetFocus;
      System.Exit;
    end;

  try
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        for FL_I := 0 to LV_prog.Items.Count - 1 do
          begin
            FL_Item := LV_prog.Items[FL_I];
            if not FL_Item.Checked then
              Continue;

            Close;
            Sql.Clear;
            FL_Sql := Format('INSERT INTO pymenuright '+
                             '  (groupid, tier, gubun, progid, writeman, writetime)  '+
                             'VALUES '+
                             '  (''%s'',''%s'',''%s'', ''%s'',''%s'', ''%s'') ',
                      [EDS2_groupname.Hint,
                       FL_Item.SubItems[2],
                       FL_Item.SubItems[3],
                       FL_Item.SubItems[4],
                       Pempno,
                       Fn_GetDateTimeStr]);
            Sql.Text := FL_Sql;
            ExecSql;
          end;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      System.Exit;
    end;
  end;
  BT_FindClick(BT_Find);
  ED2_progButtonClick(BT_Find,0);
end;

procedure TMainForm.FL_Ora_Qry4Save;
var
  FL_Sql  : String;
  FL_Key1 : String;
  FL_Out  : String;
begin
  if Trim(ED3_empno.empno) = '' then
    begin
      Application.MessageBox('사원성명을 입력하세요...','알 림',MB_OK);
      ED3_empno.SetFocus;
      System.Exit;
    end;
  if Trim(ED3_groupname.Text) = '' then
    begin
      Application.MessageBox('그룹명을 입력하세요...','알 림',MB_OK);
      ED3_groupname.SetFocus;
      System.Exit;
    end;
  if ED3_lockyn.ItemIndex < 0 then
    begin
      Application.MessageBox('사용잠금여부를 입력하세요...','알 림',MB_OK);
      ED3_lockyn.SetFocus;
      System.Exit;
    end;
    
  try
//    Encode(ED3_password.Text, FL_Out, PassKey);       //2013.11. 비밀번호 삭제(암호화 작업)
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        if FL_Ins3 then
          begin
            FL_Sql := Format('INSERT INTO pymenuuser '+
                             '  (empno, groupid, password, passtodate, lockyn, grade, writeman, writetime)  '+
                             'VALUES '+
                             '  (''%s'',''%s'',''%s'',''%s'',''%s'',''%s'', ''%s'',''%s'') ',
                      [ED3_empno.empno,
                       ED3_groupname.Hint,
                       FL_Out,
                       '''',
                       ED3_passtodate.NoFormatDate,
                       ED3_lockyn.KeyItems[ED3_lockyn.ItemIndex],
                       ED3_grade.Text,
                       Pempno,
                       Fn_GetDateTimeStr]);
          end
        else
          begin
            FL_Sql := Format('UPDATE pymenuuser SET '+
                             '  groupid    = ''%s'','+
//                             '  password   = ''%s'','+       //2013.11. 비밀번호 삭제(암호화 작업)
                             '  passtodate = ''%s'','+
                             '  lockyn     = ''%s'','+
                             '  grade      = ''%s'','+
                             '  writeman   = ''%s'','+
                             '  writetime  = ''%s'' '+
                             ' WHERE empno = ''%s''  ',
                      [ED3_groupname.Hint,
//                       FL_Out,
                       ED3_passtodate.NoFormatDate,
                       ED3_lockyn.KeyItems[ED3_lockyn.ItemIndex],
                       ED3_grade.Text,
                       Pempno,
                       Fn_GetDateTimeStr,
                       ED3_empno.empno]);
          end;
        Sql.Text := FL_Sql;
        ExecSql;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      System.Exit;
    end;
  end;

  FL_Key1 := ED3_empno.empno;

  if Ora_Qry4.Active then
    begin
      Ora_Qry4.Refresh;
      Ora_Qry4.Locate('empno',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
  FL_Ins3 := False;
end;

procedure TMainForm.FL_Ora_Qry5Save;
var
  FL_Sql  : String;
  FL_Key1 : Double;
  FStream : TMemoryStream;
begin
  if Trim(ED4_infofr.NoFormatDate) = '0000000' then
    begin
      Application.MessageBox('일자From을 입력하세요...','알 림',MB_OK);
      ED4_infofr.SetFocus;
      System.Exit;
    end;
  if Trim(ED4_infoto.NoFormatDate) = '0000000' then
    begin
      Application.MessageBox('일자To를 입력하세요...','알 림',MB_OK);
      ED4_infoto.SetFocus;
      System.Exit;
    end;
  if Trim(ED4_infotitle.Text) = '' then
    begin
      Application.MessageBox('공지제목을 입력하세요...','알 림',MB_OK);
      ED4_infotitle.SetFocus;
      System.Exit;
    end;

  FStream := TMemoryStream.Create;
  try
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        if FL_Ins4 then
          begin
            if ED4_infonum.Value = 0 then
              ED4_infonum.Value := FL_Get_infonum;
            FL_Sql := Format('INSERT INTO pyinfo '+
                             '  (infonum, infofr, infoto, infotitle, infobmp, infotext, infoyn)  '+
                             'VALUES '+
                             '  (%f,''%s'',''%s'',''%s'', :pinfobmp,''%s'',''%s'') ',
                      [ED4_infonum.Value,
                       ED4_infofr.NoFormatDate,
                       ED4_infoto.NoFormatDate,
                       ED4_infotitle.Text,
                       ED4_infotext.Text,
                       ED4_infoyn.Text]);
            Sql.Text := FL_Sql;

            if ED4_infobmp.Picture.Height > 0 then
              begin
                ED4_infobmp.Picture.Graphic.SaveToStream(FStream);
              end;
            ParamByName('pinfobmp').LoadFromStream(FStream, ftBlob);
            ExecSql;
            Close;
            FStream.Free;
            FStream := nil;

            FStream := TMemoryStream.Create;
            ED4_content.Lines.SaveToStream(FStream);
            FL_Sql := Format('INSERT INTO pyinfocontent '+
                             '  (infonum, infofr, infoto, content)  '+
                             'VALUES '+
                             '  (%f,''%s'',''%s'', :pcontent) ',
                      [ED4_infonum.Value,
                       ED4_infofr.NoFormatDate,
                       ED4_infoto.NoFormatDate]);
            Sql.Text := FL_Sql;
            ParamByName('pcontent').LoadFromStream(FStream, ftBlob);
            ExecSql;
          end
        else
          begin
            FL_Sql := Format('UPDATE pyinfo SET         '+
                             '  infoto       = ''%s'',  '+
                             '  infotitle    = ''%s'',  '+
                             '  infotext     = ''%s'',  '+
                             '  infoyn       = ''%s'',  '+
                             '  infobmp      = :pinfobmp'+
                             ' WHERE infonum = %f       '+
                             '   AND infofr  = ''%s''   ',
                      [ED4_infoto.NoFormatDate,
                       ED4_infotitle.Text,
                       ED4_infotext.Text,
                       ED4_infoyn.Text,
                       ED4_infonum.Value,
                       ED4_infofr.NoFormatDate]);
            Sql.Text := FL_Sql;

            if Assigned(ED4_infobmp.Picture) then
              begin
                ED4_infobmp.Picture.Graphic.SaveToStream(FStream);
              end;
            ParamByName('pinfobmp').LoadFromStream(FStream, ftBlob);                
            ExecSql;
            Close;

            if PG_info.ActivePage = TAB_info2 then
              begin
                FL_Sql := Format('UPDATE pyinfocontent SET '+
                                 '  content = :pcontent    '+
                                 ' WHERE infonum = %f      '+
                                 '   AND infofr  = ''%s''  ',
                          [ED4_infonum.Value,
                           ED4_infofr.NoFormatDate]);
                Sql.Text := FL_Sql;
                FStream.Free;
                FStream := nil;

                FStream := TMemoryStream.Create;
                ED4_content.Lines.SaveToStream(FStream);                
                ParamByName('pcontent').LoadFromStream(FStream, ftBlob);
                ExecSql;
              end;
          end;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      FStream.Free;
      FStream := nil;
      System.Exit;
    end;
  end;
  FStream.Free;
  FStream := nil;

  FL_Key1 := ED4_infonum.Value;

  if Ora_Qry5.Active then
    begin
      Ora_Qry5.Refresh;
      Ora_Qry5.Locate('infonum',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
  FL_Ins4 := False;
end;

procedure TMainForm.FL_Ora_Qry6Save;
var
  FL_Sql  : String;
  FL_Key1 : double;
  FL_Out  : String;
begin
  if Trim(ED6_filename.Text) = '' then
    begin
      Application.MessageBox('파일명을 입력하세요...','알 림',MB_OK);
      ED6_filename.SetFocus;
      System.Exit;
    end;

  try
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        if FL_Ins6 then
          begin
            if ED6_seialno.Value = 0 then
              ED6_seialno.Value := FL_Get_Serial;
            FL_Sql := Format('INSERT INTO pymenudown '+
                             '  (seialno, filename, installdir, registry, value, exeyn, downyn, version)  '+
                             'VALUES '+
                             '  (%f,''%s'',''%s'',''%s'',''%s'',''%s'',''%s'', ''%s'') ',
                      [ED6_seialno.Value,
                       ED6_filename.Text,
                       ED6_installdir.Text,
                       ED6_registry.Text,
                       ED6_value.Text,
                       ED6_exeyn.KeyItems[ED6_exeyn.ItemIndex],
                       ED6_downyn.KeyItems[ED6_downyn.ItemIndex],
                       ED6_version.Text
                       ]);
          end
        else
          begin
            FL_Sql := Format('UPDATE pymenudown SET '+
                             '  filename   = ''%s'','+
                             '  installdir = ''%s'','+
                             '  registry   = ''%s'','+
                             '  value      = ''%s'','+
                             '  exeyn      = ''%s'','+
                             '  downyn     = ''%s'','+
                             '  version    = ''%s'' '+
                             ' WHERE seialno = %f   ',
                      [ED6_filename.Text,
                       ED6_installdir.Text,
                       ED6_registry.Text,
                       ED6_value.Text,
                       ED6_exeyn.KeyItems[ED6_exeyn.ItemIndex],
                       ED6_downyn.KeyItems[ED6_downyn.ItemIndex],
                       ED6_version.Text,
                       ED6_seialno.Value
                      ]);
          end;
        Sql.Text := FL_Sql;
        ExecSql;
      end;
  except on E : EOraError do
    begin
      if E.ErrorCode = ORA_SAMEDATA then
        Application.MessageBox('동일한 데이타가 존재합니다...','알 림',MB_OK);
      System.Exit;
    end;
  end;

  FL_Key1 := ED6_seialno.Value;

  if Ora_Qry6.Active then
    begin
      Ora_Qry6.Refresh;
      Ora_Qry6.Locate('seialno',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
  FL_Ins3 := False;
end;

procedure TMainForm.FL_Ora_Qry7Save;
var
  FL_Sql  : String;
begin

  Ora_Session.StartTransaction;
  try
    Ora_Save.Session := Ora_Session;
    with Ora_Save do
      begin
        Close;
        Sql.Clear;
        FL_Sql := Format('DELETE FROM PYMENURIGHT   '+
                         ' WHERE TIER   = ''%s''    '+
                         '   AND GUBUN  = ''%s''    '+
                         '   AND PROGID = ''%s''    ',
                          [ED_tier_P.KeyItems[ED_tier_P.ItemIndex],
                           ED_gubun_P.KeyItems[ED_gubun_P.ItemIndex],
                           ED_progid_P.Text
                          ]);
        Sql.Text := FL_Sql;
        ExecSql;

        MD_Data8.First;
        while not MD_Data8.Eof do
          begin
            Close;
            Sql.Clear;
            FL_Sql := Format('INSERT INTO PYMENURIGHT                             '+
                             '(TIER, GUBUN, PROGID, GROUPID, WRITETIME, WRITEMAN) '+
                             ' VALUES                                             '+
                             '(''%s'', ''%s'', ''%s'', ''%s'', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ''%s'') ',
                            [ED_tier_P.KeyItems[ED_tier_P.ItemIndex],
                             ED_gubun_P.KeyItems[ED_gubun_P.ItemIndex],
                             ED_progid_P.Text,
                             MD_Data8.FieldByName('groupid').AsString,
                             Pempno
                            ]);
            Sql.Text := FL_Sql;
            ExecSql;
            MD_Data8.Next;
          end;
      end;
    Ora_Session.Commit;
  except on E : EOraError do
    begin
      Ora_Session.RollBack;
      System.Exit;
    end;
  end;  
end;

procedure TMainForm.FL_Ora_Qry1Delete;
var
  FL_Sql  : String;
  FL_Gubun: Integer;
  FL_Key1 : String;
  FL_Key2 : String;
  FL_Key3 : String;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry1.Active then
    System.Exit;

  Ora_Check.Session := Ora_Session;
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('SELECT COUNT(*) cnt FROM pymenulist '+
                       ' WHERE upper_progid = ''%s''    '+
                       '   AND gubun        = ''%s''    '+
                       '   AND tier         = ''%s''    ',
                [Ora_Qry1.FieldByName('progid').AsString,
                 ED_gubun.KeyItems[ED_gubun.ItemIndex],
                 ED_tier.KeyItems[ED_tier.ItemIndex] ]);
      Sql.Text := FL_Sql;
      Open;
      if FieldByName('cnt').AsInteger <= 0 then
        FL_Gubun := 1
      else
        FL_Gubun := 0;
      Close;
    end;
  if FL_Gubun = 0 then
    begin
      Application.MessageBox(PChar('상위 프로그램ID로 가지고 있는 메뉴항목이 존재합니다...'#13#13+
                                   '현재 항목을 상위항목으로 가지고 있는 항목을 삭제하시고 삭제하세요...'),'알 림',MB_OK);
      System.Exit;
    end;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenulist '+
                       ' WHERE tier   = ''%s''  '+
                       '   AND gubun  = ''%s''  '+
                       '   AND progid = ''%s''  ',
                [ED_tier.KeyItems[ED_tier.ItemIndex],
                 ED_gubun.KeyItems[ED_gubun.ItemIndex],
                 ED_progid.text]);
      Sql.Text := FL_Sql;
      ExecSql;

      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenuhelp '+
                       ' WHERE tier   = ''%s''  '+
                       '   AND gubun  = ''%s''  '+
                       '   AND progid = ''%s''  ',
                [ED_tier.KeyItems[ED_tier.ItemIndex],
                 ED_gubun.KeyItems[ED_gubun.ItemIndex],
                 ED_progid.text]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry1.Session := Ora_Session;
  if Ora_Qry1.Active then
    begin
      Ora_Qry1.Next;
      if Ora_Qry1.Eof then
        Ora_Qry1.Prior;

      FL_Key1 := Ora_Qry1.FieldByName('tier').AsString;
      FL_Key2 := Ora_Qry1.FieldByName('gubun').AsString;
      FL_Key3 := Ora_Qry1.FieldByName('progid').AsString;
      
      Ora_Qry1.Refresh;
      Ora_Qry1.Locate('tier;gubun;progid',VarArrayOf([FL_Key1,FL_Key2,FL_Key3]),[loCaseInsensitive]);
    end;  
end;

procedure TMainForm.FL_Ora_Qry2Delete;
var
  FL_Sql   : String;
  FL_Key1  : String;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry2.Active then
    System.Exit;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenugroup '+
                       ' WHERE groupid = ''%s''  ',
                [ED1_groupid.text]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry2.Session := Ora_Session;
  if Ora_Qry2.Active then
    begin
      Ora_Qry2.Next;
      if Ora_Qry2.Eof then
        Ora_Qry2.Prior;
      FL_Key1 := Ora_Qry2.FieldByName('groupid').AsString;
      Ora_Qry2.Refresh;
      Ora_Qry2.Locate('groupid',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
end;

procedure TMainForm.FL_Ora_Qry3Delete;
var
  FL_Sql   : String;
  FL_Key1  : String;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry3.Active then
    System.Exit;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenuright '+
                       ' WHERE groupid = ''%s''  '+
                       '   AND tier    = ''%s''  '+
                       '   AND gubun   = ''%s''  '+
                       '   AND progid  = ''%s''  ',
                [EDS2_groupname.Hint,
                 Ora_Qry3.FieldByName('tier').AsString,
                 Ora_Qry3.FieldByName('gubun').AsString,
                 Ora_Qry3.FieldByName('progid').AsString]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry3.Session := Ora_Session;
  if Ora_Qry3.Active then
    begin
      Ora_Qry3.Next;
      if Ora_Qry3.Eof then
        Ora_Qry3.Prior;
      FL_Key1 := Ora_Qry3.FieldByName('progid').AsString;
      Ora_Qry3.Refresh;
      Ora_Qry3.Locate('progid',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
end;

procedure TMainForm.FL_Ora_Qry4Delete;
var
  FL_Sql   : String;
  FL_Key1  : String;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry4.Active then
    System.Exit;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenuuser '+
                       ' WHERE empno = ''%s''  ',
                [Ora_Qry4.FieldByName('empno').AsString]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry4.Session := Ora_Session;
  if Ora_Qry4.Active then
    begin
      Ora_Qry4.Next;
      if Ora_Qry4.Eof then
        Ora_Qry4.Prior;
      FL_Key1 := Ora_Qry4.FieldByName('empno').AsString;
      Ora_Qry4.Refresh;
      Ora_Qry4.Locate('empno',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
end;

procedure TMainForm.FL_Ora_Qry5Delete;
var
  FL_Sql   : String;
  FL_Key1  : Double;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry5.Active then
    System.Exit;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pyinfo '+
                       ' WHERE infonum = %f      '+
                       '   AND infofr  = ''%s''  '+
                       '   AND infoto  = ''%s''  ',

                [Ora_Qry5.FieldByName('infonum').AsFloat,
                 Ora_Qry5.FieldByName('infofr').AsString,
                 Ora_Qry5.FieldByName('infoto').AsString]);
      Sql.Text := FL_Sql;
      ExecSql;

      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pyinfocontent '+
                       ' WHERE infonum = %f      '+
                       '   AND infofr  = ''%s''  '+
                       '   AND infoto  = ''%s''  ',

                [Ora_Qry5.FieldByName('infonum').AsFloat,
                 Ora_Qry5.FieldByName('infofr').AsString,
                 Ora_Qry5.FieldByName('infoto').AsString]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry5.Session := Ora_Session;
  if Ora_Qry5.Active then
    begin
      Ora_Qry5.Next;
      if Ora_Qry5.Eof then
        Ora_Qry5.Prior;
      FL_Key1 := Ora_Qry5.FieldByName('infonum').AsFloat;
      Ora_Qry5.Refresh;
      Ora_Qry5.Locate('infonum',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
end;

procedure TMainForm.FL_Ora_Qry6Delete;
var
  FL_Sql   : String;
  FL_Key1  : double;
begin
  if Application.MessageBox('데이타를 삭제 하시겠습니까 ?...','알 림',MB_YESNO) = ID_NO then
    System.Exit;
  if not Ora_Qry6.Active then
    System.Exit;

  Ora_Save.Session := Ora_Session;
  with Ora_Save do
    begin
      Close;
      Sql.Clear;
      FL_Sql := Format('DELETE FROM pymenudown '+
                       ' WHERE seialno = %f  ',
                [Ora_Qry6.FieldByName('seialno').AsFloat]);
      Sql.Text := FL_Sql;
      ExecSql;
    end;

  Ora_Qry6.Session := Ora_Session;
  if Ora_Qry6.Active then
    begin
      Ora_Qry6.Next;
      if Ora_Qry6.Eof then
        Ora_Qry6.Prior;
      FL_Key1 := Ora_Qry6.FieldByName('seialno').AsFloat;
      Ora_Qry6.Refresh;
      Ora_Qry6.Locate('seialno',VarArrayOf([FL_Key1]),[loCaseInsensitive]);
    end;
end;

function TMainForm.FL_Get_Order : Integer;
var
  FL_Sql  : String;
begin
  Result := 0;
  SB_Help.Panels[1].Text := ' 출력 순서를 읽고 있는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Ora_Check.Session := Ora_Session;
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT NVL(MAX(progorder),0) + 1 cnt '+
                '  FROM pymenulist A '+
                ' WHERE upper_progid = ''%s'' ';
      FL_Sql := Format(FL_Sql,[ED_upper_progid.Text]);
      Sql.Text := FL_Sql;
      Open;
      if not Eof then
        Result := FieldByName('cnt').AsInteger;
      Close;
    end;
  SB_Help.Panels[1].Text := '';
end;

function TMainForm.FL_Get_infonum : Integer;
var
  FL_Sql  : String;
begin
  Result := 0;
  SB_Help.Panels[1].Text := ' 일련번호를 읽고 있는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Ora_Check.Session := Ora_Session;
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT /*+ index_desc (A) */ NVL(MAX(infonum),0) + 1 cnt '+
                '  FROM pyinfo A '+
                ' WHERE rownum = 1 ';
      Sql.Text := FL_Sql;
      Open;
      if not Eof then
        Result := FieldByName('cnt').AsInteger;
      Close;
    end;
  SB_Help.Panels[1].Text := '';
end;

function TMainForm.FL_Get_Serial : Integer;
var
  FL_Sql  : String;
begin
  Result := 0;
  SB_Help.Panels[1].Text := ' 일련번호를 읽고 있는 중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Ora_Check.Session := Ora_Session;
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT /*+ index_desc (A) */ NVL(MAX(seialno),0) + 1 cnt '+
                '  FROM pymenudown A '+
                ' WHERE rownum = 1 ';
      Sql.Text := FL_Sql;
      Open;
      if not Eof then
        Result := FieldByName('cnt').AsInteger;
      Close;
    end;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.FL_Get_Help;
var
  FStream : TStream;
  FL_Sql  : String;
begin
  if PG_Sub.ActivePage = SubTab1 then
    System.Exit;
  SB_Help.Panels[1].Text := ' 도움말 내용 조회중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Ora_Check.Session := Ora_Session;
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT help            '+
                '  FROM pymenuhelp      '+
                ' WHERE tier   = ''%s'' '+
                '   AND gubun  = ''%s'' '+
                '   AND progid = ''%s'' ';
      FL_Sql := Format(FL_Sql,[Ora_Qry1.FieldByName('tier').AsString,
                               Ora_Qry1.FieldByName('gubun').AsString,
                               Ora_Qry1.FieldByName('progid').AsString]);
      Sql.Text := FL_Sql;
      Open;
      FStream := Ora_Check.CreateBlobStream(TBlobField(Ora_Check.FieldByName('help')),bmRead);
      ED_Help.Lines.LoadFromStream(FStream);
      Close;
    end;
  FStream.Free;
  FStream := nil;
  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.FL_Get_InfoContent;
var
  FStream : TStream;
  FL_Sql  : String;
begin
  if PG_Info.ActivePage = TAB_info1 then
    System.Exit;
  SB_Help.Panels[1].Text := ' 공지사항 내용 조회중입니다...';
  SB_Help.Perform(WM_PAINT,0,0);

  Ora_Check.Session := Ora_Session;  
  with Ora_Check do
    begin
      Close;
      Sql.Clear;
      FL_Sql := 'SELECT content         '+
                '  FROM pyinfocontent   '+
                ' WHERE infonum = %f    '+
                '   AND infofr  = ''%s'''+
                '   AND infoto  = ''%s''';

      FL_Sql := Format(FL_Sql,[Ora_Qry5.FieldByName('infonum').AsFloat,
                               Ora_Qry5.FieldByName('infofr').AsString,
                               Ora_Qry5.FieldByName('infoto').AsString]);
      Sql.Text := FL_Sql;
      Open;
      FStream := Ora_Check.CreateBlobStream(TBlobField(Ora_Check.FieldByName('content')),bmRead);
      ED4_content.Lines.LoadFromStream(FStream);
      Close;
    end;
  FStream.Free;
  FStream := nil;
  SB_Help.Panels[1].Text := '';
end;


procedure TMainForm.PL_Prog_Select(AValue : Boolean);
var
  FL_I : Integer;
begin
  for FL_I := 0 to LV_prog.Items.Count - 1 do
    begin
      LV_prog.Items[FL_I].Checked := AValue;
    end;
end;

procedure TMainForm.PM_M1Click(Sender: TObject);
begin
  PL_Prog_Select(True);
end;

procedure TMainForm.PM_M2Click(Sender: TObject);
begin
  PL_Prog_Select(False);
end;

procedure TMainForm.FB_ExcelClick(Sender: TObject);
var
  L : TListItem;
  I : Integer;
  V : Variant;
begin
  On_Excel.HeaderTitle := EDS2_groupname.Text +' 그룹 메뉴구성도';
  On_Excel.DoBegin;
  On_Excel.DoWriteHeader;
  On_Excel.DoWriteTitle;
  for I := 0 to LV_res.Items.Count - 1 do
    begin
      L    := LV_res.Items[I];
      V    := VarArrayCreate([0,2],VarVariant);
      V[0] := L.Caption;
      V[1] := L.SubItems[0];
      On_Excel.DoWriteRecord(V);
      LV_res.Items[I]
    end;
  On_Excel.DoWriteRecordEnd;
  On_Excel.DoEnd;
end;

procedure TMainForm.EDS_FindKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Key := #0;
       BT_FindClick(Sender);
  end;
end;

procedure TMainForm.ED2_progKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ED2_progButtonClick(Sender,0);
  end;
end;

procedure TMainForm.BT_Add_PClick(Sender: TObject);
begin
  GridData_Move(GGrid1, GGrid2 , MD_Data7, MD_Data8);
end;

procedure TMainForm.GridData_Move(FromGrid, ToGrid : TDBGrid; FromDataSet, ToDataSet : TDataSet);
var
  i : Integer;
begin
  if not FromDataSet.Active then
    System.Exit;

  if FromGrid.SelectedRows.Count < 1 then
    System.Exit;

  ToGrid.SelectedRows.Clear;

  for i := 0 to FromGrid.SelectedRows.Count -1 do
    begin
      FromDataSet.GotoBookmark(pointer(FromGrid.SelectedRows.Items[i]));
      ToDataSet.Open;
      ToDataSet.Append;
      ToDataSet.FieldByName('tier').AsString      := FromDataSet.FieldByName('tier').AsString ;
      ToDataSet.FieldByName('gubun').AsString     := FromDataSet.FieldByName('gubun').AsString ;
      ToDataSet.FieldByName('progid').AsString    := FromDataSet.FieldByName('progid').AsString ;
      ToDataSet.FieldByName('groupid').AsString   := FromDataSet.FieldByName('groupid').AsString ;
      ToDataSet.FieldByName('groupname').AsString := FromDataSet.FieldByName('groupname').AsString ;
      ToDataSet.Post;
      ToGrid.SelectedRows.CurrentRowSelected := True;
      FromDataSet.Delete;
    end;

  FromDataSet.Open;
  FromGrid.SelectedRows.Clear;
end;

procedure TMainForm.BT_Del_PClick(Sender: TObject);
begin
  GridData_Move(GGrid2, GGrid1 , MD_Data8, MD_Data7);
end;

procedure TMainForm.GGrid1CellClick(Column: TColumn);
var
  GroupId, LockYN : String;
begin
  if   Column.Grid.Name = 'GGrid1' then GroupId := MD_Data7.FieldByName('groupid').AsString
  else                                  GroupId := MD_Data8.FieldByName('groupid').AsString;

  //dsa2000  2006.08. 추가
  if   CB_LockYN.Checked = True then LockYN := '%'
  else                               LockYN := 'N';

  Ora_Qry9.Session := Ora_Session;
  with Ora_Qry9 do
    begin
      Close;
      Sql.Clear;
      Sql.Text := 'SELECT A.GROUPID, A.EMPNO, A.KORNAME, A.GRADE,       '+
                  '        A.LOCKYN, Nvl(B.DEPTNAME,C.DEPTNAME) deptname'+
                  '  FROM PYMENUUSER A,                                 '+
                  '       (SELECT EMPNO, DEPTNAME                       '+
                  '          FROM PIMPMAS B1, PYCDEPT B2                '+
                  '         WHERE B1.ORGNUM   = B2.ORGNUM               '+
                  '           AND B1.DEPTCODE = B2.DEPTCODE             '+
                  '           AND B1.PSTATE   < ''80'' ) B,             '+
                  '       (SELECT EMPNO, DEPTNAME                       '+  //도급인력 부서명 추가 2014.03. dsa2000
                  '          FROM PZSUBMAS B1, PYCDEPT B2               '+
                  '         WHERE B1.ORGNUM   = B2.ORGNUM               '+
                  '           AND B1.DEPTCODE = B2.DEPTCODE ) C         '+
                  ' WHERE A.EMPNO   = B.EMPNO(+)                        '+
                  '   AND A.EMPNO   = C.EMPNO(+)                        '+
                  '   AND A.GROUPID =    ''' + GroupId + '''            '+
                  '   AND A.LockYN  Like ''' + LockYN  + '''            '+  //dsa2000  2006.08. 추가
                  ' Order By A.EMPNO                                    ';
{      Sql.Text := 'SELECT A.GROUPID, A.EMPNO, A.KORNAME, A.GRADE, A.LOCKYN, B.DEPTNAME '+
                  '  FROM PYMENUUSER A,                                                '+
                  '       (SELECT EMPNO, DEPTNAME                                      '+
                  '          FROM PIMPMAS B1, PYCDEPT B2                               '+
                  '         WHERE B1.ORGNUM   = B2.ORGNUM                              '+
                  '           AND B1.DEPTCODE = B2.DEPTCODE                            '+
                  '           AND B1.PSTATE   < ''80'' ) B                             '+
                  ' WHERE A.EMPNO   = B.EMPNO(+)                                       '+
                  '   AND A.GROUPID =    ''' + GroupId + '''                           '+
                  '   AND A.LockYN  Like ''' + LockYN  + '''                           '+  //dsa2000  2006.08. 추가
                  ' Order By A.EMPNO                                                   ';}
      Open;  
    end;
end;

procedure TMainForm.GGrid1ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (TOnGrDbGrid(Sender).SelectedRows.CurrentRowSelected) then
    Canvas.Brush.Color := $00FF9B9B;
end;

procedure TMainForm.CB_LockYNClick(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 선택 체크후 상단에서 해당 그룹을 선택하시기 바랍니다....';
end;

procedure TMainForm.BT_VersionUpClick(Sender: TObject);
var vTier : String;
begin
  //2016.11.17. Add  dsa2000
  if      ED_Tier.Text = '공통'  then vTier := '1'
  else if ED_Tier.Text = '2Tier' then vTier := '2'
  else if ED_Tier.Text = '3Tier' then vTier := '3'
  else
  begin
       ShowMessage('계층구분 오류');
       Exit;
  end;
  if      ED_Tier.KeyIte = '공통'  then vTier := '1'
  else if ED_Tier.Text = '2Tier' then vTier := '2'
  else if ED_Tier.Text = '3Tier' then vTier := '3'
  else
  begin
       ShowMessage('계층구분 오류');
       Exit;
  end;
  Ora_Save.Session := Ora_Session;
  with Ora_Save do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Update pymenulist a                                        ');
       Sql.Add('   Set version   = TO_CHAR(to_number(version)+0.01)      , ');
       Sql.Add('       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
       Sql.Add('       writeman  = '''+ Pempno +'''                        ');
     //Sql.Add(' Where progid    = '''+ Trim(ED_progid.Text) +'''          ');
       Sql.Add(' Where Tier      = '''+ vTier +'''                         '); //2016.11.17. dsa2000 Tier+Progexe 기준 일괄 업데이트 되도록 수정
       Sql.Add('   And Progexe   = '''+ Trim(ED_Progexe.Text) +'''         ');
       ExecSql;
  end;
  
  BT_FindClick(Sender);
  
  SB_Help.Panels[1].Text := '버젼업 완료.';
end;

end.

