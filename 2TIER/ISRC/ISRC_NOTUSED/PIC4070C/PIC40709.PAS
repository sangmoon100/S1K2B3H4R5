unit pic40709;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls;

type
  TFmPic40709 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    dBand1: TQRBand;
    Line: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape41: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRShape24: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape49: TQRShape;
    QRShape35: TQRShape;
    QRLabel34: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText8: TQRDBText;
    QRL_No: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPic40709: TFmPic40709;
  Q_No : Integer;

implementation

uses pic40701, pic40702;

{$R *.DFM}

procedure TFmPic40709.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Action := CaFree;  
end;

procedure TFmPic40709.FormCreate(Sender: TObject);
begin
  QRLabel37.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4) ;
  QRLabel39.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3) ;
  QRLabel36.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2) ;
  QRLabel7.Caption  := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1) ;
  QRLabel38.Caption := inttostr(strtoint(MainForm.PPE_rabasyear.Text)) ;

end;

procedure TFmPic40709.dBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(Q_No);
  QRL_No.Caption := IntToStr(Q_No);
end;

procedure TFmPic40709.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Q_No := 0;
end;

end.
