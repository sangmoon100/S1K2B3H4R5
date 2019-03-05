unit PeMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl;

type
  TMainForm = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    Pa_Work: TPanel;
    St_Help: TStatusBar;
    Panel1: TPanel;
    Pa_jobgun: TPeJeonLabel;
    Pa_deptcode: TPeJeonLabel;
    Pa_paycl: TPeJeonLabel;
    Pa_payra: TPeJeonLabel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_del: TPeJeonOutLookBtn;
    Ed_empno: TPePanelBtnEdit;
    Nt_Book: TNotebook;
    Panel3: TPanel;
    PeJeonLabel1: TPeJeonLabel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Opt: TPeJeonOutLookBtn;
    Bt_Confirm: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Panel2: TPanel;
    Pa_empdate: TPeJeonLabel;
    Pa_paycldate: TPeJeonLabel;
    Pa_trdate: TPeJeonLabel;
    Bt_can: TPeJeonOutLookBtn;
    Bt_Detail: TPeJeonOutLookBtn;
    Pa_Le1KorName: TJeonPanel;
    Pa_Le2Payra: TJeonPanel;
    JeonPanel2: TJeonPanel;
    Pa_Le1Payra: TJeonPanel;
    JeonPanel4: TJeonPanel;
    Pa_Le2KorName: TJeonPanel;
    Panel4: TPanel;
    PeJeonLabel4: TPeJeonLabel;
    PeJeonLabel6: TPeJeonLabel;
    PeJeonLabel7: TPeJeonLabel;
    PeJeonLabel9: TPeJeonLabel;
    PeJeonLabel11: TPeJeonLabel;
    PeJeonLabel12: TPeJeonLabel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Tgt: TPeJeonOutLookBtn;
    Bt_Dev: TPeJeonOutLookBtn;
    P_Title: TPeJeonGrdPanel;
    Pa_deptna3: TPeJeonLabel;
    btn_Print: TPeJeonOutLookBtn;
    Eda_weight: TOnNumberEdit;
    PeJeonLabel15: TPeJeonLabel;
    PeJeonLabel16: TPeJeonLabel;
    PeJeonLabel17: TPeJeonLabel;
    PeJeonLabel18: TPeJeonLabel;
    PeJeonLabel5: TPeJeonLabel;
    PeJeonLabel3: TPeJeonLabel;
    sGrid1: TStringGrid;
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
    procedure Bt_pea1040cClick(Sender: TObject);
    procedure Bt_TgtClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
  private
    { Private declarations }
    Start    : Boolean;
    Inter    : ILotusNotes_Hana;
    pEmpno   : string;  // 로그인 사번
    pKorname : string;  // 로그인 성명
    pPass    : String;
    pClass   : string;  // 로그인 등급
    ComIp    : string;

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

    function GetBaseYear(gubun : integer) : string;
    function GetPehremas(Gubun : string) : string;
    function Check_Edit1 : Boolean;                 //입력 값 체크
    
    function VersionGetting(PgmId,sVer : string) : Boolean;

    procedure Read_pehreaim_det;

    procedure Send_Mail(stitle,Destempno, DestKorname, Body, gubun : string);
    procedure Select_Form(Sender: TObject);
  public
    gsLastConEv  : String;  //업무목표최종결재자 (1차 or 2차)
    Lrabasdate   : string;  // 평가기준일.
    Le1empno     : string;  // 1차 평가자
    g_mainweight : string;  // 전체 비중
    EvalYN       : Boolean;
    { Public declarations }
    function  Get_Code(Acodeid, Acodeno : String) : String;  // 코드명 가져오기
    function  Get_Dept(Acodeid, Acodeno : String) : String;  // 부서명 가져오기
  end;

var
  MainForm: TMainForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;

const
  Msg = '목표 면담등록 서버가 다운된 것 같습니다.'+#13#13+'담당자에게 문의 하십시오'#13;

implementation

uses
  Hinsa_TmaxDM, peDm, pea1060a1, pea1060a2, pea1060a3, pea1060b1;

{$R *.DFM}

