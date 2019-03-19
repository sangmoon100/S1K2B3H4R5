unit PKY1150A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemDS, DBAccess, Ora;

type
  Tdm1 = class(TDataModule)
    ds1: TDataSource;
    Query1: TOraQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{$R *.DFM}

end.
