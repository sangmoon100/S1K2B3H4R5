program PKY1100A;

uses
  Forms,
  PKY1100A1 in 'PKY1100A1.pas' {FM_Main},
  PKY1100A2 in 'PKY1100A2.pas' {FM_Sub},
  PKY1100A3 in 'PKY1100A3.pas' {FM_Print};

{$R *.RES}

begin
  Application.Title := '월변동자료추출(pkc1030g)';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_Sub, FM_Sub);
  Application.CreateForm(TFM_Print, FM_Print);
  Application.Run;
end.
