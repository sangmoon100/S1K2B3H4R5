program PEF6020A;

uses
  Forms,
  UDiaryForm in 'UDiaryForm.pas' {DiaryForm},
  UPrintForm in 'UPrintForm.pas' {PrintForm},
  UOutputForm in 'UOutputForm.pas' {OutputForm},
  UEMPFORM in 'UEMPFORM.PAS' {Fm_Emp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '수습사원 OJT 주간업무보고';
  Application.CreateForm(TDiaryForm, DiaryForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TOutputForm, OutputForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.Run;
end.
