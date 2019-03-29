program PIA1070C;

uses
  Forms,
  WinTypes,
  WinProcs,
  PIA1071C in 'PIA1071C.PAS' {pia1071cForm},
  pia1076c in 'pia1076c.pas',
  PIA1074C in 'PIA1074C.PAS' {pia1074cForm},
  PIA1072C in 'PIA1072C.PAS' {Report1: TQuickRep};

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '인사기록요약표 작성';
  Application.CreateForm(TReport1, Report1);
  Application.CreateForm(Tpia1071cForm, pia1071cForm);
  Application.CreateForm(Tpia1074cForm, pia1074cForm);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1061cForm','종합인사정보시스템 (인사시스템)') );
end.
