unit PIE23207;

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
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRShape20: TQRShape;
    QRLabel26: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel27: TQRLabel;
    QRShape23: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape52: TQRShape;
    QRDBText7: TQRDBText;
    QRShape53: TQRShape;
    QRLabel29: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText25: TQRDBText;
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

uses PIE23201,PePrnview;


{$R *.DFM}

procedure TNewPrintForm.InReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRL_WorkDate.Caption  := Copy(MainForm.ME_WorkDate.Text, 1, 4) + '³â ' +
                           Copy(MainForm.ME_WorkDate.Text, 5, 2) + '¿ù ';
  QRL_curdate.Caption   := MainForm.L_Date.Caption;
end;

procedure TNewPrintForm.InReportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
  Fm_PreviewForm.Show;
end;

end.
