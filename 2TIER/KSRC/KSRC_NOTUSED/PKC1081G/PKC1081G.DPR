program PKC1081G;

uses
  Forms,
  pkc10811 in 'pkc10811.pas' {M_KC1081G};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '월급여 생성/계산';
  Application.CreateForm(TM_KC1081G, M_KC1081G);
  Application.Run;
end.
