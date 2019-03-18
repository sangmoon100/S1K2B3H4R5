program PKQ1068A;

uses
  Forms,
  pkq10608 in 'pkq10608.pas' {Fpkq10608},
  Iempno in '..\..\..\..\Documents and Settings\socmtnuser010\바탕 화면\PKQ1060A\Iempno.pas' {FIempno};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '연말정산 관리';
  Application.CreateForm(TFpkq10608, Fpkq10608);
  Application.CreateForm(TFIempno, FIempno);
  Application.Run;
end.
