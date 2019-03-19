program pkw2110g;

uses
  Forms,
  pkw21101 in 'pkw21101.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '종합인사정보시스템(급여)';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
