program PSA3010A;

uses
  Forms,
  Psa30101 in 'Psa30101.pas' {Fpsa30101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출기준등록';
  Application.CreateForm(TFpsa30101, Fpsa30101);
  Application.Run;
end.
