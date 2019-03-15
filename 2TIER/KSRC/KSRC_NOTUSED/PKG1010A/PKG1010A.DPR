{* =================== Program Header ======================================

 PROGRAM-NAME   : PKG1010A(가족수당 지급기준관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

========================================================================= *}
program Pkg1010a;

uses
  Forms,
  pkg10101 in 'pkg10101.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
