{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKG2030C(자격수당 변동자 LIST 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김영대
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         김영대          최초개발본      설계명세서

============================================================================= *}
program Pkg2030c;

uses
  Forms,
  Pkg20303 in 'Pkg20303.pas' {PrintForm},
  Pkg20301 in 'Pkg20301.pas' {MainForm};

{$R *.RES}

begin
  Application.Title := '자격수당 변동자 LIST출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
