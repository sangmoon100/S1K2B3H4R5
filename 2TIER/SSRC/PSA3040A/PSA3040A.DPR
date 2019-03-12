program PSA3040A;

uses
  Forms,
  Psa30401 in 'Psa30401.pas' {Fpsa30401},
  Psa30402 in 'Psa30402.pas' {Fpsa30402},
  Psa30403 in 'Psa30403.pas' {Fpsa30403};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출금상환등록';
  Application.CreateForm(TFpsa30401, Fpsa30401);
  Application.CreateForm(TFpsa30402, Fpsa30402);
  Application.CreateForm(TFpsa30403, Fpsa30403);
  Application.Run;
end.
