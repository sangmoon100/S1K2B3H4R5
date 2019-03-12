{============================= Program Header ========================================
PROGRAM-NAME    : PZZ1060A(정보검색Ⅱ(재개발))
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 기타
Programmer      : 이상문
Version         : 1.00
Date            : 2017.11.10
Update contents
  1.00    2017.11.10   이상문   기존프로그램 재개발                       정보검색Ⅱ
  1.01    2018.04.23   이상문   안내문 추가
======================================================================================}

unit PZZ10601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Func,
  Db, MemDS, DBAccess, Ora, StdCtrls, OnListbox, Pass, Menus, ExtCtrls,
  ComCtrls, OnTreeview, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, Grids,
  DBGrids, OnGrDBGrid, OnRichEdit, Buttons, CheckLst, pelistbox, OnLineLabel,
  OnEditBtnCtrl, OnFocusButton, ComObj, ShellAPI, ImgList, Math;

type
  TInfoSearch2Main = class(TForm)
    Ora_Tree: TOraQuery;
    pn_Top: TPanel;
    pn_Bottom: TPanel;
    OnGrDbGrid1: TOnGrDbGrid;
    Ora_Grid: TOraQuery;
    ds_UserQuery: TDataSource;
    pn_Param: TPanel;
    Bevel1: TBevel;
    ImageList1: TImageList;
    fb_Excute: TOnFocusButton;
    fb_txtSave: TOnFocusButton;
    fb_ExcelSave: TOnFocusButton;
    Label3: TLabel;
    Label4: TLabel;
    sb_Group: TScrollBox;
    Label2: TLabel;
    OnTreeView1: TOnTreeView;
    sb_List: TScrollBox;
    clb_Columns: TPeJeonCheckListBox;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    RE_SQL: TOnRichEdit;
    RE_Content: TOnRichEdit;
    pn_Sql: TPanel;
    Memo1: TMemo;
    sb_Help: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure OnTreeView1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_SearchClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure fb_ExcuteClick(Sender: TObject);
    procedure oed_Search1KeyPress(Sender: TObject; var Key: Char);
    procedure fb_ExcelSaveClick(Sender: TObject);
    procedure fb_txtSaveClick(Sender: TObject);
    procedure clb_ColumnsClickCheck(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OnTreeView1Click(Sender: TObject);
    procedure OnGrDbGrid1Enter(Sender: TObject);
  private
    { Private declarations }
    // 사용자 질의 인자 체크
    procedure SQL_ParamCheck;

    // 사용자 질의 필드 조회
    procedure SQL_FieldSearch;

    // 사용자 질의 실행
    procedure ExcuteUserQuery;

    // 쿼리 생성
    function GenerateSql(P_DataSet : TOraQuery) : String;

    // ColRowToRangeStr 엑셀 행열명으로 변환
    function CRToRS(Col, Row : Integer) : String;

    // filter를 '|'로 끊어서 확장자 부분을 추출
    function Tokenizer(P_String : String) : TStringList;

    // Number Type 천 단위 표시
    procedure NumberThousandSeperater(XL : Variant; DS : TOraQuery; Last : Integer);
  public
    { Public declarations }
    OriginSql  : String;
    ParamCnt   : Integer;
    CheckedCnt : Integer;
    arr_pn_Param : array of TPanel;
    arr_ed_Param : array of TEdit;
    arr_OnEd_Param : array of TOnEdit;
    SelFields : TStringList;
    Pempno2   : String;
    //procedure WMHotKey(var Message: TWMHotKey); message WM_HotKey;
  end;

var
  InfoSearch2Main: TInfoSearch2Main;

implementation

uses PZZ10602;
{$R *.DFM}

var
  UserAuth : TUserAuth;

// 사용자 질의 인자 체크
procedure TInfoSearch2Main.SQL_ParamCheck;
var
  i : Integer;
  SectionLabel1 : TOnSectionLabel;
begin
  // 패널 자식 컨트롤 초기화
  for i := 0 to pn_Param.ControlCount - 1 do
  begin
    pn_Param.Controls[0].Free;
  end;

  with Ora_Grid do
  begin
    Close;
    Sql.Clear;

    Sql.Text := RE_SQL.Text;

    for i := 0 to Fields.Count - 1 do
    begin
      clb_Columns.Items.Add(Fields.Fields[i].FieldName);
    end;

    ParamCnt := Params.Count;

    // 인자 체크
    if ParamCnt > 0 then
    begin
      SetLength(arr_OnEd_Param, ParamCnt);

      // 라벨 생성
      SectionLabel1 := TOnSectionLabel.Create(Self);

      SectionLabel1.Parent  := Pn_Param;
      SectionLabel1.Top     := 8;
      SectionLabel1.Left    := 8;
      SectionLabel1.Width   := 170;
      SectionLabel1.Caption := '※ 조건값 입력';
      SectionLabel1.Color   := clBlack;
      SectionLabel1.Font.Color  := clWhite;
      SectionLabel1.Font.Size   := 12;
      SectionLabel1.Transparent := False;

      for i := 0 to ParamCnt - 1 do
      begin
        // 인자 입력 동적생성
        arr_OnEd_Param[i] := TOnEdit.Create(Self);

        arr_OnEd_Param[i].Parent     := pn_Param;
        arr_OnEd_Param[i].Top        := 60 + (35 * i);
        arr_OnEd_Param[i].Left       := 8;
        arr_OnEd_Param[i].Height     := 25;
        arr_OnEd_Param[i].Width      := 240;
        arr_OnEd_Param[i].EditLabel.Color      := $FF6612;
        arr_OnEd_Param[i].EditLabel.Font.Size  := 12;
        arr_OnEd_Param[i].EditLabel.Font.Style := [fsBold];
        arr_OnEd_Param[i].EditLabel.Font.Color := clWhite;
        arr_OnEd_Param[i].EditLabel.Caption    := Params[i].Name;
        arr_OnEd_Param[i].EditLabel.Width      := 140;
        arr_OnEd_Param[i].OnKeyPress           := oed_Search1KeyPress;

        // 알파벳 대문자 설정
        arr_OnEd_Param[i].EditInputMode.IMEkind := edit_hmEnglish;
        arr_OnEd_Param[i].CharCase := ecUpperCase;
      end;

    end
    else
    begin

    end;

    pn_Param.Visible     := True;

    SQL_FieldSearch;
  end;
end;

// 사용자 질의 실행
procedure TInfoSearch2Main.ExcuteUserQuery;
var
  i : Integer;
  OldSql : String;
begin
  CheckedCnt := 0;

  with Ora_grid do
  begin
    // 필드 선택 여부 체크
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
      if clb_Columns.Checked[i] then inc(CheckedCnt);
    end;

    OnGrDbGrid1.Columns.Clear;

    Sql.Text := GenerateSql(Ora_grid);

    // 인자 유효성 체크
    if ParamCnt > 0 then
    begin
      for i := 0 to ParamCnt - 1 do
      begin
        if arr_OnEd_Param[i].Text = '' then
        begin
          Showmessage(arr_OnEd_Param[i].EditLabel.Caption+'이(가) 입력이되지 않았습니다.');
          Exit;
        end; // end if

        // 인자 입력
        ParamByName(arr_OnEd_Param[i].EditLabel.Caption).AsString := arr_OnEd_Param[i].Text;
      end; // end for
    end; // end if

    Open;

    SelFields := nil;

    // 컬럼길이 조절
    for i :=0 to OnGrDbGrid1.Columns.Count - 1 do
    begin

      // Title > Text
      if OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption) > OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text) then
        OnGrDbGrid1.Columns[i].width := 10 + OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption)
      // Title < Text
      else
        OnGrDbGrid1.Columns[i].width := 10 + OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text);

      {Showmessage(IntToStr(OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Title.Caption))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth(OnGrDbGrid1.Columns[i].Field.Text))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth('가'))
                 + '/' + IntToStr(OnGrDbGrid1.Canvas.TextWidth('2'))
                 );}
      //Showmessage(IntToStr(OnGrDbGrid1.Columns[i].Field.Size));
      //OnGrDbGrid1.Columns[i].width := 7 * OnGrDbGrid1.Columns[i].Field.Size;
    end;

    sb_Help.Panels[1].Text := '조회가 완료되었습니다.';

    fb_ExcelSave.Enabled := True;
    fb_txtSave.Enabled   := True;
  end; // end with
