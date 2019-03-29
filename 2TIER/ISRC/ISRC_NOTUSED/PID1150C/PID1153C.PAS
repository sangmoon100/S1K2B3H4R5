unit pid1153c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  Tpid1153cForm = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pid1153cForm: Tpid1153cForm;

implementation
uses pid1152c;
{$R *.DFM}

procedure Tpid1153cForm.FormActivate(Sender: TObject);
begin
  top := 0; left := 0;
  QRPreview1.Zoom  := 100;
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber:= 1;
  SpinEdit3.SetFocus;
  LastPage.Caption := inttostr(pid1152cForm.PageCnt);
end;

procedure Tpid1153cForm.BexitClick(Sender: TObject);
begin
  close;
end;

procedure Tpid1153cForm.BprintClick(Sender: TObject);
begin
  pid1152cForm.ingoRpt.Print;
  SpinEdit2.SetFocus;
  MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
end;

procedure Tpid1153cForm.SpinEdit3Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value > pid1152cForm.PageCnt then TSpinEdit(Sender).Value := pid1152cForm.PageCnt;
  QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
end;

procedure Tpid1153cForm.SpinEdit2Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
 QRPreview1.Zoom:=SpinEdit2.Value;
end;

end.
