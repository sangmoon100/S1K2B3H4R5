program PKY1070A;

uses
  Forms,
  PKY1070A1 in 'PKY1070A1.pas' {FM_Main},
  PKY1070A3 in 'PKY1070A3.pas' {Finsaedit},
  PKY1070A2 in 'PKY1070A2.pas' {Finsertemp};

{$R *.RES}

begin
  Application.Title := '급여마스터 관리';
  Application.Title := '급여마스터관리(pkc1040a)';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFinsaedit, Finsaedit);
  Application.Run;
end.
