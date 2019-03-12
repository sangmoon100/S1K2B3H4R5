unit PTA30403;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Shdowpnl, Grids, DBGrids, StdCtrls,
  Mask, Db, OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  MemDS, DBAccess, Ora ;

type
  TTeamForm = class(TForm)
    DataSource1: TDataSource;
    RunGrid: TOnGrDbGrid;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    E_cond: TOnButtonEdit;
    Ora_Qry1: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    GSdeptcode   : String;
    GSdeptname   : String;
    TeamSql      : String;
    Procedure Open_Grid;
  end;

var
   TeamForm : TTeamForm;

implementation

uses PTA30401;

{$R *.DFM}

procedure TTeamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Ora_Qry1.Close;
end;

Procedure TTeamForm.Open_Grid;
begin

  with Ora_Qry1 do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT DEPTCODE, DEPTNAME ');
    Sql.Add(' FROM PYCDEPT A ');
    Sql.Add(' WHERE A.ORGNUM = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN = ''00'' AND SGUBUN = ''0001'') ');
    Sql.Add('   AND A.DEPTCODE LIKE ''N%'' ');
    Sql.Add(Format('AND ((DEPTCODE like ''%s'') or ',['%'+E_cond.Text+'%'])   );
    Sql.Add(Format('     (DEPTNAME like ''%s''))   ',['%'+E_cond.Text+'%'])   );
    Sql.Add('ORDER BY DEPTCODE' );
    Open;
  end;
end;

procedure TTeamForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    TeamSql := Format('select teamcode deptcode, deptname, ''field3'', ''field4'',''field5''  '+
                       '  from pedu2team a, pycdept b                                '+
                       ' where a.base_yy  = ''%s''                                   '+
                       '   and a.orgnum   = b.orgnum                                 '+
                       '   and a.teamcode = b.deptcode                               ',
                       [MainForm.CB_base_yy_F.KeyItems[MainForm.CB_base_yy_F.ItemIndex]]);

     if E_cond.Text <> '' then TeamSql := TeamSql + Format(' and deptname like ''%s''  ',['%'+E_cond.Text+'%']);

     TeamSql := TeamSql + ' order by deptcode ';

     with Ora_Qry1 do
     begin
          Close;
          Sql.Text := TeamSql;
          Open;

          FieldByName('DEPTCODE').Alignment   := taCenter;
     end;
end;

procedure TTeamForm.RunGridDblClick(Sender: TObject);
begin
     if not Ora_Qry1.Eof then
     begin
          GSdeptcode   := Ora_Qry1.FieldByName('DEPTCODE').AsString;
          GSdeptname   := Ora_Qry1.FieldByName('DEPTNAME').AsString;
     end
     else
     begin
          GSdeptcode   := '';
          GSdeptname   := '';
     end;

     Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.BT_CancelClick(Sender: TObject);
begin
     GSdeptcode   := '';
     GSdeptname   := '';
     Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then E_condButtonClick(Sender, 0);
end;

procedure TTeamForm.FormShow(Sender: TObject);
begin
  E_cond.Text := '';
  Open_Grid;
end;

end.
