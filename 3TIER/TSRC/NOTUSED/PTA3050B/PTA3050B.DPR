program PTA3050B;

uses
  Forms,
  PTA30501 in 'PTA30501.PAS' {MainForm},
  PTA30502 in 'PTA30502.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '±³À°ÀÌ¼ö ÆÀKPI Á¶È¸ ';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
