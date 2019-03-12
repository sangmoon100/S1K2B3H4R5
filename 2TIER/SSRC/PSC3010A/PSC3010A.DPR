program psc3010a;

uses
  Forms,
  psc30101 in 'psc30101.pas' {Fpsc30101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '대부기준 관리';
  Application.CreateForm(TFpsc30101, Fpsc30101);
  Application.Run;
end.
