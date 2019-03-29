unit Pie20602;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Quickrpt, StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr;

type
  TFpie20602 = class(TForm)
    Panel1: TPanel;
    Bexit: TBitBtn;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Bprint: TBitBtn;
    QRPreview1: TQRPreview;
    Panel2: TPanel;
    LTotpage: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
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
  Fpie20602: TFpie20602;

implementation
{$R *.DFM}

uses  E2060c, Pie20601, Pie20603;

procedure TFpie20602.FormActivate(Sender: TObject);
begin
     QRPreview1.Zoom:=100;
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
{  if Fpie2060c.YearCheck = 'Old' then      //  1999년 1월 이전 자료에 대한 처리
       Ltotpage.Caption := IntToStr(Fpie20601.QuickReport1.PageCount)
  else}
//   Ltotpage.Caption := IntToStr(Fpie20603.QuickReport1.PageCount);
     Spinedit1.Value := 1;
     Spinedit2.Value := 100;
     QRPreview1.PageNumber:= 1;
     Bprint.SetFocus;
end;

procedure TFpie20602.SpinEdit1Change(Sender: TObject);
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
{  if Fpie2060c.YearCheck = 'Old' then  begin    //  1999년 1월 이전 자료에 대한 처리
     if TSpinEdit(Sender).Value > Fpie20601.QuickReport1.PageCount then
        TSpinEdit(Sender).Value := Fpie20601.QuickReport1.PageCount;
  end else begin
     if TSpinEdit(Sender).Value > Fpie20603.QuickReport1.PageCount then
        TSpinEdit(Sender).Value := Fpie20603.QuickReport1.PageCount;
  end;
     QRPreview1.PageNumber := TSpinEdit(Sender).Value;}
end;

procedure TFpie20602.SpinEdit2Change(Sender: TObject);
begin
     QRPreview1.Zoom:=SpinEdit2.Value;
end;

procedure TFpie20602.BprintClick(Sender: TObject);
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1999.01.05  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
  if Fpie2060c.YearCheck = 'Old' then      //  1999년 1월 이전 자료에 대한 처리
//       Fpie20601.QuickReport1.Print
  else Fpie20603.QuickReport1.Print;
     ShowMessage('출력이 완료되었습니다.');
     Bprint.SetFocus;
end;

procedure TFpie20602.BexitClick(Sender: TObject);
begin
     close;
end;

end.
