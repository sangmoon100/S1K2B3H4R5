program Psc2040a;

uses
  Forms,
  psc20401 in 'psc20401.pas' {MainForm},
  psc20402 in 'psc20402.pas' {DetailForm},
  psc20403 in 'psc20403.pas' {ChartForm},
  empno in 'empno.pas' {EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 인출 신청 및 보유현황(PSC2040A)';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
