program pef2030a;

uses
  Forms,
  pef2030a1 in 'PEF2030A1.PAS' {MainForm},
  pef2030a2 in 'PEF2030A2.PAS' {Fm_Sub1},
  pef2030a3 in 'PEF2030A3.PAS' {Fm_Sub2},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '특정직 평가';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_Sub1, Fm_Sub1);
  Application.CreateForm(TFm_Sub2, Fm_Sub2);
  Application.Run;
end.
