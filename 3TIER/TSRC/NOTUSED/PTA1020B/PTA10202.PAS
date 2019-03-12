unit pta10202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, OnPopupEdit,
  Tmax_DataSetText;

type
  TFM_empno = class(TForm)
    DataSource1: TDataSource;
    Grid1: TOnGrDbGrid;
    CD_emp: TTMaxDataSet;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Grid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_Sql      : string;
    FG_DeptCode : TStringList;
    FG_Edit     : TOnWinPopupEdit;

    procedure PL_DataFind;
  end;

var
  FM_empno: TFM_empno;

implementation

uses pta10201 ;  

{$R *.DFM}

procedure TFM_empno.PL_DataFind;
var
  FL_Sql   : String;
  FL_Param : String;
  FL_I     : Integer;
begin
  FG_Sql := ' SELECT NVL(empno,'' ''),     '+
            '        NVL(korname,'' '')    '+
            '   FROM pimpmas               '+
            '  WHERE pstateyn = ''Y''      '+
            '    AND deptcode IN (%s)      '+
            '  ORDER BY KORNAME            ';
  FL_Param := '';
  for FL_I := 0 to FG_Deptcode.Count - 1 do
    begin
      if FL_I > 0 then
        FL_Param := FL_Param + ','+ Chr(39) + FG_Deptcode[FL_I] + Chr(39)
      else
        FL_Param := Chr(39) + FG_Deptcode[FL_I] + Chr(39);
    end;
  FG_Sql := Format(FG_Sql,[FL_Param]);
  with CD_emp do
    begin
      ServiceName := 'PTA1020B_sel4';
      Close;
      Sql.Clear;
      Sql.Add(FG_Sql);

      ClearFieldInfo;
      AddField('empno',  ftString, 4 );
      AddField('korname',ftString, 12);
      Open;
    end;
end;

procedure TFM_empno.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CD_emp.Close;
  CanClose := True;
end;

procedure TFM_empno.Grid1DblClick(Sender: TObject);
begin
  FG_Edit.PopupForm.ClosePopup(True);
end;

end.
