unit PKG31701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnGrDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, Pass, Func;

type
  TForm1 = class(TForm)
    sb_Help: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    OnGrDbGrid1: TOnGrDbGrid;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // 환경 셋팅
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);
end;

end.
