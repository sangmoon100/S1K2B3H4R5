unit peDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    Q_Fore: TQuery;
    Database1: TDatabase;
    Q_temp: TQuery;
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
