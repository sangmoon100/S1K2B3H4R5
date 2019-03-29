unit PIE23107;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables;

type
  TNewPrintForm = class(TForm)
    InReport: TQuickRep;
    QRBand_Header: TQRBand;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRBand_Detail: TQRBand;
    QRShape5: TQRShape;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRDBText3: TQRDBText;
    QRShape37: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    procedure InReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure InReportPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPrintForm: TNewPrintForm;

implementation

uses PIE23101,PePrnview;


{$R *.DFM}

procedure TNewPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRL_WorkDate.Caption  := Copy(MainForm.ME_WorkDate.Text, 1, 4) + '³â ' + Copy(MainForm.ME_WorkDate.Text, 6, 2) + '¿ù ';
  QRL_curdate.Caption   := MainForm.L_Date.Caption;
end;

procedure TNewPrintForm.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

end.
