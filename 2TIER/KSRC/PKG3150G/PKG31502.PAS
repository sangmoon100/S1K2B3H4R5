unit pkg31502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids;

type
  TFkyempno = class(TForm)
    DBGrid1: TDBGrid;
    Eempno: TEdit;
    RB1: TRadioButton;
    RB2: TRadioButton;
    BBrun: TBitBtn;
    BBchkout: TBitBtn;
    BBclose: TBitBtn;
    Query1: TQuery;
    DSempno: TDataSource;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure RB2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GIcloseS    : Integer;
    GSempnoS    : String;
    GSkornameS  : String;
    GSorgnumS   : String;
    GSdeptcodeS : String;
    GSdeptnameS : String;

  end;

var
  Fkyempno: TFkyempno;

implementation

{$R *.DFM}
procedure TFkyempno.Retrieve;
begin
        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.ADD(' SELECT EMPNO, KORNAME, DEPTNAME, A.ORGNUM ORGNUM, A.DEPTCODE DEPTCODE ');
        Query1.SQL.ADD('   FROM PIMPMAS A, PYCDEPT C ');
        Query1.SQL.ADD('    WHERE A.ORGNUM = C.ORGNUM ');
        Query1.SQL.ADD('    AND A.DEPTCODE = C.DEPTCODE ');
        Query1.SQL.ADD('    AND A.EMPNO  NOT LIKE ''Y%'' ');
     If Eempno.Text <> '' then
     begin
        Query1.SQL.ADD('    AND (EMPNO LIKE :empno ');
        Query1.SQL.ADD('    OR KORNAME LIKE :empno )');
        Query1.ParamByName('empno').AsString := Eempno.Text + '%';
     end;

     If RB1.Checked then
       Query1.SQL.ADD('  ORDER BY EMPNO, KORNAME ')
     else
       Query1.SQL.ADD('  ORDER BY KORNAME, EMPNO ');
     Query1.Open;
end;



procedure TFkyempno.FormActivate(Sender: TObject);
begin
   Retrieve;
end;

procedure TFkyempno.BBcloseClick(Sender: TObject);
begin
    GIcloseS := -1;
    Close;
end;

procedure TFkyempno.RB1Click(Sender: TObject);
begin
   Retrieve;
   Eempno.SetFocus;
end;

procedure TFkyempno.BBrunClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TFkyempno.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(Fkyempno);
     end;

end;

procedure TFkyempno.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS     := Query1.FieldByName('empno').AsString;
     GSkornameS   := Query1.FieldByName('korname').AsString;
     GSdeptnameS  := Query1.FieldByName('deptname').AsString;
     GSorgnumS    := Query1.FieldByName('orgnum').AsString;
     GSdeptcodeS  := Query1.FieldByName('deptcode').AsString;
     GIcloseS     := 0;
     Close;
end;

procedure TFkyempno.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 then begin
        key := #0;
        Retrieve;
     end;
end;

procedure TFkyempno.RB2Click(Sender: TObject);
begin
  Retrieve;
  Eempno.SetFocus;
end;

end.
