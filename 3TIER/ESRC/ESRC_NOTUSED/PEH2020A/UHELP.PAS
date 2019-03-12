unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton;

type
  TFHelp = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Image1: TImage;
    ExitBtn: TOnFocusButton;
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
