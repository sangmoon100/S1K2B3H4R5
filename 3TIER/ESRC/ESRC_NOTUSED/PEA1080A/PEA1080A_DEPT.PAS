unit PEA1080A_Dept;

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
    QR_Deptcode: TTMaxDataSet;
    DataSource1: TDataSource;
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

    procedure PG_Get_Dept;
  end;

var
  FM_Dept: TFM_Dept;

implementation

uses PEA1080A1;

{$R *.DFM}

procedure TFM_Dept.PG_Get_Dept;
var
  i : integer;
begin
  try
      with QR_Deptcode do
      begin
           ServiceName := 'HINSA_pycdept';
           Close;
           Sql.Clear;
           Sql.Add('SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode                   ');
           Sql.Add('  FROM pycdept A                                                                          ');
           Sql.Add(' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ');
           Sql.Add('   AND existon  =  ''1''                                                                  ');
           Sql.Add('   AND chanmode <> ''3''                                                                  ');
           Sql.Add('   AND deptcode  like replace('''+FM_Main.FG_dept + ''' ,''0'','''') || ''%''             ');
           Sql.Add('   AND (EXISTS (SELECT 1 FROM PIMPMAS B                                                   ');
           Sql.Add('                    WHERE A.DEPTCODE = B.DEPTCODE                                         ');
           Sql.Add('                      AND A.ORGNUM   = B.ORGNUM                                           ');
           Sql.Add('                      AND B.PSTATE   < ''80'' )                                           ');
           Sql.Add('      Or EXISTS (SELECT 1 FROM PIMPMAS B                                                  ');
           Sql.Add('                    WHERE A.DEPTCODE = B.JOBDEPT                                          ');
           Sql.Add('                      AND A.ORGNUM   = B.ORGNUM                                           ');
           Sql.Add('                      AND B.PSTATE < ''80'')   )                                          ');
           Sql.Add(' ORDER BY deptcode                                                                        ');
           Open;
           First;
           for i := 0 to QR_Deptcode.recordcount do
           begin
                if QR_Deptcode.fieldbyname('deptcode').AsString = FG_deptcode then
                   Break;
                next;
           end;
           First;
      end;
  except
    QR_Deptcode.Close;
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
  if Key = VK_ESCAPE then Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
  begin
       if   Sender is TOnGrDBGrid then GR_deptDblClick(Sender)
       else                            BE_keyButtonClick(Sender,0);
  end;
end;

end.
