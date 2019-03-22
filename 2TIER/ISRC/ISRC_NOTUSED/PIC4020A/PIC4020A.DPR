program pic4020a;

uses
  Forms,
  peMainForm in 'peMainForm.pas' {MainForm},
  pic4020a5 in 'pic4020a5.pas' {Fm_SubForm5},
  peDm in 'peDm.pas' {DM: TDataModule},
  pic4020a4 in 'pic4020a4.pas' {Fm_SubForm4};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '업적평가 대상자관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
