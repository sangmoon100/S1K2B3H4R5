program PTA3080A;

uses
  Forms,
  PTA30801 in 'PTA30801.PAS' {MainForm},
  PTA30802 in 'PTA30802.PAS' {TeamForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '교육이수 팀 KPI 조회 권한관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.Run;
end.
