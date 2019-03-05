program Pea1060a;

uses
  Forms,
  PeMainForm in 'PeMainForm.pas' {MainForm},
  peDm in 'peDm.pas' {DM: TDataModule},
  pea1060a6 in 'pea1060a6.pas' {Fm_SubForm1},
  pea1060a2 in 'pea1060a2.pas' {Fm_DestValue},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  pea1060a5 in 'pea1060a5.pas' {PrintForm1},
  pea1060b3 in 'pea1060b3.pas' {sub_Form3},
  common in 'COMMON.PAS',
  pea1060a3 in 'PEA1060A3.PAS' {PrintForm},
  pea1060a1 in 'PEA1060A1.PAS' {Fm_SubForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(Tsub_Form3, sub_Form3);
  Application.CreateForm(TPrintForm1, PrintForm1);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
