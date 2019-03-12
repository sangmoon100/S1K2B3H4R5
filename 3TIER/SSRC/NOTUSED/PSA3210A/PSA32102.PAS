unit PSA32102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TCodeForm = class(TForm)
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
   CodeForm : TCodeForm;

implementation

uses PSA32101;

{$R *.DFM}

procedure TCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TCodeForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    CodeNo   := TDS1.FieldByName('CodeNo').AsString;
    CodeName := TDS1.FieldByName('CodeName').AsString;
  end
  else
  begin
    CodeNo   := '';
    CodeName := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeForm.BT_cancelClick(Sender: TObject);
begin
  CodeNo   := '';
  CodeName  := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TCodeForm.FormShow(Sender: TObject);
begin
  with TDS1 do
    begin
      ServiceName := 'PKW1010A_sel2';
      Close;
      Sql.Clear;
      Sql.Add(CodeSql);

      ClearFieldInfo;
      AddField('CODENO'         , ftString,  10  );
      AddField('CODENAME'       , ftString,  20 );
      Open;
    end;

end;

end.
