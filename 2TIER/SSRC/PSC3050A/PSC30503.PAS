unit psc30503;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DB, DBTables, Grids, DBGrids, Messages,Dialogs,SysUtils,
     Mask, ExtCtrls,datelib, Tmax_DataSetText, OnPopupEdit, OnGrDBGrid,
  OnFocusButton, MemDS, DBAccess, Ora, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl;

type
  TEmpForm = class(TForm)
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
    procedure codeGridKeyPress(Sender: TObject; var Key: Char);
    procedure codeGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    Edit        : TOnWinPopupEdit;
    Empno       : String;  {사번}
    Korname     : String;  {성명}
    Company     : String;  {업체코드}
    CompName    : String;  {업체명}

    Procedure Open_Grid;
  end;

var
  EmpForm: TEmpForm;
implementation

uses psc30501;

{$R *.DFM}

Procedure TEmpForm.Open_Grid;
begin
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;

    Sql.Add('SELECT A.EMPNO, A.KORNAME ');
    Sql.Add('  FROM PIMPMAS A          ');
    Sql.Add(' WHERE A.EMPNO IN (SELECT EMPNO FROM PSEXSPM) ');
//    Sql.Add('   AND A.pstate < ''80''  ');
    Sql.Add(Format('AND ((empno   like ''%s'') or ',['%'+E_Search.Text+'%'])   );
    Sql.Add(Format('     (korname like ''%s''))   ',['%'+E_Search.Text+'%'])   );
    Sql.Add('ORDER BY empno ');

    Open;
  end;
end;

procedure TEmpForm.BT_CloseClick(Sender: TObject);
begin
  Empno     := '';
  KorName   := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TEmpForm.codeGridDblClick(Sender: TObject);
begin
  if not OraQuery1.Eof then
  begin
    Empno     := OraQuery1.FieldByName('EMPNO').AsString;
    KorName   := OraQuery1.FieldByName('KORNAME').AsString;
  end
  else
  begin
    Empno     := '';
    KorName   := '';
  end;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TEmpForm.FormShow(Sender: TObject);
begin
  Open_Grid;
end;

procedure TEmpForm.E_SearchButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Open_Grid;
end;

procedure TEmpForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Open_Grid;
end;

procedure TEmpForm.codeGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then codeGridDblClick(Sender);
end;

procedure TEmpForm.codeGridTitleClick(Column: TColumn);
begin
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT A.EMPNO, A.KORNAME,        ');
    Sql.Add('       B.DEPTCODE, B.DEPTNAME     ');
    Sql.Add('  FROM PIMPMAS A, PYCDEPT B       ');
    Sql.Add(' WHERE A.DEPTCODE = B.DEPTCODE    ');
    Sql.Add('   AND A.pstate < ''80''          ');
    Sql.Add('   AND A.EMPNO IN (SELECT EMPNO FROM PSEXSPM)  ');
    Sql.Add(Format('AND ((empno   like ''%s'') or ',['%'+E_Search.Text+'%'])   );
    Sql.Add(Format('     (korname like ''%s''))   ',['%'+E_Search.Text+'%'])   );
    Sql.Add('ORDER BY  '+Column.FieldName              );
    Open;
  end;
end;

end.

