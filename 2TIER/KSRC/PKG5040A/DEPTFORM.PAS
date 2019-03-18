unit DeptForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  DBTables, peoutlookbtn, MemDS, DBAccess, Ora;

type
  TFDeptForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    E_DeptCode: TOnEdit;
    DBGrid1: TDBGrid;
    E_deptname: TOnEdit;
    E_Orgnum: TMaskEdit;
    Bt_Exit: TOnFocusButton;
    BT_Search: TOnFocusButton;
    Qry_dept: TOraQuery;
    procedure FB_cancelClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSdeptcodeS  : String;
    GSdeptcode   : String;
    GSdeptname   : String;
  end;

var
   FDeptForm : TFDeptForm;

implementation

uses PKG5040A1;

{$R *.DFM}

procedure TFDeptForm.FB_cancelClick(Sender: TObject);
begin
  GSdeptcode   := '';
  GSdeptname := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TFDeptForm.Bt_ExitClick(Sender: TObject);
begin
     close;
end;

procedure TFDeptForm.BT_SearchClick(Sender: TObject);
   var sSql: String;
begin
    with Qry_dept do
    begin
       Close;
       SQL.Clear;
       SQL.ADD(' SELECT A.DEPTCODE, B.DEPTNAME, B.DEPTNA3  ');
       SQL.ADD('   FROM PKCEXDPT A, PYCDEPT B              ');
       SQL.ADD('  WHERE A.ORGNUM   = B.ORGNUM              ');
       SQL.ADD('    AND A.DEPTCODE = B.DEPTCODE            ');
       SQL.ADD('    AND A.ORGNUM   ='''+ E_Orgnum.text+''' ');
       if E_DeptCode.Text <> '' then
          SQL.ADD('  AND A.DEPTCODE ='''+ E_DeptCode.text+''' ');

       SQL.ADD(' ORDER BY DEPTCODE                         ');
       open;
       DBGrid1CellClick(DBGrid1.columns[0]);
    end;
end;

procedure TFDeptForm.DBGrid1DblClick(Sender: TObject);
begin
  if not Qry_dept.Eof then
  begin
    FMainForm.E_DeptCode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
    FMainForm.E_DeptName.Text   := Qry_dept.FieldByName('DEPTNAME').AsString;
  end;
  Close;
end;

procedure TFDeptForm.DBGrid1CellClick(Column: TColumn);
begin
  if not Qry_dept.Eof then
  begin
     E_DeptCode.Text  := Qry_dept.FieldByName('DEPTCODE').AsString;
     E_DeptName.Text   := Qry_dept.FieldByName('DEPTNAME').AsString;
  end;
  //Close;
end;

procedure TFDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Query1.Close;
end;

end.
