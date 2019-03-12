program PSC1050C;

uses
  Forms,
  PSC10501 in 'PSC10501.PAS' {FM_Main},
  PSC10502 in 'PSC10502.PAS' {ZipForm},
  PSC10503 in 'PSC10503.PAS' {SepForm};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'STOCK OPTION ¿­¶÷';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TZipForm, ZipForm);
  Application.Run;
end.
