program PEA1073A;

uses
  Forms,
  PEA1073A1 in 'PEA1073A1.pas' {FM_Main},
  UEMPFORM in 'UEMPFORM.PAS' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '최종평가결과Feedback';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
