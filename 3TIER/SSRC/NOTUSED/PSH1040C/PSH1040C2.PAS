unit PSH1040C2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, PePrnview;

type
  TFM_Print1 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRL_Sysdate: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    L_Appdate: TQRLabel;
    L_Medidate: TQRLabel;
    L_Faminame: TQRLabel;
    L_Medcomm: TQRLabel;
    L_Corpname: TQRLabel;
    L_Totamt: TQRLabel;
    L_Conyn: TQRLabel;
    L_Conynsayu: TQRLabel;
    L_Exceptamt: TQRLabel;
    L_Appamt: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape2: TQRShape;
    QRL_totamt: TQRLabel;
    QRL_conamt: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    L_KORname: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
   
  end;

var
  FM_Print1: TFM_Print1;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000
  
implementation

{$R *.DFM}

uses  PSH1040C1;

procedure TFM_Print1.QuickRep1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
   Fm_PreviewForm.Show;
end;

procedure TFM_Print1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Print1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with FM_Mainform.TDS_Com do
  begin
    L_korname.Caption   := FieldByName('KORNAME').AsString;
    L_Appdate.Caption   := FieldByName('APPDATE').AsString;
    L_Medidate.Caption  := FieldByName('MEDIDATE').AsString;
    L_Faminame.Caption  := FieldByName('FAMINAME').AsString;
    L_Medcomm.Caption   := FieldByName('MEDCOMM').AsString;
    L_Corpname.Caption  := FieldByName('CORPNAME').AsString;
    L_Totamt.Caption    := Format('%' + '.0n', [FieldByName('TOTAMT').AsFloat * 1.0]);
    L_Exceptamt.Caption := Format('%' + '.0n', [FieldByName('EXCEPTAMT').AsFloat * 1.0]);
    L_Appamt.Caption    := Format('%' + '.0n', [FieldByName('APPAMT').AsFloat * 1.0]);
    L_Conyn.Caption     := FieldByName('CONYN').AsString;
    L_Conynsayu.Caption := FieldByName('CONYNSAYU').AsString;
  end;
end;

procedure TFM_Print1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with FM_Mainform.TDS_Com do
  begin
    QRL_Sysdate.Caption := Copy(FieldByName('TSysdate').AsString,1,4)+'-'+
                           Copy(FieldByName('TSysdate').AsString,5,2)+'-'+
                           Copy(FieldByName('TSysdate').AsString,7,2);
  end;

  QRL_totamt.Caption := '신청총액 : '+ FormatFloat('#,###', FM_Mainform.gs_totamt);
  QRL_conamt.Caption := '승인총액 : '+ FormatFloat('#,###', FM_Mainform.gs_conamt);
end;

end.
