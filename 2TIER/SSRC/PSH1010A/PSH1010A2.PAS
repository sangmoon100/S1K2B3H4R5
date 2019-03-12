unit PSH1010A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  MemDS, DBAccess, Ora;

type
  TCodeForm = class(TForm)
    DataSource1: TDataSource;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    Query1: TOraQuery;
    Query1CODENO: TStringField;
    Query1CODENAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    FamCode   : String;
    FamCodeN  : String;
  end;

var
   CodeForm : TCodeForm;

implementation

uses  PSH1010A1;

{$R *.DFM}

procedure TCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

procedure TCodeForm.RunGridDblClick(Sender: TObject);
begin
  if not Query1.Eof then
  begin
    FamCode   := Query1.FieldByName('CodeNo').AsString;
    FamCodeN  := Query1.FieldByName('CodeName').AsString;
  end
  else
  begin
    FamCode   := '';
    FamCodeN  := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeForm.BT_cancelClick(Sender: TObject);
begin
  FamCode   := '';
  FamCodeN  := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeForm.FormShow(Sender: TObject);
begin
     with Query1 do
     begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT CODENO, CODENAME           ');
          Sql.Add('  FROM PKMYSCOD                   ');
          Sql.Add('ORDER BY CODENO                   ');
          Open;
     end;

end;

end.
