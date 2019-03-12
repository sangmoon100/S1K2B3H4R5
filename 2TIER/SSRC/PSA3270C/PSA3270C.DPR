program PSA3270C;

uses
  Forms,
  Psa32701 in 'Psa32701.pas' {Fpsa32701},
  Psa32702 in 'Psa32702.pas' {Fpsa32702};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 상환내역서출력';
  Application.CreateForm(TFpsa32701, Fpsa32701);
  Application.CreateForm(TFpsa32702, Fpsa32702);
  Application.Run;
end.
