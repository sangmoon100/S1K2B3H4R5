unit PSJ1030A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFM_Print = class(TForm)
    QuickRep1: TQuickRep;
    QuickRep2: TQuickRep;
    QRCompositeReport1: TQRCompositeReport;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    DetailBand2: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
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
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    L_age: TQRLabel;
    L_deptname: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRShape33: TQRShape;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel35: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape26: TQRShape;
    QRShape32: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText25: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Print: TFM_Print;

implementation

{$R *.DFM}
uses
    PSJ1030A1;

procedure TFM_Print.QRCompositeReport1AddReports(Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(QuickRep1);
  QRCompositeReport1.Reports.Add(QuickRep2);
end;

procedure TFM_Print.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Print.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  L_deptname.Caption := FM_Main.L_dept.ValueCaption;
  L_age.Caption      := FM_Main.L_age.ValueCaption;
end;

procedure TFM_Print.QuickRep2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
 var FL_Comp : TQRLabel;
     FL_i    : Integer;
begin
{  FL_Comp := nil;
  for FL_i := 1 to 20 do
  begin
       FL_Comp := TQRLabel(Self.FindComponent('L_wol'+IntToStr(FL_i)));
       FL_Comp.Caption := '';
       FL_Comp := TQRLabel(Self.FindComponent('L_il'+IntToStr(FL_i)));
       FL_Comp.Caption := '';
       FL_Comp := TQRLabel(Self.FindComponent('L_pro'+IntToStr(FL_i)));
       FL_Comp.Caption := '';
       FL_Comp := TQRLabel(Self.FindComponent('L_nurse'+IntToStr(FL_i)));
       FL_Comp.Caption := '';
  end;

  FM_Main.QryHis.First;
  for FL_i := 1 to FM_Main.QryHis.RecordCount do
  begin
       with FM_Main.QryHis do
       begin   //Showmessage(InttoStr(FL_i));
            FL_Comp         := TQRLabel(Self.FindComponent('L_wol'+IntToStr(FL_i)));
            FL_Comp.Caption := Copy(FieldByName('Caredate').AsString,6,2);

            FL_Comp         := TQRLabel(Self.FindComponent('L_il'+IntToStr(FL_i)));
            FL_Comp.Caption := Copy(FieldByName('Caredate').AsString,9,2);

            FL_Comp         := TQRLabel(Self.FindComponent('L_pro'+IntToStr(FL_i)));
            FL_Comp.Caption := FieldByName('Problem').AsString;

            FL_Comp         := TQRLabel(Self.FindComponent('L_nurse'+IntToStr(FL_i)));
            FL_Comp.Caption := FieldByName('NURSING').AsString;

            Next;
       end;
  end;  }
end;

end.
