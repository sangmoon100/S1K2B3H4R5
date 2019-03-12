unit pit203010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Db, ComCtrls,
  OnInsaCommon, kylib1, datelib, codetext, Tuxlib;

const
    PRTROW = 20;

type
   DataSource_insa = record
      gubun      : string[1];
      korname	 : string[12];	// 성명
      empno	 : string[4];	// 사번
      deptname	 : string[60];	// 소속
      payranm	 : string[14];	// 직위
      paygr1	 : string[14];	// 직급+호봉
      paycldate  : string[8];	// 직급일
      orgempdate : string[8];	// 하나로입사일
      paygr2	 : string[14];	// 입사시 직급,호봉
      empdate	 : string[8];	// 최초입사일
      empcode	 : string[15];	// 입사구분
      cardate    : string[10];  // 경력일
      jobplace   : string[16];  // 근무지
      trlimfrto  : string[17];  // 전보제한기간
      licalkind  : string[20];  // 자격선임
      jobline    : string[20];  // 입사직렬
      empjobplace: string[20];  // 입사근무지
      juminid	 : string[14];	// 주민번호
      korage     : string[8];  // 연령
      usaageSex  : string[8];	// 나이,성별
      marrigeyn  : string[4];	// 혼인여부
      //ability	 : string[10];	// 특기
      armykind	 : string[10];	// 군별
      armyfrto   : string[21];	// 군복무기간
      curaddr    : string[50];  // 현주소
      regaddr    : string[50];  // 본적
      telno      : string[16];  // 전화번호
      bornarea   : string[12];  // 출생지
      junpay_amt : string[18];  // 전년도연봉
      jungita_amt: string[18];  // 전년도 기타급여
      danpay_amt : string[18];  // 당년도연봉
      pstate     : string[20];  // 인사상태
      psdate     : string[22];  // 인사상태에서의 기간
      bcaryy     : string[2];   // 입사전총경력년월
      bcarmm     : string[2];
      prnDate    : string[10];  // 출력일자
      exduym     : string[11];  // 총근속제외년,월
      caramt     : string[4];   // 총경력
   // --------학력사항----------------------------------
      schgr	 : array[1..4] of string[10];   // 학력구분
      schnm	 : array[1..4] of string[18];  // 학교명
      schfrtoym	 : array[1..4] of string[11];   // 졸업일
      majorcode  : array[1..4] of string[18];  // 전공학과
   // --------가족사항----------------------------------
      facode     : array[1..6] of string[8];  // 관계
      faname     : array[1..6] of string[12]; // 성명
      fabirth    : array[1..6] of string[10]; // 생일
      faschgr    : array[1..6] of string[10]; // 학력
      faplace    : array[1..6] of string[20]; // 직위
   // --------발령사항----------------------------------
      ancode     : array[1..20] of string[12];
      andate     : array[1..20] of string[21];
      anpaycl    : array[1..20] of string[12];
      anpayra    : array[1..20] of string[12];
      anpayra2   : array[1..20] of string[12];
      andept     : array[1..20] of string[120];
   // --------교육사항----------------------------------
      edufrtodate : array[1..5] of string[17];
      educourse   : array[1..5] of string[40];
      edutype     : array[1..5] of string[20];
      edutime     : array[1..5] of string[20];
      eduscore    : array[1..5] of string[20];
      edugubun    : array[1..5] of string[20];

   // --------입사전경력--------------------------------
      carplace   : array[1..4] of string[20]; // 근무처
      carymd     : array[1..4] of string[11]; // 기간
      carym	 : array[1..4] of string[20]; // 경력년월
      cardept    : array[1..4] of string[26]; // 근무부서(직위)
      carjobnm   : array[1..4] of string[26]; // 담당직무
   // --------자격증사항--------------------------------
      licekind    : array[1..2] of string[20];
      licgr      : array[1..2] of string[10]; // 등급
      licgetdate : array[1..2] of string[10]; // 취득일
      licalfield : array[1..2] of string[30]; // 선임분야
   // --------외국어 사항--------------------------------
      langname    : array[1..2] of string[15]; // 외국어
      examname    : array[1..2] of string[10]; // 시험명
      examscore   : array[1..2] of string[4]; // 점수
      examdate    : array[1..2] of string[10]; // 검정일
   // --------인사고과는 -------------------------------
      intodate   : array[1..6] of string[4];
      ipaycl     : array[1..6] of string[6];
      ie1scr     : array[1..6] of string[16];
      ie2scr     : array[1..6] of string[16];
      adjclass   : array[1..6] of string[10];
   // --------상향평가는 -------------------------------
      aptodate   : array[1..3] of string[4];
      apaycl     : array[1..3] of string[6];
      aclass     : array[1..3] of string[4];
      ascore     : array[1..3] of string[6];
   // --------포상사항----------------------------------
      rekindnm   : array[1..2] of string[20]; // 포상명
      reorgnm    : array[1..2] of string[12]; // 포상권자
      redate     : array[1..2] of string[10];  // 포상일자
   // --------징계사항----------------------------------
      pukindnm   : array[1..2] of string[20]; // 징계명
      pucause    : array[1..2] of string[36]; // 징계사유
      pudate     : array[1..2] of string[10];  // 징계일
      
   // 1999.07.28 추가 
	empterm		: string[20];		// 입사기수
	remark		: string[20];		// 특기사항
	lschgr		: string[20];		// 최종학력
      	tjobduty	: string[40];		// 계약직무
      	height		: string[10];		// 신장
     	weight		: string[10];		// 체중
      	blood		: string[05];		// 혈액형
      	religion	: string[20];		// 종교
      	habit		: string[15];		// 취미
      	ability		: string[15];		// 특기
      	armycl		: string[20];		// 계급
      	armyfield 	: string[20];		// 병과
      	armydis		: string[20];		// 제대구분
      	armyfrdate	: string[10];		// 복무기간Fr
      	armytodate	: string[10];		// 복무기간To

 	// 비정규학력
      	eduorgnm	: array[1..4] of string[30];
      	educontent	: array[1..4] of string[30];
      	edudate		: array[1..4] of string[11];

      	scgubun		: string[20];		// 특례구분
      	scentdate	: string[10];		// 편입일
      	scpredate	: string[10];		// 만료예정일
      	scenddate	: string[10];		// 만료일

      	bohungubun	: string[20];		// 보훈구분
      	bohunnm		: string[12];		// 유공자
      	bohunrel	: string[20];		// 보훈구분

      	obskind		: string[20];		// 장애유형
      	obsgr		: string[20];		// 장애등급
      	obsstate	: string[30];		// 장애상태
        // 조직전보일
        realtrdate      : string[8];            // 전보일
        offtrdate       : string[8];            // 조직전보일
    end;

