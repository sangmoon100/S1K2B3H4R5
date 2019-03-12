program PZN2000A;

uses
  Forms,
  Windows,
  Messages,
  SysUtils,
  Classes,
  OnStringUtils,
  Dialogs,
  OnOneInstance,
  ActiveX,
  COMObj,
  OnRegistry,
  PZN2000A1 in 'PZN2000A1.pas' {FM_MainMenu},
  DeptForm in 'DeptForm.PAS' {FDeptForm},
  SubPmas in 'SubPmas.pas' {FM_PMas},
  SubBatch in 'SubBatch.pas' {FM_Batch},
  SubCode in 'SubCode.pas' {FM_code};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '도급인력관리시스템';
  Application.CreateForm(TFM_MainMenu, FM_MainMenu);
  Application.CreateForm(TFM_code, FM_code);
  Application.Run;
end.

