
program Pkc2070c;

uses
  Forms,
  pkc20701 in 'pkc20701.pas' {M_KC2070C},
  pkc20707 in 'pkc20707.pas' {SReportF2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 급여명세서 출력';
  Application.CreateForm(TM_KC2070C, M_KC2070C);
  Application.CreateForm(TSReportF2, SReportF2);
  Application.Run;
end.
