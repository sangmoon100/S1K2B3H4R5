{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1030A(가족수당지급)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}
program Pkg1030a;

uses
  Forms,
  pkg10301 in 'pkg10301.pas' {MainForm},
  pkg10304 in 'pkg10304.pas' {FPrint};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 지급';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
