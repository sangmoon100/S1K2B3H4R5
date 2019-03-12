program PET1010F;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  HMainForm2 in 'HMainForm2.pas' {FM_Main2},
  HPrintForm in 'HPrintForm.pas' {PrintForm},
  UTeamForm2 in 'UTeamForm2.pas' {TeamForm2},
  UOpinon in 'UOpinon.pas' {F_Opinon1},
  UOpinon2 in 'UOpinon2.pas' {F_Opinon2},
  UTeamForm in 'UTeamForm.pas' {TeamForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Æò°¡ Petition';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
