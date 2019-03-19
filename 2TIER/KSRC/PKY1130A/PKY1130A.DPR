program PKY1130A;

uses
  Forms,
  PKY1130A1 in 'PKY1130A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '종합인사정보시스템(급여)';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
