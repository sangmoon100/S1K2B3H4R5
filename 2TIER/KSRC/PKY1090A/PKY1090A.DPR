program PKY1090A;

uses
  Forms,
  PKY1090A1 in 'PKY1090A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Title := '월변동자료항목CLEAR(pkc1020g)';
  Application.Run;
end.
