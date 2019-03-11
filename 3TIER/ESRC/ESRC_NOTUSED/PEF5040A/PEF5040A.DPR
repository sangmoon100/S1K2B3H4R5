program PEF5040A;

uses
  Forms,
  PEF50401 in 'PEF50401.pas' {PEF5040},
  UHelp in 'UHelp.pas' {FHelp},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인턴사원 OJT 개인 과제 평가서';
  Application.CreateForm(TPEF5040, PEF5040);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
