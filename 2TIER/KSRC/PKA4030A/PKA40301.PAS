unit PKA40301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids, Fempno,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func, KeyEmpno,
  KeyEmpnoY, ImgList, Pass, OraSmart, OnSkinBtn, OnEditBtnCtrl, KeyCode, Comobj,
  OnEditCombo, OnEditStdCtrl, OnEditBaseCtrl, OnEditNumCtl, OnPopupEdit,
  OnGrDBGrid, OnScheme, OnPersonEdit, Formmon1, OnRadioBtn,
  OnTmaxPersonEdit, OnFocusButton, OnStringUtils;
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
    bt_find: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_exit: TOnFocusButton;
    S_YEARLY_YY: TOnComboEdit;
    S_EMPNO: TOnPersonPopupEdit;
    BT_delete: TOnFocusButton;
    e_dukind: TOnWinPopupEdit;
    e_empno: TOnPersonPopupEdit;
    BT_input: TOnFocusButton;
    s_deptcode: TOnWinPopupEdit;
    e_used_cnt: TOnEdit;
    s_dukind: TOnWinPopupEdit;
    e_special_cnt: TOnNumberEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure e_special_cntKeyPress(Sender: TObject; var Key: Char);
    procedure E_YEARLYPLAN_CNTKeyPress(Sender: TObject; var Key: Char);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure bt_findClick(Sender: TObject);
    procedure S_YEARLY_YYChange(Sender: TObject);
    procedure e_empno1KeyPress(Sender: TObject; var Key: Char);
    procedure S_EMPNOChange(Sender: TObject);
    procedure BT_deleteClick(Sender: TObject);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure BT_inputClick(Sender: TObject);
    procedure S_EMPNOKeyPress(Sender: TObject; var Key: Char);
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
    GSYear        : String[4];     //기준년도
    procedure clear_fields;
    procedure Retrieve;
    function  PL_Get_Special_Used_Cnt(empno, fromdate, todate, flag : String) : real;
    function  PL_Get_Special_Max_Cnt : real;    
    function  Check_Valid_Year : Boolean;    
//    procedure delete_record;
//    procedure insert_record;
//    procedure update_record;
    { Public declarations }
  end;

var
  MainForm    : TMainForm;
  WorkMode    : Integer;


implementation

uses PKA40302, PKA40304;
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
    S_YEARLY_YY.Items.Clear;
    S_YEARLY_YY.KeyItems.Clear;
    S_YEARLY_YY.Items.Add(IntToStr(FL_IDate-1)+' 년');
    S_YEARLY_YY.Items.Add(FL_Date+' 년');
    S_YEARLY_YY.Items.Add(IntToStr(FL_IDate+1)+' 년');
    S_YEARLY_YY.KeyItems.Add(IntToStr(FL_IDate-1));
    S_YEARLY_YY.KeyItems.Add(FL_Date);
    S_YEARLY_YY.KeyItems.Add(IntToStr(FL_IDate+1));
    S_YEARLY_YY.ItemIndex := 1;

    //S_EMPNO.Text     := Pempno + '-' + Pkorname;


    Retrieve;
end;

