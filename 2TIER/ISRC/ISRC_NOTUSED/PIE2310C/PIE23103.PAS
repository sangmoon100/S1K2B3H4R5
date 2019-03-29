unit PIE23103;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr,Qrexport;

type
  TPreViewForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SE_Zoom: TSpinEdit;
    Bprint: TBitBtn;
    QRPreview: TQRPreview;
    P_TotalPage: TPanel;
    SE_CurPage: TSpinEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Button1: TButton;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SE_ZoomChange(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SE_CurPageChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreViewForm: TPreViewForm;

implementation
{$R *.DFM}
uses
  PIE23101, PIE23107;

procedure TPreViewForm.FormActivate(Sender: TObject);
begin
  top := 0;
  left := 0;
  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(QRPrinter.PageCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;
  SE_CurPage.SetFocus;

end;

procedure TPreViewForm.BprintClick(Sender: TObject);
begin
  MainForm.AReport.Print;
  SE_CurPage.SetFocus;
  MessageBox(handle,'출력이 완료되었습니다 !!.','알  림',MB_OK or $0030);
end;

procedure TPreViewForm.BexitClick(Sender: TObject);
begin
  Close;
end;

procedure TPreViewForm.SE_ZoomChange(Sender: TObject);
begin
  QRPreview.Zoom := SE_Zoom.Value;
end;

procedure TPreViewForm.SE_CurPageChange(Sender: TObject);
begin
  if SE_CurPage.Value <=0 then
    System.Exit;

  if SE_CurPage.Value > StrToIntDef(P_TotalPage.Caption,0) then
    SE_CurPage.Value := StrToIntDef(P_TotalPage.Caption,0);
  QRPreview.PageNumber := SE_CurPage.Value;
end;

procedure TPreViewForm.Button1Click(Sender: TObject);
begin
   NewPrintForm.InReport.ExportToFilter(TQRHTMLDocumentFilter.Create('c:\jung.html'));
end;

end.
