program PZA1010A;

uses
  Forms,
  PZA1010A1 in 'PZA1010A1.pas' {MainForm},
  PZA1010A2 in 'PZA1010A2.pas' {FM_Menu},
  PZA1010A3 in 'PZA1010A3.pas' {FM_Prev};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '메뉴관리시스템';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
