program PSJ1030A;

uses
  Forms,
  PSJ1030A1 in 'PSJ1030A1.pas' {FM_Main},
  PSJ1030A2 in 'PSJ1030A2.pas' {FM_Print},
  PSJ1030A3 in 'PSJ1030A3.PAS' {ChartForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '건강검진내역관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Print, FM_Print);
  Application.Run;
end.
