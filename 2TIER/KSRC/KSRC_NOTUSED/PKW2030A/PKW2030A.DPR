program pkw2030a;

uses
  Forms,
  pkw20301 in 'pkw20301.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
