program PSA3110B;

uses
  Forms,
  Psa31101 in 'Psa31101.pas' {Fpsa31101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출금상환등록';
  Application.CreateForm(TFpsa31101, Fpsa31101);
  Application.Run;
end.
