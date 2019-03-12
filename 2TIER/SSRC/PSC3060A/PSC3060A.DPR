program psc3060a;

uses
  Forms,
  psc30601 in 'psc30601.pas' {MainForm},
  psc30602 in 'psc30602.pas' {Fkyempno};

{$R *.RES}

begin
  Application.Title := '대부/상환 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFkyempno, Fkyempno);
  Application.Run;
end.
