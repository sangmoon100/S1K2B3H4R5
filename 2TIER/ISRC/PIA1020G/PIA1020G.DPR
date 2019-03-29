program Pia1020g;

uses
  Forms,
  WinProcs,
  WinTypes,
  Pia1021g in 'PIA1021G.PAS' {pia1021gForm};

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '입사내역 일괄등록';
  Application.CreateForm(Tpia1021gForm, pia1021gForm);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1021gForm','종합인사정보시스템 (인사시스템)') );
end.
