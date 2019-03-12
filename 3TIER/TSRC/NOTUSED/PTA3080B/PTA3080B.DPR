program PTA3080B;

uses
  Forms,
  PTA30801 in 'PTA30801.PAS' {MainForm},
  PTA30802 in 'PTA30802.PAS' {DeptForm},
  UHelp in 'UHelp.pas' {FHelp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Learning Point 기준관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
