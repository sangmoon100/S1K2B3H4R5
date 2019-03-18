program PKQ10610;

uses
  Forms,
  pkq106101 in 'pkq106101.pas' {Fpkq10601},
//  Iempno in '..\PKQ1060A\Iempno.pas' {FIempno},
  pkq106102 in 'pkq106102.pas' {CodeForm},
  pkq106104 in 'pkq106104.pas' {FM_main_nts},
  pkq106103 in 'pkq106103.pas' {FM_detail};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연말정산 관리';
  Application.CreateForm(TFpkq10601, Fpkq10601);
//  Application.CreateForm(TFIempno, FIempno);
  Application.CreateForm(TCodeForm, CodeForm);
  Application.CreateForm(TFM_main_nts, FM_main_nts);
  Application.CreateForm(TFM_detail, FM_detail);
  Application.Run;
end.
