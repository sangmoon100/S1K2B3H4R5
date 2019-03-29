program pib3030c;

uses
  Forms,
  pib30301 in 'pib30301.pas' {pib30301Form},
  pib30302 in 'pib30302.pas' {PrintForm1},
  pib30304 in 'pib30304.pas' {pib30304Form},
  pib30305 in 'pib30305.pas' {PrintForm2};

{$R *.RES}

begin
  Application.Title := '경력증명서 발급';
  Application.CreateForm(Tpib30301Form, pib30301Form);
  Application.CreateForm(TPrintForm1, PrintForm1);
  Application.CreateForm(Tpib30304Form, pib30304Form);
  Application.CreateForm(TPrintForm2, PrintForm2);
  Application.Run;
end.
