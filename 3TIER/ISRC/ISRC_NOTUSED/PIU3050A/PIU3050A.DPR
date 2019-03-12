program PIU3050A;

uses
  Forms,
  PIU30501 in 'PIU30501.PAS' {MainForm},
  PIU30503 in 'PIU30503.PAS' {Fm_sayuview},
  PIU30502 in 'PIU30502.PAS' {Fm_EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '¿Ãµø»Ò∏¡∫Œº≠ µÓ∑œ';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFm_sayuview, Fm_sayuview);
  Application.CreateForm(TFm_EmpForm, Fm_EmpForm);
  Application.Run;
end.
