unit AdminQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, Buttons,
  ADODB, FuncXE,FileCtrl;

type
  TFM_Query = class(TForm)
    PA_Program: TPanel;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    ED_content: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ED1_queryname: TEdit;
    ED_groupname: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel2: TPanel;
    ED_seqno: TEdit;
    ED_queryname: TEdit;
    ED_usersql: TMemo;
    BT_Find: TButton;
    BT_Add: TButton;
    BT_Save: TButton;
    BT_Del: TButton;
    ED1_username: TEdit;
    SpeedButton1: TSpeedButton;
    ED_username: TEdit;
    SpeedButton2: TSpeedButton;
    Grid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOSave2: TADOQuery;
    BT_FileSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure Grid1DblClick(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ED1_querynameKeyPress(Sender: TObject; var Key: Char);
    procedure BT_FileSaveClick(Sender: TObject);
    function  RemoveSpecialChar(sSrc: string): string;
  private
    { Private declarations }
    FL_Start : Boolean;
    FL_Ins   : Boolean;
    function FL_Get_seqno : Integer;
  public
    { Public declarations }
  end;

var
  FM_Query: TFM_Query;

implementation

uses AUserPopup, AdminMain;

{$R *.dfm}

procedure TFM_Query.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  ADOQuery1.Connection := ADO_Session;
  ADOSave2.Connection := ADO_Session;
end;

procedure TFM_Query.FormPaint(Sender: TObject);
begin
  if FL_Start then
  begin
       FL_Start := False;
       Application.ProcessMessages;
  end;
end;

function TFM_Query.FL_Get_seqno : Integer;
var
  FL_Sql  : String;
begin
  Result := 0;
  FM_Main.StBar_Help.Panels[1].Text := ' 일련번호를 읽고 있는 중입니다...';
  FM_Main.StBar_Help.Perform(WM_PAINT,0,0);
  with ADOSave2 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := 'SELECT /*+ index_desc (A) */ NVL(MAX(seqno),0) + 1 cnt '+
                 '  FROM AQUSERQUERY A  '+
                 ' WHERE rownum = 1     '+
                 '   AND userid = ''%s''';
       FL_Sql := Format(FL_Sql,[ED_username.Hint]);
       Sql.Text := FL_Sql;
       Open;
       if not Eof then
         Result := FieldByName('cnt').AsInteger;
       Close;
  end;
  FM_Main.StBar_Help.Panels[1].Text := '';
end;

procedure TFM_Query.Grid1ApplyCellAttribute(Sender: TObject; Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if ADOQuery1.FieldByName('username').AsString = '' then
  begin
       Canvas.Font.Color := clRed;
       Canvas.Font.Style := [fsStrikeOut];
  end;
end;

procedure TFM_Query.BT_FileSaveClick(Sender: TObject);
var
  F : TextFile;
  FileName, FilePath : string;
  sStr : String;
begin
  if SelectDirectory('저장할 폴더위치를 선택하세요.','',sStr) then FilePath := sStr + '\'
  else exit;

  ADOQuery1.First;

  while not ADOQuery1.Recordset.EOF do
  begin
    FileName   := FilePath + RemoveSpecialChar(ADOQuery1.FieldByName('queryname').AsString) + '.sql';

    try
      try
        AssignFile(F, FileName);

        Rewrite(F);

        Writeln(F, ADOQuery1.FieldByName('usersql').AsString);
      except
        on E: Exception do ;
      end;
    finally
      CloseFile(F);
      ADOQuery1.Next;
    end;
  end;

end;


//특수문자 제외 추가..
function TFM_Query.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result :='';
  for I:=1 to Length(sSrc) do
    if (sSrc[I] in ['!','@','#','$','%','^','&','*','\','/','|','`','''','~']) then result := result + '_'
    else  result := result + sSrc[I];
end;

procedure TFM_Query.BT_FindClick(Sender: TObject);
var
  FL_Sql : String;
begin
  with ADOQuery1 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := Format('SELECT T1.userid, T2.username, T1.groupname, T1.queryname, T1.content, T1.usersql, T1.seqno '+
                        '  FROM AQUSERQUERY T1, AQUSER T2 '+
                        ' WHERE T1.userid    =    ''%s''  '+
                        '   AND T1.queryname LIKE ''%s''  '+
                        '   AND T1.userid = T2.userid(+)  '+
                        ' ORDER BY T1.groupname, T1.seqno ',
                        [ED1_username.Hint, '%'+ED1_queryname.Text+'%']);
       Sql.Add(FL_Sql);
       Open;
  end;
end;

procedure TFM_Query.Grid1DblClick(Sender: TObject);
begin
  FL_Ins := False;
  ED_username.Hint    := ADOQuery1.FieldByName('userid').AsString;
  ED_username.Text    := ADOQuery1.FieldByName('username').AsString;
  ED_seqno.Text       := ADOQuery1.FieldByName('seqno').AsString;
  ED_groupname.Text   := ADOQuery1.FieldByName('groupname').AsString;
  ED_queryname.Text   := ADOQuery1.FieldByName('queryname').AsString;
  ED_usersql.Text     := ADOQuery1.FieldByName('usersql').AsString;
  ED_content.Text     := ADOQuery1.FieldByName('content').AsString;
  ED_username.Enabled := False;
  ED_seqno.Enabled    := False;
end;

procedure TFM_Query.SpeedButton1Click(Sender: TObject);
begin
  FM_UserPopup := TFM_UserPopup.Create(Self);
  Try
       FM_UserPopup.ShowModal;
       if FM_UserPopup.FUserID = '' then exit;
       ED1_username.Hint := FM_UserPopup.FUserID;
       ED1_username.Text := FM_UserPopup.FUserName;
  Finally
       FM_UserPopup.Free;
  end;
end;

procedure TFM_Query.SpeedButton2Click(Sender: TObject);
begin
  FM_UserPopup := TFM_UserPopup.Create(Self);
  Try
       FM_UserPopup.ShowModal;
       if FM_UserPopup.FUserID = '' then exit;
       ED_username.Hint := FM_UserPopup.FUserID;
       ED_username.Text := FM_UserPopup.FUserName;
  Finally
       FM_UserPopup.Free;
  end;
end;

procedure TFM_Query.BT_AddClick(Sender: TObject);
var
  FL_Key1 : String;
  FL_Key2 : String;
begin
  FL_Ins  := True;
  FL_Key1 := ED_username.Hint;
  FL_Key2 := ED_username.Text;

  ED_username.Enabled := True;
  ED_seqno.Enabled    := True;

  ED_username.Hint    := '';
  ED_username.Text    := '';
  ED_groupname.Text   := '';
  ED_queryname.Text   := '';
  ED_usersql.Text     := '';
  ED_content.Text     := '';

  ED_username.Hint := FL_Key1;
  ED_username.Text := FL_Key2;
  if Trim(ED_username.Hint) <> '' then
  begin
       ED_seqno.Text := inttoStr(FL_Get_Seqno);
  end;
  ED_groupname.SetFocus;
end;

procedure TFM_Query.BT_SaveClick(Sender: TObject);
var
  FL_Sql  : String;
  FStream : TMemoryStream;
begin
  if trim(ED_username.Text) = '' then
  begin
       MessageDlg('사용자명을 입력하세요...',mtInformation,[mbOK],0);
       ED_username.SetFocus;
       System.Exit;
  end;

  if trim(ED_queryname.Text) = '' then
  begin
       MessageDlg('사용자 질의명을 입력하세요...',mtInformation,[mbOK],0);
       ED_queryname.SetFocus;
       System.Exit;
  end;

  if trim(ED_usersql.Lines.Text) = '' then
  begin
       MessageDlg('SQL문장을 입력하세요...',mtInformation,[mbOK],0);
       ED_usersql.SetFocus;
       System.Exit;
  end;

  try
    FStream := nil;
    FStream := TMemoryStream.Create;
    ED_usersql.Lines.SaveToStream(FStream);
    if FL_Ins then
    begin
         with ADOSave2 do
         begin
              Close;
              Sql.Clear;
              FL_Sql := Format('INSERT INTO AQUSERQUERY '+
                               ' (seqno, userid, groupname, queryname, usersql, content) '+
                               ' VALUES '+
                               '(%d, ''%s'',''%s'', ''%s'', :pusersql, ''%s'') ',
                        [StrToInt(ED_seqno.Text), ED_username.Hint, ED_groupname.Text, ED_queryname.Text, ED_content.Text]);
              Sql.Text := FL_Sql;
              Parameters.ParamByName('pusersql').LoadFromStream(FStream, ftBlob);
              EXECSQL;
        end;
    end
    else
    begin
         with ADOSave2 do
         begin
              Close;
              Sql.Clear;
              FL_Sql := Format('UPDATE AQUSERQUERY SET   '+
                               '   groupname = ''%s'',   '+
                               '   queryname = ''%s'',   '+
                               '   usersql   = :pusersql,'+
                               '   content   = ''%s''    '+
                               ' WHERE userid = ''%s''   '+
                               '   AND seqno  = %d       ',
                        [ED_groupname.Text, ED_queryname.Text, ED_content.Text,  ED_username.Hint, StrToInt(ED_seqno.Text)]);
              Sql.Text := FL_Sql;
              Parameters.ParamByName('pusersql').LoadFromStream(FStream, ftBlob);
              EXECSQL;
        end;
    end;
    FStream.Free;
    FStream := nil;
  except on E : EDBEngineError do
    begin
         MessageDlg('질의 수행중 에러가 발생했습니다...('+E.Message+')',mtInformation,[mbOK],0);
         System.Exit;
    end;
  end;

  BT_FindClick(Sender);
  MessageDlg('데이타가 저장 되었습니다...',mtInformation,[mbOK],0);
end;

procedure TFM_Query.ED1_querynameKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BT_FindClick(Sender);
end;

procedure TFM_Query.BT_DelClick(Sender: TObject);
var
  FL_Sql : String;
begin
  if MessageDlg('데이타를 삭제 하시겠습니까 ?.',mtConfirmation,[mbYES,mbNO],0) = mrNO then
    System.Exit;

  try
    with ADOSave2 do
    begin
         Close;
         Sql.Clear;
         FL_Sql := Format('DELETE FROM AQUSERQUERY '+
                          ' WHERE userid = ''%s''  '+
                          '   AND seqno  = %d      ',
                      [ED_username.Hint, StrToInt(ED_seqno.Text)]);
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

end.
