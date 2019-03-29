program PIT2040A;

uses
  Forms,
  PIT2040A1 in 'PIT2040A1.pas' {MainForm},
  PIT2040A2 in 'PIT2040A2.PAS' {DM: TDataModule},
  PIT2040A3 in 'PIT2040A3.PAS' {Fm_SubForm1},
  PIT2040A4 in 'PIT2040A4.PAS' {Fm_SubForm2},
  PIT2040A5 in 'PIT2040A5.PAS' {Fm_SubForm3},
  PIT2040A6 in 'PIT2040A6.PAS' {GAddDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내인재교류관리';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
