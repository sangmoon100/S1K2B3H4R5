program PEF8030A;

uses
  Forms,
  PEF8030A3 in 'PEF8030A3.PAS' {FM_Sub},
  UDeptForm in 'UDeptForm.pas' {TeamForm},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  pef8030a2 in 'pef8030a2.pas' {PrintForm1},
  PEF8030A1 in 'PEF8030A1.PAS' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TTeamForm, TeamForm);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TPrintForm1, PrintForm1);
  Application.Run;
end.
