unit pkw20104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OraSmart, MemDS, DBAccess, Ora;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    Query1: TOraQuery;
    Query2: TOraQuery;
    Query3: TOraQuery;
    Table1: TOraTable;
    Table1PAYNUM: TStringField;
    Table1PAYCL: TStringField;
    Table1PAYGR: TIntegerField;
    Table1JOBDUTY: TStringField;
    Table1BASICAMT: TIntegerField;
    Table1EXTAMT: TIntegerField;
    Table1NIGHTAMT: TIntegerField;
    Table1WRITETIME: TStringField;
    Table1WRITEMAN: TStringField;
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
