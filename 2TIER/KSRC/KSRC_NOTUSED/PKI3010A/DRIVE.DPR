program Drive;

uses
  Forms,
  Drive_s in 'Drive_s.pas' {frmMain},
  Drive_s2 in 'Drive_s2.pas' {frmSub1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '운전지원금관리';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
