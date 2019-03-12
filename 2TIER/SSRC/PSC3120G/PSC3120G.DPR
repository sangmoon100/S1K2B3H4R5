program psc3120g;

uses
  Forms,
  psc31201 in 'psc31201.pas' {F_psc31201};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 대부이자 당월공제금 생성';
  Application.CreateForm(TF_psc31201, F_psc31201);
  Application.Run;
end.
