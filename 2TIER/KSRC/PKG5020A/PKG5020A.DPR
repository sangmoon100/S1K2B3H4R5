program PKG5020A;

uses
  Forms,
  PKG5020A1 in 'PKG5020A1.pas' {FM_MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '背措辟公 何辑包府';
  Application.CreateForm(TFM_MainForm, FM_MainForm);
  Application.Run;
end.
