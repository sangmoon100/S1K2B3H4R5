program PED1020C;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  HMainForm1 in 'HMainForm1.pas' {FM_Main1},
  HSubForm in 'HSubForm.pas' {FM_Sub},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  RenewForm in 'RenewForm.pas' {FM_RenewForm},
  UOpinon in 'UOPINON.PAS' {Form1},
  UPrintForm1 in 'UPrintForm1.pas' {PrintForm1},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UPrnview in 'UPRNVIEW.PAS' {Fm_PreviewForm};
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀장상사평가';
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TPrintForm1, PrintForm1);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TFm_PreviewForm, Fm_PreviewForm);
  Application.Run;
end.
