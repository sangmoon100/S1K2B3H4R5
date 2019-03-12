unit PIU30206;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TCodeFormB = class(TForm)
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
    BuSeoName : String;
    CodeSql   : String;
  end;

var
   CodeFormB : TCodeFormB;

implementation

uses PIU30201;

{$R *.DFM}

procedure TCodeFormB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TCodeFormB.RunGridDblClick(Sender: TObject);
begin
(*
  if not TDS1.Eof then
  begin
    CodeNo   := TDS1.FieldByName('JOBCODE').AsString;
    CodeName := TDS1.FieldByName('JOBNAME').AsString;
    BuSeoName:= TDS1.FieldByName('DEPTGUBUN').AsString;
  end
  else
  begin
    CodeNo    := '';
    CodeName  := '';
    BuSeoName := '';
  end;
*)
  CodeNo   := TDS1.FieldByName('JOBCODE').AsString;
  CodeName := TDS1.FieldByName('JOBNAME').AsString;
  BuSeoName:= TDS1.FieldByName('DEPTGUBUN').AsString;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TCodeFormB.BT_cancelClick(Sender: TObject);
begin
  CodeNo    := '';
  CodeName  := '';
  BuSeoName := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TCodeFormB.FormShow(Sender: TObject);
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(CodeSql);

    ClearFieldInfo;
    AddField('JOBCODE',  ftString, 100);
    AddField('JOBNAME',  ftString, 100);
    AddField('DEPTGUBUN',ftString, 100);
    AddField('AREACODE', ftString, 100);
    AddField('F5',       ftString, 100);
    Open;
  end;
end;

end.
