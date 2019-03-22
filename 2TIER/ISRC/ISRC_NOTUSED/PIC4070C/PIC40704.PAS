unit pic40704;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pic40701;

type
  TPrnForm1 = class(TQuickRep)
    dBand1: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
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
    empschgr: TQRLabel;
    QRShape48: TQRShape;
    orgempdate: TQRLabel;
    emppaycl: TQRLabel;
    QRShape49: TQRShape;
    empcode: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    payclyy: TQRLabel;
    QRShape53: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    ingoavg: TQRLabel;
    lagetscr: TQRLabel;
    QRShape63: TQRShape;
    deptna1: TQRLabel;
    deptna2: TQRLabel;
    deptna3: TQRLabel;
    cpaycldate: TQRLabel;
    ingoscr: TQRLabel;
    eduscr: TQRLabel;
    langscr: TQRLabel;
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
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
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
    QRShape25: TQRShape;
    QRLabel24: TQRLabel;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape29: TQRShape;
    QRLabel35: TQRLabel;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Qddf: TQRLabel;
    QRLabel13: TQRLabel;
    Line: TQRShape;
    PageTitle: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    perimg: TQRImage;
    QRShape8: TQRShape;
    QRShape20: TQRShape;
    payclscr: TQRLabel;
    rewscore: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    empdate: TQRLabel;
    QRL_payrayear: TQRLabel;
    QRL_payratitle: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape22: TQRShape;
    QRLabel39: TQRLabel;
    repclass: TQRLabel;
    repScr: TQRLabel;
    QRShape23: TQRShape;
    lschnm3: TQRLabel;
    lmajorcode3: TQRLabel;
    lschgrym3: TQRLabel;
    QRShape59: TQRShape;
    procedure PrnForm1Preview(Sender: TObject);
    procedure PrnForm1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PrnForm1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     HeadTitle : string;
  public

  end;

var
  PrnForm1: TPrnForm1;

implementation

uses pic40702,Pic40705, peprnView ;
  {$R *.DFM}

procedure TPrnForm1.PrnForm1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  {System.Assign(PrnF,HomeDir+'\list\'+HFile);
  System.Reset(PrnF);
  //  정규용 추가
  if (MainForm.payclfr.Text ='21') or
     (MainForm.payclfr.Text ='23')then
  begin
    QRLabel34.Caption := 'ⓐ+ⓑ+ⓔ';
    QRLabel36.Enabled := False;
    QRLabel35.Left := 1182;
    QRLabel13.Left := 1182;
    QRLabel29.Left := 1189;
    eduscr.Left    := 1179;

    QRLabel44.Left := 1236;
    QRLabel27.Left := 1236;
    QRLabel28.Left := 1236;
    lagetscr.Left  := 1249;
    langscr.Left   := 1238;

    QRLabel6.Left  := 1065;
    QRLabel25.Left := 1065;
    QRLabel32.Left := 1065;
    rewscore.Left  := 1070;

    QRLabel33.Left := 1114;
    QRLabel34.Left := 1114;
    QRLabel36.Left := 1125;
    rascore.Left   := 1115;

  end
  else begin
    QRLabel34.Caption := 'ⓐ+ⓑ+ⓒ';
    QRLabel36.Enabled := True;
    QRLabel35.Left := 1069;
    QRLabel13.Left := 1069;
    QRLabel29.Left := 1076;
    eduscr.Left    := 1067;
    QRLabel44.Left := 1121;
    QRLabel27.Left := 1121;
    QRLabel28.Left := 1121;
    lagetscr.Left  := 1131;
    langscr.Left   := 1120;
    QRLabel6.Left  := 1181;
    QRLabel25.Left := 1181;
    QRLabel32.Left := 1181;
    rewscore.Left  := 1185;
    QRLabel33.Left := 1230;
    QRLabel34.Left := 1230;
    QRLabel36.Left := 1241;
    rascore.Left   := 1230;
  end;      }
end;

procedure TPrnForm1.PrnForm1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,MainForm.Rpt);
   Fm_PreviewForm.Show;
end;

