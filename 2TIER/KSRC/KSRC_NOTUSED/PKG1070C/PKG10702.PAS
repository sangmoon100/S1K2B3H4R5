unit pkg10702;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, quickrpt, Qrprntr, peprnview,
  Qrctrls;

type
  TPrintForm = class(TForm)
    QRBand1: TQRBand;
    QuickReport1: TQuickRep;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRL_day: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLempno: TQRLabel;
    QRLkorname: TQRLabel;
    QRLfirstyn: TQRLabel;
    QRLfaminame: TQRLabel;
    QRLfamikind: TQRLabel;
    QRLfamirel: TQRLabel;
    QRLfamibdate: TQRLabel;
    QRLappdate: TQRLabel;
    QRLfamifrdate: TQRLabel;
    QRLbigo: TQRLabel;
    QRShape2: TQRShape;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRL_inwon: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape4: TQRShape;
    Qmcpamt: TQRLabel;
    QRL_mcpamtTOT: TQRLabel;
    QRBand2: TQRChildBand;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickReport1NeedData(sender: TObject; var MoreData: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    // jeon jin taek
    user_preview : boolean;
  end;

var
  PrintForm: TPrintForm;
  Inwon: Integer;
  mcpamtTOT: Real;
  Fm_PreviewForm: TFm_PreviewForm; //변수선언  dsa2000

implementation
{$R *.DFM}

uses
  pkg10701;

procedure TPrintForm.QuickReport1NeedData(sender: TObject; var MoreData: Boolean);
begin
   if MainForm.QueryF.eof then
     MoreData := False
   else
   begin
     Inc(Inwon);
     MainForm.Gauge1.Progress := (Inwon * 100) div MainForm.QueryF.RecordCount;
     Application.ProcessMessages;

     QRLempno.Caption      := MainForm.QueryF.FieldByName('empno').AsString;
     QRLkorname.Caption    := MainForm.QueryF.FieldByName('korname').AsString;
     QRLfirstyn.Caption    := MainForm.QueryF.FieldByName('firstyn').AsString;
     QRLfaminame.Caption   := MainForm.QueryF.FieldByName('faminame').AsString;
     QRLfamikind.Caption   := MainForm.QueryF.FieldByName('famikind_n').AsString;
     QRLfamirel.Caption    := MainForm.QueryF.FieldByName('famirel').AsString;

     if MainForm.QueryF.FieldByName('famibdate').AsString <> '' then
          QRLfamibdate.Caption := Copy(MainForm.QueryF.FieldByName('famibdate').AsString,1,4)+'.'+
                                  Copy(MainForm.QueryF.FieldByName('famibdate').AsString,5,2)+'.'+
                                  Copy(MainForm.QueryF.FieldByName('famibdate').AsString,7,2)
     else
          QRLfamibdate.Caption := '';

     if MainForm.QueryF.FieldByName('appdate').AsString <> '' then
          QRLappdate.Caption  := Copy(MainForm.QueryF.FieldByName('appdate').AsString,1,4)+'.'+
                                 Copy(MainForm.QueryF.FieldByName('appdate').AsString,5,2)+'.'+
                                 Copy(MainForm.QueryF.FieldByName('appdate').AsString,7,2)
     else
          QRLappdate.Caption  := '';

     if MainForm.QueryF.FieldByName('famifrdate').AsString <> '' then
          QRLfamifrdate.Caption := Copy(MainForm.QueryF.FieldByName('famifrdate').AsString,1,4)+'.'+
                                   Copy(MainForm.QueryF.FieldByName('famifrdate').AsString,5,2)
     else
          QRLfamifrdate.Caption := '';

     if MainForm.QueryF.FieldByName('famikind').AsString = 'A' then        {배우자}
     begin
          mcpamtTOT := mcpamtTOT + MainForm.F_mateamt;
          Qmcpamt.Caption := format('%9.0n',[MainForm.F_mateamt]);
     end
     else if MainForm.QueryF.FieldByName('famikind').AsString = 'B' then   {직계 존속}
     begin
          mcpamtTOT := mcpamtTOT + MainForm.F_parentamt;
          Qmcpamt.Caption := format('%9.0n',[MainForm.F_parentamt]);
     end
     else if MainForm.QueryF.FieldByName('famikind').AsString = 'C' then   {직계 비속}
     begin
          mcpamtTOT := mcpamtTOT + MainForm.F_childamt;
          Qmcpamt.Caption := format('%9.0n',[MainForm.F_childamt]);
     end
     else
     begin
          Qmcpamt.Caption := format('%9.0n',[0]);
     end;

     MainForm.QueryF.next;
     MoreData := True
   end;
end;

procedure TPrintForm.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRL_inwon.Caption     := Inttostr(Inwon)+' 명';
  QRL_mcpamtTOT.Caption := format('%12.0n', [mcpamtTOT]);
end;


// jeon jin taek
procedure TPrintForm.QuickReport1Preview(Sender: TObject);
begin
//   previewform.qrPreView.QRPrinter := TQrprinter(sender); DSA2000
   self.user_preview := true;
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MainForm.QueryF.Close;
    action := cafree;
end;

procedure TPrintForm.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     if self.user_preview then Fm_PreviewForm.show;
end;

procedure TPrintForm.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  MainForm.QueryF.first;

  QRL_day.Caption  := Copy(MainForm.MEyear.Text,1,4) + '.' + Copy(MainForm.MEyear.Text,5,2);
  QRLabel5.Caption := MainForm.L_Curdate.Caption;
  Inwon := 0;
  mcpamtTOT := 0;
end;

end.


