unit PKA40304;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid, MemDS, DBAccess, Ora;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    OnDBGrid1: TOnDBGrid;
    OraQuery: TOraQuery;
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure OnDBGrid1DrawCell(Sender: TObject; const ACell: TOnJCell;
      var BgColor, FontColor: TColor; var FStyle: TFontStyles);
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

uses PKA40301;

{$R *.DFM}

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant : String;
begin

  ParamVariant  := ' SELECT ORGNUM, DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME, CHANMODE,''field5''            '+
                   '   FROM PYCDEPT B                                                                            '+
                   '  WHERE B.ORGNUM  = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')  '+
            Format('    AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'')', ['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

    ParamVariant := ParamVariant + ' ORDER BY CHANMODE,DEPTCODE ';

  with OraQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      Open;
      
      FieldByName('DEPTCODE').Alignment   := taCenter;
    end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not OraQuery.Eof then
  begin
    GSorgnum     := OraQuery.FieldByName('ORGNUM').AsString;
    GSdeptcode   := OraQuery.FieldByName('DEPTCODE').AsString;
    GSdeptname   := OraQuery.FieldByName('DEPTNAME').AsString;
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

procedure TDeptForm.OnDBGrid1DrawCell(Sender: TObject;
  const ACell: TOnJCell; var BgColor, FontColor: TColor;
  var FStyle: TFontStyles);
begin
  if OraQuery.FieldByName('CHANMODE').AsString ='3' then
    begin
      FStyle    := [fsStrikeOut];
      FontColor := clBlue;
    end
  else
    begin
      FStyle    := [];
      FontColor := clBlack;
    end;
end;

end.
 