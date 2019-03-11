program PEF7010A;

uses
  Forms,
  PEF7010A1 in 'PEF7010A1.pas' {FM_Main},
  UEmpForm in 'UEmpForm.pas' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '파견사원 평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  try
    Application.Run;
  except
  end;  
end.
