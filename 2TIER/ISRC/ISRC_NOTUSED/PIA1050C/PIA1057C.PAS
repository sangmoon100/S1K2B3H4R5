unit Pia1057c;
interface
uses  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,  Forms, Dialogs, StdCtrls, Spin, Buttons, ExtCtrls, Quickrpt, QRPrntr;
type  Tpia1057cForm = class(TForm)    Panel1: TPanel;    Bexit: TBitBtn;    SpinEdit2: TSpinEdit;    Panel4: TPanel;    Bprint: TBitBtn;    CBox: TComboBox;    Panel3: TPanel;    LastPage: TPanel;    Panel5: TPanel;    SpinEdit3: TSpinEdit;    Panel2: TPanel;    QRPreview1: TQRPreview;//    procedure FormActivate(Sender: TObject);    procedure BexitClick(Sender: TObject);    procedure SpinEdit3Change(Sender: TObject);    procedure SpinEdit2Change(Sender: TObject);    procedure BprintClick(Sender: TObject);    procedure CBoxChange(Sender: TObject);    procedure FormShow(Sender: TObject);  private    { Private declarations }
  public    PageCnt    : integer;    insaReport : TQuickRep;    { Public declarations }  end;
var  pia1057cForm: Tpia1057cForm;
implementation
uses Pia1051c, Pia1052c, pia1053c, pia1054c, pia1055c, pia1056c;
{$R *.DFM}{
procedure Tpia1057cForm.FormActivate(Sender: TObject);var  i : integer;begin  QRPreview1.Zoom  :=100;  LastPage.Caption := inttostr(pia1051cForm.PageCnt);  Spinedit3.Value  := 1;  QRPreview1.PageNumber:= 1;  CBox.Items.Clear;  for i := 1 to 5 do    if pia1051cForm.Gu3[i] = 1 then CBox.Items.Add(inttostr(i)+' 번째 화면');    CBox.ItemIndex := pia1051cForm.PageItem;    SpinEdit3.SetFocus;end;}
procedure Tpia1057cForm.BexitClick(Sender: TObject);begin     pia1051cForm.PageSel := 6;     close;end;
procedure Tpia1057cForm.SpinEdit3Change(Sender: TObject);begin     if SpinEdit3.Text ='' then system.Exit;     SpinEdit3.Value := StrToInt(SpinEdit3.Text);     if SpinEdit3.Value = 1 then SpinEdit3.Value := 1;     if SpinEdit3.Value > PageCnt then SpinEdit3.Value := PageCnt;     QRPreview1.PageNumber := SpinEdit3.Value;end;

procedure Tpia1057cForm.SpinEdit2Change(Sender: TObject);begin     if TSpinEdit(Sender).Text ='' then system.Exit;     QRPreview1.Zoom:=SpinEdit2.Value;end;

procedure Tpia1057cForm.BprintClick(Sender: TObject);var i : integer;begin     for i := 1 to pia1051cForm.Qmas.RecordCount do     begin       if pia1051cForm.gu3[1] = 1 then       begin          pia1052cForm.insa1Report.PrinterSettings.FirstPage := i;          pia1052cForm.insa1Report.PrinterSettings.LastPage  := i;          pia1052cForm.insa1Report.Print;       end;       if pia1051cForm.gu3[2] = 1 then       begin          pia1053cForm.insa2Report.PrinterSettings.FirstPage := i;          pia1053cForm.insa2Report.PrinterSettings.LastPage  := i;          pia1053cForm.insa2Report.Print;       end;       if pia1051cForm.gu3[3] = 1 then       begin          pia1054cForm.insa3Report.PrinterSettings.FirstPage := i;          pia1054cForm.insa3Report.PrinterSettings.LastPage  := i;          pia1054cForm.insa3Report.Print;       end;       if pia1051cForm.gu3[4] = 1 then       begin          pia1055cForm.insa4Report.PrinterSettings.FirstPage := i;          pia1055cForm.insa4Report.PrinterSettings.LastPage  := i;          pia1055cForm.insa4Report.Print;       end;       if pia1051cForm.gu3[5] = 1 then       begin          pia1056cForm.insa5Report.PrinterSettings.FirstPage := i;          pia1056cForm.insa5Report.PrinterSettings.LastPage  := i;          pia1056cForm.insa5Report.Print;       end;     end;//     insaReport.print;     MessageBox(handle,'출력이 완료되었습니다 !!.','알 림',MB_OK or $0030);     SpinEdit3.SetFocus;end;

procedure Tpia1057cForm.CBoxChange(Sender: TObject);var     CaseCheck : integer;begin     CaseCheck := StrToInt(copy(Cbox.Text,1,1));     pia1051cForm.PageSel  := CaseCheck;     pia1051cForm.PageItem := CBox.ItemIndex;        case pia1051cForm.PageSel of             1 : pia1052cForm.insa1Report.Preview;
             2 : pia1053cForm.insa2Report.Preview;
             3 : pia1054cForm.insa3Report.Preview;
             4 : pia1055cForm.insa4Report.Preview;
             5 : pia1056cForm.insa5Report.Preview;
        end;     Close;end;
procedure Tpia1057cForm.FormShow(Sender: TObject);var
     i : integer;begin     QRPreview1.Zoom  :=100;     LastPage.Caption := inttostr(PageCnt);     Spinedit3.Value  := 1;     QRPreview1.PageNumber:= 1;     CBox.Items.Clear;     for i := 1 to 5 do          if pia1051cForm.Gu3[i] = 1 then CBox.Items.Add(inttostr(i)+' 번째 화면');          CBox.ItemIndex := 0;//pia1051cForm.PageItem;          SpinEdit3.SetFocus;
end;

end.
