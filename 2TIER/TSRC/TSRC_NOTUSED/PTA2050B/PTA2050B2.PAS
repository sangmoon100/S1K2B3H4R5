unit pta2050b2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls;

type
  TFkyempno = class(TForm)
    Query1: TQuery;
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    RB1: TRadioButton;
    RB2: TRadioButton;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Send
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSorgnumS : String;
    GSdeptcodeS : String;
  end;

var
  Fkyempno: TFkyempno;

implementation

uses pta2050b1;

{$R *.DFM}

procedure TFkyempno.Retrieve;
begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT EMPNO, KORNAME ');
     Query1.SQL.ADD('   FROM PKMPMAS ');
     If Eempno.Text <> '' then begin
        Query1.SQL.ADD(' WHERE ((EMPNO LIKE :empno) OR (KORNAME LIKE :empno)) ');
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

procedure TFkyempno.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFkyempno.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        Retrieve;
     end;

end;

procedure TFkyempno.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS   := Query1.FieldByName('empno').AsString;
     GSkornameS := Query1.FieldByName('korname').AsString;
     GIcloseS   := 0;
     Close;
end;

procedure TFkyempno.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(Fkyempno);
     end;
end;

procedure TFkyempno.RB1Click(Sender: TObject);
begin
     Eempno.SetFocus;
end;

end.
