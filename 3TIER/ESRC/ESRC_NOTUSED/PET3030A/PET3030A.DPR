program PET3030A;

uses
  Forms,
  HMainForm1 in 'HMainForm1.pas' {FM_Main},
  PET3030A_DEPT in 'PET3030A_DEPT.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '���� �ڱ���';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
