program PSA3030A;

uses
  Forms,
  Psa30301 in 'Psa30301.pas' {Fpsa30301},
  Psa30302 in 'Psa30302.pas' {Fpsa30302},
  Psa30303 in 'Psa30303.pas' {Fpsa30303};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 대출지급등록';
  Application.CreateForm(TFpsa30301, Fpsa30301);
  Application.CreateForm(TFpsa30302, Fpsa30302);
  Application.CreateForm(TFpsa30303, Fpsa30303);
  Application.Run;
end.
