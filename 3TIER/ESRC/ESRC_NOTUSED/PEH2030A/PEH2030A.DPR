program PEH2030A;

uses
  Forms,
  PEH2030A1 in 'PEH2030A1.pas' {FM_Main},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  UPrint in 'UPrint.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '성과 Review 의견 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
