unit Pib41003;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, ExtCtrls, Buttons, QRPrntr;

type
  TFpib41003 = class(TForm)
    Panel1: TPanel;
    SEpage: TSpinEdit;
    SEview: TSpinEdit;
    QRPreview1: TQRPreview;
    BTprint: TBitBtn;
    BTclose: TBitBtn;
    Panel2: TPanel;
    Ltotpage: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure BTcloseClick(Sender: TObject);
    procedure SEpageChange(Sender: TObject);
    procedure SEviewChange(Sender: TObject);
    procedure BTprintClick(Sender: TObject);
  private
    { Private declarations }
    AReport : TQuickRep;
  public
    { Public declarations }
  end;

var
  Fpib41003: TFpib41003;

implementation

{$R *.DFM}
uses pib41001, pib41002;

procedure TFpib41003.FormActivate(Sender: TObject);
begin
     LTotpage.Caption := IntToStr(QRPrinter.PageCount);
     SEpage.MaxValue := QRPrinter.PageCount;
     SEpage.Value := 1;
     SEview.Value := 100;
     BTprint.Setfocus;
     AReport := Fpib41002.QReport;
end;

procedure TFpib41003.BTcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFpib41003.SEpageChange(Sender: TObject);
begin
     if SEpage.Value <= SEpage.MinValue then
        SEpage.Value := SEpage.MinValue;
     if SEpage.Value >= QRPrinter.PageCount then
        SEpage.Value := QRPrinter.PageCount;
     QRPreview1.PageNumber := SEpage.Value;
end;

procedure TFpib41003.SEviewChange(Sender: TObject);
begin
     if SEview.Value <= SEview.MinValue then
        SEview.Value := SEview.MinValue;
     if SEview.Value >= SEview.MaxValue then
        SEview.Value := SEview.MaxValue;
     QRPreview1.Zoom := SEview.Value;
end;

procedure TFpib41003.BTprintClick(Sender: TObject);
begin
     AReport.Print;
     ShowMessage('출력이 완료되었습니다 !!!');
     System.Exit;
end;

end.
