program PIB3010A;

uses
  Forms,
  PIB30100 in 'PIB30100.pas' {FM_Main},
  PIB3010A_emp in 'PIB3010A_emp.pas' {FM_empno},
  PrintView in 'PrintView.PAS' {ViewForm},
  Pib30103 in 'Pib30103.pas' {Fm_Pib30103},
  PIB30104 in 'PIB30104.pas' {Fm_Pib30104},
  PIB30101 in 'PIB30101.PAS' {Fm_Pib30101},
  Pib30102 in 'PIB30102.PAS' {Fm_Pib30102},
  inform in 'inform.pas' {LoginForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '제증명 발급 신청 및 출력';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_empno, FM_empno);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.Run;
end.
