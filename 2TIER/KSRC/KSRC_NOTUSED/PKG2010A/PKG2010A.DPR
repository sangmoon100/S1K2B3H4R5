{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG2010A(자격수당지급대상자조회)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김영대
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      김영대         최초개발본      설계명세서

============================================================================= *}
program Pkg2010a;

uses
  Forms,
  Pkg20101 in 'Pkg20101.pas' {MainForm};

{$R *.RES}

begin
  Application.Title := '자격수당 지급자조회';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
