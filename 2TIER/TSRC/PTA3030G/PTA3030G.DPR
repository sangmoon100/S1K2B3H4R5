program PTA3030G;

uses
  Forms,
  PTA30301 in 'PTA30301.PAS' {MainForm},
  PTA30303 in 'PTA30303.PAS' {CEduForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point ���� �ϰ����';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCEduForm, CEduForm);
  Application.Run;
end.
