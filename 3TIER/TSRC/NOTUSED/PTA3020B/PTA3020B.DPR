program PTA3020B;

uses
  Forms,
  PTA30201 in 'PTA30201.PAS' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point �̷� ��ȸ';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
