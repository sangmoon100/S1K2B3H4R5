program Pie2050c;

uses
  Forms,
  pie20504 in 'pie20504.pas',
  pie20502 in 'pie20502.pas' {PrintForm},
  pie20505 in 'PIE20505.PAS' {NewPrintForm},
  pie20501 in 'pie20501.pas' {MainForm},
  PIE20506 in 'PIE20506.PAS' {NewPrintForm2};

{$R *.RES}

begin
  Application.Title := '부서/BAND별 인원 상세 현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TNewPrintForm, NewPrintForm);
  Application.CreateForm(TNewPrintForm2, NewPrintForm2);
  Application.Run;
end.
