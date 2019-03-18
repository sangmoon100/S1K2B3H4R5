{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3030A(운전 지원금 지급확인)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서
============================================================================= *}
program Pki3030a;

uses
  Forms,
  Pki30301 in 'PKI30301.PAS' {M_KI3030A},
  pki30302 in 'pki30302.pas' {S1_KI3030A};

{$R *.RES}

begin
  Application.CreateForm(TM_KI3030A, M_KI3030A);
  Application.Run;
end.
