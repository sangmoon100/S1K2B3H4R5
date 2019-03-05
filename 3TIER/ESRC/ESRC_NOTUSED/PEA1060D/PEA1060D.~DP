program PEA1060D;

uses
  Forms,
  PeMainForm in 'PeMainForm.pas' {MainForm},
  peDm in 'peDm.pas' {DM: TDataModule},
  pea1060a1 in 'pea1060a1.pas' {Fm_SubForm},
  pea1060a2 in 'pea1060a2.pas' {Fm_DestValue},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  common in 'COMMON.PAS',
  PEA1060B1 in 'PEA1060B1.PAS' {Fm_sub_Form1},
  PEA1060A4 in 'PEA1060A4.PAS' {Sub_Form4},
  pea1060b3 in 'pea1060b3.pas' {sub_Form3},
  pea1060a3 in 'pea1060a3.pas' {PrintForm},
  pea1060a6 in 'pea1060a6.pas' {PrintForm2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 업무목표 등록/결재';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSub_Form4, Sub_Form4);
  Application.CreateForm(Tsub_Form3, sub_Form3);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TPrintForm2, PrintForm2);
  Application.Run;
end.
