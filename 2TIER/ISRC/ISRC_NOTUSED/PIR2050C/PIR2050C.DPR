program PIR2050C;

uses
  Forms,
  pir20501 in 'pir20501.pas' {MainForm},
  pir20502 in 'pir20502.pas' {PrintForm},
  pir20503 in 'pir20503.pas' {PrintFormCarr};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '입사지원서출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TPrintFormCarr, PrintFormCarr);
  Application.Run;
end.
