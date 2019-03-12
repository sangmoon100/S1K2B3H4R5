program PSA3220A;

uses
  Forms,
  Psa32201 in 'Psa32201.pas' {PSA3220},
  Psa32202 in 'Psa32202.pas' {PSA3221};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 대출지급등록';
  Application.CreateForm(TPSA3220, PSA3220);
  Application.CreateForm(TPSA3221, PSA3221);
  Application.Run;
end.
