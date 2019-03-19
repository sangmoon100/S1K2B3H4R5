unit PKY1050A0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemDS, DBAccess, Ora;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    Qry_othis: TOraQuery;
    Qry_othisOVTMDATE: TStringField;
    Qry_othisFRREALTIME: TStringField;
    Qry_othisTOREALTIME: TStringField;
    Qry_othisRESTMM: TIntegerField;
    Qry_othisSPRESTMM: TIntegerField;
    Qry_othisOVTMDESC: TStringField;
    Qry_othisCONYN: TStringField;
    Query1: TOraQuery;
    Qry_rpt: TOraQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses PKY1050A1;

{$R *.DFM}



end.
