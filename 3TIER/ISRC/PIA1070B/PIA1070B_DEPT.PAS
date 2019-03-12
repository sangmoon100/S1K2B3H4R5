unit PIA1070B_dept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ExtCtrls, Db,
  Tmax_DataSetText, OnPopupEdit, OnStringUtils, DBGridEh, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl;

type
  TFM_Dept = class(TForm)
    Panel1: TPanel;
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    QR_cod: TTMaxDataSet;
    DataSource1: TDataSource;
    QR_com: TTMaxDataSet;
    GR_dept: TOnGrDbGrid;
    Panel2: TPanel;
    BE_Key: TOnButtonEdit;
    procedure FB_cancelClick(Sender: TObject);
    procedure FB_okClick(Sender: TObject);
    procedure GR_deptDblClick(Sender: TObject);
    procedure BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_deptcode : String;
    Edit        : TOnWinPopupEdit;
    FG_empno    : String;
    FG_date     : String;
    FG_Grade    : String;

    procedure PG_Get_Dept;
  end;

var
  FM_Dept: TFM_Dept;

implementation

uses pia1070b_1;

{$R *.DFM}

procedure TFM_Dept.PG_Get_Dept;
var
  i      : integer;
  FL_Sql : String;

  procedure PL_Com_Init;
  begin
    with QR_com do
      begin
        Close;
        ServiceName := 'HINSA_select';
        ClearFieldInfo;
        AddField('field1'  , ftString, 100);
        AddField('field2'  , ftString, 100);
        AddField('field3'  , ftString, 100);
        AddField('field4'  , ftString, 100);
        AddField('field5'  , ftString, 100);
        Sql.Clear;
      end;
  end;
begin


  QR_cod.ServiceName := 'HINSA_pycdept';

  if  (copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002') then
  begin
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode                   '+
                '  FROM pycdept                                                                            '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''                                                                   '+
                '   AND chanmode <> ''3''                                                                  '+
                '   AND (( deptcode like '''+Be_Key.Text+'%'' ) or ( deptname like '''+Be_Key.Text+'%'' )) '+
                ' ORDER BY deptcode                                                                        ';
  end
  else
  begin
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode '+
                '  FROM pycdept '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''    '+
                '   AND chanmode <> ''3''   '+
                '   AND deptcode = ''%s''   '+
                '   AND substr(deptcode,1,4) = ''%s''   '+
                ' ORDER BY deptcode         ';
      FL_Sql := Format(FL_Sql, [FG_deptcode, FG_deptcode]);
  end;
// Ãß°¡ end

  try
    with QR_cod do
      begin
        Close;
        Sql.Clear;
        Sql.Add(FL_Sql);
        Open;
        for i := 0 to QR_cod.recordcount do
        begin
           if QR_cod.fieldbyname('deptcode').AsString = FG_deptcode then
              Break;
           next;
        end;
      end;
  except
    QR_cod.Close;
  end;
end;

procedure TFM_Dept.FB_cancelClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_Dept.FB_okClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_Dept.GR_deptDblClick(Sender: TObject);
begin
  FB_okClick(Sender);
end;

procedure TFM_Dept.BE_KeyButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    PG_Get_Dept;
end;

procedure TFM_Dept.BE_KeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
    if Sender is TOnGrDBGrid then
      GR_deptDblClick(Sender)
    else
      BE_keyButtonClick(Sender,0);
end;

end.
