unit Ibank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBClient,
  MemDS, DBAccess, Ora, Func;

type
  TFIbank = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    RBno: TRadioButton;
    RBname: TRadioButton;
    OraQuery1: TOraQuery;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBchkoutClick(Sender: TObject);
    procedure RBnoClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    //Recrive
    GSorgnumR : String;
    GSdeptcodeR : String;
    //Send
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSorgnumS : String;
    GSdeptcodeS : String;
    GSboncode : String;
    function StringOfDept(StringOf : String) : string;
  end;

var
  FIbank: TFIbank;

implementation

{$R *.DFM}

//------------------------------ User Procedure --------------------------------
function TFIbank.StringOfDept(StringOf : String) : string;
var
  LengthOfDept : Integer;
begin
  for LengthOfDept := Length(StringOf) downto 1  do begin
    if Copy(StringOf,LengthOfDept,1) <> '0' then begin
      StringOfDept := Copy(StringOf,1,LengthOfDept);
      Exit;
    end;
  end;
end;

procedure TFIbank.Retrieve;
var Parameter : OleVariant;
begin
  OraQuery1.Session := Ora_Session;  
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT CODENO, CODENAME  ');
       Sql.Add('  FROM PYCCODE           ');
       Sql.Add(' WHERE CODEID = ''K910'' ');
       Sql.Add(  ' AND USEYN  = ''Y''    ');

       If   RBno.Checked then Sql.Add('  ORDER BY CODENO, CODENAME ')
       else                   Sql.Add('  ORDER BY CODENAME, CODENO ');
       Open;
  end;
end;

//-------------------------------- MAIN ----------------------------------------
procedure TFIbank.FormActivate(Sender: TObject);
begin
     GIcloseS := 0;
     Retrieve;
end;

procedure TFIbank.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFIbank.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFIbank.DBGrid1DblClick(Sender: TObject);
begin
     GSempnoS   := OraQuery1.FieldByName('CODENO').AsString;
     GSkornameS := OraQuery1.FieldByName('CODENAME').AsString;
     GIcloseS := 0;
     Close;
end;

procedure TFIbank.BBchkoutClick(Sender: TObject);
begin
     DBGrid1DblClick(FIbank);
end;

procedure TFIbank.RBnoClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFIbank.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          DBGrid1DblClick(FIbank);
     end;
end;

end.
