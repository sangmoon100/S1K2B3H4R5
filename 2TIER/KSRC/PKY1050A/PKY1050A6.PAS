unit PKY1050A6;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRNo: TQRLabel;
    QRdept: TQRLabel;
    QRempno: TQRLabel;
    QRkorname: TQRLabel;
    QRpaycl: TQRLabel;
    QRtongpay: TQRLabel;
    QRoveramt: TQRLabel;
    QRrepoffdd: TQRLabel;
    QRrepoffamt: TQRLabel;
    QRovtmamt: TQRLabel;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    QRdate: TQRLabel;
    QRBand3: TQRBand;
    S_overamt: TQRLabel;
    S_repoffdd: TQRLabel;
    S_repoffamt: TQRLabel;
    S_ovtmamt: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape4: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    procedure QuickReport2Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
   i : integer;
   overamt  : Double ;
   repoffdd : Double ;
   repoffamt : Double ;
   ovtmamt   : Double ;

  public

  end;

var
  QuickReport2: TQuickReport2;

implementation

uses peprnView, PKY1050A0, PKY1050A3;

{$R *.DFM}

procedure TQuickReport2.QuickReport2Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport2);
   Fm_PreviewForm.Show;
end;

procedure TQuickReport2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  inc(i) ;

 with DM.Qry_rpt do
 begin
   overamt   := overamt    +  DM.Qry_rpt.FieldByName('overamt').AsFloat ;
   repoffdd  := repoffdd   +  FieldByName('repoffdd').AsFloat ;
   repoffamt := repoffamt  +  FieldByName('repoffamt').AsFloat ;
   ovtmamt   := ovtmamt    +  FieldByName('ovtmamt').AsFloat ;

   QRno.Caption           := IntToStr(i) ;
   QRdept.Caption         := FieldbyName('deptname').AsString ;
   QRempno.Caption        := FieldbyName('empno').AsString ;
   QRkorname.Caption      := FieldByName('korname').AsString ;
   QRpaycl.Caption        := FieldbyName('codename').AsString ;

   QRtongpay.Caption      := FormatFloat('#,###', FieldByName('tongpay').AsFloat);
   QRoveramt.Caption      := FormatFloat('#,###', FieldByName('overamt').AsFloat);
   QRrepoffdd.Caption     := FormatFloat('#,###', FieldByName('repoffdd').AsFloat);
   QRrepoffamt.Caption    := FormatFloat('#,###', FieldByName('repoffamt').AsFloat);
   QRovtmamt.Caption      := FormatFloat('#,###', FieldByName('ovtmamt').AsFloat);
 end;

end;

procedure TQuickReport2.QuickReport2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   i := 0 ;
   overamt   := 0 ;
   repoffdd  := 0 ;
   repoffamt := 0 ;
   ovtmamt   := 0 ;
end;

procedure TQuickReport2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 s_overamt.Caption   := FormatFloat('#,##0', overamt) ;
 s_repoffdd.Caption  := FormatFloat('#,##0', repoffdd) ;
 s_repoffamt.Caption := FormatFloat('#,##0', repoffamt) ;
 s_ovtmamt.Caption   := FormatFloat('#,##0', ovtmamt) ;
end;

end.
