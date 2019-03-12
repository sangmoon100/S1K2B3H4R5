program PSA3020A;

uses
  Forms,
  Psa30201 in 'Psa30201.pas' {Fpsa30201};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출신청등록';
  Application.CreateForm(TFpsa30201, Fpsa30201);
  Application.Run;
end.
