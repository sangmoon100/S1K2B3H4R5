program PEF1030A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  UDown_Value1 in 'UDown_Value1.pas' {FDown_Value1},
  RenewForm in 'RenewForm.pas' {FM_RenewForm},
  UDown_Sub1 in 'UDOWN_SUB1.PAS' {FDown_Sub1},
  HSubForm in 'HSubForm.pas' {FM_Sub},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'À°¼ºÆò°¡';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TFDown_Sub1, FDown_Sub1);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
