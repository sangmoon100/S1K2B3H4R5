unit UPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText;

type
  TPrintForm = class(TForm)
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
    QR_E1korname: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QR_korname: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QR_E1valview: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QR_Workdate: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRImage1: TQRImage;
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
  PrintForm: TPrintForm;

implementation

uses UDiaryForm;//, PePrnview;

{$R *.DFM}

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QR_korname.Caption   := DiaryForm.L_korname.ValueCaption;
   QR_E1korname.Caption := DiaryForm.L_E1korname.ValueCaption;

   QR_Workdate.Caption := copy(DiaryForm.TDS1.fieldbyname('WORKDATE').AsString,1,4) + '-'+
                          copy(DiaryForm.TDS1.fieldbyname('WORKDATE').AsString,5,2) + '-'+
                          copy(DiaryForm.TDS1.fieldbyname('WORKDATE').AsString,7,2) ;
{
   IF length(DiaryForm.TDS1.FieldByName('OPINION1').AsString) > 1000 THEN
        QR_OPINION1.Font.Size := 8
   else QR_OPINION1.Font.Size := 9;

   IF length(DiaryForm.TDS1.FieldByName('OPINION2').AsString) > 1000 THEN
        QR_OPINION2.Font.Size := 8
   else QR_OPINION2.Font.Size := 9;

   IF length(DiaryForm.TDS1.FieldByName('OPINION3').AsString) > 1000 THEN
        QR_OPINION3.Font.Size := 8
   else QR_OPINION3.Font.Size := 9;

   IF length(DiaryForm.TDS1.FieldByName('E1VALVIEW').AsString) > 1000 THEN
        QR_E1VALVIEW.Font.Size := 8
   else QR_E1VALVIEW.Font.Size := 9;
}   
end;

procedure TPrintForm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  DiaryForm.TCDS.Next;
  if DiaryForm.TCDS.eof then
       DiaryForm.TCDS.First;
end;

end.
