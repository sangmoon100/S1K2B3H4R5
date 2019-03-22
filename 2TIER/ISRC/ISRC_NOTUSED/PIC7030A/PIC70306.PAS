unit pic70306;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pic70301;

type
  TPrnForm1 = class(TQuickRep)
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    prndate: TQRLabel;
    QRSysData1: TQRSysData;
    dBand1: TQRBand;
    QRShape24: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    no: TQRLabel;
    empno: TQRLabel;
    korname: TQRLabel;
    paycl: TQRLabel;
    deptname: TQRLabel;
    payra: TQRLabel;
    empdate: TQRLabel;
    cpaycldate: TQRLabel;
    realtrdate: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PrnForm1Preview(Sender: TObject);
    procedure PrnForm1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    PrnF : file of PrnData;
  public

  end;

var
  PrnForm1: TPrnForm1;

implementation

uses pic70305;

{$R *.DFM}

procedure TPrnForm1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  System.Assign(PrnF,TxtFile);
  System.Reset(PrnF);
end;

procedure TPrnForm1.PrnForm1Preview(Sender: TObject);
begin
   ViewForm.QRpreview1.QRPrinter := TQRPrinter(MainForm.Rpt.QRPrinter);
   ViewForm.Show;
end;

procedure TPrnForm1.PrnForm1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(PrnF) then begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
     empno.caption       := PrnD.empno;
     korname.caption     := PrnD.korname;
     paycl.caption       := PrnD.paycl;
     payra.caption       := PrnD.payra;
     deptname.caption    := PrnD.deptname;
     empdate.caption     := PrnD.empdate;
     cpaycldate.caption  := PrnD.cpaycldate;
     realtrdate.caption  := PrnD.realtrdate;

     dBand1.Enabled := True;
     MoreData := True;
     if PrnD.Gubun = 'P' then begin
        dBand1.Enabled := False;
        MainForm.Rpt.NewPage;
        system.exit;
     end;
  end else begin
     MoreData := False;
     MainForm.BPrn1.Enabled := True;
     MainForm.BPrn2.Enabled := True;
     System.Close(PrnF);
  end;
end;

procedure TPrnForm1.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrnDate.Caption := MainForm.L_CurDate.Caption;
end;

end.
