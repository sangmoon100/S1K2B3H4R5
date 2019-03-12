program PSH1040C;

uses
  Forms,
  PSH1040C1 in 'PSH1040C1.pas' {FM_Mainform},
  PSH1040C2 in 'PSH1040C2.pas' {FM_Print1},
  PSH1040C3 in 'PSH1040C3.pas' {FM_Print2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '복리후생신청 이력조회';
  Application.CreateForm(TFM_Mainform, FM_Mainform);
  Application.Run;
end.
