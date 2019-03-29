program PIR2070A;

uses
  Forms,
  PIR20701 in 'PIR20701.pas' {MainForm},
  PIR20702 in 'PIR20702.pas' {IntroPopup},
  PIR20704 in 'PIR20704.pas' {TestPopup};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := '채용 면접전형 관리 : PIR2070A';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
