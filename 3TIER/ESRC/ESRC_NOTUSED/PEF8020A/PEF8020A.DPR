program PEF8020A;

uses
  Forms,
  PEA8020A1 in 'PEA8020A1.pas' {FM_Main},
  UDeptForm in 'UDeptForm.pas' {TeamForm},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '직무역량 우선순위 등록/결재';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
