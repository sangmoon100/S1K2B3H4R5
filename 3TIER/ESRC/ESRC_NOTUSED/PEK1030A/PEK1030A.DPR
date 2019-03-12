program PEK1030A;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main},
  USubForm1 in 'USubForm1.pas' {SubForm1},
  USubForm2 in 'USubForm2.pas' {SubForm2},
  HPrintForm in 'HPRINTFORM.PAS' {PrintForm},
  UObjComm in 'UObjComm.PAS' {ObjCommForm},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '∆¿¿Â Action Contract';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
