program PSC1040B;

uses
  Forms,
  PSC10401 in 'PSC10401.PAS' {PSC1040BF};

{$E EXE}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'STOCK OPTION Á¶È¸';
  Application.CreateForm(TPSC1040BF, PSC1040BF);
  Application.Run;
end.
