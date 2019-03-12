program PEK1050A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  USubForm1 in 'USubForm1.pas' {SubForm1},
  USubForm2 in 'USubForm2.pas' {SubForm2},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm},
  USubForm3 in 'USubForm3.pas' {SubForm3},
  UObjComm in 'UObjComm.PAS' {ObjCommForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '∆¿¿Â Action Contract';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.CreateForm(TObjCommForm, ObjCommForm);
  Application.Run;
end.
