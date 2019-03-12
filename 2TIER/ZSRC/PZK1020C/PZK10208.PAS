unit PZK10208;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickR = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    QRShape8: TQRShape;
    QRLabel38: TQRLabel;
    QRL_manager_cnt: TQRLabel;
    QRL_senior_cnt: TQRLabel;
    QRL_jonior_cnt: TQRLabel;
    QRL_nregular_cnt: TQRLabel;
    QRL_tot_cnt: TQRLabel;
    QRL_manager_rate: TQRLabel;
    QRL_senior_rate: TQRLabel;
    QRL_jonior_rate: TQRLabel;
    QRL_nregular_rate: TQRLabel;
    QRL_tot_rate: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QuickR: TQuickR;

implementation

uses PZK10201;

{$R *.DFM}

procedure TQuickR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QuickR.NewPage;

  with MainForm.Ora_duty do
    begin
      if FieldByName('tot_cnt').AsFloat <> 0 then
        begin
          QRL_manager_cnt.Caption   := FloatToStr(round(FieldByName('manager_cnt').AsFloat/FieldByName('tot_cnt').AsFloat * 100));
          QRL_senior_cnt.Caption    := FloatToStr(round(FieldByName('senior_cnt').AsFloat/FieldByName('tot_cnt').AsFloat * 100));
          QRL_jonior_cnt.Caption    := FloatToStr(round(FieldByName('jonior_cnt').AsFloat/FieldByName('tot_cnt').AsFloat * 100));
          QRL_nregular_cnt.Caption  := FloatToStr(round(FieldByName('nregular_cnt').AsFloat/FieldByName('tot_cnt').AsFloat * 100));
          QRL_tot_cnt.Caption       := FloatToStr(StrToFloat(QRL_manager_cnt.Caption) +StrToFloat(QRL_senior_cnt.Caption)
                                       +StrToFloat(QRL_jonior_cnt.Caption) +StrToFloat(QRL_nregular_cnt.Caption))  ;
        end
      else
        begin
          QRL_manager_cnt.Caption   := '0';
          QRL_senior_cnt.Caption    := '0';
          QRL_jonior_cnt.Caption    := '0';
          QRL_nregular_cnt.Caption  := '0';
          QRL_tot_cnt.Caption       := '0';
        end;

      QRL_manager_cnt.Caption   := QRL_manager_cnt.Caption  +'%';
      QRL_senior_cnt.Caption    := QRL_senior_cnt.Caption  +'%';
      QRL_jonior_cnt.Caption    := QRL_jonior_cnt.Caption  +'%';
      QRL_nregular_cnt.Caption  := QRL_nregular_cnt.Caption+'%';
      QRL_tot_cnt.Caption       := QRL_tot_cnt.Caption     +'%';

      QRL_manager_rate.Caption  := FieldByName('manager_rate').AsString+'%';
      QRL_senior_rate.Caption   := FieldByName('senior_rate').AsString+'%';
      QRL_jonior_rate.Caption   := FieldByName('jonior_rate').AsString+'%';
      QRL_nregular_rate.Caption := FieldByName('nregular_rate').AsString+'%';
      QRL_tot_rate.Caption      := FieldByName('tot_rate').AsString+'%';
    end;

end;

procedure TQuickR.QuickRBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  NewPage;
end;

end.
 