var
    STB: TStatusBar;
    C_RunSave,dpay_amt,tmpday : integer;
    wordPad   : Boolean;
    FreeCheck,FreeDept,Dataempno : Boolean;
    CurDate   : string[8];
    bYearPayNum: String; // 전년 연봉차수
    Dacomgu_checked: Boolean;

    norgnum   : string[3];   {현조직차수}
    ndept     : string[5];   {현부서}
    npayra    : string[3];   {현직위}
    pancode   : array[1..PRTROW] of string[3];  {발령구분}
    panfrdate : array[1..PRTROW] of string[8];  {발령일 from}
    pantodate : array[1..PRTROW] of string[8];  {  "     to}
    ppaycl    : array[1..PRTROW] of string[8];  {직급}
    ppayra    : array[1..PRTROW] of string[8];  {직위}
    porgnum   : array[1..PRTROW] of string[3];  {조직차수}
    pdeptcode : array[1..PRTROW] of string[6];  {부서코드}
    pmark1    : array[1..PRTROW] of string[40]; {비고1}
    pmark2    : array[1..PRTROW] of string[40]; {비고2}
    pmark3    : array[1..PRTROW] of string[40]; {비고3}
    eFile     : TextFile;
    tData     : Datasource_insa;
    tFile     : file of Datasource_insa;
    sqlcommand1, sqltext, temp_orgempdate: string;
//    empText     : sText;
    ErrorHelp   : array[0..255] of char;
    HomeDir     : string;
    loadCount   : integer;      {인사경력로드 건수}
    sqlstr      : AnsiString;
    baseDate_Text: string;
    gu4 : Integer;

    procedure PrintFormInit;
    procedure QueryPimsch(str : string);
    procedure QueryPimFami(str : string);
    procedure QueryPimCari(str : string);
    procedure QueryPimjPay(str : string);
    procedure QueryPimdPay(str : string);
    procedure QueryPimLic(str : string);
    procedure QueryPimfore(str : string);
    procedure QueryPimtran(str : string);
    procedure QueryPimingo(str : string);
    procedure QueryPimappr(str : string);
    procedure QueryPimRewa(str : string);
    procedure QueryPimPuni(str : string);
    procedure QueryPihAnno(str : string);
    procedure QueryPihpstate(str : string);
    procedure Carr_rtn(a_ancode,a_anfrdate,a_antodate : string; c: integer);
    function QCodeDisp(s1,s2 : String) : String;
    function QDeptDisp(s1,s2 : String) : String;
    procedure QmasExec(FEmpno: String);
    procedure Run_Text_Create;
    procedure helpHint(str : string);

implementation

uses
  pit203000, pit203011;

procedure helpHint(str : string);
begin
  STB.Panels[1].Text := str;
  SendMessage(STB.handle,WM_PAINT,0,0);
end;

procedure PrintFormInit;
begin
  gu4 := 3;
  HomeDir  := GetHomeDir;
  if FileExists(HomeDir+'\insacode.cod') = False then
    FreeCheck := False
  else
    FreeCheck := True;
  if FileExists(HomeDir+'\insacode.dep') = False then
    FreeDept := False
  else
    FreeDept := True;

  SqlText := 'select to_char(sysdate,''YYYYMMDDHH24MISSD'') from dual';
  With MainForm.TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := SqlText ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;
  CurDate := Trim(MainForm.Csel_gfd(1));

  SqlText := 'select max(a.yearpaynum) byearpaynum '+
                   ' from pkhyphis a, pkcpbas b                                 '+
                   ' where substr(a.yearpaynum,1,4) = substr(b.yearpaynum,1,4)-1';
  With MainForm.TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := SqlText ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;

  if Trim(MainForm.Csel_gfd(1)) = '' then
      bYearPayNum := '0000'
  else
      bYearPayNum := Trim(MainForm.Csel_gfd(1));
  MainForm.TCsel.Close;

  baseDate_Text := CurDate;
  //L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
  //                      copy(CurDate,5,2)+'/'+
  //                      copy(CurDate,7,2);
  //if PassDialog(pia1061cForm,pempno,pkorname,password) = False then halt(0);
  //L_UserName.Caption := pkorname+'('+pempno+')';
  //FreeCheck := DiskSpaceCheck;
  //HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
  //SendMessage(hp.handle,WM_PAINT,0,0);
  //if FreeCheck = True then MakeTextFile;
  helpHint('');

end;

procedure QmasExec(FEmpno: String);
var
  sSql: String;
  ParamVariant: String;
begin
  sSql := Format(
    'SELECT  '+
    ' nvl(        empno      ,'' ''),      nvl(        korname    ,'' ''),      '+
    ' nvl(        pstate     ,'' ''),      nvl(        pstateyn   ,'' ''),      '+
    ' nvl(        paycl      ,'' ''),      nvl(to_char(paygr     ),''0''),      '+
    ' nvl(        deptcode   ,'' ''),      nvl(        orgnum     ,'' ''),      '+
    ' nvl(        fieldcode  ,'' ''),      nvl(        boncode    ,'' ''),      '+
    ' nvl(        fincode    ,'' ''),      nvl(        payra      ,'' ''),      '+
    ' nvl(        paydunm    ,'' ''),      nvl(        realtrdate ,'' ''),      '+
    ' nvl(        offtrdate  ,'' ''),      nvl(        trlimfrdate ,'' ''),     '+
    ' nvl(        trlimtodate ,'' ''),     nvl(        payrayn    ,'' ''),      '+
    ' nvl(        cpayradate ,'' ''),      nvl(        jobdept    ,'' ''),      '+
    ' nvl(        jobplace   ,'' ''),      nvl(        orgempdate ,'' ''),      '+
    ' nvl(        empdate    ,'' ''),      nvl(        cpaycldate ,'' ''),      '+
    ' nvl(        paycldate  ,'' ''),      nvl(        reppaycl   ,'' ''),      '+
    ' nvl(        reppayfrdate ,'' ''),    nvl(        reppaytodate ,'' ''),    '+
    ' nvl(        apdpaydunm ,'' ''),      nvl(        apdpayfrdate ,'' ''),    '+
    ' nvl(        apdpaytodate ,'' ''),    nvl(        actpaydunm ,'' ''),      '+
    ' nvl(        actpayfrdate ,'' ''),    nvl(        actpaytodate ,'' ''),    '+
    ' nvl(        lragrdate  ,'' ''),      nvl(        remark     ,'' ''),      '+
    ' nvl(        empcode    ,'' ''),      nvl(        empterm    ,'' ''),      '+
    ' nvl(        empschgr   ,'' ''),      nvl(        emppaycl   ,'' ''),      '+
    ' nvl(to_char(emppaygr  ),''0''),      nvl(        empjobline ,'' ''),      '+
    ' nvl(        empjobplace ,'' ''),     nvl(to_char(grpaygrsum),''0''),      '+
    ' nvl(to_char(armypaygr ),''0''),      nvl(to_char(maspaygr  ),''0''),      '+
    ' nvl(to_char(carpaygr  ),''0''),      nvl(to_char(etcpaygr  ),''0''),      '+
    ' nvl(        etcpaycont ,'' ''),      nvl(to_char(bcaryy    ),''0''),      '+
    ' nvl(to_char(bcarmm    ),''0''),      nvl(        cardate    ,'' ''),      '+
    ' nvl(        jobgun     ,'' ''),      nvl(        jobgundate ,'' ''),      '+
    ' nvl(        jobline    ,'' ''),      nvl(        joblinedate ,'' ''),     '+
    ' nvl(        jobkind    ,'' ''),      nvl(        jobkinddate ,'' ''),     '+
    ' nvl(        jobduty    ,'' ''),      nvl(        jobdutydate ,'' ''),     '+
    ' nvl(        nogubun    ,'' ''),      nvl(        nojeonyn   ,'' ''),      '+
    ' nvl(        nojnfrdate ,'' ''),      nvl(        nojntodate ,'' ''),      '+
    ' nvl(        lancode    ,'' ''),      nvl(        lannono    ,'' ''),      '+
    ' nvl(        lanfrdate  ,'' ''),      nvl(        lantodate  ,'' ''),      '+
    ' nvl(to_char(exdutcnt  ),''0''),      nvl(to_char(exdutyy   ),''0''),      '+
    ' nvl(to_char(exdutmm   ),''0''),      nvl(to_char(exdutdd   ),''0''),      '+
    ' nvl(        lexfrdate  ,'' ''),      nvl(        lextodate  ,'' ''),      '+
    ' nvl(to_char(lexduyy   ),''0''),      nvl(to_char(lexdumm   ),''0''),      '+
    ' nvl(to_char(lexdudd   ),''0''),      nvl(to_char(payclyy   ),''0''),      '+
    ' nvl(to_char(payclmm   ),''0''),      nvl(to_char(paycldd   ),''0''),      '+
    ' nvl(to_char(totpaycldd),''0''),      nvl(to_char(comduyy   ),''0''),      '+
    ' nvl(to_char(comdumm   ),''0''),      nvl(to_char(comdudd   ),''0''),      '+
    ' nvl(to_char(totcomdudd),''0''),      nvl(        chnname    ,'' ''),      '+
    ' nvl(        engname    ,'' ''),      nvl(        eldsonyn   ,'' ''),      '+
    ' nvl(        marrigeyn  ,'' ''),      nvl(        juminid    ,'' ''),      '+
    ' nvl(to_char(korage    ),''0''),      nvl(to_char(usaage    ),''0''),      '+
    ' nvl(        sex        ,'' ''),      nvl(        holdname   ,'' ''),      '+
    ' nvl(        holdrel    ,'' ''),      nvl(        housetype  ,'' ''),      '+
    ' nvl(        health     ,'' ''),      nvl(        bohunyn    ,'' ''),      '+
    ' nvl(        bornarea   ,'' ''),      nvl(        regaddr    ,'' ''),      '+
    ' nvl(        curaddr    ,'' ''),      nvl(        zipno      ,'' ''),      '+
    ' nvl(        telno      ,'' ''),      nvl(        religion   ,'' ''),      '+
    ' nvl(        habit      ,'' ''),      nvl(        ability    ,'' ''),      '+
    ' nvl(        blood      ,'' ''),      nvl(to_char(height    ),''0''),      '+
    ' nvl(to_char(weight    ),''0''),      nvl(        armykind   ,'' ''),      '+
    ' nvl(        armycl     ,'' ''),      nvl(        armyfield  ,'' ''),      '+
    ' nvl(        armyfrdate ,'' ''),      nvl(        armytodate ,'' ''),      '+
    ' nvl(        armydis    ,'' ''),      nvl(        armyex     ,'' ''),      '+
    ' nvl(        lschgr     ,'' ''),      nvl(        lschdeg    ,'' ''),      '+
    ' nvl(        lschcode   ,'' ''),      nvl(        lschnm     ,'' ''),      '+
    ' nvl(        lmajorcode ,'' ''),      nvl(        lschfrym   ,'' ''),      '+
    ' nvl(        lschgrym   ,'' ''),      nvl(        unicode    ,'' ''),      '+
    ' nvl(        unimajor   ,'' ''),      nvl(        unifrym    ,'' ''),      '+
    ' nvl(        unigrym    ,'' ''),      nvl(        lschmajnm  ,'' ''),      '+
    ' nvl(        lschtopic  ,'' ''),      nvl(        lickind    ,'' ''),      '+
    ' nvl(        licgr      ,'' ''),      nvl(        licgetdate ,'' ''),      '+
    ' nvl(        licalkind  ,'' ''),      nvl(        licalgr    ,'' ''),      '+
    ' nvl(        licalgetdate ,'' ''),    nvl(        licalfield ,'' ''),      '+
    ' nvl(        licaldate  ,'' ''),      nvl(        licbigo    ,'' ''),      '+
    ' nvl(to_char(toeicscore),''0''),      nvl(to_char(toeicfull ),''0''),      '+
    ' nvl(        toeicdate  ,'' ''),      nvl(to_char(jptscore  ),''0''),      '+
    ' nvl(to_char(jptfull   ),''0''),      nvl(        jptdate    ,'' ''),      '+
    ' nvl(        edugubun   ,'' ''),      nvl(        eduplace   ,'' ''),      '+
    ' nvl(        educourse  ,'' ''),      nvl(        edufrdate  ,'' ''),      '+
    ' nvl(        edutodate  ,'' ''),      nvl(        eduarea    ,'' ''),      '+
    ' nvl(        educont    ,'' ''),      nvl(        edudufrdate ,'' ''),     '+
    ' nvl(        edudutodate ,'' ''),     nvl(        lrkind     ,'' ''),      '+
    ' nvl(        lrfrdate   ,'' ''),      nvl(        lrtodate   ,'' ''),      '+
    ' nvl(        lvfrdate   ,'' ''),      nvl(        lvtodate   ,'' ''),      '+
    ' nvl(        lsekind    ,'' ''),      nvl(        lsefrdate  ,'' ''),      '+
    ' nvl(        lsetodate  ,'' ''),      nvl(        lseplace   ,'' ''),      '+
    ' nvl(        lsesayu    ,'' ''),      nvl(        lsecont    ,'' ''),      '+
    ' nvl(        bohungubun ,'' ''),      nvl(        bohunnm    ,'' ''),      '+
    ' nvl(        bohunrel   ,'' ''),      nvl(        bohunno    ,'' ''),      '+
    ' nvl(        bohunbran  ,'' ''),      nvl(        scgubun    ,'' ''),      '+
    ' nvl(        scentdate  ,'' ''),      nvl(        scpredate  ,'' ''),      '+
    ' nvl(        scenddate  ,'' ''),      nvl(        sctermyn   ,'' ''),      '+
    ' nvl(to_char(scexyy    ),''0''),      nvl(to_char(scexmm    ),''0''),      '+
    ' nvl(to_char(scexdd    ),''0''),      nvl(        scexcause  ,'' ''),      '+
    ' nvl(        obskind    ,'' ''),      nvl(        obsgr      ,'' ''),      '+
    ' nvl(        obsstate   ,'' ''),      nvl(        hugubun    ,'' ''),      '+
    ' nvl(        hufrdate   ,'' ''),      nvl(        hutodate   ,'' ''),      '+
    ' nvl(        retdate    ,'' ''),      nvl(        retgubun   ,'' ''),      '+
    ' nvl(        retsayu1   ,'' ''),      nvl(        retsayu2   ,'' ''),      '+
    ' nvl(        retcont    ,'' ''),      nvl(        otdufrdate ,'' ''),      '+
    ' nvl(        otdutodate ,'' ''),      nvl(        tcontr     ,'' ''),      '+
    ' nvl(to_char(tcontramt ),''0''),      nvl(        ttype      ,'' ''),      '+
    ' nvl(        tjobduty   ,'' ''),      nvl(        tcond      ,'' ''),      '+
    ' nvl(        tcompany   ,'' ''),      nvl(        writetime  ,'' ''),      '+
    ' nvl(        writeemp   ,'' ''),      nvl(to_char(hanaduyy  ),''0''),      '+
    ' nvl(to_char(hanadumm  ),''0''),      nvl(to_char(hanadudd  ),''0'')       '+
    'from pimpmas                                                               '+
    'where empno = ''%s''                                                       ',
    [FEmpno]);

  with MainForm.TMain do
  begin
    Close;
    ClearFieldInfo;
    ParamVariant := sSql;
    AddField('EMPNO'        , ftString ,  4  );
    AddField('KORNAME'      , ftString ,  12 );
    AddField('PSTATE'       , ftString ,  2  );
    AddField('PSTATEYN'     , ftString ,  1  );
    AddField('PAYCL'        , ftString ,  3  );
    AddField('PAYGR'        , ftInteger,  3  );
    AddField('DEPTCODE'     , ftString ,  6  );
    AddField('ORGNUM'       , ftString ,  3  );
    AddField('FIELDCODE'    , ftString ,  3  );
    AddField('BONCODE'      , ftString ,  6  );
    AddField('FINCODE'      , ftString ,  6  );
    AddField('PAYRA'        , ftString ,  3  );
    AddField('PAYDUNM'      , ftString ,  30 );
    AddField('REALTRDATE'   , ftString ,  8  );
    AddField('OFFTRDATE'    , ftString ,  8  );
    AddField('TRLIMFRDATE'  , ftString ,  8  );
    AddField('TRLIMTODATE'  , ftString ,  8  );
    AddField('PAYRAYN'      , ftString ,  1  );
    AddField('CPAYRADATE'   , ftString ,  8  );
    AddField('JOBDEPT'      , ftString ,  6  );
    AddField('JOBPLACE'     , ftString ,  2  );
    AddField('ORGEMPDATE'   , ftString ,  8  );
    AddField('EMPDATE'      , ftString ,  8  );
    AddField('CPAYCLDATE'   , ftString ,  8  );
    AddField('PAYCLDATE'    , ftString ,  8  );
    AddField('REPPAYCL'     , ftString ,  3  );
    AddField('REPPAYFRDATE' , ftString ,  8  );
    AddField('REPPAYTODATE' , ftString ,  8  );
    AddField('APDPAYDUNM'   , ftString ,  30 );
    AddField('APDPAYFRDATE' , ftString ,  8  );
    AddField('APDPAYTODATE' , ftString ,  8  );
    AddField('ACTPAYDUNM'   , ftString ,  30 );
    AddField('ACTPAYFRDATE' , ftString ,  8  );
    AddField('ACTPAYTODATE' , ftString ,  8  );
    AddField('LRAGRDATE'    , ftString ,  8  );
    AddField('REMARK'       , ftString ,  2  );
    AddField('EMPCODE'      , ftString ,  2  );
    AddField('EMPTERM'      , ftString ,  3  );
    AddField('EMPSCHGR'     , ftString ,  2  );
    AddField('EMPPAYCL'     , ftString ,  3  );
    AddField('EMPPAYGR'     , ftInteger,  3  );
    AddField('EMPJOBLINE'   , ftString ,  2  );
    AddField('EMPJOBPLACE'  , ftString ,  2  );
    AddField('GRPAYGRSUM'   , ftInteger,  3  );
    AddField('ARMYPAYGR'    , ftInteger,  3  );
    AddField('MASPAYGR'     , ftInteger,  3  );
    AddField('CARPAYGR'     , ftInteger,  3  );
    AddField('ETCPAYGR'     , ftInteger,  3  );
    AddField('ETCPAYCONT'   , ftString ,  30 );
    AddField('BCARYY'       , ftInteger,  3  );
    AddField('BCARMM'       , ftInteger,  3  );
    AddField('CARDATE'      , ftString ,  8  );
    AddField('JOBGUN'       , ftString ,  2  );
    AddField('JOBGUNDATE'   , ftString ,  8  );
    AddField('JOBLINE'      , ftString ,  2  );
    AddField('JOBLINEDATE'  , ftString ,  8  );
    AddField('JOBKIND'      , ftString ,  2  );
    AddField('JOBKINDDATE'  , ftString ,  8  );
    AddField('JOBDUTY'      , ftString ,  3  );
    AddField('JOBDUTYDATE'  , ftString ,  8  );
    AddField('NOGUBUN'      , ftString ,  2  );
    AddField('NOJEONYN'     , ftString ,  1  );
    AddField('NOJNFRDATE'   , ftString ,  8  );
    AddField('NOJNTODATE'   , ftString ,  8  );
    AddField('LANCODE'      , ftString ,  3  );
    AddField('LANNONO'      , ftString ,  8  );
    AddField('LANFRDATE'    , ftString ,  8  );
    AddField('LANTODATE'    , ftString ,  8  );
    AddField('EXDUTCNT'     , ftInteger,  3  );
    AddField('EXDUTYY'      , ftInteger,  3  );
    AddField('EXDUTMM'      , ftInteger,  3  );
    AddField('EXDUTDD'      , ftInteger,  3  );
    AddField('LEXFRDATE'    , ftString ,  8  );
    AddField('LEXTODATE'    , ftString ,  8  );
    AddField('LEXDUYY'      , ftInteger,  3  );
    AddField('LEXDUMM'      , ftInteger,  3  );
    AddField('LEXDUDD'      , ftInteger,  3  );
    AddField('PAYCLYY'      , ftInteger,  3  );
    AddField('PAYCLMM'      , ftInteger,  3  );
    AddField('PAYCLDD'      , ftInteger,  3  );
    AddField('TOTPAYCLDD'   , ftInteger,  6  );
    AddField('COMDUYY'      , ftInteger,  3  );
    AddField('COMDUMM'      , ftInteger,  3  );
    AddField('COMDUDD'      , ftInteger,  3  );
    AddField('TOTCOMDUDD'   , ftInteger,  6  );
    AddField('CHNNAME'      , ftString ,  12 );
    AddField('ENGNAME'      , ftString ,  20 );
    AddField('ELDSONYN'     , ftString ,  1  );
    AddField('MARRIGEYN'    , ftString ,  1  );
    AddField('JUMINID'      , ftString ,  14 );
    AddField('KORAGE'       , ftInteger,  3  );
    AddField('USAAGE'       , ftInteger,  3  );
    AddField('SEX'          , ftString ,  1  );
    AddField('HOLDNAME'     , ftString ,  12 );
    AddField('HOLDREL'      , ftString ,  2  );
    AddField('HOUSETYPE'    , ftString ,  2  );
    AddField('HEALTH'       , ftString ,  1  );
    AddField('BOHUNYN'      , ftString ,  1  );
    AddField('BORNAREA'     , ftString ,  2  );
    AddField('REGADDR'      , ftString ,  50 );
    AddField('CURADDR'      , ftString ,  50 );
    AddField('ZIPNO'        , ftString ,  7  );
    AddField('TELNO'        , ftString ,  15 );
    AddField('RELIGION'     , ftString ,  1  );
    AddField('HABIT'        , ftString ,  15 );
    AddField('ABILITY'      , ftString ,  15 );
    AddField('BLOOD'        , ftString ,  3  );
    AddField('HEIGHT'       , ftInteger,  4  );
    AddField('WEIGHT'       , ftInteger,  4  );
    AddField('ARMYKIND'     , ftString ,  1  );
    AddField('ARMYCL'       , ftString ,  2  );
    AddField('ARMYFIELD'    , ftString ,  2  );
    AddField('ARMYFRDATE'   , ftString ,  8  );
    AddField('ARMYTODATE'   , ftString ,  8  );
    AddField('ARMYDIS'      , ftString ,  1  );
    AddField('ARMYEX'       , ftString ,  2  );
    AddField('LSCHGR'       , ftString ,  2  );
    AddField('LSCHDEG'      , ftString ,  2  );
    AddField('LSCHCODE'     , ftString ,  4  );
    AddField('LSCHNM'       , ftString ,  30 );
    AddField('LMAJORCODE'   , ftString ,  4  );
    AddField('LSCHFRYM'     , ftString ,  6  );
    AddField('LSCHGRYM'     , ftString ,  6  );
    AddField('UNICODE'      , ftString ,  4  );
    AddField('UNIMAJOR'     , ftString ,  4  );
    AddField('UNIFRYM'      , ftString ,  6  );
    AddField('UNIGRYM'      , ftString ,  6  );
    AddField('LSCHMAJNM'    , ftString ,  30 );
    AddField('LSCHTOPIC'    , ftString ,  50 );
    AddField('LICKIND'      , ftString ,  3  );
    AddField('LICGR'        , ftString ,  1  );
    AddField('LICGETDATE'   , ftString ,  8  );
    AddField('LICALKIND'    , ftString ,  3  );
    AddField('LICALGR'      , ftString ,  1  );
    AddField('LICALGETDATE' , ftString ,  8  );
    AddField('LICALFIELD'   , ftString ,  30 );
    AddField('LICALDATE'    , ftString ,  8  );
    AddField('LICBIGO'      , ftString ,  40 );
    AddField('TOEICSCORE'   , ftFloat  ,  7  );
    AddField('TOEICFULL'    , ftFloat  ,  7  );
    AddField('TOEICDATE'    , ftString ,  8  );
    AddField('JPTSCORE'     , ftFloat  ,  7  );
    AddField('JPTFULL'      , ftFloat  ,  7  );
    AddField('JPTDATE'      , ftString ,  8  );
    AddField('EDUGUBUN'     , ftString ,  2  );
    AddField('EDUPLACE'     , ftString ,  30 );
    AddField('EDUCOURSE'    , ftString ,  60 );
    AddField('EDUFRDATE'    , ftString ,  8  );
    AddField('EDUTODATE'    , ftString ,  8  );
    AddField('EDUAREA'      , ftString ,  10 );
    AddField('EDUCONT'      , ftString ,  40 );
    AddField('EDUDUFRDATE'  , ftString ,  8  );
    AddField('EDUDUTODATE'  , ftString ,  8  );
    AddField('LRKIND'       , ftString ,  2  );
    AddField('LRFRDATE'     , ftString ,  8  );
    AddField('LRTODATE'     , ftString ,  8  );
    AddField('LVFRDATE'     , ftString ,  8  );
    AddField('LVTODATE'     , ftString ,  8  );
    AddField('LSEKIND'      , ftString ,  2  );
    AddField('LSEFRDATE'    , ftString ,  8  );
    AddField('LSETODATE'    , ftString ,  8  );
    AddField('LSEPLACE'     , ftString ,  40 );
    AddField('LSESAYU'      , ftString ,  40 );
    AddField('LSECONT'      , ftString ,  40 );
    AddField('BOHUNGUBUN'   , ftString ,  2  );
    AddField('BOHUNNM'      , ftString ,  12 );
    AddField('BOHUNREL'     , ftString ,  2  );
    AddField('BOHUNNO'      , ftString ,  15 );
    AddField('BOHUNBRAN'    , ftString ,  30 );
    AddField('SCGUBUN'      , ftString ,  1  );
    AddField('SCENTDATE'    , ftString ,  8  );
    AddField('SCPREDATE'    , ftString ,  8  );
    AddField('SCENDDATE'    , ftString ,  8  );
    AddField('SCTERMYN'     , ftString ,  1  );
    AddField('SCEXYY'       , ftInteger,  3  );
    AddField('SCEXMM'       , ftInteger,  3  );
    AddField('SCEXDD'       , ftInteger,  3  );
    AddField('SCEXCAUSE'    , ftString ,  30 );
    AddField('OBSKIND'      , ftString ,  2  );
    AddField('OBSGR'        , ftString ,  1  );
    AddField('OBSSTATE'     , ftString ,  30 );
    AddField('HUGUBUN'      , ftString ,  2  );
    AddField('HUFRDATE'     , ftString ,  8  );
    AddField('HUTODATE'     , ftString ,  8  );
    AddField('RETDATE'      , ftString ,  8  );
    AddField('RETGUBUN'     , ftString ,  2  );
    AddField('RETSAYU1'     , ftString ,  2  );
    AddField('RETSAYU2'     , ftString ,  2  );
    AddField('RETCONT'      , ftString ,  40 );
    AddField('OTDUFRDATE'   , ftString ,  8  );
    AddField('OTDUTODATE'   , ftString ,  8  );
    AddField('TCONTR'       , ftString ,  1  );
    AddField('TCONTRAMT'    , ftInteger,  12 );
    AddField('TTYPE'        , ftString ,  20 );
    AddField('TJOBDUTY'     , ftString ,  40 );
    AddField('TCOND'        , ftString ,  40 );
    AddField('TCOMPANY'     , ftString ,  2  );
    AddField('WRITETIME'    , ftString ,  15 );
    AddField('WRITEEMP'     , ftString ,  4  );
    AddField('HANADUYY'     , ftInteger,  3  );
    AddField('HANADUMM'     , ftInteger,  3  );
    AddField('HANADUDD'     , ftInteger,  3  );
    Sql.Clear;
    Sql.Text := ParamVariant;
    ServiceName := 'PIT2030A_SEL8';
    Open;
    //TFunc_TQueryAuto('SPIA1060S5', ParamVariant, MainForm.ttxMain);
  end;
end;

function QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  SqlText := 'SELECT CODEID, CODENO, nvl(CODENAME,'' '') codename  '+
             'FROM  PYCCODE                    '+
      Format('WHERE CODEID = ''%s'' AND CODENO = ''%s'' ',[s1,s2]);

  if trim(s2) <> '' then begin
    if FreeCheck = False then begin
      MainForm.Qcode.Close;
      MainForm.Qcode.ClearFieldInfo;
      MainForm.Qcode.AddField('CODEID'       , ftString,  4 );
      MainForm.Qcode.AddField('CODENO'       , ftString,  10);
      MainForm.Qcode.AddField('CODENAME'     , ftString,  20);

      MainForm.Qcode.Sql.Clear;
      MainForm.Qcode.Sql.Text := SqlText;
      MainForm.Qcode.ServiceName := 'PIT2030A_SEL7';
      MainForm.Qcode.Open;
//        TFunc_TQueryAuto('SPIA1060S4', SqlText, MainForm.Qcode);

      QCodeDisp := MainForm.Qcode.FieldByName('CodeName').AsString;
      if trim(MainForm.Qcode.FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
    end else begin
      str := TextCodeDisp(s1,s2,HomeDir+'\insacode.cod');
      QCodeDisp := str;
      if trim(str) = '' then QcodeDisp := '('+s2+')';
    end;
  end else QCodeDisp := '';
end;

function QDeptDisp(s1,s2 : String) : String;
{부서명을 가져온다..}
var
  str : string;
begin
  if trim(s2) = '' then
  begin
    QDeptDisp := '';
    System.exit;
  end;

  SqlText := Format('SELECT ORGNUM,  DEPTCODE ,  nvl(DEPTNAME,'' '') deptname  '+
                    'FROM  PYCDEPT WHERE ORGNUM = ''%s'' AND DEPTCODE = ''%s'' ',
                    [s1,s2]);

  With MainForm.Qdept do
  begin
    if FreeDept = False then
    begin
      Close;
      ClearFieldInfo;
      AddField('ORGNUM'       , ftString,  3 );
      AddField('DEPTCODE'     , ftString,  6 );
      AddField('DEPTNAME'     , ftString,  60);

      Sql.Clear;
      Sql.Text := SqlText;
      Servicename := 'PIT2030A_SEL6';
      Open;

//      TFunc_TQueryAuto('SPIA1060S3', SqlText, MainForm.Qdept);
      if trim(MainForm.Qdept.FieldByName('DeptName').AsString) = ''  then
        QdeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
      else
        QdeptDisp := MainForm.Qdept.FieldByName('DeptName').AsString;
    end
    else
    begin
       str := TextDeptDisp(s1,s2,HomeDir+'\insacode.dep');
       if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
                         else QDeptDisp := str;
    end;
  end;
end;

procedure QueryPimFami(str : string);
{가족사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 6 do begin
      tData.facode[i]     := '';
      tData.faname[i]     := '';
      tData.fabirth[i]    := '';
      tData.faschgr[i]    := '';
      tData.faplace[i]    := '';
  end;

  with MainForm.Qfami do begin
        SqlText := Format('select '+
                          ' nvl( empno      ,'' ''), '+
                          ' nvl( facode     ,'' ''), '+
                          ' nvl( faname     ,'' ''), '+
                          ' nvl( fabirthdate,'' ''), '+
                          ' nvl( faschgr    ,'' ''), '+
                          ' nvl( faplace    ,'' '')  '+
                          'from pimfami              '+
                          'where empno = ''%s'' order by facode,fabirthdate ',[str]);

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString,  4 );
        AddField('FACODE'       , ftString,  2 );
        AddField('FANAME'       , ftString,  12);
        AddField('FABIRTHDATE'  , ftString,  8 );
        AddField('FASCHGR'      , ftString,  2 );
        AddField('FAPLACE'      , ftString,  30);

        Sql.Clear;
        Sql.Text := SqlText;
        Servicename := 'PIT2030A_SELB';
//        TFunc_TQueryAuto('SPIA1060S8', SqlText, MainForm.Qfami);
  end;
end;

procedure Carr_rtn(a_ancode,a_anfrdate,a_antodate : string; c : integer);
{세부경력 -Rtn}
{해당자료를 메모리에 저장한다.
 -발령구분,발령일From,To: Argument로 넘어온값 저장
 -직급,직위,조직차수,부서코드,비고1 : 현자료의 값을 저장}
{인사요약경력 로드건수를 확인한다..}
begin
   pancode[c]   := a_ancode;
   panfrdate[c] := a_anfrdate;
   pantodate[c] := a_antodate;
   ppaycl[c]    := MainForm.Qann.FieldByName('paycl').AsString;
//---------------------
   ppayra[c]    := MainForm.Qann.FieldByName('payra').AsString;
   porgnum[c]   := Norgnum;
   pdeptcode[c] := Ndept;
   pmark1[c]    := MainForm.Qann.FieldByName('mark1').AsString;
   if MainForm.Qann.FieldByName('mark2').AsString <> ''  then
      pmark2[c]    := ','+trim(MainForm.Qann.FieldByName('mark2').AsString);
   if MainForm.Qann.FieldByName('mark3').AsString <> ''  then
      pmark3[c]    := ','+trim(MainForm.Qann.FieldByName('mark3').AsString);
   if loadCount < PRTROW then inc(loadcount);
end;

procedure QueryPimsch(str : string);
{학력사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 4 do begin
      tData.schgr[i]     := '';
      tData.schnm[i]     := '';
      tData.schfrtoym[i] := '';
      tData.majorcode[i] := '';
  end;

  with MainForm.Qsch do begin

      SqlText := Format('SELECT  '+
                        ' nvl(        empno      ,'' ''), '+
                        ' nvl(        schgr      ,'' ''), '+
                        ' nvl(        schnm      ,'' ''), '+
                        ' nvl(        schfrym    ,'' ''), '+
                        ' nvl(        schtoym    ,'' ''), '+
                        ' nvl(        majorcode  ,'' '')  '+
                        'from pimscho                     '+
                        'where empno = ''%s'' order by schgr desc,schtoym desc', [str]);

      Close;
      ClearFieldInfo;
      AddField('EMPNO'        , ftString ,  4 );
      AddField('SCHGR'        , ftString ,  2 );
      AddField('SCHNM'        , ftString ,  30);
      AddField('SCHFRYM'      , ftString ,  6 );
      AddField('SCHTOYM'      , ftString ,  6 );
      AddField('MAJORCODE'    , ftString ,  4 );

      Sql.Clear;
      Sql.Text := SqlText;
      ServiceName := 'PIT2030A_SELA';
      Open;
//      TFunc_TQueryAuto('SPIA1060S7', SqlText, MainForm.Qsch);
  end;
end;

procedure QueryPihpstate(str : string);
{정직인사발령 사항을 읽어온다..}
begin
  with MainForm.Qann do begin
      SqlText := 'select  max(anfrdate) antodate  from pihanno '+
          Format('where  empno = :lempno and ', [str])+
                 '      (ancode = ''641'' or (ancode = ''600'' and andetcode = ''64'') '+
                  sqlcommand1+ ')';

      Close;
      ClearFieldInfo;
      AddField('ANTODATE'     , ftString,  8);

      Sql.Clear;
      Sql.Text := SqlText;
      ServiceName := 'PIT2030A_SELC';
      Open;
//      TFunc_TQueryAuto('SPIA1060S9', SqlText, MainForm.Qann);
  end;
end;

procedure QueryPihAnno(str : string);
{발령사항을 읽어온다..}
var
  i,nCheck,nCond : integer;
  pa_flag,hu_flag,neworg_flag : integer;
  keyreorg  : string[3];
  keydept   : string[5];
  keypayra  : string[3];
  annoto_pa : string[8];
  //  annoto_hu : string[8];
  //  annofr    : string[8];
  annoto    : string[8];
  yyyy,mm,dd : integer;
  MyDate: TDateTime;

  //const
  // tancode   : array[1..6] of string[3] = ('336','337','346','656','452','454');
begin

  for i := 1 to PRTROW do begin  {메모리의 초기화}
    tData.ancode[i]   := '';
    tData.andate[i]   := '';
    tData.anpaycl[i]  := '';
    tData.anpayra[i]  := '';
    tData.anpayra2[i]  := '';
    tData.andept[i]   := '';
    pancode[i]   := '';
    panfrdate[i] := '';
    pantodate[i] := '';
    ppaycl[i]    := '';
    ppayra[i]    := '';
    porgnum[i]   := '';
    pdeptcode[i] := '';
    pmark1[i]    := '';
    pmark2[i]    := '';
    pmark3[i]    := '';
  end;

  with MainForm.Qann do begin {사원번호,발령경신여부가 'y'자료만 읽어온다..}
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        comgubun   ,'' ''), '+
               ' nvl(        annono     ,'' ''), '+
               ' nvl(        anseqno    ,'' ''), '+
               ' nvl(        anfrdate   ,'' ''), '+
               ' nvl(        antodate   ,'' ''), '+
               ' nvl(        ancode     ,'' ''), '+
               ' nvl(        andetcode  ,'' ''), '+
               ' nvl(        orgnum     ,'' ''), '+
               ' nvl(        deptcode   ,'' ''), '+
               ' nvl(        jobgun     ,'' ''), '+
               ' nvl(        paycl      ,'' ''), '+
               ' nvl(to_char(paygr     ),''0''), '+
        Format(' case when(anfrdate >= ''%s'') then payra else '''' end payra,  ',[Mainform.payraChdate]) +
        Format(' case when(anfrdate <  ''%s'') then payra else '''' end payra2, ',[Mainform.payraChdate]) +
               ' nvl(        jobline    ,'' ''), '+
               ' nvl(        mark1      ,'' ''), '+
               ' nvl(        mark2      ,'' ''), '+
               ' nvl(        mark3      ,'' ''), '+
               ' nvl(        addeptcode ,'' ''), '+
               ' nvl(        adpayra    ,'' ''), '+
               ' nvl(to_char(rpaygr    ),''0''), '+
               ' nvl(to_char(lpaygr    ),''0''), '+
               ' nvl(to_char(spaygr    ),''0''), '+
               ' nvl(        hofrdate   ,'' ''), '+
               ' nvl(        hotodate   ,'' ''), '+
               ' nvl(        retsayu1   ,'' ''), '+
               ' nvl(        retsayu2   ,'' ''), '+
               ' nvl(        tcontr     ,'' ''), '+
               ' nvl(to_char(tcontramt ),''0''), '+
               ' nvl(        tjobduty   ,'' ''), '+
               ' nvl(        ttype      ,'' ''), '+
               ' nvl(        tcompany   ,'' ''), '+
               ' nvl(        bannono    ,'' ''), '+
               ' nvl(        banfrdate  ,'' ''), '+
               ' nvl(        bantodate  ,'' ''), '+
               ' nvl(        bancode    ,'' ''), '+
               ' nvl(        bandetcode ,'' ''), '+
               ' nvl(        borgnum    ,'' ''), '+
               ' nvl(        bdeptcode  ,'' ''), '+
               ' nvl(        bpaycl     ,'' ''), '+
               ' nvl(to_char(bpaygr    ),''0''), '+
               ' nvl(        bpayra     ,'' ''), '+
               ' nvl(        anupdyn    ,'' ''), '+
               ' nvl(        anupdtime  ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '')  '+
        Format('from pihanno where (empno = ''%s'' and anupdyn = ''Y'')  ',[str])+
               '  and (ancode not in (''336'',''337'',''346'',''656'',''452'',''454'',''935'')  '+
               sqlcommand1+')'+
              'order by comgubun desc,anfrdate desc,annono desc,ancode desc';

          Close;
          ClearFieldInfo;
          AddField('EMPNO'        , ftString ,  4 );
          AddField('KORNAME'      , ftString ,  12);
          AddField('COMGUBUN'     , ftString ,  1 );
          AddField('ANNONO'       , ftString ,  8 );
          AddField('ANSEQNO'      , ftString ,  4 );
          AddField('ANFRDATE'     , ftString ,  8 );
          AddField('ANTODATE'     , ftString ,  8 );
          AddField('ANCODE'       , ftString ,  3 );
          AddField('ANDETCODE'    , ftString ,  2 );
          AddField('ORGNUM'       , ftString ,  3 );
          AddField('DEPTCODE'     , ftString ,  6 );
          AddField('JOBGUN'       , ftString ,  2 );
          AddField('PAYCL'        , ftString ,  3 );
          AddField('PAYGR'        , ftInteger,  3 );
          AddField('PAYRA'        , ftString ,  3 );
          AddField('PAYRA2'       , ftString ,  3 );
          AddField('JOBLINE'      , ftString ,  2 );
          AddField('MARK1'        , ftString ,  40);
          AddField('MARK2'        , ftString ,  40);
          AddField('MARK3'        , ftString ,  40);
          AddField('ADDEPTCODE'   , ftString ,  6 );
          AddField('ADPAYRA'      , ftString ,  3 );
          AddField('RPAYGR'       , ftInteger,  3 );
          AddField('LPAYGR'       , ftInteger,  3 );
          AddField('SPAYGR'       , ftInteger,  3 );
          AddField('HOFRDATE'     , ftString ,  8 );
          AddField('HOTODATE'     , ftString ,  8 );
          AddField('RETSAYU1'     , ftString ,  2 );
          AddField('RETSAYU2'     , ftString ,  2 );
          AddField('TCONTR'       , ftString ,  1 );
          AddField('TCONTRAMT'    , ftInteger,  12);
          AddField('TJOBDUTY'     , ftString ,  40);
          AddField('TTYPE'        , ftString ,  20);
          AddField('TCOMPANY'     , ftString ,  2 );
          AddField('BANNONO'      , ftString ,  8 );
          AddField('BANFRDATE'    , ftString ,  8 );
          AddField('BANTODATE'    , ftString ,  8 );
          AddField('BANCODE'      , ftString ,  3 );
          AddField('BANDETCODE'   , ftString ,  2 );
          AddField('BORGNUM'      , ftString ,  3 );
          AddField('BDEPTCODE'    , ftString ,  6 );
          AddField('BPAYCL'       , ftString ,  3 );
          AddField('BPAYGR'       , ftInteger,  3 );
          AddField('BPAYRA'       , ftString ,  3 );
          AddField('ANUPDYN'      , ftString ,  1 );
          AddField('ANUPDTIME'    , ftString ,  15);
          AddField('WRITETIME'    , ftString ,  15);
          AddField('WRITEEMP'     , ftString ,  4 );

          Sql.Clear;
          Sql.Text := SqlText;
          ServiceName := 'PIT2030A_SELD';
          Open;
//          TFunc_TQueryAuto('SPIA1060SA', SqlText, MainForm.Qann);
   {출력용 메모리에 쿼리한 결과를 저장한다..}
   {단  발령구분이 승급 336,승호 337,호봉조정 346, 강호 656, 교육연장 452,교육복귀 454인
    자료와 발령구분이 급호조정(341)인데 직급이 변동없으면 제외한다.}
   {첫번째 자료 변수 annoto에 현재일자 저장}
   annoto := baseDate_Text;
   pa_flag   := 0; hu_flag := 0; neworg_flag := 0;
   loadcount := 1;
   while not MainForm.Qann.Eof do begin
     if loadcount > PRTROW then break;
    npayra   := MainForm.Qann.FieldByName('payra').AsString;
    norgnum  := MainForm.Qann.FieldByName('orgnum').AsString;
    ndept    := MainForm.Qann.FieldByName('deptcode').AsString;
    nCheck := 0;
    //  for j := 1 to 6 do
    //     if FieldByName('ancode').AsString = tAncode[j] then inc(nCheck);
    if FieldByName('ancode').AsString = '341' then
       if FieldByName('paycl').AsString = FieldByName('bpaycl').AsString then inc(nCheck);

    if nCheck > 0 then begin MainForm.Qann.Next; Continue; end;
    {이루틴은 변칙적으로 사용하였다..****주의를 헤서 보기 바란다..***********}
    nCond := 0;
    if FieldByName('ancode').AsString = '414' then  nCond := 1;
    if FieldByName('ancode').AsString = '412' then  nCond := 2;
    if FieldByName('ancode').AsString = '411' then  nCond := 3;
    if FieldByName('ancode').AsString = '451' then  nCond := 4;
    if FieldByName('ancode').AsString = '514' then  nCond := 5;
    if FieldByName('ancode').AsString = '512' then  nCond := 6;
    if FieldByName('ancode').AsString = '511' then  nCond := 7;
    if copy(FieldByName('ancode').AsString,1,1) = '2' then  nCond := 8;
    if copy(FieldByName('ancode').AsString,1,1) = '6' then  nCond := 9;
    if ((FieldByName('ancode').AsString = '311') or (FieldByName('ancode').AsString = '322')) or
        ((copy(FieldByName('ancode').AsString,1,1) = '1') and
         ((copy(FieldByName('ancode').AsString,3,1) = '1') or
          (copy(FieldByName('ancode').AsString,3,1) = '4'))) then nCond := 10;

    {nCond 조건에 맞는 데이타를 추출한다..}
    {nCond 1 -> 발령구분이 파견복귀 이면
                - anonoto_pa에 발령일 from을 저장.
                - pa_flag 1증가}
    {nCond 2 -> 발령구분이 파견연장이면
                - if pa_flag = 0 이면 annoto_pa에 발령일 to를 저장.
                - pa_flag 1증가}
    {nCond 3 -> 발령구분이 파견이면
                - if pa_flag = 0 이면 annoto_pa에 발령일 to를 저장.
                - 세부경력 rtn(발령구분,발령일 From,annoto_pa)
                - pa_flag 0 저장}
    {nCond 4 -> 발령구분이 교육이면
                - 세부경력 rtn(발령구분,발령일 From,발령일 to)}
    {nCond 5 -> 발령구분이 복직이면
                - 세부경력 rtn(발령구분,발령일 From,annoto)
                - annoto에 발령일 from을 1일을 감소하여 저장
                - hu_flag 를 1증가}
    {nCond 6 -> 발령구분이 휴직연장이면
                - if hu_flag = 0 이면 annoto에 발령일 to 저장
                - hu_flag 를 1증가}
    {nCond 7 -> 발령구분이 휴직이면
                - if hu_flag = 0 이면 세부경력 rtn(발령구분,발령일 from,발령일 to)
                  else 세부경력 rtn(발령구분,발령일 from,annoto), hu_flag := 0
                - annoto 에 발령일을 1일감소하여 저장}
    {nCond 8 -> 발령구분 첫번째자리가 = '2'이면
                -if (발령구분 = 수습해제) or (발령구분 = 전보 and 발령세부구분 = 조직전보) 일경우는
                    if neworg_flag = 0 이면
                       .keyreorg,keydept,keypayra에 현자료의 값을 저장하고 neworg_flag를 1 증가
                -if (발령구분 = 전보 and 발령세부구분 = 전보) or
                    (발령구분 = 보임해제) or (발령구분 = 보임) 일경우
                    if neworg_flag != 0 이면
                       .현자료의 조직차수,부서코드,직위코드에 keyreorg,keydept,keypayra를 저장
                - 세부경력 rtn(발령구분,발령일 from,annoto)
                - neworg_flag := 0;
                - keyreorg,keydept,keypayra 에 space
                - annotodp 발령일 from 을 1 감소하여 저장}
    {nCond 9 -> if 발령구분 첫번째자리가 = '6' /*징계 */
                   -if 발령구분 세번째자리 = '9'   /*퇴직*/
                       세부경력 rtn(발령구분,발령일 from,annoto)
                    else if 전직급 = 후직급 다음자료 처리
                         else 세부경력 rtn(발령구분,발령일 from,annoto)
                   - annotodp 발령일 from 을 1 감소하여 저장}
    {nCond 10-> if 발령구분 = 승격,직무대리,발령구분첫번째자리가 '1'(신규채용)
                   - if neworg_flag != 0
                     .현자료의 조직차수,부서코드,직위코드에 keyreorg,keydept,keypayra를 저장
                     . neworg_flag := 0;
                     . keyreorg,keydept,keypayra 에 space
                   - 세부경력 rtn(발령구분,발령일 from,annoto)
                   - annotodp 발령일 from 을 1 감소하여 저장}
    {(*) 모든 경우를 제외한 발령구분은
          - 세부경력 rtn(발령구분,발령일 from,annoto)
          - annotodp 발령일 from 을 1 감소하여 저장}
    case nCond of
     1 : begin
         //annoto_pa := FieldByName('anfrdate').AsString;
         annoto_pa := FieldByName('anfrdate').AsString;
         try
           yyyy := strtoint(copy(annoto_pa,1,4));
           mm   := strtoint(copy(annoto_pa,5,2));
           dd   := strtoint(copy(annoto_pa,7,2));
           MyDate := EncodeDate(yyyy, mm, dd);
           annoto_pa := FormatDateTime('yyyymmdd', MyDate-1);
         except
           annoto_pa :='파견복귀일 수정요함';
         end;
         inc(pa_flag);
         end;
     2 : begin
         if pa_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
         inc(pa_flag);
         end;
     3: begin
        if pa_flag = 0 then annoto_pa := FieldByName('antodate').AsString;
        Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto_pa,loadcount);
        pa_flag := 0;
        end;
     4: begin
        Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,
                 FieldByName('antodate').AsString,loadcount);
        end;
     5: begin
        Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
        annoto := DateCal1(FieldByName('anfrdate').AsString);
        inc(hu_flag);
        end;
     6: begin
        if FieldByName('antodate').AsString >= baseDate_Text then
             annoto := baseDate_Text
        else begin
             if hu_flag = 0 then
                annoto := FieldByName('antodate').AsString;
        end;
        inc(hu_flag);
        end;
     7: begin
        if hu_flag = 0 then begin
           if FieldByName('antodate').AsString >= baseDate_Text then
               annoto := baseDate_Text
           else annoto := FieldByName('antodate').AsString;
           Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount)
        end
        else begin
                Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
                hu_flag := 0;
             end;
        annoto := DateCal1(FieldByName('anfrdate').AsString);
        end;
     8: begin
        if (FieldByName('ancode').AsString = '288') or
           ((FieldByName('ancode').AsString = '211') and
            (FieldByName('andetcode').AsString = '12')) then
        begin
           if neworg_flag = 0 then begin
              Keyreorg := Norgnum;
              keydept  := Ndept;
              keypayra := Npayra;
              inc(neworg_flag);
           end;
        end
        else if (FieldByName('ancode').AsString = '211') or
