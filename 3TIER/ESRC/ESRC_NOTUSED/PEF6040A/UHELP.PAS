unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton, QuickRpt, jpeg;

type
  TFHelp = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    ExitBtn: TOnFocusButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure ExitBtnClick(Sender: TObject);
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

end.
