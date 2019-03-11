unit UDeptForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ExtCtrls, Db,
  Tmax_DataSetText, OnPopupEdit, OnStringUtils, DBGridEh, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl;

type
  TTeamForm = class(TForm)
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
    procedure GR_deptDblClick(Sender: TObject);
    procedure BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GR_deptCellClick(Column: TColumn);
    procedure FB_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GSdeptcode  : String;
    GSdeptname  : String;
    GSeempno    : String;
    GSeempkor   : String;

    procedure PG_Get_Dept;
  end;

var
  TeamForm: TTeamForm;

implementation

uses PEA8020A1;

{$R *.DFM}

procedure TTeamForm.PG_Get_Dept;
var
  SqlText : String;
begin
  SqlText :=  'SELECT  A.deptcode, A.deptname, '+
              '  (SELECT EEMPNO   FROM PIMEEMP WHERE DEPTCODE = A.DEPTCODE AND PAYRAYN = ''Y'') EEMPNO,  '+
              '  (SELECT EKORNAME FROM PIMEEMP WHERE DEPTCODE = A.DEPTCODE AND PAYRAYN = ''Y'') EKORNAME,'+
              '  ''field5'' '+
              '  FROM pycdept A                                                                          '+
              ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
              '   and (a.DEPTCODE like '''+BE_Key.Text+''' || ''%''    '+
              '    or  a.DEPTNAME like '''+BE_Key.Text+''' || ''%'' )  '+
              ' ORDER BY a.DEPTCODE ';

    with QR_Deptcode do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add(SqlText);

      ClearFieldInfo;
      AddField('deptcode' , ftString, 100);
      AddField('deptname' , ftString, 100);
      AddField('EEMPNO'   , ftString, 100);
      AddField('EKORNAME' , ftString, 100);
      AddField('field5'   , ftString, 100);
      Open;
    end;
end;

procedure TTeamForm.FB_cancelClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.GR_deptDblClick(Sender: TObject);
begin
  if not QR_Deptcode.Eof then
  begin
    GSdeptcode := QR_Deptcode.FieldByName('DEPTCODE').AsString;
    GSdeptname := QR_Deptcode.FieldByName('DEPTNAME').AsString;
    GSeempno   := QR_Deptcode.FieldByName('EEMPNO').AsString;
    GSeempkor  := QR_Deptcode.FieldByName('EKORNAME').AsString;
  end
  else
  begin
    GSdeptcode := '';
    GSdeptname := '';
    GSeempno   := '';
    GSeempkor  := '';
  end;

  Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.BE_KeyButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  PG_Get_Dept;
end;

procedure TTeamForm.BE_KeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then PG_Get_Dept;
end;

procedure TTeamForm.GR_deptCellClick(Column: TColumn);
begin
  BE_Key.Text := QR_Deptcode.FieldByName('DEPTNAME').AsString;
end;

procedure TTeamForm.FB_okClick(Sender: TObject);
begin
  GR_deptDblClick(Sender);
end;

end.
