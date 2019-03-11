unit UDiaryForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, PeJeonBtnDateEdit, MemDS, DBAccess, Func, Grids,
  OnPimcalendar, ImgList, Buttons;
  
type
  TDiaryForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel_Main: TPanel;
    Ed_MemoDate: TOnDateEdit;
    Bt_Srh: TOnFocusButton;
    TCDS: TTMaxDataSet;
    Ed_empno: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    L_Payraname: TOnShapeLabel;
    L_jobdept: TOnShapeLabel;
    L_DeptName: TOnShapeLabel;
    ED_Comment: TOnMemo;
    Bt_insert: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    Edit1: TEdit;
    TDml: TTMaxDataSet;
    Panel2: TPanel;
    PA_MenuHeader: TPanel;
    SB_lun: TOnFocusButton;
    SB_month: TOnFocusButton;
    SB_week: TOnFocusButton;
    SB_inc: TOnFocusButton;
    SB_dec: TOnFocusButton;
    IMG_il: TImageList;
    bt_Calen: TSpeedButton;
    Shape1: TShape;
    TDS1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Bt_Search: TOnFocusButton;
    Button1: TButton;
    TCSel: TTMaxDataSet;
    OnFocusButton1: TOnFocusButton;
    ED_ValText: TOnMemo;
    ED_ComText: TOnMemo;
    ED_PerText: TOnMemo;
    Tds_il: TTMaxDataSet;
    Bt_print: TOnFocusButton;
    Label1: TLabel;
    PI_Cal: TOnPimcalendar;
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure Ed_MemoDateDateValidate(Sender: TObject; const AText: String;
      var ADate: TDateTime; var AMessage: String; var AError: Boolean);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_MemoDateDateChange(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure SB_lunClick(Sender: TObject);
    procedure SB_monthClick(Sender: TObject);
    procedure SB_weekClick(Sender: TObject);
    procedure SB_incClick(Sender: TObject);
    procedure SB_decClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bt_CalenClick(Sender: TObject);
    procedure PI_CalDblClick(Sender: TObject);
    procedure Bt_SearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure Bt_printClick(Sender: TObject);
    procedure ED_ValTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_ComTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_PerTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure PG_LoadPlan;
  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Writeemp, Wempno, WKorname,AEMPNO : String;
    Pempno, Pkorname, Password, Ppermission, Pjobgun, Ppayra, Ppayrayn: String;
    Ppaycl : String;
    Porgnum, Pdeptcode, PSysdate: string;
    PfrBasedate, PtoBasedate: String;
    Lgubun      : Integer;
    gubun       : Integer;
    check       : Integer;
    EempFind    : Boolean;
    pOrgDeptList: String;
    FL_Start   : Boolean;
    FL_Ins     : Boolean;
    FL_SchItem : TOnSchItem;
    function fnGetMainDataSet: Boolean;
    function TCsel_gfd(p_loc: Integer): String;
    function fnSetVariable(mGubun: Integer): Boolean;
    function fnOrgDeptList(mEmpno: String): String;
    procedure ComponentEnable(BValue:Boolean);
    procedure ComponentClear;
  end;

var
  DiaryForm: TDiaryForm;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;

implementation

uses UEmpForm, UHelp, UPrintForm;

{$R *.DFM}

function TDiaryForm.TCsel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('CNT').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

function TDiaryForm.fnSetVariable(mGubun: Integer): Boolean;
var
  sTemp: String;
begin
  Result := False;

  case mGubun of
    0 :
        sTemp:= Format(
          'SELECT  ' +
          ' nvl(  korname  ,'' '') || '';'' || '+
          ' nvl(  jobpayra    ,'' '') || '';'' || '+
          ' nvl(  jobgun   ,'' '') || '';'' || '+
          ' nvl(  orgnum   ,'' '') || '';'' || '+
          ' nvl(  deptcode ,'' '') || '';'' || '+
          ' nvl(  jobpayrayn  ,'' '') || '';'' || '+
          ' nvl(  paycl    ,'' '')             '+                                    //위 명단중 0695 제외 M사번 퇴임/0143,0491 일반팀장 겸직은 0695만
          ' FROM pimpmas           ' +
          ' WHERE empno = ''%s''   ' , [Aempno]);
   1:
       sTemp:= Format(
          'SELECT  ' +
          ' nvl(  value1   ,'' '') || '';'' || '+
          ' nvl(  value2   ,'' '')             '+
          ' FROM pishrvari         ' +
          ' WHERE gubun = ''%s'' AND sgubun = ''%s'' ',['00','0004']); // 등록일
   2:
       sTemp:=
          'SELECT nvl(  to_char(sysdate,''YYYYMMDDHH24MISSD''),'' '') FROM dual';

//==============================================================================//
    else
     System.Exit;
  end;

  with TCsel do
  begin
       Close;
       ClearFieldInfo;
       AddField('CNT', ftString, 300);
       Sql.Clear;
       Sql.Text := sTemp;
       ServiceName := 'PIT1030A_SEL1';
       Open;
  end;
  case mGubun of
    0 : begin
          Pkorname  := TCsel_gfd(1);
          Ppayra    := TCsel_gfd(2);
          Pjobgun   := TCsel_gfd(3);
          Porgnum   := TCsel_gfd(4);
          PDeptcode := TCsel_gfd(5);
          Ppayrayn  := TCsel_gfd(6);
          Ppaycl    := TCsel_gfd(7);
       end;
   1 : begin
         PfrBasedate:= TCsel_gfd(1);
         PtoBasedate:= TCsel_gfd(2);
       end;
   2:    pSysdate  := TCsel_gfd(1);
   3:  begin
         pKorName  := TCsel_gfd(1);
        end;
    else
    ;
  end;

  TCsel.Close;
  Result := True;
end;

function TDiaryForm.fnOrgDeptList(mEmpno: String): String;
var
  sOrgDeptList, sSql,ssql1,ssql2: String;
begin
  Result := '';
  sOrgDeptList := '('''+pOrgnum+''','''+pDeptcode+''')'+','; //showmessage(Ppayra);

  sSQL :=    'SELECT NVL(empno        ,'' '') aa_empno,      '+
             '       NVL(korname      ,'' '') aa_korname,    '+
             '       NVL(anfrdate     ,'' '') aa_anfrdate,   '+
             '       NVL(antodate     ,'' '') aa_antodate,   '+
             '       NVL(orgnum       ,'' '') aa_orgnum,     '+
             '       NVL(deptcode     ,'' '') aa_deptcode,   '+
             '       NVL(addeptcode   ,'' '') aa_addeptcode, '+
             '       NVL(adpayra      ,'' '') aa_adpayra     '+
             ' FROM PIHANNO                   '+
      Format(' WHERE EMPNO = ''%s''           ',[mEmpno])+
             '   AND ANUPDYN = ''Y''          '+
             '   AND ADDEPTCODE IS NOT NULL   '+
             '   AND ANTODATE IS NOT NULL     '+
             '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN ANFRDATE AND NVL(ANTODATE,TO_CHAR(SYSDATE,''YYYYMMDD''))   '+
             '   AND ANCODE = ''233''         '+
             ' UNION                          '+
             'SELECT NVL(a_empno      ,'' '') aa_empno,      '+
             '       NVL(a_korname    ,'' '') aa_korname,    '+
             '       NVL(a_anfrdate   ,'' '') aa_anfrdate,   '+
             '       NVL(b_anfrdate   ,'' '') aa_antodate,   '+
             '       NVL(a_orgnum     ,'' '') aa_orgnum,     '+
             '       NVL(a_deptcode   ,'' '') aa_deptcode,   '+
             '       NVL(a_addeptcode ,'' '') aa_addeptcode, '+
             '       NVL(a_adpayra    ,'' '') aa_adpayra     '+
             ' FROM                                                            '+
             '     ( SELECT EMPNO      a_empno,        KORNAME   a_korname,    '+
             '              ANFRDATE   a_anfrdate,     ANTODATE  a_antodate,   '+
             '              ORGNUM     a_orgnum,       DEPTCODE  a_deptcode,   ';
             // 팀장이면 소속부서, 겸직부서 모두 팀장이 아니면 겸직부서만
      {if Ppayra = '2C' then
          ssql := ssql+ '              ORGNUM     a_orgnum,       DEPTCODE  a_deptcode,   '
      else
          ssql := ssql+ '              ORGNUM     a_orgnum,       ''''  a_deptcode,   ';
      }
      ssql := ssql +
             '              ADDEPTCODE a_addeptcode,   ADPAYRA   a_adpayra     '+
             '       FROM PIHANNO                                              '+
      Format('       WHERE EMPNO = ''%s''                                      ',[mEmpno])+
             '        AND ANUPDYN = ''Y''                                      '+
             '        AND ADDEPTCODE IS NOT NULL                               '+
             '        AND ANTODATE IS NULL                                     '+
             '        AND ANCODE = ''233'' ),                                  '+
             '     ( SELECT EMPNO      b_empno,        KORNAME   b_korname,    '+
             '              ANFRDATE   b_anfrdate,     ANTODATE  b_antodate,   '+
             '              ORGNUM     b_orgnum,       DEPTCODE  b_deptcode,   '+
             '              ADDEPTCODE b_addeptcode,   ADPAYRA   b_adpayra     '+
             '      FROM PIHANNO                                               '+
      Format('      WHERE EMPNO = ''%s''                                       ',[mEmpno])+
             '        AND ANUPDYN = ''Y''                                      '+
             '        AND ADDEPTCODE IS NOT NULL                               '+
             '        AND ANTODATE IS NULL                                     '+
             '        AND ANCODE = ''238'' )                                   '+
             ' WHERE a_empno  = b_empno (+)                                    '+
             '   AND a_orgnum = b_orgnum (+) AND a_addeptcode = b_addeptcode (+) '+
             '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN a_anfrdate AND NVL(b_anfrdate,TO_CHAR(SYSDATE,''YYYYMMDD'')) '
             ;


  With TCDS do
    begin
      Close;
      ClearFieldInfo;
      AddField('AA_EMPNO'     , ftString,  4 );
      AddField('AA_KORNAME'   , ftString,  12);
      AddField('AA_ANFRDATE'  , ftString,  8 );
      AddField('AA_ANTODATE'  , ftString,  8 );
      AddField('AA_ORGNUM'    , ftString,  3 );
      AddField('AA_DEPTCODE'  , ftString,  6 );
      AddField('AA_ADDEPTCODE', ftString,  6 );
      AddField('AA_ADPAYRA'   , ftString,  3 );
      Sql.Clear;
      Sql.Text := sSQL; 
      Servicename := 'PIT1030A_SEL3';
      Open;

      while Not EOF do
        begin
          sOrgDeptList := sOrgDeptList +
                       '('''+FieldByName('AA_ORGNUM').AsString+''','''+FieldByName('AA_DEPTCODE').AsString+''')'+',';
          if trim(FieldByName('AA_DEPTCODE').AsString) <> '' then
              sOrgDeptList := sOrgDeptList +
                           '('''+FieldByName('AA_ORGNUM').AsString+''','''+FieldByName('AA_ADDEPTCODE').AsString+''')'+',';
          Next;
        end;
      // 마지막 ","제거
      if (length(sOrgDeptList) > 0) and (sOrgDeptList[length(sOrgDeptList)] = ',') then
          sOrgDeptList[length(sOrgDeptList)] := ' '
      else
          sOrgDeptList := '(''0'',''0'')'; // 의미없는 값
    end;

  Result := sOrgDeptList;
end;

procedure TDiaryForm.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_Emp.empno <> '' then
    begin
      Ed_empno.Text           := Fm_Emp.empno;
      L_korname.ValueCaption  := Fm_Emp.Korname;
      L_Jobdept.Hint          := Fm_Emp.orgnum;
      L_Jobdept.ValueCaption  := Fm_Emp.Deptcode;
      L_deptname.ValueCaption := Fm_Emp.Deptname;
      L_payraname.ValueCaption:= Fm_Emp.Payraname;
      SB_monthClick(Sender);
      Bt_SrhClick(Bt_Srh);
    end;
end;

procedure TDiaryForm.Ed_empnoInitPopup(Sender: TObject);
begin
  Fm_Emp.Edit        := TOnWinPopupEdit(Sender);
  Fm_Emp.OrgDeptList := pOrgDeptList;
  Fm_Emp.empno       := Aempno;
  Fm_Emp.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TDiaryForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Bt_SrhClick(Sender);
      inherited;
      Key := #0;
    end;
end;

procedure TDiaryForm.ExitBtnClick(Sender: TObject);
begin

     Close;
end;

procedure TDiaryForm.Ed_MemoDateDateValidate(Sender: TObject;
  const AText: String; var ADate: TDateTime; var AMessage: String;
  var AError: Boolean);
begin
     Bt_insert.Enabled := False;
end;

function TDiaryForm.fnGetMainDataSet: Boolean;
var
  sSQL,memodate: String;
begin
  Result   := false;

  ed_VALTEXT.Lines.Clear;
  ed_COMTEXT.Lines.Clear;
  ed_PERTEXT.Lines.Clear;

  memodate := copy(Ed_Memodate.text,1,4)+copy(Ed_Memodate.text,6,2)+copy(Ed_Memodate.text,9,2);
  if Ed_Memodate.visible then
  sSQL := 'SELECT MEMODATE,WRITEEMP,                                                 '+
          '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
          '       EMPNO, (select korname from pimpmas where empno = a.empno) KORNAME '+
          '  FROM PEHDIARY a                                                         '+
          ' WHERE empno    = '''+ed_empno.Text  +'''                                 '+
          '   and orgnum   = '''+L_jobdept.Hint +'''                                 '+
          '   and jobdept  = '''+L_jobdept.ValueCaption +'''                         '+
          '   and memodate = '''+Memodate + '''                                      '
  else
  sSQL := 'SELECT MEMODATE,WRITEEMP,                                                 '+
          '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
          '       EMPNO, (select korname from pimpmas where empno = a.empno) KORNAME '+
          '  FROM PEHDIARY a                                                         '+
          ' WHERE empno    = '''+ed_empno.Text  +'''                                 '+
          '   and orgnum   = '''+L_jobdept.Hint +'''                                 '+
          '   and jobdept  = '''+L_jobdept.ValueCaption +'''                         ';

  With TCDS do
  begin
      Close;
      ClearFieldInfo;
      AddField('MEMODATE'     , ftString,  100 );
      AddField('WRITEEMP'     , ftString,  100 );
      AddField('WRITENAME'    , ftString,  100 );
      AddField('EMPNO'        , ftString,  100 );
      AddField('KORNAME'      , ftString,  100 );
      Sql.Clear;
      Sql.Text := sSQL;
      ServiceName := 'HINSA_select';
      Open;
      if RecordCount > 0 then
      begin
         if Ed_Memodate.visible then
         sSQL := 'SELECT EMPNO, MEMODATE, VALTEXT, COMTEXT, PERTEXT  '+
                 '  FROM PEHDIARY a                                  '+
                 ' WHERE empno    = '''+ed_empno.Text  +'''          '+
                 '   and orgnum   = '''+L_jobdept.Hint +'''          '+
                 '   and jobdept  = '''+L_jobdept.ValueCaption +'''  '+
                 '   and memodate = '''+Memodate + '''               '
         else
         sSQL :=  'SELECT EMPNO, MEMODATE, VALTEXT, COMTEXT, PERTEXT '+
                  '  FROM PEHDIARY a                                 '+
                  ' WHERE empno    = '''+ed_empno.Text  +'''         '+
                  '   and orgnum   = '''+L_jobdept.Hint +'''         '+
                  '   and jobdept  = '''+L_jobdept.ValueCaption +''' ';
         with TDS1 do
         begin
             Close;
             ServiceName := 'HINSA_select3';
             ClearFieldInfo;
             AddField('EMPNO'   , ftString, 2000);
             AddField('MEMODATE', ftString, 2000);
             AddField('VALTEXT' , ftString, 2000);
             AddField('COMTEXT' , ftString, 2000);
             AddField('PERTEXT' , ftString, 2000);
             ClearParamInfo;
             SQL.Text := sSQL;
             Open;
         end;
         ed_VALTEXT.Lines.Add(TDS1.FieldByName('VALTEXT').AsString);
         ed_COMTEXT.Lines.Add(TDS1.FieldByName('COMTEXT').AsString);
         ed_PERTEXT.Lines.Add(TDS1.FieldByName('PERTEXT').AsString);
         Writeemp := TCDS.FieldByName('Writeemp').AsString;
         Result := True;
      end;
  end;
end;

procedure TDiaryForm.Bt_SrhClick(Sender: TObject);
begin
   Ed_ValText.Text := '';
   Ed_ComText.Text := '';
   Ed_PerText.Text := '';
   Bt_insert.Visible  := True;
   Bt_Search.Visible  := True;
   ED_ValText.Visible := True;
   ED_ComText.Visible := True;
   ED_PerText.Visible := True;
   panel2.Visible  := False;
   ComponentEnable(True);
   if fnGetMainDataSet then
      gubun := 1
   else
      gubun := 0;
end;

procedure TDiaryForm.Ed_MemoDateDateChange(Sender: TObject);
begin
   Bt_SrhClick(Sender);
   panel2.Visible := false;
end;

procedure TDiaryForm.Bt_insertClick(Sender: TObject);
var
   SQLTEXT  : String;
   memodate : String;
begin
   if L_korname.ValueCaption = '' then
   begin
       MessageDlg('팀원을 먼저 선택하세요.',mtError,[mbOK],0);
       System.Exit;
   end;

   if Lgubun = 0 then
   begin
       MessageDlg('프로그램 담당자는 저장할 수 없습니다.',mtError,[mbOK],0);
       System.Exit;
   end;

   if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
      system.exit;

   memodate := copy(Ed_Memodate.text,1,4)+copy(Ed_Memodate.text,6,2)+copy(Ed_Memodate.text,9,2);
   if gubun = 0 then
   begin
       if (trim(ED_VALTEXT.Text) <> '') or (trim(ED_COMTEXT.Text) <> '') or (trim(ED_PERTEXT.Text) <> '') then
       begin
           SQLText := Format(
                     ' INSERT INTO   PEHDIARY                                                      '+#13+
                     '        (MEMODATE, ORGNUM, JOBDEPT, EMPNO,                                   '+#13+
                     '         VALTEXT, COMTEXT, PERTEXT, WRITEEMP, WRITETIME)                     '+#13+
                     ' VALUES (''%s'',''%s'',''%s'',''%s'',                                        '+#13+
                     '         ''%s'',''%s'',''%s'',''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')) ',
                     [memodate,
                      L_jobdept.Hint,
                      L_jobdept.ValueCaption,
                      Ed_empno.text,
                      ED_VALTEXT.Text,
                      ED_COMTEXT.Text,
                      ED_PERTEXT.Text,
                      wEmpno]);
       end
       else
       begin
           MessageDlg('저장할 내용이 없습니다.',mtError,[mbOK],0);
           System.Exit;
       end;
   end
   else
   if gubun = 1 then
   begin
       if Writeemp = pEmpno then
       begin
           if (trim(ED_VALTEXT.Text) <> '') or (trim(ED_COMTEXT.Text) <> '') or (trim(ED_PERTEXT.Text) <> '') then
              SQLText := Format(
                         'UPDATE PEHDIARY  SET                                      ' +#13+
                         '       VALTEXT  = '''+ED_VALTEXT.Text+''' ,               ' +#13+
                         '       COMTEXT  = '''+ED_COMTEXT.Text+''' ,               ' +#13+
                         '       PERTEXT  = '''+ED_PERTEXT.Text+''' ,               ' +#13+
                         '       writeemp  = ''%s'' ,                               ' +#13+
                         '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                         ' WHERE orgnum    = ''%s''       ' +#13+
                         '   and jobdept   = ''%s''       ' +#13+
                         '   and memodate  = ''%s''       ' +#13+
                         '   and empno     = ''%s''       ' ,
                         [wEmpno,
                          L_jobdept.Hint,
                          L_jobdept.ValueCaption,
                          memodate,
                          Ed_empno.text])
           else
              SQLText := Format(
                         'DELETE FROM PEHDIARY            ' +#13+
                         ' WHERE orgnum    = ''%s''       ' +#13+
                         '   and jobdept   = ''%s''       ' +#13+
                         '   and memodate  = ''%s''       ' +#13+
                         '   and empno     = ''%s''       ' ,
                         [L_jobdept.Hint,
                          L_jobdept.ValueCaption,
                          memodate,
                          Ed_empno.text]);
       end
       else
       begin
            MessageDlg('의견을 등록하신 분이 아니므로 수정 및 삭제할 수 없습니다.',mtError,[mbOK],0);
            Bt_SrhClick(Sender);
            System.Exit;
       end;
   end;

   TDml.Close;
   TDml.Sql.Clear;
   TDml.Sql.Text := SqlText;
   TDml.ServiceName := 'PIT1030A_DML';
   if NOT TDml.Execute then
      MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
   else
   begin
     gbChanged := False;
     PG_LoadPlan;
     Bt_SrhClick(Sender);
     MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
   end;

end;

procedure TDiaryForm.PG_LoadPlan;
var
  i    : Integer;
  S    : TOnSchItem;
  F    : TOnDayItem;
  Kfr  : String;
  Kto  : String;
  FSql : String;
begin
  PI_Cal.DeleteSchedule;

  if (PI_Cal.StartDay = '') or (PI_Cal.LastDay = '') then
    System.Exit;

  Kfr := Copy(PI_Cal.StartDay,1,4)+'/'+Copy(PI_Cal.StartDay,5,2)+'/'+Copy(PI_Cal.StartDay,7,2);
  Kto := Copy(PI_Cal.LastDay,1,4)+'/'+Copy(PI_Cal.LastDay,5,2)+'/'+Copy(PI_Cal.LastDay,7,2);

  with Tds_il do
    begin
      Close;
      ClearFieldInfo;
      AddField('MEMODATE'     , ftString,  100 );
      AddField('WRITEEMP'     , ftString,  100 );
      AddField('WRITENAME'    , ftString,  100 );
      AddField('EMPNO'        , ftString,  100 );
      AddField('jobdept'      , ftString,  100 );
      Sql.Clear;
      FSql := 'SELECT MEMODATE,WRITEEMP,                                                 '+
              '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
              '       EMPNO, jobdept                                                     '+
              '  FROM PEHDIARY a                                                         '+
              ' WHERE empno    = '''+ed_empno.Text  +'''                                 '+
              '   and orgnum   = '''+L_jobdept.Hint +'''                                 '+
              '   and jobdept  = '''+L_jobdept.ValueCaption +'''                         '+
              '   and MEMODATE >= ''%s'' AND MEMODATE <= ''%s''                          ';
      FSql := Format(FSql,[PI_Cal.StartDay, PI_Cal.LastDay]);
      Sql.Text := FSql;
      ServiceName := 'HINSA_select';
      Open;

      while not Eof do
        begin
          F := nil;
          for i := 0 to PI_Cal.DayItems.Count-1 do
            begin
               if (PI_Cal.DayItems[i].Year  = Copy(FieldByName('memodate').AsString,1,4)) and
                  (PI_Cal.DayItems[i].Month = Copy(FieldByName('memodate').AsString,5,2)) and
                  (PI_Cal.DayItems[i].Day   = Copy(FieldByName('memodate').AsString,7,2)) then
                 begin
                   F := PI_Cal.DayItems[i]; // 이미 있음
                   Break;
                 end;
            end;

          if F = nil then
            begin
              F       := PI_Cal.DayItems.Add;
              F.year  := Copy(FieldByName('memodate').AsString,1,4);
              F.month := Copy(FieldByName('memodate').AsString,5,2);
              F.day   := Copy(FieldByName('memodate').AsString,7,2);
              F.Box.ImageList := IMG_il;
            end;

           try
             S         := F.SchItems.Add;
             S.Ins     := True;  // 일정추가/수정 옵션 (True 추가, False 수정)
             S.kind    := '0';
             S.alam         := False;
             S.network      := False;
//             S.sendname     := FieldByName('WRITENAME').AsString;
//             S.content.Text := FieldByName('COMMENTS').AsString;
             S.subject      := FieldByName('WRITENAME').AsString;
           except
             begin
               MessageDlg('현재 동일한 일정이 존재합니다...',mtError,[mbOK],0);
               S.Free;
               Break;
             end;
           end;
          Next;
        end;
         
      Close;
    end;
end;

procedure TDiaryForm.SB_lunClick(Sender: TObject);
begin
  if SB_lun.Caption = '음력 보이기' then
    begin
      SB_lun.Caption    := '음력 숨기기';
      PI_Cal.LunarCheck := True;
    end
  else
    begin
      SB_lun.Caption    := '음력 보이기';
      PI_Cal.LunarCheck := False;
    end;
end;

procedure TDiaryForm.SB_monthClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peMonth;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 육성일지 열람';
  PG_LoadPlan;
end;

procedure TDiaryForm.SB_weekClick(Sender: TObject);
begin
  PI_Cal.ViewKind := peWeek;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 육성일지 열람';
  PG_LoadPlan;
end;

procedure TDiaryForm.SB_incClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
    PI_Cal.NextMonth
  else
    PI_Cal.NextWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 육성일지 열람';
end;

procedure TDiaryForm.SB_decClick(Sender: TObject);
begin
  if PI_Cal.ViewKind = peMonth then
    PI_Cal.PrevMonth
  else
    PI_Cal.PrevWeek;
  PG_LoadPlan;
  PA_MenuHeader.Caption := '  ☆ '+ IntToStr(PI_Cal.Year) + ' 년 ' + IntToStr(PI_Cal.Month) + '월 육성일지 열람';
end;

procedure TDiaryForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  START := True;
  EempFind := True;
  panel2.Height := 425;
  panel2.Top    := 106;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;    
end;

procedure TDiaryForm.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  sTemp : String;
begin
  if FL_Start then
    begin
      FL_Start := False;
      SF_Main.Refresh;

      Pempno   := Hinsa_Param(CmdLine, 1);
      Pkorname := Hinsa_Param(CmdLine, 2);

      Wempno   := Pempno;
      Wkorname := Pkorname;
      Aempno   := Pempno;   //사번기억 SHM

      Button1Click(sender);
    end;
end;

procedure TDiaryForm.Button1Click(Sender: TObject);
begin
      ComponentClear;

      TDS1.Close;
      TDS1.ServiceName := 'HINSA_select';
      TDS1.Sql.Text    := 'SELECT Value1 workemp1, Value2 Workemp2,'+
                          '       Value3 Workemp3, Value4 Workemp4,'+
                          '       Value5 Workemp5                  '+
                          '  from pishrvari                        '+
                          ' where gubun  = ''00''                  '+
                          '   and sgubun = ''0001''                ';
      TDS1.ClearFieldInfo;
      TDS1.AddField('Workemp1' , ftString, 100);
      TDS1.AddField('Workemp2' , ftString, 100);
      TDS1.AddField('Workemp3' , ftString, 100);
      TDS1.AddField('Workemp4' , ftString, 100);
      TDS1.AddField('Workemp5' , ftString, 100);
      TDS1.Open;
      WorkEmp1 := TDS1.FieldByName('workemp1').AsString;
      WorkEmp2 := TDS1.FieldByName('workemp2').AsString;
      WorkEmp3 := TDS1.FieldByName('workemp3').AsString;
      WorkEmp4 := TDS1.FieldByName('workemp4').AsString;
      WorkEmp5 := TDS1.FieldByName('workemp5').AsString;
      if   (Pempno = WorkEmp1)  or (Pempno = WorkEmp2) or
           (Pempno = WorkEmp3)  or (Pempno = WorkEmp4) or
           (Pempno = WorkEmp5)  or (copy(Pempno,1,1) = 'D')   then
      begin
        Aempno   := Edit1.Text;
        edit1.Visible := true;
        Button1.Visible := true;
        Lgubun := 0;                // 박준민 과장 요청(2009.2.27)
      end;


      if fnSetVariable(0) = False then System.Exit;
      if fnSetVariable(1) = False then System.Exit;  // 등록가능 fr~to
      if fnSetVariable(2) = False then System.Exit;  // 현재일

      if   trim(Ppayrayn) = 'Y' then Lgubun := 2 // 부서장
      else                           Lgubun := 1;

      Application.ProcessMessages;


      pOrgDeptList := fnOrgDeptList(Aempno);
      Fm_Emp.empno := Aempno;

      Fm_Emp.SqlOpen;
      Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);

      if Fm_emp.EmpCount < 1 then
      begin
            MessageDlg('육성일지를 작성하실 팀원이 없습니다.'+#13 ,mtError,[mbOK],0);
            Close;
      end;

      Ed_MemoDate.Text        := copy(pSysdate,1,4)+'-'+copy(pSysdate,5,2)+'-'+copy(pSysdate,7,2);
      SB_monthClick(Sender);
      FL_Ins := True;
      check := 0;
      //  Bt_SrhClick(Sender);
//   Ed_empnoInitPopup(Sender);
end;

procedure TDiaryForm.bt_CalenClick(Sender: TObject);
begin
  if Panel2.visible  then
  begin
     Bt_insert.Visible  := True;
     Bt_Search.Visible  := True;
     ED_ValText.Visible := True;
     ED_ComText.Visible := True;
     ED_PerText.Visible := True;
     Panel2.visible     := false;
  end
  else
  begin
     Bt_insert.Visible  := False;
     Bt_Search.Visible  := False;
     ED_ValText.Visible := False;
     ED_ComText.Visible := False;
     ED_PerText.Visible := False;
     Panel2.visible := true;
  end;
end;

procedure TDiaryForm.PI_CalDblClick(Sender: TObject);
begin
    Ed_MemoDate.NoFormatDate := IntToStr(PI_Cal.Year)
                              + FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Month)))
                              + FormatFloat('00',StrToFloat(IntToStr(PI_Cal.Day  )));
    Bt_insert.Visible := True;
    Bt_Search.Visible := True;
    panel2.Visible := false;
    Bt_SrhClick(Sender);
    ED_Valtext.setfocus;
end;

procedure TDiaryForm.ComponentEnable(BValue:Boolean);
begin
    Ed_empno.Enabled    := BValue;
    Ed_MemoDate.Enabled := BValue;
    bt_Calen.Enabled    := BValue;
    Bt_insert.Visible   := BValue;
    ED_VALTEXT.Visible  := BValue;
    ED_COMTEXT.Visible  := BValue;
    ED_PERTEXT.Visible  := BValue;
    if BValue = False then
      ED_Comment.ReadOnly := True
    else
    begin
      ED_Comment.ReadOnly := False;
    end;
end;

procedure TDiaryForm.Bt_SearchClick(Sender: TObject);
var
  sSQL : String;
  i    : integer;
begin
   if L_korname.ValueCaption = '' then
   begin
       MessageDlg('팀원을 먼저 선택하세요.',mtError,[mbOK],0);
       exit;
   end;

   if Check = 0 then
   begin
         ed_COMMENT.Text := '';
         sSQL := 'SELECT MEMODATE,WRITEEMP,                                                '+
                '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
                '       EMPNO, (select korname from pimpmas where empno = a.empno) KORNAME '+
                '  FROM PEHDIARY a                                                         '+
                ' WHERE empno    = '''+ed_empno.Text  +'''                                 '+
                '   and orgnum   = '''+L_jobdept.Hint +'''                                 '+
                '   and jobdept  = '''+L_jobdept.ValueCaption +'''                         '+
                ' Order by memodate                                                        ';
        With TCDS do
        begin
            Close;
            ClearFieldInfo;
            AddField('MEMODATE'     , ftString,  100 );
            AddField('WRITEEMP'     , ftString,  100 );
            AddField('WRITENAME'    , ftString,  100 );
            AddField('EMPNO'        , ftString,  100 );
            AddField('KORNAME'      , ftString,  100 );
            Sql.Clear;
            Sql.Text := sSQL;
            ServiceName := 'HINSA_select';
            Open;
            if RecordCount > 0 then
            begin
               sSQL :=  'SELECT EMPNO, MEMODATE, VALTEXT, COMTEXT, PERTEXT '+
                        '  FROM PEHDIARY a                                 '+
                        ' WHERE empno    = '''+ed_empno.Text  +'''         '+
                        '   and orgnum   = '''+L_jobdept.Hint +'''         '+
                        '   and jobdept  = '''+L_jobdept.ValueCaption +''' '+
                        ' Order by memodate                                ';
               with TDS1 do
               begin
                   Close;
                   ServiceName := 'HINSA_select3';
                   ClearFieldInfo;
                   AddField('EMPNO'   , ftString, 2000);
                   AddField('MEMODATE', ftString, 2000);
                   AddField('VALTEXT' , ftString, 2000);
                   AddField('COMTEXT' , ftString, 2000);
                   AddField('PERTEXT' , ftString, 2000);
                   ClearParamInfo;
                   SQL.Text := sSQL;
                   Open;
               end;
              for i := 0 to  RecordCount-1 do
              begin
                 ed_COMMENT.Lines.Add('['+copy(TCDS.FieldByName('MEMODATE').AsString,1,4)+'-'
                                         +copy(TCDS.FieldByName('MEMODATE').AsString,5,2)+'-'
                                         +copy(TCDS.FieldByName('MEMODATE').AsString,7,2)+' '
                                         +TCDS.FieldByName('WRITEEMP').AsString+'-'
                                         +TCDS.FieldByName('WRITENAME').AsString+']');
                 if TDS1.FieldByName('VALTEXT').AsString <> '' then
                    ed_COMMENT.Lines.Add('⊙ Values :'+TDS1.FieldByName('VALTEXT').AsString);
                 if TDS1.FieldByName('COMTEXT').AsString <> '' then
                    ed_COMMENT.Lines.Add('⊙ 역  량 :'+TDS1.FieldByName('COMTEXT').AsString);
                 if TDS1.FieldByName('PERTEXT').AsString <> '' then
                    ed_COMMENT.Lines.Add('⊙ 업  적 :'+TDS1.FieldByName('PERTEXT').AsString);
                 ed_COMMENT.Lines.Add(' ');
                 TDS1.next;
                 TCDS.next;
              end;
            end;
        end;

        ComponentEnable(False);
        Bt_Search.Caption := '열람취소';
        check := 1;
   end
   else
   begin
        ComponentEnable(True);
        Bt_SrhClick(Sender);
        Bt_Search.Caption := '전체열람';
        check := 0;
   end;
end;

procedure TDiaryForm.OnFocusButton1Click(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.ShowModal;
end;

procedure TDiaryForm.ComponentClear;
begin
      Ed_empno.Text            := '';
      L_korname.ValueCaption   := '';
      L_payraname.ValueCaption := '';
      L_jobdept.ValueCaption   := '';
      L_deptname.ValueCaption  := '';
      ED_VALText.Text          := '';
      ED_COMText.Text          := '';
      ED_PERText.Text          := '';
      ED_COMMENT.Text          := '';
end;

procedure TDiaryForm.Bt_printClick(Sender: TObject);
var sSql : String;
begin
   if L_korname.ValueCaption = '' then
   begin
       MessageDlg('인쇄할 팀원을 먼저 선택하세요.',mtError,[mbOK],0);
       exit;
   end;

   sSQL := 'SELECT MEMODATE,WRITEEMP,                                                '+
           '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
           '       EMPNO, (select korname from pimpmas where empno = a.empno) KORNAME '+
           '  FROM PEHDIARY a                                                         '+
           ' WHERE empno    = '''+DiaryForm.ed_empno.Text  +'''                                 '+
           '   and orgnum   = '''+DiaryForm.L_jobdept.Hint +'''                                 '+
           '   and jobdept  = '''+DiaryForm.L_jobdept.ValueCaption +'''                         '+
           ' Order by memodate                                                        ';
   With TCDS do
   begin
       Close;
       ClearFieldInfo;
       AddField('MEMODATE'     , ftString,  100 );
       AddField('WRITEEMP'     , ftString,  100 );
       AddField('WRITENAME'    , ftString,  100 );
       AddField('EMPNO'        , ftString,  100 );
       AddField('KORNAME'      , ftString,  100 );
       Sql.Clear;
       Sql.Text := sSQL;
       ServiceName := 'HINSA_select';
       Open;
       if RecordCount > 0 then
       begin
          sSQL :=  'SELECT EMPNO, MEMODATE, VALTEXT, COMTEXT, PERTEXT '+
                   '  FROM PEHDIARY a                                 '+
                   ' WHERE empno    = '''+ed_empno.Text  +'''         '+
                   '   and orgnum   = '''+L_jobdept.Hint +'''         '+
                   '   and jobdept  = '''+L_jobdept.ValueCaption +''' '+
                   ' Order by memodate                                ';
          with TDS1 do
          begin
              Close;
              ServiceName := 'HINSA_select3';
              ClearFieldInfo;
              AddField('EMPNO'   , ftString, 2000);
              AddField('MEMODATE', ftString, 2000);
              AddField('VALTEXT' , ftString, 2000);
              AddField('COMTEXT' , ftString, 2000);
              AddField('PERTEXT' , ftString, 2000);
              ClearParamInfo;
              SQL.Text := sSQL;
              Open;
          end;
       end;
   end;
   if DiaryForm.TCDS.recordcount < 1 then
   begin
       MessageDlg('작성하신 내용이 없습니다.',mtError,[mbOK],0);
       exit;
   end;
   PrintForm.QuickRep1.Preview;
end;

procedure TDiaryForm.ED_ValTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ValText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ValText := copy(ED_ValText.text, 1, Length(ED_ValText.text)-1);
          ED_ValText.Clear;
          ED_ValText.Lines.Append(ValText);
     end;
end;

procedure TDiaryForm.ED_ComTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ComText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ComText := copy(ED_ComText.text, 1, Length(ED_ComText.text)-1);
          ED_ComText.Clear;
          ED_ComText.Lines.Append(ComText);
     end;
end;

procedure TDiaryForm.ED_PerTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     PerText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          PerText := copy(ED_PerText.text, 1, Length(ED_PerText.text)-1);
          ED_PerText.Clear;
          ED_PerText.Lines.Append(PerText);
     end;
end;

end.
