program PEA1170F;

uses
  Forms,
  PEA1170F1 in 'PEA1170F1.pas' {FM_Main},
  PEA1170F3 in 'PEA1170F3.pas' {JikmuForm},
  PEA1170F2 in 'PEA1170F2.pas' {TeamForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀별 직무역량 등록';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TJikmuForm, JikmuForm);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.Run;
end.

