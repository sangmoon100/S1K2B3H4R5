program PSA3210A;

uses
  Forms,
  PSA32101 in 'PSA32101.PAS' {PSA3210},
  PSA32102 in 'PSA32102.PAS' {CodeForm};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 대출 신청';
  Application.CreateForm(TPSA3210, PSA3210);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.Run;
end.
