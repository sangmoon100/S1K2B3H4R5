program PSA3070C;

uses
  Forms,
  Psa30701 in 'Psa30701.pas' {Fpsa30701},
  Psa30702 in 'Psa30702.pas' {Fpsa30702};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사우회 상환내역서출력';
  Application.CreateForm(TFpsa30701, Fpsa30701);
  Application.CreateForm(TFpsa30702, Fpsa30702);
  Application.Run;
end.
