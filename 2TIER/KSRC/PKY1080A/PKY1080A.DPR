{===================== Program Header ==========================================

 PROGRAM-NAME   : PKC1010B(급여항목관리)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

================================================================================}
program PKY1080A;

uses
  Forms,
  PKY1080A1 in 'PKY1080A1.pas' {FM_Main},
  PKY1080A2 in 'PKY1080A2.pas' {FM_Sub};

{$R *.RES}

begin
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Title := '급여항목관리';
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.Run;
end.
