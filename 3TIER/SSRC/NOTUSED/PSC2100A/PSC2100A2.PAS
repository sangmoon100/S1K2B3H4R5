unit PSC2100A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFM_Print = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRShape15: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    L_Empno: TQRLabel;
    L_Korname: TQRLabel;
    L_Dept: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    L_AppDate: TQRLabel;
    L_AppMan: TQRLabel;
    L_owstcnt: TQRLabel;
    L_csdivcnt: TQRLabel;
    L_csodrcnt: TQRLabel;
    L_cssodrcnt: TQRLabel;
    L_csodramt: TQRLabel;
    L_csdivmonmth: TQRLabel;
    QRShape13: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Print: TFM_Print;

implementation

{$R *.DFM}

end.
