program PTA4030B;

uses
  Forms,
  PTA40301 in 'PTA40301.pas' {frmMain},
  PTA40302 in 'PTA40302.pas' {QuickReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내교수 이력 출력';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TQuickReport1, QuickReport1);
  Application.Run;
end.
