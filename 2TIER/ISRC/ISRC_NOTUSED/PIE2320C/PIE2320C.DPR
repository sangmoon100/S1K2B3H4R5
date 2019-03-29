program PIE2320C;

uses
  Forms,
  PIE23201 in 'PIE23201.pas' {MainForm},
  PIE23207 in 'PIE23207.pas' {NewPrintForm},
  PIE23203 in 'PIE23203.pas' {PreViewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '부서/직종별 인원현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNewPrintForm, NewPrintForm);
  Application.CreateForm(TPreViewForm, PreViewForm);
  Application.Run;
end.
