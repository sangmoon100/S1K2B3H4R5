program PTA3060B;

uses
  Forms,
  PTA30601 in 'PTA30601.PAS' {MainForm},
  PTA30602 in 'PTA30602.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '���� �̼� ��KPI ��ȸ(�����)';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
