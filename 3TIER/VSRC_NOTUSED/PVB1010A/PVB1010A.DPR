program PVB1010A;

uses
  Forms,
  pvb1010a1 in 'pvb1010a1.pas' {FM_PVB1010A},
  pvb1010a2 in 'pvb1010a2.pas' {FM_SubForm1},
  pvb1010a3 in 'pvb1010a3.pas' {FM_SubForm2},
  pvb1010a4 in 'pvb1010a4.pas' {CopyForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '방문자예약등록';
  Application.CreateForm(TFM_PVB1010A, FM_PVB1010A);
  Application.CreateForm(TCopyForm, CopyForm);
  Application.Run;
end.
