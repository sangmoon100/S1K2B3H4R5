program PZO1020A;

uses
  Forms,
  PZO1020A1 in 'PZO1020A1.pas' {FM_Mainform},
  FEMPNO in 'FEMPNO.PAS' {empForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '���忬�����ڰ���';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TempForm, empForm);
  Application.Run;
end.
