program pzc1010a;

uses
  Forms,
  pzc10101 in 'pzc10101.pas' {MainForm},
  pzc10102 in 'pzc10102.pas' {CodeForm},
  pzc10103 in 'pzc10103.pas' {PrintCodeID},
  pzc10104 in 'pzc10104.pas' {PrintCodeno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '공통코드관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.CreateForm(TPrintCodeID, PrintCodeID);
  Application.CreateForm(TPrintCodeno, PrintCodeno);
  Application.Run;
end.
