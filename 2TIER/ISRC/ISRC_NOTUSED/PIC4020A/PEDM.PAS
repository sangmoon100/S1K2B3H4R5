unit peDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  TDM = class(TDataModule)
    Database1: TDatabase;
    Qr_F1: TQuery;
    Q_Main: TQuery;
    Q_Sub: TQuery;
    Qr_F2: TQuery;
    Qr_F3: TQuery;
    Qr_F4: TQuery;
    DS_F3: TDataSource;
    DS_F2: TDataSource;
    DS_F4: TDataSource;
    Q_Exec: TQuery;
    Query1: TQuery;
    Query_Gen: TQuery;
    Query_Gen2: TQuery;
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
