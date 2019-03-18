{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3060C(운전지원금 신청자 LIST 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

============================================================================= *}
program Pki3060c;

uses
  Forms,
  Pki30601 in 'PKI30601.PAS' {M_KI3060C},
  Pki30602 in 'PKI30602.PAS' {S1_KI3060C},
  pki30603 in 'pki30603.pas' {PreviewForm};

{$R *.RES}

begin
  Application.Title := '운전지원금 신청자 LIST 출력';
  Application.CreateForm(TM_KI3060C, M_KI3060C);
  Application.Run;
end.
