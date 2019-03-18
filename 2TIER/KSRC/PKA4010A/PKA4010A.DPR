{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4010A(근태구분관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program Pka4010a;

uses
  Forms,
  Pka40101 in 'Pka40101.pas' {Fpka40101};

{$R *.RES}

begin
  Application.CreateForm(TFpka40101, Fpka40101);
  Application.Run;
end.
