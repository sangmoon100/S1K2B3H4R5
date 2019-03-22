program PIA1060Z;

uses
  Forms,
  PIA1061Z in 'Pia1061z.pas' {pia1061cForm},
  Pia1062Z in 'Pia1062Z.pas' {Report1: TQuickRep},
  PIA1064Z in 'Pia1064z.pas' {pia1064cForm},
  pia1066Z in 'pia1066Z.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인사기록요약표 출력- 임시용';
  Application.CreateForm(Tpia1061cForm, pia1061cForm);
  Application.CreateForm(TReport1, Report1);
  Application.CreateForm(Tpia1064cForm, pia1064cForm);
  Application.Run;
end.
