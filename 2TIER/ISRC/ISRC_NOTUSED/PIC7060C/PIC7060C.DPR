program Pic7060c;

uses
  Forms,
  pic7061c in 'pic7061c.pas' {pic7061cForm},
  Pic7062c in 'Pic7062c.pas' {pic7062cForm},
  Pic7063c in 'Pic7063c.pas' {pic7063cForm},
  Pic7064c in 'Pic7064c.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '정기 배치전환 현황';
  Application.CreateForm(Tpic7061cForm, pic7061cForm);
  Application.CreateForm(Tpic7062cForm, pic7062cForm);
  Application.CreateForm(Tpic7063cForm, pic7063cForm);
  Application.Run;
end.
