unit On_pmEkind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit;

type
  TFM_pmEkind = class(TForm)
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
    procedure GR_1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_EKIND     : String;
    FG_EKINDNAME : String;
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;

    procedure PL_Init;
  end;

implementation

uses UMainForm;

{$R *.DFM}

procedure TFM_pmEkind.FormActivate(Sender: TObject);
begin
  GR_1.SetFocus;
end;

procedure TFM_pmEkind.PL_Init;
begin
  QR_grid.Session := Insa_Session;
  with QR_grid do
  begin
    Close;
    ServiceName := 'HINSA_pyccode';
    ClearFieldInfo;
    AddField('field1', ftString,  4);
    AddField('codeno', ftString, 10);
    AddField('hname' , ftString, 30);
    AddField('field2', ftString, 30);
    ClearParamInfo;
    Sql.Clear;

    Sql.Add(' select null, codeno, hname, null FROM peidpcode ');
    Sql.Add(' where classno = ''1''                           ');
    Sql.Add('   and base_yy = '''+FM_Main.sbase_yy+'''        ');
    Sql.Add(' ORDER BY codeno                                 ');
    Open;
    Locate('hname',VarArrayOf([BE_key.Text]),[loPartialKey]);
  end;
end;

procedure TFM_pmEkind.FB_okClick(Sender: TObject);
begin
  FG_EKIND     := QR_grid.FieldByName('codeno').AsString;
  FG_EKINDNAME := QR_grid.FieldByName('hname').AsString;
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_pmEkind.FB_cancelClick(Sender: TObject);
begin
  FG_EKIND     := '';
  FG_EKINDNAME := '';
  QR_grid.Close;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_pmEkind.GR_1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFM_pmEkind.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  PL_Init;
  GR_1.SetFocus;
end;

end.
