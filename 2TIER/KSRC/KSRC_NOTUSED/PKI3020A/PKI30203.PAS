unit pki30203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, MemDS,
  DBAccess, Ora;

type
  TFpki30203 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BBclose: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel29: TPanel;
    Query1: TOraQuery;
    Query1DRVNAME: TStringField;
    Query1CODENAME: TStringField;
    Query1CODENAME_1: TStringField;
    Query1DRVMAXCNT: TIntegerField;
    Query1DRVAMT: TIntegerField;
    procedure BBcloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpki30203: TFpki30203;

implementation
uses
    pki30201;

{$R *.DFM}

procedure TFpki30203.BBcloseClick(Sender: TObject);
begin
     close;
end;

procedure TFpki30203.FormActivate(Sender: TObject);
begin
 {    Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add('select drvname,b.codename,c.codename,drvmaxcnt,drvamt ');
     Query1.SQL.Add('from pkcdrbas a,pyccode b,pyccode c ');
     Query1.SQL.Add('where a.payclfr=b.codeno and a.payclto=c.codeno ');
     Query1.SQL.Add(' and b.codeid=''I112'' and c.codeid=''I112''');
  }   Query1.Open;

end;

end.