procedure TPrnForm1.PrnForm1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if (not Eof(PrnF)) then
  begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
     n1.caption          := PrnD.n1;
     n2.caption          := PrnD.n2;
     korname.caption     := PrnD.korname;
     age.caption         := PrnD.age;
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
     deptna2.caption := '';
     deptna3.caption := '';
     if PrnD.deptna2 <> '' then
       deptna2.caption := PrnD.deptna2
     else
       deptna2.caption := '(' + PrnD.deptna3 + ')';
     if (PrnD.deptna2 = '') and
        (PrnD.deptna3 = '') then
       deptna2.caption   := PrnD.payraname
     else
       deptna3.caption   := PrnD.payraname;

//==============================================================================//

     bornarea.caption    := PrnD.bornarea;
     lschdeg1.caption    := PrnD.lschdeg;
//     lschnm1.caption     := PrnD.lschnm1;
//     lschnm2.caption     := PrnD.lschnm2;
//     lmajorcode1.caption := PrnD.lmajorcode1;
//     lmajorcode2.caption := PrnD.lmajorcode2;
//     lschgrym1.caption   := PrnD.lschgrym1;
//     lschgrym2.caption   := PrnD.lschgrym2;

     lschnm1.caption     := PrnD.lschnm1;
     lmajorcode1.caption := PrnD.lmajorcode1;
     lschgrym1.caption   := PrnD.lschgrym1;

     if PrnD.lschnm3 <> '' then
     begin
       lschnm2.caption     := PrnD.lschnm3;
       lmajorcode2.caption := PrnD.lmajorcode3;
       lschgrym2.caption   := PrnD.lschgrym3;

       lschnm3.caption     := PrnD.lschnm2;
       lmajorcode3.caption := PrnD.lmajorcode2;
       lschgrym3.caption   := PrnD.lschgrym2;
     end
     else
     begin
       lschnm2.caption     := PrnD.lschnm2;
       lmajorcode2.caption := PrnD.lmajorcode2;
       lschgrym2.caption   := PrnD.lschgrym2;

       lschnm3.caption     := PrnD.lschnm3;
       lmajorcode3.caption := PrnD.lmajorcode3;
       lschgrym3.caption   := PrnD.lschgrym3;
     end;

     empschgr.caption    := PrnD.empschgr;
     orgempdate.caption  := PrnD.orgempdate;
     empdate.caption     := PrnD.empdate;
     emppaycl.caption    := PrnD.emppaycl;
     empcode.caption     := PrnD.empcode;
     cpaycldate.caption  := PrnD.cpaycldate;
     QRL_payrayear.caption  := PrnD.payrayear;
     QRL_payratitle.caption := PrnD.payratitle ;

     payclyy.caption     := PrnD.payclyy;
     payclscr.caption    := PrnD.payclscr;

     ingoavg.caption     := PrnD.ingoavg;
     ingoscr.caption     := PrnD.ingoscr;

     lagetscr.caption    := PrnD.lagetscr;
     langscr.caption     := PrnD.langscr;

     repclass.caption    := PrnD.Repclass;
     repscr.caption      := PrnD.Repscr;

     eduscr.caption      := PrnD.eduscr;
     rewscore.caption     := PrnD.rewascr;
     rascore.caption     := PrnD.rascore;
     if MainForm.SelMake3 = 1 then //사진출력.
     begin
        CData.PersonPic(Prnd.empno,perimg);
     end
     else
        perimg.picture := nil;

     dBand1.Enabled   := True;
     MoreData := True;
     if PrnD.Gubun = 'P' then begin
        dBand1.Enabled := False;
        HeadTitle := MainForm.CheckingHead;
        MainForm.Rpt.NewPage;
        system.exit;
     end;
  end
  else
  begin
     MoreData := False;
     MainForm.LPPrint.Enabled := True;
     MainForm.Bt_prn.Enabled  := True;
     System.Close(PrnF);
  end;
end;

procedure TPrnForm1.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if MainForm.SelBox.Items.Count > 0 then begin
      if PrnForm1.PageNumber = 1 then
      begin
         PageTitle.Caption := '● '+copy(MainForm.PageHeadTitle,1,Length(MainForm.PageHeadTitle)-1);
      end
      else
      begin
         PageTitle.Caption := '● '+copy(HeadTitle,1,Length(HeadTitle)-1);
      end;
   end else PageTitle.Caption := '';

end;

end.
