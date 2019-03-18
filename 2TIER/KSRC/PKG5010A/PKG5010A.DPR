program PKG5010A;

uses
  Forms,
  PKG5010A1 in 'PKG5010A1.pas' {MainForm},
  codelib in 'codelib.pas' {codeForm},
  FMempno in 'FMempno.pas' {empForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '교대근무 기준관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TcodeForm, codeForm);
  Application.CreateForm(TempForm, empForm);
  Application.Run;
end.
