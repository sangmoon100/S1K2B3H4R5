program PET2030A;

uses
  Forms,
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  HMainForm in 'HMainForm.pas' {FM_Main},
  HSubForm in 'HSubForm.pas' {FM_Sub},
  UDown_Sub1 in 'UDOWN_SUB1.PAS' {FDown_Sub1},
  UDown_Value1 in 'UDown_Value1.pas' {FDown_Value1},
  UOpinon in 'UOpinon.pas' {Form1},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UPrnview in 'UPRNVIEW.PAS' {Fm_PreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '상사평가';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.Run;
end.
