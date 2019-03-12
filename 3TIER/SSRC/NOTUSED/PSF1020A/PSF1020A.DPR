program PSF1020A;

uses
  Forms,
  PSF10201 in 'PSF10201.PAS' {MainForm},
  PSF10202 in 'PSF10202.PAS' {DetForm},
  PSF10203 in 'PSF10203.PAS' {FamiForm},
  PSF10204 in 'PSF10204.PAS' {FM_Print};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '선택적 복리후생비 등록';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDetForm, DetForm);
  Application.CreateForm(TFamiForm, FamiForm);
  Application.CreateForm(TFM_Print, FM_Print);
  Application.Run;
end.
