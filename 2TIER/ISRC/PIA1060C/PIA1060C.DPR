program Pia1060c;

uses
  Forms,
  WinTypes,
  WinProcs,
  PIA1061C in 'PIA1061C.PAS' {pia1061cForm},
  Pia1064c in 'PIA1064C.PAS' {pia1064cForm},
  pia1066c in 'pia1066c.pas',
  Pia1062c in 'Pia1062c.pas' {Report1: TQuickRep},
  Pia1069c in 'Pia1069c.pas' {Report9: TQuickRep},
  Pia1068c in 'Pia1068c.pas' {Report10: TQuickRep};

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '인사기록요약표 작성';
  Application.CreateForm(Tpia1061cForm, pia1061cForm);
  Application.CreateForm(TReport1, Report1);
  Application.CreateForm(TReport9, Report9);
  Application.CreateForm(TReport10, Report10);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1061cForm','종합인사정보시스템 (인사시스템)') );
end.
