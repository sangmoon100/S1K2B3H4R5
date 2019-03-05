program PEA1060F;

uses
  Forms,
  PeMainForm in 'PeMainForm.pas' {MainForm},
  peDm in 'peDm.pas' {DM: TDataModule},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  common in 'COMMON.PAS',
  PEA1060C2 in 'PEA1060C2.PAS' {FM_TARGET};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFM_TARGET, FM_TARGET);
  Application.Run;
end.
