program PET1010B;

uses
  Forms,
  HMainForm in 'HMainForm.pas' {FM_Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '공동목표평가';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.Run;
end.
