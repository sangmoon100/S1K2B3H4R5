program PZO2010A;

uses
  Forms,
  PZO20101 in 'PZO20101.PAS' {FM_Main},
  PZO20103 in 'PZO20103.pas' {DeptForm},
  PZO20105 in 'PZO20105.pas' {ComMgrForm},
  PZO20104 in 'PZO20104.pas' {ComForm},
  PZO20106 in 'PZO20106.pas' {FM_Batch},
  PZO20102 in 'PZO20102.PAS' {EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외주인력관리시스템';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TComForm, ComForm);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.Run;
end.
