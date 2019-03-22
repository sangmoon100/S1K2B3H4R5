program Pic1100g;

uses
  Forms,
  wintypes,
  winprocs,
  Pic1101g in 'PIC1101G.PAS' {pic1101gForm};

{$R *.RES}

begin
if HprevInst = 0 then
begin
  Application.Title := '조직차수 변경 작업';
  Application.CreateForm(Tpic1101gForm, pic1101gForm);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpic1101gForm','종합인사정보시스템 (인사시스템)') );

end.
