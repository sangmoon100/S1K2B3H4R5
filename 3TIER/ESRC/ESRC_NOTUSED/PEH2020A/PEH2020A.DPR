program PEH2020A;

uses
  Forms,
  UDiaryForm in 'UDiaryForm.pas' {DiaryForm},
  UEmpForm in 'UEmpForm.pas' {Fm_Emp},
  UHelp in 'UHelp.pas' {FHelp},
  UPrintForm in 'UPrintForm.pas' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '육성일지 작성 및 열람';
  Application.CreateForm(TDiaryForm, DiaryForm);
  Application.CreateForm(TFm_Emp, Fm_Emp);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
