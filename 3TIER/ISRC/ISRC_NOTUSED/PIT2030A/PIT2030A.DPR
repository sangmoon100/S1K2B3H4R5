program PIT2030A;

uses
  Forms,
  pit203000 in 'pit203000.pas' {MainForm},
  Pit203012 in 'Pit203012.pas' {Fm_SubForm11},
  Pit203013 in 'Pit203013.pas' {Fm_SubForm12},
  Pit203020 in 'Pit203020.pas' {Fm_SubForm2},
  Pit203040 in 'Pit203040.pas' {Fm_SubForm4},
  Pit203030 in 'Pit203030.pas' {Fm_SubForm3},
  UPreview1 in 'UPreview1.pas' {PreviewForm1},
  UPreview2 in 'UPreview2.pas' {Report1: TQuickRep},
  UPreview3 in 'UPreview3.pas' {RptPerDetail: TQuickRep},
  UEmpForm in 'UEmpForm.pas' {Fm_DestValue},
  UDepForm in 'UDepForm.pas' {Fm_DestValue_dept},
  Pit203050 in 'Pit203050.pas' {Fm_SubForm5},
  pit203010 in 'pit203010.pas',
  Pit203011 in 'Pit203011.pas' {Fm_SubForm1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '지원/열람/검토';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreviewForm1, PreviewForm1);
  Application.CreateForm(TReport1, Report1);
  Application.CreateForm(TRptPerDetail, RptPerDetail);
  Application.CreateForm(TFm_DestValue, Fm_DestValue);
  Application.CreateForm(TFm_DestValue_dept, Fm_DestValue_dept);
  Application.Run;
end.
