program pkq1060a;

uses
  Forms,
  pkq10601 in 'pkq10601.pas' {Fpkq10601};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연말정산 관리';
  Application.CreateForm(TFpkq10601, Fpkq10601);
  Application.Run;
end.
