program PKG5040A;

uses
  Forms,
  PKG5040A1 in 'PKG5040A1.pas' {FMainForm},
  ConDept in 'ConDept.pas' {FConDept},
  DeptForm in 'DeptForm.PAS' {FDeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '교대/교휴 사용내역집계';
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.
