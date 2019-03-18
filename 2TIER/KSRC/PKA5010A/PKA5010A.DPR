program PKA5010A;

uses
  Forms,
  PKA50101 in 'PKA50101.pas' {MainForm},
  PKA50102 in 'PKA50102.pas' {Fm_Emp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연봉변수관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.Run;
end.
