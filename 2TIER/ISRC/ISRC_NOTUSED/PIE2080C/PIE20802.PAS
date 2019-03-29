unit Pie20802;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  TFpie20802 = class(TForm)
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
  Fpie20802: TFpie20802;

implementation
{$R *.DFM}

uses  e2080c,Pie20801,Pie20803,Pie20804,Pie20805, pie20806, pie20807,
  pie20808, pie20809;

procedure TFpie20802.FormActivate(Sender: TObject);
begin
     QRPreview1.Zoom :=100;

{  if Fpie2080c.YearCheck = 'Old' then begin     //  1999년 1월 이전 자료에 대한 처리
     if e2080c.gubunby = 1 then
        Ltotpage.Caption := IntToStr(Fpie20801.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 2 then
        Ltotpage.Caption := IntToStr(Fpie20803.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 3 then
        Ltotpage.Caption := IntToStr(Fpie20804.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 4 then
        Ltotpage.Caption := IntToStr(Fpie20805.QuickReport1.PageCount);
  end else begin
     if e2080c.gubunby = 1 then
        Ltotpage.Caption := IntToStr(Fpie20806.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 2 then
        Ltotpage.Caption := IntToStr(Fpie20807.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 3 then
        Ltotpage.Caption := IntToStr(Fpie20808.QuickReport1.PageCount)
     else
     if e2080c.gubunby = 4 then
        Ltotpage.Caption := IntToStr(Fpie20809.QuickReport1.PageCount);
  end;                    }
     Spinedit1.Value := 1;
     Spinedit2.Value := 100;
     QRPreview1.PageNumber:= 1;
     Bprint.SetFocus;
end;

procedure TFpie20802.SpinEdit1Change(Sender: TObject);
begin
{     if e2080c.gubunby = 1 then begin
        TSpinEdit(Sender).Value := Fpie20801.QuickReport1.PageCount;
        end
     else
     if e2080c.gubunby = 2 then begin
        TSpinEdit(Sender).Value := Fpie20803.QuickReport1.PageCount;
        end
     else
     if e2080c.gubunby = 3 then begin
        TSpinEdit(Sender).Value := Fpie20804.QuickReport1.PageCount;
        end
     else
     if e2080c.gubunby = 4 then begin
        TSpinEdit(Sender).Value := Fpie20805.QuickReport1.PageCount;
        end;

  QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
    { if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
     QRPreview1.PageNumber:=TSpinEdit(Sender).Value;}
end;

procedure TFpie20802.SpinEdit2Change(Sender: TObject);
begin
     QRPreview1.Zoom:=SpinEdit2.Value;
end;

procedure TFpie20802.BprintClick(Sender: TObject);
begin
  if Fpie2080c.YearCheck = 'Old' then begin      //  1999년 1월 이전 자료에 대한 처리
     if e2080c.gubunby = 1 then
//        Fpie20801.QuickReport1.Print
     else
     if e2080c.gubunby = 2 then
        Fpie20803.QuickReport1.Print
     else
     if e2080c.gubunby = 3 then
        Fpie20804.QuickReport1.Print
     else
     if e2080c.gubunby = 4 then
        Fpie20805.QuickReport1.Print;
  end else begin
     if e2080c.gubunby = 1 then
        Fpie20806.QuickReport1.Print
     else
     if e2080c.gubunby = 2 then
        Fpie20807.QuickReport1.Print
     else
     if e2080c.gubunby = 3 then
        Fpie20808.QuickReport1.Print
     else
     if e2080c.gubunby = 4 then
        Fpie20809.QuickReport1.Print;
 end;
     showmessage('출력이 완료되었습니다.');
     Bprint.SetFocus;
end;

procedure TFpie20802.BexitClick(Sender: TObject);
begin
     close;
end;

end.
