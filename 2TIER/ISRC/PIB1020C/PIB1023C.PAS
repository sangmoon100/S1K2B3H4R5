unit pib1023c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, ExtCtrls, QRPrntr, QuickRpt;

type
  Tpib1023cForm = class(TForm)
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
    Cbox: TComboBox;
    Panel2: TPanel;
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure BprintClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure CboxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    photopreview  : TQuickRep;
  end;

var
  pib1023cForm: Tpib1023cForm;

implementation

uses pib1021c, pib1022c;
{$R *.DFM}

procedure Tpib1023cForm.SpinEdit3Change(Sender: TObject);
begin
  if TSpinEdit(Sender).Text = '' then system.Exit;
  if TSpinEdit(Sender).Value = 1 then TSpinEdit(Sender).Value := 1;
  if TSpinEdit(Sender).Value > QRPrinter.PageCount then
     TSpinEdit(Sender).Value := QRPrinter.PageCount;
  QRPreview1.PageNumber:=TSpinEdit(Sender).Value;
end;

procedure Tpib1023cForm.SpinEdit2Change(Sender: TObject);
begin
 if TSpinEdit(Sender).Text = '' then system.Exit;
 QRPreview1.Zoom:=SpinEdit2.Value;
end;

procedure Tpib1023cForm.BprintClick(Sender: TObject);
begin
  pib1021cForm.PhotoReport.Print;
  MessageBox(handle,'출력이 완료되었습니다 !!.','알 림',MB_OK or $0030);
  SpinEdit3.SetFocus;
end;

procedure Tpib1023cForm.BexitClick(Sender: TObject);
begin
  pib1021cForm.mSel   := False;
  pib1021cForm.Gauge1.Progress := 0;
  close;
end;

procedure Tpib1023cForm.CboxChange(Sender: TObject);
begin
  pib1021cForm.sgubun := strtoint(copy(cbox.Text,1,1));
  pib1021cForm.mSel   := True;
  close;
  pib1021cForm.check5.Checked := True;
  pib1021cForm.Bscreen.Click;
end;

procedure Tpib1023cForm.FormShow(Sender: TObject);
begin
  QRPreview1.Zoom:=100;
  LastPage.Caption := inttostr(QRPrinter.PageCount);
  Spinedit3.Value  := 1;
  QRPreview1.PageNumber := 1;

  if pib1021cForm.FormGu = 3 then
  begin
     Cbox.Enabled := True;
     if pib1021cForm.sgubun = 1 then
        Cbox.ItemIndex := 0
     else Cbox.ItemIndex := 1;
  end
  else Cbox.Enabled := False;
  SpinEdit3.SetFocus;
end;

end.
