program PKY1050A;

uses
  Forms,
  PKY1050A0 in 'PKY1050A0.pas' {DM: TDataModule},
  PKY1050A1 in 'PKY1050A1.pas' {FM_Main},
  PKY1050A2 in 'PKY1050A2.pas' {FM_Sub1},
  PKY1050A3 in 'PKY1050A3.pas' {FM_Sub2},
  PKY1050A4 in 'PKY1050A4.pas' {FM_Sub3},
  PKY1050A5 in 'PKY1050A5.pas' {QuickReport1: TQuickRep},
  PKY1050A6 in 'PKY1050A6.pas' {QuickReport2: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '초과근무 일괄 등록/결재';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFM_Sub1, FM_Sub1);
  Application.CreateForm(TFM_Sub2, FM_Sub2);
  Application.CreateForm(TFM_Sub3, FM_Sub3);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.CreateForm(TQuickReport2, QuickReport2);
  Application.Run;
end.
