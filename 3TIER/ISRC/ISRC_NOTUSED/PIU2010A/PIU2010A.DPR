program PIU2010A;

uses
  Forms,
  PIU20101 in 'PIU20101.PAS' {MainForm},
  PIU20102 in 'PIU20102.PAS' {Fm_SubForm11},
  PIU20103 in 'PIU20103.PAS' {PrintForm},
  PIU20104 in 'PIU20104.PAS' {FM_Pihanno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '배치전환 신청';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TFM_Pihanno, FM_Pihanno);
  Application.Run;
end.
