program pie2270c;

uses
  Forms,
  pie2270c1 in 'pie2270c1.pas' {Fpie2270c1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '월별인력현황 - 종합인사';
  Application.CreateForm(TFpie2270c1, Fpie2270c1);
  Application.Run;
end.
