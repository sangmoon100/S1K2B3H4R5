program PIE2081C;

uses
  Forms,
  E2081C in 'E2081C.PAS' {Fpie2081c},
  pie208110 in 'pie208110.pas' {Fpie208110},
  pie208111 in 'pie208111.pas' {Fpie208111};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '입직현황';
  Application.CreateForm(TFpie2081c, Fpie2081c);
  Application.CreateForm(TFpie208111, Fpie208111);
  Application.CreateForm(TFpie208110, Fpie208110);
  Application.Run;
end.
