program PSH1070A;

uses
  Forms,
  PSH1070A1 in 'PSH1070A1.pas' {FM_Mainform},
  PHosSearch in 'PHosSearch.pas' {FM_HosSearch},
  PFamily in 'PFamily.pas' {FM_Family},
  PSH1070A2 in 'PSH1070A2.pas' {FM_Hospital},
  PSH1070A3 in 'PSH1070A3.pas' {FM_Sports},
  PFamicod in 'PFAMICOD.PAS' {CodeForm},
  PPRINTFORM in 'PPRINTFORM.PAS' {FM_Printform},
  PPRINT1 in 'PPRINT1.PAS' {FM_Print1},
  PPRINT2 in 'PPRINT2.PAS' {FM_Print2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '임원 복리후생 신청 및 조회';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.Run;
end.
