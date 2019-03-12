program PIT1030A;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UDutyForm in 'UDutyForm.pas' {DutyForm},
  common in 'COMMON.PAS',
  UbatchForm in 'UbatchForm.pas' {BatchForm},
  UCodeForm in 'UCodeForm.pas' {CodeForm},
  USubForm in 'USubForm.pas' {SubForm},
  URegForm in 'URegForm.pas' {RegForm},
  UPreview in 'UPreview.pas' {PreviewForm},
  UpitLib in 'UpitLib.pas',
  ULevelForm in 'ULevelForm.pas' {LevelForm},
  UPayClForm in 'UPayClForm.pas' {PayClForm},
  UEmpForm in 'UEmpForm.pas' {Fm_DestValue},
  UConfirmForm in 'UConfirmForm.pas' {ConForm},
  UPIA1070B_6 in 'UPIA1070B_6.pas' {AnnoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별직무경력등록';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.CreateForm(TFm_DestValue, Fm_DestValue);
  Application.Run;
end.