end;

// 사용자 질의 필드 조회
procedure TInfoSearch2Main.SQL_FieldSearch;
var
  i : Integer;
begin
  // 필드 리스트 초기화
  clb_Columns.Clear;

  with Ora_Tree do
  begin
    Close;

    Sql.Clear;
    Sql.Text := RE_SQL.Text;

    Open;

    for i := 0 to Fields.Count - 1 do
    begin
      clb_Columns.Items.Add(Fields.Fields[i].FieldName);
    end;
  end;
end;

procedure TInfoSearch2Main.FormCreate(Sender: TObject);
var
  i, j : Integer;
  //tmp_Group : TStringList;
  TreeNode : TTreeNode;
begin
  // 환경 셋팅
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);
  UserAuth := TUserAuth.Create(Self);

  // 로컬 변수 초기화
  TreeNode := OnTreeView1.Selected;
  //tmp_Group := TStringList.Create;

  { //불필요한 부분으로 주석
  if not (UserAuth.UserAuthority) then
  begin
    Showmessage('정보검색 Ⅱ 프로그램의 사용 권한이 없습니다!');
    Close;
  end;
  }
  // 운영 개발자는 모든 사용자 권한으로..
  Pempno2 := PassEmp(cmdline,1);
  if Copy(Pempno,1,1) = 'D' then
    Pempno := '0000';


  // 그룹 권한 조회
  UserAuth.GroupAuthority(Pempno);

  if UserAuth.Ora_Auth.RecordCount = 0 then
  begin
    showmessage('조회할 정보가 없습니다.');
    exit;
  end;

  // 권한 있는 그룹만 트리뷰 출력
  for i := 0 to UserAuth.Ora_Auth.RecordCount - 1 do
  begin
    OnTreeView1.Items.Insert(TreeNode,UserAuth.Ora_Auth.FieldbyName('GROUPNAME').AsString);
    //tmp_Group.Add(UserAuth.Ora_Auth.FieldbyName('GROUPNAME').AsString);

    UserAuth.Ora_Auth.Next;
  end;
  UserAuth.Ora_Auth.Close;

  // 단축키 설정 - 디벨로퍼 F9가 안먹힘
  {if RegisterHotKey(Self.Handle, GlobalAddAtom('SampleHotKeyForm'),
                    0, VK_F9) = False then
    ShowMessage('핫키등록 실패');}

  label3.Caption := '※ 정보검색 실행순서(방법)                                     ' + #13
                  + '1. 사용자 질의 그룹에서 질의 선택하여 더블클릭                 ' + #13
                  + '2. 우측 사용자질의명 좌측의 체크박스 선택(특정필드만 선택 가능)' + #13
                  + '3. 조건값 입력을 요구하는 질의시 조건값 입력(없을시 Pass)      ';
  label4.Caption :=  #13 + '4. 상단의 "①실행" 버튼 클릭                                   ' + #13
                  + '5. 상단의 "②Excel저장" 또는 "②Text저장" 클릭                 ';

  // 1034 - 546
  pn_Bottom.Height := Floor(InfoSearch2Main.Height * 0.5);
