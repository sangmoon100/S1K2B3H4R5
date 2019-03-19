{===================== Program Header ==========================================

 PROGRAM-NAME   : PKA4060G(근태 마감 및 집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

================================================================================}
program PKY1040A;

uses
  Forms,
  PKY1040A1 in 'PKY1040A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Title := '근태 집계';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
