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
program Pkw2020a;

uses
  Forms,
  pkw20201 in 'pkw20201.pas' {F_pkw20201};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TF_pkw20201, F_pkw20201);
  Application.Run;
end.
