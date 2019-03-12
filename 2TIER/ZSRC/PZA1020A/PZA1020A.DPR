program PZA1020A;

uses
  Forms,
  PZA1020A1 in 'PZA1020A1.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '일정사항 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
