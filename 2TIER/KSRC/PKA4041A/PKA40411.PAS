unit PKA40411;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, MemDS, DBAccess, Ora, OnDBGrid, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnPopupEdit,
  OnGrDBGrid;

type
  TEmpForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    RunGrid: TOnDBGrid;
    TmpQuery: TOraQuery;
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure RunGridDrawCell(Sender: TObject; const ACell: TOnJCell;
      var BgColor, FontColor: TColor; var FStyle: TFontStyles);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSempnoS    : String;
    GSkornameS  : String;
    GSpstateS   : String;
    GSdeptcodeS : String;
    GSdeptnameS : String;
  end;

var
   EmpForm : TEmpForm;

implementation

uses PKA40410;

{$R *.DFM}

procedure TEmpForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    with TmpQuery do
    begin
         Close;
         Sql.Clear;

      Sql.Add('SELECT A.empno, A.korname, A.pstate, A.deptcode, B.deptname                            ');
      Sql.Add('  FROM pimpmas A, pycdept B                                                            ');
      Sql.Add(' WHERE A.orgnum    = B.orgnum(+)                                                       ');
      Sql.Add('   AND A.deptcode  = B.deptcode(+)                                                     ');
      Sql.Add('   AND (A.empno    like '''+E_cond.Text+'%'' OR A.korname like '''+E_cond.Text+'%'')   ');
      Sql.Add(' ORDER BY pstate,EMPNO                                                                 ');
      //memo1.text := sql.text;

      Open;
    end;
end;

procedure TEmpForm.RunGridDblClick(Sender: TObject);
begin
  if not TmpQuery.Eof then
  begin
    GSempnoS    := TmpQuery.FieldByName('empno').AsString;
    GSkornameS  := TmpQuery.FieldByName('korname').AsString;
    GSpstateS   := TmpQuery.FieldByName('pstate').AsString;
    GSdeptcodeS := TmpQuery.FieldByName('deptcode').AsString;
    GSdeptnameS := TmpQuery.FieldByName('deptname').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSempnoS    := '';
    GSkornameS  := '';
    GSpstateS   := '';
    GSdeptcodeS := '';
    GSdeptnameS := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.BT_CancelClick(Sender: TObject);
begin
  GSempnoS    := '';
  GSkornameS  := '';
  GSpstateS   := '';
  GSdeptnameS := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

procedure TEmpForm.RunGridDrawCell(Sender: TObject; const ACell: TOnJCell;
  var BgColor, FontColor: TColor; var FStyle: TFontStyles);
begin
  if TmpQuery.FieldByName('pstate').AsString < '80' then
    begin
      FStyle    := [];
      FontColor := clBlack;
    end
  else
    begin
      FStyle    := [fsStrikeOut];
      FontColor := clBlue;
    end;
end;

end.
