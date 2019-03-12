program PSC3060A;

uses
  Forms,
  PSC30601 in 'PSC30601.PAS' {Fpsc30601},
  PSC30602 in 'PSC30602.PAS' {Fpsc30602};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 대부 상환내역 조회-하나로종합인사';
  Application.CreateForm(TFpsc30601, Fpsc30601);
  Application.Run;
end.
