{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1050G(가족수당 지급/해지자 자동추출)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}
program Pkg1050g;

uses
  Forms,
  pkg10501 in 'pkg10501.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
