unit pic70305;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, qrprntr, QRCtrls, ComCtrls;

type
  TViewForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SpinEdit2: TSpinEdit;
    Panel4: TPanel;
    Bprint: TBitBtn;
    Panel3: TPanel;
    LastPage: TPanel;
    Panel5: TPanel;
    SpinEdit3: TSpinEdit;
    pGr: TProgressBar;
    QRPreview1: TQRPreview;
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
  private
    { Private declarations }
    ExitCheck : Boolean;
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation
uses pic70301, pic70302;
{$R *.DFM}

// 폼에 관련된 사항들...........................................................
procedure TViewForm.FormActivate(Sender: TObject);
begin
   LastPage.Caption := inttostr(MainForm.TotalPageCnt);
   pGr.Max          := MainForm.TotalPageCnt;
end;

procedure TViewForm.BexitClick(Sender: TObject);
begin
  if ExitCheck = True then close;
end;

procedure TViewForm.BprintClick(Sender: TObject);
begin
  if CData.PrintExecute(MainForm.Rpt,MainForm.TotalPageCnt) = True then begin
     MainForm.Rpt.Print;
     MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
  end;
  SpinEdit3.SetFocus;
end;

procedure TViewForm.SpinEdit3Change(Sender: TObject);
begin
  if trim(TSpinEdit(Sender).Text) = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1       then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value > strtoint(LastPage.Caption) then
     TSpinEdit(Sender).Value := strtoint(LastPage.Caption);
  QRPreview1.PageNumber := TSpinEdit(Sender).Value;
end;

procedure TViewForm.SpinEdit2Change(Sender: TObject);
begin
  if TSpinEdit(Sender).Text = '' then system.Exit;
  QRPreview1.Zoom := SpinEdit2.Value;
end;

procedure TViewForm.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
   pGr.position := PageNum;
   SendMessage(pGr.handle,WM_PAINT,0,0);
   if PageNum >= MainForm.TotalPageCnt then begin
      SpinEdit2.Enabled := True;
      SpinEdit3.Enabled := True;
      BPrint.Enabled    := True;
      Bexit.Enabled     := True;
      ExitCheck         := True;
      SpinEdit3.Value   := 1;
      pGr.position      := 0;
      SpinEdit2.Value   := 100;
      QRPreview1.Zoom   := 100;
      SpinEdit3.SetFocus;
   end else begin
      SpinEdit2.Enabled := False;
      SpinEdit3.Enabled := False;
      BPrint.Enabled    := False;
      Bexit.Enabled     := False;
      ExitCheck         := False;
   end;
end;

end.
