{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4020G(휴일관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program pka4020a;

uses
  Forms,
  pka40201 in 'pka40201.pas' {Fpka40201},
  pka40202 in 'pka40202.pas' {Fpka40202};

{$R *.RES}

begin
  Application.Title := '휴일관리';
  Application.CreateForm(TFpka40201, Fpka40201);
  Application.CreateForm(TFpka40202, Fpka40202);
  Application.Run;
end.
