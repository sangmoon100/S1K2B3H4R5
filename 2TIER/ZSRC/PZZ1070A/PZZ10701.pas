{============================= Program Header ========================================
PROGRAM-NAME    : PZZ1070A(정보검색Ⅱ 관리자)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 기타
Programmer      : 이상문
Version         : 1.00
Date            : 2017.11.10
Update contents
  1.00    2017.11.10   이상문   기존프로그램 재개발                  정보검색Ⅱ 관리자
  1.01    2018.04.23   이상문   사용자 그룹 권한 관리 개발
======================================================================================}

unit PZZ10701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, OnGrDBGrid, OnFocusButton, Db, MemDS,
  DBAccess, Ora , Func, OnEditBaseCtrl, OnEditStdCtrl, OnEditCombo,
  OnEditMemo;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    fb_UserQuery: TOnFocusButton;
    pn_Title: TPanel;
    OnGrDbGrid1: TOnGrDbGrid;
    lb_Title: TLabel;
    fb_User: TOnFocusButton;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    lb_Sub: TLabel;
    Ora_DML: TOraQuery;
    fb_Userm: TOnFocusButton;
    Ora_Group: TOraQuery;
    pn_Bottom: TPanel;
    fb_Search: TOnFocusButton;
    fb_Add: TOnFocusButton;
    fb_Save: TOnFocusButton;
    fb_Del: TOnFocusButton;
    pn_Detail: TPanel;
    pn_Search: TPanel;
    fb_Group: TOnFocusButton;

    procedure fb_Click(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure fb_SearchClick(Sender: TObject);
    procedure OnGrDbGrid1DblClick(Sender: TObject);
    procedure fb_AddClick(Sender: TObject);
    procedure fb_SaveClick(Sender: TObject);
    procedure fb_DelClick(Sender: TObject);

    // arr_OnCombo[1] Change Event
    procedure ComboChange(Sender : TObject);
    // arr_OnEdit[0] KeyPress Event
    procedure KeyEnter(Sender : TObject; var Key: Char);
    procedure fb_GroupClick(Sender: TObject);
  private
    { Private declarations }
    // 검색
    procedure Retrieve(current : Integer);

    // 입력 동적 생성
    procedure GenerateEdit(current : Integer);

    // 입력 비활성화
    procedure InvisibleEdit;

    // 그리드에서 해당 필드의 인덱스 얻음
    function GetIndexByFieldName(Target : TOnGrDbGrid; FN : String) : Integer;

    // 유저명으로 ID찾기
    function GetUserIdByUserName(P_UserName : String) : String;

    // 입력창 텍스트 초기화
    procedure ClearEdit;
  public
    { Public declarations }
    arr_OnEdit : array of TOnEdit;
    arr_OnCombo : array of TOnComboEdit;
    OnMemo1 : TOnMemo;
    current : Integer;
  end;

var
  Form1: TForm1;

implementation

Uses PZZ10702;
{$R *.DFM}

var
  Form2 : TForm2;

{ TForm1 }

procedure TForm1.fb_Click(Sender: TObject);
var
  i : Integer;
  Title : String;
begin
  // invisible
  if (length(arr_OnEdit) <> 0) and
     (current <> (Sender as TOnFocusButton).Tag) then
  begin
    InvisibleEdit;
  end;

  current := (Sender as TOnFocusButton).Tag;
  Title   := (Sender as TOnFocusButton).Caption;

  pn_Title.Caption := '-- ' + Title + ' --';
  lb_Title.Caption := '◆ ' + Title + ' 열람';
  case current of
    0 : // 사용자 권한 관리
        begin
          lb_Sub.Caption := '◆ 사용자 권한 입력';
          fb_Add.Caption := '추가';
          fb_Del.Visible := True;
        end;
    1 : // 그룹별 사용자 관리
        begin
          lb_Sub.Caption := '◆ 그룹별 사용자 입력';
          fb_Add.Caption := '수정';
          fb_Del.Visible := False;
        end;
    2 : // 사용자 질의 정보 관리
        begin
          lb_Sub.Caption := '◆ 사용자 질의 정보 입력';
          fb_Add.Caption := '추가';
          fb_Del.Visible := True;
        end;
  end; // case end

  SetLength(arr_OnEdit, 5);
  SetLength(arr_OnCombo, 3);

  // 검색
  Retrieve(current);
  // 입력 동적 생성
  GenerateEdit(current);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OraConnect;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Form1 := nil;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  fb_Click(fb_UserQuery);
end;

procedure TForm1.fb_SearchClick(Sender: TObject);
begin
  Retrieve(current);
end;

// 검색
procedure TForm1.Retrieve(current: Integer);
var
  i : Integer;
begin
  with OraQuery1 do
  begin
    Close;
    Sql.Clear;

    case current of
      0 : begin // 사용자 권한 관리

            Close;
            Sql.Clear;
            Sql.Add('SELECT                        ');
            Sql.Add('       USERID   "사용자 ID"   ');
            Sql.Add('      ,USERNAME "사용자명"    ');
            Sql.Add('      ,CONTENT  "사용자 설명" ');
            Sql.Add('  FROM                        ');
            Sql.Add('       AQUSER                 ');
            if arr_OnEdit[0] <> nil then
            begin
              Sql.Add(' WHERE USERNAME LIKE ''%' + arr_OnEdit[0].Text + '%'' ');
            end;
            Sql.Add(' ORDER BY USERID              ');
            Open;

            OnGrDbGrid1.Columns[0].Width := 100;
            OnGrDbGrid1.Columns[1].Width := 100;
            OnGrDbGrid1.Columns[2].Width := 800;

            OnGrDbGrid1.Columns[0].Alignment := taCenter;
            OnGrDbGrid1.Columns[1].Alignment := taCenter;
          end; // case 0 end
      1 : begin // 그룹별 사용자 관리

            Close;
            Sql.Clear;
            Sql.Add('SELECT                          ');
            Sql.Add('       GROUPNAME  "그룹명"      ');
            Sql.Add('      ,USERID     "사용자"      ');
            {Sql.Add('      ,USER01     "사용자01"    ');
            Sql.Add('      ,USER02     "사용자02"    ');
            Sql.Add('      ,USER03     "사용자03"    ');
            Sql.Add('      ,USER04     "사용자04"    ');
            Sql.Add('      ,USER05     "사용자05"    ');
            Sql.Add('      ,USER06     "사용자06"    ');
            Sql.Add('      ,USER07     "사용자07"    ');
            Sql.Add('      ,USER08     "사용자08"    ');
            Sql.Add('      ,USER09     "사용자09"    ');
            Sql.Add('      ,USER10     "사용자10"    ');
            Sql.Add('      ,USER11     "사용자11"    ');
            Sql.Add('      ,USER12     "사용자12"    ');
            Sql.Add('      ,USER13     "사용자13"    ');
            Sql.Add('      ,USER14     "사용자14"    ');
            Sql.Add('      ,USER15     "사용자15"    ');}
            Sql.Add('  FROM                          ');
            Sql.Add('       AQGRUSER                 ');
            Sql.Add(' ORDER BY GROUPNAME             ');

            Open;

            OnGrDbGrid1.Columns[0].Width := 150;
            for i := 1 to Fields.Count - 1 do
            begin
              OnGrDbGrid1.Columns[i].Width := 65;
            end;
          end; // case 1 end
      2 : begin // 사용자 질의 정보 관리

            Close;
            Sql.Clear;
            Sql.Add('SELECT a.GROUPNAME "그룹명"          ');
            Sql.Add('      ,a.QUERYNAME "사용자 질의명"   ');
            Sql.Add('      ,a.CONTENT   "설명"            ');
            Sql.Add('      ,a.SEQNO     "일련번호"        ');
            Sql.Add('      ,a.USERSQL   "SQL 문장"        ');
            Sql.Add('      ,a.USEYN     "사용여부"        ');
            Sql.Add('  FROM AQUSERQUERY a                 ');
            //Sql.Add('      ,AQUSER b                      ');
            Sql.Add(' WHERE a.USERID = ''0000''           ');
            //Sql.Add('   AND b.USERID = a.USERID           ');
            if arr_OnEdit[0] <> nil then
            begin
              Sql.Add('   AND a.QUERYNAME LIKE ''%' + arr_OnEdit[0].Text + '%'' ');
            end;
            if arr_OnCombo[0] <> nil then
            begin
              if arr_OnCombo[0].Text <> '전체' then
              begin
                Sql.Add('   AND a.GROUPNAME LIKE ''%' + arr_OnCombo[0].Text + ''' ')
              end
            end;
            Sql.Add(' ORDER BY a.SEQNO                    ');

            {if arr_OnCombo[0] = nil then
            //begin
              ParamByName('UserName').AsString := '모든 사용자'
            //end
            else
              ParamByName('UserName').AsString := arr_OnCombo[0].Text;}

            Open;
            {
            OnGrDbGrid1.Columns[0].Width := 100;
            OnGrDbGrid1.Columns[1].Width := 150;
            OnGrDbGrid1.Columns[2].Width := 300;
            OnGrDbGrid1.Columns[3].Width := 450;
            OnGrDbGrid1.Columns[4].Width := 0;
            OnGrDbGrid1.Columns[5].Width := 0;
            OnGrDbGrid1.Columns[6].Width := 0;
            }
            OnGrDbGrid1.Columns[0].Width := 200;
            OnGrDbGrid1.Columns[1].Width := 350;
            OnGrDbGrid1.Columns[2].Width := 450;
            OnGrDbGrid1.Columns[3].Width := 0;
            OnGrDbGrid1.Columns[4].Width := 0;
            OnGrDbGrid1.Columns[5].Width := 0;
          end; // case 2 end
    end; // case end
    ClearEdit;
  end; // with end
end;

// 입력 동적 생성
procedure TForm1.GenerateEdit(current: Integer);
var
  i : Integer;
  De_Top, De_Left : Integer;
begin
  De_Top  := 10;
  De_Left := 40;

  case current of
    0 : begin  // 사용자 권한 관리
          // 검색
          arr_OnEdit[0] := TOnEdit.Create(Self);
          arr_OnEdit[0].Parent := pn_Search;
          arr_OnEdit[0].Top    := De_Top - 5;
          arr_OnEdit[0].Left   := De_Left;
          arr_OnEdit[0].Width  := 1000;
          arr_OnEdit[0].Height := 24;
          arr_OnEdit[0].EditLabel.Width   := 100;
          arr_OnEdit[0].EditLabel.Caption := '사용자명';
          arr_OnEdit[0].OnKeyPress := KeyEnter;
          arr_OnEdit[0].Visible := True;

          // 입력
          for i := 1 to OraQuery1.Fields.Count do
          begin
            arr_OnEdit[i] := TOnEdit.Create(Self);
            arr_OnEdit[i].Parent := pn_Detail;
            arr_OnEdit[i].Top    := De_Top + (25 * (i-1));
            arr_OnEdit[i].Left   := De_Left;
            arr_OnEdit[i].Width  := 1000;
            arr_OnEdit[i].Height := 24;
            arr_OnEdit[i].EditLabel.Width   := 100;
            arr_OnEdit[i].EditLabel.Caption := OraQuery1.Fields[i-1].FieldName;
            arr_OnEdit[i].EditLabel.Font.Style := [fsBold];
            if i = 1 then arr_OnEdit[i].EditLabel.Color := $FFCF9D;
            arr_OnEdit[i].Visible := True;

          end; // for end
        end; // case 0 end
    1 : begin // 그룹별 사용자 관리
          // 검색
          arr_OnEdit[0] := TOnEdit.Create(Self);
          arr_OnEdit[0].Parent := pn_Search;
          arr_OnEdit[0].Top    := De_Top - 5;
          arr_OnEdit[0].Left   := De_Left;
          arr_OnEdit[0].Width  := 1000;
          arr_OnEdit[0].Height := 24;
          arr_OnEdit[0].EditLabel.Width   := 100;
          arr_OnEdit[0].EditLabel.Caption := '사용자ID';
          arr_OnEdit[0].OnKeyPress := KeyEnter;
          arr_OnEdit[0].Visible := True;

          // 입력
          arr_OnCombo[0] := TOnComboEdit.Create(Self);
          arr_OnCombo[0].Parent := pn_Detail;
          arr_OnCombo[0].Top    := De_Top;
          arr_OnCombo[0].Left   := De_Left;
          arr_OnCombo[0].Width  := 300;
          arr_OnCombo[0].Height := 24;
          arr_OnCombo[0].EditLabel.Width   := 100;
          arr_OnCombo[0].EditLabel.Caption := OraQuery1.Fields[0].FieldName;
          arr_OnCombo[0].EditLabel.Font.Style := [fsBold];
          arr_OnCombo[0].EditLabel.Color := $FFCF9D;

          while(true) do
          begin
            arr_OnCombo[0].Items.Add(OraQuery1.Fields[0].Text);
            OraQuery1.Next;
            if OraQuery1.Eof then break;
          end;
          OraQuery1.First;
          arr_OnCombo[0].Visible := True;

          arr_OnCombo[1] := TOnComboEdit.Create(Self);
          arr_OnCombo[1].Parent := pn_Detail;
          arr_OnCombo[1].Top    := De_Top;
          arr_OnCombo[1].Left   := 350;
          arr_OnCombo[1].Width  := 200;
          arr_OnCombo[1].Height := 24;
          arr_OnCombo[1].EditLabel.Width   := 100;
          arr_OnCombo[1].EditLabel.Caption := '순번';
          arr_OnCombo[1].EditLabel.Font.Style := [fsBold];

          for i := 1 to OraQuery1.Fields.Count - 1 do
          begin
            arr_OnCombo[1].Items.Add(OraQuery1.Fields[i].FieldName);
          end;

          arr_OnCombo[1].OnChange := ComboChange;
          arr_OnCombo[1].Visible := True;

          arr_OnEdit[1] := TOnEdit.Create(Self);
          arr_OnEdit[1].Parent := pn_Detail;
          arr_OnEdit[1].Top    := De_Top;
          arr_OnEdit[1].Left   := 560;
          arr_OnEdit[1].Width  := 200;
          arr_OnEdit[1].Height := 24;
          arr_OnEdit[1].EditLabel.Width   := 100;
          arr_OnEdit[1].EditLabel.Caption := '사용자ID';
          arr_OnEdit[1].EditLabel.Font.Style := [fsBold];
          arr_OnEdit[1].EditLabel.Color := $FFCF9D;
          arr_OnEdit[1].Visible := True;
        end; // case 1 end
    2 : begin // 사용자 질의 정보 관리
          // 검색
          arr_OnCombo[0] := TOnComboEdit.Create(Self);
          arr_OnCombo[0].Parent := pn_Search;
          arr_OnCombo[0].Top    := De_Top - 5;
          arr_OnCombo[0].Left   := De_Left;
          arr_OnCombo[0].Width  := 300;
          arr_OnCombo[0].Height := 24;
          arr_OnCombo[0].EditLabel.Width   := 100;
          arr_OnCombo[0].EditLabel.Caption := '사용자 그룹';
          arr_OnCombo[0].OnChange := ComboChange;
          arr_OnCombo[0].Visible  := True;

          arr_OnEdit[0] := TOnEdit.Create(Self);
          arr_OnEdit[0].Parent := pn_Search;
          arr_OnEdit[0].Top    := De_Top - 5;
          arr_OnEdit[0].Left   := De_Left + 310;
          arr_OnEdit[0].Width  := 700;
          arr_OnEdit[0].Height := 24;
          arr_OnEdit[0].EditLabel.Width   := 100;
          arr_OnEdit[0].EditLabel.Caption := '사용자 질의명';
          arr_OnEdit[0].OnKeyPress := KeyEnter;
          arr_OnEdit[0].Visible := True;

          // 입력
          arr_OnCombo[1] := TOnComboEdit.Create(Self);
          arr_OnCombo[1].Parent := pn_Detail;
          arr_OnCombo[1].Top    := De_Top;
          arr_OnCombo[1].Left   := De_Left;
          arr_OnCombo[1].Width  := 300;
          arr_OnCombo[1].Height := 24;
          arr_OnCombo[1].EditLabel.Width   := 100;
          arr_OnCombo[1].EditLabel.Caption := '사용자명';
          arr_OnCombo[1].EditLabel.Font.Style := [fsBold];
          arr_OnCombo[1].EditLabel.Color := $FFCF9D;

          Ora_Group.Close;
          Ora_Group.Open;
          arr_OnCombo[0].Items.Add('전체');
          while(True) do
          begin
            arr_OnCombo[0].Items.Add(Ora_Group.FieldByName('GROUPNAME').Text);
            Ora_Group.Next;
            if Ora_Group.Eof then break;
          end;
          arr_OnCombo[0].ItemIndex := 0;
          arr_OnCombo[1].Visible := False;

          arr_OnEdit[1] := TOnEdit.Create(Self);
          arr_OnEdit[1].Parent := pn_Detail;
          arr_OnEdit[1].Top    := De_Top;
          arr_OnEdit[1].Left   := De_Left; //De_Left + 310;
          arr_OnEdit[1].Width  := 200;
          arr_OnEdit[1].Height := 24;
          arr_OnEdit[1].EditLabel.Width   := 100;
          arr_OnEdit[1].EditLabel.Caption := '일련번호';
          arr_OnEdit[1].EditLabel.Font.Style := [fsBold];
          arr_OnEdit[1].EditLabel.Color := $FFCF9D;
          arr_OnEdit[1].Visible := True;

          arr_OnEdit[2] := TOnEdit.Create(Self);
          arr_OnEdit[2].Parent := pn_Detail;
          arr_OnEdit[2].Top    := De_Top;
          arr_OnEdit[2].Left   := De_Left + 210; //De_Left + 520;
          arr_OnEdit[2].Width  := 240;
          arr_OnEdit[2].Height := 24;
          arr_OnEdit[2].EditLabel.Width   := 100;
          arr_OnEdit[2].EditLabel.Caption := '그룹명';
          arr_OnEdit[2].EditLabel.Font.Style := [fsBold];
          arr_OnEdit[2].Visible := True;

          arr_OnEdit[3] := TOnEdit.Create(Self);
          arr_OnEdit[3].Parent := pn_Detail;
          arr_OnEdit[3].Top    := De_Top + 25;
          arr_OnEdit[3].Left   := De_Left;
          arr_OnEdit[3].Width  := 970;
          arr_OnEdit[3].Height := 24;
          arr_OnEdit[3].EditLabel.Width   := 100;
          arr_OnEdit[3].EditLabel.Caption := '사용자 질의명';
          arr_OnEdit[3].Visible := True;

          OnMemo1 := TOnMemo.Create(Self);
          OnMemo1.Parent := pn_Detail;
          OnMemo1.Top    := arr_OnEdit[3].Top + 25;
          OnMemo1.Left   := De_Left;
          OnMemo1.Width  := 970;
          OnMemo1.Height := 70;
          OnMemo1.ScrollBars := ssVertical;
          OnMemo1.EditLabel.Width   := 100;
          OnMemo1.EditLabel.Caption := 'SQL 문장';
          OnMemo1.Visible := True;

          arr_OnEdit[4] := TOnEdit.Create(Self);
          arr_OnEdit[4].Parent := pn_Detail;
          arr_OnEdit[4].Top    := OnMemo1.Top + 71;
          arr_OnEdit[4].Left   := De_Left;
          arr_OnEdit[4].Width  := 970;
          arr_OnEdit[4].Height := 24;
          arr_OnEdit[4].EditLabel.Width   := 100;
          arr_OnEdit[4].EditLabel.Caption := '설명';
          arr_OnEdit[4].Visible := True;

          arr_OnCombo[2] := TOnComboEdit.Create(Self);
          arr_OnCombo[2].Parent := pn_Detail;
          arr_OnCombo[2].Top    := De_Top;
          arr_OnCombo[2].Left   := De_Left + 460; //De_Left + 770;
          arr_OnCombo[2].Width  := 200;
          arr_OnCombo[2].Height := 24;
          arr_OnCombo[2].EditLabel.Width   := 100;
          arr_OnCombo[2].EditLabel.Caption := '사용여부';
          arr_OnCombo[2].EditLabel.Font.Style := [fsBold];
          arr_OnCombo[2].Items.Add('Y');
          arr_OnCombo[2].Items.Add('N');
          //arr_OnCombo[2].ReadOnly := True;
          arr_OnCombo[2].Visible  := True;
        end; // case 2 end
  end; // case end
  pn_Detail.Visible := True;
end;

procedure TForm1.OnGrDbGrid1DblClick(Sender: TObject);
var
  i : Integer;
  sl : TStrings;
  ms : TMemoryStream;
begin
  case current of
    0 : begin // 사용자 권한 관리
          for i := 1 to OraQuery1.Fields.Count do
          begin
            arr_OnEdit[i].Text := OnGrDbGrid1.Fields[i-1].Text;
          end; // for end
        arr_OnEdit[1].Enabled := False;
        end; // case 0 end
    1 : begin // 그룹별 사용자 관리
          arr_OnCombo[0].Text := OnGrDbGrid1.Fields[0].Text;
          arr_OnCombo[1].Text := OnGrDbGrid1.Fields[1].FieldName;
          arr_OnEdit[1].Text := OnGrDbGrid1.Fields[GetIndexByFieldName(OnGrDbGrid1,arr_OnCombo[1].Text)].Text;

          arr_OnCombo[0].Enabled := False;
          arr_OnEdit[1].Enabled := False;
        end; // case 1 end
    2 : begin // 사용자 질의 정보 관리
          //arr_OnCombo[1].Text := OnGrDbGrid1.Fields[0].Text;
          arr_OnEdit[1].Text  := OnGrDbGrid1.Fields[3].Text;//4
          arr_OnEdit[2].Text  := OnGrDbGrid1.Fields[0].Text;//1
          arr_OnEdit[3].Text  := OnGrDbGrid1.Fields[1].Text;//2
          OnMemo1.Lines.Text  := TBlobField(OnGrDbGrid1.Fields[4]).AsString;//5
          arr_OnEdit[4].Text  := OnGrDbGrid1.Fields[2].Text;//3
          arr_OnCombo[2].Text := OnGrDbGrid1.Fields[5].Text;//6

          arr_OnCombo[1].Enabled := False;
          arr_OnEdit[1].Enabled := False;
        end; // case 2 end
  end; // case end
end;

procedure TForm1.fb_AddClick(Sender: TObject);
var
  i : Integer;
begin
  case current of
    0 : begin // 사용자 권한 관리
          for i := 1 to OraQuery1.Fields.Count do
          begin
            arr_OnEdit[i].Text := '';
          end; // for end
          arr_OnEdit[1].Enabled := True;
          arr_OnEdit[1].SetFocus;
        end; // case 0 end
    1 : begin // 그룹별 사용자 관리
          arr_OnEdit[1].Enabled := True;
          arr_OnCombo[0].Text := '';
          arr_OnCombo[1].Text := '';

          arr_OnEdit[1].Enabled := True;
          arr_OnCombo[0].Enabled := True;
          arr_OnCombo[0].SetFocus;
        end; // case 1 end
    2 : begin // 사용자 질의 정보 관리
          arr_OnCombo[1].Text := '';
          arr_OnEdit[1].Text  := '';
          arr_OnEdit[2].Text  := '';
          arr_OnEdit[3].Text  := '';
          OnMemo1.Lines.Text  := '';
          arr_OnEdit[4].Text  := '';

          arr_OnCombo[1].Enabled := True;
          arr_OnEdit[1].Enabled := True;
        end; // case 2 end
  end; // case end
end;

procedure TForm1.fb_SaveClick(Sender: TObject);
begin
  case current of
    0 : begin // 사용자 권한 관리
          if (arr_OnEdit[1].Text = '') or (arr_OnEdit[2].Text = '') then
          begin
            Showmessage('사용자ID와 사용자명은 필수 입력 사항입니다.');
            Exit;
          end;
        
          if IDNO = Application.MessageBox('사용자 권한을 저장하시겠습니까?','작업안내', MB_YesNo) then Exit;

          with Ora_DML do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT COUNT(USERID) CNT ');
            Sql.Add('  FROM AQUSER            ');
            Sql.Add(' WHERE USERID = :UserId  ');

            ParamByName('UserId').AsString   := arr_OnEdit[1].Text;
            Open;
            if FieldByName('CNT').AsInteger = 0 then
            begin
              Sql.Clear;
              Sql.Add('INSERT INTO AQUSER             ');
              Sql.Add('VALUES (                       ');
              Sql.Add('        :UserId                ');
              Sql.Add('       ,:UserName              ');
              Sql.Add('       ,:Content               ');
              Sql.Add('       )                       ');

              ParamByName('UserId').AsString   := arr_OnEdit[1].Text;
              ParamByName('UserName').AsString := arr_OnEdit[2].Text;
              ParamByName('Content').AsString  := arr_OnEdit[3].Text;

              ExecSQL;

              Showmessage('권한이 부여되었습니다.');
            end
            else
            begin
              Sql.Clear;
              Sql.Add('UPDATE AQUSER                ');
              Sql.Add('   SET USERNAME = :UserName  ');
              Sql.Add('      ,CONTENT  = :Content   ');
              Sql.Add(' WHERE USERID   = :UserId    ');
               
              ParamByName('UserId').AsString   := arr_OnEdit[1].Text;
              ParamByName('UserName').AsString := arr_OnEdit[2].Text;
              ParamByName('Content').AsString  := arr_OnEdit[3].Text;

              ExecSQL;

              Showmessage('권한정보가 수정되었습니다.');
            end;
          end; // with end
        end; // case 0 end
    1 : begin  // 그룹별 사용자 관리
          if (arr_OnCombo[0].Text = '') or
             (arr_OnCombo[1].Text = '') then
          begin
            Showmessage('그룹명과 순번은 필수 입력 사항입니다.');
            Exit;
          end;

          if IDNO = Application.MessageBox('그룹별 사용자를 저장하시겠습니까?','작업안내', MB_YesNo) then Exit;

          with Ora_DML do
          begin
            Close;
            Sql.Clear;
            Sql.Add('UPDATE AQUSERM                ');
            Sql.Add('   SET '+'USER' + Copy(arr_OnCombo[1].Text,7,2)+' = :UserId       ');
            Sql.Add(' WHERE GROUPNAME = :GroupName ');

            ParamByName('UserId').AsString    := arr_OnEdit[1].Text;
            ParamByName('GroupName').AsString := arr_OnCombo[0].Text;

            ExecSQL;

            Showmessage('그룹별 사용자가 저장되었습니다.');
          end;
        end; // case 1 end
    2 : begin // 사용자 질의 정보 관리
          if arr_OnEdit[1].Text = ''then
          begin
            Showmessage('일련번호는 필수 입력 사항입니다.');
            Exit;
          end;

          if IDNO = Application.MessageBox('사용자 질의를 저장하시겠습니까?','작업안내', MB_YesNo) then Exit;

          with Ora_DML do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT COUNT(SEQNO) CNT          ');
            Sql.Add('  FROM AQUSERQUERY a             ');
            //Sql.Add('      ,AQUSER b                  ');
            Sql.Add(' WHERE a.USERID    = ''0000''    ');
            //Sql.Add('   AND b.USERNAME  = :UserName   ');
            Sql.Add('   AND a.SEQNO     = :SeqNo      ');

            //ParamByName('UserName').AsString  := arr_OnCombo[1].Text;
            ParamByName('SeqNo').AsString     := arr_OnEdit[1].Text;
            Open;

            if FieldByName('CNT').AsInteger = 0 then
            begin
              Sql.Clear;
              Sql.Add('INSERT INTO AQUSERQUERY ');
              Sql.Add('VALUES (                ');
              Sql.Add('        :UserId         ');
              Sql.Add('       ,:SeqNo          ');
              Sql.Add('       ,:QueryName      ');
              Sql.Add('       ,:Content        ');
              Sql.Add('       ,:UserSql        ');
              Sql.Add('       ,:GroupName      ');
              Sql.Add('       ,:UseYn          ');
              Sql.Add('       )                ');
              
              //ParamByName('UserId').AsString    := GetUserIdByUserName(arr_OnCombo[1].Text);
              ParamByName('UserId').AsString    := '0000';
              ParamByName('SeqNo').AsInteger    := StrToInt(arr_OnEdit[1].Text);
              ParamByName('QueryName').AsString := arr_OnEdit[3].Text;
              ParamByName('Content').AsString   := arr_OnEdit[4].Text;
              ParamByName('UserSql').AsBlob     := OnMemo1.Lines.Text;
              ParamByName('GroupName').AsString := arr_OnEdit[2].Text;
              ParamByName('UseYn').AsString     := arr_OnCombo[2].Text;

              ExecSQL;

              Showmessage('사용자 질의가 추가되었습니다.');
            end
            else
            begin
              Sql.Clear;
              Sql.Add('UPDATE AQUSERQUERY             ');
              Sql.Add('   SET GROUPNAME = :GroupName  ');
              Sql.Add('      ,QUERYNAME = :QueryName  ');
              Sql.Add('      ,CONTENT   = :Content    ');
              Sql.Add('      ,USERSQL   = :UserSql    ');
              Sql.Add('      ,USEYN     = :UseYn      ');
              Sql.Add(' WHERE USERID = :UserId        ');
              Sql.Add('   AND SEQNO  = :SeqNo         ');

              //ParamByName('UserId').AsString    := GetUserIdByUserName(arr_OnCombo[1].Text);
              ParamByName('UserId').AsString    := '0000';
              ParamByName('SeqNo').AsInteger    := StrToInt(arr_OnEdit[1].Text);
              ParamByName('QueryName').AsString := arr_OnEdit[3].Text;
              ParamByName('Content').AsString   := arr_OnEdit[4].Text;
              ParamByName('UserSql').AsBlob     := OnMemo1.Lines.Text;
              ParamByName('GroupName').AsString := arr_OnEdit[2].Text; 
              ParamByName('UseYn').AsString     := arr_OnCombo[2].Text;

              ExecSQL;

              Showmessage('사용자 질의가 수정되었습니다.');
            end;

          end;
        end; // case 2 end
  end; // case end

  Retrieve(current);
end;

procedure TForm1.fb_DelClick(Sender: TObject);
var
  UserId, UserName, SeqNo : String;
begin

  case current of
    0 : begin // 사용자 권한 관리
          UserId   := OnGrDbGrid1.Fields[0].Text;
          UserName := OnGrDbGrid1.Fields[1].Text;

          if IDNO = Application.MessageBox(PChar(UserName+'('+UserId+')의 사용자 권한을 삭제하시겠습니까?'),'작업안내', MB_YesNo) then Exit;

          with Ora_DML do
          begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE AQUSER             ');
            Sql.Add(' WHERE USERID = :UserId   ');

            ParamByName('UserId').AsString := UserId;
                      
            ExecSQL ;

            Showmessage('권한이 삭제되었습니다.');
          end; // with end
        end; // case 0 end
    1 : begin // 그룹별 사용자 관리
          //
        end; // case 1 end
    2 : begin // 사용자 질의 정보 관리
          UserId := GetUserIdByUserName(OnGrDbGrid1.Fields[0].Text);
          SeqNo  := OnGrDbGrid1.Fields[3].Text;

          if IDNO = Application.MessageBox(PChar(OnGrDbGrid1.Fields[0].Text+'의 사용자 질의 '''+
                                                 OnGrDbGrid1.Fields[1].Text+''' 을(를) 삭제하시겠습니까?'),'작업안내', MB_YesNo) then Exit;

          with Ora_DML do
          begin
            Close;
            Sql.Clear;
            Sql.Add('DELETE AQUSERQUERY        ');
            Sql.Add(' WHERE 1=1    ');
            Sql.Add('   AND SEQNO  = :SeqNo    ');

            ParamByName('SeqNo').AsString  := SeqNo;

            ExecSQL;

            Showmessage('사용자 질의가 삭제되었습니다.');
          end; // with end
        end;
  end; // case end

  Retrieve(current);
end;

// 입력 비활성화
procedure TForm1.InvisibleEdit;
var
  i : Integer;
begin
  if pn_Search.ControlCount > 0 then
  begin
    for i := (pn_Search.ControlCount - 1) downto 0 do
    begin
      pn_Search.Controls[i].Free;
      if i = 0 then break;
    end;
  end;

  if pn_Detail.ControlCount > 0 then
  begin
    for i := (pn_Detail.ControlCount - 1) downto 0 do
    begin
      pn_Detail.Controls[i].Free;
      if i = 0 then break;
    end;
  end;

  arr_onEdit := nil;
  arr_OnCombo := nil;

  SetLength(arr_OnEdit, 0);
  SetLength(arr_OnCombo, 0);
end;

// 그리드에서 해당 필드의 인덱스 얻음
function TForm1.GetIndexByFieldName(Target: TOnGrDbGrid; FN : String): Integer;
var
  i : Integer;
begin

  for i := 0 to Target.FieldCount - 1 do
  begin
    if Target.Fields[i].FieldName = FN then Result := i;
  end;
end;

// arr_OnCombo[1] Change Event
procedure TForm1.ComboChange(Sender: TObject);
begin
  if current = 1 then // 그룹별 사용자 관리
  begin
    if arr_OnCombo[0].Enabled = False then
    begin
      if arr_OnCombo[1].Text <> '' then
        arr_OnEdit[1].Text := OnGrDbGrid1.Fields[GetIndexByFieldName(OnGrDbGrid1,arr_OnCombo[1].Text)].Text
      else
        arr_OnEdit[1].Text := '';
    end;
  end
  else if current = 2 then
  begin
    Retrieve(current);
  end;
end;

procedure TForm1.KeyEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    fb_Search.Click;
end;

// 유저명으로 ID찾기
function TForm1.GetUserIdByUserName(P_UserName: String): String;
begin
  {with Ora_User do
  begin
    First;
    while(true) do
    begin
      if FieldByName('USERNAME').Text <> P_UserName then
      begin
        Next;
      end
      else
      begin
        break;
      end; // end if
    end; // end while
    result := FieldByName('USERID').Text;
  end;}
end;

// 입력창 텍스트 초기화
procedure TForm1.ClearEdit;
var
  i : Integer;
begin
  if pn_Detail.ControlCount > 0 then
  begin
    for i := (pn_Detail.ControlCount - 1) downto 0 do
    begin
      // 각 컴포넌트의 텍스트 초기화
      if pn_Detail.Controls[i].ClassName = 'TOnEdit' then
        (pn_Detail.Controls[i] as TOnEdit).Text := ''
      else if pn_Detail.Controls[i].ClassName = 'TOnComboEdit' then
        (pn_Detail.Controls[i] as TOnComboEdit).Text := ''
      else if pn_Detail.Controls[i].ClassName = 'TOnMemo' then
        (pn_Detail.Controls[i] as TOnMemo).Lines.Text := '';

      // Enabled False -> True
      if pn_Detail.Controls[i].Enabled = False then pn_Detail.Controls[i].Enabled := True;

      if i = 0 then break;
    end;
  end;
end;

procedure TForm1.fb_GroupClick(Sender: TObject);
begin
  // 사용자 그룹 권한 오픈
  Form2 := TForm2.Create(Form1);
  try
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
end;

end.
