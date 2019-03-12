program PEK2020A;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {FM_Main},
  UEduForm in 'UEduForm.pas' {FEduForm},
  OnTmaxCodeEdit in 'ONTMAXCODEEDIT.PAS' {TMaxCodeForm},
  On_pmEdunm in 'On_pmEdunm.pas' {FM_pmEdunm},
  On_pmBumoon in 'On_pmBumoon.pas' {FM_pmBumoon},
  On_pmTrack in 'On_pmTrack.pas' {FM_pmTrack},
  On_pmLevel in 'On_pmLevel.pas' {FM_pmLevel},
  On_pmEkind in 'On_pmEkind.pas' {FM_pmEkind},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UHelp in 'UHelp.pas' {FHelp},
  UPrintForm1 in 'UPrintForm1.pas' {PrintForm1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'My Plan µî·Ï';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
