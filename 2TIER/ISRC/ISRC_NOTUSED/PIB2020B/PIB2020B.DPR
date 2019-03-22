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
  orgmain in 'orgmain.pas' {MainForm},
  orgchild in 'orgchild.pas' {MDIChild},
  deptForm in 'deptForm.pas' {deptSelForm},
  perForm in 'perForm.pas' {PersonForm},
  perImage in 'perImage.pas' {PerimageForm},
  empForm in 'empForm.pas' {empsForm};

{$R *.RES}
var
  wnd : HWnd;
begin
  wnd := FindWindow('TApplication','조직도 열람');
  if wnd > 0 then
  begin
     SendMessage(wnd,WM_SETFOCUS,0,0);
     ShowWindow(wnd,SW_SHOWNORMAL);
     SetForeGroundWindow(wnd);
  end
  else
  begin
     Application.HelpFile := '';
     Application.Title    := '조직도 열람';
     Application.CreateForm(TMainForm, MainForm);
     if FileExists(pChar(HomeDirOpen+'\pic\insaback.bmp')) = True then
     BEGIN
        MainForm.BackImage.Picture.LoadFromFile(HomeDir+'\pic\insaback.bmp');
     end;

     Application.Run;
  end;
end.
