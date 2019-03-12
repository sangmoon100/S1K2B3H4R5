unit PZA1010A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, StdCtrls, OnFocusButton, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, Grids, DBGrids, OnGrDBGrid,
  OnPopupEdit, Func;

type
  TFM_Prev = class(TForm)
    Grid1: TOnGrDbGrid;
    Ora_Qry1: TOraQuery;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
  private
    FL_Start : Boolean;
  public
    { Public declarations }
    Edit : TOnWinPopupEdit;
    procedure Data_Find;
  end;

implementation

{$R *.DFM}

procedure TFM_Prev.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Prev.FormPaint(Sender: TObject);
begin
  if FL_Start then
    begin
      FL_Start := False;
      Application.ProcessMessages;
    end;
end;

procedure TFM_Prev.Data_Find;
var
  FL_Sql : String;
begin
  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      SqlRefresh.Clear;
      FL_Sql := 'SELECT groupid, groupname '+
                '  FROM pymenugroup ';
      Sql.Text := FL_Sql;
      Open;
    end;
end;

procedure TFM_Prev.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Grid1DblClick(Sender);
      Key := #0;
    end;
end;

procedure TFM_Prev.Grid1DblClick(Sender: TObject);
var
  FL_Text   : String;
  FL_Accept : Boolean;
begin
  if Ora_Qry1.Active then
    Edit.PopupForm.ClosePopup(True);
end;

end.
