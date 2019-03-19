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
program PKY1060A;

uses
  Forms,
  PKY1060A1 in 'PKY1060A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무수당 계산 / 월별집계';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
