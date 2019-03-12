unit Pcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  DBTables, peoutlookbtn, MemDS, DBAccess, Ora;

type
  TFCodeForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    E_Codeno: TOnEdit;
    DBGrid1: TDBGrid;
    E_Codename: TOnEdit;
    BT_Search: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Qry_code: TOraQuery;
    procedure FB_cancelClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_CodenameKeyPress(Sender: TObject; var Key: Char);
    procedure E_CodenoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSjobcode   : String;
    GScodetname : String;
  end;

var
   FCodeForm : TFCodeForm;

implementation

uses PSH1020A1;

{$R *.DFM}

procedure TFCodeForm.FB_cancelClick(Sender: TObject);
begin
  GSjobcode   := '';
  GScodetname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFCodeForm.Bt_ExitClick(Sender: TObject);
begin
  close;
end;

procedure TFCodeForm.BT_SearchClick(Sender: TObject);
begin
   DBGrid1DblClick(Sender);
end;

procedure TFCodeForm.DBGrid1DblClick(Sender: TObject);
begin
  if not Qry_code.Eof then
  begin
    if FM_Mainform.FG_jobclick = 'FR' then
      FM_Mainform.BE_jobfr.Text := Qry_code.FieldByName('CODENO').AsString+' - '+
                                   Qry_code.FieldByName('CODENAME').AsString
    else if FM_Mainform.FG_jobclick = 'TO' then
      FM_Mainform.BE_jobto.Text := Qry_code.FieldByName('CODENO').AsString+' - '+
                                   Qry_code.FieldByName('CODENAME').AsString;
  end;
  Close;
end;

procedure TFCodeForm.DBGrid1CellClick(Column: TColumn);
begin
  if not Qry_code.Eof then
  begin
    E_CodeNo.Text   := Qry_code.FieldByName('CODENO').AsString;
    E_Codename.Text := Qry_code.FieldByName('CODENAME').AsString;

    if FM_Mainform.FG_jobclick = 'FR' then
      FM_Mainform.BE_jobfr.Text := Qry_code.FieldByName('CODENO').AsString+' - '+
                                   Qry_code.FieldByName('CODENAME').AsString
    else if FM_Mainform.FG_jobclick = 'TO' then
      FM_Mainform.BE_jobto.Text := Qry_code.FieldByName('CODENO').AsString+' - '+
                                   Qry_code.FieldByName('CODENAME').AsString;
  end;
end;

procedure TFCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFCodeForm.E_CodenameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  Key := #0;
  Qry_code.Locate('CODENAME', E_CodeName.Text, [loPartialKey]);
  DBGrid1CellClick(DBGrid1.columns[0]);
end;

procedure TFCodeForm.E_CodenoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
    System.Exit;
  Key := #0;
  Qry_code.Locate('CODENO', E_Codeno.Text, [loPartialKey]);
  DBGrid1CellClick(DBGrid1.columns[0]);
end;

procedure TFCodeForm.FormCreate(Sender: TObject);
begin
  with Qry_code do
  begin
     Close;
     SQL.Clear;
     SQL.ADD(' SELECT CODENO, CODENAME  ');
     SQL.ADD('   FROM PYCCODE           ');
     SQL.ADD('  WHERE CODEID = ''I160'' ');
     SQL.ADD('    AND USEYN  = ''Y''    ');       
     SQL.ADD('  ORDER BY CODENO         ');
     open;
     Locate('CODENO', E_CodeNo.Text, [loPartialKey]);
  end;
end;

procedure TFCodeForm.FormShow(Sender: TObject);
begin
  FCodeForm.Left := FM_Mainform.BE_jobfr.Left + 350;
  FCodeForm.Top  := FM_Mainform.BE_jobfr.Top  + 150;
end;

end.
