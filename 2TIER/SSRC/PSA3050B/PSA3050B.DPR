program PSA3050B;

uses
  Forms,
  Psa30501 in 'Psa30501.pas' {Fpsa30501},
  Psa30502 in 'Psa30502.pas' {Fpsa30502};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출및상환내역조회';
  Application.CreateForm(TFpsa30501, Fpsa30501);
  Application.Run;
end.
