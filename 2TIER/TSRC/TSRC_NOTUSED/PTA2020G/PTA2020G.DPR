program pta2020g;

uses
  Forms,
  pta2021g in 'pta2021g.pas' {pia9041gForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외국어 일괄등록';
  Application.CreateForm(Tpia9041gForm, pia9041gForm);
  Application.Run;
end.
