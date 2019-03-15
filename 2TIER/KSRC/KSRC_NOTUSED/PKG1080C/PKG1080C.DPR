{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1080C(가족수당 관리대장 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}

program Pkg1080c;

uses
  Forms,
  pkg10801 in 'pkg10801.pas' {MainForm},
  pkg10802 in 'pkg10802.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 관리대장 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
