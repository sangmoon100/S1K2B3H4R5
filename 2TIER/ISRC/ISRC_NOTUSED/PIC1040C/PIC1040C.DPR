program Pic1040c;

uses
  Forms,
  Pic10401 in 'PIC10401.PAS' {MainForm},
  Pic10403 in 'PIC10403.PAS' {PreViewForm},
  pic10404 in 'pic10404.pas',
  pic10402 in 'pic10402.pas' {PrintForm};

{$R *.RES}

begin
  Application.Title := '인사발령안품의서(PIC1040C)';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreViewForm, PreViewForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