//              and (FieldByName('andetcode').AsString = '11')   //발령세부구분 11 임원은 세부구분 코드가 없어서 ....
                (FieldByName('ancode').AsString = '228') or (FieldByName('ancode').AsString = '222') or
                (FieldByName('ancode').AsString = '251') then begin
                if neworg_flag <> 0 then begin
                   Norgnum  := keyreorg;
                   Ndept    := keydept;
                   Npayra   := keypayra;
                end;
                Carr_Rtn(FieldByName('ancode').AsString,FieldByName('anfrdate').AsString,annoto,loadcount);
                keyreorg := ''; keydept := ''; keypayra := '';
                neworg_flag := 0;
                annoto := DateCal1(FieldByName('anfrdate').AsString);
        end;
        end;
     9: begin
        if copy(FieldByName('ancode').AsString,3,1) = '9' then
           Carr_Rtn(FieldByName('ancode').AsString,
                    FieldByName('anfrdate').AsString,annoto,loadcount)
        else if FieldByName('paycl').AsString = FieldByName('bpaycl').AsString then begin
                MainForm.Qann.Next; Continue;
             end else
                 Carr_Rtn(FieldByName('ancode').AsString,
                          FieldByName('anfrdate').AsString,annoto,loadcount);
        annoto := DateCal1(FieldByName('anfrdate').AsString);
        end;
    10: begin
        if (FieldByName('ancode').Asstring='311') and (FieldByName('andetcode').Asstring='41') then
        begin
           MainForm.Qann.Next;
           continue;
        end;
        if neworg_flag <> 0 then begin
           Norgnum  := keyreorg;
           Ndept    := keydept;
           Npayra   := keypayra;
           keyreorg := ''; keydept := ''; keypayra := '';
           neworg_flag := 0;
        end;
        Carr_Rtn(FieldByName('ancode').AsString,
                 FieldByName('anfrdate').AsString,annoto,loadcount);
        annoto := DateCal1(FieldByName('anfrdate').AsString);
        end;
     else begin
            Carr_Rtn(FieldByName('ancode').AsString,
                     FieldByName('anfrdate').AsString,annoto,loadcount);
            annoto := DateCal1(FieldByName('anfrdate').AsString);
          end;
     end; {case nCond of}
     MainForm.Qann.Next;
    end; {while not Qann.Eof do begin}
   end; {with Qann do begin}
   MainForm.Qann.Close;
