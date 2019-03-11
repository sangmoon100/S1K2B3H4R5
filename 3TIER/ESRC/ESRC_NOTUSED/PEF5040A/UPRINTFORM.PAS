unit UPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, OnEditMemo, OnEditNumCtl;

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
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRLabel14: TQRLabel;
    QR_E1korname: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QR_korname: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRImage1: TQRImage;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape27: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QR_E2OPINION3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel27: TQRLabel;
    QRShape10: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape14: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape16: TQRShape;
    QRLabel47: TQRLabel;
    QR_E2Bas1: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QR_E2App1: TQRLabel;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape31: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape48: TQRShape;
    QR_E2App3: TQRLabel;
    QR_E2Bas3: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape23: TQRShape;
    QR_E2Bas2: TQRLabel;
    QRLabel88: TQRLabel;
    QR_E2App2: TQRLabel;
    QR_E2Bas4: TQRLabel;
    QR_E2App4: TQRLabel;
    QR_E2App5: TQRLabel;
    QRShape37: TQRShape;
    QRShape46: TQRShape;
    QRShape43: TQRShape;
    QRShape40: TQRShape;
    QR_E2Bas10: TQRLabel;
    QR_E2Bas5: TQRLabel;
    QR_E2Bas6: TQRLabel;
    QR_E2Bas7: TQRLabel;
    QR_E2Bas8: TQRLabel;
    QR_E2App6: TQRLabel;
    QR_E2App7: TQRLabel;
    QR_E2App8: TQRLabel;
    QR_E2App9: TQRLabel;
    QR_E2App10: TQRLabel;
    QR_E2Bas9: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape55: TQRShape;
    QRLabel2: TQRLabel;
    QR_Opinion1: TQRLabel;
    QR_Opinion2: TQRLabel;
    QR_E1valview: TQRLabel;
    QR_Workdate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape18: TQRShape;
    QRShape24: TQRShape;
    QRShape30: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape29: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRShape44: TQRShape;
    QRShape47: TQRShape;
    QRShape15: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QR_E2korname: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses PEF50401;

{$R *.DFM}

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_korname.Caption   := PEF5040.L_korname.ValueCaption;
  QR_E1korname.Caption := PEF5040.L_E1korname.ValueCaption;
  QR_E2korname.Caption := PEF5040.vE2KORNAME;
  QR_Workdate.Caption  := copy(PEF5040.CURDATE,1,4) + '-'+
                          copy(PEF5040.CURDATE,5,2) + '-'+
                          copy(PEF5040.CURDATE,7,2) ;

  QR_Opinion1.Caption  := PEF5040.E_E2OPINION1.Text;
  QR_Opinion2.Caption  := PEF5040.E_E2OPINION2.Text;
  QR_E1valview.Caption := PEF5040.E_E2VALVIEW.Text;

  QR_E2OPINION3.Caption:= '';
  If      PEF5040.RG.ItemIndex = 0 Then QR_E2OPINION3.Caption := 'Highly Recommend'
  else If PEF5040.RG.ItemIndex = 1 Then QR_E2OPINION3.Caption := 'Recommend'
  else If PEF5040.RG.ItemIndex = 2 Then QR_E2OPINION3.Caption := 'Not Recommend';

  QR_E2App1.Caption  := PEF5040.ON_E2App1.Text; 
  QR_E2App2.Caption  := PEF5040.ON_E2App2.Text;
  QR_E2App3.Caption  := PEF5040.ON_E2App3.Text;
  QR_E2App4.Caption  := PEF5040.ON_E2App4.Text;
  QR_E2App5.Caption  := PEF5040.ON_E2App5.Text;
  QR_E2App6.Caption  := PEF5040.ON_E2App6.Text;
  QR_E2App7.Caption  := PEF5040.ON_E2App7.Text;
  QR_E2App8.Caption  := PEF5040.ON_E2App8.Text;
  QR_E2App9.Caption  := PEF5040.ON_E2App9.Text;
  QR_E2App10.Caption := PEF5040.ON_E2App10.Text;

  QR_E2Bas1.Caption  := PEF5040.ON_E2Bas1.Text;
  QR_E2Bas2.Caption  := PEF5040.ON_E2Bas2.Text;
  QR_E2Bas3.Caption  := PEF5040.ON_E2Bas3.Text;
  QR_E2Bas4.Caption  := PEF5040.ON_E2Bas4.Text;
  QR_E2Bas5.Caption  := PEF5040.ON_E2Bas5.Text;
  QR_E2Bas6.Caption  := PEF5040.ON_E2Bas6.Text;
  QR_E2Bas7.Caption  := PEF5040.ON_E2Bas7.Text;
  QR_E2Bas8.Caption  := PEF5040.ON_E2Bas8.Text;
  QR_E2Bas9.Caption  := PEF5040.ON_E2Bas9.Text;
  QR_E2Bas10.Caption := PEF5040.ON_E2Bas10.Text;
end;


end.
