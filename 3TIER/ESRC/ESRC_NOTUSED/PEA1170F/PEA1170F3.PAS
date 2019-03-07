unit PEA1170F3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ExtCtrls, Db,
  Tmax_DataSetText, OnPopupEdit, OnStringUtils, DBGridEh, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl;

type
  TJikmuForm = class(TForm)
    Panel1: TPanel;
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    QR_Jikmucode: TTMaxDataSet;
    DataSource1: TDataSource;
    GR_jikmu: TOnGrDbGrid;
    Panel2: TPanel;
    BE_Key: TOnButtonEdit;
    procedure FB_cancelClick(Sender: TObject);
    procedure GR_jikmuDblClick(Sender: TObject);
    procedure BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FB_okClick(Sender: TObject);
    procedure GR_jikmuCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit       : TOnWinPopupEdit;
    GSITEMNO   : String;
    GSITEMNAME : String;
    GSITEMDESC : String;

    procedure PG_Get_Jikmu;
  end;

var
  JikmuForm: TJikmuForm;

implementation

uses PEA1170F1;

{$R *.DFM}

procedure TJikmuForm.PG_Get_Jikmu;
var
  sRabasdate, SqlText : String;
begin
  SqlText :=  ' SELECT ITEMNO, ITEMNAME, ITEMDESC, trim(to_char(ITEMNO,''00'')) ITEMNO1, ''field5'' FROM PEDUC '+
              ' where rabasdate = '''+FM_Main.sRabasdate+   ''' ' +
              '   and ITEMNAME like '''+BE_Key.Text+''' || ''%'' '+
              '   and ITEMNO <> ''21'' '+
              ' ORDER BY ITEMNO1 ';

  with QR_Jikmucode do
  begin
    ServiceName := 'HINSA_select2';
    Close;
    Sql.Clear;
    Sql.Add(SqlText);

    ClearFieldInfo;
    AddField('ITEMNO'  , ftString, 400);
    AddField('ITEMNAME', ftString, 400);
    AddField('ITEMDESC', ftString, 400);
    AddField('ITEMNO1' , ftString, 400);
    AddField('field5'  , ftString, 400);
    Open;
  end;
end;

procedure TJikmuForm.FB_cancelClick(Sender: TObject);
begin
  GSITEMNO   := '';
  GSITEMNAME := '';
  GSITEMDESC := '';
  Close;
end;

procedure TJikmuForm.GR_jikmuDblClick(Sender: TObject);
begin
  GSITEMNO   := QR_Jikmucode.FieldByName('ITEMNO').AsString;
  GSITEMNAME := QR_Jikmucode.FieldByName('ITEMNAME').AsString;
  GSITEMDESC := QR_Jikmucode.FieldByName('ITEMDESC').AsString;

  close;
end;

procedure TJikmuForm.BE_KeyButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    PG_Get_Jikmu;
end;

procedure TJikmuForm.BE_KeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
  begin
       if   Sender is TOnGrDBGrid then GR_jikmuDblClick(Sender)
       else                            BE_keyButtonClick(Sender,0);
  end;
end;

procedure TJikmuForm.FormShow(Sender: TObject);
begin
  PG_Get_Jikmu;
end;

procedure TJikmuForm.FB_okClick(Sender: TObject);
begin
  GR_jikmuDblClick(Sender);
end;

procedure TJikmuForm.GR_jikmuCellClick(Column: TColumn);
begin
  BE_Key.Text := QR_Jikmucode.FieldByName('ITEMNAME').AsString;
end;

end.
