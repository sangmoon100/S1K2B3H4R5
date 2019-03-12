unit PEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TEmpForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_cond: TOnButtonEdit;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    EmpNO     : String;
    KorName   : String;
    DeptName  : String;
    JuminID   : String;
    WorkCond  : String;
  end;

var
   EmpForm : TEmpForm;

implementation


{$R *.DFM}

procedure TEmpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TEmpForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  TDS1.Close;
  TDS1.Sql.Clear;
  TDS1.Sql.Add(Format('SELECT A.EMPNO, A.KORNAME, A.JUMINID, B.DEPTNAME        '+
                      '  FROM PKMYSAPP A, PYCDEPT B                            '+
                      ' WHERE (A.EMPNO LIKE ''%s'' OR A.KORNAME LIKE ''%s'')   '+
                      '   AND A.ORGNUM   = B.ORGNUM                            '+
                      '   AND A.DEPTCODE = B.DEPTCODE                          '+
                      '   AND A.WORKYY   = ''%s''                              '+
                      ' ORDER BY A.KORNAME ',
                      ['%'+E_Cond.Text+'%', '%'+E_Cond.Text+'%', WorkCond]));
  TDS1.Open;

end;

procedure TEmpForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
    begin
      EmpNo   := TDS1.FieldByName('EmpNo').AsString;
      KorName := TDS1.FieldByName('KorName').AsString;
      DeptName:= TDS1.FieldByName('DeptName').AsString;
    end
  else
    begin
      EmpNo   := '';
      KorName := '';
      DeptName:= '';
    end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.BT_cancelClick(Sender: TObject);
begin
  EmpNo   := '';
  KorName := '';
  DeptName:= '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
 