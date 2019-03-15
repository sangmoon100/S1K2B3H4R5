{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1040C(가족수당 내역서 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}

program Pkg1040c;

uses
  Forms,
  pkg10401 in 'pkg10401.pas' {MainForm},
  pkg10402 in 'pkg10402.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 신청내역서 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
