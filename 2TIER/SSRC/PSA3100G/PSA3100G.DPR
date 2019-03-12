program PSA3100G;

uses
  Forms,
  Psa31001 in 'Psa31001.pas' {Fpsa31001};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회대출상환급여이체';
  Application.CreateForm(TFpsa31001, Fpsa31001);
  Application.Run;
end.
