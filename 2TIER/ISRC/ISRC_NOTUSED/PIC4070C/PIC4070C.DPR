program Pic4070c;

uses
  Forms,
  pic40701 in 'pic40701.pas' {MainForm},
  pic40710 in 'pic40710.pas' {FmPic40710},
  pic40712 in 'pic40712.pas' {FmPic40712},
  pic40713 in 'pic40713.pas' {FmPic40713},
  pic40715 in 'pic40715.pas' {FmPic40715},
  pic40714 in 'pic40714.pas' {FmPic40714};

{$R *.RES}
begin
  Application.Initialize;
  Application.Title := 'BAND조정 서열 명부';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
