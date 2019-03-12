program PET3030A;

uses
  Forms,
  HMainForm1 in 'HMainForm1.pas' {FM_Main},
  PET3030A_DEPT in 'PET3030A_DEPT.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀장 자기평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
