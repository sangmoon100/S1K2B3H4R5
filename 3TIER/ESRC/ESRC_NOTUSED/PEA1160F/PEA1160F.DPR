program PEA1160F;

uses
  Forms,
  PEA11601 in 'PEA11601.pas' {Fpea11601};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '1,2차 평가담당자 조회';
  Application.CreateForm(TFpea11601, Fpea11601);
  Application.Run;
end.
