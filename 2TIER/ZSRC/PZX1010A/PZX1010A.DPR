program PZX1010A;

uses
  Forms,
  PZX1011A in 'PZX1011A.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인사자료추출';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