procedure TMainForm.clear_fields;
begin
  e_empno.Text             := '';
  e_dukind.Text            := '51 - 특휴';
  e_special_cnt.Text       := '';
  e_used_cnt.Text          := '';

  e_empno.Enabled          := false;
  e_dukind.Enabled         := false;
  e_special_cnt.Enabled    := true;
  e_used_cnt.Enabled       := false;

  BT_delete.Enabled        := true;

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
    Sql.Add('SELECT B.EMPNO,                                                                                                   ');
    Sql.Add('       B.KORNAME,                                                                                                 ');
    Sql.Add('       B.DEPTCODE,                                                                                                ');
    Sql.Add('       c.DEPTNAME,                                                                                                ');
    Sql.Add('       A.DUKIND,                                                                                                  ');
    Sql.Add('       (select codename from pyccode where codeid =''Y210'' and codeno = A.DUKIND) DUNAME,                        ');
    Sql.Add('       A.SPECIAL_CNT,                                                                                             ');
    Sql.Add('       hper.DUTYUTIL.GET_DUTY_CNT(a.EMPNO,a.yearly_yy||''0101'',a.yearly_yy||''1231'',''4'',A.DUKIND) USED_CNT    ');
    Sql.Add('  FROM PKHDUSPECIAL A, PIMPMAS B, pycdept c                                                                       ');
    Sql.Add(' WHERE A.YEARLY_YY = '''+GSYear+'''                                                                               ');
    Sql.Add('   AND A.EMPNO     = B.EMPNO                                                                                      ');
    Sql.Add('   AND b.ORGNUM    = c.ORGNUM                                                                                     ');
    Sql.Add('   AND b.jobdept   = c.DEPTCODE                                                                                   ');

    if(Trim(ParseString(s_dukind.text,'-',1))<>'')then
    begin
      SQL.Add('   and a.dukind   = '''+Trim(ParseString(s_dukind.text,'-',1))+'''                            ');
    end;

    if(Trim(ParseString(s_deptcode.text,'-',1))<>'')then
    begin
      SQL.Add('   and b.jobdept = '''+Trim(ParseString(s_deptcode.text,'-',1))+'''                           ');
    end;

    if(Trim(ParseString(S_EMPNO.text,'-',1))<>'')then
    begin
      SQL.Add('   and a.empno    = '''+Trim(ParseString(S_EMPNO.text,'-',1))+'''                             ');
    end;

    Sql.Add('  ORDER BY a.EMPNO                                         ');

    //memo1.text := sql.text;

    Open;

    fieldbyname('EMPNO'  ).Alignment := taCenter;
    fieldbyname('KORNAME').Alignment := taCenter;
    fieldbyname('DUKIND' ).Alignment := taCenter;
    fieldbyname('DUNAME' ).Alignment := taCenter;
  end;
end;


procedure TMainForm.e_special_cntKeyPress(Sender: TObject; var Key: Char);
var
  iKey : Integer;
  iPos : Integer;
  iLen : integer;
  iSel : integer;
  iAfterPointDigit :integer;
  iBeforePointDigit :integer;
  sText : string;
begin
    sText := E_SPECIAL_CNT.text;
    iKey := ord(Key);
    iLen := Length(trim(sText));
    iSel := E_SPECIAL_CNT.SelStart;
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
{    sText := E_YEARLYPLAN_CNT.text;
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
}
end;

function TMainForm.PL_Get_Special_Used_Cnt(empno, fromdate, todate, flag : String) : real;
begin
    result := 0.0;

    with tmp_oraqry do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select nvl(hper.DUTYUTIL.GET_DUTY_CNT('''+empno+''','''+fromdate+''','''+todate+''','''+flag+''','''+Trim(ParseString(e_dukind.text,'-',1))+'''),0) used_cnt from dual  ');

        //memo2.text := sql.text;

        Open;

        if(RecordCount > 0) then
             result := FieldByName('used_cnt').AsFloat
        else result := 0.0;
    end;

end;


function TMainForm.PL_Get_Special_Max_Cnt : real;
begin
    result := 0.0;

    with tmp_oraqry do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT maxcnt1 FROM PKCDUCOD');
        SQL.Add(' WHERE DUKIND='''+Trim(ParseString(e_dukind.text,'-',1))+'''');

        //memo2.text := sql.text;

        Open;

        if(RecordCount > 0) then
             result := FieldByName('maxcnt1').AsFloat
        else result := 0.0;
    end;

end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  clear_fields;
  
  with OraQuery do
  begin
      E_EMPNO.text             := FieldByName('EMPNO').AsString + ' - ' +
                                  FieldByName('KORNAME').AsString;
      E_DUKIND.text            := FieldByName('DUKIND').AsString + ' - ' +
                                  FieldByName('DUNAME').AsString;
      e_special_cnt.text       := FieldByName('SPECIAL_CNT').AsString;
      e_used_cnt.text          := FieldByName('USED_CNT').AsString;
  end;

  if(E_SPECIAL_CNT.text='')     then E_SPECIAL_CNT.text     := '0';
  if(e_used_cnt.text='')        then e_used_cnt.text     := '0';

  e_empno.Enabled       := false;
  e_dukind.Enabled      := false;
  e_special_cnt.Enabled := true;
  e_used_cnt.Enabled    := false;
end;

procedure TMainForm.BT_exitClick(Sender: TObject);
begin
    if MessageBox(handle,'종료 하시겠습니까?','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt, max_cnt : real;
begin
  if(trim(E_SPECIAL_CNT.text)='')     then E_SPECIAL_CNT.text     := '0';

  if not(Check_Valid_Year) then
  begin
    MessageDlg('근태마감된 년도는 수정할 수 없습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  if(trim(GSYear) ='') then
  begin
    MessageDlg('기준년도가 존재하지 않습니다.', MtWarning, [mbok], 0);
    S_YEARLY_YY.SetFocus;
    Exit;
  end;

  if(Trim(ParseString(e_empno.text,'-',1)) ='') then
  begin
    MessageDlg('선택된 사번이 없습니다.', MtWarning, [mbok], 0);
    S_EMPNO.SetFocus;
    Exit;
  end;

  if(Trim(ParseString(e_dukind.text,'-',1)) ='') then
  begin
    MessageDlg('선택된 근태코드가 없습니다.', MtWarning, [mbok], 0);
    e_dukind.SetFocus;
    Exit;
  end;

  if( strtofloat(E_SPECIAL_CNT.text) < 0 ) then
  begin
    MessageDlg('발생특휴일수는 0보다 크거나 같아야 합니다.', MtWarning, [mbok], 0);
    Exit;
  end; 

  frdate := GSYear + '0101';
  todate := GSYear + '1231';

  used_cnt := PL_Get_Special_Used_Cnt(Trim(ParseString(e_empno.text,'-',1)),frdate, todate,'4');

  if( used_cnt > strtofloat(E_SPECIAL_CNT.text)) then
  begin
      MessageDlg('발생 특휴일수('+E_SPECIAL_CNT.text+')는 사용한 특휴일수('+floattostr(used_cnt)+')보다 작을 수 없습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  max_cnt := PL_Get_Special_Max_Cnt;

  if( max_cnt < strtofloat(E_SPECIAL_CNT.text)) then
  begin
      MessageDlg('발생 특휴일수('+E_SPECIAL_CNT.text+')는 총 특휴일수('+floattostr(max_cnt)+')를 초과할 수 없습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  if MessageDlg('저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

  with tmp_oraqry do
  begin
       Close;
       Sql.Clear;
       sql.add('MERGE INTO PKHDUSPECIAL P                                                                             ');
       sql.add('  USING (SELECT EMPNO,                                                                                ');
       sql.add('                KORNAME,                                                                              ');
       sql.add('                ''' + GSYear + '''         YEARLY_YY,                                                 ');
       sql.add('                ''' + Trim(ParseString(e_dukind.text,'-',1))+''' DUKIND,                              ');
       sql.add('                NVL('''+ e_special_cnt.text +''',0)     SPECIAL_CNT,                                  ');
       sql.add('                ''' + Pempno + ''' WRITEID,                                                           ');
       sql.add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24miss'') WRITETIME                                       ');
       sql.add('           FROM PIMPMAS                                                                               ');
       sql.add('          WHERE EMPNO ='''+Trim(ParseString(e_empno.text,'-',1))+''') V1                              ');
       sql.add('    ON (P.YEARLY_YY = V1.YEARLY_YY AND P.EMPNO = V1.EMPNO AND P.DUKIND = V1.DUKIND)                   ');
       sql.add('WHEN MATCHED THEN UPDATE SET                                                                          ');
       sql.add('                        P.SPECIAL_CNT   = V1.SPECIAL_CNT,                                             ');
       sql.add('                        P.WRITEID       = V1.WRITEID,                                                 ');
       sql.add('                        P.WRITETIME     = V1.WRITETIME                                                ');
       sql.add('WHEN NOT MATCHED THEN INSERT(P.YEARLY_YY,  P.EMPNO, P.DUKIND, P.SPECIAL_CNT, P.WRITEID, P.WRITETIME)  ');
       sql.add('                      VALUES(V1.YEARLY_YY,V1.EMPNO,V1.DUKIND,V1.SPECIAL_CNT,V1.WRITEID,V1.WRITETIME)  ');
       //memo2.text := sql.text;

       ExecSQL;
  end;

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

procedure TMainForm.S_YEARLY_YYChange(Sender: TObject);
begin
  GSYear := S_YEARLY_YY.KeyItems[S_YEARLY_YY.ItemIndex];

  Retrieve;
end;

procedure TMainForm.e_empno1KeyPress(Sender: TObject; var Key: Char);
begin
//  S_EMPNO.Param_deptcode := E_deptCode.Text;
    if Key = Chr(13) then
    begin
        Fm_Emp.Edit          := TOnWinPopupEdit(Sender);
        Fm_Emp.E_Search.Text := S_EMPNO.text;
        Fm_Emp.SqlOpen;
        TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;

        Retrieve;
    end;
end;

procedure TMainForm.S_EMPNOChange(Sender: TObject);
begin
    if(length(S_EMPNO.text)>=4) then Retrieve;
end;

procedure TMainForm.BT_deleteClick(Sender: TObject);
var
    frdate, todate : string;
    used_cnt : real;
begin
  if(trim(E_SPECIAL_CNT.text)='')     then E_SPECIAL_CNT.text     := '0';

  if not(Check_Valid_Year) then
  begin
      MessageDlg('근태마감된 년도는 삭제할 수 없습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  if(trim(GSYear) ='') then
  begin
      MessageDlg('기준년도가 존재하지 않습니다.', MtWarning, [mbok], 0);
      S_YEARLY_YY.SetFocus;
      Exit;
  end;

  if(Trim(ParseString(e_empno.text,'-',1)) ='') then
  begin
      MessageDlg('선택된 사번이 없습니다.', MtWarning, [mbok], 0);
      e_empno.SetFocus;
      Exit;
  end;

  frdate := GSYear + '0101';
  todate := GSYear + '1231';

  used_cnt := PL_Get_Special_Used_Cnt(Trim(ParseString(e_empno.text,'-',1)),frdate, todate,'4');

  if( used_cnt > 0) then
  begin
      MessageDlg('사용한 특휴가 존재하여 삭제할 수 없습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  if MessageDlg('삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

  with tmp_oraqry do
  begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM  PKHDUSPECIAL                                        ');
      Sql.Add(' WHERE YEARLY_YY = '''+ GSYear +'''                              ');
      Sql.Add('   AND Empno   = '''+Trim(ParseString(e_empno.text,'-',1))+'''   ');
      Sql.Add('   AND DUKIND  = '''+Trim(ParseString(e_dukind.text,'-',1))+'''  ');

       //memo2.text := sql.text;

       ExecSQL;
  end;
  P_Help.Caption := '삭제되었습니다.';

  Retrieve;
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

procedure TMainForm.s_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
    s_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;

    Retrieve;
  end;
end;

procedure TMainForm.s_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Retrieve;
  end;
end;

procedure TMainForm.BT_inputClick(Sender: TObject);
begin
  clear_fields;

  e_empno.Enabled       := true;
  BT_delete.Enabled     := false;

end;

procedure TMainForm.S_EMPNOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then  System.Exit;
  Key := #0;
  Retrieve;
end;

end.


