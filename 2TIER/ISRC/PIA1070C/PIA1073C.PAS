unit PIA1073C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DB, DBTables, quickrpt, Qrctrls, Qrprntr, peprnview,
  Ora, Func, MemDS, DBAccess;

type
  TForm2 = class(TForm)
    QReport: TQuickRep;
    QRBand3: TQRBand;
    QRChildBand1: TQRChildBand;
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape13: TQRShape;
    QRShape30: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    korname: TQRLabel;
    QRLabel4: TQRLabel;
    empno: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    deptname: TQRLabel;
    QRLabel7: TQRLabel;
    payranm: TQRLabel;
    paycldate: TQRLabel;
    paygr1: TQRLabel;
    jobplace: TQRLabel;
    QRLabel76: TQRLabel;
    pstate: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    jobline: TQRLabel;
    empcode: TQRLabel;
    empdate: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    cardate: TQRLabel;
    Qremark: TQRLabel;
    orgempdate: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel97: TQRLabel;
    Qrealtrdate: TQRLabel;
    Qofftrdate: TQRLabel;
    QRLabel98: TQRLabel;
    Qempterm: TQRLabel;
    QRLabel112: TQRLabel;
    Qlschgr: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    PersonPic: TQRImage;
    QRLabel77: TQRLabel;
    QRShape9: TQRShape;
    jikdeptname: TQRLabel;
    chnname: TQRLabel;
    paygr2: TQRLabel;
    QRShape72: TQRShape;
    QRShape12: TQRShape;
    korage: TQRLabel;
    QRLabel23: TQRLabel;
    birthday: TQRLabel;
    birthgubun: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel8: TQRLabel;
    QRShape58: TQRShape;
    QRShape67: TQRShape;
    QRShape64: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape68: TQRShape;
    carplace1: TQRLabel;
    carplace2: TQRLabel;
    carplace4: TQRLabel;
    carplace3: TQRLabel;
    carymd1: TQRLabel;
    carymd2: TQRLabel;
    carymd4: TQRLabel;
    carymd3: TQRLabel;
    cardept1: TQRLabel;
    cardept2: TQRLabel;
    cardept4: TQRLabel;
    cardept3: TQRLabel;
    carjobnm1: TQRLabel;
    carjobnm2: TQRLabel;
    carjobnm4: TQRLabel;
    carjobnm3: TQRLabel;
    licgetdate1: TQRLabel;
    licgetdate2: TQRLabel;
    bcarym: TQRLabel;
    QRShape23: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    licgr1: TQRLabel;
    licgr2: TQRLabel;
    licekind1: TQRLabel;
    licekind2: TQRLabel;
    QRShape57: TQRShape;
    QRLabel22: TQRLabel;
    Qcarym1: TQRLabel;
    Qcarym2: TQRLabel;
    Qcarym3: TQRLabel;
    Qcarym4: TQRLabel;
    QRLabel84: TQRLabel;
    Qlicalfield1: TQRLabel;
    Qlicalfield2: TQRLabel;
    QRShape59: TQRShape;
    QRShape47: TQRShape;
    QRShape56: TQRShape;
    QRShape63: TQRShape;
    QRShape55: TQRShape;
    QRShape60: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    rekindnm1: TQRLabel;
    rekindnm2: TQRLabel;
    reorgnm1: TQRLabel;
    reorgnm2: TQRLabel;
    redate1: TQRLabel;
    redate2: TQRLabel;
    pukindnm1: TQRLabel;
    pukindnm2: TQRLabel;
    pucause1: TQRLabel;
    pucause2: TQRLabel;
    pudate1: TQRLabel;
    pudate2: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape26: TQRShape;
    AnLine1: TQRShape;
    trlimfrto: TQRLabel;
    licalkind: TQRLabel;
    empjobplace: TQRLabel;
    jungita_amt: TQRLabel;
    danpay_amt: TQRLabel;
    psdate: TQRLabel;
    caramt: TQRLabel;
    exduym: TQRLabel;
    Qtjobduty: TQRLabel;
    Qnogubun: TQRLabel;
    SabuGubun: TQRLabel;
    QRBand4: TQRBand;
    prnDate: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    ancode1: TQRLabel;
    andate1: TQRLabel;
    anpaycl1: TQRLabel;
    anpayra1: TQRLabel;
    andept1: TQRLabel;
    anpayra21: TQRLabel;
    QRShape50: TQRShape;
    insa_anno: TOraQuery;
    Qry_Sabu: TOraQuery;
    Qphoto: TOraQuery;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    Count    : Integer;
    SubCount : Integer;
    MaxValue : Integer;
    temp_empno : string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses report_test1;

{$R *.DFM}

procedure TForm2.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     SubCount         := 0;
       QRL_empno.Caption := form1.Qry1.FieldByName('EMPNO').AsString;
       QRL_KORNAME.Caption := form1.Qry1.FieldByName('KORNAME').AsString;
     temp_empno := form1.Qry1.FieldByName('EMPNO').AsString;
end;

procedure TForm2.QReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     Count := 0;
     MaxValue            := FORM1.Qry1.RecordCount;     
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport);
   Fm_PreviewForm.Show;
end;

procedure TForm2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     Count    := Count + 1;
     SubCount := SubCount + 1;
     
     Qpaydate.Caption      := FORM1.Qry1.FieldByName('PAYDATE').AsString;
     QFixPay.Caption      := FormatFloat('#,##0', FORM1.Qry1.FieldByName('FixPay').AsFloat);
end;

procedure TForm2.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if Count < MaxValue then
        QReport.NewPage;
end;

end.
