program PED1020D;

uses
  Forms,
  HSubForm in 'HSubForm.pas' {FM_Sub},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule};
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀장 상향평가';
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.Run;
end.
