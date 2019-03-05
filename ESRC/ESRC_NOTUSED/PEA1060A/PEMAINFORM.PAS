{===================== Program Header ==========================================
 PROGRAM-NAME   : PEA1060A(하반기 업무목표 등록/결재)
 SYSTEM-NAME    : 사원평가
 SUBSYSTEM-NAME : 업적평가
 Programmer     : 이민용
 Version        : 1.00
 Date           : 2004.10.25

Update Contents
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
    1.00      1999.06.28         전철호          설계명세서       최초개발본
   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
   30.11      2000.11.10         송수영          전2000-11-       결재시 NOTES메일 전송 및 목표등록및수정 프로그램 수정
                                                                  (화면에서 상하반기 구분없음으로 수정-pea1050a1))
   30.12      2000.01.15         송수영                           평가진행중이면 수정,삭제불가능하도록 수정
   30.13      2001.04.14         윤형식          by 하병수        업무목표 상하반기 자료를 상반기필드 자료에만 씀.
   30.39      2001.07.24         손종운                           자기계발목표 추가 I
   30.40      2001.08.01         손종운                           지점장 추가 및 평가지표 변경
   30.41      2001.08.10         손\종운 수정                      자기계발만 수정해도 재결재상신,
                                                                  피평가자 목록 지점장 ===> 비고란에 참고인으로 표시
   30.42      2001.08.23         손종운 수정                      업무협의후 수정;화면과 버튼 활성롸등
   30.43      2001.08.24         손종운 수정                      30.42의 디버깅
              기존 : 업적평가 마스터를 읽어 올때 e1valobjyn(1차평가자 평가 반려)을 읽어오고있슴.
              수정 : 관리/영업 모두 Query는 e1prjobjyn(1차평가자 목표 반려)로 수정하고
                     Field명은 기존의 e1valobjyn으로 그대로 사용 함.
              ===> test 후 수정할 필요 있슴
   31.53      2002.02.19          손종운         by 이석희 요청   부서세부명 보여주기
   31.55      2002.04.06          손종운         Notes 기능 삭제
   31.56      2004.08.19          정규용         Notes 기능 추가//코드,부서코드 로직 변경(기존 코드화일에서 읽어오는것을 실시간 조회해오도록) 기타 버그제거
==================================================================================
    1.00      2004.10.27          이민용         by 손필영 요청   20041231을 기준으로 업무목표 등록/결재 신규로 작성
    1.04      2004.11.01          이민용         by 손필영 요청   자기 목표등록시 결재상신 비활성화, 결재상신시 입력값 체크
    1.08      2004.11.01          이민용         by 정세영 요청   조회 버튼 수정
    1.09      2004.11.11          이민용         by 손필영 요청   평가 등록 종료로 메세지 수정
    1.15      2004.01.07          이민용         자체             직군체크 안함.
===============================================================================}

unit PeMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil,
  pereg, jeonPan, OnInsaCommon, OnEditBaseCtrl, registry,  TlHelp32,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, TmaxFunc, PDownload, Pass, Func;// PDownloadDev;    //
 {pegraphic,pass
 }

