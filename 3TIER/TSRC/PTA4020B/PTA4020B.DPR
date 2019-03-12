program PTA4020B;

uses
  Forms,
  PTA40201 in 'PTA40201.pas' {frmMain},
  PTA40202 in 'PTA40202.pas' {frmReg},
  PTA40203 in 'PTA40203.pas' {CForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '강의이력등록 및 조회';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TCForm, CForm);
  Application.Run;
end.
