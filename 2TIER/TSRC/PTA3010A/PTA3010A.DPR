program PTA3010A;

uses
  Forms,
  PTA30101 in 'PTA30101.PAS' {MainForm},
  PTA30102 in 'PTA30102.PAS' {CForm},
  PTA30103 in 'PTA30103.PAS' {CEduForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point 내역 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCForm, CForm);
  Application.CreateForm(TCEduForm, CEduForm);
  Application.Run;
end.
