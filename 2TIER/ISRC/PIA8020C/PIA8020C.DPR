program PIA8020C;

uses
  Forms,
  PIA80201 in 'PIA80201.pas' {MainForm},
  PIA80202 in 'PIA80202.pas' {PrintForm},
  PIA80203 in 'PIA80203.pas' {PrintForm2};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '부서/BAND별 조합원현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TPrintForm2, PrintForm2);
  Application.Run;
end.
