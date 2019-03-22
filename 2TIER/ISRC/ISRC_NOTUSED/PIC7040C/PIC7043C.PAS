unit Pic7043c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, ExtCtrls, QuickRpt, qrprntr,  Qrctrls;

type
  Tpic7043cForm = class(TForm)
    QRPreview1: TQRPreview;
    Panel1: TPanel;
    Bexit: TBitBtn;
    SpinEdit2: TSpinEdit;
    Panel4: TPanel;
    Bprint: TBitBtn;
    Panel3: TPanel;
    LastPage: TPanel;
    Panel5: TPanel;
    SpinEdit3: TSpinEdit;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pic7043cForm: Tpic7043cForm;

implementation
uses pic7041c,pic7042c;
{$R *.DFM}

procedure Tpic7043cForm.BexitClick(Sender: TObject);
begin
  close;
  pic7041cForm.helpdsr.Caption := '작업이 완료되었습니다  ..';
end;

procedure Tpic7043cForm.FormActivate(Sender: TObject);
begin
  top := 0; left := 0;
  QRPreview1.Zoom  := 100;
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber:= 1;
  LastPage.caption := inttostr(pic7042cForm.PageCnt);
  SpinEdit3.SetFocus;
end;

procedure Tpic7043cForm.SpinEdit3Change(Sender: TObject);
begin
  if TSpinEdit(Sender).Text = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value >  pic7042cForm.PageCnt then
     TSpinEdit(Sender).Value := pic7042cForm.PageCnt;
  QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
end;

procedure Tpic7043cForm.SpinEdit2Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
 QRPreview1.Zoom := SpinEdit2.Value;
end;

procedure Tpic7043cForm.BprintClick(Sender: TObject);
begin
    pic7041cForm.PrintDialog1.FromPage  := 1;
    pic7041cForm.PrintDialog1.topage    := pic7042cForm.PageCnt;
    pic7041cForm.PrintDialog1.copies    := 1;
    if  pic7041cForm.printdialog1.Execute = True  then  begin
        pic7042cForm.apprReport.printerSettings.FirstPage  := pic7041cForm.printdialog1.FromPage;
        pic7042cForm.apprReport.printerSettings.LastPage   := pic7041cForm.PrintDialog1.topage;
        pic7042cForm.apprReport.PrinterSettings.Copies     := pic7041cForm.printdialog1.Copies;
        pic7042cForm.apprReport.Print;
     end;
       SpinEdit2.SetFocus;
  MessageBox(handle,'출력이 완료되었습니다 !!.','확 인',MB_OK or $0030);
end;

procedure Tpic7043cForm.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  top := 0; left := 0;
  QRPreview1.Zoom  := 100;
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber:= 1;
  LastPage.caption := inttostr(pic7042cForm.PageCnt);
  SpinEdit3.SetFocus;
end;



end.
