program PIR2080A;

uses
  Forms,
  PIR20801 in 'PIR20801.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '면접전형대상 그룹관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
