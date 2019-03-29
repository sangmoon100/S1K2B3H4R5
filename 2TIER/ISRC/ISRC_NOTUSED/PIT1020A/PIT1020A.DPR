program PIT1020A;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  URegForm in 'URegForm.pas' {RegForm},
  UCodeForm in 'UCodeForm.pas' {CodeForm},
  commondm in 'commondm.pas' {DM: TDataModule},
  ULevelForm in 'ULevelForm.pas' {LevelForm},
  UPayClForm in 'UPayClForm.pas' {PayClForm},
  UDutyForm in 'UDutyForm.pas' {DutyForm},
  USubForm in 'USubForm.pas' {SubForm},
  UpitLib in 'UpitLib.pas',
  UPreview in 'UPreview.pas' {PreviewForm},
  UbatchForm in 'UbatchForm.pas' {BatchForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '개인별 직무 등록/열람';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.Run;
end.
