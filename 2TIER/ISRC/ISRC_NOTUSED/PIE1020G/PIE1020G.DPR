program Pie1020g;

uses
  Forms,
  E1020g in 'E1020G.PAS' {Fpie1020g},
  pie10201 in 'pie10201.pas' {Fpie10201};

{$R *.RES}

begin
  Application.Title := '°èÈ¹ÀÎ¿ø ÀÏ°ýµî·Ï';
  Application.CreateForm(TFpie1020g, Fpie1020g);
  Application.CreateForm(TFpie10201, Fpie10201);
  Application.Run;
end.
