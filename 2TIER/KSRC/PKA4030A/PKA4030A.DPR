program PKA4030A;

uses
  Forms,
  PKA40301 in 'PKA40301.pas' {MainForm},
  PKA40302 in 'PKA40302.PAS' {Fm_Emp},
  PKA40304 in 'PKA40304.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연봉변수관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
