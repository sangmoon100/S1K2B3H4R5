program pib2015a;

uses
  Forms,
  pib20151 in 'pib20151.pas' {pib2015aForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직도 정정';
  Application.CreateForm(Tpib2015aForm, pib2015aForm);
  Application.Run;
end.
