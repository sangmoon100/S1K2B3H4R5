{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKG3070G(초과근무수 계산/월별집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         김승회          최초개발본      설계명세서

============================================================================= *}
program pkq4300g;

uses
  Forms,
  pkq4300 in 'pkq4300.pas' {M_KQ4130G};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '전산매체 작성용 데이터 전송';
  Application.CreateForm(TM_KQ4130G, M_KQ4130G);
  Application.Run;
end.
