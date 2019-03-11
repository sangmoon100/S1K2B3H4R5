program PEF4020A;

uses
  Forms,
  PEF4020A1 in 'PEF4020A1.PAS' {MainForm},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '평가 점수등록';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
