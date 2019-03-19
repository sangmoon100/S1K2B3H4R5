unit PKY1050A5;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape24: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRdate: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape8: TQRShape;
    QRShape15: TQRShape;
    QRShape20: TQRShape;
    QRShape23: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape40: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape14: TQRShape;
    QRShape53: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRfrtime: TQRLabel;
    QRtotime: TQRLabel;
    QRShape35: TQRShape;
    QRovtmdesc: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRrestmm: TQRLabel;
    QRShape5: TQRShape;
    QRsprestmm: TQRLabel;
    QRShape6: TQRShape;
    QRmealhh: TQRLabel;
    QRShape7: TQRShape;
    QRExcephh: TQRLabel;
    QRShape10: TQRShape;
    QRexthh: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape19: TQRShape;
    QRnighthh: TQRLabel;
    QRShape21: TQRShape;
    QRholihh: TQRLabel;
    QRShape22: TQRShape;
    QRovtmamt: TQRLabel;
    QRShape9: TQRShape;
    QRkorname: TQRLabel;
    QRempno: TQRLabel;
    QRNo: TQRLabel;
    QRShape25: TQRShape;
    QRrestamt: TQRLabel;
    QRsprestamt: TQRLabel;
    QRmealamt: TQRLabel;
    QRexcepamt: TQRLabel;
    QRextamt: TQRLabel;
    QRnightamt: TQRLabel;
    QRholiamt: TQRLabel;
    QRShape26: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRBand3: TQRBand;
    s_restmm: TQRLabel;
    s_restamt: TQRLabel;
    s_sprestmm: TQRLabel;
    s_sprestamt: TQRLabel;
    s_mealhh: TQRLabel;
    s_mealamt: TQRLabel;
    s_excephh: TQRLabel;
    s_excepamt: TQRLabel;
    s_exthh: TQRLabel;
    s_extamt: TQRLabel;
    s_nighthh: TQRLabel;
    s_nightamt: TQRLabel;
    s_holihh: TQRLabel;
    s_holiamt: TQRLabel;
    s_ovtmamt: TQRLabel;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel40: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
   i : Integer ;
   restmm    : Double ;
   restamt   : Double ;
   sprestmm  : Double ;
   sprestamt : Double ;
   mealhh    : Double ;
   mealamt   : Double ;
   excephh   : Double ;
   excepamt  : Double ;
   exthh     : Double ;
   extamt    : Double ;
   nighthh   : Double ;
   nightamt  : Double ;
   holihh    : Double ;
   holiamt   : Double ;
   ovtmamt   : Double ;
  public

  end;

var
  QuickReport1: TQuickReport1;

implementation

uses peprnView, PKY1050A0, PKY1050A3;

{$R *.DFM}

