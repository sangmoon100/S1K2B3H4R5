{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA2010G(인사자료 추출/갱신)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여인사사항
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         허철행          최초개발본      설계명세서

================================================================================}
program PKY1020A;

uses
  Forms,
  PKY1020A1 in 'PKY1020A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인사자료 추출/갱신';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
