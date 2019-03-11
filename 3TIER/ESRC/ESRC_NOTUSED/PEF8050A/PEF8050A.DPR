program PEF8050A;

uses
  Forms,
  PEF8050A1 in 'PEF8050A1.pas' {FM_Main},
  UHelp in 'UHelp.pas' {FHelp},
  UPrint in 'UPrint.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '¼º°ú Review';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
