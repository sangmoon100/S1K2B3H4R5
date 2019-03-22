program pic7020g;

uses
  Forms,
  pic70201 in 'pic70201.pas' {pic7020gForm},
  pic70202 in 'pic70202.pas' {printform},
  pic70203 in 'pic70203.pas' {preview};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직개편 대상자선정';
  Application.CreateForm(Tpic7020gForm, pic7020gForm);
  Application.CreateForm(Tprintform, printform);
  Application.CreateForm(Tpreview, preview);
  Application.Run;
end.
