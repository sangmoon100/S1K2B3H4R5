program PTA2010A;

uses
  Forms,
  PTA2010A1 in 'PTA2010A1.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외국어 등록';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
