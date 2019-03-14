unit pkc30402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, MemDS, DBAccess, Ora;

type
  Tdm1 = class(TDataModule)
    Qry1: TOraQuery;
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
