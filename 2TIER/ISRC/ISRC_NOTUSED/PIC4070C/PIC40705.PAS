unit pic40705;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pic40701;

type
  TPrnForm2 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    dBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape19: TQRShape;
    QRLabel20: TQRLabel;
    QRShape20: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRLabel24: TQRLabel;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape70: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    n1: TQRLabel;
    QRShape27: TQRShape;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    korname: TQRLabel;
    deptna1: TQRLabel;
    QRShape36: TQRShape;
    lschdeg: TQRLabel;
    QRShape37: TQRShape;
    lschnm1: TQRLabel;
    lmajorcode1: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    empterm: TQRLabel;
    empcode: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    payclscr: TQRLabel;
    QRShape43: TQRShape;
    QRShape47: TQRShape;
    ingoscr: TQRLabel;
    QRShape48: TQRShape;
    ingoavg: TQRLabel;
    lagetscr: TQRLabel;
    langscr: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    educscr: TQRLabel;
    QRShape52: TQRShape;
    rascore: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    age: TQRLabel;
    sex: TQRLabel;
    emppaycl: TQRLabel;
    QRShape57: TQRShape;
    deptna2: TQRLabel;
    deptna3: TQRLabel;
    Line: TQRShape;
    QRShape54: TQRShape;
    QRLabel52: TQRLabel;
    PageTitle: TQRLabel;
    n2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    cpaycldate: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    lschnm2: TQRLabel;
    lmajorcode2: TQRLabel;
    payclyy: TQRLabel;
    QRShape7: TQRShape;
    QRShape18: TQRShape;
    QRLabel6: TQRLabel;
    rewscore: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel25: TQRLabel;
    orgempdate : TQRLabel;
    empdate   : TQRLabel;
    QRLabel29: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel31: TQRLabel;
    No: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel32: TQRLabel;
    procedure PrnForm2Preview(Sender: TObject);
    procedure PrnForm2NeedData(Sender: TObject; var MoreData: Boolean);
    procedure PrnForm2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    HeadTitle : string;
  public

  end;

var
  PrnForm2: TPrnForm2;

implementation
uses pic40702,pic40704, peprnView;
{$R *.DFM}

procedure TPrnForm2.PrnForm2Preview(Sender: TObject);
begin
//   Fm_PreviewForm.Qr_Preview.QRPrinter := TQRprinter(MainForm.Rpt.QRPrinter);
//   Fm_PreviewForm.Show;
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,MainForm.Rpt);
   Fm_PreviewForm.Show;
end;

procedure TPrnForm2.PrnForm2NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if not Eof(PrnF) then begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
     n1.caption          := PrnD.n1;
     n2.caption          := PrnD.n2;
     korname.caption     := PrnD.korname;
     age.caption         := PrnD.age;
     sex.caption         := PrnD.sex;
//     paycl.caption       := PrnD.paycl;
     deptna1.caption     := PrnD.deptna1;
//==============================================================================//
//    30.26    2003.03.16   손종운    담당부서표시
//==============================================================================//
//     if PrnD.deptna2 <> '' then
//     begin
//         deptna2.caption     := PrnD.deptna2;
//         deptna3.caption     := PrnD.payraname;
//     end
//     else
//     begin
//         deptna2.caption     := PrnD.payraname;
//         deptna3.caption     := '';
//     end;

     if PrnD.deptna2 <> '' then
       deptna2.caption := PrnD.deptna2
     else if PrnD.deptna3 <> '' then
       deptna2.caption := '(' + PrnD.deptna3 + ')'
     else deptna2.caption := '';
     deptna3.caption   := PrnD.payraname;

//==============================================================================//

     lschdeg.caption     := PrnD.lschdeg;
     lschnm1.caption     := PrnD.lschnm1;
     lschnm2.caption     := PrnD.lschnm2;
     lmajorcode1.caption := PrnD.lmajorcode1;
     lmajorcode2.caption := PrnD.lmajorcode2;
     orgempdate.caption  := PrnD.orgempdate;
     empdate.caption     := PrnD.empdate;
     emppaycl.caption    := PrnD.emppaycl;
     empcode.caption     := PrnD.empcode;
     empterm.caption     := PrnD.empterm;
     cpaycldate.caption  := PrnD.cpaycldate;
     payclyy.caption     := PrnD.payclyy;
     payclscr.caption    := PrnD.payclscr;
//     ingoscr3.caption    := PrnD.ingoscr3;
//     ingoscr2.caption    := PrnD.ingoscr2;
//     ingoscr1.caption    := PrnD.ingoscr1;
     ingoavg.caption     := PrnD.ingoavg;
     ingoscr.caption     := PrnD.ingoscr;
     lagetscr.caption    := PrnD.lagetscr;
     langscr.caption     := PrnD.langscr;
     educscr.caption     := PrnD.eduscr;
     rewscore.caption     := PrnD.rewascr;
//     rewascr.caption     := PrnD.rewascr;
     rascore.caption     := PrnD.rascore;
     dBand1.Enabled := True;
     MoreData := True;
     if PrnD.Gubun = 'P' then begin
        dBand1.Enabled := False;
        HeadTitle := MainForm.CheckingHead;
        MainForm.Rpt.NewPage;
        system.exit;
     end;
  end else begin
     MoreData := False;
     MainForm.LPPrint.Enabled := True;
     MainForm.Bt_Prn.Enabled  := True;
     System.Close(PrnF);
  end;
end;

procedure TPrnForm2.PrnForm2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  System.Assign(PrnF,HomeDir+'\list\'+HFile);
  System.Reset(PrnF);
end;

procedure TPrnForm2.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if MainForm.SelBox.Items.Count > 0 then begin
      if PrnForm2.PageNumber = 1 then begin
         PageTitle.Caption := '● '+copy(MainForm.PageHeadTitle,1,Length(trim(MainForm.PageHeadTitle))-1);
      end else begin
         PageTitle.Caption := '● '+copy(HeadTitle,1,Length(trim(HeadTitle))-1);
      end;
   end else PageTitle.Caption := '';

end;

end.
