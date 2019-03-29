unit PIT1040C0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MConnect, XInsaDll, DBClient, DBTables;

type
  TDM = class(TDataModule)
    qryTemp: TQuery;
    qryCODE: TQuery;
    Database1: TDatabase;
    qryMain: TQuery;
    qryDuty: TQuery;
    qryEqip: TQuery;
    qryProg: TQuery;
    qryLice: TQuery;
    qrySCH: TQuery;
    qryCARR: TQuery;
    qryEDU: TQuery;
    qryETC: TQuery;
    qryExcel1: TQuery;
    qryExcel: TQuery;
  private
    { private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

uses
  PIT1040C1;

end.


