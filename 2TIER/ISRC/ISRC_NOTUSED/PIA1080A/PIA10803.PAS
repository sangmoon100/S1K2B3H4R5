unit pia10803;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  Tpia10803Form = class(TForm)
    Bexit: TBitBtn;
    SpinEdit2: TSpinEdit;
    Panel4: TPanel;
    Bprint: TBitBtn;
    Panel3: TPanel;
    LastPage: TPanel;
    Panel5: TPanel;
    SpinEdit3: TSpinEdit;
    QRPreview1: TQRPreview;
    Panel1: TPanel;
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pia10803Form: Tpia10803Form;

implementation
uses pia10801;
{$R *.DFM}

procedure Tpia10803Form.BprintClick(Sender: TObject);
begin
  pia10801Form.prnRpt.Print;
  SpinEdit2.SetFocus;
  MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
end;

procedure Tpia10803Form.BexitClick(Sender: TObject);
begin
  close;
end;

procedure Tpia10803Form.FormActivate(Sender: TObject);
begin
  top := 0; left := 0;
  QRPreview1.Zoom  := 100;
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber:= 1;
  SpinEdit3.SetFocus;
  LastPage.Caption := inttostr(QRPrinter.PageCount);
end;

procedure Tpia10803Form.SpinEdit3Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value > QRPrinter.PageCount then TSpinEdit(Sender).Value := QRPrinter.PageCount;
  QRPreview1.PageNumber := TSpinEdit(Sender).Value;
end;

procedure Tpia10803Form.SpinEdit2Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
 QRPreview1.Zoom:=SpinEdit2.Value;
end;

end.
