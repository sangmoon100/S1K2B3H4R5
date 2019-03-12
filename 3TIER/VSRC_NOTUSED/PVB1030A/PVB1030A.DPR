program PVB1030A;

uses
  Forms,
  pvb1030a1 in 'pvb1030a1.pas' {FM_PVB1030A};
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '방문결과 조회 및 방문정보 관리';
  Application.CreateForm(TFM_PVB1030A, FM_PVB1030A);
  Application.Run;
end.
