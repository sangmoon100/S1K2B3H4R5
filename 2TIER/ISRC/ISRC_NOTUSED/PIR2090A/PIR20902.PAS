unit PIR20902;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, OnScheme, Db, MemDS, DBAccess, Ora,
  OnEditBaseCtrl, OnEditStdCtrl;

type
  TSearchForm = class(TForm)
    SF_Main: TOnSchemeForm;
    DBGrid1: TDBGrid;
    BtSel: TBitBtn;
    OraQuery1: TOraQuery;
    EdName: TOnEdit;
    btnSearch: TBitBtn;
    DataSource1: TDataSource;
    procedure FormPaint(Sender: TObject);
    procedure Query_View;
    procedure btnSearchClick(Sender: TObject);
    procedure EdNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtSelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

uses PIR20901;

{$R *.DFM}

procedure TSearchForm.Query_View;
begin
     With Oraquery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT a.empno, a.korname,                                ');
          SQL.Add('        (SELECT codename FROM pyccode                      ');
          SQL.Add('          WHERE codeid=''I113'' and codeno=a.payra) payra  ');
          SQL.Add('   FROM pimpmas a                                          ');
          SQL.Add('  WHERE korname like ''%' + EdName.Text + '%''             ');
          SQL.Add('  ORDER BY empno asc                                       ');

          Open;
     end;
end;

procedure TSearchForm.FormPaint(Sender: TObject);
begin
     Query_View;
end;

procedure TSearchForm.btnSearchClick(Sender: TObject);
begin
     Query_View;
end;

procedure TSearchForm.EdNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=13 then Query_View;
end;

procedure TSearchForm.BtSelClick(Sender: TObject);
begin
     MainForm.EdEmp.Text  := OraQuery1.FieldByName('empno').AsString;
     MainForm.EdName.Text := OraQuery1.FieldByName('korname').AsString;
     MainForm.Query_View;
     Close;
end;

end.
