unit pic70202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, Db, DBTables,qrprntr,timeftp;

type
  Tprintform = class(TForm)
    Qremd: TQuickRep;
    PageHeaderBand1: TQRBand;
    dband: TQRBand;
    cband: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLsysdate: TQRLabel;
    QRDBText2: TQRDBText;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1joblog: TStringField;
    Query1seqno: TFloatField;
    Query2: TQuery;
    procedure QremdBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QremdPreview(Sender: TObject);
    procedure dbandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbandAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    { Private declarations }
    LICcount : integer;       {Gauge Processing Count}
    LPcount : integer;        {Total Print Line Count}
    LPPcount : integer;       {Print Line Count Per Page}
  public
    { Public declarations }
    GITcount : integer;
    pagecount  : integer;
  end;

var
  printform: Tprintform;


implementation
{$R *.DFM}
uses pic70201, pic70203;

procedure Tprintform.QremdBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   SysDate : string;
begin
     LICcount := 0;
     GITcount := 0;
     LPcount  := 0;
     LPPcount := 0;
     pagecount  := 1;

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT SEQNO, JOBLOG ');
     Query1.SQL.ADD(' FROM PYHJLOG ');
     Query1.SQL.ADD(' WHERE JOBGUBUN = :WhereCond' );
     Query1.SQL.ADD(' ORDER BY SEQNO ');
     Query1.ParamByName('WhereCond').AsString := 'PIC7020G_' + pic7020gForm.P_empno;
     Query1.Open;
     GITcount := Query1.RecordCount;

     SysDate := TimeDate(Query2);
     QRLsysdate.Caption := Copy(SysDate, 1, 4) + '/' + Copy(SysDate, 5, 2) + '/' +
                           Copy(SysDate, 7, 2);
end;

procedure Tprintform.QremdPreview(Sender: TObject);
begin
   preview.QRpreview1.QRPrinter := TQRPrinter(sender);
 //  preview.show;
end;

procedure Tprintform.dbandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Inc(LICcount);
     Inc(LPcount);
     Inc(LPPcount);

     if(LPPcount >= 31) then    begin
             cband.enabled := True;
             LPPcount := 0;
             inc(pagecount);
        end
     else if (LPcount >= GITcount) then
           cband.enabled := True
     else begin
         cband.enabled := False;
         dband.enabled := true;
     end;
end;

procedure Tprintform.cbandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   //if query1.Eof then
   if (LPcount = GITcount) then
    begin
      PREVIEW.Show;
      Exit;
    end ;
end;

end.
