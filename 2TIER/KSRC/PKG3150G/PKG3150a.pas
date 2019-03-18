unit pkg3150a;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnGrDBGrid, StdCtrls, Buttons, ExtCtrls, ComCtrls, Func;

type
  TForm4 = class(TForm)
    sb_Help: TStatusBar;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Eempno: TEdit;
    Panel18: TPanel;
    Lkorname: TLabel;
    Ldeptname: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses pkg31503;

{$R *.DFM}

procedure TForm4.FormShow(Sender: TObject);
begin
  Eempno.SetFocus;
end;

end.
