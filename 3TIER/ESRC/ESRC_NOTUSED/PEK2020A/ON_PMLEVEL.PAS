unit On_pmLevel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit;

type
  TFM_pmLevel = class(TForm)
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    PA_search: TPanel;
    BE_key: TOnButtonEdit;
    QR_grid: TTMaxDataSet;
    DataSource1: TDataSource;
    PA_grid: TPanel;
    GR_1: TOnGrDbGrid;
    procedure FB_okClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GR_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_LEVEL     : String;
    FG_LEVELNAME : String;
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;
    Value : String;

    procedure PL_Init;
  end;

implementation

uses UMainForm;

{$R *.DFM}

procedure TFM_pmLevel.FormActivate(Sender: TObject);
begin
  GR_1.SetFocus;
end;

procedure TFM_pmLevel.PL_Init;
begin
  QR_grid.Session := Insa_Session;

  with QR_grid do
  begin
    Close;
    ServiceName := 'HINSA_select2';
    Sql.Clear;

    Sql.Add(' select codeno c_level, hname cn_level,   ');
    Sql.Add('        note1, note2, null FROM peidpcode ');
    Sql.Add(' where classno = ''4'' ');
    Sql.Add('   and codeno <> ''B0''');
    Sql.Add('   and base_yy = '''+FM_Main.sbase_yy+''' ');
    Sql.Add(' ORDER BY codeno       ');

    ClearFieldInfo;
    AddField('c_level'  ,ftString ,400);
    AddField('cn_level' ,ftString ,400);
    AddField('note1'    ,ftString ,400);
    AddField('note2'    ,ftString ,400);
    AddField('field5'   ,ftString ,400);
    ClearParamInfo;
    Open;

    Locate('cn_level',VarArrayOf([BE_key.Text]),[loPartialKey]);
  end;

end;

procedure TFM_pmLevel.FB_okClick(Sender: TObject);
begin
  FG_LEVEL     := QR_grid.FieldByName('c_level').AsString;
  FG_LEVELNAME := QR_grid.FieldByName('cn_level').AsString;
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_pmLevel.FB_cancelClick(Sender: TObject);
begin
  FG_LEVEL     := '';
  FG_LEVELNAME := '';
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_pmLevel.GR_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_RETURN then
  begin
    if  Tcomponent(Sender).Name = 'GR_1' then FB_okClick(Sender);
    if  Tcomponent(Sender).Name = 'BE_key' then
    begin
      PL_Init;
      GR_1.SetFocus;
    end;
    Key := 0;
  end;

  if  Key = VK_ESCAPE then
  begin
    FB_cancelClick(Sender);
    Key := 0;
  end;
end;

procedure TFM_pmLevel.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  PL_Init;
  GR_1.SetFocus;
end;

end.

