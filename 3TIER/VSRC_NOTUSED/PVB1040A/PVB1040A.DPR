program PVB1040A;

uses
  Forms,
  pvb1040a1 in 'pvb1040a1.pas' {FM_PVB4010A};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '방문예약 시스템관리';
  Application.CreateForm(TFM_PVB4010A, FM_PVB4010A);
  Application.Run;
end.
