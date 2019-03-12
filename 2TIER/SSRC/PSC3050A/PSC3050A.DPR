program psc3050a;

uses
  Forms,
  psc30501 in 'psc30501.pas' {MainForm},
  psc30503 in 'psc30503.pas' {EmpForm},
  psc30504 in 'psc30504.pas' {EmpForm_ADD};

{$R *.RES}

begin
  Application.Title := '상환 특이자 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TEmpForm_ADD, EmpForm_ADD);
  Application.Run;
end.