end;


procedure TInfoSearch2Main.OnTreeView1DblClick(Sender: TObject);
var
  i, j, Level, LineCnt : Integer;
  SelTreeNode : TTreeNode;
  GroupName : String;
begin
  // 로컬 변수 초기화
  SelTreeNode := OnTreeView1.Selected;
  GroupName := SelTreeNode.Text;
  Level := SelTreeNode.Level;

  fb_ExcelSave.Enabled := False;
  fb_txtSave.Enabled   := False;

  with Ora_Tree, OnTreeView1 do
  begin

    if Level = 0 then  // 최상위 일때
    begin
      Close;

      Sql.Clear;
      Sql.Add('SELECT QUERYNAME              ');
      Sql.Add('  FROM AQUSERQUERY            ');
      Sql.Add(' WHERE GROUPNAME = :GroupName ');
      //Sql.Add('   AND USERID = :Pempno       ');
      Sql.Add(' ORDER BY                     ');
      Sql.Add('       SEQNO                  ');

      ParamByName('GroupName').AsString := GroupName;
      //ParamByName('Pempno').AsString    := Pempno;

      Open;

      if SelTreeNode.Count = 0 then // 자식노드가 없는 상태
      begin                         // 없으면 추가, 있으면 패스
        for i := 0 to Ora_Tree.RecordCount - 1 do
        begin
          Items.AddChild(SelTreeNode,Ora_Tree.FieldbyName('QUERYNAME').AsString);
          Ora_Tree.Next;
        end; // for end

        // 펼침
        SelTreeNode.Expand(True);
      end
    end
    else if Level = 1 then // 하위 일때
    begin
      CheckBox1.Checked := False;
      Close;

      Sql.Clear;
      Sql.Add('SELECT USERSQL, CONTENT      ');
      Sql.Add('  FROM AQUSERQUERY            ');
      Sql.Add(' WHERE QUERYNAME = :GroupName ');
      //Sql.Add('   AND USERID = :Pempno       ');
      Sql.Add(' ORDER BY                     ');
      Sql.Add('       SEQNO                  ');

      ParamByName('GroupName').AsString := GroupName;
      //ParamByName('Pempno').AsString    := Pempno;

      Open;

      Label1.Caption := GroupName;
      RE_SQL.Lines.Text     := Ora_Tree.FieldbyName('USERSQL').AsString;
      RE_Content.Lines.Text := Ora_Tree.FieldbyName('CONTENT').AsString;
      // 개발자만 SQL문장 보이게
      if Copy(Pempno2,1,1) = 'D' then
      begin
        Memo1.Lines.Text := RE_SQL.Text;
        Memo1.Visible := True;
      end;
      OriginSql := RE_SQL.Text;

      // 파라메터 체크
      SQL_ParamCheck;

      fb_Excute.Enabled := True;
      CheckBox1.Checked := True;
    end;
  end; // with end

  OnTreeView1.Height := sb_Group.Height - Floor(sb_Group.Height * 0.1);;
  sb_Group.BringToFront;
