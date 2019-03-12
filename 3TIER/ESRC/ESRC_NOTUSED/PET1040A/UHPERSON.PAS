unit UHperson;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, ComCtrls, peoutlookbtn, OnSkinBtn, OnScheme, StdCtrls,
  OnFocusButton;

type
  TFHperson = class(TForm)
    Bt_exit: TPeJeonOutLookBtn;
    Notebook1: TNotebook;
    Image1: TImage;
    Image2: TImage;
    SF_Main: TOnSchemeForm;
    bt1: TOnFocusButton;
    bt2: TOnFocusButton;
    procedure Bt_exitClick(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure bt2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHperson: TFHperson;

implementation

{$R *.DFM}

procedure TFHperson.Bt_exitClick(Sender: TObject);
begin
     close;
end;

procedure TFHperson.bt1Click(Sender: TObject);
begin
     Notebook1.ActivePage := 'hperson1';
end;

procedure TFHperson.bt2Click(Sender: TObject);
begin
     Notebook1.ActivePage := 'hperson2';
end;

end.
