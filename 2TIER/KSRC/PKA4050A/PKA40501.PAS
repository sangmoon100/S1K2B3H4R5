unit PKA40501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids, Fempno,
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
    E_TOT_YEARLY_CNT: TOnEdit;
    E_YEARLYPLAN_CNT: TOnEdit;
    E_USED_CNT: TOnEdit;
    BT_batch: TOnFocusButton;
    bt_find: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_exit: TOnFocusButton;
    ED_year: TOnComboEdit;
    s_empno: TOnPersonPopupEdit;
    BT_delete: TOnFocusButton;
    BB_Excel: TOnFocusButton;
    E_PRE_USED_CNT: TOnEdit;
    E_YEARLY_CNT: TOnEdit;
    s_deptcode: TOnWinPopupEdit;
    e_empno: TOnPersonPopupEdit;
    BT_input: TOnFocusButton;
    Label1: TLabel;
    E_NEXT_YEARLY_CNT: TOnEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure E_TOT_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
    procedure E_YEARLYPLAN_CNTKeyPress(Sender: TObject; var Key: Char);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure bt_findClick(Sender: TObject);
    procedure BT_batchClick(Sender: TObject);
    procedure ED_yearChange(Sender: TObject);
    procedure BT_deleteClick(Sender: TObject);
    procedure BB_ExcelClick(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure BT_inputClick(Sender: TObject);
    procedure E_PRE_USED_CNTKeyPress(Sender: TObject; var Key: Char);
    procedure E_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
    procedure E_NEXT_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
//    procedure BBexitClick(Sender: TObject);
//    procedure DataSourceDataChange(Sender: TObject; Field: TField);
//    procedure BBcancelClick(Sender: TObject);
//    procedure BBdeleteClick(Sender: TObject);
//    procedure BBinsertClick(Sender: TObject);
//    procedure BBsaveClick(Sender: TObject);
//    procedure SB_1Click(Sender: TObject);
//    procedure BBexcelClick(Sender: TObject);
//    procedure E_empnoInitPopup(Sender: TObject);
//    procedure E_empnoCloseUp(Sender: TObject; var Text: String;
//      var Accept: Boolean);
//    procedure E_botyymm1Click(Sender: TObject);
//    procedure R_conyn1Click(Sender: TObject);
//    procedure BBmailClick(Sender: TObject);
//    procedure E_EMPNOEnter(Sender: TObject);
  private
    { Private declarations }
  public
    Vempno      : String;
    GSYear      : String[4];     //기준년도
    Mod_Flag    : String;

    //저장변수
    p_empno            : String;
    p_korname          : String;
    p_tot_yearly_cnt   : String;
    p_pre_used_cnt     : String;
    p_next_yearly_cnt  : String;
    p_yearly_cnt       : String;
    p_yearlyplan_cnt   : String;

    procedure clear_fields;
    procedure Retrieve;
    Function  save_pkyearlt : Boolean;
    function  PL_Get_Duty_Cnt(empno, fromdate, todate, flag : String) : real;
    function  Insert_PKYEARLTLOG(v_modflag : string) : Boolean;
    function  Check_Valid_Year : Boolean;
    Function  IsValidEmpno(const empno : String):Boolean;
    Function  IsFloat(s : string) : Boolean;
//    procedure delete_record;
//    procedure insert_record;
//    procedure update_record;
    { Public declarations }
  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;


implementation

uses PKA40503, PKA40502;
{$R *.DFM}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  FL_Date : String;
  FL_Sql  : String;
  FL_IDate: Integer;
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
  ED_year.Items.Clear;
  ED_year.KeyItems.Clear;
  ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
  ED_year.Items.Add(FL_Date+' 년');
  ED_year.Items.Add(IntToStr(FL_IDate+1)+' 년');
  ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
  ED_year.KeyItems.Add(FL_Date);
  ED_year.KeyItems.Add(IntToStr(FL_IDate+1));
  ED_year.ItemIndex := 1;

  //s_empno.Text     := Pempno + ' - ' + Pkorname;
  clear_fields;
end;

procedure TMainForm.clear_fields;
begin
  Mod_Flag                 := 'U';
  e_empno.Text             := '';
  e_empno.Enabled          := false;

  E_TOT_YEARLY_CNT.Text    := '';
  E_PRE_USED_CNT.Text      := '';
  E_NEXT_YEARLY_CNT.Text   := '';
  E_YEARLY_CNT.Text        := '';
  E_YEARLYPLAN_CNT.Text    := '';
  E_USED_CNT.Text          := '';

  BT_delete.Enabled        := true;
  E_USED_CNT.Enabled       := false;
end;

function TMainForm.Check_Valid_Year : Boolean;
begin
  result := false;

  with tmp_oraqry do
  begin
    Close;
    Sql.Clear;
    Sql.Add('select case when substr(Knteyymm,5,2) = ''12'' then case when (substr(Knteyymm,1,4) < ''' + GSYear + ''') then ''Y'' else ''N'' end ');
    Sql.Add('     when (substr(Knteyymm,1,4) <= ''' + GSYear + ''') then ''Y''                                                                   ');
    Sql.Add('     else ''N'' end valid                                                                                                           ');
    Sql.Add('  from pkcpbas                                                                                                                      ');

    Open;

    if(FieldByName('valid').AsString='Y') then result := true
    else result := false;
  end;
end;

procedure TMainForm.Retrieve;
begin
  clear_fields;

  with OraQuery do
  begin
    Close;
    Sql.Clear;
         Sql.Add(' SELECT YEARLY_YY,                                       ');
         Sql.Add('        A.EMPNO,                                         ');
         Sql.Add('        B.KORNAME,                                       ');
         Sql.Add('        B.DEPTCODE,                                      ');
         Sql.Add('        C.DEPTNAME,                                      ');
         Sql.Add('        nvl(TOT_YEARLY_CNT,0)       TOT_YEARLY_CNT,      ');
         Sql.Add('        nvl(PRE_USED_CNT,0)         PRE_USED_CNT,        ');
         Sql.Add('        nvl(NEXT_YEARLY_CNT,0)      NEXT_YEARLY_CNT,     ');
         Sql.Add('        nvl(YEARLY_CNT,0)           YEARLY_CNT,          ');
         Sql.Add('        nvl(YEARLYPLAN_CNT,0)       YEARLYPLAN_CNT,      ');
         Sql.Add('        upper(nvl(NOTICE_YN,''N'')) NOTICE_YN,           ');
         Sql.Add('        upper(nvl(ASSIGN_YN,''N'')) ASSIGN_YN,           ');
         Sql.Add('        nvl(payutil.GET_DUTY_CNT(a.empno,a.YEARLY_YY||''0101'',a.YEARLY_YY||''1231'',''1''),0) used_cnt    ');
         Sql.Add('   FROM PKYEARLT a, pimpmas b, pycdept c                 ');
         SQL.Add('  where YEARLY_YY  = :yearly_yy                          ');
         Sql.Add('    AND a.empno    = b.empno                             ');
         Sql.Add('    and b.orgnum   = c.orgnum                            ');
         Sql.Add('    and b.deptcode = c.deptcode                          ');

    if Trim(ParseString(s_deptcode.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (c.deptcode like ''' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  or     ');
      SQL.Add('      c.DEPTNAME like ''' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  )      ');
    end;

    if Trim(ParseString(s_empno.text,'-',1)) <> '' then
    begin
      SQL.Add(' and (a.EMPNO   like ''' + Trim(ParseString(s_empno.text,'-',1)) + '%''  or         ');
      SQL.Add('      a.korname like ''' + Trim(ParseString(s_empno.text,'-',1)) + '%''  )          ');
    end;

    Sql.Add('  ORDER BY EMPNO                                         ');

    ParamByName('yearly_yy').AsString := GSYear;
    Open;

    fieldbyname('EMPNO'     ).Alignment := taCenter;
  end;



end;



procedure TMainForm.E_TOT_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
var
  iKey : Integer;
  iPos : Integer;
  iLen : integer;
  iSel : integer;
  iAfterPointDigit :integer;
  iBeforePointDigit :integer;
  sText : string;
begin
    sText := E_TOT_YEARLY_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_TOT_YEARLY_CNT.SelStart;
    iAfterPointDigit := 1;
    iBeforePointDigit := 3;

    if iKey = $08 then exit;

    if not(iKey in [$2E, $30..$39]) then begin Key := #0; exit; end;

    iPos :=  Pos('.', sText);

    if (iPos <> 0) and (iKey = $2E) then begin Key := #0; exit;  end

    else if (iPos = 0) and (iKey = $2E) and (iLen = 0) then
      begin Key := #0; exit; end;

    if (iPos > 0 ) then
    begin
      if ((iLen - iPos - 1) > (iBeforePointDigit - 1)) then
        begin Key := #0; exit; end;
    end
    else
    begin
      if (iLen > iBeforePointDigit - 1) and (iKey <> $2E) then
        begin Key := #0; exit; end;
    end;

    if (iPos > 0 ) and ((iPos + iAfterPointDigit - 1) < iLen) then
      if iSel > iPos then begin Key := #0; exit; end;
end;

procedure TMainForm.E_YEARLYPLAN_CNTKeyPress(Sender: TObject;
  var Key: Char);
var
    iKey : Integer;
    iPos : Integer;
    iLen : integer;
    iSel : integer;
    iAfterPointDigit :integer;
    iBeforePointDigit :integer;
    sText : string;
begin
    sText := E_YEARLYPLAN_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_YEARLYPLAN_CNT.SelStart;
    iAfterPointDigit := 1;
    iBeforePointDigit := 3;

    if iKey = $08 then exit;

    if not(iKey in [$2E, $30..$39]) then begin Key := #0; exit; end;

    iPos :=  Pos('.', sText);

    if (iPos <> 0) and (iKey = $2E) then begin Key := #0; exit;  end

    else if (iPos = 0) and (iKey = $2E) and (iLen = 0) then
      begin Key := #0; exit; end;


    if (iPos > 0 ) then
    begin
      if ((iLen - iPos - 1) > (iBeforePointDigit - 1)) then
        begin Key := #0; exit; end;
    end
    else
    begin
      if (iLen > iBeforePointDigit - 1) and (iKey <> $2E) then
        begin Key := #0; exit; end;
    end;

    if (iPos > 0 ) and ((iPos + iAfterPointDigit - 1) < iLen) then
      if iSel > iPos then begin Key := #0; exit; end;
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
    E_TOT_YEARLY_CNT.text := FieldByName('TOT_YEARLY_CNT').AsString;
    E_PRE_USED_CNT.text   := FieldByName('PRE_USED_CNT').AsString;
    E_NEXT_YEARLY_CNT.text:= FieldByName('NEXT_YEARLY_CNT').AsString;

    E_YEARLY_CNT.text     := FieldByName('YEARLY_CNT').AsString;
    E_YEARLYPLAN_CNT.text := FieldByName('YEARLYPLAN_CNT').AsString;
    E_USED_CNT.text       := FieldByName('USED_CNT').AsString;
  end;

  if(E_TOT_YEARLY_CNT.text='') then E_TOT_YEARLY_CNT.text := '0';
  if(E_PRE_USED_CNT.text='')   then E_PRE_USED_CNT.text   := '0';
  if(E_YEARLY_CNT.text='')     then E_YEARLY_CNT.text     := '0';
  if(E_YEARLYPLAN_CNT.text='') then E_YEARLYPLAN_CNT.text := '0';
  if(E_USED_CNT.text='')       then E_USED_CNT.text       := '0';
end;

Function TMainForm.IsFloat(s : string) : Boolean;
var
    i : Integer;
begin
    Result:= true;

    if s = '' Then Result := False;

    for i := 1 to Length(s) do
    begin
        if not((('0' <= s[i] ) and (s[i] <= '9'))or (s[i] = '.')or (s[i] = '-')) then
        begin
            Result := False;
            break;
        end;
     end;
end;

Function TMainForm.IsValidEmpno(const empno : String):Boolean;
Begin
    Result:= False;

    with tmp_oraqry do
    begin
        Close;
        Sql.Clear;
        SQL.Add('SELECT count(empno) cnt,                ');
        SQL.ADD('        ''field2'',                     ');
        SQL.ADD('        ''field3'',                     ');
        SQL.ADD('        ''field4'',                     ');
        SQL.ADD('        ''field5''                      ');
        SQL.Add('  FROM pimpmas                          ');
        SQL.Add(' WHERE EMPNO = ''' + trim(empno) + '''  ');
        SQL.Add('   AND PSTATE <''80''                   ');

        Open;

        if FieldByName('cnt').AsInteger > 0 then Result:= True;
    end;
End;

procedure TMainForm.BT_exitClick(Sender: TObject);
begin
    if MessageBox(handle,'종료 하시겠습니까?','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;


Function TMainForm.save_pkyearlt : Boolean;
var
    i : Integer;
begin
    result := false;

    //2015.01.12.hjku.. 삭제하기 전에 전체 로그 남김 추가..
    if not(Insert_PKYEARLTLOG('C')) then System.exit;

    with tmp_oraqry do
    begin
         Close;
         Sql.Clear;
         sql.add('MERGE INTO PKYEARLT P                                                                                                 ');
         sql.add('  USING (SELECT EMPNO,                                                                                                ');
         sql.add('                KORNAME,                                                                                              ');
         sql.add('                '''+GSYear+'''               YEARLY_YY,                                                               ');
         sql.add('                nvl('+p_tot_yearly_cnt+',0)  TOT_YEARLY_CNT,                                                          ');
         sql.add('                nvl('+p_pre_used_cnt+',0)    PRE_USED_CNT,                                                            ');
         sql.add('                nvl('+p_next_yearly_cnt+',0) NEXT_YEARLY_CNT,                                                         ');
         sql.add('                nvl('+p_yearly_cnt+',0)      YEARLY_CNT,                                                              ');
         sql.add('                nvl('+p_yearlyplan_cnt+',0)  YEARLYPLAN_CNT,                                                          ');
         sql.add('                '''+Pempno+''' WRITEID,                                                                               ');
         sql.add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24miss'') WRITETIME                                                       ');
         sql.add('           FROM PIMPMAS                                                                                               ');
         sql.add('          WHERE EMPNO ='''+copy(p_empno,1,4)+''') V1                                                                  ');
         sql.add('    ON (P.YEARLY_YY = V1.YEARLY_YY AND P.EMPNO = V1.EMPNO)                                                            ');
         sql.add('WHEN MATCHED THEN UPDATE SET                                                                                          ');
         sql.add('                        P.KORNAME         = V1.KORNAME,                                                               ');
         sql.add('                        P.TOT_YEARLY_CNT  = V1.TOT_YEARLY_CNT,                                                        ');
         sql.add('                        P.PRE_USED_CNT    = V1.PRE_USED_CNT,                                                          ');
         sql.add('                        P.NEXT_YEARLY_CNT = V1.NEXT_YEARLY_CNT,                                                       ');
         sql.add('                        P.YEARLY_CNT      = V1.YEARLY_CNT,                                                            ');
         sql.add('                        P.YEARLYPLAN_CNT  = V1.YEARLYPLAN_CNT,                                                        ');
         sql.add('                        P.WRITEID         = V1.WRITEID,                                                               ');
         sql.add('                        P.WRITETIME       = V1.WRITETIME                                                              ');
         sql.add('WHEN NOT MATCHED THEN INSERT( P.YEARLY_YY, P.EMPNO, P.KORNAME, P.TOT_YEARLY_CNT, P.PRE_USED_CNT, P.NEXT_YEARLY_CNT, P.YEARLY_CNT, P.YEARLYPLAN_CNT, P.WRITEID, P.WRITETIME)');
         sql.add('                      VALUES(V1.YEARLY_YY,V1.EMPNO,V1.KORNAME,V1.TOT_YEARLY_CNT,V1.PRE_USED_CNT,V1.NEXT_YEARLY_CNT,V1.YEARLY_CNT,V1.YEARLYPLAN_CNT,V1.WRITEID,V1.WRITETIME)');

         ExecSQL;
    end;

    result := true;
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt : real;
    iPos : Integer;
begin
    if(trim(E_TOT_YEARLY_CNT.text)='')  then E_TOT_YEARLY_CNT.text  := '0';
    if(trim(E_PRE_USED_CNT.text)='')    then E_PRE_USED_CNT.text    := '0';
    if(trim(E_NEXT_YEARLY_CNT.text)='') then E_NEXT_YEARLY_CNT.text := '0';

    if(trim(E_YEARLY_CNT.text)='')      then E_YEARLY_CNT.text      := '0';
    if(trim(E_YEARLYPLAN_CNT.text)='')  then E_YEARLYPLAN_CNT.text  := '0';
    if(trim(E_USED_CNT.text)='')        then E_USED_CNT.text        := '0';

    if not(Check_Valid_Year) then
    begin
        MessageDlg('근태마감된 년도는 수정할 수 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(trim(GSYear) ='') then
    begin
        MessageDlg('기준년도가 존재하지 않습니다.', MtWarning, [mbok], 0);
        ED_year.SetFocus;
        Exit;
    end;

    if(trim(copy(E_empno.text,1,4)) ='') then
    begin
        MessageDlg('선택된 사번이 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;
    {//2017.03.06.hjku.. 익년 연차 사용대상자로 있으므로 해당 로직 삭제.. 김진호M 요청
    if( strtofloat(E_TOT_YEARLY_CNT.text) <=0 ) then
    begin
        MessageDlg('발생연차일수는 0보다 커야 합니다.', MtWarning, [mbok], 0);
        E_TOT_YEARLY_CNT.SetFocus;
        Exit;
    end;


    if( strtofloat(E_TOT_YEARLY_CNT.text) <=strtofloat(E_PRE_USED_CNT.text) ) then
    begin
        MessageDlg('전년도 사용연차일수가 당해년도 발생연차일수보다 클 수 없습니다.', MtWarning, [mbok], 0);
        E_PRE_USED_CNT.SetFocus;
        Exit;
    end;}

    E_YEARLY_CNT.text := floattostr(strtofloat(E_TOT_YEARLY_CNT.text)
                                   -strtofloat(E_PRE_USED_CNT.text)
                                   +strtofloat(E_NEXT_YEARLY_CNT.text));

    frdate := GSYear + '0101';
    todate := GSYear + '1231';

    used_cnt := PL_Get_Duty_Cnt(copy(E_empno.text,1,4),frdate, todate,'1');

    if(used_cnt > 0) and( used_cnt > strtofloat(E_YEARLY_CNT.text)) then
    begin
        MessageDlg('사용가능연차는 사용연차보다 작을 수 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(strtofloat(E_YEARLYPLAN_CNT.text) > 0) and( strtofloat(E_YEARLY_CNT.text) < strtofloat(E_YEARLYPLAN_CNT.text)) then
    begin
        MessageDlg('연차사용목표가 연차일수보다 클 수 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    //showmessage(FloatToStr(StrToFloat(E_NEXT_YEARLY_CNT.Text)/0.5));

    // 익년 선사용일수 0.5 입력가능하게 0.5 배수 체크 - 2017.12.26 박명언M 요청 SangMoon Lee
    iPos := Pos( '.',FloatToStr(StrToFloat(E_NEXT_YEARLY_CNT.Text)/0.5) );

    if( iPos <> 0 ) then
    begin
        MessageDlg('익년 선사용일수는 0.5의 배수여야 합니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    if MessageDlg('저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    p_empno            := copy(e_empno.text,1,4);
    p_tot_yearly_cnt   := e_tot_yearly_cnt.text;
    p_pre_used_cnt     := e_pre_used_cnt.text;
    p_next_yearly_cnt  := e_next_yearly_cnt.text;    
    p_yearly_cnt       := e_yearly_cnt.text;
    p_yearlyplan_cnt   := e_yearlyplan_cnt.text;

    if not save_PKYEARLT then  MessageDlg('저장 오류!!!', MtWarning, [mbok], 0);


    Retrieve;

end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TMainForm.bt_findClick(Sender: TObject);
begin
    P_Help.Caption := '';
    Retrieve;
end;

procedure TMainForm.BT_batchClick(Sender: TObject);
begin
  FM_Batch := TFM_Batch.Create(Self);
  try
       FM_Batch.ShowModal;
  finally
       FM_Batch.Free;
  end;
end;

procedure TMainForm.ED_yearChange(Sender: TObject);
begin
    //2015.01.20.hjku.. 여러해 지원해 주기 위해 추가.. 이명노M 요청..
    GSYear := ED_year.KeyItems[ED_year.ItemIndex];

    if(trim(copy(E_empno.text,1,4))<>'') then
       Retrieve;

end;

procedure TMainForm.BT_deleteClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt : real;
begin
    if(trim(E_YEARLY_CNT.text)='')     then E_YEARLY_CNT.text     := '0';
    if(trim(E_YEARLYPLAN_CNT.text)='') then E_YEARLYPLAN_CNT.text := '0';
    if(trim(E_USED_CNT.text)='')       then E_USED_CNT.text       := '0';

    if not(Check_Valid_Year) then
    begin
        MessageDlg('근태마감된 년도는 삭제할 수 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    if(trim(GSYear) ='') then
    begin
        MessageDlg('기준년도가 존재하지 않습니다.', MtWarning, [mbok], 0);
        ED_year.SetFocus;
        Exit;
    end;

    if(trim(copy(E_empno.text,1,4)) ='') then
    begin
        MessageDlg('선택된 사번이 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    frdate := GSYear + '0101';
    todate := GSYear + '1231';

    used_cnt := PL_Get_Duty_Cnt(copy(E_empno.text,1,4),frdate, todate,'1');

    if( used_cnt > 0) then
    begin
        MessageDlg('사용한 연차가 존재하여 삭제할 수 없습니다.', MtWarning, [mbok], 0);
        Exit;
    end;

    if MessageDlg('삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    //2015.01.12.hjku.. 삭제하기 전에 전체 로그 남김 추가..
    if not(Insert_PKYEARLTLOG('D')) then System.exit;

    with tmp_oraqry do
    begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM  PKYEARLT                             ');
        Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''               ');
        Sql.Add('   AND Empno   = '''+copy(E_empno.text,1,4)+'''   ');

         //memo1.text := sql.text;

         ExecSQL;
    end;
    P_Help.Caption := '삭제되었습니다.';

    Retrieve;
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
        sql.add('       ''PKA4050A'' PIPROGID,                               ');
        sql.add('       A.* FROM PKYEARLT A                                  ');
        Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''                         ');
        Sql.Add('   AND Empno   = '''+copy(p_empno,1,4)+'''                  ');
        EXECSQL;
     end;

    Insert_PKYEARLTLOG := true;
end;

procedure TMainForm.BB_ExcelClick(Sender: TObject);
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

  XArr := VarArrayCreate([1, 12], VarVariant);
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
  XL.WorkSheets[1].Name := '연차등록 명단';  //시트명 부여
  XL.Range['A1:L2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := GSYear+'년 연차등록내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사원번호'        ;
  XArr[ 2]  := '사원성명'        ;
  XArr[ 3]  := '부서코드'        ;
  XArr[ 4]  := '부서명'          ;
  XArr[ 5]  := '당년 발생연차일수'      ;
  XArr[ 6]  := '전년 사용연차일수'      ;
  XArr[ 7]  := '익년 선사용연차일수'    ;
  XArr[ 8]  := '당년 사용가능 연차일수' ;
  XArr[ 9]  := '연차사용목표'    ;
  XArr[10]  := '연차사용일수'    ;
  XArr[11]  := '고지완료여부'    ;
  XArr[12]  := '사용시기완료여부';

  XL.Range['A3' , 'L3'].Value := XArr;
  k := 3;
  for i := 1 to 12 do
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
     XArr[ 3]  := OraQuery.FieldByName('DEPTCODE').AsString;
     XArr[ 4]  := OraQuery.FieldByName('DEPTNAME').AsString;
     XArr[ 5]  := OraQuery.FieldbyName('TOT_YEARLY_CNT').AsString;
     XArr[ 6]  := OraQuery.FieldbyName('PRE_USED_CNT').AsString;
     XArr[ 7]  := OraQuery.FieldbyName('NEXT_YEARLY_CNT').AsString;
     XArr[ 8]  := OraQuery.FieldbyName('YEARLY_CNT').AsString;
     XArr[ 9]  := OraQuery.FieldbyName('YEARLYPLAN_CNT').AsString;
     XArr[10]  := OraQuery.FieldByName('used_cnt').AsString;
     XArr[11]  := OraQuery.FieldByName('NOTICE_YN').AsString;
     XArr[12]  := OraQuery.FieldByName('ASSIGN_YN').AsString;

     XL.Range['A' + IntToStr(k+1), 'L' + IntToStr(k+1)].Value := XArr;
     inc(k);
     OraQuery.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'L' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'L' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'L' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'L' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'L' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'L' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'L' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
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
  BT_delete.Enabled  := false;
end;

procedure TMainForm.E_PRE_USED_CNTKeyPress(Sender: TObject; var Key: Char);
var
  iKey : Integer;
  iPos : Integer;
  iLen : integer;
  iSel : integer;
  iAfterPointDigit :integer;
  iBeforePointDigit :integer;
  sText : string;
begin
    sText := E_PRE_USED_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_PRE_USED_CNT.SelStart;
    iAfterPointDigit := 1;
    iBeforePointDigit := 3;

    if iKey = $08 then exit;

    if not(iKey in [$2E, $30..$39]) then begin Key := #0; exit; end;

    iPos :=  Pos('.', sText);

    if (iPos <> 0) and (iKey = $2E) then begin Key := #0; exit;  end

    else if (iPos = 0) and (iKey = $2E) and (iLen = 0) then
      begin Key := #0; exit; end;

    if (iPos > 0 ) then
    begin
      if ((iLen - iPos - 1) > (iBeforePointDigit - 1)) then
        begin Key := #0; exit; end;
    end
    else
    begin
      if (iLen > iBeforePointDigit - 1) and (iKey <> $2E) then
        begin Key := #0; exit; end;
    end;

    if (iPos > 0 ) and ((iPos + iAfterPointDigit - 1) < iLen) then
      if iSel > iPos then begin Key := #0; exit; end;
end;

procedure TMainForm.E_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
var
  iKey : Integer;
  iPos : Integer;
  iLen : integer;
  iSel : integer;
  iAfterPointDigit :integer;
  iBeforePointDigit :integer;
  sText : string;
begin
    sText := E_YEARLY_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_YEARLY_CNT.SelStart;
    iAfterPointDigit := 1;
    iBeforePointDigit := 3;

    if iKey = $08 then exit;

    if not(iKey in [$2E, $30..$39]) then begin Key := #0; exit; end;

    iPos :=  Pos('.', sText);

    if (iPos <> 0) and (iKey = $2E) then begin Key := #0; exit;  end

    else if (iPos = 0) and (iKey = $2E) and (iLen = 0) then
      begin Key := #0; exit; end;

    if (iPos > 0 ) then
    begin
      if ((iLen - iPos - 1) > (iBeforePointDigit - 1)) then
        begin Key := #0; exit; end;
    end
    else
    begin
      if (iLen > iBeforePointDigit - 1) and (iKey <> $2E) then
        begin Key := #0; exit; end;
    end;

    if (iPos > 0 ) and ((iPos + iAfterPointDigit - 1) < iLen) then
      if iSel > iPos then begin Key := #0; exit; end;

end;

procedure TMainForm.E_NEXT_YEARLY_CNTKeyPress(Sender: TObject; var Key: Char);
var
  iKey : Integer;
  iPos : Integer;
  iLen : integer;
  iSel : integer;
  iAfterPointDigit :integer;
  iBeforePointDigit :integer;
  sText : string;
begin
    sText := E_NEXT_YEARLY_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_NEXT_YEARLY_CNT.SelStart;
    iAfterPointDigit := 1;
    iBeforePointDigit := 3;

    if iKey = $08 then exit;

    if not(iKey in [$2E, $30..$39]) then begin Key := #0; exit; end;

    iPos :=  Pos('.', sText);

    if (iPos <> 0) and (iKey = $2E) then begin Key := #0; exit;  end

    else if (iPos = 0) and (iKey = $2E) and (iLen = 0) then
      begin Key := #0; exit; end;

    if (iPos > 0 ) then
    begin
      if ((iLen - iPos - 1) > (iBeforePointDigit - 1)) then
        begin Key := #0; exit; end;
    end
    else
    begin
      if (iLen > iBeforePointDigit - 1) and (iKey <> $2E) then
        begin Key := #0; exit; end;
    end;

    if (iPos > 0 ) and ((iPos + iAfterPointDigit - 1) < iLen) then
      if iSel > iPos then begin Key := #0; exit; end;
end;

end.


