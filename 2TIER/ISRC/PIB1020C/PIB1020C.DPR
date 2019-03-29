program pib1020c;

uses
  Forms,
  pib1022c in 'pib1022c.pas' {pib1022cForm},
  pib1021c in 'pib1021c.pas' {pib1021cForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 사진대장 작성';
  Application.CreateForm(Tpib1021cForm, pib1021cForm);
  Application.CreateForm(Tpib1022cForm, pib1022cForm);
  Application.Run;
end.
