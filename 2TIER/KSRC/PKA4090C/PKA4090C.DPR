{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4090C(개인별근태내역서출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program pka4090c;

uses
  Forms,
  pka40903 in 'pka40903.pas' {Fpka40903},
  pka40902 in 'pka40902.pas' {Fpka40902},
  pka40901 in 'pka40901.pas' {Fpka40901};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 근태내역서  출력';
  Application.CreateForm(TFpka40901, Fpka40901);
  Application.Run;
end.
