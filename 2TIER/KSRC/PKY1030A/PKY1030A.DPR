program PKY1030A;

uses
  Forms,
  PKY1030A1 in 'PKY1030A1.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근태 미등록/미결재 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
