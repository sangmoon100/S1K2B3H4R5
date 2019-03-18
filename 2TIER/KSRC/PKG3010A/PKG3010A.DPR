{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKG3010A(초과근무 기준관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         김승회          최초개발본      설계명세서

============================================================================= *}
program pkg3010a;

uses
  Forms,
  pkg30101 in 'pkg30101.pas' {M_KG3010A};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무 기준관리';
  Application.CreateForm(TM_KG3010A, M_KG3010A);
  Application.Run;
end.
