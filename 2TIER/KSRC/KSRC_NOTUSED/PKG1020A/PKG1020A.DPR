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
program Pkg1020a;

uses
  Forms,
  pkg10201 in 'pkg10201.pas' {MainForm},
  pkg10202 in 'pkg10202.pas' {StandardForm},
  pkg10203 in 'pkg10203.pas' {FamilyForm},
  pkg10204 in 'pkg10204.pas' {MateForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '가족수당 신청';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TStandardForm, StandardForm);
  Application.CreateForm(TFamilyForm, FamilyForm);
  Application.CreateForm(TMateForm, MateForm);
  Application.Run;
end.
