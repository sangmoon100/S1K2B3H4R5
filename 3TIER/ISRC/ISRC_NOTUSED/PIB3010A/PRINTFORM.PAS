unit PrintForm;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  TPrintForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SE_Zoom: TSpinEdit;
    Bprint: TBitBtn;
    SE_CurPage: TSpinEdit;
    QRPreview: TQRPreview;
    P_TotalPage: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SE_ZoomChange(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SE_CurPageChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation
{$R *.DFM}
uses
  Pib30101;

procedure TPrintForm.FormActivate(Sender: TObject);
begin
  SE_Zoom.Value        := 100;
  QRPreview.Zoom       := SE_Zoom.Value;
  P_TotalPage.Caption  := IntToStr(QRPrinter.PageCount);
  SE_CurPage.Value     := 1;
  QRPreview.PageNumber := SE_CurPage.Value;
  SE_CurPage.SetFocus;
end;

procedure TPrintForm.BprintClick(Sender: TObject);
begin
  QRPreview.QRPrinter.Print;
  MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
  SE_CurPage.SetFocus;
end;

procedure TPrintForm.BexitClick(Sender: TObject);
begin
  Close;
end;

procedure TPrintForm.SE_ZoomChange(Sender: TObject);
begin
  QRPreview.Zoom := SE_Zoom.Value;
end;

procedure TPrintForm.SE_CurPageChange(Sender: TObject);
begin
  if SE_CurPage.Value <=0 then
    System.Exit;

  if SE_CurPage.Value > StrToIntDef(P_TotalPage.Caption,0) then
    SE_CurPage.Value := StrToIntDef(P_TotalPage.Caption,0);
  QRPreview.PageNumber := SE_CurPage.Value;
end;

end.
