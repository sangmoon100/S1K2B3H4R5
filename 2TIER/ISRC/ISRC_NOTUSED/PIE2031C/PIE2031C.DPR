program pie2031c;

uses
  Forms,
  E2031C in 'E2031C.PAS' {Fpie2031c},
  pie20311 in 'pie20311.pas' {Fpie20311},
  pie20312 in 'pie20312.pas' {Fpie20312};

{$E EXE}

{$R *.RES}

begin
  Application.Title := '기능별 인력현황';
  Application.CreateForm(TFpie2031c, Fpie2031c);
  Application.CreateForm(TFpie20311, Fpie20311);
  Application.CreateForm(TFpie20312, Fpie20312);
  Application.Run;
end.
