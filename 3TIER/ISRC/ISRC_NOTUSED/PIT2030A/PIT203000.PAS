{* ======================= Program Header ======================================
 PROGRAM-NAME   : PIT2030A(사내인재교류 지원/열람/검토)
 SYSTEM-NAME    : 인사
 SUBSYSTEM-NAME : 인재교류 지원서 작성 및 처리현황 조회
 Programmer     : 서혜미
 Version        : 30.00
 Date           : 2000.11.30

Update Contents
   Version    date(yy.mm.dd)     programmer  relevant doc.no   description
    30.00      2000.11.30         서혜미
    30.01      2004.06.29         이민용      CI작업
============================================================================= *}
unit pit203000;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit, OnEditMemo, OnDBEditCtrl, pebtnedit, peextcombo,
  Tmax_session, OnSkinBtn, TmaxFunc;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    OnSchemeForm1: TOnSchemeForm;
    SB_Help: TStatusBar;
    Pa_Work: TPanel;
    TMaxSession: TTMaxSession;
    TMain: TTMaxDataSet;
    TCARR: TTMaxDataSet;
    Tgo: TTMaxDataSet;
    TCDS: TTMaxDataSet;
    TETC: TTMaxDataSet;
    TEdu: TTMaxDataSet;
    TLice: TTMaxDataSet;
    TSCH: TTMaxDataSet;
    TDuty: TTMaxDataSet;
    TProg: TTMaxDataSet;
    TEqip: TTMaxDataSet;
    Tcome: TTMaxDataSet;
    TCsel: TTMaxDataSet;
    Qcode: TTMaxDataSet;
    Qdept: TTMaxDataSet;
    Qfami: TTMaxDataSet;
    Qann: TTMaxDataSet;
    Qsch: TTMaxDataSet;
    QCar: TTMaxDataSet;
    QLic: TTMaxDataSet;
    QRew: TTMaxDataSet;
    Tcollect: TTMaxDataSet;
    QPun: TTMaxDataSet;
    QryGen: TTMaxDataSet;
    PischnDept: TTMaxDataSet;
    TCupd: TTMaxDataSet;
    Query1: TTMaxDataSet;
    Query2: TTMaxDataSet;
    Bt_Form1: TOnSkinButton;
    Bt_Form2: TOnSkinButton;
    Bt_Form3: TOnSkinButton;
    Bt_Form4: TOnSkinButton;
    Bt_Exit: TOnSkinButton;
    TDS1: TTMaxDataSet;
    TDS_DEL: TTMaxDataSet;
    TDS_F1: TTMaxDataSet;
    TDS_F2: TTMaxDataSet;
    TDS_F3: TTMaxDataSet;
    THintMail: TTMaxDataSet;
    TDSdept: TTMaxDataSet;
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_Form3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Start    : Boolean;

    // 작업할 폼을 생성하는 procedure
    procedure SubFormCreate(Sender : TObject);
  public
    { Public declarations }
    SelForm     : TForm;    // 현재 작업중인 Form
    P_orgnum    : String;   // 현 조직차수
    P_Sysdate   : String;   // 시스템 현재시각
    PayraChdate : String;   // 직위체계변경일
    PayraChMM   : String;   // 직위체계변경월

    pEmpno      : String;   // 로그인 사원 인사사항
    pKorname    : String;
    pClass      : String;
    pGroupId    : String;
    porgnum     : String;
    pDeptcode   : String;
    pDeptname   : String;
    ppaycl      : String;
    ppayra      : String;
    pPaycl_na   : String;
    pPayra_na   : String;
    pPayrayn    : String;
    pOrgDeptList: String;   // 겸직부서

    class_gu    : String;   // 등급구분
    class_sebugu: String;   // 팀장상세구분
    collect_gu  : String;   // 전역변수 직접Call Or 간접Call
    gbChanged   : Boolean;  // 자료변경여부

    gvVariant   : OleVariant;

    gsDeptGubn : String;
    gsMemoGubn : String ;
    gsMonum    : String;

    Csel_SQL : String;
    Csel_ret : Boolean;
    Cupd_SQL : String;
    Cupd_ret : Boolean;
    CDS_Psfd : array of String;
    function  Csel_gfd(p_loc: Integer): String;
    function  fnGetInwon(FOrgnum, FDeptcode: String): OleVariant;
    function  fnGetSysdate: OleVariant;
    function  fnGetGroupId(FEmpno: String): OleVariant;
    function  fnGetPimpmas(FEmpno: String): OleVariant;
    function  fnGetPycdept(FOrgnum, FDeptcode: String): OleVariant;
    function  fnOrgDeptList(FEmpno, FOrgnum, FDeptcode: String): String;
    procedure Peempfind;
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  end;




