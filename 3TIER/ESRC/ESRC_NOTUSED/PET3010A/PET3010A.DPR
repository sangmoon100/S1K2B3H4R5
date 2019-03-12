program PET3010A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  HPrintForm in 'HPrintForm.pas' {PrintForm},
  UOpinon in 'UOpinon.pas' {Form2},
  HPrintForm2 in 'HPrintForm2.pas' {PrintForm2},
  HMainForm2 in 'HMainForm2.pas' {FM_Main2},
  UValueForm in 'UValueForm.pas' {ValueForm},
  UValueForm2 in 'UValueForm2.pas' {ValueForm2},
  UTeamForm in 'UTEAMFORM.PAS' {TeamForm},
  UTeamForm2 in 'UTEAMFORM2.PAS' {TeamForm2},
  UPRNVIEW in '..\PET3020A\UPRNVIEW.PAS' {Fm_PreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '팀원 자기평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
