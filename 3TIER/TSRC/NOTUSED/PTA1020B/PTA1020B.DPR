program pta1020b;

uses
  Forms,
  pta10201 in 'PTA10201.PAS' {FM_Main},
  pta10202 in 'PTA10202.PAS' {FM_empno};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인 외국어 점수 열람';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
