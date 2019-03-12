unit Psa30303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, Grids, DBGrids, ExtCtrls, Mask, MemDS,
  DBAccess, Ora;

type
  TFpsa30303 = class(TForm)
    Panel1: TPanel;
    Panel14: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DataSource1: TDataSource;
    BBclose: TBitBtn;
    Eblank: TMaskEdit;
    OraQuery1: TOraQuery;
    OraQuery1JUNDATE: TStringField;
    OraQuery1JUNNO: TFloatField;
    OraQuery1TOTAL: TFloatField;
    procedure BBcloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBconfirmClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    GStempVar : String;
  end;

var
  Fpsa30303: TFpsa30303;

implementation

uses psa30301;
{$R *.DFM}

procedure TFpsa30303.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpsa30303.FormActivate(Sender: TObject);
begin
  Eblank.Text := GStempVar;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT LOANDATE JUNDATE, COUNT(*) JUNNO, SUM(LOANAMT) TOTAL ');
       Sql.Add('  FROM PSMLOAN                                              ');
       Sql.Add(' WHERE YYMM = '''+GStempVar+'''                             ');
       Sql.Add('   AND LOANDATE IS NOT NULL                                 ');
       Sql.Add(' GROUP BY LOANDATE                                          ');
       Open;
  end;
end;

procedure TFpsa30303.DBGrid1DblClick(Sender: TObject);
var Key : Char;
begin
//  Fpsa30301.MEtoday.Text := Query1JUNDATE.AsString;
//  Fpsa30301.MEdefaultKeyPress(Self, Key);
  Close;
end;

procedure TFpsa30303.BBconfirmClick(Sender: TObject);
begin
//  DBGrid1DblClick(Self);
end;

procedure TFpsa30303.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

end.
