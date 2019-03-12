program PEK1040A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  PEK1040A2 in 'PEK1040A2.pas' {SubForm1},
  PEK1040A3 in 'PEK1040A3.pas' {SubForm2},
  UObjComm in 'UObjComm.PAS' {ObjCommForm},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  HPrintForm in 'HPRINTFORM.PAS' {PrintForm},
  UHelp in 'UHelp.pas' {FHelp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ÆÀ¿ø Action Contract';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TFHelp, FHelp);
  Application.Run;
end.
