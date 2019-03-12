program PZO2020A;

uses
  Forms,
  PZO20201 in 'PZO20201.pas' {FM_Main},
  PZO20202 in 'PZO20202.PAS' {EmpForm},
  PZO20203 in 'PZO20203.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외주인력관리시스템';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
