unit pkc20703;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Buttons, Spin, ExtCtrls, qrprntr,
  Qrctrls;

type
  TPreviewForm = class(TForm)
    Panel1: TPanel;
    QRLabel1: TQRLabel;
    P_TotalPage: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    BBztf: TBitBtn;
    BBztw: TBitBtn;
    BBprint: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    BBsetup: TBitBtn;
    QRPreview: TQRPreview;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SE_CurPage: TSpinEdit;
    SE_Zoom: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure SE_CurPageChange(Sender: TObject);
    procedure SE_ZoomChange(Sender: TObject);
    procedure BBztfClick(Sender: TObject);
    procedure BBztwClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

{$R *.DFM}

uses pkc20701, pkc20707;

procedure TPreviewForm.FormActivate(Sender: TObject);
begin
{  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(PreviewForm.QRPreview.Qrprinter.PageCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;
  SE_CurPage.SetFocus;
  }
end;

procedure TPreviewForm.SE_CurPageChange(Sender: TObject);
begin
  if SE_CurPage.Text = '' then
    System.Exit;

  if SE_CurPage.Value <=0 then
    System.Exit;
  if SE_CurPage.Value > StrToIntDef(P_TotalPage.Caption,0) then
    SE_CurPage.Value := StrToIntDef(P_TotalPage.Caption,0);
  QRPreview.PageNumber := SE_CurPage.Value;
end;

procedure TPreviewForm.SE_ZoomChange(Sender: TObject);
begin
  if SE_Zoom.Value <=0 then
    System.Exit;
  QRPreview.Zoom := SE_Zoom.Value;
end;

procedure TPreviewForm.BBztfClick(Sender: TObject);
begin
  QRPreview.ZoomToFit;
  SE_Zoom.Value := QRPreview.Zoom;
end;

procedure TPreviewForm.BBztwClick(Sender: TObject);
begin
  QRPreview.ZoomToWidth;
  SE_Zoom.Value := QRPreview.Zoom;
end;

procedure TPreviewForm.BBprintClick(Sender: TObject);
begin
        SReportF2.QReport.Print;
end;

procedure TPreviewForm.BBsetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TPreviewForm.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPreviewForm.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(PreviewForm.QRPreview.Qrprinter.PageCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;
  //SE_CurPage.SetFocus;
end;

end.
