{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKQ2180C(근로소득 원천징수부 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 정산
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서

============================================================================= *}
program pkq2180c;

uses
  Forms,
  pkq21801 in 'pkq21801.pas' {MainForm},
  pkq21804 in 'pkq21804.pas' {Fkyempno},
  pkq21805 in 'pkq21805.pas' {NewPrintForm};

{$R *.RES}

begin
  Application.Title := '근로소득 원천징수부 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFkyempno, Fkyempno);
  Application.CreateForm(TNewPrintForm, NewPrintForm);
  Application.Run;
end.
