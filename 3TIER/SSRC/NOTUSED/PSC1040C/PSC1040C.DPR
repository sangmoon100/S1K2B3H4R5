program PSC1040C;

uses
  Forms,
  PSC10401 in 'PSC10401.PAS' {Fpsc10401},
  PSC10402 in 'PSC10402.PAS' {ZipForm};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'STOCK OPTION (∞≥¿Œ)';
  Application.CreateForm(TFpsc10401, Fpsc10401);
  Application.CreateForm(TZipForm, ZipForm);
  Application.Run;
end.
