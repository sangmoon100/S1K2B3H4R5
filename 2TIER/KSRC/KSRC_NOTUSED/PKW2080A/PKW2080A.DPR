program pkw2080a;

uses
  Forms,
  Kempno in 'Kempno.pas' {Fempno},
  pkw20801 in 'pkw20801.pas' {Fpkw2080a},
  Kycode1 in 'Kycode1.pas' {Fkycode1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견직 급여계산 내역관리';
  Application.CreateForm(TFpkw2080a, Fpkw2080a);
  Application.CreateForm(TFempno, Fempno);
  Application.CreateForm(TFkycode1, Fkycode1);
  Application.Run;
end.
