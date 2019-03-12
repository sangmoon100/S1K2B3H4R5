program PZK1010A;

uses
  Forms,
  PZK10101 in 'PZK10101.PAS' {MainForm},
  PZK10102 in 'PZK10102.PAS' {Sub_Career},
  PZK10103 in 'PZK10103.PAS' {Sub_Work},
  PZK10104 in 'PZK10104.PAS' {Sub_Motive},
  PZK10105 in 'PZK10105.PAS' {Sub_Task},
  PZK10106 in 'PZK10106.PAS' {CForm},
  PZK10107 in 'PZK10107.PAS' {DicForm},
  PZK10108 in 'PZK10108.PAS' {OrgForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '직무분석서 등록';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCForm, CForm);
  Application.CreateForm(TDicForm, DicForm);
  Application.CreateForm(TOrgForm, OrgForm);
  Application.Run;
end.
