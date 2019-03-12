program PSH1020A;

uses
  Forms,
  PSH1020A1 in 'PSH1020A1.pas' {FM_Mainform},
  Pcode in 'Pcode.pas' {FCodeForm},
  PSH1020A3 in 'PSH1020A3.PAS' {FM_Sms},
  PSH1020A4 in 'PSH1020A4.PAS' {FM_Viewer32};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '복리후생신청';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TFM_Sms, FM_Sms);
  Application.Run;
end.
