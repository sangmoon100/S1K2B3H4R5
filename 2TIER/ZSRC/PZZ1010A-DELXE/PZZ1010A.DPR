program PZZ1010A;

uses
  Forms,
  AdminMain in 'AdminMain.pas' {FM_Main},
  AdminUser in 'AdminUser.pas' {FM_User},
  AdminTable in 'AdminTable.pas' {FM_Table},
  AUserPopup in 'AUserPopup.pas' {FM_UserPopup},
  AdminQuery in 'AdminQuery.pas' {FM_Query};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Active Query Builder °ü¸®ÀÚ Tool';
  Application.CreateForm(TFM_Main, FM_Main);
  Application.CreateForm(TFM_UserPopup, FM_UserPopup);
  Application.Run;
end.
