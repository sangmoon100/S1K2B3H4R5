program PEH1010A;

uses
  Forms,
  UDiaryForm in 'UDiaryForm.pas' {DiaryForm},
  UEmpForm in 'UEmpForm.pas' {Fm_Emp},
  UHelp in 'UHelp.pas' {FHelp},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '�������� �ۼ� �� ����';
  Application.CreateForm(TDiaryForm, DiaryForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.