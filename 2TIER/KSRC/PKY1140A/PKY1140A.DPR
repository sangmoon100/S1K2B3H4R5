program PKY1140A;

uses
  Forms,
  PKY1140A1 in 'PKY1140A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견용역비 급여이력 개인별 열람';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
