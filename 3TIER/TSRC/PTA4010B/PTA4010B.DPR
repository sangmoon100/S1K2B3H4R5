program PTA4010B;

uses
  Forms,
  PTA40101 in 'PTA40101.pas' {frmMain},
  PTA40102 in 'PTA40102.pas' {frmReg};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '교수등록 및 현황';  
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
