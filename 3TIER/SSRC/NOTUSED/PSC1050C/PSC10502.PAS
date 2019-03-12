unit PSC10502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TZipForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_cond: TOnButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
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
  end;

var
   ZipForm : TZipForm;

implementation

uses PSC10501;

{$R *.DFM}

procedure TZipForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TZipForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  SQLStr, SearchCond : String;
begin
  SearchCond := Trim(E_Cond.Text);

  if Length(SearchCond) <> 0 then
    begin
      SearchCond := '%' +SearchCond + '%';
      SQLStr  := 'SELECT nvl(ZIPNO,'' ''),                     nvl(ADDR,'' ''), NVL(ADDR2, '' ''), NVL(ADDR3, '' '')     ' +
                 ' FROM   PKMPOST                               ' +
          Format(' WHERE  ADDR2 LIKE ''%s'' OR ',[SearchCond])   +
          Format('        ZIPNO LIKE  ''%s''  ',[SearchCond])   +
                 ' ORDER BY ZIPNO                               ';
    end
  else if Length(SearchCond) = 0 then
    begin
      SQLStr  := 'SELECT nvl(ZIPNO,'' ''), nvl(ADDR,'' ''),NVL(ADDR2,'' ''), NVL(ADDR3, '' '')     ' +
                 ' FROM   PKMPOST                               ' +
                 ' ORDER BY ZIPNO                               ';
    end;

  with TDS1 do
    begin
      ServiceName := 'PKQ1030A_sel4';
      Close;
      Sql.Clear;
      Sql.Add(SQLStr);

      ClearFieldInfo;
      AddField('ZIPNO', ftString, 6);
      AddField('ADDR' , ftString, 40);
      AddField('ADDR2', ftString, 60);
      AddField('ADDR3', ftString, 60);
      Open;
      FieldByName('ZIPNO').EditMask  := '###-###;0;';
      FieldByName('ZIPNO').Alignment := taCenter;
    end;

end;

procedure TZipForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    ZipNo   := TDS1.FieldByName('ZipNo').AsString;
    Addr    := TDS1.FieldByName('Addr').AsString + ' ' + TDS1.FieldByName('Addr2').AsString;
  end
  else
  begin
    ZipNo   := '';
    Addr    := '';
  end;

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
 