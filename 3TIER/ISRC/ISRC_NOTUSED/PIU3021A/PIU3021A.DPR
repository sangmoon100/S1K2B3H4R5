program PIU3021A;

uses
  Forms,
  PIU30211 in 'PIU30211.PAS' {MainForm},
  PIU30212 in 'PIU30212.PAS' {PrintForm},
  PIU30215 in 'PIU30215.PAS' {Fm_EmpForm},
  PIU30214 in 'PIU30214.pas' {JobplaceForm},
  PIU30213 in 'PIU30213.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '¿Ãµø»Ò∏¡∫Œº≠ µÓ∑œ';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TJobplaceForm, JobplaceForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
