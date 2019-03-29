unit pie21902;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TPrnForm1 = class(TForm)
    Rpt: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    pWorkDate: TQRLabel;
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    a11: TQRLabel;
    a12: TQRLabel;
    a13: TQRLabel;
    a14: TQRLabel;
    a21: TQRLabel;
    a22: TQRLabel;
    a23: TQRLabel;
    a24: TQRLabel;
    a31: TQRLabel;
    a32: TQRLabel;
    a33: TQRLabel;
    a34: TQRLabel;
    a41: TQRLabel;
    a42: TQRLabel;
    a43: TQRLabel;
    a44: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RptPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrnForm1: TPrnForm1;

implementation

uses pie21901,peprnView;

{$R *.DFM}

procedure TPrnForm1.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i,j : integer;
  prnLabel : TQRLabel;
begin
  pWorkDate.Caption := '[기준년월 : '+copy(MainForm.WorkDate.Text,1,4)+'/'+
                                       copy(MainForm.WorkDate.Text,5,2)+']';
  for i := 1 to 4 do
    for j := 1 to 4 do begin
      prnLabel := FindComponent('a'+inttostr(i)+inttostr(j)) as TQRLabel;
      prnLabel.Caption := FormatFloat('#,###',MainForm.PrnData[i,j]);
    end;
end;

procedure TPrnForm1.RptPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Rpt);
  Fm_PreviewForm.Show;
end;

end.