end;


procedure TInfoSearch2Main.FormDestroy(Sender: TObject);
begin
  //UnRegisterHotKey(Self.Handle, GlobalAddAtom('SampleHotKeyForm'));
  InfoSearch2Main := nil;
end;

procedure TInfoSearch2Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;


procedure TInfoSearch2Main.Btn_SearchClick(Sender: TObject);
begin
   ExcuteUserQuery;
end;

procedure TInfoSearch2Main.CheckBox1Click(Sender: TObject);
var
  i, not_cnt : Integer;
begin
  if clb_Columns.Items.Count = 0 then
  begin
    CheckBox1.Checked := False;
    Exit;
  end;

  not_cnt := 0;

  // 전체 체크 기능
  if CheckBox1.Checked then
  begin
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
       clb_Columns.Checked[i] := True;
    end;
  end
  else
  begin
    for i := 0 to clb_Columns.Items.Count - 1 do
    begin
      if not clb_Columns.Checked[i] then
      begin
        inc(not_cnt);
      end; // if end
    end; // for end

    if not_cnt <> 0 then
      CheckBox1.Checked := False
    else
    begin
      for i := 0 to clb_Columns.Items.Count - 1 do
      begin
        clb_Columns.Checked[i] := False;
      end; // for end
    end; // if end
  end; // with end
