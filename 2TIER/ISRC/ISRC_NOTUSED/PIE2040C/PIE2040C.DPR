program Pie2040c;

uses
  Forms,
  pie20402 in 'pie20402.pas' {PrintForm},
  pie20401 in 'pie20401.pas' {MainForm};

{$E EXE}

{$R *.RES}

begin
  Application.Title := '관리자 대비 사원 인원현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
