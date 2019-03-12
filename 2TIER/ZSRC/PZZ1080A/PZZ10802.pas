unit PZZ10802;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, Db, MemDS, DBAccess, Ora, Func, StdCtrls, OnFocusButton,
  ComCtrls, Pass, OnListbox, ImgList, OnShapeLabel, OnLineLabel, Grids ;

type
  TForm2 = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    Ora_User: TOraQuery;
    Ora_Group: TOraQuery;
    olb_Group: TOnListBox;
    ImageList1: TImageList;
    olb_User: TOnListBox;
    OnSectionLabel1: TOnSectionLabel;
    OnSectionLabel2: TOnSectionLabel;
    ImageList2: TImageList;
    oe_UserId: TOnEdit;
    tmp_User: TStringGrid;
    oe_Korname: TOnEdit;
    oe_Deptname: TOnEdit;
    fb_Del: TOnFocusButton;
    fb_Add: TOnFocusButton;
    fb_Save: TOnFocusButton;
    Ora_DML: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure olb_GroupClick(Sender: TObject);
    procedure olb_UserClick(Sender: TObject);
    procedure fb_AddClick(Sender: TObject);
    procedure fb_SaveClick(Sender: TObject);
    procedure fb_DelClick(Sender: TObject);
  private
    { Private declarations }
    procedure Load_Group;

    // 버튼 컨틀로
    procedure Btn_Toggle(idx : Integer);

    // OnEdit 텍스트 초기화
    procedure EditClear;
  public
    { Public declarations }
    GroupName : String; // 현재 선택한 유저 그룹
    UserId : String;    // 현재 선택한 권한 유저
    GroupIdx : Integer;
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  OraConnect;
  Pempno   := PassEmp(cmdline,1);

  GroupIdx := 0;

  // 유저 그룹 조회
  Load_Group;
end;

// 유저 그룹 조회 (기타 그룹 제외)
procedure TForm2.Load_Group;
var
  i : Integer;
begin
  olb_Group.Clear;
  EditClear;

  with Ora_Group do
  begin
    Close;

    Sql.Clear;

    Sql.Add('SELECT DISTINCT GROUPNAME                              ');
    Sql.Add('  FROM AQGRUSER                                        ');
    Sql.Add(' WHERE GROUPNAME NOT IN (''98.정보검색2'',''99.기타'') ');
    Sql.Add(' ORDER BY                                              ');
    Sql.Add('       GROUPNAME                                       ');

    Open;

    for i := 0 to RecordCount - 1 do
    begin
      olb_Group.Items.Insert(i, FieldByName('GROUPNAME').AsString);
      Next;
    end;

  end;
  olb_Group.ItemIndex := GroupIdx;
  olb_GroupClick(Self);
end;

// 유저 그룹 클릭시 해당 권한 유저 Display
procedure TForm2.olb_GroupClick(Sender: TObject);
var
  i, j : Integer;
begin
  oe_UserId.Enabled := False;
  // 버튼 컨틀로
  Btn_Toggle(1);

  olb_User.Clear;
  EditClear;

  // 글로벌 변수 초기화
  GroupName := '';
  UserId    := '';
  GroupName := olb_Group.Items.Strings[olb_Group.ItemIndex]; // 현재 선택한 유저 그룹
  GroupIdx  := olb_Group.ItemIndex;

  with Ora_User do
  begin
    Close;
    Sql.Clear;

    Sql.Add('SELECT a.USERID, b.KORNAME, c.DEPTNAME');
    Sql.Add('  FROM AQGRUSER a                     ');
    Sql.Add('      ,PIMPMAS b                      ');
    Sql.Add('      ,PYCDEPT c                      ');
    Sql.Add(' WHERE a.GROUPNAME = :GroupName       ');
    Sql.Add('   AND b.EMPNO = a.USERID             ');
    Sql.Add('   AND c.DEPTCODE = b.DEPTCODE        ');
    Sql.Add('   AND c.ORGNUM = b.ORGNUM            ');
    Sql.Add(' ORDER BY                             ');
    Sql.Add('       USERID                         ');

    ParamByName('GroupName').AsString := GroupName;

    Open;
    
    tmp_User.RowCount := RecordCount;

    for i:= 0 to Ora_User.RecordCount - 1 do
    begin
      olb_User.Items.Insert(i, FieldByName('KORNAME').AsString);
      tmp_User.Cells[i,0] := FieldByName('USERID').AsString;
      tmp_User.Cells[i,1] := FieldByName('KORNAME').AsString;
      tmp_User.Cells[i,2] := FieldByName('DEPTNAME').AsString;
      Next;
    end;
  end;
end;

// 권한 유저 리스트 박스 선택시 사원 정보 Display
procedure TForm2.olb_UserClick(Sender: TObject);
begin 
   oe_UserId.Enabled := False;
   // 버튼 컨틀로
   Btn_Toggle(1);

   UserId := tmp_User.Cells[olb_User.ItemIndex,0];           // 현재 선택한 권한 유저
   oe_UserId.Text := tmp_User.Cells[olb_User.ItemIndex,0];   // 사번
   oe_Korname.Text := tmp_User.Cells[olb_User.ItemIndex,1];  // 성명
   oe_Deptname.Text := tmp_User.Cells[olb_User.ItemIndex,2]; // 부서명
end;

procedure TForm2.Btn_Toggle(idx: Integer);
begin
  case idx of
    0 :
      begin
        fb_Add.Visible    := False;
        fb_Save.Visible   := True;
      end;
    1 :
      begin
        fb_Add.Visible    := True;
        fb_Save.Visible   := False;
      end;
  end;

end;

procedure TForm2.fb_AddClick(Sender: TObject);
begin
  oe_UserId.Enabled := True;

  // 버튼 컨틀로
  Btn_Toggle(0);
end;

procedure TForm2.fb_SaveClick(Sender: TObject);
begin
  oe_UserId.Enabled := False;

  // 버튼 컨틀로
  Btn_Toggle(1);

  with Ora_DML do
  begin
    close;
    sql.clear;

    sql.add('INSERT INTO AQGRUSER                                                     ');
    sql.add('VALUES (:GroupName,:UserId,TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''),:Pempno)');

    ParamByName('GroupName').AsString := GroupName;
    ParamByName('UserId').AsString := oe_UserId.Text;
    ParamByName('Pempno').AsString := Pempno;

    ExecSQL;
  end;
  //showmessage(IntToStr(ora_dml.RecordCount));
  showmessage('저장이 완료됐습니다.');

  Load_Group;
end;

procedure TForm2.fb_DelClick(Sender: TObject);
begin
  if IDNO = Application.MessageBox(PChar(oe_Korname.Text+'('+UserId+')의 사용자 그룹 권한을 삭제하시겠습니까?'),'작업안내', MB_YesNo) then Exit;

  with Ora_DML do
  begin
    close;
    sql.clear;

    sql.add('DELETE AQGRUSER               ');
    sql.add(' WHERE GROUPNAME = :GroupName ');
    sql.add('   AND USERID    = :UserId    ');

    ParamByName('GroupName').AsString := GroupName;
    ParamByName('UserId').AsString := UserId;

    ExecSQL;
  end;

  showmessage('삭제가 됐습니다.');

  Load_Group;
end;

procedure TForm2.EditClear;
begin
  oe_UserId.Text   := '';
  oe_Korname.Text  := '';
  oe_Deptname.Text := '';
end;

end.
   