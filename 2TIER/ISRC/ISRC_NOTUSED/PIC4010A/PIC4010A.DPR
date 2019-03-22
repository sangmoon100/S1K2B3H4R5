program PIC4010A;

uses
  Forms,
  PIC4010A1 in 'PIC4010A1.pas' {Fm_PIC4010A1},
  Fm_DM in 'Fm_DM.PAS' {DM: TDataModule},
  PIC4010A3 in 'PIC4010A3.pas' {Fm_PIC4010A3},
  PIC4010A2 in 'PIC4010A2.pas' {Fm_PIC4010A2},
  PIC4010A4_1 in 'PIC4010A4_1.pas' {Fm_PIC4010A4_1},
  PIC4010A3_1 in 'PIC4010A3_1.pas' {Fm_PIC4010A3_1},
  PIC4010A4 in 'PIC4010A4.pas' {Fm_PIC4010A4},
  PIC4010A2_1 in 'PIC4010A2_1.pas' {Fm_PIC4010A2_1},
  Codelib in 'codelib.pas' {codeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'BAND조정 기준 관리';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFm_PIC4010A1, Fm_PIC4010A1);
  Application.CreateForm(TFm_PIC4010A2_1, Fm_PIC4010A2_1);
  Application.CreateForm(TcodeForm, codeForm);
  Application.Run;
end.
