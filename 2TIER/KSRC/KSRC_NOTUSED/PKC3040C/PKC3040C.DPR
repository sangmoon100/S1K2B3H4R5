
{===================== Program Header ==========================================

 PROGRAM-NAME   : PKC3040C(급여 이력내역서 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 월급여이력
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         김승회          최초개발본      설계명세서

================================================================================}

program pkc3040c;

uses
  Forms,
  pkc30401 in 'pkc30401.pas' {M_KC3040C},
  pkc30402 in 'pkc30402.pas' {dm1: TDataModule},
  Pkc30405 in 'Pkc30405.pas' {SReportF2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '급여 이력내역서 출력';
  Application.CreateForm(TM_KC3040C, M_KC3040C);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TSReportF2, SReportF2);
  Application.Run;
end.
