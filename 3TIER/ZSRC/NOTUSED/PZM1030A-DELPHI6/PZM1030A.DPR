program PZM1030A;

uses
  Forms,
  PZM1030A1 in 'PZM1030A1.PAS' {FmPZM1010A1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '계약직 취업규정';
  Application.CreateForm(TFmPZM1010A1, FmPZM1010A1);
  Application.Run;
end.
