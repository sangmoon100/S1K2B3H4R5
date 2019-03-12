unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton;

type
  TFHelp = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    ExitBtn: TOnFocusButton;
    Shape2: TShape;
    Shape3: TShape;
    Label558: TLabel;
    Label559: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    Shape6: TShape;
    Label5: TLabel;
    Shape10: TShape;
    Label6: TLabel;
    Shape13: TShape;
    Label7: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Shape16: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Shape17: TShape;
    Label12: TLabel;
    Shape18: TShape;
    Label13: TLabel;
    Shape19: TShape;
    Label14: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Shape22: TShape;
    Label17: TLabel;
    Label18: TLabel;
    Shape23: TShape;
    Label19: TLabel;
    Shape24: TShape;
    Label20: TLabel;
    Shape25: TShape;
    Label21: TLabel;
    Bt_close: TOnFocusButton;
    procedure Bt_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHelp: TFHelp;

implementation

{$R *.DFM}


procedure TFHelp.Bt_closeClick(Sender: TObject);
begin
  Close;
end;

end.
