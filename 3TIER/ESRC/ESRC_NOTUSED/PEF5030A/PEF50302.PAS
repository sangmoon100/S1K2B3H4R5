unit PEF50302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText;

type
  TPEF5031 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QR_Opinion1: TQRDBText;
    QR_Opinion2: TQRDBText;
    QR_Opinion3: TQRDBText;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QR_E1korname: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QR_empno: TQRLabel;
    QR_korname: TQRLabel;
    QRLabel6: TQRLabel;
    QR_E1empno: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QR_E1valview: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QR_Workdate: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PEF5031: TPEF5031;

implementation

uses PEF50301;

{$R *.DFM}

procedure TPEF5031.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
(*
   QR_empno.Caption     := PEF50301.ed_empno.Text;
   QR_korname.Caption   := PEF50301.L_korname.ValueCaption;
   QR_E1empno.Caption   := PEF50301.L_E1empno.ValueCaption;
   QR_E1korname.Caption := PEF50301.L_E1korname.ValueCaption;

   QR_Workdate.Caption := copy(PEF50301.TDS1.fieldbyname('WORKDATE').AsString,1,4) + '-'+
                          copy(PEF50301.TDS1.fieldbyname('WORKDATE').AsString,5,2) + '-'+
                          copy(PEF50301.TDS1.fieldbyname('WORKDATE').AsString,7,2) ;

   IF length(PEF50301.TDS1.FieldByName('OPINION1').AsString) > 500 THEN
         QR_OPINION1.Font.Size := 7
   else  QR_OPINION1.Font.Size := 9;

   IF length(PEF50301.TDS1.FieldByName('OPINION2').AsString) > 500 THEN
         QR_OPINION2.Font.Size := 7
   else  QR_OPINION2.Font.Size := 9;

   IF length(PEF50301.TDS1.FieldByName('OPINION3').AsString) > 500 THEN
         QR_OPINION3.Font.Size := 7
   else  QR_OPINION3.Font.Size := 9;

   IF length(PEF50301.TDS1.FieldByName('E1VALVIEW').AsString) > 500 THEN
         QR_E1VALVIEW.Font.Size := 7
   else  QR_E1VALVIEW.Font.Size := 9;
*)
end;

procedure TPEF5031.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
(*
   PEF50301.TCDS.Next;
   if PEF50301.TCDS.eof then
      PEF50301.TCDS.First;
*)
end;

end.
