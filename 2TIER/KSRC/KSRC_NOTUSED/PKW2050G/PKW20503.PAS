unit pkw20503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, MemDS, DBAccess, Ora;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    Query2: TOraQuery;
    Query1: TOraQuery;
    Query1StringField: TStringField;
    Query1StringField2: TStringField;
    Query1StringField3: TStringField;
    Query1StringField4: TStringField;
    Query1StringField5: TStringField;
    Query1StringField6: TStringField;
    Query1StringField7: TStringField;
    Query1StringField8: TStringField;
    Query1StringField9: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

end.
