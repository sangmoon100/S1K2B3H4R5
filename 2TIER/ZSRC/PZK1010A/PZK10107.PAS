unit PZK10107;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, Db, OnPopupEdit, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  MemDS, DBAccess, Ora;

type
  TDicForm = class(TForm)
    DS_Dic: TDataSource;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_cond: TOnButtonEdit;
    Panel2: TPanel;
    BT_ok: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    Ora_Dic: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    AbilityName     : String;
    AbilityCd     : String;
  end;

var
   DicForm : TDicForm;

implementation

uses PZK10101;

{$R *.DFM}

procedure TDicForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_Dic.Close;
end;

procedure TDicForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  Ora_Dic.Close;
  Ora_Dic.Sql.Clear;
  Ora_Dic.Sql.Add(Format('SELECT *                                   '+
                      '  FROM a1dic_abil                             '+
                      ' WHERE (ability_name like ''%s'' or group_name like ''%s'' or define_text like ''%s'')               '+
                      ' ORDER BY ability_cd ', ['%'+E_Cond.Text+'%', '%'+E_Cond.Text+'%', '%'+E_Cond.Text+'%']));
  Ora_Dic.Open;

end;

procedure TDicForm.RunGridDblClick(Sender: TObject);
begin
  if not Ora_Dic.Eof then
    begin
      AbilityCd     := Ora_Dic.FieldByName('ability_cd').AsString;
      AbilityName   := Ora_Dic.FieldByName('ability_name').AsString;
    end
  else
    begin
      AbilityCd     := '';
      AbilityName   := '';
    end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDicForm.BT_cancelClick(Sender: TObject);
begin
  AbilityCd     := '';
  AbilityName   := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TDicForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
 