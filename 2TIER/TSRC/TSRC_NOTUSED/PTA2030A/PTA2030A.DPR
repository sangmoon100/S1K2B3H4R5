program PTA2030A;

uses
  Forms,
//  PTA2030A1_1 in 'PTA2030A1_1.pas' {Fm_PTA2030A1_1},
  PTA2030A1 in 'PTA2030A1.pas' {Fm_PTA2030A1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '외국어 기준관리';
  Application.CreateForm(TFm_PTA2030A1, Fm_PTA2030A1);
  Application.Run;
end.
