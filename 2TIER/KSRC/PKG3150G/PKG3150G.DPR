program pkg3150g;

uses
  Forms,
  pkg31501 in 'pkg31501.pas' {MainForm},
  pkg31504 in 'pkg31504.pas' {Form1},
  pkg31503 in 'pkg31503.pas' {DM: TDataModule},
  pkg31505 in 'pkg31505.pas' {Form2},
  pkg31507 in 'pkg31507.pas' {Form3},
  pkg31508 in 'pkg31508.pas' {QuickReport1: TQuickRep},
  pkg31509 in 'pkg31509.pas' {QuickReport2: TQuickRep},
  PKG3150a in 'pkg3150a.pas' {Form4};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무 일괄 등록/결재';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.CreateForm(TQuickReport2, QuickReport2);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
