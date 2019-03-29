program pib4160c;

uses
  Forms,
  pib41601 in 'pib41601.pas' {pib4161cForm},
  pib41602 in 'pib41602.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '보임자명단';
  Application.CreateForm(Tpib4161cForm, pib4161cForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
