unit Pit2040a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, peextcombo;

type
  TDM = class(TDataModule)
    Database1: TDatabase;
    Qry_work: TQuery;
    Qry_SelectA: TQuery;
    Qry_Temp: TQuery;
    Qry_SelectB: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function _OracleDateTime: String;
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

function TDM._OracleDateTime: String;
begin
  with Qry_Temp do
  begin
    Close;
    try
        SQL.Clear;
        SQL.Add('SELECT TO_CHAR(SYSDATE, ''YYYYMMDDHH24MI'') OrderDate FROM DUAL');
        Open;
        Result := FieldByName('OrderDate').AsString;
    except
        Result := '';
    end;
    Close;
  end;
end;

end.