end;

procedure QueryPimCari(str : string);
{입사전경력사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 4 do begin
      tData.carplace[i]   := '';
      tData.carymd[i]     := '';
      tData.carym[i]      := '';
      tData.cardept[i]    := '';
      tData.carjobnm[i]   := '';
  end;

  with MainForm.QCar do begin
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        carfrdate  ,'' ''), '+
               ' nvl(        cartodate  ,'' ''), '+
               ' nvl(to_char(carduyy   ),''0''), '+
               ' nvl(to_char(cardumm   ),''0''), '+
               ' nvl(to_char(cardudd   ),''0''), '+
               ' nvl(        carplace   ,'' ''), '+
               ' nvl(        cardeptnm  ,'' ''), '+
               ' nvl(        carjobnm   ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '')  '+
        Format('from pimcarr where empno = ''%s'' order by carfrdate desc', [str]);

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('KORNAME'      , ftString ,  12);
        AddField('CARFRDATE'    , ftString ,  8 );
        AddField('CARTODATE'    , ftString ,  8 );
        AddField('CARDUYY'      , ftInteger,  3 );
        AddField('CARDUMM'      , ftInteger,  3 );
        AddField('CARDUDD'      , ftInteger,  3 );
        AddField('CARPLACE'     , ftString ,  30);
        AddField('CARDEPTNM'    , ftString ,  30);
        AddField('CARJOBNM'     , ftString ,  30);
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELE';
        Open;
