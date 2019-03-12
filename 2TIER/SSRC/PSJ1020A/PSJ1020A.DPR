program PSJ1020A;

uses
  Forms,
  PSJ1020A1 in 'PSJ1020A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '건강검진 특이자관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