end;

// 쿼리 생성
function TInfoSearch2Main.GenerateSql(P_DataSet: TOraQuery): String;
var
  i : Integer;
begin

  with P_DataSet do
  begin
    // 1. 필드 생성
    // 필드 선택 여부 경우
    if (CheckedCnt > 0) and (CheckedCnt <> clb_Columns.Items.Count)  then
    begin
      SelFields := TStringList.Create;

      //Close;
      Sql.Clear;
      SQL.Text := OriginSql;
      Open;
      for i := 0 to P_DataSet.FieldList.Count - 1 do
      begin
        if clb_Columns.Checked[i] then
        begin
          IntToStr(SelFields.Add(clb_Columns.Items[i]));
        end;
      end;

      Sql.Clear;
      Sql.Add('Select              ');
      Sql.Add('                    ');
      // 선택한 필드 보여주기
      for i := 0 to SelFields.Count - 1 do
      begin
        if i = 0 then
          Sql.Add('       "'+SelFields.Strings[i] + '"' )
        else
          Sql.Add('      ,"'+SelFields.Strings[i] + '"' );
      end;
      Sql.Add('  from              ');
      Sql.Add('      (             ');
      Sql.Add(        OriginSql     );
      Sql.Add('      ) T1          ');

    end
    else
    begin
      Sql.Clear;
      //SQL.Text := OriginSql;
      Sql.Add('Select              ');
      Sql.Add('       *            ');
      Sql.Add('  from              ');
      Sql.Add('      (             ');
      Sql.Add(        OriginSql     );
      Sql.Add('      ) T1          ');

    end; // end if


  end;

  //pn_Condition.Visible := True;

  Result := P_DataSet.Sql.Text;
end;

procedure TInfoSearch2Main.fb_ExcuteClick(Sender: TObject);
begin
  ExcuteUserQuery;

  sb_Group.SendToBack;
end;

procedure TInfoSearch2Main.oed_Search1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    ExcuteUserQuery;
end;

// Excel 저장
procedure TInfoSearch2Main.fb_ExcelSaveClick(Sender: TObject);
var
  XL, XArr : Variant;
  i, k : integer;
  FieldCnt : Integer;