var
  MainForm: TMainForm;

implementation


uses
  pit203011, pit203020, pit203030, pit203040, Pit203050;



{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Start := True;

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
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
  ///////////////////////////////////////////////////////////////////////
end;
//------------------------------------------------------------------------------
procedure TMainForm.Peempfind;
var
   SL_Sql : String;
   iIdx : Integer;
const
    asEmpno : array[0..53] of string[4] =  ('1055','1846','0768','1464','1063','1645','1911','0603','1677','1488'
                                           ,'0616','1186','1584','1646','1581','0624','1296','1049','1514','0113'
                                           ,'0403','1589','1588','1792','0759','1207','1200','0452','1310','1796'
                                           ,'1235','1061','0754','0171','1242','1351','1682','1047','1717','1218'
                                           ,'1065','1066','0316','1126','1059','1495','1056','0670','0173','1485'
                                           ,'1486','0619','1619','1632');
begin
   Bt_Form3.Visible := False;
   Bt_Form1.Visible := False;
   Bt_Form2.Visible := False;
   Bt_Form4.Visible := False;
     //----------------
     // 결재자 조회
     //----------------
   SL_Sql := ' select distinct                            '+
             '        eempno     DEPTCODE                 '+
             '      , ''field2'' DEPTNAME                 '+
             '      , ''field3'' field3                   '+
             '      , ''field4'' field4                   '+
             '      , ''field5'' field5                   '+
             '   from pimeemp                             '+
             '  where orgnum = (select value1             '+
             '                    from pimvari            '+
             '                   where gubun =  ''00''    '+
             '                     and sgubun = ''0001'') '+
             '    and eempno = ''%s''                     ';
//   showmessage(pEmpno);
   SL_Sql := Format(SL_Sql,[pEmpno]);
   try
      with TDS1 do
      begin
         ServiceName := 'HINSA_select';
         Close;
         Sql.Text := SL_Sql;

         ClearFieldInfo;
         AddField('DEPTCODE'  , ftString,  100);
         AddField('DEPTNAME'  , ftString,  100);
         AddField('field3'    , ftString,  100);
         AddField('field4'    , ftString,  100);
         AddField('field5'    , ftString,  100);
         Open;

         if RecordCount >= 1 then     //결재자
         begin
            Bt_Form2.Visible := True;
            Bt_Form4.Visible := True;
            Bt_Form3.Visible := False;
            Bt_Form1.Visible := False;
            class_gu         := '2';
         end else                   //일반사원
         begin
            if  (pGroupId = 'G011') or  (pGroupId = 'G001') then
            begin
            Bt_Form3.Visible := True;
            Bt_Form1.Visible := True;
        //       Bt_ExitClick(Sender);
            end;
            for iIdx := 0 to 53 do
            begin
               if pEmpno = asEmpno[iIdx] then
               begin
                  Bt_Form3.Visible := True;
                  Bt_Form1.Visible := True;
               end;
            end;

//            Bt_Form3.Visible := True;
//            Bt_Form1.Visible := True;
            Bt_Form2.Visible := False;
            Bt_Form4.Visible := False;
            class_gu         := '3';
         end;
      end;
   finally
   end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Bt_Form3Click(Sender: TObject);  //처음->3번화면으로
begin
  SubFormCreate(Sender);
end;
//------------------------------------------------------------------------------
procedure TMainForm.SubFormCreate(Sender : TObject);
begin
  Try
    if (SelForm <> nil) or Assigned(SelForm) then
    begin
      SelForm.Free;
      SelForm := nil;
    end;

    Bt_Form1.BtnDown  := False;
    Bt_Form2.BtnDown  := False;
    Bt_Form3.BtnDown  := False;
    Bt_Form4.BtnDown  := False;

    TOnSkinButton(Sender).BtnDown := True;

    case TComponent(Sender).Tag of
      1 : SelForm := TFm_SubForm1.Create(nil);
      2 : SelForm := TFm_SubForm2.Create(nil);
      3 : SelForm := TFm_SubForm3.Create(nil);
      4 : SelForm := TFm_SubForm4.Create(nil);
      5 : SelForm := TFm_SubForm5.Create(nil);
    end;

    if Assigned(SelForm) then
    begin
      SelForm.BorderStyle := bsNone;
      SelForm.Parent      := Pa_Work;
      SelForm.WindowState := wsMaximized;
      SelForm.Tag         := 1;
      SelForm.Show;
    end;

  Except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  End;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  CLOSE;
end;
//------------------------------------------------------------------------------
function TMainForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('sel_data').AsString;
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
//사용안함 K.J
function TMainForm.fnGetInwon(FOrgnum, FDeptcode: String): OleVariant;
var
  Tem : String;
begin
//정원,현원
  Tem  := 'select  '+
          '   nvl(ttotal,0)    || '';'' ||                    '+
          '  (nvl(ptotal,0) - nvl(pimsitot,0))                '+
          'from pihtopo t, pimvari v                          '+
   Format('where orgnum  = ''%s'' and deptcode = ''%s''       ', [FOrgnum, FDeptcode])+
          '  and gubun   = ''50'' and sgubun = ''0001''       '+ // 현원생성일자
          '  and topoym  = nvl(value2,''0'')                  ';

  With TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := Tem ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;

  // 정원,현원
  Result := VarArrayOf([Csel_gfd(1), Csel_gfd(2)]);
  TCsel.Close;    
end;

function TMainForm.fnGetSysdate: OleVariant;
begin
// 조직차수세팅
  ParamVariant:= Format('SELECT  nvl(  value1  ,'' '') ||'';''||                     '+
                        '        to_char(sysdate,''YYYYMMDDHH24MISSD'') ||'';''||    '+
                        '        nvl(  value3  ,'' '') ||'';''||                     '+
                        '        nvl(  value4  ,'' '')                               '+
                        '  FROM  pimvari                                             '+
                        ' WHERE  gubun = ''%s'' and sgubun = ''%s''                  ',
                        ['00','0001']);
  With TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := ParamVariant ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;

  // 현조직차수, 시스템시각, 직위체계변경일, 직위체계변경월
  Result := VarArrayOf([Csel_gfd(1), Csel_gfd(2), Csel_gfd(3), Csel_gfd(4)]);
  TCsel.Close;
end;

function TMainForm.fnGetGroupId(FEmpno: String): OleVariant;
begin
// 조직차수세팅
  ParamVariant:= Format('SELECT  nvl(  GROUPID  ,'' '')                              '+
                        '  FROM  pymenuuser                                          '+
                        ' WHERE  empno = ''%s''                                      ',
                        [FEmpno]);
  With TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := ParamVariant ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;

  // groupid
  Result := VarArrayOf([Csel_gfd(1)]);
  TCsel.Close;
end;


function TMainForm.fnGetPimpmas(FEmpno: String): OleVariant;
var
  sEmpno, sKorname: string;
begin
  if trim(FEmpno) = '' then
  begin
    sEmpno   := FEmpno+'%';
    sKorname := FEmpno+'%';
  end
  else
  begin
    sEmpno   := FEmpno+'%';
    sKorname := '%'+FEmpno+'%';
  end;

  // 인사사항
  ParamVariant := 'Select '+
                  ' nvl(        empno      ,'' '') empno     , '+
                  ' nvl(        korname    ,'' '') korname   , '+
                  ' nvl(        a.orgnum   ,'' '') orgnum    , '+
                  ' nvl(        a.deptcode ,'' '') deptcode  , '+
                  ' nvl(        d.deptname ,'' '') deptname  , '+
                  ' nvl(        paycl      ,'' '') paycl     , '+
                  ' nvl(        c.codename ,'' '') payclname , '+
                  ' nvl(        payra      ,'' '') payra     , '+
                  ' nvl(        b.codename ,'' '') payraname , '+
                  ' nvl(        jobgun     ,'' '') jobgun    , '+
                  ' nvl(        e.codename ,'' '') jobgunname, '+
                  ' nvl(        a.payrayn  ,'' '') payrayn     '+
                  'FROM  pycdept d, pyccode e, pyccode c, pyccode b, pimpmas a  '+
                  'WHERE a.orgnum = d.orgnum and a.deptcode = d.deptcode   '+
                  '  AND a.payra = b.codeno and b.codeid = ''I113''        '+
                  '  AND a.paycl = c.codeno and c.codeid = ''I112''        '+
                  '  AND a.jobgun= e.codeno and e.codeid = ''I115''        '+
                  '  and a.pstate < ''80''                                 '+
           format('  and (a.empno LIKE ''%s'' or a.korname LIKE ''%s'')    ',
                  [sEmpno, sKorname]);

  with Query1 do
  begin
    Close;
    ClearFieldInfo;
    AddField('EMPNO'        , ftString ,  4 );
    AddField('KORNAME'      , ftString ,  12);
    AddField('ORGNUM'       , ftString ,  3 );
    AddField('DEPTCODE'     , ftString ,  6 );
    AddField('DEPTNAME'     , ftString ,  60);
    AddField('PAYCL'        , ftString ,  3 );
    AddField('PAYCLNAME'    , ftString ,  20);
    AddField('PAYRA'        , ftString ,  3 );
    AddField('PAYRANAME'    , ftString ,  20);
    AddField('JOBGUN'       , ftString ,  2 );
    AddField('JOBGUNNAME'   , ftString ,  20);
    AddField('PAYRAYN'      , ftString ,  1 );
    Sql.Clear;
    Sql.Text := ParamVariant;
    ServiceName := 'PIT2030A_SEL4';
    Open;
//      TFunc_TQueryAuto('SPIT2030S4', ParamVariant, Query1);

    //for iTemp := 1 to 2 do
    //begin
    //  if Eof then
    //  begin
    //    Dec(iTemp);
    //    Break;
    //  end;
    //  Next;
    //end;
    //First;

    // 건수, 사번, 성명, 조직차수, 부서코드, 부서명, 직급, 직급명, 직위, 직위명, 직군, 직군명, 보임여부
    Result := VarArrayOf([RecordCount,
                          FieldByName('empno').AsString,
                          FieldByName('korname').AsString,
                          FieldByName('orgnum').AsString,
                          FieldByName('deptcode').AsString,
                          FieldByName('deptname').AsString,
                          FieldByName('paycl').AsString,
                          FieldByName('payclname').AsString,
                          FieldByName('payra').AsString,
                          FieldByName('payraname').AsString,
                          FieldByName('jobgun').AsString,
                          FieldByName('jobgunname').AsString,
                          FieldByName('payrayn').AsString]);
    Close;
  end;
end;

function TMainForm.fnGetPycdept(FOrgnum, FDeptcode: String): OleVariant;
var
  sDeptcode, sDeptname: string;
begin
  if trim(FDeptcode) = '' then
  begin
    sDeptcode := FDeptcode+'%';
    sDeptname := FDeptcode+'%';
  end
  else
  begin
    sDeptcode := FDeptcode+'%';
    sDeptname := '%'+FDeptcode+'%';
  end;

  // 인사사항
  ParamVariant := 'SELECT  '+
                  '  nvl(       d.orgnum      ,'' '') orgnum    , '+
                  '  nvl(       d.deptcode    ,'' '') deptcode  , '+
                  '  nvl(       d.deptname    ,'' '') deptname    '+
                  'FROM  pycdept d, pimvari v                     '+
                  'WHERE d.existon = ''1'' and d.chanmode < ''3'' '+
                  '  and v.gubun = ''00'' and sgubun = ''0001''   '+ 
           Format('  and d.orgnum = nvl(''%s'',value1)            '+
                  '  and (d.deptcode like ''%s'' or deptname like ''%s'') '+
                  'ORDER BY deptcode                              ',
                  [FOrgnum, sDeptcode, sDeptname]);

  with Query2 do
  begin
    Close;
    ClearFields;
    AddField('ORGNUM'       , ftString,  3 );
    AddField('DEPTCODE'     , ftString,  6 );
    AddField('DEPTNAME'     , ftString,  60);
    Sql.Clear;
    Sql.Text := ParamVariant;
    ServiceName := 'PIT2030A_SEL1';
    Open;
//      TFunc_TQueryAuto('SPIT2030S1', ParamVariant, Query2);

    //for iTemp := 1 to 2 do
    //begin
    //  if Eof then
    //  begin
    //    Dec(iTemp);
    //    Break;
    //  end;
    //  Next;
    //end;
    //First;

    // 건수, 조직차수, 부서코드, 부서명
    Result := VarArrayOf([RecordCount,
                          FieldByName('orgnum').AsString,
                          FieldByName('deptcode').AsString,
                          FieldByName('deptname').AsString]);
    Close;
  end;
end;

// 겸직부서
function TMainForm.fnOrgDeptList(FEmpno, FOrgnum, FDeptcode: String): String;
var
  sOrgDeptList, sSql: String;
begin
    Result := '';
    sSQL :=
	         'SELECT NVL(empno        ,'' '') aa_empno,      '+
            '       NVL(korname      ,'' '') aa_korname,    '+
            '       NVL(anfrdate     ,'' '') aa_anfrdate,   '+
            '       NVL(antodate     ,'' '') aa_antodate,   '+
            '       NVL(orgnum       ,'' '') aa_orgnum,     '+
            '       NVL(deptcode     ,'' '') aa_deptcode,   '+
            '       NVL(addeptcode   ,'' '') aa_addeptcode, '+
            '       NVL(adpayra      ,'' '') aa_adpayra     '+
            ' FROM PIHANNO                   '+
     Format(' WHERE EMPNO  = ''%s''          ',[FEmpno])+
            '   AND ANUPDYN = ''Y''          '+
            '   AND ADDEPTCODE IS NOT NULL   '+
            '   AND ANTODATE IS NOT NULL     '+
            '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN ANFRDATE AND NVL(ANTODATE,TO_CHAR(SYSDATE,''YYYYMMDD''))   '+
            '   AND ANCODE = ''233''         '+
            'UNION                                '+
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
            '              ORGNUM     a_orgnum,       DEPTCODE  a_deptcode,   '+
            '              ADDEPTCODE a_addeptcode,   ADPAYRA   a_adpayra     '+
            '       FROM PIHANNO                                              '+
     Format('       WHERE EMPNO  = ''%s''                                     ',[FEmpno])+
            '         AND ANUPDYN = ''Y''                                     '+
            '         AND ADDEPTCODE IS NOT NULL                              '+
            '         AND ANTODATE IS NULL                                    '+
            '         AND ANCODE = ''233'' ),                                 '+
            '     ( SELECT EMPNO      b_empno,        KORNAME   b_korname,    '+
            '              ANFRDATE   b_anfrdate,     ANTODATE  b_antodate,   '+
            '              ORGNUM     b_orgnum,       DEPTCODE  b_deptcode,   '+
            '              ADDEPTCODE b_addeptcode,   ADPAYRA   b_adpayra     '+
            '       FROM PIHANNO                                              '+
     Format('       WHERE EMPNO  = ''%s''                                     ',[FEmpno])+
            '         AND ANUPDYN = ''Y''                                     '+
            '         AND ADDEPTCODE IS NOT NULL                              '+
            '         AND ANTODATE IS NULL                                    '+
            '         AND ANCODE = ''238'' )                                  '+
            ' WHERE a_empno  = b_empno (+)                                    '+
            '   AND a_orgnum = b_orgnum (+) AND a_addeptcode = b_addeptcode (+) '+
            '   AND TO_CHAR(SYSDATE,''YYYYMMDD'') BETWEEN a_anfrdate AND NVL(b_anfrdate,TO_CHAR(SYSDATE,''YYYYMMDD'')) ';

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
        ServiceName := 'PIT2030A_SEL5';
        Open;
//            TFunc_TQueryAuto('SPIT2030S5', sSQL, ttxCDS);
        while Not EOF do
        begin
            if trim(FieldByName('AA_DEPTCODE').AsString) <> '' then
                sOrgDeptList := sOrgDeptList +
                             '('''+FieldByName('AA_ORGNUM').AsString+''','''+FieldByName('AA_ADDEPTCODE').AsString+''')'+',';
            Next;
        end;
        // 마지막 ","제거
        if (length(sOrgDeptList) > 0) and (sOrgDeptList[length(sOrgDeptList)] = ',') then
            sOrgDeptList := copy(sOrgDeptList,1,length(sOrgDeptList)-1);
        Close;
    end;

    Result := sOrgDeptList;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 if Start then
  begin
    Start    := not Start;
    OnSchemeForm1.Refresh;
    Application.ProcessMessages;
    // UpDateWindow(St_Help.Handle);

    pEmpno    := Hinsa_Param(CmdLine,1);
    pkorname  := Hinsa_Param(CmdLine,2);
    pClass    := copy(Hinsa_Param(CmdLine,4),2,1);

    // 현조직차수, 시스템시각
    gvVariant   := fnGetSysdate;
    P_Orgnum    := gvVariant[0];
    P_Sysdate   := gvVariant[1];
    PayraChdate := gvVariant[2];
    PayraChMM   := gvVariant[3];

    gvVariant   := fnGetGroupId(pEmpno);
    PGroupId    := gvVariant[0];

    // 건수, 사번, 성명, 조직차수, 부서코드, 부서명, 직급, 직급명, 직위, 직위명, 직군, 직군명, 보임여부
    gvVariant := fnGetPimpmas(pEmpno);
    porgnum   := gvVariant[3];
    pDeptcode := gvVariant[4];
    pDeptname := gvVariant[5];
    ppaycl    := gvVariant[6];
    pPaycl_na := gvVariant[7];
    ppayra    := gvVariant[8];
    pPayra_na := gvVariant[9];
    pPayrayn  := gvVariant[12];

    gsMonum := 'M02';

    Peempfind;

// k.j. 막음
{    if (pClass <= 'B') then
      class_gu :=  '1'
    else if (pPayrayn = 'Y') then
      class_gu :=  '2'
    else
    begin
      class_gu :=  '3';
      Bt_Form4.Enabled  :=  False;
    end;

    if pPayrayn = 'Y' then
      pOrgDeptList := fnOrgDeptList(pEmpno, pOrgnum, pDeptcode); // 본인부서 + 겸직부서
    if pPayrayn = 'Y' then
      SubFormCreate(Bt_Form4)
    else
      SubFormCreate(Bt_Form3);}
  end;
end;


//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with MainForm.TCupd do
  begin
       ServiceName := 'PIT2030A_DML';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                         ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
       SQL.Add('        ''''                  )             ');  //EAI_DATE

       try
            Execute;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;

end.
