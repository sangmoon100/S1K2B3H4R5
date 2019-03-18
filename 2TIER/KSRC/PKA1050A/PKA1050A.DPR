program PKA1050A;

uses
  Forms,
  PKA1050A1 in 'PKA1050A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '급여변수관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
