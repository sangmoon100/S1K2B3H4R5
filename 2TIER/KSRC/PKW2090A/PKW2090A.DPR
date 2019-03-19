{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA1030A(연세율표관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여공통기준
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

================================================================================}
program PKW2090A;

uses
  Forms,
  PKW20901 in 'PKW20901.pas' {FPKW2090A};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFPKW2090A, FPKW2090A);
  Application.Run;
end.
