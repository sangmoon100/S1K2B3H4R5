program PZO1030A;

uses
  Forms,
  PZO1030A1 in 'PZO1030A1.pas' {FM_Mainform},
  PZO1030A2 in 'PZO1030A2.PAS' {EmpForm},
  PZO1030A3 in 'PZO1030A3.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '���忬�����ڰ���';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TEmpForm, EmpForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
