program PZZ1030A;

uses
  Forms,
  PZZ1030A1 in 'PZZ1030A1.pas' {FM_InsaMan},
  PDM in 'PDM.pas' {DM: TDataModule},
  PZZ1030A2 in 'PZZ1030A2.pas' {SubForm};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '종합인사관리';
  Application.CreateForm(TFM_InsaMan, FM_InsaMan);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TSubForm, SubForm);
  Application.Run;
end.
