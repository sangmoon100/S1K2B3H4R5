unit pic40702;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Quickrpt, codetext, MemDS, JPEG, datelib, QRCtrls,
  DBAccess, Ora, Func;

type
  TCData = class(TDataModule)
    Ora_Picture: TOraQuery;
    OraQuery1: TOraQuery;
    procedure CDataCreate(Sender: TObject);
    procedure CDataDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CData: TCData;

implementation
uses pic40701;
{$R *.DFM}

procedure TCData.CDataCreate(Sender: TObject);
begin
  OraConnect;
end;

procedure TCData.CDataDestroy(Sender: TObject);
begin
  Ora_Picture.Active := False;
  Ora_Session.Connected := False;
end;

end.
