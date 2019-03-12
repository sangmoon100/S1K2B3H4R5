unit AdminMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, DBTables, ADODB, FuncXE;

type
  TFM_Main = class(TForm)
    PA_BackWindow: TPanel;
    PA_Header: TPanel;
    PA_Program: TPanel;
    StBar_Help: TStatusBar;
    FB_User: TButton;
    FB_Table: TButton;
    FB_Query: TButton;
    FB_Close: TButton;
    SL_Program: TPanel;
    ADOQuery1: TADOQuery;
    procedure FB_CloseClick(Sender: TObject);
    procedure FB_UserClick(Sender: TObject);
    procedure FB_TableClick(Sender: TObject);
    procedure FB_QueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FL_Start : Boolean;
    FL_Form  : TForm;

    procedure PL_ShowPanel(APanel: TPanel);
  public
    { Public declarations }

    FG_UserID, FG_UserName : String;  //기본 사용자 Setting 위해 추가.  2016.06.
  end;

var
  FM_Main: TFM_Main;

implementation

uses AdminUser, AdminTable, AdminQuery, AUserPopup;
{$R *.dfm}

procedure TFM_Main.PL_ShowPanel(APanel: TPanel);
var
  FL_I     : Integer;
  AControl : TControl;
begin
  FL_Form.Close;
  FL_Form := nil;
  if APanel <> nil then
  begin
       APanel.Parent  := PA_Program;
       APanel.Left    := 0;
       APanel.Top     := 0;
       APanel.Visible := True;
       APanel.Perform(WM_PAINT,0,0);
  end;

  for FL_I := 0 to PA_Program.ControlCount - 1 do
  begin
       AControl := PA_Program.Controls[FL_I];
       if (AControl is TPanel) and (AControl <> APanel) then
           AControl.Visible := False;
  end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  StBar_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  ADOConnect;  //FuncXE 2016.06. Add

  Application.Processmessages;
  StBar_Help.Panels[1].Text := ' 종합인사시스템 접속완료.';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  //기본 사용자 Setting 위해 추가.  2016.06.
  ADOQuery1.Connection := ADO_Session;
  with ADOQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT userid, username FROM AQUSER');
       Sql.Add(' WHERE userid = ''0000''           ');
       Open;
       FG_UserID   := FieldByname('userid').AsString;
       FG_UserName := FieldByname('username').AsString;
  end; ////////////////////////////////////////////////

  FB_QueryClick(Sender);
end;

procedure TFM_Main.FB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FB_UserClick(Sender: TObject);
begin
  if FL_Form = nil then Application.CreateForm(TFM_User, FM_User);

  FL_Form := TForm(FM_User);
  PL_ShowPanel(FM_User.PA_Program);
  SL_Program.Caption := '-- 사용자 권한 관리 --';

  FM_User.BT_FindClick(Sender);
end;

procedure TFM_Main.FB_TableClick(Sender: TObject);
begin
  if FL_Form = nil then Application.CreateForm(TFM_Table, FM_Table);

  FL_Form := TForm(FM_Table);
  PL_ShowPanel(FM_Table.PA_Program);
  SL_Program.Caption := '-- 테이블 정보 관리 --';

  FM_Table.ED1_username.Hint := FG_UserID;
  FM_Table.ED1_username.Text := FG_UserName;

  FM_Table.BT_FindClick(Sender);
end;

procedure TFM_Main.FB_QueryClick(Sender: TObject);
begin
  if FL_Form = nil then Application.CreateForm(TFM_Query, FM_Query);

  FL_Form := TForm(FM_Query);
  PL_ShowPanel(FM_Query.PA_Program);
  SL_Program.Caption := '-- 사용자질의 정보 관리 --';

  FM_Query.ED1_username.Hint := FG_UserID;
  FM_Query.ED1_username.Text := FG_UserName;
  FM_Query.ED_username.Hint := FG_UserID;
  FM_Query.ED_username.Text := FG_UserName;

  FM_Query.BT_FindClick(Sender);
end;


end.
