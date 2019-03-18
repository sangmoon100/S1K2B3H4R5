program PKA4060A;

uses
  Forms,
  PKA40601 in 'PKA40601.pas' {MainForm},
  PKA40602 in 'PKA40602.pas' {DeptForm},
  pka40603 in 'pka40603.PAS' {EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연차등록관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.Run;
end.
