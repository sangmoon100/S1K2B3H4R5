unit Pkg20202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, ExtCtrls, qrprntr, printers;

type
  TPreviewForm = class(TForm)
    Panel1: TPanel;
    qrPreView: TQRPreview;
    dlgPrnSet: TPrinterSetupDialog;
    sbtnHelp: TBitBtn;
    sbtnPrint: TSpeedButton;
    sbtnPrnSet: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lblPageNo: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sedPageNo: TSpinEdit;
    sedZoom: TSpinEdit;
    btnClose: TBitBtn;
    PrintDialog1: TPrintDialog;
    procedure sedPageNoChange(Sender: TObject);
    procedure sedZoomChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbtnPrnSetClick(Sender: TObject);
    procedure sbtnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   // procedure qrPreViewPageAvailable(Sender: TObject; PageNum: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation
uses pkg20203;
{$R *.DFM}


procedure TPreviewForm.sedPageNoChange(Sender: TObject);
begin
   qrPreView.Pagenumber := sedPageNo.Value;
end;

procedure TPreviewForm.sedZoomChange(Sender: TObject);
begin
  if (sedZoom.Value) > 9 then qrPreView.Zoom := sedZoom.Value;
end;

procedure TPreviewForm.SpeedButton3Click(Sender: TObject);
begin
  qrPreView.ZoomToFit;
  sedZoom.Value := qrPreView.Zoom;
end;

procedure TPreviewForm.SpeedButton4Click(Sender: TObject);
begin
  qrPreView.ZoomToWidth;
  sedZoom.Value := qrPreView.Zoom;
end;

procedure TPreviewForm.sbtnPrnSetClick(Sender: TObject);
begin
  dlgPrnSet.Execute;
end;

procedure TPreviewForm.sbtnPrintClick(Sender: TObject);
begin
   qrpreview.QRPrinter.Print;
end;

procedure TPreviewForm.btnCloseClick(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  PreviewForm.qrPreView.QRPrinter.Cleanup;
  printform.Close;
  close;
end;




procedure TPreviewForm.FormCreate(Sender: TObject);
begin
  self.WindowState := wsMaximized;
{  lblPageNo.Caption  := '1'; //InttoStr(QRPrinter.PageCount);
  sedPageNo.MaxValue := 1; //QRPrinter.PageCount;
  sedPageNo.MinValue := 1;
  sedPageNo.Value    := 1;

  qr_pagecount := 1;}
//  sedZoom.Value      := 53;
//  qrPreView.Zoom     := 53;
end;


{
procedure TPreviewForm.qrPreViewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  lblPageNo.Caption  := InttoStr(qrPreView.QRPrinter.PageCount);
  sedPageNo.MaxValue := qrPreView.QRPrinter.PageCount;
  sedPageNo.MinValue := 1;
  sedPageNo.Value    := 1;
end;
}


procedure TPreviewForm.FormActivate(Sender: TObject);
begin
     lblPageNo.Caption  := InttoStr(qrPreView.QRPrinter.PageCount);
     sedPageNo.MaxValue := qrPreView.QRPrinter.PageCount;
     sedPageNo.MinValue := 1;
     sedPageNo.value    := 1;

     sedZoom.Value := 100;
     qrPreView.Zoom := 100;
     Application.ProcessMessages;
end;

procedure TPreviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := cafree;
end;

end.
