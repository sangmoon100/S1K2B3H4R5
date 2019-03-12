unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnLineLabel;

type
  TFHelp = class(TForm)
    SF_Main: TOnSchemeForm;
    OnSectionLabel8: TOnSectionLabel;
    Shape6: TShape;
    Label3: TLabel;
    OnSectionLabel5: TOnSectionLabel;
    Shape9: TShape;
    Label8: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    BT_Exit: TOnFocusButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHelp: TFHelp;

implementation

{$R *.DFM}

procedure TFHelp.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TFHelp.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
