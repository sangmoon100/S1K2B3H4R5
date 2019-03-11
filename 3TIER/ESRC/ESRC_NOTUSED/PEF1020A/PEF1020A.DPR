program PEF1020A;

uses
  Forms,
  Hinsa_TmaxDM in 'Hinsa_TmaxDM.pas' {DataModule_Tmax: TDataModule},
  UHperson in 'UHperson.pas' {FHperson},
  UUPMain in 'UUPMain.pas' {FUPMain},
  UColForm in 'UCOLFORM.PAS' {ColForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '육성평가 점수등록';
  Application.CreateForm(TFUPMain, FUPMain);
  Application.CreateForm(TDataModule_Tmax, DataModule_Tmax);
  Application.CreateForm(TFHperson, FHperson);
  Application.CreateForm(TColForm, ColForm);
  Application.Run;
end.
