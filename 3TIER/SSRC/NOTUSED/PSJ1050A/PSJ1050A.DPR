program PSJ1050A;

uses
  Forms,
  PSJ1050A1 in 'PSJ1050A1.pas' {FM_Main},
  PSJ1050A2 in 'PSJ1050A2.PAS' {FM_empno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 건강검진 내역관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_empno, FM_empno);
  Application.Run;
end.
