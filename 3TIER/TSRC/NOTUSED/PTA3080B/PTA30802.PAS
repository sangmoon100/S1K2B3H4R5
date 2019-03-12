unit PTA30802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Shdowpnl, Grids, DBGrids, StdCtrls,
  Mask, Db, Tmax_DataSetText,OnPopupEdit, //TXClientDS,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid ;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    E_cond: TOnButtonEdit;
    Panel2: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    GSdeptcode   : String;
    GSdeptname   : String;
    TeamSql      : String;
  end;

var
   DeptForm : TDeptForm;

implementation

uses PTA30801;

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     TDS1.Close;
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
     TeamSql := 'select deptcode, deptname, ''field3'', ''field4'',''field5''  '+
                '  from pycdept                                                '+
                ' where orgnum = (select value1 from pimvari                   '+
                '                  where gubun = ''00'' AND sgubun = ''0001'') '+
                '   and deptlevel <> ''E0''                                    ';

     if E_cond.Text <> '' then TeamSql := TeamSql + Format(' and (deptcode like ''%s'' or deptname like ''%s'' ) ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%']);

     TeamSql := TeamSql + ' order by deptcode ';

     with TDS1 do
     begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Text := TeamSql;

          ClearFieldInfo;
          AddField('DEPTCODE'  , ftString,  100);
          AddField('DEPTNAME'  , ftString,  100);
          AddField('field3'    , ftString,  100);
          AddField('field4'    , ftString,  100);
          AddField('field5'    , ftString,  100);
          Open;

          FieldByName('DEPTCODE').Alignment   := taCenter;
     end;
end;



procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
     if not TDS1.Eof then
     begin
          GSdeptcode   := TDS1.FieldByName('DEPTCODE').AsString;
          GSdeptname   := TDS1.FieldByName('DEPTNAME').AsString;
     end
     else
     begin
          GSdeptcode   := '';
          GSdeptname   := '';
     end;

     Edit.PopupForm.ClosePopup(False);
end;

procedure TDeptForm.BT_CancelClick(Sender: TObject);
begin
     GSdeptcode   := '';
     GSdeptname   := '';
     Edit.PopupForm.ClosePopup(False);
end;

procedure TDeptForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then E_condButtonClick(Sender, 0);
end;

end.
 