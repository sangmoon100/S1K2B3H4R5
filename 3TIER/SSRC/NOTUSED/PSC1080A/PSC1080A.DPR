program PSC1080A;

uses
  Forms,
  psc10801 in 'psc10801.pas' {FM_Main},
  PSC10802 in 'PSC10802.pas' {FmImageSave},
  PSC10803 in 'PSC10803.pas' {FileListForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '스톡옵션 행사현황';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.


