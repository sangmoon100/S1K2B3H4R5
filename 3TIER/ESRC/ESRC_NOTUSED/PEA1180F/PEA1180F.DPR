program PEA1180F;

uses
  Forms,
  PEA1180F1 in 'PEA1180F1.pas' {FM_Main},
  UDeptForm in 'UDeptForm.pas' {TeamForm},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀별 직무역량 등록';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
