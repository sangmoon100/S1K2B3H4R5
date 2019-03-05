program PEA1060C;

uses
  Forms,
  PeMainForm in 'PeMainForm.pas' {MainForm},
  peDm in 'peDm.pas' {DM: TDataModule},
  pea1060c1 in 'pea1060c1.pas' {Fm_sub_Form1},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  common in 'COMMON.PAS';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_sub_Form1, Fm_sub_Form1);
  Application.Run;
end.
