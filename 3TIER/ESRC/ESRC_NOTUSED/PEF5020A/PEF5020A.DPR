program PEF5020A;

uses
  Forms,
  UDiaryForm in 'UDiaryForm.pas' {DiaryForm},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UOutputForm in 'UOutputForm.pas' {OutputForm},
  UEmpForm in 'UEMPFORM.PAS' {Fm_Emp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인턴사원 OJT 일일업무일지';
  Application.CreateForm(TDiaryForm, DiaryForm);
  Application.Run;
end.
