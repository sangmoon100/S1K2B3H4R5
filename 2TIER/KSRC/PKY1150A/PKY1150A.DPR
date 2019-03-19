program PKY1150A;

uses
  Forms,
  PKY1150A1 in 'PKY1150A1.pas' {FM_Main},
  PKY1150A2 in 'PKY1150A2.pas' {dm1: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견직 급여 check list';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(Tdm1, dm1);
  Application.Run;
end.
