unit HAdminForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, RXCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnScheme;

type
  TFM_Admin = class(TForm)
    e_eempno: TOnEdit;
    RxLabel1: TRxLabel;
    BT_Exit: TOnFocusButton;
    SF_Sub: TOnSchemeForm;
    procedure BT_ExitClick(Sender: TObject);
    procedure e_eempnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Admin: TFM_Admin;

implementation

{$R *.DFM}

procedure TFM_Admin.BT_ExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFM_Admin.e_eempnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
     Self.Close;
  end;
end;

end.
