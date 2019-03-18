program PKG3020A;

uses
  Forms,
  PKG3020A1 in 'PKG3020A1.pas' {MainForm},
  PKG3020A2 in 'PKG3020A2.pas' {Fm_Batch};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연봉변수관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_Batch, Fm_Batch);
  Application.Run;
end.
