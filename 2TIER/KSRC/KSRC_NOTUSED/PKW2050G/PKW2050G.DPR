program pkw2050g;

uses
  Forms,
  pkw20502 in 'pkw20502.pas' {MainForm},
  pkw20501 in 'pkw20501.pas' {Fpkhigdusum},
  pkw20503 in 'pkw20503.pas' {DM: TDataModule},
  pkw20504 in 'pkw20504.pas' {Fpkhigduty},
  pkw20506 in 'pkw20506.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견직 근태마감/집계';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFpkhigdusum, Fpkhigdusum);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFpkhigduty, Fpkhigduty);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
