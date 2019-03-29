unit pic41904;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pib41901, QRJImage;

type
  TPrnForm1 = class(TQuickRep)
    dBand1: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    korname: TQRLabel;
    bornarea: TQRLabel;
    QRShape43: TQRShape;
    lschdeg1: TQRLabel;
    QRShape44: TQRShape;
    lschnm1: TQRLabel;
    QRShape45: TQRShape;
    lmajorcode1: TQRLabel;
    QRShape46: TQRShape;
    lschgrym1: TQRLabel;
    QRShape47: TQRShape;
    empschgr: TQRLabel;
    QRShape48: TQRShape;
    empdate: TQRLabel;
    emppaycl: TQRLabel;
    QRShape49: TQRShape;
    empcode: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    payclyy: TQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    ingoscr3: TQRLabel;
    QRShape55: TQRShape;
    ingoscr2: TQRLabel;
    ingoscr1: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    ingoavg: TQRLabel;
    lagetscr: TQRLabel;
    QRShape59: TQRShape;
    QRShape61: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    paycl: TQRLabel;
    deptna1: TQRLabel;
    deptna2: TQRLabel;
    deptna3: TQRLabel;
    cpaycldate: TQRLabel;
    payclscr: TQRLabel;
    ingoscr: TQRLabel;
    eduscr: TQRLabel;
    langscr: TQRLabel;
    rewascr: TQRLabel;
    rascore: TQRLabel;
    No: TQRLabel;
    n1: TQRLabel;
    QRLabel73: TQRLabel;
    n2: TQRLabel;
    age: TQRLabel;
    lschnm2: TQRLabel;
    lmajorcode2: TQRLabel;
    lschgrym2: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRShape16: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape17: TQRShape;
    QRLabel18: TQRLabel;
    QRShape18: TQRShape;
    QRLabel19: TQRLabel;
    QRShape19: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    rabasdate1: TQRLabel;
    QRShape23: TQRShape;
    rabasdate2: TQRLabel;
    rabasdate3: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel24: TQRLabel;
    QRShape26: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Qddf: TQRLabel;
    apprscr3: TQRLabel;
    apprscr2: TQRLabel;
    apprscr1: TQRLabel;
    appravg: TQRLabel;
    apprscr: TQRLabel;
    perimg: TQRJImage;
    QRLabel13: TQRLabel;
    Line: TQRShape;
    PageTitle: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    procedure PrnForm1Preview(Sender: TObject);
    procedure PrnForm1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure PrnForm1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     HeadTitle : string;
  public

  end;

var
  PrnForm1: TPrnForm1;

implementation
uses pib41903,pib41902;
{$R *.DFM}

procedure TPrnForm1.PrnForm1Preview(Sender: TObject);
begin
   ViewForm.QRpreview1.QRPrinter := TQRPrinter(MainForm.Rpt.QRPrinter); //TQRPrinter(Sender);
   ViewForm.Show;
end;

procedure TPrnForm1.PrnForm1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(PrnF) then begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
     n1.caption          := PrnD.n1;
     n2.caption          := PrnD.n2;
     korname.caption     := PrnD.korname;
     age.caption         := PrnD.age;
     paycl.caption       := PrnD.paycl;
     deptna1.caption     := PrnD.deptna1;
     deptna2.caption     := PrnD.deptna2;
     deptna3.caption     := PrnD.deptna3;
     bornarea.caption    := PrnD.bornarea;
     lschdeg1.caption    := PrnD.lschdeg;
     lschnm1.caption     := PrnD.lschnm1;
     lschnm2.caption     := PrnD.lschnm2;
     lmajorcode1.caption := PrnD.lmajorcode1;
     lmajorcode2.caption := PrnD.lmajorcode2;
     lschgrym1.caption   := PrnD.lschgrym1;
     lschgrym2.caption   := PrnD.lschgrym2;
     empschgr.caption    := PrnD.empschgr;
     empdate.caption     := PrnD.empdate;
     emppaycl.caption    := PrnD.emppaycl;
     empcode.caption     := PrnD.empcode;
     cpaycldate.caption  := PrnD.cpaycldate;
     payclyy.caption     := PrnD.payclyy;
     payclscr.caption    := PrnD.payclscr;
     ingoscr3.caption    := PrnD.ingoscr3;
     ingoscr2.caption    := PrnD.ingoscr2;
     ingoscr1.caption    := PrnD.ingoscr1;
     ingoavg.caption     := PrnD.ingoavg;
     ingoscr.caption     := PrnD.ingoscr;
     apprscr3.caption    := PrnD.apprscr3;
     apprscr2.caption    := PrnD.apprscr2;
     apprscr1.caption    := PrnD.apprscr1;
     appravg.caption     := PrnD.appravg;
     apprscr.caption     := PrnD.apprscr;
     lagetscr.caption    := PrnD.lagetscr;
     langscr.caption     := PrnD.langscr;
     eduscr.caption      := PrnD.eduscr;
     rewascr.caption     := PrnD.rewascr;
     rascore.caption     := PrnD.rascore;
     if MainForm.SelMake3 = 1 then begin
        CData.PersonPic(Prnd.empno,perimg);
     end else perimg.picture := nil;
     dBand1.Enabled   := True;
     MoreData := True;
     if PrnD.Gubun = 'P' then begin
        dBand1.Enabled := False;
        HeadTitle := MainForm.CheckingHead;
        MainForm.Rpt.NewPage;
        system.exit;
     end;
  end else begin
     MoreData := False;
     MainForm.Bscreen.Enabled := True;
     MainForm.BPrint.Enabled  := True;
     System.Close(PrnF);
  end;
end;

procedure TPrnForm1.PrnForm1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  System.Assign(PrnF,HomeDir+'\list\'+HFile);
  System.Reset(PrnF);
end;

procedure TPrnForm1.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if MainForm.SelBox.Items.Count > 0 then begin
      if PrnForm1.PageNumber = 1 then begin
         PageTitle.Caption := '¡Ü '+copy(MainForm.PageHeadTitle,1,Length(trim(MainForm.PageHeadTitle))-1);
      end else begin
         PageTitle.Caption := '¡Ü '+copy(HeadTitle,1,Length(trim(HeadTitle))-1);
      end;
   end else PageTitle.Caption := '';
   MainForm.PageHeadTitle := '';
   rabasdate1.caption := inttostr(strtoint(copy(MainForm.trabasdate,3,2))-3)+'³â';
   rabasdate2.caption := inttostr(strtoint(copy(MainForm.trabasdate,3,2))-2)+'³â';
   rabasdate3.caption := inttostr(strtoint(copy(MainForm.trabasdate,3,2))-1)+'³â';
end;

end.
