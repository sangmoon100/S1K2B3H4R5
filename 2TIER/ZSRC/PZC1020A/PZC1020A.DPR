program pzc1020a;

uses
  Forms,
  pzc10201 in 'pzc10201.pas' {DeptForm},
  pzc10202 in 'pzc10202.pas' {DeptPrint},
  pzc10203 in 'pzc10203.pas' {FPIC10203};

{$R *.RES}

begin
  Application.Title := '何辑内靛包府';
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TDeptPrint, DeptPrint);
  Application.Run;
end.
