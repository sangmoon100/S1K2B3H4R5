unit PTA30102;

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

uses PTA30101;

{$R *.DFM}

Procedure TCForm.Open_Grid;
begin
  with OraQuery1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT ''0000'' SORTKEY, ''전체'' EDU_TYPE, ''전체'' EDU_NAME        ');
      Sql.Add('  FROM DUAL                              ');
      Sql.Add('UNION                                    ');
      Sql.Add('SELECT EDU_TYPE SORTKEY, EDU_TYPE, EDU_NAME                ');
      Sql.Add('  FROM PEDU2TYPE                         ');
      Sql.Add(Format('WHERE EDU_NAME like ''%s''',['%'+E_Search.Text+'%'])   );
      Sql.Add('ORDER BY SORTKEY                         ');
      Open;
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
  Code     := OraQuery1.FieldByName('EDU_TYPE').AsString ;
  CodeName := OraQuery1.FieldByName('EDU_NAME').AsString ;
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
