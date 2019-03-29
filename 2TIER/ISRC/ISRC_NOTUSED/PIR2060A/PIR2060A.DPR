program PIR2060A;

uses
  Forms,
  PIR20601A in 'PIR20601A.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '하나로종합인사';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
