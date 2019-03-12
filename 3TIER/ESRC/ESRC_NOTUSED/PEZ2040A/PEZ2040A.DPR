program PEZ2040A;

uses
  Forms,
  pez2040a1 in 'pez2040a1.pas' {FM_Main},
  pez2040a2 in 'pez2040a2.pas' {FM_Result1},
  pez2040a3 in 'pez2040a3.pas' {FM_Result2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '임원 상사/CEO 평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Result1, FM_Result1);
  Application.CreateForm(TFM_Result2, FM_Result2);
  try
    Application.Run;
  except
  end;  
end.
