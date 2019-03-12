program PIU3010A;

uses
  Forms,
  PIU3010A1 in 'PIU3010A1.pas' {FM_Main},
  UHelp in 'UHelp.pas' {FHelp},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UAnnoForm in 'UAnnoForm.pas' {AnnoForm},
  Uprint1 in 'Uprint1.pas' {QuickRep1: TQuickRep},
  Uprint2 in 'Uprint2.pas' {QuickRep2: TQuickRep},
  piu3010a2 in 'piu3010a2.PAS' {Fm_moveform};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '자기진단서 및 경력계획서 작성';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFHelp, FHelp);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TAnnoForm, AnnoForm);
  Application.CreateForm(TQuickRep1, QuickRep1);
  Application.CreateForm(TQuickRep2, QuickRep2);
  Application.CreateForm(TFm_moveform, Fm_moveform);
  Application.Run;
end.
