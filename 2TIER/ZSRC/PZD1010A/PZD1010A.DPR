program PZD1010A;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UPrintT in 'UPrintT.pas' {FrmPrintT},
  USawon in 'USawon.pas' {FrmSawon},
  UInput in 'UInput.pas' {FrmInput},
  UImsi in 'UImsi.pas' {FrmImsi},
  UInfo in 'UInfo.pas' {FrmInfo},
  UHis in 'UHis.pas' {FrmHis},
  UMainForm in 'UMainForm.pas' {Mainform},
  UPrintF in 'UPrintF.pas' {FrmPrintF};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사원증 발급관리';
  Application.CreateForm(TMainform, Mainform);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmPrintT, FrmPrintT);
  Application.CreateForm(TFrmPrintF, FrmPrintF);
  Application.Run;
end.
