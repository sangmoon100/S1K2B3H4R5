program PVB1020A;

uses
  Forms,
  pvb1020a1 in 'pvb1020a1.pas' {FM_PVB1020A};
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '방문정보등록';
  Application.CreateForm(TFM_PVB1020A, FM_PVB1020A);
  Application.Run;
end.
