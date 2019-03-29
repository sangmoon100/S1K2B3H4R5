unit PIU20205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape8: TQRShape;
    QRShape23: TQRShape;
    QRShape32: TQRShape;
    QRShape12: TQRShape;
    QRShape9: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape11: TQRShape;
    QRShape31: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRLabel15: TQRLabel;
    QRShape21: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape25: TQRShape;
    QRLabel20: TQRLabel;
    QRL_appdept1: TQRLabel;
    QRL_moveyymm1: TQRLabel;
    QRLabel23: TQRLabel;
    QRM_appsayu1: TQRMemo;
    QRLabel24: TQRLabel;
    QRM_spedesc1: TQRMemo;
    QRLabel25: TQRLabel;
    QRL_appdept2: TQRLabel;
    QRL_moveyymm2: TQRLabel;
    QRShape35: TQRShape;
    QRLabel28: TQRLabel;
    QRM_appsayu2: TQRMemo;
    QRM_spedesc2: TQRMemo;
    QRLabel29: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_payra: TQRLabel;
    QRL_5: TQRLabel;
    QRL_3: TQRLabel;
    QRL_2: TQRLabel;
    QRL_A: TQRLabel;
    QRL_E: TQRLabel;
    QRL_T: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape47: TQRShape;
    QRShape22: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRShape36: TQRShape;
    QRShape46: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRShape38: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel30: TQRLabel;
    QRL_appdept3: TQRLabel;
    QRL_moveyymm3: TQRLabel;
    QRM_appsayu3: TQRMemo;
    QRM_spedesc3: TQRMemo;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses PIU20201,peprnview;
{$R *.DFM}

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_korname.Caption := '';
  QRL_deptname.Caption := '';
  QRL_empno.Caption := '';
  QRL_payra.Caption := '';

  QRL_5.Caption := '(   )';
  QRL_3.Caption := '(   )';
  QRL_2.Caption := '(   )';
  QRL_A.Caption := '(   )';
  QRL_E.Caption := '(   )';
  QRL_T.Caption := '(   )';

  QRL_appdept1.Caption := '';
  QRL_moveyymm1.Caption := '';
  QRM_appsayu1.Lines.Clear;
  QRM_spedesc1.Lines.Clear;

  QRL_appdept2.Caption := '';
  QRL_moveyymm2.Caption := '';
  QRM_appsayu2.Lines.Clear;
  QRM_spedesc2.Lines.Clear;


  with MainForm.Ora_Grid do
    begin
      QRL_korname.Caption := FieldByName('korname').AsString;
      QRL_deptname.Caption := FieldByName('deptname').AsString;
      QRL_empno.Caption := FieldByName('empno').AsString;
      QRL_payra.Caption := FieldByName('payranm').AsString;//+' ('+FieldByName('payclnm').AsString+')';

      if FieldByName('GUBUN').AsString ='5년 이상 장기근무' then
        QRL_5.Caption := '( ○)'
      else if FieldByName('GUBUN').AsString ='3년∼5년 근무자' then
        QRL_3.Caption := '( ○)'
      else if FieldByName('GUBUN').AsString ='3년 미만(승격자격 취득희망)' then
        QRL_2.Caption := '( ○)'
      else if FieldByName('GUBUN').AsString ='무연고 지역 2년 이상 근무' then
        QRL_A.Caption := '( ○)'
      else if FieldByName('GUBUN').AsString ='기타 사유자' then
        QRL_E.Caption := '( ○)'
      else if FieldByName('GUBUN').AsString ='본사/수도권 ↔ 지방' then
        QRL_T.Caption := '( ○)';

      QRL_appdept1.Caption := FieldByName('dept1').AsString ;
      QRL_moveyymm1.Caption := FieldByName('moveyymm1').AsString ;
      QRM_appsayu1.Lines.Add(FieldByName('appsayu1').AsString) ;
      QRM_spedesc1.Lines.Add(FieldByName('spedesc1').AsString) ;

      QRL_appdept2.Caption := FieldByName('dept2').AsString ;
      QRL_moveyymm2.Caption := FieldByName('moveyymm2').AsString ;
      QRM_appsayu2.Lines.Add(FieldByName('appsayu2').AsString) ;
      QRM_spedesc2.Lines.Add(FieldByName('spedesc2').AsString) ;

      QRL_appdept3.Caption := FieldByName('dept3').AsString ;
      QRL_moveyymm3.Caption := FieldByName('moveyymm3').AsString ;
      QRM_appsayu3.Lines.Add(FieldByName('appsayu3').AsString) ;
      QRM_spedesc3.Lines.Add(FieldByName('spedesc3').AsString) ;

    end;
end;

procedure TPrintForm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_appdept3.Caption := '';
  QRL_moveyymm3.Caption := '';
  QRM_appsayu3.Lines.Clear;
  QRM_spedesc3.Lines.Clear;

  with MainForm.Ora_Grid do
    begin
      QRL_appdept3.Caption := FieldByName('dept3').AsString ;
      QRL_moveyymm3.Caption := FieldByName('moveyymm3').AsString ;
      QRM_appsayu3.Lines.Add(FieldByName('appsayu3').AsString) ;
      QRM_spedesc3.Lines.Add(FieldByName('spedesc3').AsString) ;
    end;
end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;

end;

end.
 