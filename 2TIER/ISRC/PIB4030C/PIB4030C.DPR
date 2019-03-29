program pib4030c;

uses
  Forms,
  pib40301 in 'pib40301.pas' {MainForm},
  pib40302 in 'pib40302.pas' {PrintForm};

{$R *.RES}

begin
  Application.Title := '임원명단';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
