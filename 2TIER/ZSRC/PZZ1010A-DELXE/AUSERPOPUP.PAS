unit AUserPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, Buttons,
  ADODB, FuncXE;

type
  TFM_UserPopup = class(TForm)
    DataSource1: TDataSource;
    Panel3: TPanel;
    Grid1: TDBGrid;
    ED1_username: TEdit;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    procedure Grid1DblClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FUserID   :String;
    FUserName :String;
  end;

var
  FM_UserPopup : TFM_UserPopup;
  
implementation

uses AdminMain;

{$R *.dfm}

procedure TFM_UserPopup.FormCreate(Sender: TObject);
begin
  ADOQuery1.Connection := ADO_Session;

  SpeedButton1Click(Sender);
  FUserID   := '';
  FUserName := '';
end;

procedure TFM_UserPopup.Grid1DblClick(Sender: TObject);
begin
  FUserID   := ADOQuery1.FieldByName('userid').AsString;
  FUserName := ADOQuery1.FieldByName('username').AsString;
  Close;
end;

procedure TFM_UserPopup.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Grid1DblClick(Sender);
       Key := #0;
       Close;
  end;
end;

procedure TFM_UserPopup.SpeedButton1Click(Sender: TObject);
var
  FL_Sql : String;
begin
  with ADOQuery1 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := Format('SELECT userid, username, content FROM AQUSER '+
                        ' WHERE username LIKE ''%s'' ',[ED1_username.Text+'%']);
       Sql.Add(FL_Sql);
       Open;
  end;
end;

end.
