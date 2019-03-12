unit pka4058a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
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
  end;

var
   DeptForm : TDeptForm;

implementation

uses pka4058a0;

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant : String;
begin
  ParamVariant := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode                   '+
                  '  FROM pycdept                                                                            '+
                  ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                  '   AND existon  = ''1''                                      '+
                  '   AND chanmode <> ''3''                                     '+
                  '   AND deptcode  IN                                          '+
                  '      (SELECT jobdept FROM pimpmas WHERE empno   = ''%s''    '+
                  '       UNION                                                 '+
                  '       SELECT jobdept FROM pimeemp WHERE eempno  = ''%s'' )  ';
  ParamVariant := Format(ParamVariant, [FM_Main.E_empno.empno, FM_Main.E_empno.empno]);

  with TDS1 do
  begin
       ServiceName := 'PKA4100C_sel1';
       Close;
       Sql.Clear;
       Sql.Add(ParamVariant);

       ClearFieldInfo;
       AddField('DEPTCODE'          , ftString  ,  6   );
       AddField('DEPTNAME'          , ftString  ,  60  );
       Open;
       FieldByName('DEPTCODE').Alignment   := taCenter;
   end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSdeptcode   := TDS1.FieldByName('DEPTCODE').AsString;
    GSdeptname   := TDS1.FieldByName('DEPTNAME').AsString;
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

procedure TDeptForm.FB_cancelClick(Sender: TObject);
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
 