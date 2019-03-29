program PIE2310C;

uses
  Forms,
  PIE23101 in 'PIE23101.pas' {MainForm},
  PIE23103 in 'PIE23103.pas' {PreViewForm},
  PIE23107 in 'PIE23107.pas' {NewPrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인력정원(TO) 관리현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreViewForm, PreViewForm);
  Application.CreateForm(TNewPrintForm, NewPrintForm);
  Application.Run;
end.
