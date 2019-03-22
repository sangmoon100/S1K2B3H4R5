program PKA4051A;

uses
  Forms,
  PKA40511 in 'PKA40511.pas' {MainForm},
  PKA40512 in 'PKA40512.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
