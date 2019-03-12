program PIU3020A;

uses
  Forms,
  PIU30201 in 'PIU30201.PAS' {MainForm},
  PIU30203 in 'PIU30203.PAS' {PrintForm},
  UEmpForm in 'UEMPFORM.PAS' {Fm_EmpForm},
  PIU30208 in 'PIU30208.pas' {JobplaceForm},
  PIU30207 in 'PIU30207.PAS' {DeptForm};

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
