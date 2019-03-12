program PZD1020A;

uses
  Forms,
  PZD10201 in 'PZD10201.pas' {MainForm},
  PZD1020A_emp in 'PZD1020A_emp.pas' {FM_empno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '제증명발급신청';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFM_empno, FM_empno);
  Application.Run;
end.