//작업상 필요한 날짜 얻기
function TMainForm.GetBaseYear(gubun : integer) : string;
var
  Sql     : string;
begin
  Result := '';

  if gubun = 1 then                                            //업적평가 기준일(Lrabasdate)
    Sql := 'SELECT VALUE1 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 2 then                                            //하반기 업적평가 시작일(LFordate)
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0003'' ';

  if gubun = 3 then                                            //시스템 시각(Lsysdate)
    Sql := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') FROM DUAL ';

  if gubun = 4 then                                            //
    Sql := 'SELECT NVL(VALUE5,'' '') FROM PEHREBAS  '+
           ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND GUBUN = ''11'' AND SGUBUN = ''0003'' ';

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
       {  Ed_empno.Text            := DataModule_Tmax.Csel_gfd(2); //FieldByName('korname').AsString; //사원명
         Pa_paycl.TextCaption     := Get_Code('I112',DataModule_Tmax.Csel_gfd(4));  //직급
         Pa_payra.TextCaption     := Get_Code('I113',DataModule_Tmax.Csel_gfd(5));  //직위
         Pa_jobgun.TextCaption    := Get_Code('I115',DataModule_Tmax.Csel_gfd(3));  //직군
         Pa_jobgun.Hint           := DataModule_Tmax.Csel_gfd(3);                   // 직군코드
        }
         Pa_deptcode.TextCaption  := Get_Dept(DataModule_Tmax.Csel_gfd(6),          //부서명
                                                  DataModule_Tmax.Csel_gfd(7));
         Pa_empdate.TextCaption   := DataModule_Tmax.Csel_gfd(11);                      //입사일
         //Pa_paycldate.LabelCaption := DataModule_Tmax.Csel_gfd(8);                      //승격일(타이틀?)
         Pa_paycldate.TextCaption := DataModule_Tmax.Csel_gfd(9);                       //승격일
         Pa_trdate.TextCaption    := DataModule_Tmax.Csel_gfd(10);                      //현부서발령일

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
                 //'          FROM PEHREMAS A, PEHREAIM_COM B                                                           '+
                 '         WHERE A.RABASDATE = ''' + LRABASDATE + '''                                                 '+
                 '           AND A.EMPNO     = ''' + ED_EMPNO.LABELHINT + '''                                         '+
                 '           AND A.RABASDATE = B.RABASDATE                                                            '+
                 '           AND A.EMPNO     = B.EMPNO                                                                '+
                 '         )                                                                                          '+
                 ' ORDER BY SEQNO                                                                                     ';
      {
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
      Db_validx1.DataField    := 'VALIDX1';        //기대수준
      Db_validx2.DataField    := 'VALIDX2';
      Db_validx3.DataField    := 'VALIDX3';
      Db_validx4.DataField    := 'VALIDX4';
      Db_validx5.DataField    := 'VALIDX5';

      DB_s1.DataField         := 'SRESULTCLASS1';               //탁월
      DB_s2.DataField         := 'SRESULTCLASS2';
      DB_s3.DataField         := 'SRESULTCLASS3';
      DB_s4.DataField         := 'SRESULTCLASS4';
      DB_s5.DataField         := 'SRESULTCLASS5';

      DB_a1.DataField         := 'ARESULTCLASS1';               //우수
      DB_a2.DataField         := 'ARESULTCLASS2';
      DB_a3.DataField         := 'ARESULTCLASS3';
      DB_a4.DataField         := 'ARESULTCLASS4';
      DB_a5.DataField         := 'ARESULTCLASS5';

      DB_b1.DataField         := 'BRESULTCLASS1';               //보통
      DB_b2.DataField         := 'BRESULTCLASS2';
      DB_b3.DataField         := 'BRESULTCLASS3';
      DB_b4.DataField         := 'BRESULTCLASS4';
      DB_b5.DataField         := 'BRESULTCLASS5';

      DB_c1.DataField         := 'CRESULTCLASS1';               //미흡
      DB_c2.DataField         := 'CRESULTCLASS2';
      DB_c3.DataField         := 'CRESULTCLASS3';
      DB_c4.DataField         := 'CRESULTCLASS4';
      DB_c5.DataField         := 'CRESULTCLASS5';

      DB_d1.DataField         := 'DRESULTCLASS1';               //저조
      DB_d2.DataField         := 'DRESULTCLASS2';
      DB_d3.DataField         := 'DRESULTCLASS3';
      DB_d4.DataField         := 'DRESULTCLASS4';
      DB_d5.DataField         := 'DRESULTCLASS5';
       }
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
   end;

   //전체 비중 합계
   //Sql := 'select sum(mainweight) from PEHREAIM_DET'+
   Sql := 'select sum(mainweight) from PEHREAIM_COM'+
   format(' WHERE rabasdate=''%s'' and empno = ''%s'' ',[Lrabasdate,Ed_empno.LabelHint]);

   DataModule_Tmax.Csel_SQL := Sql;
   DataModule_Tmax.Csel_Open4;
   g_mainweight     := DataModule_Tmax.Csel_gfd4(1);
   if g_mainweight = '' then
      g_mainweight := '0';

   Eda_weight.value := StrToInt(g_mainweight);

end;

// 메일 보네기
procedure TMainForm.Send_Mail(sTitle,Destempno,DestKorname, Body, gubun: string);
var
  SqlText : string;
  Ltime   : string;
begin
  try
    if not Assigned(Inter) then
    begin
      try
         Inter := CoLotusNotes_Hana.Create;
      except
         begin
            Inter := nil;
            System.Exit;
         end;
      end;

      try
         while not Inter.GetInstance do
      except
         begin
            if Assigned(Inter) then
               Inter := nil;
            Close;
            System.Exit;
         end;
      end;
    end;

    Inter.SendFrom   := Pkorname+' '+Pempno;
//  민용메일
    Inter.SendTo     := DestEmpno;
    Inter.SendToName := DestKorname;
//    Inter.SendTo     := 'Z286';
//    Inter.SendToName := '이민용';
    Inter.CorName    := 'HANARO';
    Inter.Subject    := sTitle;
    Inter.Body       := Body;
    Inter.SendMail;
  except
    MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
  end;
  Application.ProcessMessages;

  MessageDlg('['+Bt_Confirm.Caption+']작업이 처리되었습니다.'+#13#13+
             '      ',mtInformation,[mbOK],0);
end;


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inter := nil;
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Start := True;
  Inter := nil;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  msg: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  if Start then
  begin
    pEmpno   := peParam(CmdLine,1);
    pKorname := peParam(CmdLine,2);
    pPass    := peParam(CmdLine,3);
    pClass   := peParam(CmdLine,4);
    ComIp    := peParam(Cmdline,5);
    ComIP    := Copy(ComIP,2,Length(ComIP)-1);

    msg := DataModule_Tmax.Connect_Session;
    if msg <> '' then
    begin
      Application.MessageBox(PChar(msg),'TMAX에러',mb_ok);
      Application.Terminate;
      Exit;
    end;

    Application.Title  := '공 동 목 표 등 록 화 면';
    //showmessage(GetBaseYear(1));

    Lrabasdate := GetBaseYear(1);            //업적평가 기준일

    Lfordate   := GetBaseYear(2);            //하반기 업적평가 시작일(LFordate)
    Lsysdate   := Copy(GetBaseYear(3),1,8);  //시스템 시각(Lsysdate)

    if Lrabasdate = '' then
    begin
      Close;
    end;

    // 1차평가자 최종결재 및 결재시 이력보관
    gsLastConEv:= '1차';//trim(GetBaseYear(4)); //업무목표최종결재자 (1차 or 2차)

    Ed_empno.LabelHint := Pempno;

    GetPehremas('읽기') ;

    if GetPehremas('추출') = '없음' then
    begin
      MessageDlg('목표설정 대상자가 아니거나 평가권한이 없습니다.'+#13#13+
                 '인사팀에 문의하십시오.',mtInformation,[mbOK],0);
      Close;
    end
    else
    begin
      if GetPehremas('구분') <> '없음' then
      begin
        GetPehremas('읽기');
        EvalYN := True;
        Select_Form(Bt_Tgt);
        Ed_empnoRightBtnClick(Sender);
      end
      else
      begin
        Bt_TgtClick(Bt_Tgt);
        EvalYN := False;
      end;
    end;

    Start := False;
  end;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
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
       (ge1valconyn = 'Y')  or (ge1valobjyn = 'Y') or
       (ge2valconyn = 'Y')  or (ge2valobjyn = 'Y') or
       (gebrvalconyn = 'Y') or (gebrvalobjyn = 'Y') then
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
        Bt_Confirm.Caption := '결재'
    else
        Bt_Confirm.Caption := '결재상신';
  end
  else //업무목표최종결재자가 1차인경우
  begin
    if (Pempno = Le2empno) or (Pempno = Le1empno) or (Pempno = Lebrempno) then
    begin
        Bt_Confirm.Caption := '결재';
        P_Title.Caption := '공 동 목 표  결 재';
    end
    else
    begin
        Bt_Confirm.Caption := '결재상신';
        P_Title.Caption := '공 동 목 표  등 록';
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

    // 1.09      2004.11.11          이민용         by 손필영 요청   평가 등록 종료로 메세지 수정
    // 피평가자 이고, 자기평가를 하지 않았고, 1차 결재자가 반려한 경우
    if (( not EvalYN ) and (DbSet.FieldByName('rprjconyn').AsString = 'X') and (DBSet.FieldByName('e1valobjyn').AsString <>'N')) then
    begin
      MessageDlg('1차 평가자가 반려한 자료입니다.'#13#13+
                 '목표등록 기간이 종료되었습니다.'#13#13+
                 '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                 '인력개발팀에 문의하십시오. ☏ 6266-4482 ',mtInformation,[mbOK],0);
      Bt_Detail.Enabled:=true;
      Bt_Mod.Enabled:=false;
      Bt_Add.Enabled:=false;
      Bt_del.Enabled:=false;
      Bt_Confirm.Enabled:=false;
      System.exit;
    end  //피평가자 이고, 자기평가를 하지 않았고, 1차 결재자가 반려하지 않은 경우
    else if  (( not EvalYN ) and (DbSet.FieldByName('rprjconyn').AsString = 'X') and (DBSet.FieldByName('e1valobjyn').AsString <>'Y')) then
    begin
      MessageDlg('결재 상신을 하지 않은 자료입니다.'#13#13+
                 '목표등록 기간이 종료되었습니다.'#13#13+
                 '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                 '인력개발팀에 문의하십시오. ☏ 6266-4482 ',mtInformation,[mbOK],0);
      Bt_Detail.Enabled:=true;
      Bt_Mod.Enabled:=false;
      Bt_Add.Enabled:=false;
      Bt_del.Enabled:=false;
      Bt_Confirm.Enabled:=false;
      System.exit;
    end;

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
       (DbSet.FieldByName('e1prjconyn').AsString <> 'Y') then  //1차평가자가 목표확인한경우
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
                   '목표등록 기간이 종료되었습니다.'#13#13+
                   '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                   '인력개발팀에 문의하십시오. ☏ 6266-4482 '
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
                   '목표등록 기간이 종료되었습니다.'#13#13+
                   '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                   '인력개발팀에 문의하십시오. ☏ 6266-4482 '
                   ,mtInformation,[mbOK],0);
        ButtonEnabled;
        Bt_Mod.Enabled := false;
        Bt_Add.Enabled := false;
        Bt_del.Enabled := false;
        Bt_Confirm.Enabled := false;
        System.exit;
      end
      else if (DBSet.FieldByName('rprjconyn').AsString = 'Y') and start            // 메세지 처음한번만 뜨게하기 위함 (30.40 손종운 )
          and (DBSet.FieldByName('e1prjconyn').AsString = 'N') then // 결재된 자료의 수정임다.
      begin
         MessageDlg('1차 평가자 결재처리중입니다.'#13#13+
                    '목표등록 기간이 종료되었습니다.'#13#13+
                    '추가, 수정, 삭제, 결재상신을 할수 없습니다.'#13#13+
                    '인력개발팀에 문의하십시오. ☏ 6266-4482 ' ,mtInformation,[mbOK],0);
        ButtonEnabled;

        Bt_Mod.Enabled := false;
        Bt_Add.Enabled := false;
        Bt_del.Enabled := false;
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
  {
  peInitComponent(Self,88);
  if Nt_Book.ActivePage = '관리직' then
     Grid1.DataSource.DataSet.Close;

  if Nt_Book.ActivePage = '영업직' then
     Grid2.DataSource.DataSet.Close;

  Bt_Mod.Enabled := False;
  Bt_Add.Enabled := False;
  Bt_Del.Enabled := False;
  Bt_Opt.Enabled := False;
  Bt_Can.Enabled := False;
  Bt_Confirm.Enabled := False;
  Bt_Detail.Enabled  := False;
 }
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
  Fm : TFm_sub_Form1;
begin
  Try
    Fm := TFm_sub_Form1.Create(Self);
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

    Fm.Lrabasdate := Lrabasdate;
    Fm.Lfordate   := Lfordate;
    Fm.gsLastConEv:= gsLastConEv;
    Fm.LSeqno     := 0;
    {
    if (Nt_Book.ActivePage = '관리직') and (TComponent(Sender).Tag = 1) then    //관리직 수정
       Fm.LSeqno := Grid1.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '영업직') and (TComponent(Sender).Tag = 1) then    //영업직 수정
       Fm.LSeqno := Grid2.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '자기계발') and (TComponent(Sender).Tag = 1) then  //자기계발 수정
       Fm.LSeqno := Grid3.DataSource.DataSet.FieldByName('seqno').AsFloat;

    if (Nt_Book.ActivePage = '관리직') then
    begin
       Fm.DbSet := Grid1.DataSource.DataSet;
    end
    else if (Nt_Book.ActivePage = '영업직') then
       Fm.DbSet := Grid2.DataSource.DataSet
    else
       Fm.DbSet := Grid3.DataSource.DataSet;       //자기계발
    }
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
begin
  //전체비중 합계
  if Eda_weight.Value <> 100 then
    begin
      MessageDlg('전체비중 합계가 100 이어야 합니다.',mtError, [mbOk], 0);
      System.Exit;
    end;

  //입력값 체크
  if not Check_Edit1 then
      System.Exit;

  //세부추진활동 3개이상이어야 한다.
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
  if detail_cnt < 3 then
    begin
      MessageDlg('세부추진 활동이 3개 이상이어야 합니다.',mtError, [mbOk], 0);
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


  Save := 0;
  ToMail := '';

  if Pa_jobgun.Hint <> '22' then  // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
  begin
    //DbSet := Grid1.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.'+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
//==============================================================================//
      Lgubun := 0;
      ToMail := '1차메일';
    end;

    if Lwork = '1차' then Lgubun := 1;

    if Lwork = '2차' then Lgubun := 2;

    if Lgubun = 1 then // 1차결재자
    begin
      if (gsLastConEv = '2차') and (Trim(Le2empno) <> '') then
      begin
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.'+#13+
             '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
             '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
             '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
           Save := 2 // 내역보관
        else                    //결재상신
           Save := 1; // 내역보관
    end;

//      if Lgubun = 2 then
    if (gsLastConEv = '2차') and (Lgubun = 2) then // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
//====================================================================================================//
//   30.41      2001.08.01         손종운 remark -- 의견등록 버튼 visible = false
//====================================================================================================//
//         if ID_YES = messagebox(handle,
//                 '2차 평가자의견을 등록하시겠습니까? ','확인',MB_YESNO or $0030) then
//            Bt_ModClick(Bt_Opt);
//====================================================================================================//
      end;

//        Save := 1; // 내역보관
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

//====================================================================================================//
//   30.41      2001.08.24         손종운 수정 -- 자기계발화면에서
//====================================================================================================//
//  if Nt_Book.ActivePage = '영업직' then
  // 2005.03.17 수정
  //if Pa_jobgun.Hint = '40' then

  // 2005.03.17 수정
  if Pa_jobgun.Hint = '22' then // 기존에 영업직군이 '40' 이 었는데, 현재는 '22'로 바뀌었음.
//====================================================================================================//
  begin
    // DbSet := Grid2.DataSource.DataSet;
    if Lwork = '피평가자' then
    begin
      MessageDlg('1차평가자에게 확인요청 메일이 발송됩니다.'+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
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
        MessageDlg('2차평가자에게 확인요청 메일이 발송됩니다.'+#13+
             '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
             '비밀번호를 입력해 주시길 바랍니다.'+#13#13+
             '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
        Save := 0;
        ToMail := '2차메일';
      end
      else
        if Bt_Confirm.Caption = '결재' then
          Save := 2 // 내역보관
        else
          Save := 1; // 내역보관
    end;

//      if Lgubun = 2 then
    if (gsLastConEv = '2차') and (Lgubun = 2) then  // 2차결재자
    begin
      if trim(DbSet.FieldByName('e2prjview').AsString) = '' then
      begin
//====================================================================================================//
//   30.41      2001.08.01         손종운 remark -- 의견등록 버튼 visible = false
//====================================================================================================//
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

  // 메일을 보낸다.
  if ToMail = '1차메일' then
    Send_Mail('업무목표설정 1차평가자 확인요청',
              Le1empno, Le1korname,
              '목표설정을 완료했습니다.'+#13+#13+
                ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                '★확인방법:종합인사정보시스템 ▶[평가] ▶[사원목표관리] ▶[개인별 업무목표 등록/결재]',
              '0' );
  if ToMail = '2차메일' then
    Send_Mail('개인업무목표설정 확인요청',
              Le2empno, Le2korname,
              '['+DbSet.FieldByName('korname').AsString+']사원이 개인업무목표를 설정하였습니다.'+#13+#13+
                ' 확인해 주시기 바랍니다. (요청시각:'+sendtime+')'+#13+#13+
                '★확인방법:종합인사정보시스템 ▶[평가] ▶[사원목표관리] ▶[개인별 업무목표 등록/결재]',
              '0' );

  St_Help.Panels[0].Text := '';
  Ed_empno.SetFocus;
end;

procedure TMainForm.Ed_empnoRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer;
begin
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
end;

procedure TMainForm.Bt_delClick(Sender: TObject);
var
  Msg   : string;
  DbSet : TDataSet;
  Param : OleVariant;
begin
 {
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
 }
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
{===============================================================================
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//==============================================================================//
//   31.55      2002.04.06          손종운         Notes 기능 삭제
//==============================================================================//
    MessageDlg('피평가자에게 반려메일이 발송됩니다.'#13+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
//==============================================================================//
  end;

{===============================================================================
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
   30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
===============================================================================}
//  if (Lwork = '2차') then
  if (gsLastConEv = '2차') and (Lwork = '2차') then
  begin
    Tomail := '모두';
    DM.FSvr_UpdateSql(4,2,Param); //반려, 2차, (평가기준일,접속자사번,피평가자사번)
                                  //e2prjobjyn = 'Y', e1prjconyn  = 'N', e1prjcondate = '',
                                  //rprjconyn  = 'N', rprjcondate = ''
  end;

  // 메일을 보낸다.
  if ToMail = '피평가자' then
//==============================================================================//
//   31.55      2002.04.06          손종운         Notes 기능 삭제
//==============================================================================//
    Send_Mail('목표설정 1차평가자 반려메일',
              Ed_empno.LabelHint,Ed_empno.Text,
              '목표설정을 반려했습니다. 다시 설정하여 주십시오.',
              '1');
//==============================================================================//
  if ToMail = '모두' then
  begin
//==============================================================================//
//   31.55      2002.04.06          손종운         Notes 기능 삭제
//==============================================================================//
    MessageDlg('피평가자에게 반려메일이 발송됩니다.'#13+#13+
               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
               '비밀번호를 입력해 주시길 바랍니다.'+#13+
               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
//==============================================================================//

{    MessageDlg('1차평가자에게 반려메일이 발송됩니다.'#13+#13+
//               '다음에 나타나는 비밀번호 입력창에서 사내정보유통시스템(HINT)의 '+#13+
//               '비밀번호를 입력해 주시길 바랍니다.'+#13+
//               '★주의 : 인사정보시스템의 비밀번호가 아니라 HINT의 비밀번호임',mtInformation,[mbOK],0);
//    Send_Mail('목표설정 2차평가자 반려메일',Le1korname+' '+Le1empno,
//              '['+Ed_empno.Text+']사원의 목표설정을 반려했습니다. 피평가자의 목표설정 후 다시 확인하여 주십시요.'+#13+
//              '★확인방법:종합인사정보시스템▶종합평가 '+#13+
//              '           ▶사원목표관리▶사원목표변경등록');
}
  end;

   Ed_empno.SetFocus;
end;

function TMainForm.VersionGetting(PgmId,sVer : string) : Boolean;
//var
//  ARoot   : HKey;
//  ASubKey : string;
//  tVer    : string;
begin
//  Result  := False;
//  ARoot   := HKEY_LOCAL_MACHINE;
//  ASubKey := 'SOFTWARE\(주) 하나로\종합인사정보시스템';
//  tVer    := GetKeyValue(ARoot,ASubKey,Uppercase(PgmId));
//  if tVer <>  sVer then
//    Result := True;
end;

procedure TMainForm.Bt_pea1040cClick(Sender: TObject);
//var
//  SqlText  : string;
//  version  : string;
//  rBoolean : integer;
//  progid, progname, progmsg, LocalDir, ServerDir : String;
begin
//  if TPeJeonOutLookBtn(sender).Tag = 1 then
//  begin
//    progid := 'PEA1040C';
//    progmsg:= '목표면담표 이력';
//    LocalDir := HomeDirOpen + '\bin\ebin';
//  end
//  else
//  begin
////    progid   := 'PME1020B';
////    progmsg  := '업무목표 열람';
////    LocalDir := HomeDirOpen + '\bin\mbin';
//  end;
//
//  SqlText := 'SELECT  MAX(version) version  FROM pymmenu       '+
//             ' WHERE mkind > ''1'' AND progid = '''+progid+''' ';
////
//  tuxCDM.Csel_SQL := Sqltext;
//  tuxCDM.Csel_Open;
//  if not tuxCDM.Csel_ret then
//    begin
//      Messagedlg('APP-Server Error : ' + tuxCDM.Csel.ServiceName + #13 +
//                 '[' + tuxCDM.Csel.HeaderInfo.ErrCode + '] ' + tuxCDM.Csel.HeaderInfo.ErrMsg
//                 ,mtError,[mbOK],0);
//      Exit;
//    end;
//  version := tuxCDM.Csel_gfd(1);
//
//  if (not FileExists(LocalDir+'\'+progid+'.EXE')) or (VersionGetting(progid,version)) then
//  begin
//    if TPeJeonOutLookBtn(sender).Tag = 1 then
//      MessageDlg('목표이력 열람 프로그램 버전이 변경되었습니다.'#13#13+
//                 '메뉴 초기화면에서 '#13#13+
//                 '[종합평가->사원목표관리->목표면담표 출력]를 실행하시기 바랍니다.',mtInformation,[mbOK],0)
//    else
//      MessageDlg('팀 목표열람 프로그램 버전이 변경되었습니다.'#13#13+
//                 '메뉴 초기화면에서 '#13#13+
//                 '[종합평가->부서평가->평가기준서]를 실행하시기 바랍니다.',mtInformation,[mbOK],0);
//    System.Exit;
//  end;
//
//  rBoolean :=  CreateInsaExe(LocalDir+'\'+progid+'.EXE ,'+
//                             Pempno+','+
//                             Pkorname +','+
//                             pPass    +','+
//                             pClass   +','+
//                             '210.4.4.62'+','+
//                             progmsg);
//  if rBoolean <> 0 then
//  begin
//      MessageBox(0,PChar('Error Number : '+IntTostr(rBoolean)+' 에해당하는 에러입니다 !!.'),
//                 '알  림',MB_OK or $0030);
//      System.Exit;
//  end;
end;

//====================================================================================//
//   30.39      2001.07.24         손종운 추가                 자기계발목표 추가
//====================================================================================//
procedure TMainForm.Select_Form(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0 : begin                                        // 업무목표
//====================================================================================//
//   30.42      2001.08.23         손종운 수정                      업무협의후 수정;화면과 버튼 활성롸등
//====================================================================================//
//          Bt_Opt.Visible     := True;
//          Bt_Confirm.Visible := True;
//          Bt_Can.Visible     := True;
//====================================================================================//

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
//====================================================================================//
//   30.42      2001.08.23         손종운 수정       업무협의후 수정; 화면과 버튼 활성롸등
//====================================================================================//
//          Bt_Opt.Visible     := False;
//          Bt_Confirm.Visible := False;
//          Bt_Can.Visible     := False;
//====================================================================================//
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
  DataModule_Tmax.Insa_Data.Gubun  := data_code;
  Result := '';
  if Trim(Acodeno) = '' then
    System.Exit;
  DataModule_Tmax.Insa_Data.codeid := Acodeid;
  DataModule_Tmax.Insa_Data.codeno := Acodeno;
  Result                           := DataModule_Tmax.Insa_Data.Data;
end;

function TMainForm.Get_Dept(Acodeid, Acodeno : String) : String;
begin
  DataModule_Tmax.Insa_Data.Gubun  := data_dept;
  Result := '';
  if Trim(Acodeno) = '' then
    System.Exit;
  DataModule_Tmax.Insa_Data.deptcode := Acodeid;
  DataModule_Tmax.Insa_Data.orgnum   := Acodeno;
  Result                             := DataModule_Tmax.Insa_Data.Data;
end;

procedure TMainForm.btn_PrintClick(Sender: TObject);
begin
  if ((DM.DBSET1.Eof) and (DM.DBSET1.Bof)) then
  begin
   MessageDlg('출력할 데이터가 없습니다.'+#13+#10+''+#13+#10+'출력 작업은 취소 되었습니다.', mtError, [mbOK], 0);
   System.Exit;
  end;
  PrintForm.PeQuickRepPrn1.Preview;
end;

function TMainForm.Check_Edit1 : Boolean;
begin
  Result := False;

  DM.DBSet1.First;

  while not DM.DBSet1.Eof do
  begin
    if Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)  = '' then
    begin
      MessageDlg('중점추진업무 항목 필수 입력.',mtError,[mbOK],0);
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
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK1').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT1').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS1').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS1').AsString) = ''))) then
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
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK2').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT2').AsInteger = 0) or
           (Trim(DM.DBSet1.FieldByName('VALIDX2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('SRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('ARESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('BRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('CRESULTCLASS2').AsString) = '') or
           (Trim(DM.DBSet1.FieldByName('DRESULTCLASS2').AsString) = ''))) then
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
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK3').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT3').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS3').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS3').AsString) = ''))) then
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
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK4').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT4').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS4').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS4').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    if Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '' then
    begin
      if ((Trim(DM.DBSet1.FieldByName('DETAILTASK5').AsString) <> '') and
         ((DM.DBSet1.FieldByName('DETAILWEIGHT5').AsInteger = 0) or
          (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('SRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('ARESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('BRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('CRESULTCLASS5').AsString) = '') or
          (Trim(DM.DBSet1.FieldByName('DRESULTCLASS5').AsString) = ''))) then
      begin
        MessageDlg(Trim(DM.DBSet1.FieldByName('PROPELTASK').AsString)+'에 대한 자료가 부족 합니다.',mtError,[mbOK],0);
        System.Exit;
      end;
    end
    else
    begin
      if (Trim(DM.DBSet1.FieldByName('VALIDX5').AsString) <> '') or
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

end.
