program PSA3050C;

uses
  Forms,
  Psa30503 in 'Psa30503.pas' {Fpsa30503};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출및상환내역조회';
  Application.CreateForm(TFpsa30503, Fpsa30503);
  Application.Run;
end.
