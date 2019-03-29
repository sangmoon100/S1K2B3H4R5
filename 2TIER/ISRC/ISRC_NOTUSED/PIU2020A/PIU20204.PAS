unit PIU20204;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickRep11 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
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
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel25: TQRLabel;
    QRL_appdept2: TQRLabel;
    QRL_moveyymm2: TQRLabel;
    QRShape35: TQRShape;
    QRLabel28: TQRLabel;
    QRM_appsayu2: TQRMemo;
    QRM_spedesc2: TQRMemo;
    QRLabel29: TQRLabel;
    QRShape39: TQRShape;
    QRLabel30: TQRLabel;
    QRL_appdept3: TQRLabel;
    QRL_moveyymm3: TQRLabel;
    QRLabel33: TQRLabel;
    QRM_appsayu3: TQRMemo;
    QRM_spedesc3: TQRMemo;
    QRLabel34: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_payra: TQRLabel;
    QRL_5: TQRLabel;
    QRL_3: TQRLabel;
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
    QRShape26: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape23: TQRShape;
    QRShape46: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private

  public

  end;

var
  QuickRep11: TQuickRep11;

implementation

uses piu20201, peprnview;
{$R *.DFM}

procedure TQuickRep11.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_korname.Caption := '';
  QRL_deptname.Caption := '';
  QRL_empno.Caption := '';
  QRL_payra.Caption := '';
  QRL_5.Caption := '(      )';
  QRL_3.Caption := '(      )';

  QRL_appdept1.Caption := '';
  QRL_moveyymm1.Caption := '';
  QRM_appsayu1.Lines.Clear;
  QRM_spedesc1.Lines.Clear;

  QRL_appdept2.Caption := '';
  QRL_moveyymm2.Caption := '';
  QRM_appsayu2.Lines.Clear;
  QRM_spedesc2.Lines.Clear;

  QRL_appdept3.Caption := '';
  QRL_moveyymm3.Caption := '';
  QRM_appsayu3.Lines.Clear;
  QRM_spedesc3.Lines.Clear;

  with MainForm.Ora_Grid do
    begin
      QRL_korname.Caption := FieldByName('korname').AsString;
      QRL_deptname.Caption := FieldByName('deptname').AsString;
      QRL_empno.Caption := FieldByName('empno').AsString;
      QRL_payra.Caption := FieldByName('payranm').AsString;//+' ('+FieldByName('payclnm').AsString+')';
//      QRL_empdate
      if FieldByName('GUBUN').AsString ='5' then
        QRL_5.Caption := '(  ¡Û  )'
      else
        QRL_3.Caption := '(  ¡Û  )';

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

procedure TQuickRep11.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep11);
  Fm_PreviewForm.Show;
end;

end.
