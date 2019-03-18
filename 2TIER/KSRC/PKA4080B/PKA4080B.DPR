{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4080B(근태 개인별 이력조회)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program pka4080b;

uses
  Forms,
  pka40801 in 'pka40801.pas' {Fpka40301};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근태 개인별 이력조회';
  Application.CreateForm(TFpka40301, Fpka40301);
  Application.Run;
end.
