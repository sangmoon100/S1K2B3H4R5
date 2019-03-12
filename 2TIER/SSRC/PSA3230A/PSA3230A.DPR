program PSA3230;

uses
  Forms,
  PSA32301 in 'PSA32301.pas' {Fpsa30101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내근로복지기금 기준등록';
  Application.CreateForm(TFpsa30101, Fpsa30101);
  Application.Run;
end.
