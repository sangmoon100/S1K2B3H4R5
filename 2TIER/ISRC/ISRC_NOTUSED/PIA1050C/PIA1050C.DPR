program Pia1050c;

uses
  Forms,
  WinTypes,
  WinProcs,
  Pia1051c in 'PIA1051C.PAS' {pia1051cForm},
  Pia1052c in 'PIA1052C.PAS' {pia1052cForm},
  Pia1053c in 'PIA1053C.PAS' {pia1053cForm},
  Pia1054c in 'PIA1054C.PAS' {pia1054cForm},
  Pia1055c in 'PIA1055C.PAS' {pia1055cForm},
  Pia1056c in 'PIA1056C.PAS' {pia1056cForm},
  Pia1057c in 'PIA1057C.PAS' {pia1057cForm},
  pia1058c in 'pia1058c.pas';

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '인사기록표 작성';
  Application.CreateForm(Tpia1051cForm, pia1051cForm);
  Application.CreateForm(Tpia1052cForm, pia1052cForm);
  Application.CreateForm(Tpia1053cForm, pia1053cForm);
  Application.CreateForm(Tpia1054cForm, pia1054cForm);
  Application.CreateForm(Tpia1055cForm, pia1055cForm);
  Application.CreateForm(Tpia1056cForm, pia1056cForm);
  Application.CreateForm(Tpia1057cForm, pia1057cForm);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1051aForm','종합인사정보시스템 (인사시스템)') );
end.
