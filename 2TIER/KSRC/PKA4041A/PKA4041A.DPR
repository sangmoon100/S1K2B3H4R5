program pka4041a;

uses
  Forms,
  pka40410 in 'pka40410.pas' {MainForm},
  PKA40411 in 'PKA40411.PAS' {EmpForm},
  PKA40412 in 'PKA40412.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
