{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3020A(운전 지원금 신청)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

============================================================================= *}
program Pki3020a;

uses
  Forms,
  pki30201 in 'pki30201.pas' {Fpki30201},
  pki30202 in 'pki30202.pas' {Fpki30202},
  pki30203 in 'pki30203.pas' {Fpki30203};
 
{$R *.RES}

begin
  Application.Title := '운전지원금 신청';
  Application.Title := '운전지원금 신청 ';
  Application.CreateForm(TFpki30201, Fpki30201);
  Application.CreateForm(TFpki30202, Fpki30202);
  Application.Run;
end.
