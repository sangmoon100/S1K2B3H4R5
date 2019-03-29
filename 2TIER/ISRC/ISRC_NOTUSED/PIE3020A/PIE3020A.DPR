program PIE3020A;

uses
  Forms,
  PIE30201 in 'PIE30201.pas' {MainForm},
  PIE30208 in 'PIE30208.pas' {NewPrintForm1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '부서/BAND별 인원현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNewPrintForm1, NewPrintForm1);
  Application.Run;
end.
