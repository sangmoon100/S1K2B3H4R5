program PSC1100A;

uses
  Forms,
  psc11001 in 'psc11001.pas' {FM_Main};
//  StockXMLUnit in 'StockXMLUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'SK브로드밴드 종가관리';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.


