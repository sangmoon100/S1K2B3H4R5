program PIR2020A;

uses
  Forms,
  PIR20202A in 'PIR20202A.pas' {PrintForm},
  PIR20201A in 'PIR20201A.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
