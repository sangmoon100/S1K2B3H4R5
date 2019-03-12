unit pzc10104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, peprnview;

type
  TPrintCodeno = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLsysdate: TQRLabel;
    QRL_codeRANGE: TQRLabel;
    DetailBand1: TQRBand;
    QL_codeid: TQRLabel;
    QRShape5: TQRShape;
    QL_codeidname: TQRLabel;
    QL_codename: TQRLabel;
    QL_codefullname: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QL_codeno: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintCodeno: TPrintCodeno;
  Fm_PreviewForm: TFm_PreviewForm;

implementation

uses pzc10102;

{$R *.DFM}

procedure TPrintCodeno.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with CodeForm.Query_codeid do
  begin
    QL_codeid.Caption       := FieldByName('codeid').AsString;
    QL_codeidname.Caption   := FieldByName('codeidname').AsString;
    QL_codeno.Caption       := FieldByName('codeno').AsString;
    QL_codename.Caption     := FieldByName('codename').AsString;
    QL_codefullname.Caption := FieldByName('codefname').AsString;
  end;
end;

procedure TPrintCodeno.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  Fm_PreviewForm.Show;
end;

end.
