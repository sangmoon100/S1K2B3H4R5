unit UPrintT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, QuickRpt, Qrctrls, ExtCtrls, StdCtrls;

type
  TFrmPrintT = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRL_Name: TQRLabel;
    QRL_Sabun: TQRLabel;
    QRL_Jumin: TQRLabel;
    QRL_OrgEmpDate: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintT: TFrmPrintT;

implementation

uses UMain;


{$R *.DFM}

procedure TFrmPrintT.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRL_Sabun.Caption     := trim(FrmMain.La_Sabun.Caption);
  QRL_Name.Caption      := trim(FrmMain.La_Name1.Caption);
  QRL_Jumin.Caption     := '';
//  QRL_Jumin.Caption     := ' '+copy(FrmMain.La_Jumin.Caption,1,8)+'******';
  QRL_OrgEmpDate.Caption:= FrmMain.La_OrgEmpDate.Caption;
end;

procedure TFrmPrintT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
 
