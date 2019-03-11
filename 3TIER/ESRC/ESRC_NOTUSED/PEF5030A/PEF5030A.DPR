program PEF5030A;

uses
  Forms,
  UDiaryForm in 'UDiaryForm.pas' {DiaryForm},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UEmpForm in 'UEMPFORM.PAS' {Fm_Emp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '인턴사원 OJT 일일업무일지';
  Application.CreateForm(TDiaryForm, DiaryForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.Run;
end.
