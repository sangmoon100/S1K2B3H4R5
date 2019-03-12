program PEH2040A;

uses
  Forms,
  PEH2040A1 in 'PEH2040A1.pas' {FM_Main},
  UHelp in 'UHelp.pas' {FHelp},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UPrint in 'UPrint.pas' {QuickReport1: TQuickRep},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '성과 Review 의견 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFHelp, FHelp);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
