unit PET3030A_DEPT;

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
    TDS: TTMaxDataSet;
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
  TDS.Close;
  Action := caFree;
end;

procedure TDeptForm.E_FindButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamSQL : String;
  i : integer;
begin
  ParamSQL  := 'SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME,           '+
               '       ''field3'', ''field4'',''field5''                      '+
               '  FROM PYCDEPT B                                              '+
               ' WHERE ORGNUM  = (select value1 from pimvari                  '+
               '                   where gubun = ''00'' and sgubun = ''0001'')'+
               '   AND Existon = ''1''                                        '+
               '   AND substr(deptlevel,1,1) in (''A'',''B'',''C'',''D'')     ';

 // if E_find.Text <> '' then
 //    ParamSQL := ParamSQL + Format(' AND (DEPTCODE LIKE ''%s'' OR DEPTNAME LIKE  ''%s'' ) ',['%'+E_find.Text+'%','%'+E_find.Text+'%']);

  ParamSQL  := ParamSQL  +  ' Order by Deptlevel, deptcode                                 ';

  with TDS do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('DEPTCODE', ftString,  100);
       AddField('DEPTNAME', ftString,  100);
       AddField('field3',   ftString,  100);
       AddField('field4',   ftString,  100);
       AddField('field5',   ftString,  100);
       Open;

       Fields[0].Alignment   := taCenter;
  end;
  try
    with TDS do
      begin
        Close;
        Sql.Clear;
        Sql.Add(ParamSQL);
        Open;
        for i := 0 to TDS.recordcount do
        begin
           if TDS.fieldbyname('deptcode').AsString = E_find.Text then
              Break;
           next;
        end;
      end;
  except
    TDS.Close;
  end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS.Eof then
  begin
       GSdeptcode := TDS.Fields[0].AsString;
       GSdeptname := TDS.Fields[1].AsString;
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
 