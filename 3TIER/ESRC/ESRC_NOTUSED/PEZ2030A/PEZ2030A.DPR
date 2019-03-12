program PEZ2030A;

uses
  Forms,
  pez2030a1 in 'pez2030a1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '임원 자기평가';
  Application.CreateForm(TFM_Main, FM_Main);
  try
    Application.Run;
  except
  end;  
end.
