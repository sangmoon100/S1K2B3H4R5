
program Pic7010c;

uses
  Forms,
  pic7011c in 'pic7011c.pas' {pic7011cForm},
  Pic7014c in 'Pic7014c.pas',
  Pic7012c in 'Pic7012c.pas' {pic7012cForm},
  Pic7013c in 'Pic7013c.pas' {pic7013cForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직개편 부서변동 내역';
  Application.CreateForm(Tpic7011cForm, pic7011cForm);
  Application.CreateForm(Tpic7012cForm, pic7012cForm);
  Application.CreateForm(Tpic7013cForm, pic7013cForm);
  Application.Run;
end.
