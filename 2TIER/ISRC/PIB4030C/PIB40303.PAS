unit Pib40303;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  TPreViewForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SE_Zoom: TSpinEdit;
    Bprint: TBitBtn;
    QRPreview: TQRPreview;
    PrnSetup: TPrinterSetupDialog;
    P_TotalPage: TPanel;
    SE_CurPage: TSpinEdit;
    Panel2: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    BB_In: TBitBtn;
    BB_Out: TBitBtn;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SE_ZoomChange(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SE_CurPageChange(Sender: TObject);
    procedure BB_InClick(Sender: TObject);
    procedure BB_OutClick(Sender: TObject);
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
  pib40301;

procedure TPreViewForm.FormActivate(Sender: TObject);
begin
  BB_In.Enabled  := False;
  BB_Out.Enabled := False;

  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(QRPrinter.PageCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;
  if (pib40301.Job_Cond = 1) or (pib40301.Full_Data) then
    BB_In.Enabled := True;
  if (pib40301.Job_Cond = 2) or (pib40301.Full_Data) then
    BB_Out.Enabled := True;
  Bprint.SetFocus;
end;

procedure TPreViewForm.BprintClick(Sender: TObject);
begin
  MainForm.AReport.ShowProgress := True;
  MainForm.AReport.Print;
  showmessage('출력이 완료되었습니다.');
  Bprint.SetFocus;
end;

procedure TPreViewForm.BexitClick(Sender: TObject);
begin
  pib40301.Job_Cond := 3;
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

procedure TPreViewForm.BB_InClick(Sender: TObject);
begin
  pib40301.Job_Cond := 1;
  Close;
end;

procedure TPreViewForm.BB_OutClick(Sender: TObject);
begin
  pib40301.Job_Cond := 2;
  Close;
end;

end.
