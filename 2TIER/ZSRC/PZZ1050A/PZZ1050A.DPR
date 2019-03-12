program PZZ1050A;

uses
  Forms,
  PZZ1050A1 in 'PZZ1050A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '종합인사시스템';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
