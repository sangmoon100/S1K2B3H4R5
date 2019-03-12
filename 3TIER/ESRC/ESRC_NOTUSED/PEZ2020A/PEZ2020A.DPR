program PEZ2020A;

uses
  Forms,
  pez2020a1 in 'pez2020a1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '임원 부하의견조사';
  Application.CreateForm(TFM_Main, FM_Main);
  try
    Application.Run;
  except
  end;  
end.
