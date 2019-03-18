program PKC2120C;

uses
  Forms,
  PKC21201C in 'PKC21201C.pas' {FM_PKC2120C},
  PKC21202C in 'PKC21202C.pas' {FM_PRINT},
  Codelib in 'CODELIB.PAS' {codeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '노동통계조사표 출력';
  Application.CreateForm(TFM_PKC2120C, FM_PKC2120C);
  Application.CreateForm(TcodeForm, codeForm);
  Application.CreateForm(TFM_PRINT, FM_PRINT);
  Application.Run;
end.
