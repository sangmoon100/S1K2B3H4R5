program PEF3020A;

uses
  Forms,
  PEF3020A1 in 'PEF3020A1.PAS' {MainForm},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견직 평가';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.Run;
end.
