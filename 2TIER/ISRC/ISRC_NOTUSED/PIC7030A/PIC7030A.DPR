program pic7030a;

uses
  Forms,
  pic70301 in 'pic70301.pas' {MainForm},
  pic70302 in 'pic70302.pas' {CData: TDataModule},
  pic70303 in 'pic70303.pas' {BonForm},
  pic70304 in 'pic70304.pas' {SubForm},
  pic70306 in 'pic70306.pas' {PrnForm1: TQuickRep},
  pic70305 in 'pic70305.pas' {ViewForm},
  pic70307 in 'pic70307.pas' {PrnForm2: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '조직개편 부서배치';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCData, CData);
  Application.CreateForm(TViewForm, ViewForm);
  Application.CreateForm(TPrnForm2, PrnForm2);
  Application.CreateForm(TPrnForm1, PrnForm1);
  Application.Run;
end.
