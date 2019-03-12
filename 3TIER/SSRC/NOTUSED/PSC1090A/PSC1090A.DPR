program PSC1090A;

uses
  Forms,
  psc10901 in 'psc10901.pas' {FM_Main},
  PSC10902 in 'PSC10902.pas' {FmImageSave},
  PSC10903 in 'PSC10903.pas' {FileListForm},
  PSC10904 in 'PSC10904.pas' {FmPSC10904},
  PSC10905 in 'PSC10905.pas' {FM_Print};
//  StockXMLUnit in 'StockXMLUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
//  Application.Title := '전산매체 작성용 데이터 전송';
  Application.Title := 'StockOption 행사관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.


