program PIR2090A;

uses
  Forms,
  PIR20901 in 'PIR20901.pas' {MainForm},
  PIR20902 in 'PIR20902.pas' {SearchForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := '면접관 관리 : PIR2090A';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
