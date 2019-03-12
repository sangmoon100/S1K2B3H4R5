program PSH1050A;

uses
  Forms,
  PSH10501 in 'PSH10501.PAS' {FM_Main},
  PSH10502 in 'PSH10502.PAS' {DeptForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '사내 대출금 통합 조회';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TDeptForm, DeptForm);
  Application.Run;
end.
