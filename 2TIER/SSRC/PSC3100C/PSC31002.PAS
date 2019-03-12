unit psc31002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  qrprntr, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TPreviewForm = class(TForm)
    Panel1: TPanel;
    QRLtot: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    BB_ztf: TBitBtn;
    BB_ztw: TBitBtn;
    BB_print: TBitBtn;
    BB_help: TBitBtn;
    BB_close: TBitBtn;
    BB_setup: TBitBtn;
    QRPreview1: TQRPreview;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BB_ztfClick(Sender: TObject);
    procedure BB_ztwClick(Sender: TObject);
    procedure BB_setupClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
    procedure BB_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

uses psc31001, psc31003, psc31005, psc31004;

{$R *.DFM}

procedure TPreviewForm.SpinEdit1Change(Sender: TObject);
begin
  if SpinEdit1.Value < 1 then
    SpinEdit1.Value := 1
  else if SpinEdit1.Value > QRPreview1.QRPrinter.PageCount then
    SpinEdit1.Value := QRPreview1.QRPrinter.PageCount;

  QRPreview1.PageNumber := SpinEdit1.Value;
end;

procedure TPreviewForm.SpinEdit2Change(Sender: TObject);
begin
  QRPreview1.Zoom := SpinEdit2.Value;
end;

procedure TPreviewForm.BB_ztfClick(Sender: TObject);
begin
  QRPreview1.ZoomToFit;
  SpinEdit2.Value := QRPreview1.Zoom;
end;

procedure TPreviewForm.BB_ztwClick(Sender: TObject);
begin
  QRPreview1.ZoomToWidth;
  SpinEdit2.Value := QRPreview1.Zoom;
end;

procedure TPreviewForm.BB_setupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TPreviewForm.BB_closeClick(Sender: TObject);
begin
  Close;
  MainForm.p_help.Caption := ' 작업을 완료했습니다.';
end;

procedure TPreviewForm.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  QRLtot.Caption     := IntToStr(QRPreview1.QRPrinter.PageCount);
  SpinEdit1.Value    := 1;
  SpinEdit2.Value    := 100;
  QRPreview1.Zoom    := 100;
  SpinEdit1.MaxValue := QRPreview1.QRPrinter.PageCount;
  SpinEdit1.MinValue := 1;
end;

procedure TPreviewForm.BB_printClick(Sender: TObject);
begin
  if MainForm.RB_personal.Checked = True then
  begin
    Print_personal.QuickRep1.PrinterSettings.LastPage := -1;
    Print_personal.QuickRep1.PrinterSetup;
    if Print_personal.QuickRep1.PrinterSettings.LastPage <> -1 then
    begin
      QRPreview1.QRPrinter.Print;
      Print_personal.QuickRep1.QRPrinter := QRPreview1.QRPrinter;
    end;
  end else
  if MainForm.RB_divdetail.Checked = True then
  begin
    Print_divdetail.QuickRep1.PrinterSettings.LastPage := -1;
    Print_divdetail.QuickRep1.PrinterSetup;
    if Print_divdetail.QuickRep1.PrinterSettings.LastPage <> -1 then
    begin
      QRPreview1.QRPrinter.Print;
      Print_divdetail.QuickRep1.QRPrinter := QRPreview1.QRPrinter;
    end;
  end else
  begin
  if MainForm.RB_divtotal.Checked = True then
    Print_divtotal.QuickRep1.PrinterSettings.LastPage := -1;
    Print_divtotal.QuickRep1.PrinterSetup;
    if Print_divtotal.QuickRep1.PrinterSettings.LastPage <> -1 then
    begin
      QRPreview1.QRPrinter.Print;
      Print_divtotal.QuickRep1.QRPrinter := QRPreview1.QRPrinter;
    end;
  end;
end;

end.
