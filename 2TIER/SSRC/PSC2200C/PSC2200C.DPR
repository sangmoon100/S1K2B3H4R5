program psc2200c;

uses
  Forms,
  psc22001 in 'psc22001.pas' {F_psc22001},
  psc22003 in 'psc22003.pas' {F_psc22003},
  psc22004 in 'psc22004.pas' {F_psc22004},
  PSC22002 in 'PSC22002.PAS' {Fm_PreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '우리사주 조합가입 및 탈퇴현황 출력';
  Application.CreateForm(TF_psc22001, F_psc22001);
  Application.CreateForm(TF_psc22003, F_psc22003);
  Application.Run;
end.
