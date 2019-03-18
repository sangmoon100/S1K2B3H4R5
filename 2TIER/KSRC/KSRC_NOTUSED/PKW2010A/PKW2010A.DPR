program pkw2010a;

uses
  Forms,
  pkw20101 in 'pkw20101.pas' {Fpkcigbas},
  pkw20103 in 'pkw20103.pas' {MainForm},
  pkw20201 in 'pkw20201.pas' {Fpkcigtbl},
  pkw20104 in 'pkw20104.pas' {DM: TDataModule},
  pkw20105 in 'pkw20105.pas' {Fpaynum};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFpkcigbas, Fpkcigbas);
  Application.CreateForm(TFpaynum, Fpaynum);
  Application.Run;
end.