type
  TMainForm = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    Pa_Work: TPanel;
    St_Help: TStatusBar;
    Panel1: TPanel;
    Pa_jobgun: TPeJeonLabel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    Ed_empno: TPePanelBtnEdit;
    Nt_Book: TNotebook;
    Panel3: TPanel;
    Grid1: TDBCtrlGrid;
    Db_plan1: TDBText;
    Db_plan2: TDBText;
    Db_plan3: TDBText;
    Db_plan5: TDBText;
    Db_plan4: TDBText;
    Db_foraim1: TDBText;
    Db_foraim2: TDBText;
    Db_foraim3: TDBText;
    Db_foraim4: TDBText;
    Db_foraim5: TDBText;
    Db_forweight: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PeJeonLabel1: TPeJeonLabel;
    PeJeonLabel3: TPeJeonLabel;
    PeJeonLabel5: TPeJeonLabel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_PRod: TPeJeonOutLookBtn;
    Bt_Confirm: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Panel2: TPanel;
    Grid2: TDBCtrlGrid;
    Db_Bvalidx: TDBText;
    Db_Bforaim: TDBText;
    Db_Bforweight: TDBText;
    PeJeonLabel8: TPeJeonLabel;
    PeJeonLabel10: TPeJeonLabel;
    PeJeonLabel13: TPeJeonLabel;
    PeJeonLabel14: TPeJeonLabel;
    Bt_can: TPeJeonOutLookBtn;
    Bt_Detail: TPeJeonOutLookBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Db_Bpropeltask: TDBMemo;
    Db_Bvalfunction: TDBMemo;
    Db_propeltask: TDBMemo;
    Panel4: TPanel;
    PeJeonLabel4: TPeJeonLabel;
    Bevel5: TBevel;
    PeJeonLabel2: TPeJeonLabel;
    Bevel10: TBevel;
    PeJeonLabel6: TPeJeonLabel;
    PeJeonLabel7: TPeJeonLabel;
    PeJeonLabel9: TPeJeonLabel;
    PeJeonLabel11: TPeJeonLabel;
    PeJeonLabel12: TPeJeonLabel;
    Grid3: TDBCtrlGrid;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Tgt: TPeJeonOutLookBtn;
    Bt_Dev: TPeJeonOutLookBtn;
    P_Title: TPeJeonGrdPanel;
    DB_Devitem: TDBText;
    DB_Devmethod: TDBText;
    DB_Devaim: TDBText;
    DB_Demand: TDBText;
    DB_seq: TDBText;
    DB_Validx1: TDBText;
    DB_Validx2: TDBText;
    DB_Validx3: TDBText;
    DB_Validx4: TDBText;
    DB_Validx5: TDBText;
    Pa_deptna3: TPeJeonLabel;
    btn_Print: TPeJeonOutLookBtn;
    Bevel13: TBevel;
    PeJeonLabel15: TPeJeonLabel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Db_deweight1: TDBText;
    Db_deweight2: TDBText;
    Db_deweight3: TDBText;
    Db_deweight4: TDBText;
    Db_deweight5: TDBText;
    DB_s1: TDBText;
    DB_a1: TDBText;
    DB_b1: TDBText;
    DB_c1: TDBText;
    DB_d1: TDBText;
    Pa_deptcode: TPeJeonLabel;
    Pa_trdate: TPeJeonLabel;
    Pa_paycl: TPeJeonLabel;
    Pa_payra: TPeJeonLabel;
    JeonPanel2: TJeonPanel;
    Pa_Le1KorName: TJeonPanel;
    Pa_Le1Payra: TJeonPanel;
    JeonPanel4: TJeonPanel;
    Pa_Le2KorName: TJeonPanel;
    Pa_Le2Payra: TJeonPanel;
    Pa_empdate: TPeJeonLabel;
    Pa_paycldate: TPeJeonLabel;
    Eda_weight: TOnNumberEdit;
    pa_DUTYKINDNAME: TPeJeonLabel;
    pa_DUTYNAME: TPeJeonLabel;
    DBSet10: TTMaxDataSet;
    pn_obt: TPanel;
    bt_close: TPeJeonOutLookBtn;
    pob_e1prjopinon: TPeJeonOutLookBtn;
    ed_seqno_chk: TEdit;
    mo_e1prjopinon: TMemo;
    ListBox1: TListBox;
    Bt_ReConfirm: TPeJeonOutLookBtn;
    Timer1: TTimer;
    TDml: TTMaxDataSet;
    Bt_Opt: TPeJeonOutLookBtn;
    Bt_Jik: TPeJeonOutLookBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_empnoEnter(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ModClick(Sender: TObject);
    procedure Ed_empnoRightBtnClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure Bt_delClick(Sender: TObject);
    procedure Bt_canClick(Sender: TObject);
    procedure Grid2DblClick(Sender: TObject);
    procedure Bt_TgtClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure pob_e1prjopinonClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure Bt_ReConfirmClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Bt_PRodClick(Sender: TObject);
    procedure Bt_JikClick(Sender: TObject);
  private
    { Private declarations }
    Start      : Boolean;
    pEmpno     : string;  // 로그인 사번
    pKorname   : string;  // 로그인 성명
    pPass      : String;
    pClass     : string;  // 로그인 등급
    ComIp      : string;

    Lsysdate   : string;
    Lfordate   : string;
    Lwork      : string;  // 작업자 구분.
    Le2empno   : string;  // 2차 평가자
    Le1korname : string;  // 1차 평가자 성명.
    Le2korname : string;  // 2차 평가자 성명.
    Lebrempno   : string;  // 지점장
    Lebrkorname : string;  // 지점장 성명

    grvalconyn  ,
    ge1valconyn ,
    ge2valconyn ,
    ge1valobjyn ,
    ge2valobjyn : string;

    gebrvalconyn ,
    gebrvalobjyn : string;
    sKillCheckID : String;
    LSfilename : string;
    LAarg : array[0..200] of char;
    LWerrrtn : word;

    payrafrom : String;
    payrato   : String;
    objemp1   : String;
    objemp2   : String;
    excemp1   : String;
    excemp2   : String;
    excemp3   : String;
    excemp4   : String;
    excemp5   : String;
    excemp6   : String;

    GSHomeDir: string;

    function GetPehremas(Gubun : string) : string;
    function Check_Edit1 : Boolean;                 //입력 값 체크
    procedure Read_pehreaim_det;
    procedure Select_Form(Sender: TObject);
    function  Csel_gfd10(p_loc: Integer): String;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000

  public
    gsLastConEv  : String;  //업무목표최종결재자 (1차 or 2차)
    Lrabasdate   : string;  // 평가기준일.
    Le1empno     : string;  // 1차 평가자
    g_mainweight : string;  // 전체 비중
    EvalYN       : Boolean;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    toMailKorname, toMailEmpno, Msg: string;
    s_payra : string;
    SRabasdate : string;  // 조회용 전년도 평가 기준일

    { Public declarations }
    function  Get_Code(Acodeid, Acodeno : String) : String;  // 코드명 가져오기
    function  Get_Dept(Acodeid, Acodeno : String) : String;  // 부서명 가져오기
    function GetBaseYear(gubun : integer) : string;
  end;

var
  MainForm: TMainForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;

const
  Msg = '목표 면담등록 서버가 다운된 것 같습니다.'+#13#13+'담당자에게 문의 하십시오'#13;

implementation

uses
  Hinsa_TmaxDM, peDm, pea1060a1, pea1060a2, pea1060a3, pea1060b3, pea1060a5, pea1060a6;

{$R *.DFM}

//작업상 필요한 날짜 얻기
function TMainForm.GetBaseYear(gubun : integer) : string;
var
  Sql     : string;
begin
  Result := '';

  if gubun = 0 then                                            //전년도 업적평가 기준일
    Sql := 'SELECT VALUE4 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 1 then                                            //업적평가 기준일(Lrabasdate)
    Sql := 'SELECT VALUE1 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 2 then                                            //하반기 업적평가 시작일(LFordate)
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0003'' ';

  if gubun = 3 then                                            //시스템 시각(Lsysdate)
    Sql := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') FROM DUAL ';

  if gubun = 4 then                                            //
    Sql := 'SELECT NVL(VALUE5,'' '') FROM PEHREBAS  '+
           ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND GUBUN = ''11'' AND SGUBUN = ''0003'' ';

  if gubun = 5 then                                            //
    Sql := 'SELECT NVL(VALUE3,'' '') FROM PIMVARI       '+
           ' WHERE GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 6 then                                            //평가담당부서명
    Sql := 'SELECT NVL(VALUE2,'' '') FROM PIMVARI       '+
           ' WHERE GUBUN = ''R0'' AND SGUBUN = ''0001'' ';

  if gubun = 7 then                                            //전년도 업적평가 기준일
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0002'' ';

  DataModule_Tmax.Csel_SQL := Sql;
  DataModule_Tmax.Csel_Open4;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;


function TMainForm.GetPehremas(Gubun : string) : string;    //사원업적평가 마스터 읽기
var
   Sql     : string;
   OleData : OleVariant;
begin
   Result     := '';
   Le1empno   := '';
   Le2empno   := '';
   Le1korname := '';
   Le2korname := '';
   Lebrempno   := '';
   Lebrkorname := '';

   Sql := 'SELECT EMPNO      ||'';''|| KORNAME    ||'';''|| JOBGUN    ||'';''|| PAYCL       ||'';''|| PAYRA     ||'';''|| '+
          '       DEPTCODE   ||'';''|| ORGNUM     ||'';''|| TITLE     ||'';''|| PAYCLDATE   ||'';''|| TRDATE    ||'';''|| '+
          '       EMPDATE    ||'';''|| E1EMPNO    ||'';''|| E2EMPNO   ||'';''|| E1KORNAME   ||'';''|| E2KORNAME ||'';''|| '+
          '       E1PAYRA    ||'';''|| E2PAYRA    ||'';''|| RVALCONYN ||'';''|| E1VALCONYN  ||'';''|| E2VALCONYN||'';''|| '+
          '       E1VALOBJYN ||'';''|| E2VALOBJYN ||'';''|| EBREMPNO  ||'';''|| EBRKORNAME  ||'';''|| EBRPAYRA  ||'';''|| '+
          '       EBRVALCONYN||'';''|| EBRVALOBJYN||'';''|| E1PRJCONYN||'';''|| E1PRJCONDATE||'';''|| E1PAYCL   ||'';''|| '+
          '       E1ORGNUM   ||'';''|| E1DEPTCODE '+
          '  FROM PEHREMAS ';
   if Gubun = '읽기' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + '''         '+  // 평가기준일
                  '   AND EMPNO     = ''' + Ed_empno.LabelHint + ''' '+  // 선택된사번
                  '   AND RECONYN   = ''Y''                          ';  // 목표등록대상여부
   end;

   if Gubun = '추출' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+  //평가기준일
                  '   AND RECONYN   = ''Y''                  '+  //콕표등록대상여부
                  '   AND (EMPNO    = ''' + pEmpno + '''     '+  //선택된사번
                  '    OR  E1EMPNO  = ''' + pEmpno + '''     '+  //1차평가자
                  '    OR  E2EMPNO  = ''' + pEmpno + '''     '+  //2차평가자
                  '    OR  EBREMPNO = ''' + pEmpno + ''')    ';  //지점장
   end;

   // 접속자가 피평가자, 1차평가자, 2차평가자중 하나인지 검사
   if Gubun = '구분' then
   begin
     Sql := Sql + ' WHERE RABASDATE = ''' + Lrabasdate + ''' '+  //평가기준일
                  '   AND RECONYN   = ''Y''                  '+  //목표등록대상여부
                  '   AND (E1EMPNO  = ''' + pEmpno + '''     '+  //1차평가자
                  '    OR  E2EMPNO  = ''' + pEmpno + '''     '+  //2차평가자
                  '    OR  EBREMPNO = ''' + pEmpno + ''')    ';  //지점장
   end;

   if Gubun = '구분' then
   begin
     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open4;
   end
   else
   begin
     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open;
   end;

   if Gubun = '읽기' then
   begin
      with DataModule_Tmax.TMaxDataSet_HInsa do
      begin
         Ed_empno.Text            := DataModule_Tmax.Csel_gfd(2); //FieldByName('korname').AsString; //사원명
         Pa_payra.Hint            := DataModule_Tmax.Csel_gfd(5);
         Pa_paycl.TextCaption     := Get_Code('I112',DataModule_Tmax.Csel_gfd(4));  //직급
         Pa_payra.Hint            := DataModule_Tmax.Csel_gfd(5);

         Pa_payra.TextCaption     := Get_Code('I113',DataModule_Tmax.Csel_gfd(5));  //직위
         Pa_jobgun.TextCaption    := Get_Code('I115',DataModule_Tmax.Csel_gfd(3));  //직군
         Pa_jobgun.Hint           := DataModule_Tmax.Csel_gfd(3);                   // 직군코드
         Pa_deptcode.TextCaption  := Get_Dept(DataModule_Tmax.Csel_gfd(7),          //부서명
                                              DataModule_Tmax.Csel_gfd(6));
         Pa_empdate.TextCaption   := DataModule_Tmax.Csel_gfd(11);                      //입사일
         //Pa_paycldate.LabelCaption := DataModule_Tmax.Csel_gfd(8);                      //승격일(타이틀?)
         Pa_paycldate.TextCaption := DataModule_Tmax.Csel_gfd(9);                       //승격일
//         Pa_trdate.TextCaption    := DataModule_Tmax.Csel_gfd(10);                      //현부서발령일
         Pa_trdate.TextCaption    := Copy(Lrabasdate,1,4) + '0101';                      //현부서발령일
         if pEmpno = DataModule_Tmax.Csel_gfd(12) then                                  //pEmpno = Login 사번
            Result := '1차';
         if pEmpno = DataModule_Tmax.Csel_gfd(23) then
            Result := '지점장';
         if pEmpno = DataModule_Tmax.Csel_gfd(13) then
            Result := '2차';
         if pEmpno = DataModule_Tmax.Csel_gfd(1) then
            Result := '피평가자';

         Le1empno   := DataModule_Tmax.Csel_gfd(12);                                    //1차평가자사번
         Le2empno   := DataModule_Tmax.Csel_gfd(13);                                    //2차평가자사번
         Le1korname := DataModule_Tmax.Csel_gfd(14);                                    //1차평가자성명
         Le2korname := DataModule_Tmax.Csel_gfd(15);                                    //2차평가자성명
         Lebrempno  := DataModule_Tmax.Csel_gfd(23);                                   //지점장사번
         Lebrkorname:= DataModule_Tmax.Csel_gfd(24);                                   //지점장성명

         Pa_Le1korname.Caption := Le1korname;                                  //1차평가자성명
         Pa_Le2korname.Caption := Le2korname;                                  //2차평가자성명
         Pa_Le1payra.Caption   := Get_Code('I113',DataModule_Tmax.Csel_gfd(16));    //1차평가자직위
         Pa_Le2payra.Caption   := Get_Code('I113',DataModule_Tmax.Csel_gfd(17));    //2차평가자직위
      end;
   end;

   if Gubun = '추출' then
   begin
      if DataModule_Tmax.TMaxDataSet_HInsa.Eof then
         Result := '없음';
   end;

   if Gubun = '구분' then
   begin
      if DM.Qmas.Eof then
         Result := '없음';
   end;

   grvalconyn  := DataModule_Tmax.Csel_gfd(18);              //피평가자  평가완료 여부
   ge1valconyn := DataModule_Tmax.Csel_gfd(19);              //1차평가자 평가완료 여부
   ge2valconyn := DataModule_Tmax.Csel_gfd(20);              //2차평가자 평가완료 여부
   ge1valobjyn := DataModule_Tmax.Csel_gfd(21);              //1차평가자 평가반려 여부
   ge2valobjyn := DataModule_Tmax.Csel_gfd(22);              //2차평가자 평가반려 여부

   vOrgnum   := DataModule_Tmax.Csel_gfd(07);
   vDeptcode := DataModule_Tmax.Csel_gfd(06);

   if  (Pa_payra.Hint = 'C11') or (Ed_empno.LabelHint = '0694') then //팀장이면
   begin
       Bt_Prod.Visible :=  True;
       s_payra         := DataModule_Tmax.Csel_gfd(5);

   end
   else
       Bt_Prod.Visible := False;

   if Gubun = '읽기' then
   begin
     sql := 'SELECT NVL(DEPTNA3, '' '') FROM PYCDEPT '+
            ' WHERE ORGNUM   = ''' + vOrgnum   + ''' '+
            '   AND DEPTCODE = ''' + vDeptcode + ''' ';

     DataModule_Tmax.Csel_SQL := Sql;
     DataModule_Tmax.Csel_Open4;
     Pa_deptna3.TextCaption  := DataModule_Tmax.Csel_gfd4(1);
   end;
end;

// 관리직 자료 읽기
procedure TMainForm.Read_pehreaim_det;
var
  SqlText,sql : string;
begin
//  Try
   with DM.DBSet1 do
   begin
      SqlText := 'SELECT NVL(TO_CHAR(SEQNO),''0''), NVL(PROPELTASK,''''), NVL(TO_CHAR(MAINWEIGHT),''0''),             '+
                 '       NVL(DETAILTASK1,''''), NVL(DETAILTASK2,''''), NVL(DETAILTASK3,''''),                         '+
                 '       NVL(DETAILTASK4,''''), NVL(DETAILTASK5,''''), NVL(TO_CHAR(DETAILWEIGHT1  ),''0''),           '+
                 '       NVL(TO_CHAR(DETAILWEIGHT2  ),''0''), NVL(TO_CHAR(DETAILWEIGHT3  ),''0''),                    '+
                 '       NVL(TO_CHAR(DETAILWEIGHT4  ),''0''), NVL(TO_CHAR(DETAILWEIGHT5  ),''0''),                    '+
                 '       NVL(VALIDX1,''''), NVL(VALIDX2,''''), NVL(VALIDX3,''''), NVL(VALIDX4,''''),                  '+
                 '       NVL(VALIDX5,''''), NVL(VALFUNCTION1,''''), NVL(VALFUNCTION2,''''), NVL(VALFUNCTION3,''''),   '+
                 '       NVL(VALFUNCTION4,''''), NVL(VALFUNCTION5,''''), NVL(SRESULTCLASS1,''''),                     '+
                 '       NVL(ARESULTCLASS1,''''), NVL(BRESULTCLASS1,''''), NVL(CRESULTCLASS1,''''),                   '+
                 '       NVL(DRESULTCLASS1,''''), NVL(SRESULTCLASS2,''''), NVL(ARESULTCLASS2,''''),                   '+
                 '       NVL(BRESULTCLASS2,''''), NVL(CRESULTCLASS2,''''), NVL(DRESULTCLASS2,''''),                   '+
                 '       NVL(SRESULTCLASS3,''''), NVL(ARESULTCLASS3,''''), NVL(BRESULTCLASS3,''''),                   '+
                 '       NVL(CRESULTCLASS3,''''), NVL(DRESULTCLASS3,''''), NVL(SRESULTCLASS4,''''),                   '+
                 '       NVL(ARESULTCLASS4,''''), NVL(BRESULTCLASS4,''''), NVL(CRESULTCLASS4,''''),                   '+
                 '       NVL(DRESULTCLASS4,''''), NVL(SRESULTCLASS5,''''), NVL(ARESULTCLASS5,''''),                   '+
                 '       NVL(BRESULTCLASS5,''''), NVL(CRESULTCLASS5,''''), NVL(DRESULTCLASS5,''''),                   '+
                 '       NVL(E1PRJOPINON  ,''''), NVL(KORNAME,''''), NVL(EMPNO,''''), NVL(RPRJCONYN,''''),            '+
                 '       NVL(RPRJCONDATE,''''), NVL(E1EMPNO,''''), NVL(E1PRJCONYN,''''), NVL(E1PRJCONDATE,''''),      '+
                 '       NVL(E1PRJVIEW,''''), NVL(E1PRJOBJYN,''''), NVL(EBREMPNO,''''), NVL(EBRPRJCONYN,''''),        '+
                 '       NVL(EBRPRJCONDATE,''''), NVL(EBRPRJVIEW,''''), NVL(EBRVALOBJYN,''''), NVL(E2EMPNO,''''),     '+
                 '       NVL(E2PRJCONYN,''''), NVL(E2PRJCONDATE,''''), NVL(E2PRJVIEW,''''), NVL(E2VALOBJYN,'''')      '+
                 '  FROM (                                                                                            '+
                 '        SELECT B.SEQNO,B.PROPELTASK, B.MAINWEIGHT,                                                  '+
                 '               B.DETAILTASK1, B.DETAILTASK2, B.DETAILTASK3, B.DETAILTASK4, B.DETAILTASK5,           '+
                 '               B.DETAILWEIGHT1, B.DETAILWEIGHT2, B.DETAILWEIGHT3, B.DETAILWEIGHT4, B.DETAILWEIGHT5, '+
                 '               B.VALIDX1, B.VALIDX2, B.VALIDX3, B.VALIDX4, B.VALIDX5,                               '+
                 '               B.VALFUNCTION1, B.VALFUNCTION2, B.VALFUNCTION3, B.VALFUNCTION4, B.VALFUNCTION5,      '+
                 '               B.SRESULTCLASS1, B.ARESULTCLASS1, B.BRESULTCLASS1, B.CRESULTCLASS1, B.DRESULTCLASS1, '+
                 '               B.SRESULTCLASS2, B.ARESULTCLASS2, B.BRESULTCLASS2, B.CRESULTCLASS2, B.DRESULTCLASS2, '+
                 '               B.SRESULTCLASS3, B.ARESULTCLASS3, B.BRESULTCLASS3, B.CRESULTCLASS3, B.DRESULTCLASS3, '+
                 '               B.SRESULTCLASS4, B.ARESULTCLASS4, B.BRESULTCLASS4, B.CRESULTCLASS4, B.DRESULTCLASS4, '+
                 '               B.SRESULTCLASS5, B.ARESULTCLASS5, B.BRESULTCLASS5, B.CRESULTCLASS5, B.DRESULTCLASS5, '+
                 '               B.E1PRJOPINON,  A.KORNAME, A.EMPNO, A.RPRJCONYN,A.RPRJCONDATE,                       '+
                 '               A.E1EMPNO,A.E1PRJCONYN,A.E1PRJCONDATE,A.E1PRJVIEW,A.E1PRJOBJYN,                      '+
                 '               A.EBREMPNO,A.EBRPRJCONYN,A.EBRPRJCONDATE,A.EBRPRJVIEW,A.EBRVALOBJYN,                 '+
                 '               A.E2EMPNO,A.E2PRJCONYN,A.E2PRJCONDATE,A.E2PRJVIEW,A.E2VALOBJYN                       '+
                 '          FROM PEHREMAS A, PEHREAIM_DET B                                                           '+
                 '         WHERE A.RABASDATE = ''' + LRABASDATE + '''                                                 '+
                 '           AND A.EMPNO     = ''' + ED_EMPNO.LABELHINT + '''                                         '+
                 '           AND A.RABASDATE = B.RABASDATE                                                            '+
                 '           AND A.EMPNO     = B.EMPNO                                                                '+
                 '         )                                                                                          '+
                 ' ORDER BY SEQNO                                                                                     ';

      Db_propeltask.DataField := 'PROPELTASK';     //중점 추진활동
      Db_forweight.DataField  := 'MAINWEIGHT';     //비중
      Db_plan1.DataField      := 'DETAILTASK1';    //세부 추진활동
      Db_plan2.DataField      := 'DETAILTASK2';
      Db_plan3.DataField      := 'DETAILTASK3';
      Db_plan4.DataField      := 'DETAILTASK4';
      Db_plan5.DataField      := 'DETAILTASK5';
      Db_deweight1.DataField  := 'DETAILWEIGHT1';  //상세비중
      Db_deweight2.DataField  := 'DETAILWEIGHT2';
      Db_deweight3.DataField  := 'DETAILWEIGHT3';
      Db_deweight4.DataField  := 'DETAILWEIGHT4';
      Db_deweight5.DataField  := 'DETAILWEIGHT5';
      Db_validx1.DataField    := 'VALIDX1';        //평가 지표
      Db_validx2.DataField    := 'VALIDX2';
      Db_validx3.DataField    := 'VALIDX3';
      Db_validx4.DataField    := 'VALIDX4';
      Db_validx5.DataField    := 'VALIDX5';
      Db_foraim1.DataField    := 'VALFUNCTION1';   //평가산식
      Db_foraim2.DataField    := 'VALFUNCTION2';
      Db_foraim3.DataField    := 'VALFUNCTION3';
      Db_foraim4.DataField    := 'VALFUNCTION4';
      Db_foraim5.DataField    := 'VALFUNCTION5';
      DB_s1.DataField         := 'BRESULTCLASS1';           //달성목표
      DB_a1.DataField         := 'BRESULTCLASS2';
      DB_b1.DataField         := 'BRESULTCLASS3';
      DB_c1.DataField         := 'BRESULTCLASS4';
      DB_d1.DataField         := 'BRESULTCLASS5';

      Close;
      ServiceName := 'PEA1060A_sel2';
      ClearFieldInfo;
      ClearParamInfo;
      AddField('SEQNO'              , ftString, 2  );
      AddField('PROPELTASK'         , ftString, 100 );
      AddField('MAINWEIGHT'         , ftString, 3 );
      AddField('DETAILTASK1'        , ftString, 100);
      AddField('DETAILTASK2'        , ftString, 100 );
      AddField('DETAILTASK3'        , ftString, 100 );
      AddField('DETAILTASK4'        , ftString, 100 );
      AddField('DETAILTASK5'        , ftString, 100 );
      AddField('DETAILWEIGHT1'      , ftString, 3 );
      AddField('DETAILWEIGHT2'      , ftString, 3 );
      AddField('DETAILWEIGHT3'      , ftString, 3 );
      AddField('DETAILWEIGHT4'      , ftString, 3 );
      AddField('DETAILWEIGHT5'      , ftString, 3 );
      AddField('VALIDX1'            , ftString, 100 );
      AddField('VALIDX2'            , ftString, 100 );
      AddField('VALIDX3'            , ftString, 100 );
      AddField('VALIDX4'            , ftString, 100 );
      AddField('VALIDX5'            , ftString, 100 );
      AddField('VALFUNCTION1'       , ftString, 100 );
      AddField('VALFUNCTION2'       , ftString, 100 );
      AddField('VALFUNCTION3'       , ftString, 100 );
      AddField('VALFUNCTION4'       , ftString, 100 );
      AddField('VALFUNCTION5'       , ftString, 100 );
      AddField('SRESULTCLASS1'      , ftString, 100 );
      AddField('ARESULTCLASS1'      , ftString, 100 );
      AddField('BRESULTCLASS1'      , ftString, 100 );
      AddField('CRESULTCLASS1'      , ftString, 100 );
      AddField('DRESULTCLASS1'      , ftString, 100 );
      AddField('SRESULTCLASS2'      , ftString, 100 );
      AddField('ARESULTCLASS2'      , ftString, 100 );
      AddField('BRESULTCLASS2'      , ftString, 100 );
      AddField('CRESULTCLASS2'      , ftString, 100 );
      AddField('DRESULTCLASS2'      , ftString, 100 );
      AddField('SRESULTCLASS3'      , ftString, 100 );
      AddField('ARESULTCLASS3'      , ftString, 100 );
      AddField('BRESULTCLASS3'      , ftString, 100 );
      AddField('CRESULTCLASS3'      , ftString, 100 );
      AddField('DRESULTCLASS3'      , ftString, 100 );
      AddField('SRESULTCLASS4'      , ftString, 100 );
      AddField('ARESULTCLASS4'      , ftString, 100 );
      AddField('BRESULTCLASS4'      , ftString, 100 );
      AddField('CRESULTCLASS4'      , ftString, 100 );
      AddField('DRESULTCLASS4'      , ftString, 100 );
      AddField('SRESULTCLASS5'      , ftString, 100 );
      AddField('ARESULTCLASS5'      , ftString, 100 );
      AddField('BRESULTCLASS5'      , ftString, 100 );
      AddField('CRESULTCLASS5'      , ftString, 100 );
      AddField('DRESULTCLASS5'      , ftString, 100 );
      AddField('E1PRJOPINON'        , ftString, 200 );
      AddField('KORNAME'            , ftString, 12 );
      AddField('EMPNO'              , ftString, 4  );
      AddField('RPRJCONYN'          , ftString, 1  );
      AddField('RPRJCONDATE'        , ftString, 8  );
      AddField('E1EMPNO'            , ftString, 4  );
      AddField('E1PRJCONYN'         , ftString, 1  );
      AddField('E1PRJCONDATE'       , ftString, 8  );
      AddField('E1PRJVIEW'          , ftString, 200);
      AddField('E1VALOBJYN'         , ftString, 1  );
      AddField('EBREMPNO'           , ftString, 4  );
      AddField('EBRPRJCONYN'        , ftString, 1  );
      AddField('EBRPRJCONDATE'      , ftString, 8  );
      AddField('EBRPRJVIEW'         , ftString, 200);
      AddField('EBRVALOBJYN'        , ftString, 1  );
      AddField('E2EMPNO'            , ftString, 4  );
      AddField('E2PRJCONYN'         , ftString, 1  );
      AddField('E2PRJCONDATE'       , ftString, 8  );
      AddField('E2PRJVIEW'          , ftString, 200);
      AddField('E2VALOBJYN'         , ftString, 1  );
      SQL.Text := Sqltext;
      Open;

      if RecordCount > 0 then
      begin
         ed_seqno_chk.Text := Trim(DM.DBSet1.FieldByName('SEQNO').AsString);
         //mo_e1prjopinon.Text := Trim(DM.DBSet1.FieldByName('E1PRJOPINON').AsString);
      end;

      if (Dm.DbSet1.FieldByName('rprjconyn').AsString <> 'Y')  then
          Bt_Prod.Enabled := True
      else
          Bt_Prod.Enabled := False;
      //seqno와 팀장면담내용은 무조건 첫번째 row값에 설정하고 첫번째 row값에 있는 내용을 select한다.
   end;

   //전체 비중 합계
   Sql := 'select sum(mainweight) from PEHREAIM_DET'+
   format(' WHERE rabasdate=''%s'' and empno = ''%s'' ',[Lrabasdate,Ed_empno.LabelHint]);

   DataModule_Tmax.Csel_SQL := Sql;
   DataModule_Tmax.Csel_Open4;
   g_mainweight     := DataModule_Tmax.Csel_gfd4(1);
   if g_mainweight = '' then
      g_mainweight := '0';

   Eda_weight.value := StrToInt(g_mainweight);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  sMsg,  tmp : string;
begin
  //운영
  sMsg := DataModule_Tmax.Connect_Session;

  if sMsg <> '' then
  begin
    Application.MessageBox(PChar(msg),'TMAX에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  Start := True;

  VarLoading;
end;

procedure TMainForm.FormPaint(Sender: TObject);
const
 ObjName = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
var
  msg: String;
  str : string;
  SqlText : String;
  fName: TextFile;
  reg_exe: TRegistry;

  Process32: TProcessEntry32;
  SHandle:   THandle;
  Next:      BOOL;

  hProcess: THandle;
  ProcId:   DWORD;
  TermSucc: BOOL;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  if Start then
  begin
    pEmpno     := peParam(CmdLine,1);
    pKorname   := peParam(CmdLine,2);
    pPass      := peParam(CmdLine,3);
    pClass     := peParam(CmdLine,4);
    ComIp      := peParam(Cmdline,5);
    SRabasDate := peParam(Cmdline,13);
    ComIP      := Copy(ComIP,2,Length(ComIP)-1);

    //PEA1060E.EXE가 떠있는지 체크 한 후 프로세스가 떠 있으면  프로세스 강제 종료 시킨다.
    ListBox1.Clear;
    Process32.dwSize := SizeOf(TProcessEntry32);
    SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if Process32First(SHandle, Process32) then
    begin
       repeat
       Next := Process32Next(SHandle, Process32);
       if Next then
       begin
          if Process32.szExeFile = trim('PEA1060E.EXE') then
             ListBox1.Items.AddObject(Process32.szExeFile, TObject(Process32.th32ProcessID));
       end;
       until not Next;
    end;
    CloseHandle(SHandle);

    if ListBox1.Items.Count = 1 then
    begin
       ProcId   := DWORD(ListBox1.Items.Objects[0]);
       hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
       TermSucc := TerminateProcess(hProcess, 0);
    end;
    // PROCESS 강제종료 끝

    Application.Title  := '개인별 업무목표 등록/결재';
    Lrabasdate := GetBaseYear(1);            //업적평가 기준일

    if  SRabasDate = GetBaseYear(0) then
    begin
        Lrabasdate := SRabasDate;
    end else if   SRabasDate = GetBaseYear(7) then
    begin
        Lrabasdate := SRabasDate;
    end;

    Lfordate   := GetBaseYear(2);            //하반기 업적평가 시작일(LFordate)
    Lsysdate   := Copy(GetBaseYear(3),1,8);  //시스템 시각(Lsysdate)

    if Lrabasdate = '' then
    begin
      Close;
    end;

    if Copy(Lrabasdate,1,4) < '2011' Then
      Bt_Prod.Caption := '생산성 향상 과제 등록'
    else
      Bt_Prod.Caption := 'SUPEX 일상화 추구과제 등록';

    SqlText := 'select Value1||'';''||Value2||'';''||Value3||'';''||Value4||'';''|| '+
               '       NVL(Value5, ''ZZZZ'')||'';''||NVL(Value6, ''ZZZZ'')||'';''|| '+
               '       NVL(Value7, ''ZZZZ'')||'';''||NVL(Value8, ''ZZZZ'')||'';''|| '+
               '       NVL(Value9, ''ZZZZ'')||'';''||NVL(Value10,''ZZZZ'')          '+
               '  from peactbas a                                                   '+
               ' WHERE a.rabasyy = '''+Copy(Lrabasdate,1,4)+'''                     '+
               '   AND a.gubun   = ''01''                                           '+
               '   AND a.sgubun  = ''0001''                                         ';
    DataModule_Tmax.Csel_SQL := SqlText;
    DataModule_Tmax.Csel_Open4;
    payrafrom := DataModule_Tmax.Csel_gfd4(1);
    payrato   := DataModule_Tmax.Csel_gfd4(2);
    objemp1   := DataModule_Tmax.Csel_gfd4(3);
    objemp2   := DataModule_Tmax.Csel_gfd4(4);
    excemp1   := DataModule_Tmax.Csel_gfd4(5);
    excemp2   := DataModule_Tmax.Csel_gfd4(6);
    excemp3   := DataModule_Tmax.Csel_gfd4(7);
    excemp4   := DataModule_Tmax.Csel_gfd4(8);
    excemp5   := DataModule_Tmax.Csel_gfd4(9);
    excemp6   := DataModule_Tmax.Csel_gfd4(10);

    // 1차평가자 최종결재 및 결재시 이력보관
    gsLastConEv:= '1차';//trim(GetBaseYear(4)); //업무목표최종결재자 (1차 or 2차)

    Ed_empno.LabelHint := Pempno;

    GetPehremas('읽기') ;

    if GetPehremas('추출') = '없음' then
    begin
      MessageDlg('목표설정 대상자가 아니거나 평가권한이 없습니다.'+#13#13+
                 GetBaseYear(6)+'에 문의하십시오.',mtInformation,[mbOK],0);
      Close;
    end
    else
    begin
      if GetPehremas('구분') <> '없음' then
      begin
        GetPehremas('읽기');
        EvalYN := True;
        Select_Form(Bt_Tgt);

        //피평가자가 아닐경우
        //팀장면담보기 비활성화 시킨다.
        pob_e1prjopinon.Visible := false;
        if  SRabasDate <> GetBaseYear(0) then
        begin
            //화일체크 결재할 피평가자 사번화일 체크
            if not FileExists(GetHomeDir +'\IDCheck1.txt') then
            begin
               showmessage('file road error가 발생했습니다.');
               exit;
            end;

            AssignFile(fName, GetHomeDir +'\IDCheck1.txt');

            Reset(fName);
            while not eof(fName) do
            begin
               readln(fName, str);
               if length(str) = 4 then
               begin
                  Ed_empno.LabelHint :=  str;
               end;
            end;
            CloseFile(fName);
            Bt_TgtClick( Bt_Tgt );
            ed_empno.RightBtn.Width := 24;
        end
        else
        begin
            Bt_TgtClick( Bt_Tgt );
            ed_empno.RightBtn.Width := 0;
        end;

        if Trim(Ed_empno.Text) = '' then Ed_empnoRightBtnClick(Sender);
      end
      else
      begin
        Bt_TgtClick(Bt_Tgt);
        EvalYN := False;
        //피평가자일경우
        //팀장면담보기 활성화 시킨다.
        ed_empno.RightBtn.Width := 0;
        if  SRabasDate = GetBaseYear(0) then
        begin
            pob_e1prjopinon.Visible := false;    //전년도 조회일 경우 팀장면담보기 비활성화
            Bt_Detail.Visible       := false;
        end
        else
        begin
            pob_e1prjopinon.Visible := true;
            Bt_Detail.Visible       := true;
        end;
      end;
    end;

    //직종및 직무명을 설정한다.
    //기존
    {SqlText := ' SELECT B.DUTYKINDNAME||'';''||C.DUTYNAME '+
                 ' FROM PISHRCURR A, PISHRDUKIND B, PISHRDUTY C '+
                ' WHERE A.EMPNO = ''' + Ed_empno.LabelHint + ''' '+
                  ' AND A.JOBFIELD = B.JOBFIELD '+
                  ' AND A.DUTYKIND = B.DUTYKIND '+
                  ' AND A.JOBFIELD = C.JOBFIELD '+
                  ' AND A.DUTYKIND = C.DUTYKIND '+
                  ' AND A.DUTY     = C.DUTY '+
                  ' AND B.USEYN = ''Y'' '+
                  ' AND C.USEYN = ''Y'' ';}

    //하은영 2006.11.28
    SqlText :=  ' SELECT B.DUTYKINDNAME           '+
                ' FROM PEHREMAS A, PISHRDUKIND B  '+
                ' WHERE a.rabasdate  =  ''' + Lrabasdate + ''' '+ //  '+
                ' AND a.jobgun     = B.jobfield   '+
                ' AND a.jobkind    = b.dutykind   '+
                ' AND A.EMPNO = ''' + Ed_empno.LabelHint + ''' '+
                ' AND B.USEYN = ''Y'' ';


    with DBSet10 do
    begin
      close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then
      begin
         pa_DUTYKINDNAME.TextCaption  := Csel_gfd10(1);
         //pa_DUTYNAME.TextCaption      := Csel_gfd10(2);
         close;
      end
      else
      begin
         //db세션을 끊는다.
         Close;
      end;
    end;

    Start := False;
  end;
end;

//조회 버튼
procedure TMainForm.Bt_SrhClick(Sender: TObject);
var
  DbSet : TDataSet;

  // 버튼 활성화 프로시져
  procedure ButtonEnabled;
  begin
    if DBSet.Eof then
    begin
        Bt_Mod.Enabled       := False;
        Bt_Del.Enabled       := False;
    end
    else
    begin
        Bt_Mod.Enabled       := True;
        Bt_Del.Enabled       := True;
    end;

    Bt_Add.Enabled     := True;

    // 자료가 없으면 자세히보기 & 수정 버튼 비활성화
    if DBSet.Bof AND DbSet.Eof then
    begin
       Bt_Detail.Enabled := False;
       Bt_Mod.Enabled    := False;
    end
    else
    begin
       Bt_Detail.Enabled := True;
       Bt_Mod.Enabled    := True;
    end;

    //====================================================================================================//
    // 평가진행중이면 수정,추가,삭제 불가능처리
    // rvalconyn 피평자가 평가완료여부
    // e1valconyn 1차평가자 평가 완료 여부
    // e1valobjyn 1차평가자 평가반려여부
    // e2valconyn 2차평가자 평가 완료 여부
    // e2valobjyn 2차평가자 평가반려여부
    if (grvalconyn  = 'Y')  or
       (ge1valconyn = 'Y')  or //(ge1valobjyn = 'Y') or  //1차평가자 반려시 수정가능토록 막음 dsa2000  2007.11.
       (ge2valconyn = 'Y')  or (ge2valobjyn = 'Y') or
       (gebrvalconyn = 'Y') or (gebrvalobjyn = 'Y')  then
    begin
      Bt_Mod.Enabled := false;
      Bt_Add.Enabled := false;
      Bt_del.Enabled := false;
    end;
  end;
begin
  Lwork := GetPehremas('읽기');
  {
  // ===============================================================================
  //   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
  //   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
  // ===============================================================================
  if (Pempno = Le2empno) or                          // 작업자가 2차평가자
     ((Pempno = Le1empno) and (Le2empno = '')) then  // 2차평가자가 없고 작업자가 1차평가자
      Bt_Confirm.Caption := '결재'
  else
      Bt_Confirm.Caption := '결재상신';
  }

  if gsLastConEv = '2차' then //업무목표최종결재자가 2차인경우
  begin
    if (Pempno = Le2empno) or                          // 작업자가 2차평가자
       ((Pempno = Le1empno) and (Le2empno = '')) then  // 2차평가자가 없고 작업자가 1차평가자
    begin
        Bt_Confirm.Caption := '결재';
        Bt_ReConfirm.Enabled := False;
    end
    else
        Bt_Confirm.Caption := '결재상신';
  end
  else //업무목표최종결재자가 1차인경우
  begin
    if (Pempno = Le2empno) or (Pempno = Le1empno) or (Pempno = Lebrempno) then
    begin
        Bt_Confirm.Caption := '결재';
        P_Title.Caption := '개 인 별 업 무 목 표  결 재';
        Bt_ReConfirm.Enabled := False;
    end
    else
    begin
        Bt_Confirm.Caption := '결재상신';
        P_Title.Caption := '개 인 별 업 무 목 표  등 록';
    end;
  end;
  Application.ProcessMessages;

  {
  if (Pa_jobgun.Hint = '10') and (Pa_jobgun.Hint = '40') then
  begin
    Nt_Book.ActivePage := '관리직';
    Grid1.SetFocus;
  end;


  if Pa_jobgun.Hint > '44' then
  begin
    MessageDlg('목표설정대상자가 아닙니다.',mtInformation,[mbOK],0);
    Ed_empno.SetFocus;
    System.Exit;
  end;
  }

  St_Help.Panels[0].Text := ' 조회 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);

  if Nt_Book.ActivePage = '관리직' then
  begin
    Read_pehreaim_det;
    DbSet := DM.DBSet1;
  end;

  if  (((Pa_payra.Hint >= payrafrom) and (Pa_payra.Hint <= payrato)) or
      ((Ed_empno.LabelHint =  objemp1) or  (Ed_empno.LabelHint =  objemp2))) And
      ((Ed_empno.LabelHint <> excemp1) And (Ed_empno.LabelHint <> excemp2) And
       (Ed_empno.LabelHint <> excemp3) And (Ed_empno.LabelHint <> excemp4) And
       (Ed_empno.LabelHint <> excemp5) And (Ed_empno.LabelHint <> excemp6)) then //팀장이면
  begin
      Bt_Prod.Visible :=  True;
  end
  else
      Bt_Prod.Visible := False;

  St_Help.Panels[0].Text := '';

  // 자료열람 권한 부분.
  if Nt_Book.ActivePage <> '자기계발' then
  begin
    // 피평가자 일때, 동료의 목표면담을 볼때 수정, 저장, 삭제 , 결재버튼 비 활성화
    if (( not EvalYN ) and (Pempno <> Ed_empno.LabelHint)) then
    begin
      Bt_Mod.Enabled:=false;
      Bt_Add.Enabled:=false;
      Bt_del.Enabled:=false;
      Bt_Confirm.Enabled:=false;
    end;

    //임시막음.. 처리로직이 무지 이상함.
    //1차반려처리할 경우 e1prjobjyn = 'Y', rprjconyn = 'X',  rprjcondate = ''이 되는데..
    //여기서 DBSet.FieldByName('e1valobjyn')이 e1prjobjyn 임
    //1차반려처리를 하면 무조건 아래 로직을 타게되어 추가,수정, 삭제,결재상신 처리를 할수 없다는
    //메세지가 나옴.
    //어디서부터 잘못되어 있는지 막막함.~~~
    
    {
    // 1.09      2004.11.11          이민용         by 손필영 요청   평가 등록 종료로 메세지 수정
    // 피평가자 이고, 자기평가를 하지 않았고, 1차 결재자가 반려한 경우
    if (( not EvalYN ) and (DbSet.FieldByName('rprjconyn').AsString = 'X') and (DBSet.FieldByName('e1valobjyn').AsString <>'N')) then
    begin
      //showmessage('aa');
      MessageDlg('1차 평가자가 반려한 자료입니다.'#13#13+
                 '목표등록 기간이 종료되었습니다.'#13#13+
                 '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                 '문의하십시오. ☏ 6266-4482 ',mtInformation,[mbOK],0);
      Bt_Detail.Enabled:=true;
      Bt_Mod.Enabled:=false;
      Bt_Add.Enabled:=false;
      Bt_del.Enabled:=false;
      Bt_Confirm.Enabled:=false;
      System.exit;
    end  //피평가자 이고, 자기평가를 하지 않았고, 1차 결재자가 반려하지 않은 경우 not EvalYN은 피평가자...
    else if  (( not EvalYN ) and (DbSet.FieldByName('rprjconyn').AsString = 'X') and (DBSet.FieldByName('e1valobjyn').AsString <>'Y')) then
    begin
      //showmessage('bb');
      MessageDlg('결재 상신을 하지 않은 자료입니다.'#13#13+
                 '목표등록 기간이 종료되었습니다.'#13#13+
                 '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                 '문의하십시오. ☏ 6266-4482 ',mtInformation,[mbOK],0);
      Bt_Detail.Enabled:=true;
      Bt_Mod.Enabled:=false;
      Bt_Add.Enabled:=false;
      Bt_del.Enabled:=false;
      Bt_Confirm.Enabled:=false;
      System.exit;
    end;
    }

    //피평가자 일때
    if ( not EvalYN ) and (Pempno <> Ed_empno.LabelHint) and       // 접속자가 피평가자가 아니고
       (DbSet.FieldByName('e1prjconyn').AsString <> 'Y') then
    begin
      DbSet.Close;
      MessageDlg('아직 피평가자가 목표설정완료가 아닙니다.'#13#13+
                 '목표설정 완료후 조회 하시기 바랍니다.',mtInformation,[mbOK],0);
      System.Exit;
    end;

    //평가자 일때
    if ( EvalYN ) and (Pempno <> Ed_empno.LabelHint) and       // 접속자가 피평가자가 아니고
       (DbSet.FieldByName('rprjconyn').AsString <> 'Y') then   // 피평가자가 목표수립중인 경우
    begin
      DbSet.Close;
      MessageDlg('아직 피평가자가 목표설정중입니다.'#13#13+
                 '목표설정 완료후 작업 하시기 바랍니다.',mtInformation,[mbOK],0);
      System.Exit;
    end;

    if (Lwork = '2차') and                                     //접속자가 2차 평가자이고
       (DbSet.FieldByName('e1prjconyn').AsString <> 'Y') then  //1차평가자가 목표확인한경우   <== 요부분도 이상함.
                                                               //e1prjconyn이  'Y'가 아닌 경우는 1차평가자가 결재처리 하지 않았거나
                                                               //2차평가자가 반려한 경우인데 .. 요기 도큐맨트는 목표확인한 경우로 되어있어 혼란스러움.
    begin
      DbSet.Close;
      MessageDlg('아직 1차 평가자 확인중입니다.'#13#13+
                 '1차 평가자 확인 완료후 작업 하시기 바랍니다.',mtInformation,[mbOK],0);
      System.Exit;
    end;
  end;

  // 버턴사용권한 부분.
  Bt_Detail.Enabled := True;                                 //자세히 보기 활성
{
  // ===============================================================================
  //   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
  //   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
  // ===============================================================================
  //    if (Lwork = '2차') and (DbSet.FieldByName('e2valobjyn').AsString = 'Y') then
  //      begin
  //        MessageDlg('2차 평가자가 반려한 자료입니다.',mtInformation,[mbOK],0);
  //        System.Exit;
  //      end;
  //    if (Lwork = '2차') and (DbSet.FieldByName('e2prjconyn').AsString = 'Y') then
  //      begin
  //        MessageDlg('이미 확인완료한 자료입니다.'#13#13+
  //                   '수정하실 수 없습니다.',mtInformation,[mbOK],0);
  //        System.Exit;
  //      end;
  //
  //    if (Lwork = '2차') and (DbSet.FieldByName('e2prjconyn').AsString = 'N') then
  //      begin
  //        Bt_Confirm.Enabled := True;
  //        Bt_Opt.Enabled := True;
  //        Bt_Can.Enabled := True;
  //      end;
}

// ---> 업무목표최종결재자가 1차인경우 경우 2차결재자 반려, 확인완료 여부도 1차와 같이 갱신 됨.
  if (Lwork = '2차') and                                        //작업자가 2차 평가자이고
     (DbSet.FieldByName('e2valobjyn').AsString = 'Y') then      //2차평가자가 평가반려한 경우
  begin
    MessageDlg(gsLastConEv + ' 평가자가 반려한 자료입니다.',mtInformation,[mbOK],0);
    System.Exit;
  end;

  if (Lwork = '2차') and                                        //작업자가 2차평가자이고
     (DbSet.FieldByName('e2prjconyn').AsString = 'Y') then      //2차평가자가 목표확인 한경우
  begin
    System.Exit;
  end;

  if (Lwork = '2차') and                                       //작업자가 2차평가자이고
     (DbSet.FieldByName('e2prjconyn').AsString = 'N') then     //2차평가자가 목표확인을 아직 안한 경우
  begin
    Bt_Confirm.Enabled := (gsLastConEv = '2차');
    Bt_Opt.Enabled     := (gsLastConEv = '2차');
    Bt_Can.Enabled     := (gsLastConEv = '2차');
    System.Exit;
  end;

  if (Lwork = '1차') and                                     //작업자가 1차평가자이고
      start  and          // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
     (DbSet.FieldByName('e1valobjyn').AsString = 'Y') then   //1차평가자가 평가반려 한경우
  begin
    MessageDlg('1차 평가자가 반려한 자료입니다.',mtInformation,[mbOK],0);
    System.Exit;
  end;

  if (Lwork = '1차') and                                     //작업자가 1차평가자이고
     (DbSet.FieldByName('e1prjconyn').AsString = 'Y') then   //1차평가자가 목표확인한 경우
  begin
    System.Exit;
  end;

  if (Lwork = '1차') and                                     //작업자가 1차평가자이고
     (DbSet.FieldByName('e1prjconyn').AsString = 'N') then   //1차평가자가 목표확인을 아직 안한 경우
  begin
    Bt_Confirm.Enabled := True;
    Bt_Opt.Enabled     := True;
    Bt_Can.Enabled     := True;
    System.Exit;
  end;

  if (Lwork = '피평가자') and                                     //작업자가 피평가자이고
      start  and          // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
     (DbSet.FieldByName('e1valobjyn').AsString = 'Y') then   //1차평가자가 평가반려 한경우
  begin
    MessageDlg('1차 평가자가 반려한 자료입니다.',mtInformation,[mbOK],0);
        ButtonEnabled;
        Bt_Confirm.Enabled := True;
        System.Exit;
  end;

  if (Lwork = '피평가자') then
  begin
    if gsLastConEv = '2차' then //업무목표최종결재자가 2차인경우
    begin
      if (DBSet.FieldByName('rprjconyn').AsString = 'Y') and
         (DBSet.FieldByName('e1prjconyn').AsString = 'Y') and
         (DBSet.FieldByName('e2prjconyn').AsString = 'Y') and
          start   and        // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
         (DBSet.FieldByName('e2empno').AsString <> '') then // 결재된 자료의 수정임다.
      begin
        MessageDlg('결재상신한 목표에 대하여 결재된 자료입니다.'#13#13+
                 //  '목표등록 기간이 종료되었습니다.'#13#13+
                   '추가, 수정, 삭제, 결재상신을 할수 없습니다.'
                   ,mtInformation,[mbOK],0);
        ButtonEnabled;                  //평가 진행중이면 추가,입력,삭제 못하고 아닌경우 할수 있다
        Bt_Mod.Enabled := false;
        Bt_Add.Enabled := false;
        Bt_del.Enabled := false;
        Bt_Confirm.Enabled := false;
      end
      else if (DBSet.FieldByName('rprjconyn').AsString = 'Y') and
              (DBSet.FieldByName('e1prjconyn').AsString = 'N') then //1차평가자가 목표확인 중이면
      begin
        ButtonEnabled;                  //평가 진행중이면 추가,입력,삭제 못하고 아닌경우 할수 있다
        Bt_Confirm.Enabled := False;
        System.Exit;
      end
      else if (DBSet.FieldByName('rprjconyn').AsString = 'Y')         //2차평가자가 있고
              and (DBSet.FieldByName('e2prjconyn').AsString = 'N')    //2차평가자가 확인중이면
              and start            // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
              and (DBSet.FieldByName('e2empno').AsString <> '') then
      begin
        MessageDlg('결재상신한 목표에 대하여 1차 평가자가 결재하고'+#13+
                   '2차평가자가 확인하지 않았습니다.'+#13#13+
                   '상위 평가자의 확인 완료 후 작업 하시기 바랍니다.',mtInformation,[mbOK],0);
        ButtonEnabled;                  //평가 진행중이면 추가,입력,삭제 못하고 아닌경우 할수 있다
        Bt_Confirm.Enabled := False;
        System.Exit;
      end
      else //if (DBSet.FieldByName('rprjconyn').AsString = 'N') then
      begin
        ButtonEnabled;
        Bt_Confirm.Enabled := True;
      end;
    end
    else //업무목표최종결재자가 1차인경우
    begin
      if (DBSet.FieldByName('rprjconyn').AsString = 'Y')
         and start            // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
         and (DBSet.FieldByName('e1prjconyn').AsString = 'Y') then // 결재된 자료의 수정임다.
      begin
        MessageDlg('결재상신한 목표에 대하여 결재된 자료입니다.'#13#13+
             //      '목표등록 기간이 종료되었습니다.'#13#13+
                   '추가, 수정, 삭제, 결재상신을 할수 없습니다.'
                   ,mtInformation,[mbOK],0);
        ButtonEnabled;
        Bt_Mod.Enabled := false;
        Bt_Add.Enabled := false;
        Bt_del.Enabled := false;
        Bt_Confirm.Enabled := false;
        System.exit;
      end
      else if (DBSet.FieldByName('rprjconyn').AsString = 'Y') and start    // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
          and (DBSet.FieldByName('e1prjconyn').AsString = 'N') then // 결재된 자료의 수정임다.
      begin
         MessageDlg('1차 평가자 결재처리중입니다.'#13#13+
                    '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                    GetBaseYear(6)+'에 문의하십시오. ' ,mtInformation,[mbOK],0);
        ButtonEnabled;

        Bt_Mod.Enabled  := false;
        Bt_Add.Enabled  := false;
        Bt_del.Enabled  := false;
        Bt_PRod.Enabled := false;
        Bt_Confirm.Enabled := false;
        System.exit;
      end
      else if (DBSet.FieldByName('rprjconyn').AsString <> 'Y') then  //자기 목표 등록을 했을면 버튼 비 활성화
      begin
        ButtonEnabled;
        Bt_Confirm.Enabled := True;
      end;
    end;
  end;
  start := False;

  if DBSet.Eof then
    DbSet.close;
end;

procedure TMainForm.Ed_empnoEnter(Sender: TObject);
begin

 peInitComponent(Self,88);
  if Nt_Book.ActivePage = '관리직' then
     Grid1.DataSource.DataSet.Close;

  if Nt_Book.ActivePage = '영업직' then
     Grid2.DataSource.DataSet.Close;

  Bt_Mod.Enabled := False;
  Bt_Add.Enabled := False;
  Bt_Del.Enabled := False;
  Bt_Can.Enabled := False;
  Bt_Confirm.Enabled := False;
  Bt_Detail.Enabled  := False;

end;
 
procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = Chr(13) then
  begin
    Bt_TgtClick( Bt_Tgt );
    inherited;
    Key := #0;
    Start := True;
  end;

end;

procedure TMainForm.Grid2DblClick(Sender: TObject);
begin
  if Lwork = '피평가자' then
  begin
    if Bt_Mod.Enabled then
      Bt_ModClick(Bt_Mod);
  end
  else
  begin
    if Bt_Detail.Enabled then
      Bt_ModClick(Bt_Detail);
  end;
end;

//자세히 보기
procedure TMainForm.Bt_ModClick(Sender: TObject);
var
  Fm : TFm_SubForm;
  L_Seqno : Real;
begin

    if (Nt_Book.ActivePage = '관리직') and (TComponent(Sender).Tag = 1) then    //관리직 수정
       L_Seqno := Grid1.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '영업직') and (TComponent(Sender).Tag = 1) then    //영업직 수정
       L_Seqno := Grid2.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '자기계발') and (TComponent(Sender).Tag = 1) then  //자기계발 수정
       L_Seqno := Grid3.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if L_Seqno = 99 then
    begin
         Bt_PRodClick(Bt_PRod);
         System.Exit;
    end;
  Try
    Fm := TFm_SubForm.Create(Self);
    if TComponent(Sender).Tag in [1,2] then              //1:자세히보기, 수정  2: 추가
       Fm.Pwork := Nt_Book.ActivePage;                        //Pwork:관리직, 영업직, 자기계발

    if TComponent(Sender).Tag = 3 then                   //3:의견등록
       Fm.Pwork := '의견등록';                                //Pwork:의견등록

    if TComponent(Sender).Tag = 4 then                   //4: ?
       Fm.Pwork := '평가자지정';                              //pwork:평가자지정

    Fm.Pgubun     := TComponent(Sender).Tag;
    if TComponent(Sender).Name <> 'Bt_Detail' then
       Fm.Pework := Lwork
    else
       Fm.Pework := '자세히보기';

    if TComponent(Sender).Name = 'Bt_Detail' then         //자세히보기
    begin
      Fm.Bt_Mod.Enabled := False;
//      Fm.Bt_Del.Enabled := False;
//      Fm.SB_PriorDept.Enabled := True;
//      Fm.SB_NextDept.Enabled := True;
    end
    else if TComponent(Sender).Name = 'Bt_Mod' then       //수정
    begin
//      Fm.Bt_Add.Enabled := False;
//      Fm.SB_PriorDept.Enabled := True;
//      Fm.SB_NextDept.Enabled := True;
    end
    else if TComponent(Sender).Name = 'Bt_Add' then       //추가
    begin
//      Fm.Bt_Del.Enabled := False;
//      Fm.SB_PriorDept.Enabled := False;
//      Fm.SB_NextDept.Enabled := False;
    end
    else
    begin
//      Fm.Bt_Add.Enabled := True;
      Fm.Bt_Mod.Enabled := True;
//      Fm.Bt_Del.Enabled := True;
//      Fm.SB_PriorDept.Enabled := True;
//      Fm.SB_NextDept.Enabled := True;
    end;

    Fm.Lrabasdate := Lrabasdate;
    Fm.Lfordate   := Lfordate;
    Fm.gsLastConEv:= gsLastConEv;
    Fm.LSeqno     := 0;

    if (Nt_Book.ActivePage = '관리직') and (TComponent(Sender).Tag = 1) then    //관리직 수정
       Fm.LSeqno := Grid1.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '영업직') and (TComponent(Sender).Tag = 1) then    //영업직 수정
       Fm.LSeqno := Grid2.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '자기계발') and (TComponent(Sender).Tag = 1) then  //자기계발 수정
       Fm.LSeqno := Grid3.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '관리직') then
       Fm.DbSet := Grid1.DataSource.DataSet
    else if (Nt_Book.ActivePage = '영업직') then
       Fm.DbSet := Grid2.DataSource.DataSet
    else
       Fm.DbSet := Grid3.DataSource.DataSet;       //자기계발

    Fm.Lempno     := Ed_empno.LabelHint;
    Fm.Lwriteemp  := Pempno;
    Fm.ShowModal;

    Application.ProcessMessages;
    if (Fm.UpDateOk) or (Fm.prjview_UpDate) then
    begin
      Bt_SrhClick(Sender);
    end;
  Finally
    Fm.Free;
  End;
end;

procedure TMainForm.Bt_ConfirmClick(Sender: TObject);
var
  Lgubun     : integer;
  Param      : OleVariant;
  Save       : integer;    // 내역보관 유,무,이력보관(0, 1, 2)
  Msg        : string;
  DbSet      : TDataSet;
  ToMail     : string;
  detail_cnt :integer;
  sendtime   : String;
  SqlText    : string;
  sInFalg  : boolean;
begin
  if ((DM.DBSET1.Eof) and (DM.DBSET1.Bof)) then
  begin
   MessageDlg('데이터가 없습니다.', mtError, [mbOK], 0);
   System.Exit;
  end;

  //입력값 체크
  if not Check_Edit1 then
      System.Exit;

  //전체비중 합계
  if Eda_weight.Value <> 100 then
    begin
      MessageDlg('전체비중 합계가 100 이어야 합니다.',mtError, [mbOk], 0);
      System.Exit;
    end;

  //세부추진활동 2개이상이어야 한다.
  DM.DBSet1.First;
  detail_cnt := 0;
  while not DM.DBSet1.Eof do
    begin                                                        
      if Trim(DM.DBSet1.FieldByName('detailtask1').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask2').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask3').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask4').AsString)  <> '' then
         inc(detail_cnt);

      if Trim(DM.DBSet1.FieldByName('detailtask5').AsString)  <> '' then
         inc(detail_cnt);

      DM.DBSet1.Next;
    end;
  if detail_cnt < 2 then
    begin
      MessageDlg('세부추진 활동이 2개 이상이어야 합니다.',mtError, [mbOk], 0);
      System.Exit;
    end;

  {//평가자가 목표의견을 등록하지 않으면 결재가 되지 않도록 한다.
  if ( EvalYN ) then
    begin
      DM.DBSet1.First;
      while not DM.DBSet1.Eof do
        begin
          if Trim(DM.DBSet1.FieldByName('e1prjopinon').AsString)  = '' then
            begin
              MessageDlg('[자세히 보기버튼]을 클릭해서 중진추진업무 별로 목표면담의견을 등록해야 합니다. ',mtError, [mbOk], 0);
              System.Exit;
            end;
          DM.DBSet1.Next;
        end;
    end;   }

  if Lwork = '피평가자' then
    Msg := '['+Bt_Confirm.Caption+']를 하시면 업무목표 내용을 편집할 수 없습니다.'#13#13+
           '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?'
  else if Lwork = '1차' then
  begin
    if (gsLastConEv = '2차')  then
      Msg := '['+Bt_Confirm.Caption+']를 하시면 업무목표 내용을 편집할 수 없습니다.'#13#13+
             '['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?'
    else
      Msg := '['+Bt_Confirm.Caption+'] 하시겠습니까?'
  end
  else
    Msg := '['+Bt_Confirm.Caption+'] 하시겠습니까?';

  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
      System.Exit;

 {
  //
  if Lwork = '피평가자' then
  begin
     if MessageDlg('[평가자 면담확인]'+#13+
                   '1차평가자와 면담하셨습니까?',
                   mtConfirmation,[mbYes,mbNo],0) = IDYES then
     begin
        //면담여부 flag값을 Y로 설정한다.
        SqlText := 'UPDATE PEHREAIM_DET SET '+
                          ' PRJYN = ''Y'' '+
                   ' WHERE rabasdate = '''+ Lrabasdate+''''+
                    ' AND empno = '''+ ED_EMPNO.LABELHINT+'''' +
                    ' AND seqno = ' + ed_seqno_chk.text ;
     end
     else
     begin
        //면담여부 flag값을 N으로 설정한다.
        SqlText := 'UPDATE PEHREAIM_DET SET '+
                          ' PRJYN = ''N'' '+
                   ' WHERE rabasdate = '''+ Lrabasdate+''''+
                    ' AND empno = '''+ ED_EMPNO.LABELHINT+'''' +
                    ' AND seqno = ' + ed_seqno_chk.text ;
     end;

     DataModule_Tmax.Cupd_SQL := Sqltext;
     DataModule_Tmax.Cupd_Exec;
     if not DataModule_Tmax.Cupd_ret then
     begin
        Messagedlg('APP-Server Error',mtError,[mbOK],0);
        Exit;
     end;
  end;
   }

  if Lwork = '피평가자' then
  begin
  //vDeptcode
     //in/up체크시작
     sInFalg := false;

     SqlText := ' Select count(*) from PEHREAIM_PJT '+
                 ' WHERE rabasdate = '''+ Lrabasdate+''''+
                   ' AND empno = '''+ ED_EMPNO.LABELHINT+'''' +
                   ' AND deptcode = ''' + vDeptcode+'''';
     with DBSet10 do
     begin
        Close;
        ServiceName := 'PEA1060A_common';
        ClearFieldInfo;
        AddField('SEL_DATA', ftString, 300);
        ClearParamInfo;
        SQL.Text := SqlText;
        Open;

        if RecordCount > 0 then
        begin
           if DBSet10.FieldByName('SEL_DATA').AsString = '0' then
           begin
              sInFalg := true;
           end
           else
           begin
              sInFalg := false;
           end;
        end;
        close;
     end;
     //in/up체크 끝

     {if sInFalg =  true then
     begin
        if MessageDlg('[평가자 면담확인]'+#13+
                      '1차평가자와 면담하셨습니까?',
                      mtConfirmation,[mbYes,mbNo],0) = IDYES then
        begin
           //면담여부 flag값을 Y로 설정한다.
           SqlText := ' INSERT INTO PEHREAIM_PJT '+
                      ' (RABASDATE, EMPNO, DEPTCODE,E1PRJOPINON, PRJYN ) '+
                        'VALUES  '+
                      ' ('''+ Lrabasdate+''','+
                      ' '''+ ED_EMPNO.LABELHINT+''',' +
                      ' '''+ vDeptcode+''',' +
                      ' '''' ,  '+
                     '  ''Y'') ';

        end
        else
        begin
           //면담여부 flag값을 N으로 설정한다.
           SqlText := ' INSERT INTO PEHREAIM_PJT '+
                      ' (RABASDATE, EMPNO, DEPTCODE,E1PRJOPINON, PRJYN ) '+
                        'VALUES  '+
                      ' ('''+ Lrabasdate+''','+
                      ' '''+ ED_EMPNO.LABELHINT+''',' +
                      ' '''+ vDeptcode+''',' +
                      ' '''' ,  '+
                     '  ''N'') ';
        end;

        DataModule_Tmax.Cupd_SQL := Sqltext;
        DataModule_Tmax.Cupd_Exec;
        if not DataModule_Tmax.Cupd_ret then
        begin
           Messagedlg('APP-Server Error',mtError,[mbOK],0);
           Exit;
        end;
     end
     else
     begin
        if MessageDlg('[평가자 면담확인]'+#13+
                      '1차평가자와 면담하셨습니까?',
                      mtConfirmation,[mbYes,mbNo],0) = IDYES then
        begin
           //면담여부 flag값을 Y로 설정한다.
           SqlText := 'UPDATE PEHREAIM_PJT SET '+
                             ' PRJYN = ''Y'' '+
                      ' WHERE rabasdate = '''+ Lrabasdate+''''+
                        ' AND empno = '''+ ED_EMPNO.LABELHINT+'''' +
                        ' AND deptcode = ''' + vDeptcode+'''';
        end
        else
        begin
           //면담여부 flag값을 N으로 설정한다.
           SqlText := 'UPDATE PEHREAIM_PJT SET '+
                            ' PRJYN = ''N'' '+
                      ' WHERE rabasdate = '''+ Lrabasdate+''''+
                        ' AND empno = '''+ ED_EMPNO.LABELHINT+'''' +
                        ' AND deptcode = ''' + vDeptcode+'''';
        end;

        DataModule_Tmax.Cupd_SQL := Sqltext;
        DataModule_Tmax.Cupd_Exec;
        if not DataModule_Tmax.Cupd_ret then
        begin
           Messagedlg('APP-Server Error',mtError,[mbOK],0);
           Exit;
        end;
     end;}
  end;


  //1차평가자가 결재처리 할때 목표면담 내역을 등록하도록 팝업처리를 한다.
  if Lwork = '1차' then
  begin
      sub_Form3.Lrabasdate := Lrabasdate;
      sub_Form3.Lempno := Ed_empno.LabelHint;
      sub_Form3.LSeqno  := StrToFloat(ed_seqno_chk.Text);
      sub_Form3.ShowModal;
  end;

  Save := 0;
  ToMail := '';

  // 2005.03.17 수정작업
  if Pa_jobgun.Hint <> '22' then  // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
  begin
    DbSet := Grid1.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      Lgubun := 0;
      ToMail := '1차메일';
    end;

    if Lwork = '1차' then Lgubun := 1;

    if Lwork = '2차' then Lgubun := 2;

    if Lgubun = 1 then // 1차결재자
    begin
      if trim(DbSet.FieldByName('e1prjview').AsString) = '' then
      begin
//               MessageDlg('1차 평가자의견을 등록후 확인 하십시요.',mtInformation,[mbOK],0);
//               System.Exit;
      end;

      if (gsLastConEv = '2차') and (Trim(Le2empno) <> '') then
      begin
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.'+#13+
             '다음에 나타나는 비밀번호 입력창에서 브로드넷의 '+#13+
             '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
             '★주의 : 종합인사정보시스템의 비밀번호가 아니라 브로드넷의 비밀번호임',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
           Save := 2 // 내역보관
        else                    //결재상신
           Save := 1; // 내역보관
    end;

    if (gsLastConEv = '2차') and (Lgubun = 2) then // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
//         if ID_YES = messagebox(handle,
//                 '2차 평가자의견을 등록하시겠습니까? ','확인',MB_YESNO or $0030) then
//            Bt_ModClick(Bt_Opt);
//====================================================================================================//
      end;

      if Bt_Confirm.Caption = '결재' then
        Save := 2 // 내역보관
      else                    //결재상신
        Save := 1; // 내역보관
    end;

    St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);
    DM.gsLastConEv := gsLastConEv;
    DM.FSvr_ConfirmSql(1,Lgubun,Save,Param);

  end;

  // 2005.03.17 수정
  if Pa_jobgun.Hint = '22' then // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
  begin
     DbSet := Grid2.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      Lgubun := 0;
      ToMail := '1차메일';
    end;

    if Lwork = '1차' then
      Lgubun := 1;

    if Lwork = '2차' then
      Lgubun := 2;

    if Lgubun = 1 then  // 1차결재자
    begin
      if (gsLastConEv = '2차') and (Trim(Le2empno) <> '') then
      begin
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
          Save := 2 // 내역보관
        else
          Save := 1; // 내역보관
    end;

    if (gsLastConEv = '2차') and (Lgubun = 2) then  // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
//        if ID_YES = messagebox(handle,
//               '2차 평가자의견을 등록하시겠습니까? ','확인',MB_YESNO or $0030) then
//           Bt_ModClick(Bt_Opt);
//====================================================================================================//
      end;
//            Save := 1; // 내역보관
      if Bt_Confirm.Caption = '결재' then
        Save := 2 // 내역보관
      else
        Save := 1; // 내역보관
    end;

    St_Help.Panels[0].Text := ' 확인 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);
     DM.gsLastConEv := gsLastConEv;
    DM.FSvr_ConfirmSql(2,Lgubun,Save,Param);
  end;

  sendtime := GetBaseYear(3);
  sendtime := copy(sendtime,1,4)+'년'+copy(sendtime,5,2)+'월'+copy(sendtime,7,2)+'일 '+
              copy(sendtime,9,2)+':'+copy(sendtime,11,2)+':'+copy(sendtime,13,2);


      //==============================================================================//
      // 메일을 보낸다.
  if ToMail = '1차메일' then
  begin
      MessageDlg('상위부서장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      SendProgID  := 'PEA1060A';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := Le1empno; //'Z113';
      MailSubject := '[ 업무목표설정 1차평가자 확인요청 ]';
      MailBody    := ' 사번 : '+Pempno+'   성명 : '+Pkorname+#13+#13+
                     ' 목표설정을 완료했습니다.                        '+#13+#13+
                     ' 승인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                     '★결재방법:종합인사정보시스템 ▶[평가] ▶[구성원 성과관리] ▶[직무역량, 업무목표 등록/결재] ▶[개인 업무목표 결재]';
      ReceiveYN   := 'N';

      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
      Begin
        MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
      End
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '결재상신작업은 처리되었으므로    '+#13+
                      '상위부서장께 [업무목표설정 1차평가자 확인요청] 메시지를 '+#13+
                      '[브로드넷]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;
  end;

  if ToMail = '2차메일' then
  begin
      MessageDlg('상위부서장에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      SendProgID  := 'PEA1060A';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := Le2empno; //'Z113';
      MailSubject := '[ 개인업무목표설정 확인요청 ]';
      MailBody    := ' 사번 : '+Pempno+'   성명 : '+Pkorname+#13+#13+
                     ' 목표설정을 완료하였습니다.'+#13+#13+
                     ' 승인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                     '★결재방법:종합인사정보시스템 ▶[평가] ▶[구성원 성과관리] ▶[직무역량, 업무목표 등록/결재] ▶[개인 업무목표 결재]';
      ReceiveYN   := 'N';

      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
      Begin
        MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0);
      End
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '결재상신작업은 처리되었으므로    '+#13+
                      '상위부서장께 [개인업무목표설정 확인요청] 메시지를 '+#13+
                      '[브로드넷]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;
  end;
      //==============================================================================//

  St_Help.Panels[0].Text := '';
  Ed_empno.SetFocus;

  if (Lwork <> '피평가자') then
  begin
     ShowMessage('처리 되었습니다.');
     Bt_ExitClick(self);
  end;
end;

procedure TMainForm.Ed_empnoRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer;
begin
//  if Copy(Pempno,1,1) ='D' then  //JSH 20051121  D사번만 모든 사람들 조회가능.
//  begin

      Try
        Valuer := TPeDestValuer.Create(Self);
    //    Valuer.RemoteServer := DM.Rs;
        Valuer.rabasdate    := Lrabasdate;
        Valuer.empno        := Pempno;

        if Valuer.Execute then
        begin
            Ed_empno.LabelHint := Valuer.empno;
            Bt_TgtClick( Bt_Tgt );
        end;
      Finally
        Valuer.Free;
        Valuer := nil;
        Start := True;
      End;
//  End;

end;

procedure TMainForm.Bt_delClick(Sender: TObject);
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
begin
  Msg := '[삭제] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
    System.Exit;

  if (Nt_Book.ActivePage = '관리직') then
    DbSet := Grid1.DataSource.DataSet
  else if (Nt_Book.ActivePage = '영업직') then
    DbSet := Grid2.DataSource.DataSet
  else                                            //자기계발
    DbSet := Grid3.DataSource.DataSet;

  St_Help.Panels[0].Text := ' 삭제 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);
  Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,FloatToStr(DbSet.FieldByName('seqno').AsFloat)]);

  if Nt_Book.ActivePage = '관리직' then
    DM.FSvr_DeleteSql(1,0,Param)
  else if Nt_Book.ActivePage = '영업직' then
    DM.FSvr_DeleteSql(2,0,Param)
  else
    DM.FSvr_DeleteSql(5,0,Param);               //자기계발

  Bt_SrhClick(Bt_Srh);

  St_Help.Panels[0].Text := '';
end;

procedure TMainForm.Bt_canClick(Sender: TObject);
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
  Lgubun : integer;
  ToMail : string;
begin
  Msg := '[반려] 작업을 하시겠습니까 ?.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
    System.Exit;

  St_Help.Panels[0].Text := ' 반려 작업 처리중입니다..';
  St_Help.Perform(WM_PAINT,0,0);

  Param := VarArrayOf([Lrabasdate,Ed_empno.LabelHint,Pempno]);

  if (Lwork = '1차') then
  begin
    Tomail := '피평가자';
    DM.FSvr_UpdateSql(4,1,Param); //반려, 1차, (평가기준일,접속자사번,피평가자사번)
                                  //e1prjobjyn = 'Y', rprjconyn = 'N', rprjcondate = ''
  end;

  //   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
  if (gsLastConEv = '2차') and (Lwork = '2차') then
  begin
    Tomail := '모두';
    DM.FSvr_UpdateSql(4,2,Param); //반려, 2차, (평가기준일,접속자사번,피평가자사번)
                                  //e2prjobjyn = 'Y', e1prjconyn  = 'N', e1prjcondate = '',
                                  //rprjconyn  = 'N', rprjcondate = ''
  end;

  // 메일을 보낸다.
  if ToMail = '피평가자' then
  begin
      MessageDlg('피평가자에게 확인요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
      SendProgID  := 'PEA1060A';  //프로그램 ID
      SendEmpno   := Pempno;      //발송자(로그인 사번)
      RcveEmpno   := Ed_empno.LabelHint; //'Z113';
      MailSubject := '[ 목표설정 1차평가자 반려메일 ]';
      MailBody    := '목표설정을 반려했습니다. 다시 설정하여 주십시오.';
      ReceiveYN   := 'N';

      if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
           MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
      else
      begin
           MessageDlg('메일전송중 에러가 발생하였습니다.'+#13+#13+
                      '결재상신작업은 처리되었으므로    '+#13+
                      '상위부서장께 [직무경력 등록 확인요청] 메시지를 '+#13+
                      '[브로드넷]에서 직접 메일전송하시면 됩니다.  ',mtError,[mbOK],0);
           System.Exit;
      end;
  end;
      //==============================================================================//

  //만일 피평가자가 아닐경우 반려처리를 하면 메인프로그램을 호출한 후 종료처리를 한다.
  if (Lwork <> '피평가자') then
  begin
     ShowMessage('처리 되었습니다.');
     Bt_ExitClick(self);
  end;
end;

procedure TMainForm.Select_Form(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0 : begin                                        // 업무목표
          Bt_Tgt.Font.Color := clPurple;
          Bt_Dev.Font.Color := clBlack;

          // 2005.03.17 수정작업
          //if (Pa_jobgun.Hint >= '10') and (Pa_jobgun.Hint <= '40') then

          if (Pa_jobgun.Hint = '11') OR (Pa_jobgun.Hint = '33') OR (Pa_jobgun.Hint = '44') then
          begin
            Nt_Book.ActivePage := '관리직';
          end;
        end;
    1 : begin                                        //자기계발
          Bt_Tgt.Font.Color  := clBlack;
          Bt_Dev.Font.Color  := clPurple;
          Nt_Book.ActivePage := '자기계발';
        end;
  end;
end;

procedure TMainForm.Bt_TgtClick(Sender: TObject);
begin
  Application.ProcessMessages;
  Select_Form(Sender);
  Bt_SrhClick(Sender);
end;

function TMainForm.Get_Code(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

function TMainForm.Get_Dept(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  Result            := FM_Tmax.GetData('deptname' ,Acodeid,Acodeno);
end;

procedure TMainForm.btn_PrintClick(Sender: TObject);
begin
  if ((DM.DBSET1.Eof) and (DM.DBSET1.Bof)) then
  begin
   MessageDlg('출력할 데이터가 없습니다.'+#13+#10+''+#13+#10+'출력 작업은 취소 되었습니다.', mtError, [mbOK], 0);
   System.Exit;
  end;
  if GetBaseYear(5) <= GetBaseYear(3) then      //직위체계변경일<=시스템날짜 band/직책
  begin
       PrintForm1.rabasdate := copy(Lrabasdate,1,4);
       PrintForm1.PeQuickRepPrn1.Preview;
  end
  else
  begin
       PrintForm.rabasdate := copy(Lrabasdate,1,4);
       PrintForm.PeQuickRepPrn1.Preview;
  end;
end;

function TMainForm.Check_Edit1 : Boolean;
begin
  Result := False;

  if  (((Pa_payra.Hint >= payrafrom) and (Pa_payra.Hint <= payrato)) or
      ((Ed_empno.LabelHint =  objemp1) or  (Ed_empno.LabelHint =  objemp2) )) And
      ((Ed_empno.LabelHint <> excemp1) And (Ed_empno.LabelHint <> excemp2) And
       (Ed_empno.LabelHint <> excemp3) And (Ed_empno.LabelHint <> excemp4) And
       (Ed_empno.LabelHint <> excemp5) And (Ed_empno.LabelHint <> excemp6))
      And (DM.DBSet1.RecordCount > 0) then
  begin
       if not DM.DBSet1.Locate('SEQNO',Vararrayof(['99']),[loCaseInsensitive]) then
       begin
            MessageDlg('"SUPEX 일상화 추구과제 등록"은 반드시 등록하셔야 합니다.',mtError,[mbOK],0);
            System.Exit;
       end;
  end;

  DM.DBSet1.First;

  while not DM.DBSet1.Eof do
  begin
    if Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)  = '' then
    begin
      MessageDlg('중점추진업무 항목 필수 입력.',mtError,[mbOK],0);
      System.Exit;
    end;
(* 2011.04.14  세부추진활동의 필수입력사항을 한가지로 수정
    if (Trim(DM.DBSet1.FieldByName('SEQNO').AsString)  = '99') And
       ((Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '')  or
        (Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString)  = '')  or
        (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString)  = '')) then
*)
    if (Trim(DM.DBSet1.FieldByName('SEQNO').AsString)  = '99') And
       ((Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '')) then
    begin
      MessageDlg('SUPEX 일상화 추구과제의 세부추진활동은 반드시 하나 이상 등록하셔야 하며' + #13#13 +
                 ' 세부추진활동을 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
      System.Exit;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '' then
    begin
      MessageDlg('세부추진활동은 반드시 하나 이상 등록하셔야 하며' + #13#13 +
                 ' 세부추진활동을 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
      System.Exit;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString)  = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동1 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end
    end
    else
    begin
      if ( (Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString) <> '') and
           ((DM.DBSet1.FieldByName('DETAILWEIGHT1').AsInteger = 0) or
            (Trim(DM.DBSet1.FieldByName('VALIDX1').AsString) = '') or
        //    (Trim(DM.DBSet1.FieldByName('VALFUNCTION1').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('SRESULTCLASS1').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('ARESULTCLASS1').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('BRESULTCLASS1').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('CRESULTCLASS1').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('DRESULTCLASS1').AsString) = '')
         ) ) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동2 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

      if (Trim(DM.DBSet1.FieldByName('VALIDX2').AsString) <> '') or
      //   (Trim(DM.DBSet1.FieldByName('VALFUNCTION2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS2').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS2').AsString) <> '') then
      begin
        MessageDlg('세부추진활동2를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ( (Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) <> '') and
           ((DM.DBSet1.FieldByName('DETAILWEIGHT2').AsInteger = 0) or
            (Trim(DM.DBSet1.FieldByName('VALIDX2').AsString) = '') or
         //   (Trim(DM.DBSet1.FieldByName('VALFUNCTION2').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('SRESULTCLASS2').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('ARESULTCLASS2').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('BRESULTCLASS2').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('CRESULTCLASS2').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('DRESULTCLASS2').AsString) = '')
         ) ) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) = '' then
    begin
      if (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동3 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

      if (Trim(DM.DBSet1.FieldByName('VALIDX3').AsString) <> '') or
      //   (Trim(DM.DBSet1.FieldByName('VALFUNCTION3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS3').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS3').AsString) <> '') then
      begin
        MessageDlg('세부추진활동3를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ( (Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') and
           ((DM.DBSet1.FieldByName('DETAILWEIGHT3').AsInteger = 0) or
            (Trim(DM.DBSet1.FieldByName('VALIDX3').AsString) = '') or
        //    (Trim(DM.DBSet1.FieldByName('VALFUNCTION3').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('SRESULTCLASS3').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('ARESULTCLASS3').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('BRESULTCLASS3').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('CRESULTCLASS3').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('DRESULTCLASS3').AsString) = '')
         ) ) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) = '' then
    begin
      if Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '' then
      begin
        MessageDlg('세부추진활동4 부터 순차적으로 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;

     if (Trim(DM.DBSet1.FieldByName('VALIDX4').AsString) <> '') or
      //   (Trim(DM.DBSet1.FieldByName('VALFUNCTION4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS4').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS4').AsString) <> '') then
      begin
        MessageDlg('세부추진활동4를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if ( (Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') and
           ((DM.DBSet1.FieldByName('DETAILWEIGHT4').AsInteger = 0) or
            (Trim(DM.DBSet1.FieldByName('VALIDX4').AsString) = '') or
        //    (Trim(DM.DBSet1.FieldByName('VALFUNCTION4').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('SRESULTCLASS4').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('ARESULTCLASS4').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('BRESULTCLASS4').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('CRESULTCLASS4').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('DRESULTCLASS4').AsString) = '')
         ) ) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '' then
    begin
      if ( (Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') and
           ((DM.DBSet1.FieldByName('DETAILWEIGHT5').AsInteger = 0) or
            (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) = '') or
        //    (Trim(DM.DBSet1.FieldByName('VALFUNCTION5').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('SRESULTCLASS5').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('ARESULTCLASS5').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('BRESULTCLASS5').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('CRESULTCLASS5').AsString) = '') or
            (Trim(DM.DBSet1.FieldByName('DRESULTCLASS5').AsString) = '')
          ) ) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) <> '') or
      //   (Trim(DM.DBSet1.FieldByName('VALFUNCTION5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('SRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('ARESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('BRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('CRESULTCLASS5').AsString) <> '') or
         (Trim(DM.DBSet1.FieldByName('DRESULTCLASS5').AsString) <> '') then
      begin
        MessageDlg('세부추진활동5를 입력하셔야 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    DM.DBSet1.Next;
  end;

  Result := True;
end;

function TMainForm.Csel_gfd10(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet10.FieldByName('SEL_DATA').AsString;
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

procedure TMainForm.pob_e1prjopinonClick(Sender: TObject);
var
SqlText : string;
begin
   //팀장면담테이블을 조회한다. (
   SqlText := ' select e1prjopinon FROM PEHREAIM_PJT '+
              ' WHERE RABASDATE = ''' + LRABASDATE + ''''+' AND EMPNO = ''' + ED_EMPNO.LABELHINT + ''' ';
   with DBSet10 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then
         mo_e1prjopinon.Text := trim(DBSet10.FieldByName('SEL_DATA').AsString);

      close;
   end;
   pn_obt.Visible := true;
//begin
//   pn_obt.Visible := true;
end;

procedure TMainForm.bt_closeClick(Sender: TObject);
begin
   pn_obt.Visible := false;
end;

procedure TMainForm.Bt_ReConfirmClick(Sender: TObject);
var
     SqlText, Msg : string;
begin
     SqlText := 'select a.empno||'';''||a.rprjconyn||'';''||sum(hap) '+
                'from pehremas a,                                    '+
                '     ( select empno, 0 taskcode, sum(mainweight) hap from pehreaim_det  '+
                '       where rabasdate = ''' + LRABASDATE + '''                         '+
		'       and empno = ''' + ED_EMPNO.LABELHINT + '''                       '+
                '       group by empno                                                   '+
                '       union                                                            '+
                '       select empno, taskcode, max(mainweight) hap from pehreaim_comdet '+
                '       where rabasdate = ''' + LRABASDATE + '''                         '+
		'       and empno = ''' + ED_EMPNO.LABELHINT + '''                       '+
                '       group by empno, taskcode                                         '+
                '     ) b                                                                '+
                'where a.empno = b.empno                                                 '+
		'and a.rabasdate = ''' + LRABASDATE + '''                                '+
                'group by a.empno, a.rprjconyn                                           '+
                'having sum(hap) = 100                                                   ';

     with DBSet10 do
     begin
       close;
       ServiceName := 'PEA1060A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 300);
       ClearParamInfo;
       SQL.Text := SqlText;
       Open;
       //showmessage(Csel_gfd10(1) + ' ' + Csel_gfd10(2) + ' ' + Csel_gfd10(3));

       if RecordCount = 1 then
       begin
            if (Csel_gfd10(2) <> 'Y') or (Csel_gfd10(3) <> '100') then
            begin
                 showmessage('목표수립이 확정된건에 한해 [재결재상신] 가능합니다.');
                 close;
                 System.Exit;
            end;
       end
       else
       begin
            showmessage('목표등록된 내역이 없습니다. 먼저 목표등록을 해주세요!');
            close;
            System.Exit;
       end;

       close;
     end;

     Msg := '이미 목표등록 결재가 완료된 자료입니다.' + #13#13 +
            '[결재재상신] 처리를 하시면 목표등록을 입력/수정/삭제 하실 수 있습니다.' + #13#13 +
            '목표등록 완료 후 다시 [결재상신] 처리를 하시고 직상위자께 결재처리를 받으셔야 합니다.' + #13#13 +
            '재등록 하시겠습니까?';

     if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) <> IDYES then
           System.Exit;

     Bt_Mod.Enabled       := True;
     Bt_Add.Enabled       := True;
     Bt_del.Enabled       := True;
     Bt_Confirm.Enabled   := True;
     Bt_can.Enabled       := True;
     Bt_ReConfirm.Enabled := False;

//showmessage('LRABASDATE : ' + LRABASDATE + ', ED_EMPNO.LABELHINT : ' + ED_EMPNO.LABELHINT);
     SqlText := 'UPDATE pehremas             '+
                'SET rprjconyn    = ''N'',   '+
                '    rprjcondate  = '''' ,   '+
                '    e1prjview    = '''' ,   '+
                '    e1prjconyn   = ''N'',   '+
	        '    e1prjobjyn   = ''N'',   '+
                '    e1prjcondate = '''' ,   '+
                '    e2prjview    = '''' ,   '+
                '    e2prjconyn   = ''N'',   '+
                '    e2prjobjyn   = ''N'',   '+
                '    e2prjcondate = ''''     '+
                'WHERE rabasdate  = ''' + LRABASDATE + '''  '+
                'AND empno = ''' + ED_EMPNO.LABELHINT + ''' ';

     DataModule_Tmax.Cupd_SQL := Sqltext;
     DataModule_Tmax.Cupd_Exec;
     if not DataModule_Tmax.Cupd_ret then
     begin
       Messagedlg('APP-Server Error',mtError,[mbOK],0);
       Exit;
     end;

     Msg := '목표등록이 초기화 되었습니다.' + #13#13 +
            '목표등록 재설정 후 반드시 [결재상신] 처리를 하세요.' + #13#13 +
            '[결재상신] 처리를 하시지 않으면 직상위자께 결재 받으실 수 없습니다.';

     MessageDlg(Msg,mtConfirmation,[mbYes],0)

end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
     MainForm.Close;  //다운로드 완료후 메인폼 종료키 위해 Delay 함.
end;

//EAI 연동을 통한 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TMainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       ServiceName := 'PIT1030A_DML';
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

procedure TMainForm.Bt_PRodClick(Sender: TObject);
var
  Fm : TFm_SubForm1;
begin
  Try
    Fm := TFm_SubForm1.Create(Self);
    Fm.Pwork := Nt_Book.ActivePage; 

    Fm.Lrabasdate := Lrabasdate;
    Fm.Lfordate   := Lfordate;
    Fm.gsLastConEv:= gsLastConEv;

    Fm.LSeqno     := 99;
    Fm.DbSet      := Grid1.DataSource.DataSet;

    Fm.Lempno     := Ed_empno.LabelHint;
    Fm.Lwriteemp  := Pempno;
    Fm.ShowModal;

    Application.ProcessMessages;
    if (Fm.UpDateOk) or (Fm.prjview_UpDate) then
    begin
      Bt_SrhClick(Sender);
    end;
  Finally
    Fm.Free;
  End;
end;

procedure TMainForm.Bt_JikClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
   //팀원 직무역량 우선순위 등록
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
   FM_DownLoad.PL_VersionCHK3(3, 'PEA1180F');  //Call하는 단위 프로그램의 버젼을 체크..
   FM_DownLoad.FL_UserID := pEmpno;
   if (not FM_DownLoad.FL_VersionCHK ) or
      (not FileExists(GSHomeDir+'\Bin\3tier\PEA1180F.EXE')) then
   begin
      FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1180F.EXE','PEA1180F',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
   end
   else
   begin
      FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
      LSfilename := GSHomeDir+'\Bin\3Tier\PEA1180F.EXE ,'
                 + pEmpno            +','+Passemp(cmdline,2)+','+'@@@@@'+','   //패스워드 체크 방지용.
                 +Passemp(cmdline,4) +','+Passemp(cmdline,5)+','+Passemp(cmdline,6)+','
                 +Passemp(cmdline,7) +','+Passemp(cmdline,8)+','+Passemp(cmdline,9)+','//+' '+','+' '+','+' '+','
                 +Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

      strpcopy( LAarg, LSfilename );
      winexec(LAarg, SW_SHOWNORMAL);

      FM_DownLoad.Close;  // 다운로드 폼 닫기.
   end;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
var
  FTPpath, ObjName : String;
  sRPRJCONYN, sE1PRJCONYN, sCONYN, sEEMP_CONYN : String;
begin
   if SRabasDate = '' then
   begin
       if trim(sKillCheckID) = '' then
       begin
            //1차 2차 평가자일경우
            //PDownload 라이브러리 추가하여 수정....dsa2000   2007.05.
            FTPpath     := '/hper/insa/hperson/usrbin/Ebin';
            ObjName     := 'PEA1060E.EXE';
            FM_DownLoad := TFM_DownLoad.Create(Application);
            FM_DownLoad.Show;
            FM_DownLoad.PL_ReadEnv;                            //환경변수값(파라미터) 읽어온다.
            FM_DownLoad.PL_VersionCHK3(3, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

            if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(GetHomeDir+'\Bin\3Tier\'+ObjName)) then
            begin
                 FM_DownLoad.PL_DownLoad(3, FTPpath, ObjName, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass);
            end
            else
            begin
                 FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
                 LSfilename := GSHomeDir+'\Bin\3tier\'+ObjName+' ,'
                            + pEmpno            +','+Passemp(cmdline,2) +','+'@@@@@'           +','   //패스워드 체크 방지용.
                            +Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6)+','
                            +Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9)+','
                            +Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                           + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

                 strpcopy( LAarg, LSfilename );
                 winexec(LAarg, SW_SHOWNORMAL);

                 FM_DownLoad.Close;  // 다운로드 폼 닫기.
            end;
            St_Help.Panels[0].Text := '';
       end;

       Timer1.Enabled := False;
       Timer1.Interval := 3000;
       Timer1.Enabled := True; //다운로드 완료후 메인폼 종료키 위해 Delay 함.
   end;

  with DBSet10 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.Text := ' SELECT A.EMPNO, RPRJCONYN, E1PRJCONYN, B.CONYN, B.EEMP_CONYN FROM PEHREMAS A, ' +
                '       (SELECT RABASDATE, EMPNO, MAX(CONYN) CONYN, MAX(EEMP_CONYN) EEMP_CONYN  ' +
                '       FROM PEDUCEMP B GROUP BY RABASDATE, EMPNO) B                            ' +
                ' WHERE A.RABASDATE = B.RABASDATE(+) ' +
                '   AND A.EMPNO     = B.EMPNO(+)     ' +
                '   AND A.RABASDATE = ''' + LRABASDATE + ''' ' +
                '   AND A.EMPNO     = ''' + ED_EMPNO.LABELHINT + ''' ';

    ClearFieldInfo;
    AddField('EMPNO'     , ftString, 100);
    AddField('RPRJCONYN' , ftString, 100);
    AddField('E1PRJCONYN', ftString, 100);
    AddField('CONYN'     , ftString, 100);
    AddField('EEMP_CONYN', ftString, 100);
    Open;

    sRPRJCONYN  := FieldByName('RPRJCONYN').AsString;
    sE1PRJCONYN := FieldByName('E1PRJCONYN').AsString;
    sCONYN      := FieldByName('CONYN').AsString;
    sEEMP_CONYN := FieldByName('EEMP_CONYN').AsString;
  end;

  if  (s_payra = 'C11') or (Ed_empno.LabelHint = '0694') then //팀장이면
  begin
    If ((sRPRJCONYN = 'Y') or (sCONYN = 'Y')) Then
    Begin
      If ((sE1PRJCONYN = 'Y') And (sEEMP_CONYN = 'Y')) Then
      Begin
        MessageDlg('직무역량 우선순위 및 개인별 목표등록의 결재가 완료 되었습니다.',mtInformation,[mbOK],0);
        Close;
      End;

      If ((sRPRJCONYN = 'Y') And (sCONYN = 'Y')) Then
      Begin
        if ((sE1PRJCONYN <> 'Y') And (sEEMP_CONYN <> 'Y')) Then
        Begin
          if MessageDlg('직무역량 우선순위 및 개인별 목표등록의 결재를 완료하여 주시기 바랍니다',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          System.Exit;
        End;
      End;

      If ((sRPRJCONYN = 'Y') And (sE1PRJCONYN <> 'Y')) Then
      Begin
        if MessageDlg('개인별 목표등록의 결재를 완료하여 주시기 바랍니다',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        System.Exit;
      End;

      If ( (sCONYN = 'Y') And (sEEMP_CONYN <> 'Y')) Then
      Begin
        if MessageDlg('직무역량 우선순위의 결재를 완료하여 주시기 바랍니다',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        System.Exit;
      End;
    End;
  End;

  Close;
end;


end.

