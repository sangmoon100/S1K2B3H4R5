unit On_DeptEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit, OnEditCombo;

type
  TFM_DeptEdit = class(TForm)
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    PA_search: TPanel;
    BE_key: TOnButtonEdit;
    QR_grid: TTMaxDataSet;
    DataSource1: TDataSource;
    PA_grid: TPanel;
    GR_1: TOnGrDbGrid;
    BE_org: TOnComboEdit;
    QR_org: TTMaxDataSet;
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
    FG_ORGNUM      : String;
    FG_DEPTCODE    : String;
    FG_DEPTNAME    : String;
    Edit           : TOnWinPopupEdit;
    Insa_Session   : TTMaxSession;

    procedure PL_Init;
  end;

implementation

{$R *.DFM}

procedure TFM_DeptEdit.FormActivate(Sender: TObject);
var  i : integer;
begin
     QR_org.Session := Insa_Session;
     with QR_org do
     begin
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('orgnum'        , ftString, 100);
          AddField('deptcode'      , ftString, 100);
          AddField('deptname'      , ftString, 100);
          AddField('deptna3'       , ftString, 100);
          AddField('reorgdate'     , ftString, 100);
          ClearParamInfo;
          Sql.Clear;
          Sql.Text := 'SELECT distinct orgnum,null,null,null,null '+
                      '  FROM pycdept                             '+
                      ' WHERE TRIM(Orgnum) is not null            '+
                      ' ORDER by orgnum desc                      ';
          Open;
          BE_org.Items.Add('전체');
          for  i := 0  to  QR_org.RecordCount -1 do
          begin
               BE_org.Items.Add(QR_org.Fieldbyname('orgnum').AsString);
               next;
          end;
     end;
     GR_1.SetFocus;
end;

procedure TFM_DeptEdit.PL_Init;
begin
     QR_grid.Session := Insa_Session;
     with QR_grid do
     begin
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('orgnum'        , ftString, 100);
          AddField('deptcode'      , ftString, 100);
          AddField('deptname'      , ftString, 100);
          AddField('deptna3'       , ftString, 100);
          AddField('reorgdate'     , ftString, 100);
          ClearParamInfo;
          Sql.Clear;
          if  (BE_org.Text = '전체') or (trim(BE_org.Text) = '') then
          begin
               Sql.Text := 'SELECT orgnum, deptcode, deptname, deptna3,                                  '+
                           '       decode(reorgdate,'''','''',substr(reorgdate,1,4)||''.''||             '+
                           '              substr(reorgdate,5,2)||''.''||substr(reorgdate,7,2)) reorgdate '+
                           '  FROM pycdept                                                               '+
                           ' WHERE existon  =     ''1''                                                  '+
                           //'   AND chanmode <>    ''3''                                                  '+
                           '   AND (deptcode LIKE ''%''||'''+BE_key.Text+'''||''%'' OR                   '+
                           '        deptname LIKE ''%''||'''+BE_key.Text+'''||''%'')                     '+
                           ' ORDER by orgnum desc, deptcode                                              ';
          end
          else
          begin
               Sql.Text := 'SELECT orgnum, deptcode, deptname, deptna3,                                  '+
                           '       decode(reorgdate,'''','''',substr(reorgdate,1,4)||''.''||             '+
                           '              substr(reorgdate,5,2)||''.''||substr(reorgdate,7,2)) reorgdate '+
                           '  FROM pycdept                                                               '+
                           ' WHERE orgnum   like  '''+BE_org.text+'''||''%''                             '+
                           '   AND existon  =     ''1''                                                  '+
                           //'   AND chanmode <>    ''3''                                                  '+
                           '   AND (deptcode LIKE ''%''||'''+BE_key.Text+'''||''%'' OR                   '+
                           '        deptname LIKE ''%''||'''+BE_key.Text+'''||''%'')                     '+
                           ' ORDER by orgnum desc, deptcode                                              ';
          end;
          Open;
          if  not Locate('orgnum,deptname',VarArrayOf([FG_ORGNUM,FG_DEPTCODE]),[loPartialKey]) then
               First;
     end;
end;

procedure TFM_DeptEdit.FB_okClick(Sender: TObject);
begin
     FG_ORGNUM      := QR_grid.FieldByName('orgnum').AsString;
     FG_DEPTCODE    := QR_grid.FieldByName('deptcode').AsString;
     FG_DEPTNAME    := QR_grid.FieldByName('deptname').AsString;
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_DeptEdit.FB_cancelClick(Sender: TObject);
begin
     FG_ORGNUM      := '';
     FG_DEPTCODE    := '';
     FG_DEPTNAME    := '';
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_DeptEdit.GR_1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFM_DeptEdit.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
     PL_Init;
     GR_1.SetFocus;
end;

end.
