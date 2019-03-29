unit pia1031a_2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, jgrid, ExtCtrls, Tabs, StdCtrls, Buttons,
  Mask, OnFocusButton, OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl,
  OnPopupEdit, OnEditBtnCtrl, MemDS, DBAccess, Ora ;

type
  TZipForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_cond: TOnButtonEdit;
    RunGrid: TOnGrDbGrid;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    Qpkmpost: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    ZipNO     : String;
    Addr      : String;
    Nation    : String;
    Region    : String;
  end;

var
  ZipForm: TZipForm;

implementation
{$R *.DFM}

uses pia1031a;

procedure TZipForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Qpkmpost.Close;
end;

procedure TZipForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  SQLStr, SearchCond : String;
begin
  SearchCond := E_Cond.Text;

  if Length(SearchCond) <> 0 then
    begin
      SearchCond := '%' +SearchCond + '%';
      SQLStr  := ' SELECT nvl(ZIPNO,'' '') zipno, nvl(ADDR,'' '') addr, NVL(ADDR2, '' '') addr2, NVL(ADDR3, '' '') addr3, ' +
                 '       NATION_CD, REGION_CD ' +
                 ' FROM   PKMPOST ' +
          Format(' WHERE  ADDR2 LIKE ''%s'' OR ',[SearchCond])  +
          Format('        ZIPNO LIKE  ''%s''  ',[SearchCond])   +
                 ' ORDER BY ZIPNO                              ';
    end
  else if Length(SearchCond) = 0 then
    begin
      SQLStr  := 'SELECT nvl(ZIPNO,'' '') zipno, nvl(ADDR,'' '') addr, NVL(ADDR2,'' '') addr2, NVL(ADDR3, '' '') addr3, ' +
                 '       NATION_CD, REGION_CD ' +
                 ' FROM   PKMPOST             ' +
                 ' ORDER BY ZIPNO             ';
    end;

  with Qpkmpost do
    begin
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);
      Open;
      FieldByName('ZIPNO').EditMask  := '###-###;0;';
      FieldByName('ZIPNO').Alignment := taCenter;
    end;
end;

procedure TZipForm.RunGridDblClick(Sender: TObject);
begin
    ZipNo  := Qpkmpost.FieldByName('ZipNo').AsString;
    Addr   := Qpkmpost.FieldByName('Addr').AsString + ' ' + Qpkmpost.FieldByName('Addr2').AsString;
    Nation := Qpkmpost.FieldByName('NATION_CD').AsString;
    Region := Qpkmpost.FieldByName('REGION_CD').AsString;
    Edit.PopupForm.ClosePopup(False);
end;

procedure TZipForm.BT_cancelClick(Sender: TObject);
begin
  ZipNo   := '';
  Addr    := '';
  Edit.PopupForm.ClosePopup(False);
end;

procedure TZipForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
