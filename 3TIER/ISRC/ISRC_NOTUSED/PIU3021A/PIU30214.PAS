unit PIU30214;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TJobplaceForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    Panel3: TPanel;
    E_cond: TOnButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
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
   JobplaceForm : TJobplaceForm;

implementation

uses PIU30211;

{$R *.DFM}

procedure TJobplaceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TJobplaceForm.RunGridDblClick(Sender: TObject);
begin
  if TDS1.RecordCount > 0 then
  //if not TDS1.Eof then
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

procedure TJobplaceForm.BT_cancelClick(Sender: TObject);
begin
  CodeNo   := '';
  CodeName := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TJobplaceForm.FormShow(Sender: TObject);
begin
    E_cond.Text := '';
    E_condButtonClick(self,0);
end;

procedure TJobplaceForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TJobplaceForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  CodeSql := 'SELECT CodeNo, CodeName, ''F3'',''F4'',''F5'' '+
             '  FROM pyccode A ' +
             //' WHERE ORGNUM  = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')' +
             '  WHERE codeid =''I160'' ' +
      Format('    AND A.CodeName LIKE ''%s''', ['%'+E_cond.text+'%']) +
             'order by a.CodeNo';
  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add(CodeSql);

      ClearFieldInfo;
      AddField('CodeNo'  , ftString, 100);
      AddField('CodeName', ftString, 100);
      AddField('F3'      , ftString, 100);
      AddField('F4'      , ftString, 100);
      AddField('F5'      , ftString, 100);
      Open;
    end;
end;

end.
