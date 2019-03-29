program pie2190c;

uses
  Forms,
  pie21901 in 'pie21901.pas' {MainForm},
  pie21902 in 'pie21902.pas' {PrnForm1},
  pie21903 in 'pie21903.pas' {PrnForm2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '공석조직 현황';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPrnForm1, PrnForm1);
  Application.CreateForm(TPrnForm2, PrnForm2);
  Application.Run;
end.
