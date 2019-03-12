program PSH1030A;

uses
  Forms,
  PSH1030A1 in 'PSH1030A1.pas' {FM_Mainform},
  PHosSearch in 'PHosSearch.pas' {FM_HosSearch},
  PFamily in 'PFamily.pas' {FM_Family},
  PSH1030A2 in 'PSH1030A2.pas' {FM_Hospital},
  PSH1030A3 in 'PSH1030A3.pas' {FM_Sports},
  PFamicod in 'PFAMICOD.PAS' {CodeForm},
  PSH1030A5 in 'PSH1030A5.PAS' {FM_Batch},
  PSH1030A6 in 'PSH1030A6.PAS' {FM_Photo},
  PSH1030A7 in 'PSH1030A7.PAS' {FM_Viewer32};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '복리후생신청';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.Run;
end.
