unit AdminUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DB, DBTables, ADODB, FuncXE;

type
  TFM_User = class(TForm)
    PA_Program: TPanel;
    Panel1: TPanel;
    DataSource1: TDataSource;
    BT_Find: TButton;
    BT_Add: TButton;
    BT_Mod: TButton;
    BT_Del: TButton;
    Label1: TLabel;
    Grid1: TDBGrid;
    Label2: TLabel;
    ED_userid: TEdit;
    ED_username: TEdit;
    ED_content: TEdit;
    ED1_username: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ADOQuery1: TADOQuery;
    ADOSave2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_ModClick(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure ED_useridExit(Sender: TObject);
  private
    { Private declarations }
    FL_Start : Boolean;
    FL_Ins   : Boolean;
  public
    { Public declarations }
  end;

var
  FM_User: TFM_User;

implementation

uses AdminMain;
{$R *.dfm}

procedure TFM_User.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  ADOQuery1.Connection := ADO_Session;
  ADOSave2.Connection := ADO_Session;
end;

procedure TFM_User.FormPaint(Sender: TObject);
begin
  if FL_Start then
  begin
       FL_Start := False;
       Application.ProcessMessages;
  end;
end;

procedure TFM_User.BT_FindClick(Sender: TObject);
var
  FL_Sql : String;
begin
  with ADOQuery1 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := Format('SELECT userid, username, content FROM AQUSER '+
                        ' WHERE username LIKE ''%s'' ',[Trim(ED1_username.Text)+'%']);
       Sql.Add(FL_Sql);
       Open;
  end;
end;

procedure TFM_User.BT_AddClick(Sender: TObject);
begin
  FL_Ins := True;
  ED_userid.Enabled := True;
  ED_userid.Text    := '';
  ED_username.Text  := '';
  ED_content.Text   := '';
  ED_userid.SetFocus;
end;

procedure TFM_User.BT_ModClick(Sender: TObject);
var
  FL_Sql : String;
begin
  if trim(ED_userid.Text) = '' then
  begin
       MessageDlg('사용자ID를 입력하세요...',mtInformation,[mbOK],0);
       ED_userid.SetFocus;
       System.Exit;
  end;

  if trim(ED_username.Text) = '' then
  begin
       MessageDlg('사용자명을 입력하세요...',mtInformation,[mbOK],0);
       ED_username.SetFocus;
       System.Exit;
  end;

  try
    if FL_Ins then
    begin
         with ADOSave2 do
         begin
              Close;
              Sql.Clear;
              FL_Sql := Format('INSERT INTO AQUSER (userid, username, content) '+
                               ' VALUES (''%s'',''%s'',''%s'') ',
                        [ED_userid.Text, ED_username.Text, ED_content.Text]);
              Sql.Add(FL_Sql);
              EXECSQL;
         end;
    end
    else
    begin
         with ADOSave2 do
         begin
              Close;
              Sql.Clear;
              FL_Sql := Format('UPDATE AQUSER SET     '+
                               '   username = ''%s'', '+
                               '   content  = ''%s''  '+
                               ' WHERE userid = ''%s''',
                        [ED_username.Text, ED_content.Text, ED_userid.Text]);
              Sql.Add(FL_Sql);
              EXECSQL;
         end;
    end;
  except on E : EDBEngineError do
    begin
         MessageDlg('질의 수행중 에러가 발생했습니다...('+E.Message+')',mtInformation,[mbOK],0);
         System.Exit;
    end;
  end;

  BT_FindClick(Sender);
  MessageDlg('데이타가 저장 되었습니다...',mtInformation,[mbOK],0);
end;

procedure TFM_User.BT_DelClick(Sender: TObject);
var
  FL_Sql : String;
begin
  if MessageDlg('데이타를 삭제 하시겠습니까 ?.'#13#13+
                '주의 : 데이타 삭제시 테이블 정보/사용자질의 정보도 삭제 됩니다...',mtConfirmation,[mbYES,mbNO],0) = mrNO then
    System.Exit;

  try
    with ADOSave2 do
    begin
         Close;
         Sql.Clear;
         FL_Sql := Format('DELETE FROM AQUSER  '+
                          ' WHERE userid = ''%s'' ',
                   [ED_userid.Text]);
         Sql.Add(FL_Sql);
         EXECSQL;
    end;

    with ADOSave2 do
    begin
         Close;
         Sql.Clear;
         FL_Sql := Format('DELETE FROM AQTABLES  '+
                          ' WHERE userid = ''%s'' ',
                   [ED_userid.Text]);
         Sql.Add(FL_Sql);
         EXECSQL;
    end;

    with ADOSave2 do
    begin
         Close;
         Sql.Clear;
         FL_Sql := Format('DELETE FROM AQUSERQUERY  '+
                          ' WHERE userid = ''%s'' ',
                   [ED_userid.Text]);
         Sql.Add(FL_Sql);
         EXECSQL;
    end;
  except on E : EDBEngineError do
    begin
         MessageDlg('질의 수행중 에러가 발생했습니다...('+E.Message+')',mtInformation,[mbOK],0);
         System.Exit;
    end;
  end;

  BT_FindClick(Sender);
  MessageDlg('데이타가 삭제 되었습니다...',mtInformation,[mbOK],0);
end;

procedure TFM_User.Grid1DblClick(Sender: TObject);
begin
  FL_Ins := False;
  //Hinsa_FieldDisplay(Self,ADOQuery1,4,11);
  ED_userid.Text    := ADOQuery1.FieldByName('userid').AsString;
  ED_username.Text  := ADOQuery1.FieldByName('username').AsString;
  ED_content.Text   := ADOQuery1.FieldByName('content').AsString;
  ED_userid.Enabled := False;
end;

procedure TFM_User.ED_useridExit(Sender: TObject);
begin
  if ED_userid.Text = '0000' then
  begin
       ED_username.Text := '모든 사용자';
       ED_content.SetFocus;
  end;
end;

end.
