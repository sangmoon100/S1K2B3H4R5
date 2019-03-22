unit pic70203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  qrprntr, StdCtrls, Buttons, Spin, ExtCtrls,Quickrpt;

type
  Tpreview = class(TForm)
    Panel1: TPanel;
    SEpage: TSpinEdit;
    SEview: TSpinEdit;
    BTprint: TBitBtn;
    BTclose: TBitBtn;
    Panel2: TPanel;
    Ltotpage: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    QRPreview1: TQRPreview;
    procedure BTprintClick(Sender: TObject);
    procedure BTcloseClick(Sender: TObject);
    procedure SEpageChange(Sender: TObject);
    procedure SEviewChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
     AReport : TQuickRep;
  public
    { Public declarations }
  end;

var
  preview: Tpreview;

implementation

uses pic70202, pic70201;

{$R *.DFM}

procedure Tpreview.BTprintClick(Sender: TObject);
begin
    pic7020gForm.PrintDialog1.FromPage  := 1;
    pic7020gForm.PrintDialog1.topage    := printForm.Pagecount;
    pic7020gForm.PrintDialog1.copies    := 1;
    if  pic7020gForm.printdialog1.Execute = True  then  begin
        printForm.Qremd.printerSettings.FirstPage  := pic7020gForm.printdialog1.FromPage;
        printForm.Qremd.printerSettings.LastPage   := pic7020gForm.PrintDialog1.topage;
        printForm.Qremd.PrinterSettings.Copies     := pic7020gForm.printdialog1.Copies;
        printForm.Qremd.Print;
     end;
     ShowMessage('출력이 완료되었습니다 !!!');
     pic7020gForm.p_help.caption := '작업이 완료되었습니다!!.';
     System.Exit;
end;

procedure Tpreview.BTcloseClick(Sender: TObject);
begin
    close;
end;

procedure Tpreview.SEpageChange(Sender: TObject);
begin
     if SEpage.Value <= SEpage.MinValue then
        SEpage.Value := SEpage.MinValue;
     if SEpage.Value >= printform.PageCount then
        SEpage.Value := printform.PageCount;
     QRPreview1.PageNumber := SEpage.Value;
end;

procedure Tpreview.SEviewChange(Sender: TObject);
begin
     if SEview.Value <= SEview.MinValue then
        SEview.Value := SEview.MinValue;
     if SEview.Value >= SEview.MaxValue then
        SEview.Value := SEview.MaxValue;
     QRPreview1.Zoom := SEview.Value;
end;

procedure Tpreview.FormActivate(Sender: TObject);
begin
     LTotpage.Caption := IntToStr(printform.PageCount);
     SEpage.MaxValue := printform.PageCount;
     SEpage.Value := 1;
     SEview.Value := 100;
     BTprint.Setfocus;
     AReport := printform.Qremd;
end;

end.
