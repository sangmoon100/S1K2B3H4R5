program PIU2020A;

uses
  Forms,
  PIU20201 in 'PIU20201.PAS' {MainForm},
  PIU20202 in 'PIU20202.PAS' {SubForm},
  PIU20203 in 'PIU20203.PAS' {Fm_SubForm11},
  PIU20205 in 'PIU20205.PAS' {PrintForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '배치전환 관리';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.Run;
end.
