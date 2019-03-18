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
program Pka4060g;

uses
  Forms,
  pka40601 in 'pka40601.pas' {Fpka40601},
  pka40602 in 'pka40602.pas' {Fpkq40602};

{$R *.RES}

begin
  Application.Title := '근태 집계';
  Application.CreateForm(TFpka40601, Fpka40601);
  Application.CreateForm(TFpkq40602, Fpkq40602);
  Application.Run;
end.