procedure TQuickReport1.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inc(i) ;

 with DM.Qry_rpt do
 begin
   restmm    := restmm    + FieldByName('restmm').AsFloat ;
   restamt   := restamt   + FieldByName('restamt').AsFloat ;
   sprestmm  := sprestmm  + FieldByName('sprestmm').AsFloat;
   sprestamt := sprestamt + FieldByName('sprestamt').AsFloat;
   mealhh    := mealhh    + FieldByName('mealhh').AsFloat;
   mealamt   := mealamt   + FieldByName('mealamt').AsFloat;
   excephh   := excephh   + FieldByName('excephh').AsFloat;
   excepamt  := excepamt  + FieldByName('excepamt').AsFloat;
   exthh     := exthh     + FieldByName('exthh').AsFloat;
   extamt    := extamt    + FieldByName('extamt').AsFloat;
   nighthh   := nighthh   + FieldByName('nighthh').AsFloat;
   nightamt  := nightamt  + FieldByName('nightamt').AsFloat;
   holihh    := holihh    + FieldByName('holihh').AsFloat;
   holiamt   := holiamt   + FieldByName('holiamt').AsFloat;
   ovtmamt   := ovtmamt   + FieldByName('ovtmamt').AsFloat;

   QRno.Caption           := IntToStr(i) ;
   QRempno.Caption        := FieldbyName('empno').AsString ;
   QRkorname.Caption      := FieldByName('korname').AsString ;
   QRfrtime.Caption       := FormatFloat('####/##/## ##:##', FieldByName('frrealtime').AsFloat) ;
   QRtotime.Caption       := FormatFloat('####/##/## ##:##', FieldByName('torealtime').AsFloat) ;
   QRovtmdesc.Caption     := FieldbyName('ovtmdesc').AsString ;
   QRrestmm.Caption       := FormatFloat('#,###', FieldByName('restmm').AsFloat);
   QRsprestmm.Caption     := FormatFloat('#,###', FieldByName('sprestmm').AsFloat);
   QRmealhh.Caption       := FormatFloat('#,###', FieldByName('mealhh').AsFloat);
   QRexcephh.Caption      := FormatFloat('#,###', FieldByName('excephh').AsFloat);
   QRexthh.Caption        := FormatFloat('#,###', FieldByName('exthh').AsFloat);
   QRnighthh.Caption      := FormatFloat('#,###', FieldByName('nighthh').AsFloat);
   QRholihh.Caption       := FormatFloat('#,###', FieldByName('holihh').AsFloat);

   QRrestamt.Caption      := FormatFloat('#,###', FieldByName('restamt').AsFloat);
   QRsprestamt.Caption    := FormatFloat('#,###', FieldByName('sprestamt').AsFloat);
   QRmealamt.Caption      := FormatFloat('#,###', FieldByName('mealamt').AsFloat);
   QRexcepamt.Caption     := FormatFloat('#,###', FieldByName('excepamt').AsFloat);
   QRextamt.Caption       := FormatFloat('#,###', FieldByName('extamt').AsFloat);
   QRnightamt.Caption     := FormatFloat('#,###', FieldByName('nightamt').AsFloat);
   QRholiamt.Caption      := FormatFloat('#,###', FieldByName('holiamt').AsFloat);

   QRovtmamt.Caption      := FormatFloat('#,###', FieldByName('ovtmamt').AsFloat);
 end;


end;

procedure TQuickReport1.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   i := 0 ;
   restmm    := 0 ;
   restamt   := 0 ;
   sprestmm  := 0 ;
   sprestamt := 0 ;
   mealhh    := 0 ;
   mealamt   := 0 ;
   excephh   := 0 ;
   excepamt  := 0 ;
   exthh     := 0 ;
   extamt    := 0 ;
   nighthh   := 0 ;
   nightamt  := 0 ;
   holihh    := 0 ;
   holiamt   := 0 ;
   ovtmamt   := 0 ;
end;

procedure TQuickReport1.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

procedure TQuickReport1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 s_restmm.Caption    := FormatFloat('#,##0', restmm) ;
 s_restamt.Caption   := FormatFloat('#,##0', restamt) ;
 s_sprestmm.Caption  := FormatFloat('#,##0', sprestmm) ;
 s_sprestamt.Caption := FormatFloat('#,##0', sprestamt) ;
 s_mealhh.Caption    := FormatFloat('#,##0', mealhh) ;
 s_mealamt.Caption   := FormatFloat('#,##0', mealamt) ;
 s_excephh.Caption   := FormatFloat('#,##0', excephh) ;
 s_excepamt.Caption  := FormatFloat('#,##0', excepamt) ;
 s_exthh.Caption     := FormatFloat('#,##0', exthh) ;
 s_extamt.Caption    := FormatFloat('#,##0', extamt) ;
 s_nighthh.Caption   := FormatFloat('#,##0', nighthh) ;
 s_nightamt.Caption  := FormatFloat('#,##0', nightamt) ;
 s_holihh.Caption    := FormatFloat('#,##0', holihh) ;
 s_holiamt.Caption   := FormatFloat('#,##0', holiamt) ;
 s_ovtmamt.Caption   := FormatFloat('#,##0', ovtmamt) ;

end;

end.
