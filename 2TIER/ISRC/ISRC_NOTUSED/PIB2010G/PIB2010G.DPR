program pib2010g;

uses
  Forms,
  pib20101 in 'pib20101.pas' {Fpib20101};

{$R *.RES}

begin
  Application.Title := '조직도 생성';
  Application.CreateForm(TFpib20101, Fpib20101);
  Application.Run;
end.
