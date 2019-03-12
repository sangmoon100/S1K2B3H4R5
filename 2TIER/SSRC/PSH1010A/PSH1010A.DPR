program PSH1010A;

uses
  Forms,
  PSH1010A1 in 'PSH1010A1.pas' {FM_Mainform},
  PSH1010A2 in 'PSH1010A2.PAS' {CodeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '복리후생신청';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.Run;
end.
