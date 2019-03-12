unit AdminTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, Buttons,
  ADODB, FuncXE;

type
  TFM_Table = class(TForm)
    PA_Program: TPanel;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    ED_engtable: TEdit;
    ED_content: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    ED1_hantable: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    ED1_engtable: TEdit;
    ED_hantable: TEdit;
    ED_groupname: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    BT_Find: TButton;
    BT_Add: TButton;
    BT_Mod: TButton;
    BT_Del: TButton;
    Grid1: TDBGrid;
    ED1_username: TEdit;
    SpeedButton1: TSpeedButton;
    ED_username: TEdit;
    SpeedButton2: TSpeedButton;
    ADOQuery1: TADOQuery;
    ADOSave2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
    procedure Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start : Boolean;
    FL_Ins   : Boolean;    
  public
    { Public declarations }
  end;

var
  FM_Table : TFM_Table;

implementation
{$R *.dfm}

uses AUserPopup, AdminMain;

procedure TFM_Table.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  ADOQuery1.Connection := ADO_Session;
  ADOSave2.Connection := ADO_Session;
end;

procedure TFM_Table.FormPaint(Sender: TObject);
begin
  if FL_Start then
  begin
       FL_Start := False;
       Application.ProcessMessages;
  end;
end;

procedure TFM_Table.BT_FindClick(Sender: TObject);
var
  FL_Sql : String;
begin
  with ADOQuery1 do
  begin
       Close;
       Sql.Clear;
       FL_Sql := Format('SELECT T1.userid, T2.username, T1.engtable, T1.groupname, T1.hantable, T1.content '+
                        '  FROM AQTABLES T1, AQUSER T2   '+
                        ' WHERE T1.userid   =    ''%s''  '+
                        '   AND T1.engtable LIKE ''%s''  '+
                        '   AND T1.hantable LIKE ''%s''  '+
                        '   AND T1.userid = T2.userid(+) '+
                        ' ORDER BY groupname ',
                        [ED1_username.Hint,
                         ED1_engtable.Text+'%',
                         ED1_hantable.Text+'%']);
       Sql.Add(FL_Sql);
       Open;
  end;
end;

procedure TFM_Table.Grid1ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if ADOQuery1.FieldByName('username').AsString = '' then
  begin
       Canvas.Font.Color := clRed;
       Canvas.Font.Style := [fsStrikeOut];
  end;
end;

procedure TFM_Table.Grid1DblClick(Sender: TObject);
begin
  FL_Ins := False;
  ED_username.Hint    := ADOQuery1.FieldByName('userid').AsString;
  ED_username.Text    := ADOQuery1.FieldByName('username').AsString;
  ED_groupname.Text   := ADOQuery1.FieldByName('groupname').AsString;
  ED_engtable.Text    := ADOQuery1.FieldByName('engtable').AsString;
  ED_hantable.Text    := ADOQuery1.FieldByName('hantable').AsString;
  ED_content.Text     := ADOQuery1.FieldByName('content').AsString;
  ED_username.Enabled := False;
  ED_engtable.Enabled := False;
end;

procedure TFM_Table.SpeedButton1Click(Sender: TObject);
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

procedure TFM_Table.SpeedButton2Click(Sender: TObject);
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

procedure TFM_Table.BT_AddClick(Sender: TObject);
var
  FL_Key1 : String;
  FL_Key2 : String;
begin
  FL_Ins  := True;
  FL_Key1 := ED_username.Hint;
  FL_Key2 := ED_username.Text;

  ED_username.Enabled := True;
  ED_engtable.Enabled := True;

  ED_username.Hint    := '';
  ED_username.Text    := '';
  ED_groupname.Text   := '';
  ED_engtable.Text    := '';
  ED_hantable.Text    := '';
  ED_content.Text     := '';

  ED_username.Hint := FL_Key1;
  ED_username.Text := FL_Key2;
  ED_username.SetFocus;
end;

procedure TFM_Table.BT_SaveClick(Sender: TObject);
var
  FL_Sql : String;
begin
  if trim(ED_username.Text) = '' then
  begin
       MessageDlg('사용자명을 입력하세요...',mtInformation,[mbOK],0);
       ED_username.SetFocus;
       System.Exit;
  end;

  if trim(ED_engtable.Text) = '' then
  begin
       MessageDlg('영문 테이블명을 입력하세요...',mtInformation,[mbOK],0);
       ED_engtable.SetFocus;
       System.Exit;
  end;

  if trim(ED_hantable.Text) = '' then
  begin
       MessageDlg('한글 테이블명을 입력하세요...',mtInformation,[mbOK],0);
       ED_hantable.SetFocus;
       System.Exit;
  end;

  try
    if FL_Ins then
    begin
         with ADOSave2 do
         begin
              Close;
              Sql.Clear;
              FL_Sql := Format('INSERT INTO AQTABLES '+
                               '(userid, engtable, groupname, hantable, content) '+
                               ' VALUES '+
                               '(''%s'',''%s'',''%s'', ''%s'', ''%s'') ',
                        [ED_username.Hint, ED_engtable.Text, ED_groupname.Text, ED_hantable.Text, ED_content.Text]);
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
              FL_Sql := Format('UPDATE AQTABLES          '+
                               '   SET groupname= ''%s'','+
                               '       hantable = ''%s'','+
                               '       content  = ''%s'' '+
                               ' WHERE userid   = ''%s'' '+
                               '   AND engtable = ''%s'' ',
                        [ED_groupname.Text, ED_hantable.Text, ED_content.Text, ED_username.Hint, ED_engtable.Text]);
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

procedure TFM_Table.BT_DelClick(Sender: TObject);
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
         FL_Sql := Format('DELETE FROM AQTABLES     '+
                          ' WHERE userid   = ''%s'' '+
                          '   AND engtable = ''%s'' ',
                   [ED_username.Hint,
                    ED_engtable.Text]);
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
