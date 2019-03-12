program pta1070b;

uses
  Forms,
  pta1070b1 in 'pta1070b1.pas' {Fpta1070b1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사이버연수원 자료 추출';
  Application.CreateForm(TFpta1070b1, Fpta1070b1);
  Application.Run;
end.
