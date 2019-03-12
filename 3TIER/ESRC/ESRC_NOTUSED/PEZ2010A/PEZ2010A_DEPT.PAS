unit pez2010a_dept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Shdowpnl, Grids, DBGrids, StdCtrls,
  Mask, Db, OnPopupEdit, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnFocusButton, OnGrDBGrid, Tmax_DataSetText;

type
  TDeptForm = class(TForm)
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_Find: TOnButtonEdit;
    Panel2: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    TDS1: TTMaxDataSet;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_FindButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_FindKeyPress(Sender: TObject; var Key: Char);
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

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
  Action := caFree;
end;

procedure TDeptForm.E_FindButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamSQL : String;
begin
  ParamSQL  := 'SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME,           '+
               '       ''field3'', ''field4'',''field5''                      '+
               '  FROM PYCDEPT B                                              '+
               ' WHERE ORGNUM  = (select value1 from pimvari                  '+
               '                   where gubun = ''00'' and sgubun = ''0001'')'+
               '   AND Existon = ''1''                                        '+
               '   AND substr(deptlevel,1,1) in (''A'',''B'',''C'')           '+
               ' Order by Deptlevel, deptcode                                 ';

//  if E_cond.Text <> '' then
//    ParamVariant := ParamVariant + Format(' AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'' ) ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

  with TDS1 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;

       Fields[0].Alignment   := taCenter;
  end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
       GSdeptcode := TDS1.Fields[0].AsString;
       GSdeptname := TDS1.Fields[1].AsString;
       GIcloseS   := 0;
  end
  else
  begin
       GSdeptcode := '';
       GSdeptname := '';
       GIcloseS   := -1;
  end;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TDeptForm.BT_CancelClick(Sender: TObject);
begin
  GSdeptcode := '';
  GSdeptname := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TDeptForm.E_FindKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then E_FindButtonClick(Sender, 0);
end;

end.
 