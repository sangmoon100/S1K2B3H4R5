program PSC2100A;

uses
  Forms,
  PSC2100A1 in 'PSC2100A1.pas' {FM_Main},
  PSC2100A2 in 'PSC2100A2.pas' {FM_Print};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사주배정신청';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Print, FM_Print);
  Application.Run;
end.
