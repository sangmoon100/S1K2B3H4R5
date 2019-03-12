program Psc3040c;

uses
  Forms,
  psc30401 in 'psc30401.pas' {MainForm},
  psc30402 in 'psc30402.pas' {PreviewForm},
  psc30403 in 'psc30403.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 대부내역서출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
