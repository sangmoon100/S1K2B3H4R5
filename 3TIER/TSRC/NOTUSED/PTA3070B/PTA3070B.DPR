program PTA3070B;

uses
  Forms,
  PTA30701 in 'PTA30701.PAS' {MainForm},
  PTA30702 in 'PTA30702.PAS' {InfoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point 이력조회';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
