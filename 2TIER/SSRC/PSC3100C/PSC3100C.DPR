program Psc3100c;

uses
  Forms,
  psc31001 in 'psc31001.pas' {MainForm},
  psc31002 in 'psc31002.pas' {PreviewForm},
  psc31003 in 'psc31003.pas' {Print_personal},
  psc31004 in 'psc31004.pas' {Print_divtotal},
  psc31005 in 'psc31005.pas' {Print_divdetail};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 상환내역서 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.CreateForm(TPrint_personal, Print_personal);
  Application.CreateForm(TPrint_divtotal, Print_divtotal);
  Application.CreateForm(TPrint_divdetail, Print_divdetail);
  Application.Run;
end.
