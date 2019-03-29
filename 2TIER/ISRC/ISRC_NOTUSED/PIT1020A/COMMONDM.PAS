unit commondm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    Database1: TDatabase;
    Csel: TQuery;
    Cupd: TQuery;
    QCDS: TQuery;
    QCode: TQuery;
    QCDS_Sub: TQuery;
    Qimsi: TQuery;
  private
    { private declarations }
  public
    { Public declarations }

    //  Tuxedo Component BeforeCall Event 처리변수

    function  EXEC_SQL(Sqltext: String): Boolean;
    procedure ExecSQL(Sqltext: String);
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

procedure TDM.ExecSQL(Sqltext: String);
begin
    with Cupd do
    begin
        Close;
        SQL.Clear;
        SQL.Text := Sqltext;
      TRY
        ExecSql;
      EXCEPT
        Close;
        System.Exit;
      END;
    end;
end;

function TDM.EXEC_SQL(Sqltext: String): Boolean;
begin
    Result := False;
    with Cupd do
    begin
        Close;
        SQL.Clear;
        SQL.Text := Sqltext;

      TRY
        ExecSql;
      EXCEPT
        Close;
        System.Exit;
      END;
    end;
    Result := True;
end;


end.


