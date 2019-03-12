program PIU3040A;

uses
  Forms,
  PIU3040A1 in 'PIU3040A1.pas' {FM_Mainform},
  PIU3040A2 in 'PIU3040A2.PAS' {FM_Pihanno},
  popup in 'POPUP.PAS' {Fm_quest};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '근무 기간 조회';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TFM_Pihanno, FM_Pihanno);
  Application.CreateForm(TFm_quest, Fm_quest);
  Application.Run;
end.
