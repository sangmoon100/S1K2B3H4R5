unit On_pmjobkind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit;

type
  TFM_pmjobkind = class(TForm)
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
    FG_JOBGUN      : String;
    FG_JOBKIND     : String;
    FG_JOBKINDNAME : String;
    FG_DEPTGUBUN   : String;
    Edit           : TOnWinPopupEdit;
    Insa_Session   : TTMaxSession;
    FG_JOBKINDYY   : String;

    procedure PL_Init;
  end;

implementation

{$R *.DFM}

procedure TFM_pmjobkind.FormActivate(Sender: TObject);
begin
     GR_1.SetFocus;
end;

procedure TFM_pmjobkind.PL_Init;
begin
     //넘어오는 자료가 없으면 2012년 자료 조회
     if FG_JOBKINDYY = '' Then FG_JOBKINDYY := '2012';

     QR_grid.Session := Insa_Session;
     with QR_grid do
     begin
          Close;
          ServiceName := 'HINSA_pyccode';
          ClearFieldInfo;
          AddField('jobgun'      , ftString,  4);
          AddField('jobkind'     , ftString, 10);
          AddField('jobkindname' , ftString, 30);
          AddField('deptgubun'   , ftString, 30);
          ClearParamInfo;
          Sql.Clear;

          Sql.Add('SELECT jobgun, jobkind, jobkindname, deptgubun  ');
          Sql.Add('  FROM pmjobkind                                ');
          Sql.Add(' WHERE jobgun   LIKE  '''+FG_JOBGUN+'''||''%''  ');
          if (FG_JOBKINDYY < '2012') Then Sql.Add(' and useyn = ''N'' ')
          Else                            Sql.Add(' and useyn = ''Y'' ');
          Sql.Add(' ORDER BY jobgun, jobkind                       ');

          Open;
          Locate('jobkindname',VarArrayOf([BE_key.Text]),[loPartialKey]);
     end;
end;

procedure TFM_pmjobkind.FB_okClick(Sender: TObject);
begin
     FG_JOBKIND     := QR_grid.FieldByName('jobkind').AsString;
     FG_JOBKINDNAME := QR_grid.FieldByName('jobkindname').AsString;
     FG_DEPTGUBUN   := QR_grid.FieldByName('deptgubun').AsString;
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_pmjobkind.FB_cancelClick(Sender: TObject);
begin
     FG_JOBKIND     := '';
     FG_JOBKINDNAME := '';
     FG_DEPTGUBUN   := '';
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_pmjobkind.GR_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if  Key = VK_RETURN then
     begin
          if  Tcomponent(Sender).Name = 'GR_1' then
               FB_okClick(Sender);
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

procedure TFM_pmjobkind.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
     PL_Init;
     GR_1.SetFocus;
end;

end.
