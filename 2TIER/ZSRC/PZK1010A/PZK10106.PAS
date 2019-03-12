unit PZK10106;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnPopupEdit, OnGrDBGrid,
  OnFocusButton, MemDS, DBAccess, Ora, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl;

type
  TCForm = class(TForm)
    DataSource1: TDataSource;
    codeGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Select: TOnFocusButton;
    BT_Close: TOnFocusButton;
    OraQuery1: TOraQuery;
    Panel2: TPanel;
    E_Search: TOnButtonEdit;
    procedure BT_CloseClick(Sender: TObject);
    procedure codeGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_SearchButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Edit        : TOnWinPopupEdit;
    DutyID      : String;
    FromWhere   : String;
    Code        : String;  {코드}
    CodeName    : String;  {코드명}

    Procedure Open_Grid;
  end;

var
  CForm: TCForm;
implementation

uses PZK10101;

{$R *.DFM}

Procedure TCForm.Open_Grid;
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
          Sql.Add(Format('AND task_name like ''%s''',['%'+E_Search.Text+'%'])   );
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
          Sql.Add(Format('AND task_name like ''%s''',['%'+E_Search.Text+'%'])   );
          Sql.Add(' order by task_sno                       ');
          ParamByName('duty_id').AsString := DutyID;
          Open;

        end
      else if FromWhere ='UPORG' then
        begin
          codeGrid.Columns[0].Title.Caption := '상위 조직';
          Sql.Add('SELECT org_id task_sno, org_name  task_name    ');
          Sql.Add('  FROM a1org                             ');
          Sql.Add(' where duty_id = :duty_id                ');
          Sql.Add(' order by org_id                         ');
          ParamByName('duty_id').AsString := DutyID;
          Open;

        end
      else if FromWhere ='RECOM' then
        begin
          codeGrid.Columns[0].Title.Caption := '추천 직무';
          Sql.Add('SELECT duty_id task_sno, duty_name  task_name    ');
          Sql.Add('  FROM a1duty                            ');
          Sql.Add(Format('WHERE duty_name like ''%s''',['%'+E_Search.Text+'%'])   );
          Sql.Add(' order by duty_id                        ');
          Open;

        end;
    end;
end;

procedure TCForm.BT_CloseClick(Sender: TObject);
begin
  Code     := '';
  CodeName := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TCForm.codeGridDblClick(Sender: TObject);
begin
  Code     := OraQuery1.FieldByName('task_sno').AsString ;
  CodeName := OraQuery1.FieldByName('task_name').AsString ;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TCForm.FormShow(Sender: TObject);
begin
  E_Search.Text := '';
  Open_Grid;
end;

procedure TCForm.E_SearchButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Open_Grid;
end;

procedure TCForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Open_Grid;
end;

end.
