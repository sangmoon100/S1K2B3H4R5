program PID1150A;

uses
  Forms,
  PID1150A1 in 'PID1150A1.PAS' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '수습 인사평가 및 의견 등록';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
