program PEF6040A;

uses
  Forms,
  PEF60401 in 'PEF60401.pas' {PEF6040},
  UHelp in 'UHelp.pas' {FHelp},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '수습사원 OJT 개인 과제 평가서';
  Application.CreateForm(TPEF6040, PEF6040);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
