program PKY1120A;

uses
  Forms,
  PKY1120A1 in 'PKY1120A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '급여 당월 내역관리[파견직]';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
