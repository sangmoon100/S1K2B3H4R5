unit PKA40601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn,
  OnTmaxPersonEdit, OnFocusButton,OnStringUtils;
  //timeftp,Datelib,pass, codeText,ImgList,jpeg,

type
  TMainForm = class(TForm)
    DataSource: TDataSource;
    Panel10: TPanel;
    P_Help: TPanel;
    OraQuery: TOraQuery;
    tmp_oraqry: TOraQuery;
    SF_Main: TOnSchemeForm;
    OnGrDbGrid1: TOnGrDbGrid;
    E_NOTICE_YN: TOnEdit;
    E_YEARLYPLAN_CNT: TOnEdit;
    E_USED_CNT: TOnEdit;
    bt_find: TOnFocusButton;
    BT_exit: TOnFocusButton;
    s_yearly_yy: TOnComboEdit;
    BT_Excel: TOnFocusButton;
    E_NOTICETIME: TOnEdit;
    E_YEARLY_CNT: TOnEdit;
    s_deptcode: TOnWinPopupEdit;
    e_empno: TOnPersonPopupEdit;
    E_ASSIGN_YN: TOnEdit;
    s_NOTICE_YN: TRadioGroup;
    s_ASSIGN_YN: TRadioGroup;
    s_cb_assign_no: TCheckBox;
    E_ASSIGNTIME: TOnEdit;
    BT_batch: TOnFocusButton;
    s_YN: TRadioGroup;
    BT_Excel_monthly: TOnFocusButton;
    s_empno: TOnWinPopupEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BT_exitClick(Sender: TObject);
    procedure bt_findClick(Sender: TObject);
    procedure s_yearly_yyChange(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure BT_inputClick(Sender: TObject);
    procedure s_cb_assign_noClick(Sender: TObject);
    procedure s_empnoCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure BT_batchClick(Sender: TObject);
    procedure BT_Excel_monthlyClick(Sender: TObject);
    procedure s_empnoInitPopup(Sender: TObject);
  private
    { Private declarations }
  public
    FL_Date     : String;
    FL_Sql      : String;
    FL_IDate    : Integer;
    Vempno      : String;
    GSYear      : String[4];     //기준년도
    Mod_Flag    : String;

    //저장변수
    p_empno            : String;
    p_korname          : String;
    p_yearly_cnt       : String;
    p_yearlyplan_cnt   : String;
    p_used_cnt         : String;
    p_assign_yn        : String;    

    procedure clear_fields;
    procedure Retrieve;
    function  PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
    function  Insert_PKYEARLTLOG(v_modflag : string) : Boolean;

    { Public declarations }
  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;


implementation

uses PKA40602,PKA40603;
{$R *.DFM}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  Vempno   := Pempno;

  Application.ProcessMessages;

  //관리자 권한 이외에는 사용불가.
  if (Copy(Pgrade,3,1) > 'C') then
  begin
       MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
       Close;
  end;

  Application.ProcessMessages;

  FL_Date    := copy(fn_GetDateStr,1,4);

  if not IsNumber(FL_Date) then
    System.Exit;

  FL_IDate := strtoint(FL_Date);
  s_yearly_yy.Items.Clear;
  s_yearly_yy.KeyItems.Clear;
  s_yearly_yy.Items.Add(IntToStr(FL_IDate-1)+' 년');
  s_yearly_yy.Items.Add(FL_Date+' 년');
  s_yearly_yy.Items.Add(IntToStr(FL_IDate+1)+' 년');
  s_yearly_yy.KeyItems.Add(IntToStr(FL_IDate-1));
  s_yearly_yy.KeyItems.Add(FL_Date);
  s_yearly_yy.KeyItems.Add(IntToStr(FL_IDate+1));
  s_yearly_yy.ItemIndex := 1;

  clear_fields;

  s_cb_assign_no.checked := false;
  BT_batch.Enabled       := false;
end;

procedure TMainForm.clear_fields;
begin
  e_empno.Text             := '';
  e_empno.Enabled          := false;
  E_YEARLY_CNT.Enabled     := false;
  E_YEARLYPLAN_CNT.Enabled := false;
  E_USED_CNT.Enabled       := false;
  E_NOTICE_YN.Enabled      := false;
  E_NOTICETIME.Enabled     := false;
  E_ASSIGN_YN.Enabled      := false;
  E_ASSIGNTIME.Enabled     := false;

  E_YEARLY_CNT.Text        := '';
  E_YEARLYPLAN_CNT.Text    := '';
  E_USED_CNT.Text          := '';

  E_NOTICE_YN.Text         := '';
  E_NOTICETIME.Text        := '';
  E_ASSIGN_YN.Text         := '';
  E_ASSIGNTIME.Text        := '';
end;


procedure TMainForm.Retrieve;
begin
  clear_fields;

  with OraQuery do
  begin
    Close;
    Sql.Clear;
    sql.add('SELECT                                                                                               ');
    sql.add('         A.EMPNO                                                                   EMPNO,            ');
    sql.add('         B.KORNAME                                                                 KORNAME,          ');
    sql.add('         B.PAYRA                                                                   PAYRA,            ');
    sql.add('         (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = B.PAYRA)  PAYRANM,       ');
    sql.add('         C.DEPTCODE                                                                DEPTCODE,         ');
    sql.add('         C.DEPTNAME                                                                DEPTNAME,         ');
    sql.add('         A.YEARLY_CNT                                                              YEARLY_CNT,       ');
    sql.add('         A.YEARLYPLAN_CNT                                                          YEARLYPLAN_CNT,   ');
    sql.add('         PAYUTIL.GET_DUTY_CNT(A.EMPNO,A.YEARLY_YY||''0101'',A.YEARLY_YY||''1231'',''1'') USED_CNT,   ');
    sql.add('         NVL(A.NOTICE_YN,''N'')                                                      NOTICE_YN,      ');
    sql.add('         CASE WHEN NVL(A.NOTICE_YN,''N'')=''Y'' THEN A.NOTICETIME  ELSE '''' END         NOTICETIME, ');
    sql.add('         NVL(A.ASSIGN_YN,''N'')                                                      ASSIGN_YN,      ');
    sql.add('         CASE WHEN NVL(A.ASSIGN_YN,''N'')=''Y'' THEN A.ASSIGNTIME  ELSE '''' END         ASSIGNTIME  ');
    sql.add('    FROM PKYEARLT A, PIMPMAS B, PYCDEPT C                                                            ');
    sql.add('   where yearly_yy = :yearly_yy                                                                      ');
    sql.add('     and b.pstate < ''80''                                                                           ');
    sql.add('     AND A.EMPNO = B.EMPNO                                                                           ');
    sql.add('     AND B.ORGNUM = C.ORGNUM                                                                         ');
    sql.add('     AND B.DEPTCODE= C.DEPTCODE                                                                      ');

    if Trim(ParseString(s_deptcode.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (c.deptcode like ''%' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  or     ');
      SQL.Add('      c.DEPTNAME like ''%' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  )      ');
    end;

    if Trim(ParseString(s_empno.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (b.EMPNO   like ''%' + Trim(ParseString(s_empno.text,'-',1)) + '%''  or         ');
      SQL.Add('      b.korname like ''%' + Trim(ParseString(s_empno.text,'-',1)) + '%''  )          ');
    end;

    if s_YN.ItemIndex = 1 then
    begin
      sql.add(' AND YEARLYPLAN_CNT > 0                              ');
      sql.add(' AND SUBSTR(A.EMPNO,1,1) NOT IN (''P'',''Q'',''Y'')  ');
    end
    else if s_YN.ItemIndex = 2 then
    begin
      sql.add(' AND (  (YEARLYPLAN_CNT = 0)                             ');
      sql.add('      OR(SUBSTR(A.EMPNO,1,1) IN (''P'',''Q'',''Y'') ))   ');
    end;

    if s_NOTICE_YN.ItemIndex = 1 then
       SQL.Add(' and nvl(a.NOTICE_YN,''N'') = ''Y''          ')
    else if s_NOTICE_YN.ItemIndex = 2 then
       SQL.Add(' and nvl(a.NOTICE_YN,''N'') = ''N''          ');

    if s_ASSIGN_YN.ItemIndex = 1 then
       SQL.Add(' and nvl(a.ASSIGN_YN,''N'') = ''Y''          ')
    else if s_ASSIGN_YN.ItemIndex = 2 then
       SQL.Add(' and nvl(a.ASSIGN_YN,''N'') = ''N''          ');

    if s_cb_assign_no.Checked then
    begin
      sql.add(' AND YEARLYPLAN_CNT > 0                              ');
      sql.add(' AND SUBSTR(A.EMPNO,1,1) NOT IN (''P'',''Q'',''Y'')  ');
      SQL.Add(' and nvl(a.ASSIGN_YN,''N'') = ''N''                  ');
      SQL.Add(' and PAYUTIL.GET_DUTY_CNT(A.EMPNO,A.YEARLY_YY||''0101'',A.YEARLY_YY||''1231'',''1'')  >= nvl(YEARLYPLAN_CNT,0)        ');
    end;

    Sql.Add('  ORDER BY a.EMPNO                                         ');

    ParamByName('yearly_yy').AsString  := GSYear;
    Open;

    fieldbyname('EMPNO'    ).Alignment := taCenter;
  end;
end;

function TMainForm.PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
begin
  result := 0.0;

  with tmp_oraqry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select nvl(payutil.GET_DUTY_CNT('''+empno+''','''+fromdate+''','''+todate+''','''+flag+'''),0) used_cnt from dual  ');

    Open;

    if(RecordCount > 0) then
      result := FieldByName('used_cnt').AsFloat
    else result := 0.0;
  end;
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  with OraQuery do
  begin
    e_empno.Text          := FieldByName('EMPNO').AsString + ' - ' +
                             FieldByName('KORNAME').AsString;

    E_YEARLY_CNT.text     := FieldByName('YEARLY_CNT').AsString;
    E_YEARLYPLAN_CNT.text := FieldByName('YEARLYPLAN_CNT').AsString;
    E_USED_CNT.text       := FieldByName('USED_CNT').AsString;

    E_NOTICE_YN.text      := FieldByName('NOTICE_YN').AsString;
    E_NOTICETIME.text     := FieldByName('NOTICETIME').AsString;
    E_ASSIGN_YN.text      := FieldByName('ASSIGN_YN').AsString;
    E_ASSIGNTIME.text     := FieldByName('ASSIGNTIME').AsString;
  end; 
end;


procedure TMainForm.BT_exitClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까?','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;


procedure TMainForm.bt_findClick(Sender: TObject);
begin
  P_Help.Caption := '';
  Retrieve;
end;

procedure TMainForm.s_yearly_yyChange(Sender: TObject);
begin
  GSYear := s_yearly_yy.KeyItems[s_yearly_yy.ItemIndex];

  if(FL_Date<>GSYear) then
  begin
    s_cb_assign_no.Checked := false;
    s_cb_assign_no.Enabled := false;
    BT_batch.Enabled       := false;
  end
  else
  begin
    s_cb_assign_no.Enabled := true;
    BT_batch.Enabled       := true;
  end;

  //Retrieve;
end;

//2015.01.12.hjku.. 로그 추가
function  TMainForm.Insert_PKYEARLTLOG(v_modflag : string) : Boolean;
var
  Tem : string;
begin
  Insert_PKYEARLTLOG := false;

  with tmp_oraqry do
  begin
    Close;
    sql.Clear;
    sql.add('INSERT INTO PKYEARLTLOG                                     ');
    sql.add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') MODTIME,       ');
    sql.add('       ''' + v_modflag + ''' MODFLAG,                       ');
    sql.add('       ''' + Pempno + ''' MODEMP,                           ');
    sql.add('       ''PKA4060A'' PIPROGID,                               ');
    sql.add('       A.* FROM PKYEARLT A                                  ');
    Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''                         ');
    Sql.Add('   AND Empno   = '''+copy(p_empno,1,4)+'''                  ');
    EXECSQL;
  end;

  Insert_PKYEARLTLOG := true;
end;

procedure TMainForm.BT_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if OraQuery.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;
  P_Help.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 13], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  p_help.caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '연차휴가 사용촉진 명단';  //시트명 부여
  XL.Range['A1:M2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := GSYear+'년 연차휴가 사용촉진 내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사원번호'        ;
  XArr[ 2]  := '사원성명'        ;
  XArr[ 3]  := '직책코드'        ;
  XArr[ 4]  := '직책명'          ;
  XArr[ 5]  := '부서코드'        ;
  XArr[ 6]  := '부서명'          ;
  XArr[ 7]  := '연차일수'        ;
  XArr[ 8]  := '사용가이드'      ;
  XArr[ 9]  := '사용일수'        ;
  XArr[10]  := '고지완료여부'    ;
  XArr[11]  := '고지완료일'      ;
  XArr[12]  := '사용시기완료여부';
  XArr[13]  := '사용시기완료일'  ;

  XL.Range['A3' , 'M3'].Value := XArr;
  k := 3;
  for i := 1 to 13 do
  begin
    XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
    XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
    XL.Range[CHR(64 + i) + '3'].font.Size := 10;
    XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := tmp_oraqry.GetBookmark;
  OraQuery.DisableControls;
  OraQuery.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  OraQuery.RecordCount do
  begin
    XArr[ 1]  := ''''+OraQuery.FieldbyName('EMPNO').AsString;
    XArr[ 2]  := OraQuery.FieldByName('KORNAME').AsString;
    XArr[ 3]  := OraQuery.FieldByName('PAYRA').AsString;
    XArr[ 4]  := OraQuery.FieldByName('PAYRANM').AsString;
    XArr[ 5]  := OraQuery.FieldByName('DEPTCODE').AsString;
    XArr[ 6]  := OraQuery.FieldByName('DEPTNAME').AsString;
    XArr[ 7]  := OraQuery.FieldbyName('YEARLY_CNT').AsString;
    XArr[ 8]  := OraQuery.FieldbyName('YEARLYPLAN_CNT').AsString;
    XArr[ 9]  := OraQuery.FieldByName('used_cnt').AsString;
    XArr[10]  := OraQuery.FieldByName('NOTICE_YN').AsString;
    XArr[11]  := ''''+OraQuery.FieldByName('NOTICETIME').AsString;
    XArr[12]  := OraQuery.FieldByName('ASSIGN_YN').AsString;
    XArr[13]  := ''''+OraQuery.FieldByName('ASSIGNTIME').AsString;

    XL.Range['A' + IntToStr(k+1), 'M' + IntToStr(k+1)].Value := XArr;
    inc(k);
    OraQuery.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'M' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'M' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'M' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'M' + IntToStr(k)].font.name := '맑은 고딕';  //'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'M' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'M' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   XL.Range['A1', 'M' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   OraQuery.GotoBookmark(SavePlace);
   OraQuery.FreeBookmark(SavePlace);
   OraQuery.EnableControls;
   p_help.caption := '';
end;

procedure TMainForm.s_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
    s_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;
  end;
  //Retrieve;
end;

procedure TMainForm.s_deptcodeInitPopup(Sender: TObject);
begin
  DeptForm.GSorgnum     := '';
  DeptForm.GSdeptcode   := '';
  DeptForm.GSdeptname   := '';
  DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;


procedure TMainForm.BT_inputClick(Sender: TObject);
begin
  clear_fields;
  
  Mod_Flag := 'I';
  e_empno.Enabled    := true;

end;

procedure TMainForm.s_cb_assign_noClick(Sender: TObject);
begin
  if(s_cb_assign_no.Checked) then
  begin
    s_YN.ItemIndex        := 1;
    s_ASSIGN_YN.ItemIndex := 2;
    BT_batch.Enabled      := true;
  end
  else
  begin
    BT_batch.Enabled := false;  
  end;
  Retrieve;
end;

procedure TMainForm.s_empnoCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
    s_empno.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;

    // Retrieve;
  end;
end;

procedure TMainForm.BT_batchClick(Sender: TObject);
var
  cnt_all, cnt_ok, cnt_err : integer;
begin
  if not(s_cb_assign_no.checked) then
  begin
    MessageDlg('[연차휴가 사용촉진 완료 미처리자] 체크하여 다시 조회하신후 반영하시기 바랍니다.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  if(OraQuery.RecordCount <=0) then
  begin
    MessageDlg('완료 일괄 반영할 자료가 없습니다.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  cnt_all := 0;
  cnt_err := 0;
  cnt_ok  := 0;
  
  OraQuery.first;
  p_empno := '';

  while not OraQuery.EOF do
  begin
    p_empno          := OraQuery.FieldByName('EMPNO').AsString;
    p_yearly_cnt     := OraQuery.FieldByName('YEARLY_CNT').AsString;
    p_yearlyplan_cnt := OraQuery.FieldByName('YEARLYPLAN_CNT').AsString;
    p_used_cnt       := OraQuery.FieldByName('used_cnt').AsString;
    p_assign_yn      := OraQuery.FieldByName('ASSIGN_YN').AsString;

    cnt_all := cnt_all + 1;

    if(p_yearlyplan_cnt > p_used_cnt) or (p_assign_yn='Y') then
    begin
      cnt_err := cnt_err + 1;
      OraQuery.Next;
      continue;
    end;

    //변경하기 전에 전체 로그 남김 추가..
    if not(Insert_PKYEARLTLOG('C')) then
    begin
      cnt_err := cnt_err + 1;
      OraQuery.Next;
      continue;
    end;

    tmp_oraqry.Close;
    tmp_oraqry.sql.clear;
    tmp_oraqry.SQL.Add('update pkyearlt a                                                                 ');
    tmp_oraqry.SQL.Add('   set                                                                            ');
    tmp_oraqry.SQL.Add('       notice_yn    = ''Y''                                                       ');
    tmp_oraqry.SQL.Add('      ,noticeempno  = nvl(noticeempno  ,empno)                                    ');
    tmp_oraqry.SQL.Add('      ,noticetime   = nvl(trim(noticetime),to_char(sysdate,''YYYYMMDDHH24miss'')) ');
    tmp_oraqry.SQL.Add('      ,assign_yn    = ''Y''                                                       ');
    tmp_oraqry.SQL.Add('      ,assignempno  = nvl(assignempno  ,empno)                                    ');
    tmp_oraqry.SQL.Add('      ,assigntime   = nvl(trim(assigntime),to_char(sysdate,''YYYYMMDDHH24miss'')) ');
    tmp_oraqry.SQL.Add('where yearly_yy =''' + GSYear  + '''                                              ');
    tmp_oraqry.SQL.Add('  and empno     =''' + p_empno + '''                                              ');

    try
      tmp_oraqry.ExecSQL;
    except
      cnt_err := cnt_err + 1;
      OraQuery.Next;
      continue;
    end;
    cnt_ok := cnt_ok + 1;
    OraQuery.Next;
  end;

  MessageDlg('총 '+ inttostr(cnt_all) + '건중 ' + inttostr(cnt_ok)+'이 완료되었습니다.', MtWarning, [mbok], 0);
  p_help.caption := '[완료 일괄 반영] 이 완료되었습니다.';

  Retrieve;
end;

procedure TMainForm.BT_Excel_monthlyClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  with tmp_oraqry do
  begin
    Close;
    Sql.Clear;
    sql.add('SELECT                                                                                            ');
    sql.add('       A.EMPNO                   ,                                                                ');
    sql.add('       A.KORNAME                 ,                                                                ');
    sql.add('       C.DEPTCODE                ,                                                                ');
    sql.add('       C.DEPTNAME                ,                                                                ');
    sql.add('       TOT_YEARLY_CNT            ,                                                                ');
    sql.add('       PRE_USED_CNT              ,                                                                ');
    sql.add('       NEXT_YEARLY_CNT           ,                                                                ');
    sql.add('       YEARLY_CNT                ,                                                                ');
    sql.add('       YEARLYPLAN_CNT            ,                                                                ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0101'',B.YEARLY_YY||''0131'',''1'') M1,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0201'',B.YEARLY_YY||''0231'',''1'') M2,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0301'',B.YEARLY_YY||''0331'',''1'') M3,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0401'',B.YEARLY_YY||''0431'',''1'') M4,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0501'',B.YEARLY_YY||''0531'',''1'') M5,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0601'',B.YEARLY_YY||''0631'',''1'') M6,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0701'',B.YEARLY_YY||''0731'',''1'') M7,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0801'',B.YEARLY_YY||''0831'',''1'') M8,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''0901'',B.YEARLY_YY||''0931'',''1'') M9,        ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''1001'',B.YEARLY_YY||''1031'',''1'') M10,       ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(A.EMPNO,B.YEARLY_YY||''1101'',B.YEARLY_YY||''1131'',''1'') M11,       ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(a.EMPNO,B.YEARLY_YY||''1201'',B.YEARLY_YY||''1231'',''1'') M12,       ');
    sql.add('       PAYUTIL.GET_DUTY_CNT(a.EMPNO,B.YEARLY_YY||''0101'',B.YEARLY_YY||''1231'',''1'') M_SUM      ');
    sql.add('  FROM PIMPMAS A,  PKYEARLT B, PYCDEPT C                                                          ');
    sql.add(' WHERE B.YEARLY_YY = :yearly_yy                                                                   ');
    sql.add('   AND A.EMPNO     = B.EMPNO                                                                      ');
    sql.add('   AND A.ORGNUM    = C.ORGNUM                                                                     ');
    sql.add('   AND A.DEPTCODE  = C.DEPTCODE                                                                   ');
    sql.add('   AND A.PSTATE     < ''80''                                                                      ');

    if Trim(ParseString(s_deptcode.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (C.deptcode like ''%' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  or     ');
      SQL.Add('      C.DEPTNAME like ''%' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  )      ');
    end;

    if Trim(ParseString(s_empno.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (A.EMPNO   like ''%' + Trim(ParseString(s_empno.text,'-',1)) + '%''  or         ');
      SQL.Add('      A.korname like ''%' + Trim(ParseString(s_empno.text,'-',1)) + '%''  )          ');
    end;

    if s_YN.ItemIndex = 1 then
    begin
      sql.add(' AND YEARLYPLAN_CNT > 0                                  ');
      sql.add(' AND SUBSTR(A.EMPNO,1,1) NOT IN (''P'',''Q'',''Y'')      ');
    end
    else if s_YN.ItemIndex = 2 then
    begin
      sql.add(' AND (  (YEARLYPLAN_CNT = 0)                             ');
      sql.add('      OR(SUBSTR(A.EMPNO,1,1) IN (''P'',''Q'',''Y'') ))   ');
    end;

    if s_NOTICE_YN.ItemIndex = 1 then
       SQL.Add(' and nvl(B.NOTICE_YN,''N'') = ''Y''                     ')
    else if s_NOTICE_YN.ItemIndex = 2 then
       SQL.Add(' and nvl(B.NOTICE_YN,''N'') = ''N''                     ');

    if s_ASSIGN_YN.ItemIndex = 1 then
       SQL.Add(' and nvl(B.ASSIGN_YN,''N'') = ''Y''                     ')
    else if s_ASSIGN_YN.ItemIndex = 2 then
       SQL.Add(' and nvl(B.ASSIGN_YN,''N'') = ''N''                     ');

    if s_cb_assign_no.Checked then
    begin
      sql.add(' AND YEARLYPLAN_CNT > 0                                  ');
      sql.add(' AND SUBSTR(A.EMPNO,1,1) NOT IN (''P'',''Q'',''Y'')      ');
      SQL.Add(' AND nvl(B.ASSIGN_YN,''N'') = ''N''                      ');
      SQL.Add(' AND PAYUTIL.GET_DUTY_CNT(B.EMPNO,B.YEARLY_YY||''0101'',B.YEARLY_YY||''1231'',''1'')  >= nvl(YEARLYPLAN_CNT,0)        ');
    end;

    Sql.Add('  ORDER BY a.EMPNO                                         ');

    ParamByName('yearly_yy').AsString := GSYear;
    Open;
  end;

  if tmp_oraqry.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;

  P_Help.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 22], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    p_help.caption := '';
    Exit;
  end;

  p_help.caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '월별 연차 사용 내역';  //시트명 부여
  XL.Range['A1:V2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := GSYear+'년 월별 연차 사용 내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사원번호'          ;
  XArr[ 2]  := '사원성명'          ;
  XArr[ 3]  := '부서코드'          ;
  XArr[ 4]  := '부서명'            ;
  XArr[ 5]  := '연차발생일수'      ;
  XArr[ 6]  := '전년도사용일수'    ;
  XArr[ 7]  := '익년도선사용일수'  ;
  XArr[ 8]  := '연차사용가능일수'  ;
  XArr[ 9]  := '사용가이드'        ;
  XArr[10]  := '1월'               ;
  XArr[11]  := '2월'               ;
  XArr[12]  := '3월'               ;
  XArr[13]  := '4월'               ;
  XArr[14]  := '5월'               ;
  XArr[15]  := '6월'               ;
  XArr[16]  := '7월'               ;
  XArr[17]  := '8월'               ;
  XArr[18]  := '9월'               ;
  XArr[19]  := '10월'              ;
  XArr[20]  := '11월'              ;
  XArr[21]  := '12월'              ;
  XArr[22]  := '년간 사용일수'     ;

  XL.Range['A3' , 'V3'].Value := XArr;

  k := 3;
  for i := 1 to 22 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := tmp_oraqry.GetBookmark;
  tmp_oraqry.DisableControls;
  tmp_oraqry.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  tmp_oraqry.RecordCount do
  begin
    XArr[ 1]  := ''''+tmp_oraqry.FieldbyName('EMPNO').AsString;
    XArr[ 2]  := tmp_oraqry.FieldByName('KORNAME').AsString;
    XArr[ 3]  := tmp_oraqry.FieldByName('DEPTCODE').AsString;
    XArr[ 4]  := tmp_oraqry.FieldByName('DEPTNAME').AsString;
    XArr[ 5]  := tmp_oraqry.FieldbyName('TOT_YEARLY_CNT').AsString;
    XArr[ 6]  := tmp_oraqry.FieldbyName('PRE_USED_CNT').AsString;
    XArr[ 7]  := tmp_oraqry.FieldbyName('NEXT_YEARLY_CNT').AsString;
    XArr[ 8]  := tmp_oraqry.FieldbyName('YEARLY_CNT').AsString;
    XArr[ 9]  := tmp_oraqry.FieldbyName('YEARLYPLAN_CNT').AsString;
    XArr[10]  := tmp_oraqry.FieldByName('M1').AsString;
    XArr[11]  := tmp_oraqry.FieldByName('M2').AsString;
    XArr[12]  := tmp_oraqry.FieldByName('M3').AsString;
    XArr[13]  := tmp_oraqry.FieldByName('M4').AsString;
    XArr[14]  := tmp_oraqry.FieldByName('M5').AsString;
    XArr[15]  := tmp_oraqry.FieldByName('M6').AsString;
    XArr[16]  := tmp_oraqry.FieldByName('M7').AsString;
    XArr[17]  := tmp_oraqry.FieldByName('M8').AsString;
    XArr[18]  := tmp_oraqry.FieldByName('M9').AsString;
    XArr[19]  := tmp_oraqry.FieldByName('M10').AsString;
    XArr[20]  := tmp_oraqry.FieldByName('M11').AsString;
    XArr[21]  := tmp_oraqry.FieldByName('M12').AsString;
    XArr[22]  := tmp_oraqry.FieldByName('M_SUM').AsString;

    XL.Range['A' + IntToStr(k+1), 'V' + IntToStr(k+1)].Value := XArr;
    inc(k);
    tmp_oraqry.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'V' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'V' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'V' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'V' + IntToStr(k)].font.name := '맑은 고딕';  //'굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
  XL.Range['A3', 'V' + IntToStr(k)].font.Size           := 9;
  XL.Range['A4', 'V' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
  XL.Range['A1', 'V' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  tmp_oraqry.GotoBookmark(SavePlace);
  tmp_oraqry.FreeBookmark(SavePlace);
  tmp_oraqry.EnableControls;
  p_help.caption := '';
end;


procedure TMainForm.s_empnoInitPopup(Sender: TObject);
begin
  EmpForm.GSempnoS    := '' ;
  EmpForm.GSkornameS  := '' ;
  EmpForm.GSpstateS   := '' ;
  EmpForm.GSdeptcodeS := '' ;
  EmpForm.GSdeptnameS := '' ;
  EmpForm.E_Cond.Text := '' ;

  EmpForm.Edit        := TOnWinPopupEdit(Sender);
  EmpForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end; 

end.


