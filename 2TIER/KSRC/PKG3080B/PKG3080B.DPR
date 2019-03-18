{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKG3080B(초과근무 내역조회)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         김승회          최초개발본      설계명세서

============================================================================= *}
program Pkg3080b;

uses
  Forms,
  pkg30801 in 'pkg30801.pas' {M_KG3080B},
  pkg30802 in 'pkg30802.pas' {S1_KG3080B},
  pkg30803 in 'pkg30803.pas' {S2_KG3080B};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무 내역조회';
  Application.CreateForm(TM_KG3080B, M_KG3080B);
  Application.Run;
end.