begin
  if Trim(OnGrDbGrid1.Fields[0].Text) = '' then
  begin
    Showmessage('엑셀 변환할 자료가 없습니다!');
    Exit;
  end;

  sb_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  FieldCnt := OnGrDbGrid1.FieldCount;
  XArr := VarArrayCreate([1, FieldCnt], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    sb_Help.Panels[1].Text := '';
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  SB_help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := Label1.Caption;  //시트명 부여
  XL.Range['A1:'+CRToRS(FieldCnt,2)].Merge; //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := Label1.Caption;
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to FieldCnt do
  begin
    XArr[i]  := OnGrDbGrid1.Fields[i-1].FieldName;
  end;

  XL.Range['A3' , CRToRS(FieldCnt,3)].Value := XArr;
  for i := 1 to FieldCnt do
  begin
    XL.Range[CRToRS(i,3)].HorizontalAlignment := 3;
    XL.Range[CRToRS(i,3)].Interior.Color:= $00CBF0B3;
    XL.Range[CRToRS(i,3)].font.Size := 10;
    XL.Range[CRToRS(i,3)].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  k := 3;
  Ora_Grid.DisableControls;
  Ora_Grid.First;

  while(true) do
  begin
    for i := 1 to FieldCnt do
    begin
      // FieldType에 따른 데이터 출력
      // 숫자 타입
      if Ora_Grid.Fields[i-1].DataType in [ftSmallint, ftInteger] then
        XArr[i]  := Ora_Grid.Fields[i-1].AsInteger
      // 실수 타입
      else if Ora_Grid.Fields[i-1].DataType in [ftWord, ftFloat] then
        XArr[i]  := Ora_Grid.Fields[i-1].AsFloat
      // 문자 타입
      else if Ora_Grid.Fields[i-1].DataType = ftString then
        XArr[i]  := Ora_Grid.Fields[i-1].AsString;
    end;
    XL.Range['A'+IntToStr(k+1) , CRToRS(FieldCnt,k+1)].NumberFormat := AnsiChar('@');
    XL.Range['A'+IntToStr(k+1) , CRToRS(FieldCnt,k+1)].Value := XArr;
    inc(k);
    Ora_Grid.Next;
    if Ora_Grid.Eof then Break;
  end;
  
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', CRToRS(FieldCnt,k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
  XL.Range['A1', CRToRS(FieldCnt,k)].font.name := '맑은 고딕';  //'굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;   //가운데 정렬
  XL.Range['A3', CRToRS(FieldCnt,k)].font.Size           := 9;
  XL.Range['A4', CRToRS(FieldCnt,k)].HorizontalAlignment := 1;  //좌측정렬
  XL.Range['A1', CRToRS(FieldCnt,k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                 //자동정렬
  NumberThousandSeperater(XL,Ora_Grid,k);                       //숫자 타입 천 단위 표시
  XL.Range['A4', 'A4'].Select;                                  //A4열에 커서 위치시킴
  XL.ActiveWindow.FreezePanes := True;
  XL.Visible := true;                                           //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  Ora_Grid.EnableControls;
  SB_help.Panels[1].Text := '';
end;

function TInfoSearch2Main.CRToRS(Col, Row: Integer): String;
const
  ALPHA_COUNT = 26;
var
  Col_Str : String;
begin
  col_str := chr(ord('A') + ((col - 1) div alpha_count) - 1);
  if ((col - 1) div alpha_count) = 0 then
    col_str := chr(ord('A') + ((col - 1) mod alpha_count))
  else
    col_str := col_str + chr(ord('A') + ((col - 1) mod alpha_count));

  result := col_str + IntToStr(row);
end;

// Text 저장
procedure TInfoSearch2Main.fb_txtSaveClick(Sender: TObject);
var
  sl,sl2 : TStringList;
  i  : Integer;
  tmp,FN : String;
  sd  : TSaveDialog;
begin
  sl := TStringList.Create;
  sd := TSaveDialog.Create(Self);

  Ora_Grid.DisableControls;
  // 헤더 추출
  for i := 0 to Ora_Grid.FieldCount - 1 do
  begin
    if i = Ora_Grid.FieldCount - 1 then
      tmp := tmp + Ora_Grid.Fields[i].FieldName
    else
      tmp := tmp + Ora_Grid.Fields[i].FieldName + ',';
  end;
  sl.Add(tmp);
  sl.Add('');

  tmp := '';
  Ora_Grid.First;
  // 그리드 데이터 추출
  while(True) do
  begin
    tmp := '';
    for i := 0 to Ora_Grid.FieldCount - 1 do
    begin
      if i = Ora_Grid.FieldCount - 1 then
        tmp := tmp + Ora_Grid.Fields[i].Text
      else
        tmp := tmp + Ora_Grid.Fields[i].Text + ',';
    end;

    sl.Add(tmp);
    Ora_Grid.Next;
    if Ora_Grid.Eof then Break;
  end;

  sd.FilterIndex := 1;
  sd.InitialDir  := 'C:\Users\%USERNAME%\Desktop';
  sd.Filter := '텍스트파일(.txt)|*.txt';
  sl2 := Tokenizer(sd.Filter);

  // 확인시 로직
  if sd.Execute then
  begin
    if Pos(sl2[sd.FilterIndex],sd.FileName) = 0 then
      FN := sd.FileName+sl2[sd.FilterIndex]
    else
      FN := sd.FileName;
    sl.SaveToFile(FN);
    ShellExecute(0, 'open', PChar(FN), nil, '', SW_SHOWNORMAL);
  end;

  sd.Free;
  sl.Free;

end;

// filter를 '|'로 끊어서 확장자 부분을 추출
function TInfoSearch2Main.Tokenizer(P_String: String): TStringList;
var
  sl : TStringList;
  len, i : Integer;
  tmp : String;  // 작업 후 문자열
  tmp_Value, Value : String;
begin
  // Local 변수 초기화
  sl := TStringList.Create;
  sl.Capacity := 3;
  sl.Insert(0,'');
  len := Length(P_String);
  i := 1;

  // 임시 변수 tmp에 '|' 가 없을 때 까지..
  while(Pos('|',tmp) = 0) do
  begin
    tmp := Copy(P_String,Pos('|',P_String)+1,len);              // 1. 원본에서 '|' 찾아서 +1 부터 끝까지 복사
    len := Length(tmp);                                         // 1. 작업 후 길이 측정
    tmp_Value := Copy(P_String,1,Pos('|',P_String)-1);          // 2. 원본에서 '|' 찾아서 처음부터 -1까지 복사
    Value := Copy(P_String,Pos('|',P_String)+1,Pos('|',tmp)-1); // 2. 두 번쨰 작
    Value := Copy(Value,Pos('*',Value)+1,Length(Value));
    tmp := Copy(tmp,Pos('|',tmp)+1,len);

    sl.Insert(i,Value);
    inc(i);
  end;

  Result := sl;

end;
{
procedure TInfoSearch2Main.WMHotKey(var Message: TWMHotKey);
begin
  Show;
  if fb_Excute.Enabled then
    ExcuteUserQuery;
  //if Message.HotKey = GlobalFindAtom('VK_F10') then
  //showmessage(FloatToStr(Message.HotKey)+'/'+FloatToStr(Message.Result));
  //showmessage(FloatToStr(GlobalFindAtom('VK_F9')));
  //showmessage(FloatToStr(VK_F9));
end;}

procedure TInfoSearch2Main.clb_ColumnsClickCheck(Sender: TObject);
var
  i, not_cnt : Integer;
begin
  not_cnt := 0;
  with clb_Columns do
  begin
    for i := 0 to Items.Count - 1 do
    begin
      if not Checked[i] then
      begin
        inc(not_cnt);
      end; // if end
    end; // for end

    if not_cnt <> 0 then
      CheckBox1.Checked := False
    else
      CheckBox1.Checked := True;

  end; // with end
end;

procedure TInfoSearch2Main.NumberThousandSeperater(XL: Variant; DS : TOraQuery; Last : Integer);
var
  i, FieldCnt : Integer;
begin
  FieldCnt := DS.FieldCount;
  for i := 1 to FieldCnt do
  begin
    // 숫자 타입이면...
    if DS.Fields[i-1].DataType in [ftSmallint, ftInteger, ftWord, ftFloat] then
      XL.Range[CRToRS(i,4), CRToRS(i,Last)].NumberFormatLocal := '###,###,###,##0'
    else
      XL.Range[CRToRS(i,4), CRToRS(i,Last)].NumberFormat := AnsiChar('@');
  end;
end;

procedure TInfoSearch2Main.FormResize(Sender: TObject);
begin
  //showmessage('onResize ' + FloatToStr(InfoSearch2Main.Height * 0.5) + '/' + IntToStr(Floor(InfoSearch2Main.Height * 0.5)));
  pn_Bottom.Height := Floor(InfoSearch2Main.Height * 0.5);
  pn_Bottom.Top := InfoSearch2Main.Height - pn_Bottom.Height;
end;

procedure TInfoSearch2Main.OnTreeView1Click(Sender: TObject);
begin
  //pn_Bottom.SendToBack;
  sb_Group.BringToFront;
end;

procedure TInfoSearch2Main.OnGrDbGrid1Enter(Sender: TObject);
begin
  sb_Group.SendToBack;
  //pn_Bottom.BringToFront;
end;

end.


