program PEF8040A;

uses
  Forms,
  PEF8040A1 in 'PEF8040A1.pas' {FM_Main},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UHelp in 'UHelp.pas' {FHelp},
  UPrint in 'UPrint.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '¼º°ú Review';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
