unit PIU30205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TCodeFormA = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    CodeKind: TLabel;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    CodeNo    : String;
    CodeName  : String;
    CodeSql   : String;
  end;

var
   CodeFormA : TCodeFormA;

implementation

uses PIU30201;

{$R *.DFM}

procedure TCodeFormA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TCodeFormA.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    CodeNo   := TDS1.FieldByName('CAREAB').AsString;
    CodeName := TDS1.FieldByName('CNAREAB').AsString;
  end
  else
  begin
    CodeNo   := '';
    CodeName := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeFormA.BT_cancelClick(Sender: TObject);
begin
  CodeNo   := '';
  CodeName := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeFormA.FormShow(Sender: TObject);
begin
  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add(CodeSql);

      ClearFieldInfo;
      AddField('CAREAB', ftString, 100);
      AddField('CNAREAB',ftString, 100);
      AddField('CNAREAA',ftString, 100);
      AddField('CAREAA', ftString, 100);
      AddField('F5',     ftString, 100);
      Open;
    end;

end;

end.
