program Pie2060c;

uses
  Forms,
  E2060c in 'E2060C.PAS' {Fpie2060c},
  Pie20603 in 'Pie20603.pas' {Fpie20603},
  Pie20604 in 'Pie20604.pas' {Fpie20604},
  Pie20606 in 'Pie20606.pas' {Fpie20606};

{$R *.RES}

begin
  Application.Title := 'BAND/직군별 인원현황';
  Application.CreateForm(TFpie2060c, Fpie2060c);
  Application.CreateForm(TFpie20603, Fpie20603);
  Application.CreateForm(TFpie20604, Fpie20604);
  Application.CreateForm(TFpie20606, Fpie20606);
  Application.Run;
end.
