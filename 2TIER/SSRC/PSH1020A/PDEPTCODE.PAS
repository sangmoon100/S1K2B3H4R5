unit Pdeptcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Shdowpnl, Grids, DBGrids, StdCtrls,
  Mask, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  jeonPan, MemDS, DBAccess, Ora;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_cond: TOnButtonEdit;
    Panel2: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    Ora_dept: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSdeptcodeS  : String;
    GSdeptcode   : String;
    GSdeptname   : String;
    GSorgnum     : String;
  end;

var
   DeptForm : TDeptForm;

implementation

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_dept.Close;
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
var
  ParamVariant : String;
begin

  ParamVariant  := ' SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME         '+
                   '   FROM PYCDEPT B                                           '+
            Format('  WHERE B.ORGNUM  = ''%s''                                  '+
                   '    AND B.DEPTCODE LIKE ''%s''', [GSorgnum, GSdeptcodeS+'%']);

  if E_cond.Text <> '' then
    ParamVariant := ParamVariant + Format(' AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'' ) ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

    ParamVariant := ParamVariant + ' ORDER BY DEPTCODE ';

  with Ora_dept do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);
      Open;
      FieldByName('DEPTCODE').Alignment   := taCenter;
    end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not Ora_dept.Eof then
  begin
    GSdeptcode   := Ora_dept.FieldByName('DEPTCODE').AsString;
    GSdeptname   := Ora_dept.FieldByName('DEPTNAME').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSdeptcode   := '';
    GSdeptname   := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.BT_CancelClick(Sender: TObject);
begin
  GSdeptcode   := '';
  GSdeptname := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
 