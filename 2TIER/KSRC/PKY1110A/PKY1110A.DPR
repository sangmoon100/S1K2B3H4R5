program PKY1110A;

uses
  Forms,
  PKY1110A1 in 'PKY1110A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '월급여 생성/계산[파견직]';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
