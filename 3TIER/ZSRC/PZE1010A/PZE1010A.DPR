program PZE1010A;

uses
  Forms,
  PZE1010A1 in 'PZE1010A1.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '비밀번호 변경';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
