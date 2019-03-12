unit UPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Tmax_DataSetText;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QR_empno: TQRLabel;
    QR_korname: TQRLabel;
    QR_payraname: TQRLabel;
    QR_deptname: TQRLabel;
    QRBand2: TQRBand;
    QRShape8: TQRShape;
    QR_RATEITEM: TQRDBText;
    QR_WELLPOINT: TQRDBText;
    QR_BIGOTEXT: TQRDBText;
    QRSysData1: TQRSysData;
    QR_memodate: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape10: TQRShape;
    QR_NEEDSITEM: TQRDBText;
    QRShape3: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses PEH2040A1;

{$R *.DFM}

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QR_memodate.Caption := copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,1,4) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,5,2) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,7,2) ;
end;

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QR_memodate.Caption := copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,1,4) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,5,2) + '-'+
                          copy(FM_Main.Q_Diary.fieldbyname('MEMODATE').AsString,7,2) ;

   QR_empno.Caption    := FM_Main.Ed_empno.Text;
   QR_korname.Caption  := FM_Main.L_korname.ValueCaption;
   QR_payraname.Caption:= FM_Main.L_Payraname.ValueCaption;
   QR_deptname.Caption := FM_Main.L_deptname.ValueCaption;
end;

end.
