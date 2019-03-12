program PKA4057A;

uses
  Forms,
  pka4057a1 in 'pka4057a1.pas' {FM_Main},
  pka4057a2 in 'pka4057a2.pas' {FM_Dept},
  PKA4057A3 in 'PKA4057A3.PAS' {FM_subMain},
  PKA4057A4 in 'PKA4057A4.PAS' {EmpForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연차휴가사용촉진제도';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Dept, FM_Dept);
  Application.CreateForm(TFM_subMain, FM_subMain);
  Application.CreateForm(TEmpForm, EmpForm);
  try
    Application.Run;
  except
  end;  
end.
