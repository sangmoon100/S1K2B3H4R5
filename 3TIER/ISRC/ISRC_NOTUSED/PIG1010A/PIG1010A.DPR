program PIG1010A;

uses
  Forms,
  PIG10101A in 'PIG10101A.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'BAND조정 점수조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
