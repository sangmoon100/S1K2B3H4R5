{* =================== Program Header ==========================================

 PROGRAM-NAME   : PKW1010A(일용직 공통기준 관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 일용직
 Programmer     : 이랑교
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이랑교          최초개발본      설계명세서

============================================================================= *}
program Pkg3160a;

uses
  Forms,
  pkg31601a in 'pkg31601a.pas' {F_pkw10101};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무 결재권자 등록';
  Application.CreateForm(TF_pkw10101, F_pkw10101);
  Application.Run;
end.
