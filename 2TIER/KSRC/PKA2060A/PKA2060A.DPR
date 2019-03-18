{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA2060A(근속제외내역관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여인사사항
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program PKA2060A;

uses
  Forms,
  Pka2060p in 'PKA2060P.PAS' {Fpka2060a};

{$R *.RES}

begin
  Application.Title := '근속제외내역관리';
  Application.CreateForm(TFpka2060a, Fpka2060a);
  Application.Run;
end.
