unit PZK10108;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnPopupEdit, OnGrDBGrid,
  OnFocusButton, MemDS, DBAccess, Ora;

type
  TOrgForm = class(TForm)
    DataSource1: TDataSource;
    codeGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Select: TOnFocusButton;
    BT_Close: TOnFocusButton;
    OraQuery1: TOraQuery;
    procedure BT_CloseClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Edit        : TOnWinPopupEdit;
    DutyID      : String;
    OrgLevel    : Integer;
    FromWhere   : String;
    Code        : String;  {코드}
    CodeName    : String;  {코드명}

    Procedure Open_Grid;
  end;

var
  OrgForm: TOrgForm;
implementation

uses PZK10101;

{$R *.DFM}

Procedure TOrgForm.Open_Grid;
begin
  with OraQuery1 do
    begin
      Close;
      Sql.Clear;
      if FromWhere = 'ABIL' then
        begin
          codeGrid.Columns[0].Title.Caption := '세부 과업';
          Sql.Add('SELECT 0 task_sno, ''공통'' task_name         ');
          Sql.Add('  FROM dual                              ');
          Sql.Add('union                                    ');
          Sql.Add('SELECT task_sno, task_name               ');
          Sql.Add('  FROM a1task                            ');
          Sql.Add(' WHERE duty_id = :duty_id                ');
          Sql.Add(' order by task_sno                       ');
          ParamByName('duty_id').AsString := DutyID;
          Open;

        end
      else if FromWhere ='ORG' then
        begin
          codeGrid.Columns[0].Title.Caption := '세부 과업';
          Sql.Add('SELECT task_sno, task_name               ');
          Sql.Add('  FROM a1task                            ');
          Sql.Add(' WHERE duty_id = :duty_id                ');
          Sql.Add(' order by task_sno                       ');
          ParamByName('duty_id').AsString := DutyID;
          Open;

        end
      else if FromWhere ='UPORG' then
        begin
          Sql.Add('SELECT org_id , decode(org_level, 1,''Manager'', 2, ''Senior'', 3, ''Junior'') org_level, org_name    ');
          Sql.Add('  FROM a1org                             ');
          Sql.Add(' where duty_id = :duty_id                ');
          Sql.Add('   and org_level <  :org_level          ');
          Sql.Add(' order by org_id                         ');
          ParamByName('duty_id').AsString := DutyID;
          ParamByName('org_level').AsInteger := OrgLevel;
          Open;
        end     
      else if FromWhere ='RECOM' then
        begin
          codeGrid.Columns[0].Title.Caption := '추천 직무';
          Sql.Add('SELECT duty_id task_sno, duty_name  task_name    ');
          Sql.Add('  FROM a1duty                            ');
          Sql.Add(' order by duty_id                        ');
          Open;

        end;
    end;
end;

procedure TOrgForm.BT_CloseClick(Sender: TObject);
begin
  Code     := '';
  CodeName := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TOrgForm.codeGridDblClick(Sender: TObject);
begin
  Code     := OraQuery1.FieldByName('org_id').AsString ;
  CodeName := OraQuery1.FieldByName('org_name').AsString ;
  Edit.PopupForm.ClosePopup(False);
end;


procedure TOrgForm.FormShow(Sender: TObject);
begin
  Open_Grid;
end;

end.
