program PTA3040A;

uses
  Forms,
  PTA30401 in 'PTA30401.PAS' {MainForm},
  PTA30402 in 'PTA30402.PAS' {CForm},
  PTA30403 in 'PTA30403.PAS' {TeamForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point 기준관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCForm, CForm);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.Run;
end.
