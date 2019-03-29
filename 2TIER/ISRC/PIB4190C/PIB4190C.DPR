program pib4190c;

uses
  Forms,
  pib41902 in 'pib41902.pas' {CData: TDataModule},
  pib41904 in 'pib41904.pas' {PrnForm1: TQuickRep},
  pib41901 in 'pib41901.pas' {MainForm},
  pib41903 in 'PIB41903.PAS' {ViewForm};

{$R *.RES}
begin
  Application.Initialize;
  Application.Title := '직책자 명단';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCData, CData);
  Application.CreateForm(TPrnForm1, PrnForm1);
  Application.CreateForm(TViewForm, ViewForm);
  Application.Run;
end.
