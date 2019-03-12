unit pzc10103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, peprnview;

type
  TPrintCodeID = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QL_codeidRANGE: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QL_codeid: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QL_codeidname: TQRLabel;
    QL_codetype: TQRLabel;
    QL_codelen: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintCodeID: TPrintCodeID;
  Fm_PreviewForm: TFm_PreviewForm;

implementation

uses pzc10101;

{$R *.DFM}

procedure TPrintCodeID.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with MainForm.Query_Code do
  begin
    QL_codeid.Caption     := FieldByName('codeid').AsString;
    QL_codeidname.Caption := FieldByName('codeidname').AsString;
    QL_codetype.Caption   := FieldByName('codetype').AsString;
    QL_codelen.Caption    := FieldByName('codelen').AsString;
  end;
end;

procedure TPrintCodeID.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

end.
