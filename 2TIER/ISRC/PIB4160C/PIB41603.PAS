unit pib41603;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  Tpib4163cForm = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SpinEdit2: TSpinEdit;
    Panel4: TPanel;
    Bprint: TBitBtn;
    Panel3: TPanel;
    LastPage: TPanel;
    Panel5: TPanel;
    SpinEdit3: TSpinEdit;
    QRPreview1: TQRPreview;
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pib4163cForm: Tpib4163cForm;

implementation
uses pib41601;
{$R *.DFM}

procedure Tpib4163cForm.SpinEdit3Change(Sender: TObject);
begin
  if TSpinEdit(Sender).Text = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value > QRPrinter.PageCount then
     TSpinEdit(Sender).Value := QRPrinter.PageCount;
  QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
end;

procedure Tpib4163cForm.SpinEdit2Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
 QRPreview1.Zoom:=SpinEdit2.Value;
end;

procedure Tpib4163cForm.BprintClick(Sender: TObject);
begin
  pib4161cForm.PrnRpt.Print;
  MessageBox(handle,'출력이 완료되었습니다 !!.','알 림',MB_OK or $0030);
  SpinEdit3.SetFocus;
end;

procedure Tpib4163cForm.BexitClick(Sender: TObject);
begin
  close;
end;

procedure Tpib4163cForm.FormActivate(Sender: TObject);
begin
  QRPreview1.Zoom  :=100;
  LastPage.Caption := inttostr(QRPrinter.PageCount);
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber := 1;
end;

end.
