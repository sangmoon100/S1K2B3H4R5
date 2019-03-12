program PKA4053A;

uses
  Forms,
  PKA40531 in 'PKA40531.PAS' {FM_Main},
  PKA40532 in 'PKA40532.PAS' {EmpForm},
  PKA40533 in 'PKA40533.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '휴가 및 근태 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
