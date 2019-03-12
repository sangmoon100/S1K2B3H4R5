program PSA3210G;

uses
  Forms,
  Psa32101 in 'Psa32101.pas' {Fpsa32101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내복지기금 대출상환급여 이체';
  Application.CreateForm(TFpsa32101, Fpsa32101);
  Application.Run;
end.
