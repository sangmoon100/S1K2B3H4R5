program PIE3030A;

uses
  Forms,
  WinTypes,
  WinProcs,
  PIE3031A in 'PIE3031A.PAS' {PIE3031cForm},
  PIE3033A in 'PIE3033A.PAS' {pia1064cForm},
  PIE3032A in 'PIE3032A.pas' {Report1: TQuickRep},
  PIE3034A in 'PIE3034A.PAS';

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '인사기록요약표 작성';
  Application.CreateForm(TPIE3031cForm, PIE3031cForm);
  Application.CreateForm(TReport1, Report1);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1061cForm','종합인사정보시스템 (인사시스템)') );
end.
