program PEA1072A;

uses
  Forms,
  PEA1072A1 in 'PEA1072A1.pas' {FM_Main},
  UEmpForm in 'UEMPFORM.PAS' {Fm_EmpForm},
  PEA1072A2 in 'PEA1072A2.pas' {CodeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '최종평가결과Feedback';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
