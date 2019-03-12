unit Psa10102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, Db, DBClient, qrprntr, DBTables, pePrnview, Func;

type
  TFpsa10102 = class(TForm)
    QuickReport1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRdate: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRdateOf: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRempno: TQRLabel;
    QRkorname: TQRLabel;
    QRlevel: TQRLabel;
    QRdeptname: TQRLabel;
    QRempdate: TQRLabel;
    QRretire: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLABEL007: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel14: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpsa10102: TFpsa10102;
  Fm_PreviewForm: TFm_PreviewForm; //미리보기 화면 변수선언  dsa2000
  
implementation

uses psa10101;
{$R *.DFM}

procedure TFpsa10102.QuickReport1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  if Fpsa10101.OraQuery1.RecordCount <= 0 then
  begin
       Fpsa10101.Phelpmsg.Caption := '  추출된 자료가 없습니다.';
       Exit;
  end;

  if Fpsa10101.SelectPrint = '1' then
  begin
       with QuickReport1 do
            PrinterSettings.Copies := Fpsa10101.PrintDialog1.Copies;
  end;

end;

procedure TFpsa10102.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QuickReport1.QRPrinter.Progress := 50;
  QRdate.Caption   := Copy(Fn_GetDateTimeStr, 1, 4) +'.'+
                      Copy(Fn_GetDateTimeStr, 5, 2) +'.'+
                      Copy(Fn_GetDateTimeStr, 7, 2) ;
  QRdateOf.Caption := QRdate.Caption;
end;

procedure TFpsa10102.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var Parameter: OleVariant;
begin
  with Fpsa10101.OraQuery1 do
  begin
       QRempno.Caption    := Fields[0].AsString;
       QRkorname.Caption  := Fields[1].AsString;
       QRempdate.Caption  := Copy(Fields[2].AsString, 1, 4) +'.'+
                             Copy(Fields[2].AsString, 5, 2) +'.'+
                             Copy(Fields[2].AsString, 7, 2) ;
       QRretire.Caption   := Copy(Fields[3].AsString, 1, 4) +'.'+
                             Copy(Fields[3].AsString, 5, 2) +'.'+
                             Copy(Fields[3].AsString, 7, 2) ;
       QRlevel.Caption    := GetCodeName('I113', Fields[6].AsString);
       QRdeptname.Caption := Fields[7].AsString;
  end;
end;

procedure TFpsa10102.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
   Fm_PreviewForm.Show;
end;

procedure TFpsa10102.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var i : Integer;
begin
  if Fpsa10101.SelectPrint = '1' then
  begin
       for i := 0 to 10000 do
       begin
            if ( i mod 100 ) = 0 then
            begin
                 Application.ProcessMessages;
                 QuickReport1.QRPrinter.Progress := (i div 100);
            end;
       end;

       Fpsa10101.OraQuery1.Close;
       Exit;
  end
  else Fm_PreviewForm.Show;
end;

procedure TFpsa10102.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLTotal.Caption := Format('%5.0n', [StrToFloat(IntToStr(Fpsa10101.OraQuery1.RecordCount))]);
end;

end.
