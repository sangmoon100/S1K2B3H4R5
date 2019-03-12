unit PFamicod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TCodeForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Exit: TOnFocusButton;
    BT_ok: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
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

uses Psh1070a1, PFamily;
{$R *.DFM}

procedure TCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TCodeForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    FamCode   := TDS1.FieldByName('CodeNo').AsString;
    FamCodeN  := TDS1.FieldByName('CodeName').AsString;
  end
  else
  begin
    FamCode   := '';
    FamCodeN  := '';
  end;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TCodeForm.BT_ExitClick(Sender: TObject);
begin
  FamCode   := '';
  FamCodeN  := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TCodeForm.FormShow(Sender: TObject);
begin
  with TDS1 do
    begin
      ServiceName := 'PKQ1030A_sel5';
      Close;
      Sql.Clear;
      Sql.Add('SELECT CODENO, CODENAME');
      Sql.Add('  FROM PKMYSCOD        ');
      Sql.Add('ORDER BY CODENO        ');

      ClearFieldInfo;
      AddField('CODENO'         , ftString,  2  );
      AddField('CODENAME'       , ftString,  30 );
      Open;
    end;                          
end;

end.
