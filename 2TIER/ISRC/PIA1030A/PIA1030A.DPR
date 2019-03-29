program PIA1030A;

uses
  Forms,
  WinTypes,
  WinProcs,
  Pia1031a in 'PIA1031A.PAS' {pia1031aForm},
  pia1031a_2 in 'pia1031a_2.pas' {ZipForm},
  PIA1031A_3 in 'PIA1031A_3.PAS' {PIA1031a_3Form};

{$R *.RES}

begin
if HPrevInst = 0 then
begin
  Application.Title := '인사전산등록표 등록';
  Application.CreateForm(Tpia1031aForm, pia1031aForm);
  Application.CreateForm(TZipForm, ZipForm);
  Application.CreateForm(TPIA1031a_3Form, PIA1031a_3Form);
  Application.Run;
end
else SetActiveWindow(FindWindow('Tpia1031aForm','종합인사정보시스템 (인사시스템)') );
end.
