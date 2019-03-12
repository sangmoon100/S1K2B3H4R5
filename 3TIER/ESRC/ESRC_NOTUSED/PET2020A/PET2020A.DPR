program PET2020A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  HPrintForm in 'HPrintForm.pas' {PrintForm},
  UPrnview in 'UPRNVIEW.PAS' {Fm_PreviewForm},
  UTeamForm in 'UTEAMFORM.PAS' {TeamForm},
  UValueForm in 'UValueForm.pas' {ValueForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '무기계약직 자기평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
