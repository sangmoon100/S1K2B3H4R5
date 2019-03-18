unit pka40602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFpkq40602 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BBclose: TBitBtn;
    Memo1: TMemo;
    PrintDialog1: TPrintDialog;
    procedure BBcloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpkq40602: TFpkq40602;

implementation

{$R *.DFM}

procedure TFpkq40602.BBcloseClick(Sender: TObject);
begin
     Close;
end;

end.
