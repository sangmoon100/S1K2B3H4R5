program pkc1130g;

uses
  Forms,
  pkc11301 in 'pkc11301.pas' {MainForm},
  pkc11305 in 'pkc11305.pas' {Fpkc11305},
  pkc11303 in 'pkc11303.pas' {DM: TDataModule},
  pkc11302 in 'pkc11302.pas' {Fpkc11302},
  pkc11304 in 'pkc11304.pas' {Fpkc11304};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '급여 세금계산 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFpkc11305, Fpkc11305);
  Application.CreateForm(TFpkc11302, Fpkc11302);
  Application.CreateForm(TFpkc11304, Fpkc11304);
  Application.Run;
end.
