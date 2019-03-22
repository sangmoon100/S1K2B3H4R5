program Pic7040c;

uses
  Forms,
  pic7041c in 'pic7041c.pas' {pic7041cForm},
  Pic7044c in 'Pic7044c.pas',
  Pic7042c in 'Pic7042c.pas' {pic7042cForm},
  Pic7043c in 'Pic7043c.pas' {pic7043cForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직개편 내역';
  Application.CreateForm(Tpic7041cForm, pic7041cForm);
  Application.CreateForm(Tpic7042cForm, pic7042cForm);
  Application.CreateForm(Tpic7043cForm, pic7043cForm);
  Application.Run;
end.
