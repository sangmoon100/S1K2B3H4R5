unit PTA30802;

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
    Ora_Qry1: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    GSsectcode   : String;
    GSsectname   : String;
    TeamSql      : String;
  end;

var
   TeamForm : TTeamForm;

implementation

uses PTA30801;

{$R *.DFM}

procedure TTeamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Ora_Qry1.Close;
end;

procedure TTeamForm.RunGridDblClick(Sender: TObject);
begin
     if not Ora_Qry1.Eof then
     begin
          GSsectcode   := Ora_Qry1.FieldByName('SECTCODE').AsString;
          GSsectname   := Ora_Qry1.FieldByName('SECTNAME').AsString;
     end
     else
     begin
          GSsectcode   := '';
          GSsectname   := '';
     end;

     Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.BT_CancelClick(Sender: TObject);
begin
     GSsectcode   := '';
     GSsectname   := '';
     Edit.PopupForm.ClosePopup(False);
end;

procedure TTeamForm.FormShow(Sender: TObject);
begin
    TeamSql := 'select deptcode sectcode, deptname sectname from pihorga    ' +
               ' where gubun=''0'' and orgym=             ' +
               '    (select value1 from pimvari where gubun =''B2'' and sgubun = ''0000'') ' +
               ' and deptlevel like ''A%'' ';         //현재조직 부문 조회,당해년도에 권한 등록하므로 
     with Ora_Qry1 do
     begin
          Close;
          Sql.Text := TeamSql;
          Open;
     end;
end;

end.
