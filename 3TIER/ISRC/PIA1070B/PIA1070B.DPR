program PIA1070B;

uses
  Forms,
  PIA1070B_1 in 'PIA1070B_1.pas' {FM_Main},
  PIA1070B_2 in 'PIA1070B_2.pas' {FM_SubForm1},
  PIA1070B_3 in 'PIA1070B_3.pas' {FM_SubForm2},
  PIA1070B_4 in 'PIA1070B_4.pas' {FM_SubForm3},
  PIA1070B_3_2 in 'PIA1070B_3_2.pas' {FM_SubForm2_2},
  PIA1070B_4_4 in 'PIA1070B_4_4.pas' {FM_SubForm4_4},
  PIA1070B_4_1 in 'PIA1070B_4_1.pas' {FM_SubForm4_1},
  PIA1070B_5 in 'PIA1070B_5.PAS' {FM_SubForm4},
  PIA1070B_6 in 'PIA1070B_6.pas' {FM_SubForm5},
  PIA1070B_7 in 'PIA1070B_7.PAS' {FM_SubForm6},
  PIA1070B_8 in 'PIA1070B_8.pas' {ZipForm},
  PIA1070B_9 in 'PIA1070B_9.pas' {FM_SubForm9},
  PIA1070B_dept in 'PIA1070B_DEPT.PAS' {FM_Dept},
  PIA1070B_emp in 'PIA1070B_EMP.PAS' {FM_empno},
  PIA1070B_pic in 'PIA1070B_PIC.PAS' {FileListForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '기본인사종합열람';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_SubForm2_2, FM_SubForm2_2);
  Application.CreateForm(TFM_SubForm4_4, FM_SubForm4_4);
  Application.CreateForm(TFM_SubForm4_1, FM_SubForm4_1);
  Application.CreateForm(TFM_SubForm4, FM_SubForm4);
  Application.CreateForm(TFM_SubForm5, FM_SubForm5);
  Application.CreateForm(TFM_SubForm6, FM_SubForm6);
  Application.CreateForm(TZipForm, ZipForm);
  Application.CreateForm(TFM_SubForm9, FM_SubForm9);
  Application.CreateForm(TFM_Dept, FM_Dept);
  Application.CreateForm(TFM_empno, FM_empno);
  Application.CreateForm(TFileListForm, FileListForm);
  Application.Run;
end.
