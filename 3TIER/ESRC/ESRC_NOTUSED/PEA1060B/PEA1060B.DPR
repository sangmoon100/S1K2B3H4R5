program PEA1060B;

uses
  Forms,
  PeMainForm in 'PeMainForm.pas' {MainForm},
  peDm in 'peDm.pas' {DM: TDataModule},
  pea1060a1 in 'pea1060a1.pas' {Fm_SubForm},
  pea1060a2 in 'pea1060a2.pas' {Fm_DestValue},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  pea1060a3 in 'pea1060a3.pas' {PrintForm},
  common in 'COMMON.PAS',
  pea1060b1 in 'pea1060b1.pas' {Fm_sub_Form1},
  pea1060b2 in 'pea1060b2.pas' {Fm_sub_Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_sub_Form1, Fm_sub_Form1);
  Application.CreateForm(TFm_sub_Form2, Fm_sub_Form2);
  Application.Run;
end.
