program PEZ2010A;

uses
  Forms,
  pez2010a1 in 'pez2010a1.pas' {FM_Main},
  pez2010a_dept in 'pez2010a_dept.pas' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '임원 자기평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDeptForm, DeptForm);
  try
    Application.Run;
  except
  end;  
end.
