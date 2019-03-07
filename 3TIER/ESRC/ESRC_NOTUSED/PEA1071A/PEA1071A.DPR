program PEA1071A;

uses
  Forms,
  PEA1071A1 in 'PEA1071A1.pas' {FM_Main},
  UEmpForm in 'UEMPFORM.PAS' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '최종평가결과Feedback';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
