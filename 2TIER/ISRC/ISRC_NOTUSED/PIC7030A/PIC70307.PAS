unit pic70307;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pic70301;

type
  TPrnForm2 = class(TQuickRep)
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
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    dpdeptname: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    dppayra: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    LineBand: TQRChildBand;
    Line: TQRShape;
    procedure PrnForm2BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure PrnForm2Preview(Sender: TObject);
    procedure PrnForm2NeedData(Sender: TObject; var MoreData: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    PrnF : file of PrnData;
  public

  end;

var
  PrnForm2: TPrnForm2;

implementation

uses pic70305;

{$R *.DFM}

procedure TPrnForm2.PrnForm2BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  System.Assign(PrnF,TxtFile);
  System.Reset(PrnF);
end;

procedure TPrnForm2.PrnForm2Preview(Sender: TObject);
begin
   ViewForm.QRpreview1.QRPrinter := TQRPrinter(MainForm.Rpt.QRPrinter);
   ViewForm.Show;
end;

procedure TPrnForm2.PrnForm2NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(PrnF) then begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
     empno.caption       := PrnD.empno;
     korname.caption     := PrnD.korname;
     paycl.caption       := PrnD.paycl;
     payra.caption       := PrnD.payra;
     deptname.caption    := copy(PrnD.deptname,1,30);
     empdate.caption     := PrnD.empdate;
     cpaycldate.caption  := PrnD.cpaycldate;
     realtrdate.caption  := PrnD.realtrdate;
     dppayra.caption     := PrnD.dppayra;
     dpdeptname.caption  := copy(PrnD.dpdeptname,1,30);

     dBand1.Enabled   := True;
     LineBand.Enabled := False;
     MoreData := True;

     if PrnD.Gubun = 'L' then begin
        dBand1.Enabled   := False;
        LineBand.Enabled := True;
        system.exit;
     end;

     if PrnD.Gubun = 'P' then begin
        dBand1.Enabled := False;
        MainForm.Rpt.NewPage;
        system.exit;
     end;
  end else begin
     MoreData := False;
     titleband1.enabled := false;
     MainForm.BPrn1.Enabled := True;
     MainForm.BPrn2.Enabled := True;
     System.Close(PrnF);
  end;
end;

procedure TPrnForm2.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrnDate.Caption := MainForm.L_CurDate.Caption;
end;

end.
