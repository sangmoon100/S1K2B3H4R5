program PZK1020C;

uses
  Forms,
  PZK10201 in 'PZK10201.PAS' {MainForm},
  PZK10202 in 'PZK10202.PAS' {QuickRep1: TQuickRep},
  PZK10203 in 'PZK10203.PAS' {QuickRep2: TQuickRep},
  PZK10204 in 'PZK10204.PAS' {QuickRep3: TQuickRep},
  PZK10205 in 'PZK10205.PAS' {QuickRep4: TQuickRep},
  PZK10206 in 'PZK10206.PAS' {QuickRep5: TQuickRep},
  PZK10208 in 'PZK10208.PAS' {QuickR: TQuickRep},
  PZK10209 in 'PZK10209.PAS' {QuickRep6: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '직무분석서 출력';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TQuickRep1, QuickRep1);
  Application.CreateForm(TQuickRep2, QuickRep2);
  Application.CreateForm(TQuickRep3, QuickRep3);
  Application.CreateForm(TQuickRep4, QuickRep4);
  Application.CreateForm(TQuickRep5, QuickRep5);
  Application.CreateForm(TQuickR, QuickR);
  Application.CreateForm(TQuickRep6, QuickRep6);
  Application.Run;
end.
