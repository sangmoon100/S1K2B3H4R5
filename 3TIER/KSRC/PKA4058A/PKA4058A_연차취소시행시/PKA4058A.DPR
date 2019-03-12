program PKA4058A;

uses
  Forms,
  pka4058a0 in 'pka4058a0.pas' {FM_Main},
  PYCCODE in 'PYCCODE.PAS' {CCodeForm},
  Calen1 in 'Calen1.pas' {calendar},
  pka4058a1 in 'pka4058a1.pas' {DeptForm},
  pka4058a2 in 'pka4058a2.PAS' {Fm_cancelform},
  pka4058a3 in 'pka4058a3.pas' {FM_ConForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연차휴가사용촉진제도';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TCCodeForm, CCodeForm);
  Application.CreateForm(Tcalendar, calendar);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TFm_cancelform, Fm_cancelform);
  Application.CreateForm(TFM_ConForm, FM_ConForm);
  try
    Application.Run;
  except
  end;  
end.
