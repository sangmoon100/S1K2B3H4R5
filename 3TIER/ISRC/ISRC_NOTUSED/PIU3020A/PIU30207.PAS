unit PIU30207;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel;

type
  TDeptForm = class(TForm)
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
    Edit       : TOnWinPopupEdit;
    ExceptDept : String;
    Deptcode   : String;
    Deptname   : String;
    CodeSql    : String;
  end;

var
   DeptForm : TDeptForm;

implementation

uses PIU30201;

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if TDS1.RecordCount > 0 then
  //if not TDS1.Eof then
  begin
    Deptcode := TDS1.FieldByName('DEPTCODE').AsString;
    Deptname := TDS1.FieldByName('DEPTNAME').AsString;
  end
  else
  begin
    Deptcode := '';
    Deptname := '';
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.BT_cancelClick(Sender: TObject);
begin
  Deptcode := '';
  Deptname := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.FormShow(Sender: TObject);
begin
    E_condButtonClick(self,0);
end;

procedure TDeptForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add('SELECT DEPTCODE, DEPTNAME, ''F3'',''F4'',''F5''                    ');
    Sql.Add('  FROM PMOVEDEPT A                                                 ');
    Sql.Add('  WHERE A.RABASYY = ''' + MainForm.gs_Year + '''                   ');
    Sql.Add('    AND A.GUBUN   = ''A''                                          ');
    Sql.Add('    AND NVL(A.USEYN,''N'') = ''Y''                                 ');
    Sql.Add('    AND substr(a.deptcode,1,1) <> ''' + copy(ExceptDept,1,1) + ''' '); 
    Sql.Add('    AND A.DEPTNAME LIKE ''%'+ E_cond.text + '%''                   ');
    Sql.Add(' order by a.deptcode                                               ');

    //memo1.text := sql.text;

    ClearFieldInfo;
    AddField('DEPTCODE', ftString, 100);
    AddField('DEPTNAME', ftString, 100);
    AddField('F3'      , ftString, 100);
    AddField('F4'      , ftString, 100);
    AddField('F5'      , ftString, 100);
    Open;
  end;
end;

end.
