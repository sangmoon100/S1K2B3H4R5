program PKA4050A;

uses
  Forms,
  PKA40501 in 'PKA40501.pas' {MainForm},
  PKA40503 in 'PKA40503.pas' {FM_Batch},
  PKA40502 in 'PKA40502.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연차등록관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
