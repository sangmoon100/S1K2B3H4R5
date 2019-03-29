program Pia5010a;

uses
  Forms,
  WinTypes,
  WinProcs,
  Pia5011a in 'PIA5011A.PAS' {pia5010aForm};

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '가족 등록';
  Application.CreateForm(Tpia5010aForm, pia5010aForm);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia5011aForm','종합인사정보시스템 (인사시스템)') );

end.
