unit PKY1100A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, ExtCtrls, Qrctrls;

type
  TFM_Print = class(TForm)
    QuickReport1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLdataname: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLdate: TQRLabel;
    QRLabel10: TQRLabel;
    empno: TQRDBText;
    korname: TQRDBText;
    paysum: TQRDBText;
    paycl: TQRDBText;
    pstate: TQRDBText;
    cnt: TQRDBText;
    amtsum: TQRDBText;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Print: TFM_Print;

implementation

uses PKY1100A1, PKY1100A2;

{$R *.DFM}

end.
