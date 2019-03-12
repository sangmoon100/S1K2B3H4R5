program pib2020b;

uses
  Forms,
  WinTypes,
  Messages,
  pass,
  sysutils,
  Classes,
  Graphics,
  Controls,
  StdCtrls,
  ExtCtrls,
  PIB20201 in 'PIB20201.PAS' {MainForm},
  PIB20202 in 'PIB20202.PAS' {MDIChild},
  PIB20203 in 'PIB20203.PAS' {deptSelForm},
  PIB20207 in 'PIB20207.PAS' {PerimageForm},
  PIB20204 in 'PIB20204.PAS' {empsForm},
  PIB20205 in 'PIB20205.PAS' {CData: TDataModule},
  PIB20206 in 'PIB20206.PAS' {PersonForm};

{$R *.RES}
var
  wnd : HWnd;
begin
  wnd := FindWindow('TApplication','조직도 열람');
  if wnd > 0 then begin
     SendMessage(wnd,WM_SETFOCUS,0,0);
     ShowWindow(wnd,SW_SHOWNORMAL);
     SetForeGroundWindow(wnd);
  end else begin
     Application.Title := '조직도 열람-종합인사';
     Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCData, CData);
  Application.CreateForm(TPersonForm, PersonForm);
  Application.Run;
  end;
end.
