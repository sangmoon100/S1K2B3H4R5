program pta2050b;

uses
  Forms,
  pta2050b1 in 'pta2050b1.pas' {Main_Form},
  peDM in 'peDM.pas' {DM: TDataModule},
  pta2050b2 in 'pta2050b2.pas' {Fkyempno},
  pta2050b3 in 'pta2050b3.pas' {QReport1: TQuickRep},
  PayclCode in 'PayclCode.pas' {codeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외국어 점수현황';
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQReport1, QReport1);
  Application.CreateForm(TFkyempno, Fkyempno);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
