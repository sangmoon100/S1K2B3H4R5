program PEA1080A;

uses
  Forms,
  PEA1080A1 in 'PEA1080A1.pas' {FM_Main},
  PEA1080A_Dept in 'PEA1080A_Dept.pas' {FM_Dept},
  PEA1080A_Emp in 'PEA1080A_Emp.pas' {FM_empno},
  PEA1080A2 in 'PEA1080A2.pas' {FM_Result};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '구성원 평가결과조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Dept, FM_Dept);
  Application.CreateForm(TFM_empno, FM_empno);
  Application.CreateForm(TFM_Result, FM_Result);
  Application.Run;
end.
