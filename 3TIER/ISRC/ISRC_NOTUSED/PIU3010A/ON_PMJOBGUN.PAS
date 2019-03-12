unit On_pmjobgun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit;

type
  TFM_pmjobgun = class(TForm)
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
    FG_JOBGUNNAME  : String;
    Edit           : TOnWinPopupEdit;
    Insa_Session   : TTMaxSession;

    procedure PL_Init;
  end;

implementation

{$R *.DFM}

procedure TFM_pmjobgun.FormActivate(Sender: TObject);
begin
     GR_1.SetFocus;
end;

procedure TFM_pmjobgun.PL_Init;
begin
     QR_grid.Session := Insa_Session;
     with QR_grid do
     begin
          Close;
          ServiceName := 'HINSA_pyccode';
          ClearFieldInfo;
          AddField('field1'      , ftString,  4);
          AddField('jobgun'      , ftString, 10);
          AddField('jobgunname'  , ftString, 30);
          AddField('field2'      , ftString, 30);
          ClearParamInfo;
          Sql.Clear;
          Sql.Add('SELECT null,jobgun, jobgunname,null FROM pmjobgun ');
          Sql.Add(' where useyn   = ''Y''                            ');
          Sql.Add(' ORDER BY jobgun                                  ');
          Open;
          Locate('jobgunname',VarArrayOf([BE_key.Text]),[loPartialKey]);
     end;
end;

procedure TFM_pmjobgun.FB_okClick(Sender: TObject);
begin
     FG_JOBGUN     := QR_grid.FieldByName('jobgun').AsString;
     FG_JOBGUNNAME := QR_grid.FieldByName('jobgunname').AsString;
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_pmjobgun.FB_cancelClick(Sender: TObject);
begin
     FG_JOBGUN     := '';
     FG_JOBGUNNAME := '';
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_pmjobgun.GR_1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFM_pmjobgun.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
     PL_Init;
     GR_1.SetFocus;
end;

end.
