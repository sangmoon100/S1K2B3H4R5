program PET2040A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  UTeamForm in 'UTeamForm.pas' {TeamForm},
  HPRINTFORM in 'HPRINTFORM.PAS' {PrintForm},
  UOpinon in 'UOpinon.pas' {F_Opinon1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Æò°¡ Petition';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
