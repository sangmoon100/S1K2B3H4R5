unit PSH1040C3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, PePrnview;

type
  TFM_Print2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRL_Sysdate: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    L_Appdate: TQRLabel;
    L_Playdate: TQRLabel;
    L_Playitem: TQRLabel;
    L_Corpname: TQRLabel;
    L_Playamt: TQRLabel;
    L_Exceptamt: TQRLabel;
    L_Preamt: TQRLabel;
    L_Endyymm: TQRLabel;
    L_Setamt: TQRLabel;
    L_Startyymm: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    L_Conyn: TQRLabel;
    QRShape13: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    L_Korname: TQRLabel;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Print2: TFM_Print2;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000
  
implementation

{$R *.DFM}

uses  PSH1040C1;

procedure TFM_Print2.QuickRep1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
   Fm_PreviewForm.Show;
end;

procedure TFM_Print2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with FM_Mainform.TDS_Com do
  begin
    QRL_Sysdate.Caption := Copy(FieldByName('TSysdate').AsString,1,4)+'-'+
                           Copy(FieldByName('TSysdate').AsString,5,2)+'-'+
                           Copy(FieldByName('TSysdate').AsString,7,2);
  end;
end;

procedure TFM_Print2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Print2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with FM_Mainform.TDS_Com do
  begin
    L_Korname.Caption   := FieldByName('KORNAME').AsString;
    L_Appdate.Caption   := FieldByName('APPDATE').AsString;
    L_PLAYDATE.Caption  := FieldByName('PLAYDATE').AsString;
    L_PLAYITEM.Caption  := FieldByName('PLAYITEM').AsString;
    L_Corpname.Caption  := FieldByName('CORPNAME').AsString;
    L_PLAYAMT.Caption   := Format('%' + '.0n', [FieldByName('PLAYAMT').AsFloat * 1.0]);
    L_Exceptamt.Caption := Format('%' + '.0n', [FieldByName('EXCEPTAMT').AsFloat * 1.0]);
    L_SETAMT.Caption    := Format('%' + '.0n', [FieldByName('SETAMT').AsFloat * 1.0]);
    L_PREAMT.Caption    := Format('%' + '.0n', [FieldByName('PREAMT').AsFloat * 1.0]);
    L_StartYYMM.Caption := FieldByName('StartYYMM').AsString;
    L_ENDYYMM.Caption   := FieldByName('ENDYYMM').AsString;
    L_CONYN.Caption     := FieldByName('CONYN').AsString;
  end;
end;

end.

