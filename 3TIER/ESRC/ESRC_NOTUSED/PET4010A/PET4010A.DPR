program PET4010A;

uses
  Forms,
  UPMain in 'UPMain.pas' {PMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '동료평가 점수등록';
  Application.CreateForm(TPMain, PMain);
  Application.Run;
end.
