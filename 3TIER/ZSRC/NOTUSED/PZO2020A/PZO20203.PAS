unit PZO20203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    Panel1: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    Memo1: TMemo;
    OnDBGrid1: TOnDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSdeptcodeS  : String;
    GSorgnum     : String;
    GSdeptcode   : String;
    GSdeptname   : String;
  end;

var
   DeptForm : TDeptForm;

implementation

uses PZO20201;

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant : String;
begin

  ParamVariant  := ' SELECT ORGNUM, DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME,''field4'',''field5''            '+
                   '   FROM PYCDEPT B                                                                            '+
                   '  WHERE B.ORGNUM  = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')  '+
            Format('    AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'')', ['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

    ParamVariant := ParamVariant + ' ORDER BY DEPTCODE ';

  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);
      memo1.text := sql.text;

      ClearFieldInfo;
      AddField('ORGNUM'   ,  ftString, 100);
      AddField('DEPTCODE' ,  ftString, 100);
      AddField('DEPTNAME' ,  ftString, 100);
      AddField('field4'   ,  ftString, 100);
      AddField('field5'   ,  ftString, 100);
      Open;
      
      FieldByName('DEPTCODE').Alignment   := taCenter;
    end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSorgnum     := TDS1.FieldByName('ORGNUM').AsString;
    GSdeptcode   := TDS1.FieldByName('DEPTCODE').AsString;
    GSdeptname   := TDS1.FieldByName('DEPTNAME').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSorgnum     := '';
    GSdeptcode   := '';
    GSdeptname   := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.FB_cancelClick(Sender: TObject);
begin
    GSorgnum     := '';
    GSdeptcode   := '';
    GSdeptname   := '';
    Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       E_condButtonClick(Sender, 0);
end;

end.
 