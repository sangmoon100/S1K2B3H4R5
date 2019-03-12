unit On_pmTrack;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit;

type
  TFM_pmTrack = class(TForm)
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    PA_search: TPanel;
    BE_key: TOnButtonEdit;
    DataSource1: TDataSource;
    QR_grid: TTMaxDataSet;
    GR_1: TOnGrDbGrid;
    procedure FB_okClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GR_1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
    FC_BUMOON : String;
    FC_TRACK  : String;
  public
    { Public declarations }
    FG_BUMOON    : String;
    FG_BUMOONNAME: String;
    FG_TRACK     : String;
    FG_TRACKNAME : String;
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;

    procedure PL_Init;
  end;

implementation

uses UEduForm, UMainForm;

{$R *.DFM}

procedure TFM_pmTrack.FormActivate(Sender: TObject);
begin
  GR_1.SetFocus;
end;

procedure TFM_pmTrack.PL_Init;
var aaa : String;
begin
  QR_grid.Session := Insa_Session;

  with QR_grid do
  begin
    FC_BUMOON := '';
    FC_TRACK  := '';

    Close;
    ServiceName := 'HINSA_select3';
    Sql.Clear;

    Sql.Add(' SELECT BONNAME, DEPTNAME, JIKNAME, NOTE1, JIKCODE FROM PEKDPCODE ');
    Sql.Add(' WHERE ORGNUM   = '''+FM_Main.porgnum+'''                         ');
    Sql.Add('   AND DEPTCODE = '''+FM_Main.pdeptcode+'''                       ');

    ClearFieldInfo;
    AddField('BONNAME'  , ftString, 2000);
    AddField('DEPTNAME' , ftString, 2000);
    AddField('JIKNAME'  , ftString, 2000);
    AddField('NOTE1'    , ftString, 2000);
    AddField('JIKCODE'  , ftString, 2000);

    ClearParamInfo;
    Open;
    Locate('JIKNAME',VarArrayOf([BE_key.Text]),[loPartialKey]);

//    FC_BUMOON := FieldByName('c_bumoon').AsString;
//    FC_TRACK  := FieldByName('c_track').AsString;
  end;

  GR_1.EvenColor := clWhite;
end;

procedure TFM_pmTrack.FB_okClick(Sender: TObject);
begin
//  FG_BUMOON    := copy(QR_grid.FieldByName('c_code').AsString,1,1);
//  FG_BUMOONNAME:= QR_grid.FieldByName('cn_bumoon').AsString;
  FG_TRACK     := QR_grid.FieldByName('JIKCODE').AsString;
  FG_TRACKNAME := QR_grid.FieldByName('JIKNAME').AsString;
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_pmTrack.FB_cancelClick(Sender: TObject);
begin
  FG_TRACK     := '';
  FG_TRACKNAME := '';
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_pmTrack.GR_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_RETURN then
  begin
    if  Tcomponent(Sender).Name = 'GR_1' then  FB_okClick(Sender);
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

procedure TFM_pmTrack.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  PL_Init;
  GR_1.SetFocus;
end;

end.