//        TFunc_TQueryAuto('SPIA1060SB', SqlText, MainForm.Qcar);
  end;
end;

procedure QueryPimLic(str : string);
{자격증사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.licekind[i]   := '';
      tData.licgr[i]      := '';
      tData.licgetdate[i] :='';
      tData.licalfield[i] :='';
  end;
  with MainForm.QLic do begin
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        lickind    ,'' ''), '+
               ' nvl(        licgr      ,'' ''), '+
               ' nvl(        licno      ,'' ''), '+
               ' nvl(        licgetdate ,'' ''), '+
               ' nvl(        licupddate ,'' ''), '+
               ' nvl(to_char(licrank   ),''0''), '+
               ' nvl(        licalyn    ,'' ''), '+
               ' nvl(        licaldate  ,'' ''), '+
               ' nvl(        licalfield ,'' ''), '+
               ' nvl(        licbigo    ,'' ''), '+
               ' nvl(        licdidate  ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '')  '+
        Format('from pimlice where empno = ''%s'' order by licrank', [str]);

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('KORNAME'      , ftString ,  12);
        AddField('LICKIND'      , ftString ,  3 );
        AddField('LICGR'        , ftString ,  1 );
        AddField('LICNO'        , ftString ,  15);
        AddField('LICGETDATE'   , ftString ,  8 );
        AddField('LICUPDDATE'   , ftString ,  8 );
        AddField('LICRANK'      , ftInteger,  2 );
        AddField('LICALYN'      , ftString ,  1 );
        AddField('LICALDATE'    , ftString ,  8 );
        AddField('LICALFIELD'   , ftString ,  30);
        AddField('LICBIGO'      , ftString ,  40);
        AddField('LICDIDATE'    , ftString ,  8 );
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        Servicename := 'PIT2030A_SELF';
        Open;
//        TFunc_TQueryAuto('SPIA1060SC', SqlText, MainForm.QLic);
  end;
end;

{-------------------------------------------------------------------------------
 버전     수정일      수정자   관련근거       수정내용
 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
                                            전년도 급여기준으로 연봉계산, empdate부터 계산.
 -------------------------------------------------------------------------------}
procedure QueryPimjpay(str : string);
{전년도 급여사항을 읽어온다..}
begin
{
31.00  99.1.5   김혜진  임원은 그대로, 이사대우이하는 연봉내역화일에서 전년연봉을 읽는다.
}
  with MainForm.QLic do begin
//    if MainForm.TMain.FieldByName('paycl').Asstring <= '08' then begin //임원이상이면 연봉이 아닌 예전의 것 그대로
   if MainForm.TMain.FieldByName('paycl').Asstring <= 'A45' then  begin //임원이상이면 연봉이 아닌 예전의 것 그대로
      SqlText := 'select empno, sum(basicamt+infoamt+dutyamt+bbasicamt+binfoamt+bdutyamt+ '+
                 '       +bonusamt+incentamt    '+
                 '       +trainamt+winteramt+homesupamt+sobon)  jun_amt, '+
                 '       sum(ovtmamt+sptmamt+ybonamt+mbonamt+mateamt+partamt+childamt+mcaramt+liceamt+sopay+odamt) gita_amt '+
          Format(' from  pkhphis where (empno = ''%s'')                 '+
                 '       and substr(paydate,1,4) = ''%s''  and  payyn = ''Y'' '+
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
                 ' group  by  empno ',[str, IntToStr(StrToInt(copy(CurDate,1,4))-1)]);

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,   4);
        AddField('JUN_AMT'      , ftInteger,  15);
        AddField('GITA_AMT'     , ftInteger,  15);

        Sql.Clear;
        Sql.text:= SqlText;
        ServiceName := 'PIT2030A_SELG';
        Open;
//        TFunc_TQueryAuto('SPIA1060SD', SqlText, MainForm.QLic);

      if  MainForm.Qlic.recordcount <= 0  then begin
         tdata.junpay_amt :=FormatFloat('##,###,###,###',0);
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.junpay_amt  := FormatFloat('##,###,###,###',MainForm.Qlic.FieldByName('jun_amt').AsFloat)+' 원';
      tdata.jungita_amt  := FormatFloat('##,###,###,###',MainForm.Qlic.FieldByName('gita_amt').AsFloat)+' 원';
    end  //이사이상
    else begin //전년도연봉은 개인연봉내역화일에서 기본연봉과 업적연봉을 합한값.
//      수정전
//      sql.add('select (TOTPAY)jun_amt ');
//      sql.add(' from  PKHYPHIS where (empno = :lempno)                 ');
//      sql.add('       and YEARPAYNUM = :lpaydate  ');
//       수정안 -->
      SqlText := 'select TOTPAY jun_amt '+
                 ' from  PKHYPHIS where (empno = ''%s'') '+
          Format('       and YEARPAYNUM = ''%s''  ', [str,bYearPayNum]);

        Close;
        ClearFieldInfo;
        AddField('JUN_AMT'      , ftInteger,  12 );

        Sql.clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELN';
        Open;
//        TFunc_TQueryAuto('SPIA1060SL', SqlText, MainForm.QLic);
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
      if  MainForm.Qlic.recordcount <= 0  then begin
         tdata.junpay_amt :=FormatFloat('##,###,###,###',0);
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.junpay_amt  := FormatFloat('##,###,###,###',MainForm.Qlic.FieldByName('jun_amt').AsFloat)+' 원';
      //기타연봉은 급여마스터화일에서 직책수당+식대교통비+가족수당+법정자격수당+복지연금+
      //초과근무+특별근무+연월차수당+자가운전지원금+소급+직책수당

      SqlText := 'select sum(roleamt+mcaramt+mateamt+partamt+childamt+liceamt+bokjisupamt '+
                 '       +ovtmamt+sptmamt+ybonamt+mbonamt+odamt+sopay+dutyamt) gita_amt   '+
          Format('from  pkhphis where (empno = ''%s'')                 '+
                 '      and substr(paydate,1,4) = ''%s'' and  payyn = ''Y'' ',
                 [str, IntToStr(StrToInt(copy(CurDate,1,4))-1)]);
{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
        Close;
        ClearFieldInfo;
        AddField('GITA_AMT'      , ftInteger,  12);

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELN';
        Open;
//        TFunc_TQueryAuto('SPIA1060SL', SqlText, MainForm.QLic);
      if  MainForm.Qlic.recordcount <= 0  then begin
         tdata.jungita_amt :=FormatFloat('##,###,###,###',0);
         system.exit;
      end;
      tdata.jungita_amt  := FormatFloat('##,###,###,###',MainForm.Qlic.FieldByName('gita_amt').AsFloat)+' 원';
   end;// 이사대우 이하
  end;
end;

procedure QueryPimdpay(str : string);
{31.00  당년 급여사항을 읽어온다..}
var
  i,home_amt,winter_amt,basic_amt,info_amt,duty_amt,tpaygr : integer;
  dpay_amt1  : integer;
  paynum,tpaydate : string;
begin
  dpay_amt := 0;  dpay_amt1 := 0;
  basic_amt:=0;   info_amt :=0;    duty_amt :=0;
  with MainForm.QLic do begin

    SqlText := 'select cpaynum   from  pkcpbas';
    With MainForm.TCsel do begin
      Close;
      ClearFieldInfo;
      Addfield('sel_data',ftString, 300);
      Sql.Clear;
      Sql.Text := SqlText ;
      ServiceName := 'PIT2030A_SELZ';
      Open;
    end;

    paynum := Trim(MainForm.Csel_gfd(1));

    SqlText := 'select  value1||'';''||value2 from  pimvari where  gubun = ''PK'' and  sgubun = ''0001'' ';
    With MainForm.TCsel do begin
      Close;
      ClearFieldInfo;
      Addfield('sel_data',ftString, 300);
      Sql.Clear;
      Sql.Text := SqlText ;
      ServiceName := 'PIT2030A_SELZ';
      Open;
    end;

    home_amt   := StrToIntDef(Trim(MainForm.Csel_gfd(1)),0);
    winter_amt := StrToIntDef(Trim(MainForm.Csel_gfd(2)),0);

{
 버전     수정일      수정자   관련근거       수정내용
--------------------------------------------------------------------------------
 31.00    99.1.5     김혜진   임원은 그대로계산,이사대우이하는 연봉내역화일에서 읽어온다.
 }
//    if MainForm.TMain.FieldByName('paycl').AsString <= '08' then begin
    if MainForm.TMain.FieldByName('paycl').AsString <= 'A45' then begin

      SqlText := 'select nvl(to_char(basicamt  ),''0''), '+
                 '       nvl(to_char(infoamt   ),''0''), '+
                 '       nvl(to_char(dutyamt   ),''0'')  '+
                 'from  pkcptbl                          '+
          Format('where paynum = ''%s'' and paycl = ''%s''  ',
                 [paynum,MainForm.TMain.FieldByName('paycl').AsString]);

      With MainForm.QLic do
      begin
        Close;
        ClearFields;
        AddField('BASICAMT'     , ftInteger,  9);
        AddField('INFOAMT'      , ftInteger,  9);
        AddField('DUTYAMT'      , ftInteger,  9);

        Sql.Clear;
        Sql.Text:= SqlText;
        ServiceName := 'PIT2030A_SELO';
        Open;
//          TFunc_TQueryAuto('SPIA1060SE', SqlText, MainForm.QLic);

        basic_amt    := FieldByName('basicamt').AsInteger;  //현호봉
        duty_amt     := FieldByName('dutyamt').AsInteger;
        dpay_amt1 := (((basic_amt+ duty_amt)*2)*4) // 정기상여
                       +((basic_amt+duty_amt)*12)//월급여
                       +(home_amt*2)+winter_amt //귀향지원비*2+월동보조비
                       +((basic_amt+duty_amt)*2); //체력단련비(7월,11월)
      end;

      SqlText := 'select max(paydate) paydate from  pkhphis '+
          Format('where (empno = ''%s'') and payyn = ''Y'' ',[str]);
      With MainForm.TCsel do begin
        Close;
        ClearFieldInfo;
        Addfield('sel_data',ftString, 300);
        Sql.Clear;
        Sql.Text := SqlText ;
        ServiceName := 'PIT2030A_SELZ';
        Open;
      end;

      tpaydate := Trim(MainForm.Csel_gfd(1));

      SqlText := 'select (bokjisupamt*12) bokji_amt '+
          Format('from   pkhphis where (empno = ''%s'') and payyn = ''Y'' '+
                 ' and   paydate = ''%s''  ',[str, tpaydate]);
      With MainForm.TCsel do begin
        Close;
        ClearFieldInfo;
        Addfield('sel_data',ftString, 300);
        Sql.Clear;
        Sql.Text := SqlText ;
        ServiceName := 'PIT2030A_SELZ';
        Open;
      end;

      dpay_amt := dpay_amt1 + StrToIntDef(Trim(MainForm.Csel_gfd(1)),0);

    end else begin
//    수정전
//      sql.add('select (TOTPAY)jun_amt ');
//      sql.add(' from  PKHYPHIS where (empno = :lempno)                 ');
//      sql.add('       and YEARPAYNUM = :lpaydate  ');

//      수정안  03/26/2000 9:34오전-->
      SqlText := 'select (TOTPAY) jun_amt '+
          Format('from  PKHYPHIS a, pkcpbas b where (empno = ''%s'') '+
                 ' and a.YEARPAYNUM = b.yearpaynum   ',[str]);
      With MainForm.TCsel do begin
        Close;
        ClearFieldInfo;
        Addfield('sel_data',ftString, 300);
        Sql.Clear;
        Sql.Text := SqlText ;
        ServiceName := 'PIT2030A_SELZ';
        Open;
      end;

{2000년 부터는 연봉협상을 4월에 하므로 주석으로 막은 것을 사용할 것. 99.01.12 khj
      if (inttostr(StrToInt(copy(CurDate,1,4))-1)+'04' <= curdate) and
         (curdate < copy(curdate,1,4)+'04') then  //4월이전
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-2)
      else if (curdate >= copy(curdate,1,4)+'04') then
        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4))-1);
}
//        ParamByName('lpaydate').AsString := IntToStr(StrToInt(copy(CurDate,1,4)));
      if  recordcount <= 0  then begin
        dpay_amt := 0;
        system.exit;
      end;
      dpay_amt  := StrToIntDef(Trim(MainForm.Csel_gfd(1)),0);

    end;  //이사대우이하

  end;
end;

