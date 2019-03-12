program PZC1021A;

uses
  Forms,
  PZC10211 in 'PZC10211.PAS' {DeptForm},
  PZC10212 in 'PZC10212.PAS' {QReport1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '犁公何辑内靛 包府';
  Application.CreateForm(TDeptForm, DeptForm);
  Application.CreateForm(TQReport1, QReport1);
  Application.Run;
end.
