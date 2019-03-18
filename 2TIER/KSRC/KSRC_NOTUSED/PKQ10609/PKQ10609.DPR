program PKQ10609;

uses
  Forms,
  pkq106091 in 'pkq106091.pas' {Fpkq10601},
  pkq106092 in 'pkq106092.pas' {CodeForm},
  pkq106094 in 'pkq106094.pas' {FM_main_nts},
  pkq106093 in 'pkq106093.pas' {FM_detail};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연말정산 관리';
  Application.CreateForm(TFpkq10601, Fpkq10601);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.CreateForm(TFM_main_nts, FM_main_nts);
  Application.CreateForm(TFM_detail, FM_detail);
  Application.Run;
end.
