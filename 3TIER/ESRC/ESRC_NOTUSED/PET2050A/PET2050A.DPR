program PET2050A;

uses
  Forms,
  PET2050A1 in 'PET2050A1.pas' {FM_Main},
  UEMPFORM in 'UEMPFORM.PAS' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '무기계약직 평가결과 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
