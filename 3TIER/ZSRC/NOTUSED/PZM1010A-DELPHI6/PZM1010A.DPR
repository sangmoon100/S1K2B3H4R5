program PZM1010A;

uses
  Forms,
  PZM1010A1 in 'PZM1010A1.pas' {FmPZM1010A1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '인사제도 메뉴얼';
  Application.CreateForm(TFmPZM1010A1, FmPZM1010A1);
  Application.Run;
end.
