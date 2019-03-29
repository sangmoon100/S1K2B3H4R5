program PIT1040C;

uses
  Forms,
  umain in 'umain.pas' {Main},
  pit1040c0 in 'pit1040c0.pas' {DM: TDataModule},
  pit1040c1 in 'pit1040c1.pas' {MainForm},
  pit1040c2 in 'pit1040c2.pas' {SubForm},
  pit1040c3 in 'pit1040c3.pas' {LevelForm},
  pit1040c4 in 'pit1040c4.pas' {DutyForm},
  pit1040c5 in 'pit1040c5.pas' {PayClForm},
  pit1040c6 in 'pit1040c6.pas' {RptTotal: TQuickRep},
  pit1040c7 in 'pit1040c7.pas' {RptPerDetail: TQuickRep},
  UpitLib in 'UpitLib.pas',
  pit1040c9 in 'pit1040c9.pas' {MainForm2},
  Pit1040c10 in 'pit1040c10.pas' {pit1040c10Form};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인적자원정보검색';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainForm2, MainForm2);
  Application.CreateForm(Tpit1040c10Form, pit1040c10Form);
  Application.Run;
end.
