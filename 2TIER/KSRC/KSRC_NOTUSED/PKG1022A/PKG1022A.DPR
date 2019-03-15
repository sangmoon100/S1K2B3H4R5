{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKG1020A(가족수당 신청)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 조석연
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)  programmer     description     relevant doc.no
   1.00       1997.12.01      조석연         최초개발본      설계명세서

============================================================================= *}
program PKG1022A;

uses
  Forms,
  pkg10221 in 'pkg10221.pas' {MainForm},
  pkg10222 in 'pkg10222.pas' {StandardForm},
  pkg10225 in 'pkg10225.pas' {FamiForm},
  pkg10224 in 'pkg10224.pas' {MateForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 신청';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TStandardForm, StandardForm);
  Application.CreateForm(TFamiForm, FamiForm);
  Application.CreateForm(TMateForm, MateForm);
  Application.Run;
end.
