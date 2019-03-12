program PSC2040A;

uses
  Forms,
  PSC20401 in 'PSC20401.PAS' {MainForm},
  psc20402 in 'PSC20402.PAS' {DetailForm},
  PSC20403 in 'PSC20403.PAS' {ChartForm};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 보유현황 및 인출 신청';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
