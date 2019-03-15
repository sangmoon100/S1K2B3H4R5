{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1060C(가족수당 자동추출대상자 LIST 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}

program Pkg1060c;

uses
  Forms,
  pkg10601 in 'pkg10601.pas' {MainForm},
  pkg10602 in 'pkg10602.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 자동추출 대상자 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
