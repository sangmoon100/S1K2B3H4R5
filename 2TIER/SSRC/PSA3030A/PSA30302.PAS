unit Psa30302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFpsa30302 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpsa30302: TFpsa30302;

implementation

uses Psa30301;
{$R *.DFM}


procedure TFpsa30302.BitBtn1Click(Sender: TObject);
begin
  if      RB1.Checked then     Fpsa30301.BoxOfResult := 1
  else if RB2.Checked then     Fpsa30301.BoxOfResult := 2
  else if RB3.Checked then     Fpsa30301.BoxOfResult := 3;
  Close;
end;

procedure TFpsa30302.BitBtn2Click(Sender: TObject);
begin
  Fpsa30301.BoxOfResult := 0;
  Close;
end;

end.
