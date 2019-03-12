program PET3020A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  UDown_Value1 in 'UDown_Value1.pas' {FDown_Value1},
  UDown_Value2 in 'UDown_Value2.pas' {FDown_Value2},
  UFM_Marks in 'UFM_Marks.pas' {FM_Marks},
  HMainForm2 in 'HMainForm2.pas' {FM_Main2},
  RenewForm in 'RenewForm.pas' {FM_RenewForm},
  UDown_Sub1 in 'UDOWN_SUB1.PAS' {FDown_Sub1},
  UDown_Sub2 in 'UDOWN_SUB2.PAS' {FDown_Sub2},
  HSubForm in 'HSubForm.pas' {FM_Sub},
  UOpinon2 in 'UOpinon2.pas' {Form2},
  UOpinon in 'UOpinon.pas' {Form1},
  UPrintForm2 in 'UPrintForm2.pas' {PrintForm2},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UPrnview in 'UPRNVIEW.PAS' {Fm_PreviewForm},
  UPrintForm1 in 'UPrintForm1.pas' {PrintForm1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '상사평가';
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TPrintForm1, PrintForm1);
  Application.Run;
end.
