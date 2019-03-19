unit PKY1100A2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DBTables,
  Buttons, DB, Grids, DBGrids, MemDS, DBAccess, Ora;

type
  TFM_Sub = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
{===============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   30.00       1999.01.05         윤형식          직급/직위       하나로인사재개발
그리드 Title에서 호봉삭제
===============================================================================}

    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BBclose: TBitBtn;
    BBprior: TBitBtn;
    BBnext: TBitBtn;
    BitBtn1: TBitBtn;
    OraQuery1: TOraQuery;
    procedure BBcloseClick(Sender: TObject);
    procedure BBpriorClick(Sender: TObject);
    procedure BBnextClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Sub: TFM_Sub;

implementation

uses PKY1100A1, PKY1100A3;

{$R *.DFM}

procedure TFM_Sub.BBcloseClick(Sender: TObject);
begin
     close;
end;

procedure TFM_Sub.BBpriorClick(Sender: TObject);
begin
     OraQuery1.Prior;
end;

procedure TFM_Sub.BBnextClick(Sender: TObject);
begin
     OraQuery1.Next;
end;

procedure TFM_Sub.BitBtn1Click(Sender: TObject);
begin
     FM_Print.QRLdataname.Caption := DBEdit1.Text;
     FM_Print.QRLdate.Caption     := FM_Main.Lsysdate.Caption;
     FM_Print.QuickReport1.Preview;
end;

end.
