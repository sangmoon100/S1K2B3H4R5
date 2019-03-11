program PEH1030A;

uses
  Forms,
  PEH1030A1 in 'PEH1030A1.pas' {FM_Main},
  UHelp in 'UHelp.pas' {FHelp},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UPrint in 'UPrint.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '성과 Review 의견 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFHelp, FHelp);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
