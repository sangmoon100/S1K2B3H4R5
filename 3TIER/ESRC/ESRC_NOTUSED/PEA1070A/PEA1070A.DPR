program PEA1070A;

uses
  Forms,
  PEA1070A1 in 'PEA1070A1.pas' {FM_Mainform};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '평가 결과 조회';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.Run;
end.
