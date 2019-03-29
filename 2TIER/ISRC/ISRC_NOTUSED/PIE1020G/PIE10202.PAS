unit pie10202;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  TFpie10202 = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Bprint: TBitBtn;
    QRPreview1: TQRPreview;
    Panel2: TPanel;
    Ltotpage: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpie10202: TFpie10202;

implementation
{$R *.DFM}

uses  e1020g, Pie10201;

procedure TFpie10202.FormActivate(Sender: TObject);
begin
  QRPreview1.Zoom :=100;
  Ltotpage.Caption := IntToStr(Fpie10201.QuickReport1.PageCount);
  Spinedit1.Value := 1;
  Spinedit2.Value := 100;
  QRPreview1.PageNumber:= 1;
  Bprint.SetFocus;
end;

procedure TFpie10202.SpinEdit1Change(Sender: TObject);
begin
     if TSpinEdit(Sender).Value > Fpie10201.QuickReport1.PageCount then
        TSpinEdit(Sender).Value := Fpie10201.QuickReport1.PageCount;

     QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
end;

procedure TFpie10202.SpinEdit2Change(Sender: TObject);
begin
     QRPreview1.Zoom:=SpinEdit2.Value;
end;

procedure TFpie10202.BprintClick(Sender: TObject);
begin
     Fpie10201.QuickReport1.Print;
     Bprint.SetFocus;
end;

procedure TFpie10202.BexitClick(Sender: TObject);
begin
     close;
end;

end.
