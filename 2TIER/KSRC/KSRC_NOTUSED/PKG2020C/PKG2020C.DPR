{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG2020C(자격수당지급대상자출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김영대
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      김영대         최초개발본      설계명세서

============================================================================= *}

program Pkg2020c;

uses
  Forms,
  Pkg20201 in 'Pkg20201.pas' {MainForm},
  Pkg20203 in 'Pkg20203.pas' {PrintForm},
  Pkg20202 in 'Pkg20202.pas' {PreviewForm};

{$R *.RES}

begin
  Application.Title := '자격수당 지급대상자 LIST출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
