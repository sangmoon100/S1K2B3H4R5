program PKA4052A;

uses
  Forms,
  PKA40521 in 'PKA40521.PAS' {FM_Main},
  PKA40522 in 'PKA40522.PAS' {EmpForm},
  PKA40523 in 'PKA40523.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '휴가 및 근태 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
