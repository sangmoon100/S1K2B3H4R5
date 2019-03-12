program PSA3250C;

uses
  Forms,
  Psa32501 in 'Psa32501.pas' {Fpsa32501},
  Psa32502 in 'Psa32502.pas' {Fpsa32502};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 대출및상환내역조회';
  Application.CreateForm(TFpsa32501, Fpsa32501);
  Application.CreateForm(TFpsa32502, Fpsa32502);
  Application.Run;
end.
