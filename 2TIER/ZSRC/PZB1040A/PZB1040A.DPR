program PZB1040A;

uses
  Forms,
  PZB10401 in 'PZB10401.pas' {MainForm},
  PZB10402 in 'PZB10402.pas' {Fm_Emp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '�ϰ� SMS/Mail ���� ����';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.Run;
end.
