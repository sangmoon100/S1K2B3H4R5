unit Psa30704;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, ExtCtrls, qrprntr, quickrpt, Qrctrls;

type
  TFpsa30704 = class(TForm)
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    BBztf: TBitBtn;
    BBztw: TBitBtn;
    BBprint: TBitBtn;
    BBclose: TBitBtn;
    BBsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QRPreview1: TQRPreview;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QRLtot: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BBztfClick(Sender: TObject);
    procedure BBztwClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpsa30704: TFpsa30704;

implementation

uses psa30701, psa30702;
{$R *.DFM}

procedure TFpsa30704.FormActivate(Sender: TObject);
begin
     QRLtot.Caption := IntToStr(QRPreview1.QRPrinter.PageCount);
     SpinEdit1.MaxValue := QRPreview1.QRPrinter.PageCount;
     SpinEdit1.MinValue := 1;
     SpinEdit1.Value := 1;
     QRPreview1.Zoom := 100;
     SpinEdit2.Value := 100;
     UpdateWindow(QRPreview1.Handle);
     Application.ProcessMessages;
end;

procedure TFpsa30704.SpinEdit1Change(Sender: TObject);
begin
     If SpinEdit1.Value <= 0 then begin
       SpinEdit1.Value := 1;
       Exit;
     end;
     If SpinEdit1.Value > strtoint(QRLtot.Caption) then
        SpinEdit1.Value := strtoint(QRLtot.Caption);
     QRPreview1.PageNumber := SpinEdit1.Value;
end;

procedure TFpsa30704.SpinEdit2Change(Sender: TObject);
begin
     If SpinEdit2.Value <= 0  then Exit;
     QRPreview1.Zoom := SpinEdit2.Value;
end;

procedure TFpsa30704.BBztfClick(Sender: TObject);
begin
     QRPreview1.ZoomToFit;
     SpinEdit2.Value := QRPreview1.Zoom;
end;

procedure TFpsa30704.BBztwClick(Sender: TObject);
begin
     QRPreview1.ZoomToWidth;
     SpinEdit2.Value := QRPreview1.Zoom;
end;

procedure TFpsa30704.BBprintClick(Sender: TObject);
begin
  Fpsa30701.PrintDialog1.MaxPage := SpinEdit1.MaxValue;
  with Fpsa30702.QuickReport1 do begin
    PrinterSettings.Copies := 1;
    PrinterSettings.FirstPage := 0;
    PrinterSettings.LastPage := 0;
  end;

  if Fpsa30701.PrintDialog1.Execute then begin
    with Fpsa30702.QuickReport1 do begin
      PrinterSettings.Copies := Fpsa30701.PrintDialog1.Copies;
      PrinterSettings.FirstPage := Fpsa30701.PrintDialog1.FromPage;
      PrinterSettings.LastPage := Fpsa30701.PrintDialog1.ToPage;
    end;
    Application.ProcessMessages;
    Fpsa30702.QuickReport1.Print;
  end;
end;

procedure TFpsa30704.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure TFpsa30704.BBcloseClick(Sender: TObject);
begin
  Fpsa30701.Phelpmsg.Caption := '  추출/출력작업이 완료되었습니다.';
  SendMessage(Fpsa30701.Phelpmsg.Handle, WM_Paint , 0, 0);
  Close;
end;
end.
