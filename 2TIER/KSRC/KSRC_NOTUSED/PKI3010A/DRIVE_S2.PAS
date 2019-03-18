unit Drive_s2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  OraSmart, MemDS, DBAccess, Ora, Func;

type
  TfrmSub1 = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    dsSub1: TDataSource;
    dsI112: TDataSource;
    dsK920: TDataSource;
    qrI112: TOraQuery;
    qrK920: TOraQuery;
    OraQuery1: TOraQuery;
    OraQuery1DRVKIND: TStringField;
    OraQuery1DRVNAME: TStringField;
    OraQuery1PAYCLFR: TStringField;
    OraQuery1PAYCLTO: TStringField;
    OraQuery1DRVMAXCNT: TIntegerField;
    OraQuery1DRVCYCLE: TStringField;
    OraQuery1DRVAMT: TIntegerField;
    OraQuery1DRVTAXAMT: TIntegerField;
    OraQuery1DRVDESC: TStringField;
    OraQuery1DRVDESC2: TStringField;
    OraQuery1WRITETIME: TStringField;
    OraQuery1WRITEMAN: TStringField;
    OraQuery1CODEFR: TStringField;
    OraQuery1CODETO: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Load_Data;
  private
    { Private declarations }
  public
    { Public declarations }
    Sub_Kubun : String[2];
    Sub_From  : String[2];
    Sub_To    : String[2];
  end;

var
  frmSub1: TfrmSub1;

implementation

{$R *.DFM}

procedure TfrmSub1.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSub1.DBGrid1DblClick(Sender: TObject);
begin
  //Sub_Kubun := tbSub1DRVKIND.asString;
  Sub_Kubun := OraQuery1.FieldByName('drvkind').AsString;
  //Sub_From  := tbSub1PAYCLFR.asString;
// 김태호 작업 부장선택시 부만 가지고 오는 것을 코드로 변경
  Sub_From  := OraQuery1.FieldByName('codefr').AsString;
  Sub_To    := OraQuery1.FieldByName('codeto').AsString;
// 김태호 작업 완료.
  ModalResult := mrOK;
end;

procedure TfrmSub1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     DBGrid1DBlClick(Self);
end;

procedure TfrmSub1.FormActivate(Sender: TObject);
begin
  //tbSub1.tablename := 'PKCDRBAS';
  //tbSub1.Active := True;
  Load_Data;
end;

procedure TfrmSub1.Load_Data;
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select a.drvkind, a.drvname,                  ');
    SQL.Add('       (select codename from pyccode          ');
    SQL.Add('         where codeid = ''I112''              ');
    SQL.Add('           and codeno = a.payclfr) payclfr,   ');
    SQL.Add('       (select codeno from pyccode            ');
    SQL.Add('         where codeid = ''I112''              ');
    SQL.Add('           and codeno = a.payclfr) codefr,    ');
    SQL.Add('       (select codename from pyccode          ');
    SQL.Add('         where codeid = ''I112''              ');
    SQL.Add('           and codeno = a.payclto) payclto,   ');
    SQL.Add('       (select codeno from pyccode            ');
    SQL.Add('         where codeid = ''I112''              ');
    SQL.Add('           and codeno = a.payclto) codeto,    ');
    SQL.Add('       drvmaxcnt,                             ');
    SQL.Add('       (select codename from pyccode          ');
    SQL.Add('         where codeid = ''K920''              ');
    SQL.Add('           and codeno = a.drvcycle) drvcycle, ');
    SQL.Add('       drvamt, drvtaxamt,                     ');
    SQL.Add('       drvdesc, drvdesc2,                     ');
    SQL.Add('       writetime, writeman                    ');
    SQL.Add('  from pkcdrbas a                             ');
    Open;
  end;
end;

end.
