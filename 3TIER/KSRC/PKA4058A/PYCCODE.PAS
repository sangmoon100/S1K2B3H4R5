unit PYCCODE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TCCodeForm = class(TForm)
    DataSource1: TDataSource;
    TDS3: TTMaxDataSet;
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
    CodeSql1   : String;
  end;

var
   CCodeForm : TCCodeForm;

implementation

uses pka4058a0;

{$R *.DFM}

procedure TCCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS3.Close;
end;

procedure TCCodeForm.RunGridDblClick(Sender: TObject);
begin
  if TDS3.Active then  // not TDS3.Eof then
  begin
    CodeNo   := TDS3.FieldByName('CodeNo').AsString;
    CodeName := TDS3.FieldByName('CodeName').AsString;
  end
  else
  begin
    CodeNo   := '';
    CodeName := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TCCodeForm.BT_cancelClick(Sender: TObject);
begin
  CodeNo   := '';
  CodeName  := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TCCodeForm.FormShow(Sender: TObject);
begin
     with TDS3 do
     begin
          ServiceName := 'PKW1010A_sel2';
          Close;
          Sql.Clear;
          Sql.Add(CodeSql1);

          ClearFieldInfo;
          AddField('CODENO'         , ftString,  10  );
          AddField('CODENAME'       , ftString,  20 );
          Open;
     end;

end;

end.
