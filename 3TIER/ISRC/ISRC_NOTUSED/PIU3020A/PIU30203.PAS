unit PIU30203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, OnInsaCommon, TmaxFunc;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape20: TQRShape;
    QRShape8: TQRShape;
    QRShape23: TQRShape;
    QRShape12: TQRShape;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape25: TQRShape;
    QRLabel20: TQRLabel;
    QRL_Hopedept1: TQRLabel;
    QRM_Hopesayu1: TQRMemo;
    QRL_Hopedept2: TQRLabel;
    QRLabel28: TQRLabel;
    QRM_Hopesayu2: TQRMemo;
    QRL_korname: TQRLabel;
    QRL_empno: TQRLabel;
    QRL_deptname: TQRLabel;
    QRL_payra: TQRLabel;
    QRShape17: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRShape28: TQRShape;
    QRShape24: TQRShape;
    QRLabel13: TQRLabel;
    QRShape31: TQRShape;
    QRShape27: TQRShape;
    QRShape30: TQRShape;
    QRShape13: TQRShape;
    QRShape41: TQRShape;
    QRM_Hopesayu3: TQRMemo;
    QRShape39: TQRShape;
    QRShape34: TQRShape;
    QRLabel2: TQRLabel;
    QRL_Hopedept3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRL_HOPEJOBPLACE2: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRL_HOPEJOBPLACE3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRL_HOPEJOBPLACE1: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
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

uses PIU30201,peprnview;
{$R *.DFM}

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  payranm, payclnm , deptname: String;
begin
  QRL_korname.Caption       := '';
  QRL_deptname.Caption      := '';
  QRL_empno.Caption         := '';
  QRL_payra.Caption         := '';

  QRL_Hopedept1.Caption     := '';
  QRL_HOPEJOBPLACE1.Caption := '';
  QRM_Hopesayu1.Lines.Clear;

  QRL_Hopedept2.Caption     := '';
  QRL_HOPEJOBPLACE2.Caption := '';
  QRM_Hopesayu2.Lines.Clear;

  QRL_Hopedept3.Caption     := '';
  QRL_HOPEJOBPLACE3.Caption := '';
  QRM_Hopesayu3.Lines.Clear;

  with MainForm.TDS1 do
    begin
      QRL_korname.Caption       := FieldByName('korname').AsString;
      QRL_empno.Caption         := FieldByName('empno').AsString;

      FM_Tmax                   := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session         := MainForm.TMaxSession;
      QRL_deptname.Caption      := FM_Tmax.GetData('deptname' ,FieldByName('orgnum').AsString,
                                                              FieldByName('deptcode').AsString);
      FM_Tmax                   := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session         := MainForm.TMaxSession;
      QRL_payra.Caption         := FM_Tmax.GetData('codename' ,'I113',FieldByName('payra').AsString);

      FM_Tmax                   := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session         := MainForm.TMaxSession;
      payclnm                   :=  FM_Tmax.GetData('codename' ,'I112',FieldByName('paycl').AsString);
      QRL_Hopedept1.Caption     := FieldByName('DEPT1').AsString;
      QRL_HOPEJOBPLACE1.Caption := FieldByName('HOPEJOBPLACEname1').AsString;
      QRM_Hopesayu1.Lines.Add(FieldByName('Hopesayu1').AsString) ;

      QRL_Hopedept2.Caption     := FieldByName('DEPT2').AsString;
      QRL_HOPEJOBPLACE2.Caption := FieldByName('HOPEJOBPLACEname2').AsString;
      QRM_Hopesayu2.Lines.Add(FieldByName('Hopesayu2').AsString) ;

      QRL_Hopedept3.Caption     := FieldByName('DEPT3').AsString;
      QRL_HOPEJOBPLACE3.Caption := FieldByName('HOPEJOBPLACEname3').AsString;
      QRM_Hopesayu3.Lines.Add(FieldByName('Hopesayu3').AsString) ;           
    end;
end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

end.
