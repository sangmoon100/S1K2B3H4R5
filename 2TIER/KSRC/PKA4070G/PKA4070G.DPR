{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4070G(근태이력보관)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program pka4070g;

uses
  Forms,
  pka40701 in 'pka40701.pas' {Fpka40701};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFpka40701, Fpka40701);
  Application.Run;
end.
