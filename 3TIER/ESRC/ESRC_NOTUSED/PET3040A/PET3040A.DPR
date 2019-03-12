program PET3040A;

uses
  Forms,
  Hinsa_TmaxDM in 'HINSA_TMAXDM.PAS' {DataModule_Tmax: TDataModule},
  HMainForm in 'HMAINFORM.PAS' {FM_Main},
  HMainForm2 in 'HMAINFORM2.PAS' {FM_Main2},
  HSubForm in 'HSubForm.pas' {FM_Sub},
  RenewForm in 'RENEWFORM.PAS' {FM_RenewForm},
  UDown_Sub1 in 'UDOWN_SUB1.PAS' {FDown_Sub1},
  UDown_Sub2 in 'UDOWN_SUB2.PAS' {FDown_Sub2},
  UDown_Value1 in 'UDOWN_VALUE1.PAS' {FDown_Value1},
  UDown_Value2 in 'UDOWN_VALUE2.PAS' {FDown_Value2},
  UFM_Marks in 'UFM_MARKS.PAS' {FM_Marks},
  UOpinon in 'UOPINON.PAS' {Form1},
  UOpinon2 in 'UOPINON2.PAS' {Form2},
  UPrintForm in 'UPRINTFORM.PAS' {PrintForm},
  UPrintForm1 in 'UPRINTFORM1.PAS' {PrintForm1},
  UPrintForm2 in 'UPRINTFORM2.PAS' {PrintForm2},
  UPrnview in 'UPRNVIEW.PAS' {Fm_PreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '상사평가';
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.Run;
end.
