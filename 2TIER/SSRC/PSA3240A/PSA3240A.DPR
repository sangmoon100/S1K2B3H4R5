program PSA3240A;

uses
  Forms,
  Psa32401 in 'Psa32401.pas' {Fpsa32401},
  Psa32402 in 'Psa32402.pas' {Fpsa32402},
  Psa32403 in 'Psa32403.pas' {Fpsa32403};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 대출금상환등록';
  Application.CreateForm(TFpsa32401, Fpsa32401);
  Application.CreateForm(TFpsa32402, Fpsa32402);
  Application.CreateForm(TFpsa32403, Fpsa32403);
  Application.Run;
end.