procedure QueryPimfore(str : string);
{외국어사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.langname[i]   := '';
      tData.examname[i]   := '';
      tData.examscore[i]  := '';
      tData.examdate[i]   := '';
  end;
  with MainForm.QLic do begin
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        examdate   ,'' ''), '+
               ' nvl(        langname   ,'' ''), '+
               ' nvl(        examtodate ,'' ''), '+
               ' nvl(        examname   ,'' ''), '+
               ' nvl(to_char(examscore1),''0''), '+
               ' nvl(to_char(examscore2),''0''), '+
               ' nvl(to_char(examscore12),''0''), '+
               ' nvl(        examplace  ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' ''), '+
               ' nvl(        paycl      ,'' '')  '+
               ' from pihfore                    '+
        Format('where empno = ''%s''             ',[str])+
               'order by examdate desc           ';

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('KORNAME'      , ftString ,  12);
        AddField('EXAMDATE'     , ftString ,  8 );
        AddField('LANGNAME'     , ftString ,  15);
        AddField('EXAMTODATE'   , ftString ,  8 );
        AddField('EXAMNAME'     , ftString ,  2 );
        AddField('EXAMSCORE1'   , ftInteger,  4 );
        AddField('EXAMSCORE2'   , ftInteger,  4 );
        AddField('EXAMSCORE12'  , ftInteger,  4 );
        AddField('EXAMPLACE'    , ftString ,  20);
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );
        AddField('PAYCL'        , ftString ,  3 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELH';
        Open;
//        TFunc_TQueryAuto('SPIA1060SF', SqlText, MainForm.QLic);
  end;
end;


procedure QueryPimtran(str : string);
{교육사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 5 do begin
      tData.edufrtodate[i]    := '';
      tData.educourse[i]      := '';
      tData.edutype[i]        := '';
      tData.edutime[i]        := '';
      tData.eduscore[i]       := '';
      tData.edugubun[i]       := '';
  end;
  with MainForm.QLic do begin

    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        edufrdate  ,'' ''), '+
               ' nvl(        edutodate  ,'' ''), '+
               ' nvl(        edutype    ,'' ''), '+
               ' nvl(        edugubun   ,'' ''), '+
               ' nvl(        educourse  ,'' ''), '+
               ' nvl(to_char(edutime   ),''0''), '+
               ' nvl(to_char(eduscore  ),''0''), '+
               ' nvl(        edubigo    ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '') '+
               'from pihtran    '+
        Format('where empno = ''%s'' and  edufrdate >= ''%s'' ', [str, temp_orgempdate])+
               'order by edufrdate desc ';

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('EDUFRDATE'    , ftString ,  8 );
        AddField('EDUTODATE'    , ftString ,  8 );
        AddField('EDUTYPE'      , ftString ,  2 );
        AddField('EDUGUBUN'     , ftString ,  1 );
        AddField('EDUCOURSE'    , ftString ,  40);
        AddField('EDUTIME'      , ftInteger,  5 );
        AddField('EDUSCORE'     , ftInteger,  5 );
        AddField('EDUBIGO'      , ftString ,  1 );
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELI';
        Open;
//        TFunc_TQueryAuto('SPIA1060SG', SqlText, MainForm.QLic);
  end;
end;

// 인사고과사항을 읽어온다..
procedure QueryPimingo(str : string);
var
  i : integer;
begin
  for i := 1 to 6 do begin
      tData.intodate[i] := '';
      tData.ipaycl[i]   := '';
      tData.ie1scr[i]   := '';
      tData.ie2scr[i]   := '';
      tData.adjclass[i] := '';
  end;
  with MainForm.QLic do begin
    SqlText := 'SELECT  '+
               ' nvl(        infrdate   ,'' ''), '+
               ' nvl(        intodate   ,'' ''), '+
               ' nvl(        paycl      ,'' ''), '+
               ' nvl(        e1empno    ,'' ''), '+
               ' nvl(        e1korname  ,'' ''), '+
               ' nvl(to_char(e1score   ),''0''), '+
               ' nvl(        e2empno    ,'' ''), '+
               ' nvl(        e2korname  ,'' ''), '+
               ' nvl(to_char(e2score   ),''0''), '+
               ' nvl(        adjclass   ,'' ''), '+
               ' nvl(to_char(adjscore  ),''0'')  '+
               'from pihingo '+
        Format('where  empno = ''%s'' and adjscore > 0 '+
               '  and  substr(intodate,1,4) >= ''%s''   '+
               '  and  intodate >= ''%s''               '+
               'order by intodate desc                  ',
                [str, IntToStr(StrToInt(copy(CurDate,1,4))-3), temp_orgempdate]);

        Close;
        ClearFieldInfo;
        AddField('INFRDATE'     , ftString,  8 );
        AddField('INTODATE'     , ftString,  8 );
        AddField('PAYCL'        , ftString,  3 );
        AddField('E1EMPNO'      , ftString,  4 );
        AddField('E1KORNAME'    , ftString,  12);
        AddField('E1SCORE'      , ftFloat ,  16);
        AddField('E2EMPNO'      , ftString,  4 );
        AddField('E2KORNAME'    , ftString,  12);
        AddField('E2SCORE'      , ftFloat ,  16);
        AddField('ADJCLASS'     , ftString,  1 );
        AddField('ADJSCORE'     , ftFloat ,  16);

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELJ';
        Open;
//        TFunc_TQueryAuto('SPIA1060SH', SqlText, MainForm.QLic);
  end;
end;

// 상향평가사항을 읽어온다..
procedure QueryPimappr(str : string);
var
  i : integer;
begin
  for i := 1 to 3 do begin
      tData.aptodate[i] := '';
      tData.apaycl[i]   := '';
      tData.ascore[i] := '';
      tData.aclass[i] := '';
  end;
  with MainForm.QLic do begin
    SqlText := 'SELECT  '+
               ' nvl(        aptodate   ,'' ''), '+
               ' nvl(        paycl      ,'' ''), '+
               ' nvl(to_char(apprscore ),''0''), '+
               ' nvl(        apprclass  ,'' '')  '+
               'from pihappr '+
        Format('where empno = ''%s'' and pappryn = ''Y'' and apprscore > 0 '+
               '   and  apfrdate >= ''%s'' ',[str,temp_orgempdate])+
               'order by aptodate desc         ';

        Close;
        ClearFieldInfo;
        AddField('APTODATE'     , ftString,  8 );
        AddField('PAYCL'        , ftString,  3 );
        AddField('APPRSCORE'    , ftFloat ,  10);
        AddField('APPRCLASS'    , ftString,  1 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELK';
        Open;

//        TFunc_TQueryAuto('SPIA1060SI', SqlText, MainForm.QLic);
  end;
end;

procedure QueryPimRewa(str : string);
{포상사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.rekindnm[i]   := '';
      tData.reorgnm[i]    := '';
      tData.redate[i]     := '';
  end;
  with MainForm.QRew do begin
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        orgnum     ,'' ''), '+
               ' nvl(        deptcode   ,'' ''), '+
               ' nvl(        paycl      ,'' ''), '+
               ' nvl(to_char(paygr     ),''0''), '+
               ' nvl(        payra      ,'' ''), '+
               ' nvl(        reno       ,'' ''), '+
               ' nvl(        redate     ,'' ''), '+
               ' nvl(        reclass    ,'' ''), '+
               ' nvl(        rewname    ,'' ''), '+
               ' nvl(        rekind     ,'' ''), '+
               ' nvl(        rekindnm   ,'' ''), '+
               ' nvl(        recause    ,'' ''), '+
               ' nvl(        rebase     ,'' ''), '+
               ' nvl(to_char(reamt     ),''0''), '+
               ' nvl(        remethod   ,'' ''), '+
               ' nvl(        reorg      ,'' ''), '+
               ' nvl(        reorgnm    ,'' ''), '+
               ' nvl(        retime     ,'' ''), '+
               ' nvl(        rerayn     ,'' ''), '+
               ' nvl(to_char(repoint   ),''0''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '')  '+
               'from pimrewa   '+
        Format('where empno = ''%s''  and  redate >= ''%s'' ', [str, temp_orgempdate])+
               'order by redate desc';

        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('KORNAME'      , ftString ,  12);
        AddField('ORGNUM'       , ftString ,  3 );
        AddField('DEPTCODE'     , ftString ,  6 );
        AddField('PAYCL'        , ftString ,  3 );
        AddField('PAYGR'        , ftInteger,  3 );
        AddField('PAYRA'        , ftString ,  3 );
        AddField('RENO'         , ftString ,  11);
        AddField('REDATE'       , ftString ,  8 );
        AddField('RECLASS'      , ftString ,  2 );
        AddField('REWNAME'      , ftString ,  30);
        AddField('REKIND'       , ftString ,  4 );
        AddField('REKINDNM'     , ftString ,  20);
        AddField('RECAUSE'      , ftString ,  50);
        AddField('REBASE'       , ftString ,  40);
        AddField('REAMT'        , ftInteger,  12);
        AddField('REMETHOD'     , ftString ,  30);
        AddField('REORG'        , ftString ,  3 );
        AddField('REORGNM'      , ftString ,  20);
        AddField('RETIME'       , ftString ,  1 );
        AddField('RERAYN'       , ftString ,  1 );
        AddField('REPOINT'      , ftFloat  ,  5 );
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELL';
        Open;
//        TFunc_TQueryAuto('SPIA1060SJ', SqlText, MainForm.QRew);
  end;
end;

procedure QueryPimPuni(str : string);
{징계사항을 읽어온다..}
var
  i : integer;
begin
  for i := 1 to 2 do begin
      tData.pukindnm[i]   := '';
      tData.pucause[i]    := '';
      tData.pudate[i]     := '';
  end;
  with MainForm.QPun do begin
    SqlText := 'SELECT  '+
               ' nvl(        empno      ,'' ''), '+
               ' nvl(        korname    ,'' ''), '+
               ' nvl(        orgnum     ,'' ''), '+
               ' nvl(        deptcode   ,'' ''), '+
               ' nvl(        paycl      ,'' ''), '+
               ' nvl(to_char(paygr     ),''0''), '+
               ' nvl(        payra      ,'' ''), '+
               ' nvl(        puno       ,'' ''), '+
               ' nvl(        pudate     ,'' ''), '+
               ' nvl(        pufrdate   ,'' ''), '+
               ' nvl(        putodate   ,'' ''), '+
               ' nvl(        puclass    ,'' ''), '+
               ' nvl(        puname     ,'' ''), '+
               ' nvl(        pukind     ,'' ''), '+
               ' nvl(        pukindnm   ,'' ''), '+
               ' nvl(        pucause    ,'' ''), '+
               ' nvl(        pubase     ,'' ''), '+
               ' nvl(        pucontent  ,'' ''), '+
               ' nvl(        puorg      ,'' ''), '+
               ' nvl(        puorgnm    ,'' ''), '+
               ' nvl(        putime     ,'' ''), '+
               ' nvl(        writetime  ,'' ''), '+
               ' nvl(        writeemp   ,'' '')  '+
               'from pimpuni                     '+
        Format('where empno = ''%s'' and  pudate >= ''%s''  ', [str, temp_orgempdate])+
               'order by pudate';

        Close;
        ClearFields;
        AddField('EMPNO'        , ftString ,  4 );
        AddField('KORNAME'      , ftString ,  12);
        AddField('ORGNUM'       , ftString ,  3 );
        AddField('DEPTCODE'     , ftString ,  6 );
        AddField('PAYCL'        , ftString ,  3 );
        AddField('PAYGR'        , ftInteger,  3 );
        AddField('PAYRA'        , ftString ,  3 );
        AddField('PUNO'         , ftString ,  11);
        AddField('PUDATE'       , ftString ,  8 );
        AddField('PUFRDATE'     , ftString ,  8 );
        AddField('PUTODATE'     , ftString ,  8 );
        AddField('PUCLASS'      , ftString ,  2 );
        AddField('PUNAME'       , ftString ,  30);
        AddField('PUKIND'       , ftString ,  2 );
        AddField('PUKINDNM'     , ftString ,  20);
        AddField('PUCAUSE'      , ftString ,  50);
        AddField('PUBASE'       , ftString ,  40);
        AddField('PUCONTENT'    , ftString ,  30);
        AddField('PUORG'        , ftString ,  3 );
        AddField('PUORGNM'      , ftString ,  20);
        AddField('PUTIME'       , ftString ,  1 );
        AddField('WRITETIME'    , ftString ,  15);
        AddField('WRITEEMP'     , ftString ,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SELM';
        Open;
//        TFunc_TQueryAuto('SPIA1060SK', SqlText, MainForm.QPun);
  end;
end;

//-------------------------------------------------------------------------------
// 버전     수정일      수정자   관련근거       수정내용
// 1.09   1998.03.13    김순례  전(98.3.10)   인사기록요약표 출력양식변경으로 수정
// 1.11   1998.07.25    김혜진  전(98.7.22)  정규직에서 임원으로 승격할 경우 사번이 변동되지 않도록 발령냄.
//                                          이에 따라, 임원입사일을 empdate로, 정규직입사일을 firempdate로 등록.
//                                          근속년수등을 계산, 출력할 때는 최초입사일부터(firempdate)
procedure Run_Text_Create;
{조건에 맞는출력물을 텍스트화일로 만든다..}
var
  cnt,i     : integer;
  ty,tm     : integer;
  ankikan,cal_day   : string[6];
  str       : string;
begin
  helpHint('기본인사 화일을 읽고 있는 중입니다 !!..');
  cnt := 1;
  // dacom자료출력여부  comgubun = (1:dacom, 2:dst, 3:hanaro)
  //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  if Dacomgu_checked  then
    sqlcommand1 := ' and comgubun= ''3'' '
  else
    sqlcommand1 := '';

  {추출된 데이타를 텍스트화일에 저장한다..}
  while not MainForm.TMain.EOF do
  begin
    with MainForm.TMain, tData do
    begin
      if Dacomgu_checked  then
        temp_orgempdate := FieldByName('orgempdate').AsString
      else
        temp_orgempdate := FieldByName('empdate').AsString;

      empno      := FieldByName('empno').AsString;
      korname    := FieldByName('korname').AsString;
      deptname	  := QdeptDisp(FieldByName('orgnum').AsString,FieldByName('deptcode').AsString);
      payranm	  := QcodeDisp('I113',FieldByName('payra').AsString);
      empdate	  := FieldByName('empdate').AsString;	// 최초입사일

      if FieldByName('trlimfrdate').AsString <> ''  then
        trlimfrto  :=     copy(FieldByName('trlimfrdate').AsString,3,2)+'.'+   // 전보제한기간
                          copy(FieldByName('trlimfrdate').AsString,5,2)+'.'+
                          copy(FieldByName('trlimfrdate').AsString,7,2)+'~'+
                          copy(FieldByName('trlimtodate').AsString,3,2)+'.'+
                          copy(FieldByName('trlimtodate').AsString,5,2)+'.'+
                          copy(FieldByName('trlimtodate').AsString,7,2)
      else
        trlimfrto := '';

      // 조직전보일... 2000.05.10 추가
      realtrdate := FieldByName('realtrdate').AsString; // 조직전보일
      offtrdate  := FieldByName('offtrdate').AsString;  // 전보일

      //98.03.13 추가
      jobplace   := QcodeDisp('I160',FieldByName('jobplace').AsString);  //현근무지
      licalkind  := QcodeDisp('I231',FieldByName('licalkind').AsString); //자격선임
      paycldate  := FieldByName('paycldate').AsString;
      orgempdate := FieldByName('orgempdate').AsString;                  // 1.11 하나로 입사일
      empcode	  := Qcodedisp('I101',FieldByName('empcode').AsString);   // 입사구분

      // 30.00     98.01.05    김혜진    직위,직급코드변경,호봉,직렬삭제
      // paygr1	  := copy(QcodeDisp('I112',FieldByName('paycl').AsString),1,6)+'-'+
      //               FormatFloat('#0',FieldByName('paygr').AsFloat);      //직급+호봉
      //
      // paygr2	  := copy(QcodeDisp('I112',FieldByName('emppaycl').AsString),1,6)+'-'+
      //               FormatFloat('#0',FieldByName('emppaygr').AsFloat);     //입사시 직급,호봉
      // jobline := QcodeDisp('I115',FieldByName('jobline').AsString);  //입사직렬
      
      paygr1	  := QcodeDisp('I112',FieldByName('paycl').AsString);      {직급}

      // 3. 수정일 : 1999.07.28
      //paygr2	  := QcodeDisp('I112',FieldByName('emppaycl').AsString);     //입사시 직급

      //입사시 직급/호봉
      paygr2	  := QcodeDisp('I112',FieldByName('emppaycl').AsString) + '-' +
                    FieldByName('emppaygr').AsString;
      jobline    := QcodeDisp('I115',FieldByName('jobgun').AsString);  //입사직군

      if  FieldByName('cardate').AsString <> '' then
        cardate    := copy(FieldByName('cardate').AsString,1,4)+'.'+         //경력일
                      copy(FieldByName('cardate').AsString,5,2)+'.'+
                      copy(FieldByName('cardate').AsString,7,2)
      else
        cardate   := '';

      empjobplace:= QcodeDisp('I160',FieldByName('empjobplace').AsString); //입사근무지
      ability	  := FieldByName('ability').AsString;                       // 특기
      // korage     := '('+FieldByName('korage').AsString+'세)' ;            // 연령
      korage     := '('+FieldByName('usaage').AsString+'세)' ;            // 연령       //30.02
      juminid	  := FieldByName('juminid').AsString;                      // 주민번호
      usaageSex  := FormatFloat('#0',FieldByName('usaage').AsFloat)+'('+
                    QcodeDisp('I039',FieldByName('sex').AsString)+')';	    // 나이,성별
      regaddr    := FieldByName('regaddr').AsString;                       // 본적
      telno      := FieldByName('telno').AsString;                         // 전화
      curaddr    := FieldByName('curaddr').AsString;                       // 현주소
      bornarea   := QcodeDisp('I001',FieldByName('bornarea').AsString) + ' ]';  //출생지
      if FieldByName('marrigeyn').AsString = 'Y' then  marrigeyn  := '기혼'     // 혼인여부
      else marrigeyn  := '미혼';

      // ----------------------------------------------------------------------------------
      // 수정일 : 2000.05.10
      // 수정자 : 김대훈
      // 요청자 : 하병수
      // 내  용 : 군별 코드 입력오류 수정
      // 수정전 : armykind  := QcodeDisp('I036',FieldByName('armykind').AsString);
      armykind	  := QcodeDisp('I031',FieldByName('armykind').AsString);         // 군별
      if  FieldByName('armyfrdate').AsString  <> ''  then
        armyfrto   := copy(FieldByName('armyfrdate').AsString,1,4)+'.'+
                      copy(FieldByName('armyfrdate').AsString,5,2)+'.'+
                      copy(FieldByName('armyfrdate').AsString,7,2)+'~'+
                      copy(FieldByName('armytodate').AsString,1,4)+'.'+
                      copy(FieldByName('armytodate').AsString,5,2)+'.'+
                      copy(FieldByName('armytodate').AsString,7,2)
      else
        armyfrto := '';

      pstate     := QcodeDisp('I114',FieldByName('pstate').AsString);
      if  copy(FieldByName('pstate').AsString,1,1)  = '2' then  begin     // 파견
        if  FieldByName('lsefrdate').AsString <> ''  then
          psdate := copy(FieldByName('lsefrdate').AsString,1,4)+'.'+
                    copy(FieldByName('lsefrdate').AsString,5,2)+'.'+
                    copy(FieldByName('lsefrdate').AsString,7,2)+'~'+
                    copy(FieldByName('lsetodate').AsString,1,4)+'.'+
                    copy(FieldByName('lsetodate').AsString,5,2)+'.'+
                    copy(FieldByName('lsetodate').AsString,7,2)
           else psdate := '';
      end else
      if  copy(FieldByName('pstate').AsString,1,1)  = '3' then  begin // 교육
        if  FieldByName('edufrdate').AsString <> ''  then
          psdate := copy(FieldByName('edufrdate').AsString,1,4)+'.'+
                    copy(FieldByName('edufrdate').AsString,5,2)+'.'+
                    copy(FieldByName('edufrdate').AsString,7,2)+'~'+
                    copy(FieldByName('edutodate').AsString,1,4)+'.'+
                    copy(FieldByName('edutodate').AsString,5,2)+'.'+
                    copy(FieldByName('edutodate').AsString,7,2)
           else psdate := '';
      end else
      if  copy(FieldByName('pstate').AsString,1,1)  = '7' then  begin // 휴직
        if  FieldByName('lrfrdate').AsString <> ''  then
          psdate := copy(FieldByName('lrfrdate').AsString,1,4)+'.'+
                    copy(FieldByName('lrfrdate').AsString,5,2)+'.'+
                    copy(FieldByName('lrfrdate').AsString,7,2)+'~'+
                    copy(FieldByName('lrtodate').AsString,1,4)+'.'+
                    copy(FieldByName('lrtodate').AsString,5,2)+'.'+
                    copy(FieldByName('lrtodate').AsString,7,2)
           else psdate := '';
      end else
      if  (copy(FieldByName('pstate').AsString,1,1)  = '8') or
          (copy(FieldByName('pstate').AsString,1,1)  = '9') then  begin // 휴직
        if  FieldByName('retdate').AsString <> ''  then
          psdate := copy(FieldByName('retdate').AsString,1,4)+'.'+
                    copy(FieldByName('retdate').AsString,5,2)+'.'+
                    copy(FieldByName('retdate').AsString,7,2)
        else
          psdate := ''
      end  else
      if  FieldByName('pstate').AsString  = '60'  then  begin
        QueryPihpstate(MainForm.TMain.FieldByName('empno').AsString);  {정직발령사항 Rtn}
        if MainForm.Qann.Eof = True then Break;
        if MainForm.Qann.FieldByName('anfrdate').AsString <> ''  then
          psdate := copy(FieldByName('anfrdate').AsString,1,4)+'.'+
                    copy(FieldByName('anfrdate').AsString,5,2)+'.'+
                    copy(FieldByName('anfrdate').AsString,7,2)+'~'+
                    copy(FieldByName('antodate').AsString,1,4)+'.'+
                    copy(FieldByName('antodate').AsString,5,2)+'.'+
                    copy(FieldByName('antodate').AsString,7,2)
        else
          psdate := '';
      end else
        psdate := '';
      bcaryy     := FormatFloat('00',FieldByName('bcaryy').AsFloat);
      bcarmm     := FormatFloat('00',FieldByName('bcarmm').AsFloat);

      prnDate    := copy(Curdate,1,4)+'.'+
                    copy(Curdate,5,2)+'.'+
                    copy(Curdate,7,2);
      exduym     := FormatFloat('00',FieldByName('exdutyy').AsFloat)+' 년 '+
                    FormatFloat('00',FieldByName('exdutmm').AsFloat)+' 월';

      // 1. 내용   : 출력양식변경에 의한 수정
      // 2. 수정자 : 김승회
      // 3. 수정일 : 1999.07.28
      // begin

      // 입사기수
      empterm      := '';
      if FieldByName('empterm').AsString <> '' then
        empterm := FieldByName('empterm').AsString + ' 기';
      lschgr       := QcodeDisp('I221',FieldByName('lschgr').AsString);
      remark       := QcodeDisp('I040',FieldByName('remark').AsString);
      // 1.20  일반직 사원.
      if copy(empno,1,1) = 'Y' Then
        tjobduty     := QcodeDisp('I702',FieldByName('tjobduty').AsString)
      else
        tjobduty     := FieldByName('tjobduty').AsString;

      height       := FormatFloat('#,##0',FieldByName('height').AsFloat) + ' cm';
      weight       := FormatFloat('#,##0',FieldByName('weight').AsFloat) + ' kg';
      blood        := FieldByName('blood').AsString;
      religion     := QcodeDisp('I002',FieldByName('religion').AsString);
      habit        := FieldByName('habit').AsString;
      ability      := FieldByName('ability').AsString;
      armycl       := QcodeDisp('I034',FieldByName('armycl').AsString);
      armyfield    := QcodeDisp('I035',FieldByName('armyfield').AsString);
      armydis      := QcodeDisp('I036',FieldByName('armydis').AsString);

      armyfrdate   := '';
      if FieldByName('armyfrdate').AsString <> '' then
        armyfrdate := copy(FieldByName('armyfrdate').AsString,1,4) + '.' +
                      copy(FieldByName('armyfrdate').AsString,5,2) + '.' +
                      copy(FieldByName('armyfrdate').AsString,7,2);

      armytodate   := '';
      if FieldByName('armytodate').AsString <> '' then
        armytodate := copy(FieldByName('armytodate').AsString,1,4) + '.' +
                      copy(FieldByName('armytodate').AsString,5,2) + '.' +
                      copy(FieldByName('armytodate').AsString,7,2);

      // 비정규학력
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 비정규학력 화일을 읽고 있는 중입니다 !!..');
      for i := 1 to 4 do
      begin
        eduorgnm[i]   := '';
        educontent[i] := '';
        edudate[i]    := '';
      end;

      SqlText := 'select ' +
                 ' nvl(        empno      ,'' ''), '+
                 ' nvl(        korname    ,'' ''), '+
                 ' nvl(        edufrdate  ,'' ''), '+
                 ' nvl(        edutodate  ,'' ''), '+
                 ' nvl(        eduorgnm   ,'' ''), '+
                 ' nvl(        educontent ,'' ''), '+
                 ' nvl(        edubigo    ,'' ''), '+
                 ' nvl(        edutime    ,'' ''), '+
                 ' nvl(        eduackyn   ,'' ''), '+
                 ' nvl(        writetime  ,'' ''), '+
                 ' nvl(        writeemp   ,'' '')  '+
                 'from   pimeduc                   '+
          format('where  empno = ''%s''            ',[FieldByName('empno').AsString])+
                 'order by edufrdate desc          ';

      With MainForm.QryGen do
      begin
        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString,  4 );
        AddField('KORNAME'      , ftString,  12);
        AddField('EDUFRDATE'    , ftString,  8 );
        AddField('EDUTODATE'    , ftString,  8 );
        AddField('EDUORGNM'     , ftString,  30);
        AddField('EDUCONTENT'   , ftString,  30);
        AddField('EDUBIGO'      , ftString,  40);
        AddField('EDUTIME'      , ftString,  1 );
        AddField('EDUACKYN'     , ftString,  1 );
        AddField('WRITETIME'    , ftString,  15);
        AddField('WRITEEMP'     , ftString,  4 );

        Sql.Clear;
        Sql.Text := SqlText;
        ServiceName := 'PIT2030A_SEL9';
        Open;
//          TFunc_TQueryAuto('SPIA1060S6', SqlText, MainForm.QryGen);
      end;

      i := 1;
      while not MainForm.QryGen.eof do
      begin
        if i > 4 then break;

        eduorgnm[i]  := MainForm.QryGen.FieldByName('eduorgnm').AsString;
        educontent[i]:= MainForm.QryGen.FieldByName('educontent').AsString;
        edudate[i]   := copy(MainForm.QryGen.FieldByName('edufrdate').AsString,3,2)+'.'+
                        copy(MainForm.QryGen.FieldByName('edufrdate').AsString,5,2)+'~'+
                        copy(MainForm.QryGen.FieldByName('edutodate').AsString,3,2)+'.'+
                        copy(MainForm.QryGen.FieldByName('edutodate').AsString,5,2);
        inc(i);
        MainForm.QryGen.Next;
      end;
      MainForm.QryGen.Close;

      scgubun := QcodeDisp('I016',FieldByName('scgubun').AsString);
      scentdate := '';
      if FieldByName('scentdate').AsString <> '' then
        scentdate := copy(FieldByName('scentdate').AsString,1,4) + '.' +
                     copy(FieldByName('scentdate').AsString,5,2) + '.' +
                     copy(FieldByName('scentdate').AsString,7,2);

      scpredate := '';
      if FieldByName('scpredate').AsString <> '' then
        scpredate := copy(FieldByName('scpredate').AsString,1,4) + '.' +
                     copy(FieldByName('scpredate').AsString,5,2) + '.' +
                     copy(FieldByName('scpredate').AsString,7,2);

      scenddate := '';
      if FieldByName('scenddate').AsString <> '' then
        scenddate := copy(FieldByName('scenddate').AsString,1,4) + '.' +
                     copy(FieldByName('scenddate').AsString,5,2) + '.' +
                     copy(FieldByName('scenddate').AsString,7,2);

      bohungubun := QcodeDisp('I015',FieldByName('bohungubun').AsString);
      bohunnm    := FieldByName('bohunnm').AsString;
      bohunrel   := QcodeDisp('I211',FieldByName('bohunrel').AsString);

      obskind    := QcodeDisp('I012',FieldByName('obskind').AsString);
      obsgr      := QcodeDisp('I011',FieldByName('obsgr').AsString);
      obsstate   := FieldByName('obsstate').AsString;

      // end

      // ............. 급여사항을 텍스트화일로 변환한다..............................................

      // 3. 수정일 : 1999.07.28
      if MainForm.TMain.FieldByName('pstate').AsString < '80' then
        cal_day := DateCal2(MainForm.TMain.FieldByName('orgempdate').AsString,baseDate_Text)
      else
         cal_day := DateCal2(MainForm.TMain.FieldByName('orgempdate').AsString, MainForm.TMain.FieldByName('retdate').AsString);

      tmpday  :=  (StrToInt(copy(cal_day,1,2)) * 12) + StrToInt(copy(cal_day,3,2));

      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 급여사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimjpay(MainForm.TMain.FieldByName('empno').AsString);  // 전년도급여사항 Rtn
      QueryPimdpay(MainForm.TMain.FieldByName('empno').AsString);  //당년도급여사항 Rtn

      if gu4 <> 3 then
         begin
           if dpay_amt > 0 then
              danpay_amt  := FormatFloat('#,##0',dpay_amt)+' 원'
           else
              danpay_amt := '';
         end
      else
      begin
         danpay_amt := '';
         junpay_amt := '';
      end;

      //..............학력사항을 텍스트화일로 변환한다.............................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 학력사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimsch(MainForm.TMain.FieldByName('empno').AsString);  {학력사항 Rtn}
      for i := 1 to 4 do begin
          if MainForm.Qsch.Eof = True then Break;
          schgr[i]     := Qcodedisp('I221',MainForm.Qsch.FieldByName('schgr').AsString);
          schnm[i]     := MainForm.Qsch.FieldByName('schnm').AsString;
          schfrtoym[i] := copy(MainForm.Qsch.FieldByName('schfrym').AsString,3,2)+'.'+
                          copy(MainForm.Qsch.FieldByName('schfrym').AsString,5,2)+'~'+
                          copy(MainForm.Qsch.FieldByName('schtoym').AsString,3,2)+'.'+
                          copy(MainForm.Qsch.FieldByName('schtoym').AsString,5,2);
          majorcode[i] := QcodeDisp('I225',MainForm.Qsch.FieldByName('majorcode').AsString);
          MainForm.Qsch.Next;
      end;
      MainForm.Qsch.Close;

      //..............자격증사항을 텍스트화일로 변환한다....................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 자격증사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimLic(MainForm.TMain.FieldByName('empno').AsString);  {자격증사항 Rtn}
      for i := 1 to 2 do begin
        if MainForm.Qlic.Eof = True then break;
        licekind[i]    := QcodeDisp('I231',MainForm.Qlic.FieldByName('lickind').AsString);
        licgr[i]       := QcodeDisp('I232',MainForm.Qlic.FieldByName('licgr').AsString);
        licalfield[i]  := MainForm.Qlic.FieldByName('licalfield').AsString;
        if  MainForm.Qlic.FieldByName('licgetdate').AsString  <>  ''  then
          licgetdate[i] := copy(MainForm.Qlic.FieldByName('licgetdate').AsString,1,4)+'.'+
                           copy(MainForm.Qlic.FieldByName('licgetdate').AsString,5,2)+'.'+
                           copy(MainForm.Qlic.FieldByName('licgetdate').AsString,7,2)
        else
          licgetdate[i] := '';
        MainForm.Qlic.Next;
      end;
      MainForm.Qlic.Close;

      //..........................외국어사항을 텍스트화일로 변환한다....................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 외국어사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimfore(MainForm.TMain.FieldByName('empno').AsString);  {외국어증사항 Rtn}
      for i := 1 to 2 do begin
        if MainForm.Qlic.Eof = True then break;
        if copy(MainForm.Qlic.FieldByName('examname').AsString,1,1) = '1'  then
           langname[i]   := '영어' //trim(Qlic.FieldByName('langname').AsString);
        else  if  copy(MainForm.Qlic.FieldByName('examname').AsString,1,1) ='2' then
           langname[i]   := '일어'
        else langname[i]   := '';
        examname[i]   := QcodeDisp('I611',MainForm.Qlic.FieldByName('examname').AsString);
        examscore[i]  := IntToStr(MainForm.Qlic.FieldByName('examscore12').AsInteger);
        examdate[i]   := trim(MainForm.Qlic.FieldByName('examdate').AsString);
        MainForm.Qlic.Next;
      end;
      MainForm.Qlic.Close;
      //..........................교육항을 텍스트화일로 변환한다....................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 교육 화일을 읽고 있는 중입니다 !!..');
      QueryPimtran(MainForm.TMain.FieldByName('empno').AsString);  {교육사항 rtn}
      for i := 1 to 5 do begin
        if MainForm.Qlic.Eof = True then break;
        if MainForm.Qlic.FieldByName('edufrdate').AsString  <> ''  then
          edufrtodate[i]  :=  copy(MainForm.Qlic.FieldByName('edufrdate').AsString,3,2)+'.'+
                              copy(MainForm.Qlic.FieldByName('edufrdate').AsString,5,2)+'.'+
                              copy(MainForm.Qlic.FieldByName('edufrdate').AsString,7,2)+'~'+
                              copy(MainForm.Qlic.FieldByName('edutodate').AsString,3,2)+'.'+
                              copy(MainForm.Qlic.FieldByName('edutodate').AsString,5,2)+'.'+
                              copy(MainForm.Qlic.FieldByName('edutodate').AsString,7,2)
        else
        edufrtodate[i]  := '';
        edutype[i]    :=  QcodeDisp('I602',MainForm.Qlic.FieldByName('edutype').AsString);
        edugubun[i]   :=  QcodeDisp('I603',MainForm.Qlic.FieldByName('edugubun').AsString);
        edutime[i]    :=  MainForm.Qlic.FieldByName('edutime').AsString;
        eduscore[i]   :=  MainForm.Qlic.FieldByName('eduscore').AsString;
        educourse[i]  :=  MainForm.Qlic.FieldByName('educourse').AsString;

        MainForm.Qlic.Next;
      end;
      MainForm.Qlic.Close;
      // ..........................입사전경력사항을 텍스트화일로 변환한다.....................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 입사전경력사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimCari(MainForm.TMain.FieldByName('empno').AsString);  {입사전사항 Rtn}
      for i := 1 to 4 do begin
        if MainForm.Qcar.Eof = True then break;
        carplace[i] := MainForm.Qcar.FieldByName('carplace').AsString;
        carymd[i]   := copy(MainForm.Qcar.FieldByName('carfrdate').AsString,3,2)+'.'+
                       copy(MainForm.Qcar.FieldByName('carfrdate').AsString,5,2)+'~'+
                       copy(MainForm.Qcar.FieldByName('cartodate').AsString,3,2)+'.'+
                       copy(MainForm.Qcar.FieldByName('cartodate').AsString,5,2);

        // 3. 수정일 : 1999.07.28
        // 개별경력기간산정
        str := idatecal(MainForm.Qcar.FieldByName('carfrdate').AsString,MainForm.Qcar.FieldByName('cartodate').AsString);
        carym[i] := copy(str,1,2)+ ' 년' + copy(str,3,2) + ' 개월';

        cardept[i]  := MainForm.Qcar.FieldByName('cardeptnm').AsString;
        carjobnm[i] := MainForm.Qcar.FieldByName('carjobnm').AsString;
        MainForm.Qcar.Next;
      end;
      MainForm.Qcar.Close;

      // ....................가족사항을 텍스트화일로 변환한다.........................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 가족사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimFami(MainForm.TMain.FieldByName('empno').AsString);  {가족사항 Rtn}
      for i := 1 to 6 do begin
        if MainForm.QFami.Eof = True then break;
        facode[i]  := Qcodedisp('I211',MainForm.QFami.FieldByName('facode').AsString);
        faname[i]  := MainForm.QFami.FieldByName('faname').AsString;
        fabirth[i] := copy(MainForm.QFami.FieldByName('fabirthdate').AsString,1,4)+'.'+
                      copy(MainForm.QFami.FieldByName('fabirthdate').AsString,5,2)+'.'+
                      copy(MainForm.QFami.FieldByName('fabirthdate').AsString,7,2);
        // if QFami.FieldByName('facode').AsString ='01' then
        //   fabirth[i] := ;
        faschgr[i] := QcodeDisp('I221',MainForm.QFami.FieldByName('faschgr').AsString);
        faplace[i] := MainForm.QFami.FieldByName('faplace').AsString;
        MainForm.QFami.Next;
      end;
      MainForm.QFami.Close;

      // ..........................인사고과사항을 텍스트화일로 변환한다....................................
      if (gu4 <> 1) and (gu4 <> 3) then begin
        helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 인사고과 화일을 읽고 있는 중입니다 !!..');
        QueryPimingo(MainForm.TMain.FieldByName('empno').AsString);  // 인사고과 Rtn
        for i := 1 to 6 do begin
          if MainForm.Qlic.Eof = True then break;
          intodate[i] := copy(MainForm.Qlic.FieldByName('intodate').AsString,1,4);
          ipaycl[i]   := QcodeDisp('I112',MainForm.Qlic.FieldByName('paycl').AsString);

          if (MainForm.Qlic.FieldByName('e1korname').AsString <> '')  or
             (MainForm.Qlic.FieldByName('e1score').AsFloat > 0) then
               ie1scr[i]   := trim(MainForm.Qlic.FieldByName('e1korname').AsString)+'/'+
                              FormatFloat('##0.00',MainForm.Qlic.FieldByName('e1score').AsFloat);
          if (MainForm.Qlic.FieldByName('e2korname').AsString <> '')  or
               (MainForm.Qlic.FieldByName('e2score').AsFloat > 0) then
                ie2scr[i]  := trim(MainForm.Qlic.FieldByName('e2korname').AsString)+'/'+
                              FormatFloat('##0.00',MainForm.Qlic.FieldByName('e2score').AsFloat);
          adjclass[i] := FormatFloat('##0.00',MainForm.Qlic.FieldByName('adjscore').AsFloat)+' / '+
                         MainForm.Qlic.FieldByName('adjclass').AsString;
          MainForm.Qlic.Next;
        end;
        MainForm.Qlic.Close;
      end else begin
        for i := 1 to 6 do begin
          intodate[i] := '';
          ie1scr[i]   := '';
          adjclass[i] := '';      ie2scr[i] :='';
          ipaycl[i]   := '';
        end;
      end;

      //..........................상향평가사항을 텍스트화일로 변환한다....................................}
      if (gu4 <> 1) and (gu4 <> 3) then begin
        helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 상향평가 화일을 읽고 있는 중입니다 !!..');
        QueryPimappr(MainForm.TMain.FieldByName('empno').AsString);  {사향평가 Rtn}
        for i := 1 to 3 do begin
          if MainForm.Qlic.Eof = True then break;
          aptodate[i] := copy(MainForm.Qlic.FieldByName('aptodate').AsString,1,4);
          apaycl[i]   := QcodeDisp('I112',MainForm.Qlic.FieldByName('paycl').AsString);
          ascore[i]   := FormatFloat('##0.00',MainForm.Qlic.FieldByName('apprscore').AsFloat);
          if MainForm.Qlic.FieldByName('apprclass').AsString = 'A'  then
             aclass[i] := '우수'
          else if  MainForm.Qlic.FieldByName('apprclass').AsString = 'B'  then
             aclass[i] := '보통'
          else if  MainForm.Qlic.FieldByName('apprclass').AsString = 'C'  then
             aclass[i] := '미흡';
          MainForm.Qlic.Next;
        end;
      end else begin
        for i := 1 to 3 do begin
          aptodate[i] := '';
          apaycl[i] := '';
          ascore[i] := '';
          aclass[i]   := '';
        end;
      end;

      //...............................포상사항을 텍스트화일로 변환한다....................................
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 포상사항 화일을 읽고 있는 중입니다 !!..');
      QueryPimRewa(MainForm.TMain.FieldByName('empno').AsString);  {포상사항 Rtn}
      for i := 1 to 2 do begin
          if MainForm.Qrew.Eof = True then break;
          rekindnm[i] := MainForm.QRew.FieldByName('rekindnm').AsString;
          reorgnm[i]  := MainForm.QRew.FieldByName('reorgnm').AsString;
          redate[i]   := copy(MainForm.QRew.FieldByName('redate').AsString,1,4)+'.'+
                         copy(MainForm.QRew.FieldByName('redate').AsString,5,2)+'.'+
                         copy(MainForm.QRew.FieldByName('redate').AsString,7,2);
          MainForm.QRew.Next;
      end;

      //...............................징계사항을 텍스트화일로 변환한다......................................
      if (gu4 <> 2) and (gu4 <> 3) then begin
        helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 징계사항 화일을 읽고 있는 중입니다 !!..');
        QueryPimPuni(MainForm.TMain.FieldByName('empno').AsString);  {징계사항 Rtn}
        for i := 1 to 2 do begin
          if MainForm.QPun.Eof = True then break;
          pukindnm[i] := MainForm.QPun.FieldByName('pukindnm').AsString;
          pucause[i]  := MainForm.QPun.FieldByName('pucause').AsString;
          pudate[i]   := copy(MainForm.QPun.FieldByName('pudate').AsString,1,4)+'.'+
                         copy(MainForm.QPun.FieldByName('pudate').AsString,5,2)+'.'+
                         copy(MainForm.QPun.FieldByName('pudate').AsString,7,2);
          MainForm.QPun.Next;
        end;
        MainForm.Qpun.Close;
      end else begin
        for i := 1 to 2 do begin
          pukindnm[i] := '';
          pucause[i]  := '';
          pudate[i]   := '';
        end;
      end;

      // ...............................발령사항을 텍스트화일로 변환한다...................................
      // 1. 발령구분
      //    if 발령구분 = 파견 or 교육
      //       - "[발령구분명]" 형태로 출력
      //    else -발령구분명 출력
      // 2. 직급,직위를 출력
      // 3. 발령사항
      //    if 발령구분 = 급호조정,징계,파견,교육,휴직 : 비고 1출력
      //    else 부서명출력
      //    if 직급 < '10' 발령사항 spaces
      // 4. 발령일자(기간)
      //    if 인사상태 > 입사포기(80)
      //       - 발령일 from 출력
      //    if 발령구분 = 파견,교육 발령일 from,to 출력
      //    그밖의 경우는 발령일 from,to 기간을 계산(일수가 15일 이상이면 1월로 계산
      //                  발령일 from,기간 (년,월)을 출력
      helpHint('('+MainForm.TMain.FieldByName('korname').AsString+') 인사발령사항 화일을 읽고 있는 중입니다 !!..');
      QueryPihAnno(MainForm.TMain.FieldByName('empno').AsString);  {발령사항 Rtn}
      for i := 1 to PRTROW do begin
        if pancode[i] = '' then Continue;
        ankikan := '000000'; {발령일 From - To }
        if (pancode[i] = '411') or (pancode[i] = '451') then
           tData.ancode[i]  := '  ['+QcodeDisp('I300',pancode[i])+']'
        else
           tData.ancode[i]  := QcodeDisp('I300',pancode[i]);

        tData.anpaycl[i] := QcodeDisp('I112',ppaycl[i]);
        if  panfrdate[i] < MainForm.payrachdate then
            tData.anpayra[i]  := QcodeDisp('I113',ppayra[i])
        else
            tData.anpayra2[i] := QcodeDisp('I113',ppayra[i]);
               //파견,휴직,급호조정일경우 발령사항 = 비고1+비고2+비고3 (98.03.04)
        if (pancode[i] = '341') or (pancode[i] = '411') or
           (pancode[i] = '451') or (pancode[i] = '511') or
           (copy(pancode[i],1,1) = '6') then begin
           tData.andept[i]  := trim(pmark1[i])+trim(pmark2[i])+trim(pmark3[i])
        end else begin
           tData.andept[i]  := QDeptDisp(porgnum[i],pdeptcode[i]);
        end;

        // 인사과 최효락시 요청으로 삭제함
        // if ppaycl[i] < '10' then tData.andept[i]  := '';
        ankikan := DateCal2(panfrdate[i],pantodate[i]);
        if trim(ankikan) <> '0 0' then begin
          tData.anDate[i] := copy(panfrdate[i],1,4)+'.'+
                             copy(panfrdate[i],5,2)+'.'+
                             copy(panfrdate[i],7,2)+'('+
                             copy(ankikan,1,2)+'년'+copy(ankikan,3,2)+'월)';
        end else begin
          tData.anDate[i] := copy(panfrdate[i],1,4)+'.'+
                             copy(panfrdate[i],5,2)+'.'+
                             copy(panfrdate[i],7,2);
        end;
        //ShowMessage(trim(ankikan)+'/'+tData.anDate[i]);

        //if ttxMain.FieldByName('pstate').AsString >= '80' then begin
        //   tData.anDate[i] := copy(panfrdate[i],1,4)+'.'+
        //                     copy(panfrdate[i],5,2)+'.'+
        //                     copy(panfrdate[i],7,2);
        //end;
        if (pancode[i] = '411') or (pancode[i] = '451') then begin
            tData.andate[i]  := copy(panfrdate[i],1,4)+'.'+
                                copy(panfrdate[i],5,2)+'.'+
                                copy(panfrdate[i],7,2)+'~'+
                                copy(pantodate[i],1,4)+'.'+
                                copy(pantodate[i],5,2)+'.'+
                                copy(pantodate[i],7,2);
        end;

        // 버전     수정일      수정자   관련근거       수정내용
        //--------------------------------------------------------------------------------
        // 1.11   1998.07.25    김혜진  전(98.7.22)  정규직에서 임원으로 승격할 경우 사번이 변동되지 않도록 발령냄.
        //                                           이에 따라, 임원입사일을 empdate로, 정규직입사일을 firempdate로 등록.
        //                                           근속년수등을 계산, 출력할 때는 최초입사일부터(firempdate)

        // 총경력 계산
        // Dacom 입사일과 하나로 입사일로 총 근무 년수 확인
        if MainForm.TMain.FieldByName('pstate').AsString < '80' then
          caramt := DateCal2(temp_orgempdate,baseDate_Text)
        else
          caramt := DateCal2(temp_orgempdate,
                             MainForm.TMain.FieldByName('retdate').AsString);
      end; // for
    end; // with Qmas,tData do begin
    tData.gubun := 'D';
    System.write(tFile,tData);
    MainForm.TMain.Next;
    inc(cnt);
    if MainForm.TMain.Eof <> True then begin
      tData.gubun := 'P';
      System.write(tFile,tData);
    end;
  end; {while not ttxMain.EOF do begin}
end;

end.

