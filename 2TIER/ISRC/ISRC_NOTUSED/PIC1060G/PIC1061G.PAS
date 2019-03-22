{ header
 -------------------------------------------------------------------------------
  PROGRAM-NAME    : PIC1060G(인사발령사항반영)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 윤형식
  Version         : 31.12
  Date            : 2001.03.21
  Update Contents
    버전    수정일    수정자   관련근거                 수정내용
 -------------------------------------------------------------------------------
    1.00  1996.5.25   전철호  처리명세서             신규프로그램 개발
    1.01  1998.2.23   김순례  콜(98.2.23)            발령화일의 회사구분필드"3' 세팅.
    1.02  1998.4.20   김혜진  전(98.4.11)            계약,재계약,부서변동,계약변경,계약해지
                                                     발령에서 파견업체 추가.
    30.00  98.12.31   김혜진  직위,직급변경          하나로신인사재개발
    31.00  98.12.31   김혜진  직급전환발령(342)추가. 하나로신인사재개발
    31.02  99.02.08   김혜진  직급부여발령(355)추가. 하나로신인사재개발
    31.04  99.08.18   김혜진  부서이동,직급,직위변경시   하나로종합평가개발.
                              업적평가마스터화일에 반영.
    31.05  1999.12.31 윤형식   Y2k                   인사발령 6자리 --> 8자리 크기변경
    31.06  2000.01.26 강기우  전(2000.01.26)         직급조정발령(343)추가...
    31.07  2000.03.31 강기우  하병수 대리 요청.      직급전환,조정시 보임일 기록하지않도록....
    31.08  2000.05.24 강기우  전(2000.05.??)         일반직자동화에 따른 호봉,직무,계약일 수정.
    31.09  2000.09.15 강기우  전()                   근속제외기간 설정중 육아휴직은 승격시영향을 받아야하므로 근속기간포함.(하병수대리요청)
    31.10  2000.10.24 강기우  하병수대리요청         신규발령시에 사용자PASS에 자동 저장(PYMPUSER)
    31.10  2000.12.21 윤형식  직책명에러수정         영문자와 한글 혼합일때 copy관련 에러 수정
    31.12  2001.03.21 윤형식  전2001-02-13           전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
    31.13  2001.07.20 서혜미  이석희                 코드변경(995) 추가에 의한 수정.
    31.14  2001.08.20 서혜미  송석제                 인사마스터 근무직위 추가로 인한 수정.
    31.15  2003.11.26 정규용  최상용 과장 요청       1) 발령정정,취소발령도 타발령과 동일하게 적용
                                                     2) 직무대리해제(328) 발령 추가 -> 보임해제와 동일하게 적용하되 직무무대리일TO 날짜만 입력함
                                                     3) 감급(666) --> 감봉으로 코드명변경하고 인사마스터에는 영향 없게
    31.16  2003.12.12 정규용  자체                   팀장(2C')이 파견(411),파견연장(412) 발령때 근무부서보임여부(jobpayrayn)를 'Y'로 세팅
    31.17  2004.03.25 정규용  전산처리요청서(오종석) 대기발령(461),대기발령해제(468) 신규발령이 추가됨에 따라 해당발령건 처리루틴 추가
    31.18  2004.06.01 정규용   자체                   노조관련 루틴 제거
    32.00  2005.03.14 유효성   전(2005-4404)         인사발령화일 경신할 데이타가 작업완료후 사라지지 않도록 수정
    33.00  2005.05.13 변춘미   전(2005-9110)         일반직(Y---)사원 경력일 default값(입사일-400) 넣는 부분 삭제(인사팀 임현수)
    34.00  2013.11.27 강륜종   종합인사 암호화 작업으로 PYMENUUSER 테이블에 Encode 없이 패스워드 사번으로 저장토록 수정.
 -------------------------------------------------------------------------------}

unit Pic1061g;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls,inifiles,datelib,
  Mask,Calen1, DB, DBTables, Grids, DBGrids,pass,codetext, kpaylib,
  Csreg, Tmax_DataSetText, Tmax_session, OnInsaCommon, OnScheme,
  PDownLoad, func;

type
  Tpic1061gForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel1: TPanel;
    Ga1: TGauge;
    Panel4: TPanel;
    readnum: TPanel;
    Panel7: TPanel;
    acessnum: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    BExit: TBitBtn;
    BSave: TBitBtn;
    helpDsr: TLabel;
    helpLabel: TLabel;
    anfrdate: TMaskEdit;
    antodate: TMaskEdit;
    Label1: TLabel;
    Panel16: TPanel;
    lastDate: TPanel;
    Database1: TDatabase;
    Qmas: TQuery;
    Qanno: TQuery;
    Qanbas: TQuery;
    Qexdu: TQuery;
    Qdept: TQuery;
    Qsave: TQuery;
    Phelp: TPanel;
    Panel11: TPanel;
    QCode: TQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    insaBtn: TBitBtn;
    exduBtn: TBitBtn;
    Panel6: TPanel;
    Panel8: TPanel;
    Cancelno: TPanel;
    QannoKORNAME: TStringField;
    QannoANNONO: TStringField;
    QannoANFRDATE: TStringField;
    QannoANTODATE: TStringField;
    QannoANCODE: TStringField;
    QannoEMPNO: TStringField;
    QannoANSEQNO: TStringField;
    QannoANDETCODE: TStringField;
    QannoORGNUM: TStringField;
    QannoDEPTCODE: TStringField;
    QannoPAYCL: TStringField;
    QannoPAYGR: TFloatField;
    QannoPAYRA: TStringField;
    QannoJOBLINE: TStringField;
    QannoMARK1: TStringField;
    QannoMARK2: TStringField;
    QannoMARK3: TStringField;
    QannoADDEPTCODE: TStringField;
    QannoADPAYRA: TStringField;
    QannoRPAYGR: TFloatField;
    QannoLPAYGR: TFloatField;
    QannoSPAYGR: TFloatField;
    QannoHOFRDATE: TStringField;
    QannoHOTODATE: TStringField;
    QannoRETSAYU1: TStringField;
    QannoRETSAYU2: TStringField;
    QannoTCONTR: TStringField;
    QannoTCONTRAMT: TFloatField;
    QannoTJOBDUTY: TStringField;
    QannoTTYPE: TStringField;
    QannoBANNONO: TStringField;
    QannoBANFRDATE: TStringField;
    QannoBANTODATE: TStringField;
    QannoBANCODE: TStringField;
    QannoBANDETCODE: TStringField;
    QannoBDEPTCODE: TStringField;
    QannoBPAYCL: TStringField;
    QannoBPAYGR: TFloatField;
    QannoBPAYRA: TStringField;
    QannoANUPDYN: TStringField;
    QannoBORGNUM: TStringField;
    QannoNancode: TStringField;
    Qtext: TQuery;
    Qex1: TQuery;
    Panel9: TPanel;
    ErrNum: TPanel;
    Query1: TQuery;
    QannoTCOMPANY: TStringField;
    QannoJOBGUN: TStringField;
    Qres: TQuery;
    BitBtn1: TBitBtn;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Memo1: TMemo;
    SF_Main: TOnSchemeForm;
    procedure BExitClick(Sender: TObject);
    procedure anfrdateDblClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure insaBtnClick(Sender: TObject);
    procedure Keycontrol(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure QannoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure PhelpDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CurDate       : string[8];
    ReadAnno      : integer;  {인사발령 읽은건수}
    Cancelanno    : integer;  {발령정정,발령취소 건수}
    edupstateyn   : string[1]; {파견/교육현원포함여부}
    jupstateyn    : string[1]; {정직자현원포함여부}
    hupstateyn    : string[1]; {휴직자현원포함여부}
    LastDate1     : string[8]; {최종경신발령일}
    LastDate2     : string[8];
    EnterKey      : integer;
    FreeCheck     : Boolean;
    IsBatchLoaded : Boolean;

    //31.04
    Eempno,Eanupdyn,Erabasdate,Edeptcode : string;
    exjob1,exjob2,exjob3,exjob4,exjob5 : string;

    hisfryymm : String;
    histoyymm : String;

    IsBatchJobWorking : Boolean;

    Rundate,  ProgId1, ProgId2, CmdStr   : String;  //서비스 개발...

    function  Work_Rtn1 : string;
    function  Work_Rtn2 : string;
    function  QCodeDisp(s1,s2 : String) : String;
    function  QDeptDisp(s1,s2 : String) : String;
    function  PaydunmCheck(s1,s2,s3,s4,s5 : String) : String;
    function  calexdu(sy,sm,sd : real) : string;
    function  CalExduMinus(sy,sm,sd,dy,dm,dd : real) : string;
    function  Save_anno : Boolean;
    procedure MakeTextFile;
    procedure ErrorWrite(s1,s2,s3,s4,s5,s6,Estr : string);
    procedure MasterSpace;
    procedure AssignMaster;
    procedure PehremasSpace;
    procedure AssignPehremas;
    procedure QvariDisp;
    procedure nojo_check(s1,s2 : string; var nojopayra : string);
    procedure jobline_Check;
    procedure PayraYn_Check;  //현보임여부 체크 & 수정
    procedure deptcode_check;
    procedure payra_check;
    procedure ancode_check;
    procedure exdu_check;
    procedure pstate_check;
    function  timedate(qry: TQuery): String;
  public
    { Public declarations }
    p_empno   : string;
    p_korname : string;
    password  : string;
    pclass    : string;
    start     : integer;
    HomeDir   : string;
    rxcMsg    : string;
    newperson : string;
  end;

//31.04
type
   Pehremas = record
      empno      : string[4];   {사번}
      jobgun     : string[3];   {직군}
      orgnum     : string[3];   {조직차수}
      deptcode   : string[5];   {부서코드}
      pstate     : string[2];   {인사상태}
      paycl      : string[3];   {BAND}
      payra      : string[3];   {직책}
      jobpayra   : string[3];   {근무직책}  //31.14  2001.08.20 shm 추가
      trdate     : string[8];   {현부서발령일}
      reconyn    : string[1];   {목표수립대상여부}
      e1existyn  : string[1];   {1차평가자 실제존재여부}
      e2existyn  : string[1];   {2차평가자 실제존재여부}
      e1empno    : string[4];   {1차평가자사번}
      e2empno    : string[4];   {2차평가자사번}
      prjexcode  : string[1];
      prjexfrdate: string[8];
      prjextodate : string[8];
   end;

type
    Master = record
       empno      : string[4];     {사원번호}
       korname    : string[12];    {섬영}
       pstate     : string[2];     {인사상태}
       pstateyn   : string[1];     {현원포함여부}
       paycl      : string[3];     {직급}
       paygr      : string[2];     {호봉  -- 일반직과 임원만 실제 사용.}
       payra      : string[3];     {직책}
       jobpayra   : string[3];     {근무직책}         //31.14  2001.08.20 shm 추가
       orgnum     : string[3];     {조직차수}
       deptcode   : string[5];     {부서코드}
       fieldcode  : string[3];     {소속부문}
       boncode    : string[5];     {본부코드}
       fincode    : string[5];     {재무부서}
       paydunm    : string[30];    {직책명}
       realtrdate : string[8];     {전보일}
       offtrdate  : string[8];     {조직전보일}
       payrayn    : string[1];     {보임여부}
       jobpayrayn : string[1];     {근무부서보임여부} //31.14  2001.08.30 shm 추가
       cpayradate : string[8];     {보임일}
       jobdept    : string[5];     {근무부서}
       jobplace   : string[2];     {근무지}
       orgempdate : string[8];     {입사일}
       empdate    : string[8];     {최초입사일}
       cardate    : string[8];     {경력일}
       juminid    : string[14];    {주민번호}

       cpaycldate : string[8];     {승격일}
       paycldate  : string[8];     {직급일}
       reppaycl   : string[3];     {직무대리직급}
       reppayfrdate: string[8];    {    "       기간}
       reppaytodate: string[8];    {    "           }
       apdpaydunm : string[30];    {겸직직책명}
       apdpayfrdate: string[8];    {겸직일 From}
       apdpaytodate: string[8];    {   "   to}
       actpaydunm : string[30];    {직무대행직책}
       actpayfrdate: string[8];    {     "  일 from}
       actpaytodate: string[8];    {     "     to}
       lragrdate  : string[8];     {최종장기승호일}
       remark     : string[2];     {특기사항}
       empcode    : string[2];     {입사구분}
       emppaycl   : string[3];     {입사BAND}
       emppaygr   : string[2];     {입사호봉 - 일반직과 임원만 실제 사용.}
       empjobline : string[2];     {입사직렬}
       jobgun     : string[2];     {직군}
       jobgundate : string[8];     {직군일}
       jobline    : string[2];     {직렬}
       joblinedate: string[8];     {직렬일}
       nogubun    : string[2];     {노조원구분}
       lancode    : string[3];     {최종발령구분}
{ -------------------------------------------------------------------------------
    버전    수정일    수정자   관련근거          수정내용
    31.05  1999.12.31 윤형식   Y2k           인사발령 6자리 --> 8자리 크기변경
 -------------------------------------------------------------------------------}
//       lannono    : string[6];     {최종발령번호}
       lannono    : string[8];     {최종발령번호}
       lanfrdate  : string[8];     {최종발령일 from}
       lantodate  : string[8];     {최종발령일 to}
       exdutcnt   : string[2];     {총근속제외횟수}
       exdutyy    : string[2];     {총근속제외년수}
       exdutmm    : string[2];     {     "    월수}
       exdutdd    : string[2];     {     "    일수}
       lexfrdate  : string[8];     {최종근속제외기간 from}
       lextodate  : string[8];     {       "         to }
       lexduyy    : string[2];     {       "         년수}
       lexdumm    : string[2];     {       "         월수}
       lexdudd    : string[2];     {       "         일수}
       lrkind     : string[2];     {휴직구분}
       lrfrdate   : string[8];     {휴직기간 from}
       lrtodate   : string[8];     {   "     to}
       lvfrdate   : string[8];     {휴직중휴가기간 from}
       lvtodate   : string[8];     {   "           to}
       lsekind    : string[2];     {파견구분}
       lsefrdate  : string[8];     {파견기간 from}
       lsetodate  : string[8];     {파견기간 to}
       lseplace   : string[40];    {파견기관}
       lsesayu    : string[40];    {파견목적}
       lsecont    : string[40];    {연락처}
       hugubun    : string[2];     {휴가구분}
       hufrdate   : string[8];     {휴가기간 from}
       hutodate   : string[8];     {휴가기간 to}
       retdate    : string[8];     {퇴사일자}
       retgubun   : string[2];     {퇴사구분}
       retsayu1   : string[2];     {퇴사사유-1}
       retsayu2   : string[2];     {    "   -2}
       retcont    : string[40];    {연락처}
       otdufrdate : string[8];     {재임(계약)기간 from}
       otdutodate : string[8];     {    "          to}
       tcontr     : string[1];     {계약방법}
       tcontramt  : string[12];    {계약금액}
       ttype      : string[20];    {근무형태}
       tjobduty   : string[40];    {담당직무}
       tcond      : string[40];    {기타조건}
       tcompany   : string[2];     {파견업체코드}
       edugubun   : string[2];     {교육구분}
       eduplace   : string[30];    {교육기관}
       educourse  : string[40];    {교육과정}
       edufrdate  : string[8];     {교육기간  From}
       edutodate  : string[8];     {    "     to}
       edudufrdate: string[8];     {교육의무복무기간  From}
       edudutodate: string[8];     {    "             to}
       eduarea    : string[10];    {교육지역}
       educont    : string[40];    {연락처}
end;

type
 errFile = record
           errlog : array[1..200] of char;
           lfcr   : array[1..2]  of char;
end;

var
  pic1061gForm: Tpic1061gForm;
  errorHelp   : array[0..255] of char;
  Mas         : Master;
  Res         : Pehremas;
  ErrData     : errFile;
  efile       : file of errFile;
  ErrText     : String;
  payrachdate :String;

implementation

uses
  pic1062g;

{$R *.DFM}

function Tpic1061gForm.timedate(qry: TQuery): String;
begin
    with Qry do
    begin
        Close;
        SQL.Clear;
        Sql.TExt := 'SELECT to_char(sysdate,''YYYYMMDDHH24MISSD'') s_date from dual';

        Open;
       Result := FieldByName('s_date').AsString;
    end;
end;

procedure Tpic1061gForm.MakeTextFile;
var
  str : string;
begin
   codeToText(HomeDir+'\pic1060g.cod','',0);
   with QText do begin
        close;
        sql.clear;
        sql.add('select codeid,codeno,codename from pyccode ');
        sql.add('where (codeid = ''I300'')                  ');
        sql.add('order by codeid,codeno                     ');
        open;
        while not eof do begin
           str := '';
           str := FieldByName('codeid').AsString+','+
                  FieldByName('codeno').AsString+','+
                  FieldByName('codename').AsString;
           codeToText('',str,1);
           next;
        end;
        QText.close;
   end;
   codeToText('','',2);
end;

{................근속기간 빼기 루틴....................................}
function Tpic1061gForm.CalExduMinus(sy,sm,sd,dy,dm,dd : real) : string;
var
  x1,x2,x3 : string[2];
  y,m,d    : real;
begin
 {일을 계산한다..}
  d := sd-dd;
  if d < 0 then begin
     if sm > 0 then begin
        sm := sm - 1;
        sd := d+30;
     end else begin
        if sy > 0 then begin
           sy := sy - 1;
           sm := 12;
           sm := sm - 1;
           sd := d+30;
        end else begin
            CalExduMinus := '000000';
            system.Exit;
        end;
     end;
  end else sd := d;

 {월을 계산한다..}
  m := sm - dm;
  if m < 0 then begin
     if sy > 0 then begin
        sy := sy - 1;
        sm := m+12;
     end else begin
        CalExduMinus := '000000';
        system.Exit;
     end;
  end else sm := m;

 {년을 계산한다..}
 y := sy - dy;
 if y < 0 then begin
    CalExduMinus := '000000';
    system.Exit;
 end else sy := y;

 x1 := FormatFloat('00',sy);
 x2 := FormatFloat('00',sm);
 x3 := FormatFloat('00',sd);
 CalExduMinus := x1+x2+x3;
end;

function Tpic1061gForm.calexdu(sy,sm,sd : real) : string;
var
  x1,x2,x3 : string;
  y,m,d    : real;
begin
{  x1 := FloatToStr(sy);}
  x3 := FloatToStr(sd);
  if sd >= 30 then  begin
     sm := sm+(StrToInt(x3) div 30);
     sd := StrToInt(x3) mod 30;
  end;

  x2 := FloatToStr(sm);
  if sm >= 12 then  begin
    sy := sy+(StrToInt(x2) div 12);
    sm := StrToInt(x2) mod 12;
  end;

  x1 := FormatFloat('00',sy);
  x2 := FormatFloat('00',sm);
  x3 := FormatFloat('00',sd);
  result := x1+x2+x3;
end;

procedure Tpic1061gForm.ErrorWrite(s1,s2,s3,s4,s5,s6,Estr : string);
begin
  ArrStr(ErrData.errLog,'발령번호('+s1+')'+'발령일('+s2+'~'+s3+')'+
                        '발령구분('+s4+')'+'사원번호('+s5+')'+
                        '성명('+s6+')'+Estr);

  ErrData.lfcr[1] := chr(13);
  ErrData.lfcr[2] := chr(10);
  System.Write(efile,ErrData);
end;

// 인사마스터 변수 Clear........................................................
procedure Tpic1061gForm.MasterSpace;
begin
  with Mas do  //Master Record 선언.
  begin
    empno       := '';           korname     := '';
    pstate      := '';           pstateyn    := '';
    paycl       := '';           paygr       := '00';
    payra       := '';           orgnum      := '';    jobpayra       := '';
    deptcode    := '';           fieldcode   := '';
    paydunm     := '';           realtrdate  := '';
    offtrdate   := '';           payrayn     := '';    jobpayrayn     := '';
    cpayradate  := '';           jobplace    := '';
    empdate     := '';           cpaycldate  := '';
    paycldate   := '';           reppaycl    := '';
    reppayfrdate:= '';           reppaytodate:= '';
    apdpaydunm  := '';           apdpayfrdate:= '';
    apdpaytodate:= '';           actpaydunm  := '';
    actpayfrdate:= '';           actpaytodate:= '';
    lragrdate   := '';           remark      := '';
    empcode     := '';           emppaycl    := '';
    emppaygr    := '00';         jobgun      := '';
    jobgundate  := '';           jobline     := '';
    joblinedate := '';           nogubun     := '';
    lancode     := '';           lannono     := '';
    lanfrdate   := '';           lantodate   := '';
    exdutcnt    := '00';         exdutyy     := '00';
    exdutmm     := '00';         exdutdd     := '00';
    lexfrdate   := '';           lextodate   := '';
    lexduyy     := '00';         lexdumm     := '00';
    lexdudd     := '00';         lrkind      := '';
    lrfrdate    := '';           lrtodate    := '';
    lvfrdate    := '';           lvtodate    := '';
    lsekind     := '';           lsefrdate   := '';
    lsetodate   := '';           lseplace    := '';
    lsesayu     := '';           lsecont     := '';
    hugubun     := '';           hufrdate    := '';
    hutodate    := '';           retdate     := '';
    retgubun    := '';           retsayu1    := '';
    retsayu2    := '';           retcont     := '';
    otdufrdate  := '';           otdutodate  := '';
    tcontr      := '';           tcontramt   := '0';
    ttype       := '';           tjobduty    := '';
    tcond       := '';           edugubun    := '';
    eduplace    := '';           educourse   := '';
    edufrdate   := '';           edutodate   := '';
    edudufrdate := '';           edudutodate := '';
    eduarea     := '';           educont     := '';
    boncode     := '';           fincode     := '';
    jobdept     := '';           orgempdate  := '';
{ ---------------------------------------------------------------------------
    버전    수정일    수정자   관련근거                 수정내용
    31.12  2001.03.21 윤형식  전2001-02-13           전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
 ---------------------------------------------------------------------------}
    cardate     := '';           juminid     := '';

    empjobline  := '';           tcompany    := '';
  end;
end;
//31.04
procedure Tpic1061gForm.PehremasSpace;   //업적 평가에
begin
  with Res do
  begin
    empno      := '';           jobgun     := '';
    orgnum     := '';           deptcode   := '';
    pstate     := '';           paycl      := '';
    payra      := '';           jobpayra   := '';
    trdate     := '';           reconyn    := '';
    e1existyn  := '';           e2existyn  := '';
    e1empno    := '';           e2empno    := '';
    prjexcode  := '';           prjexfrdate:= '';
    prjextodate:= '';
  end;

end;

// 인사마스터 변수 Clear........................................................
procedure Tpic1061gForm.AssignMaster;
begin
with Mas,QMas do
begin
  empno       := FieldByName('empno').AsString;
  korname     := FieldByName('korname').AsString;
  pstate      := FieldByName('pstate').AsString;
  pstateyn    := FieldByName('pstateyn').AsString;
  paycl       := FieldByName('paycl').AsString;
  paygr       := FormatFloat('00',FieldByName('paygr').AsFloat);
  payra       := FieldByName('payra').AsString;
  jobpayra    := FieldByName('jobpayra').AsString;   //31.14  2001.08.20 shm 추가
  jobpayrayn  := FieldByName('jobpayrayn').AsString; //31.14  2001.08.30 shm 추가
  orgnum      := FieldByName('orgnum').AsString;
  deptcode    := FieldByName('deptcode').AsString;
  fieldcode   := FieldByName('fieldcode').AsString;
  paydunm     := FieldByName('paydunm').AsString;
  realtrdate  := FieldByName('realtrdate').AsString;
  offtrdate   := FieldByName('offtrdate').AsString;
  payrayn     := FieldByName('payrayn').AsString;
//  showmessage(payrayn);
  cpayradate  := FieldByName('cpayradate').AsString;
  jobplace    := FieldByName('jobplace').AsString;
  empdate     := FieldByName('empdate').AsString;
  cpaycldate  := FieldByName('cpaycldate').AsString;
  paycldate   := FieldByName('paycldate').AsString;
  reppaycl    := FieldByName('reppaycl').AsString;
  reppayfrdate:= FieldByName('reppayfrdate').AsString;
  reppaytodate:= FieldByName('reppaytodate').AsString;
  //겸직정보
  apdpaydunm  := FieldByName('apdpaydunm').AsString;
  apdpayfrdate:= FieldByName('apdpayfrdate').AsString;
  apdpaytodate:= FieldByName('apdpaytodate').AsString;
  //직무대행
  actpaydunm  := FieldByName('actpaydunm').AsString;
  actpayfrdate:= FieldByName('actpayfrdate').AsString;
  actpaytodate:= FieldByName('actpaytodate').AsString;

  lragrdate   := FieldByName('lragrdate').AsString;
  remark      := FieldByName('remark').AsString;
  empcode     := FieldByName('empcode').AsString;
  emppaycl    := FieldByName('emppaycl').AsString;
  empjobline  := FieldByName('empjobline').AsString;
  emppaygr    := FormatFloat('00',FieldByName('emppaygr').AsFloat);
  jobgun      := FieldByName('jobgun').AsString;
  jobgundate  := FieldByName('jobgundate').AsString;
  jobline     := FieldByName('jobline').AsString;
  joblinedate := FieldByName('joblinedate').AsString;
  nogubun     := FieldByName('nogubun').AsString;
  lancode     := FieldByName('lancode').AsString;
  lannono     := FieldByName('lannono').AsString;
  lanfrdate   := FieldByName('lanfrdate').AsString;
  lantodate   := FieldByName('lantodate').AsString;
  exdutcnt    := FormatFloat('00',FieldByName('exdutcnt').AsFloat);
  exdutyy     := FormatFloat('00',FieldByName('exdutyy').AsFloat);
  exdutmm     := FormatFloat('00',FieldByName('exdutmm').AsFloat);
  exdutdd     := FormatFloat('00',FieldByName('exdutdd').AsFloat);
  lexfrdate   := FieldByName('lexfrdate').AsString;
  lextodate   := FieldByName('lextodate').AsString;
  lexduyy     := FormatFloat('00',FieldByName('lexduyy').AsFloat);
  lexdumm     := FormatFloat('00',FieldByName('lexdumm').AsFloat);
  lexdudd     := FormatFloat('00',FieldByName('lexdudd').AsFloat);
  lrkind      := FieldByName('lrkind').AsString;
  lrfrdate    := FieldByName('lrfrdate').AsString;
  lrtodate    := FieldByName('lrtodate').AsString;
  lvfrdate    := FieldByName('lvfrdate').AsString;
  lvtodate    := FieldByName('lvtodate').AsString;
  lsekind     := FieldByName('lsekind').AsString;
  lsefrdate   := FieldByName('lsefrdate').AsString;
  lsetodate   := FieldByName('lsetodate').AsString;
  lseplace    := FieldByName('lseplace').AsString;
  lsesayu     := FieldByName('lsesayu').AsString;
  lsecont     := FieldByName('lsecont').AsString;
  hugubun     := FieldByName('hugubun').AsString;
  hufrdate    := FieldByName('hufrdate').AsString;
  hutodate    := FieldByName('hutodate').AsString;
  retdate     := FieldByName('retdate').AsString;
  retgubun    := FieldByName('retgubun').AsString;
  retsayu1    := FieldByName('retsayu1').AsString;
  retsayu2    := FieldByName('retsayu2').AsString;
  retcont     := FieldByName('retcont').AsString;
  otdufrdate  := FieldByName('otdufrdate').AsString;
  otdutodate  := FieldByName('otdutodate').AsString;
  tcontr      := FieldByName('tcontr').AsString;
  tcontramt   := FormatFloat('000000000000',FieldByName('tcontramt').AsFloat);
  ttype       := FieldByName('ttype').AsString;
  tjobduty    := FieldByName('tjobduty').AsString;
  tcond       := FieldByName('tcond').AsString;
  tcompany    := FieldByName('tcompany').Asstring;
  edugubun    := FieldByName('edugubun').AsString;
  eduplace    := FieldByName('eduplace').AsString;
  educourse   := FieldByName('educourse').AsString;
  edufrdate   := FieldByName('edufrdate').AsString;
  edutodate   := FieldByName('edutodate').AsString;
  edudufrdate := FieldByName('edudufrdate').AsString;
  edudutodate := FieldByName('edudutodate').AsString;
  eduarea     := FieldByName('eduarea').AsString;
  educont     := FieldByName('educont').AsString;
  boncode     := FieldByName('boncode').AsString;
  fincode     := FieldByName('fincode').AsString;
  jobdept     := FieldByName('jobdept').AsString;
  orgempdate  := FieldByName('orgempdate').AsString;
{ ---------------------------------------------------------------------------
    버전    수정일    수정자   관련근거                 수정내용
    31.12  2001.03.21 윤형식  전2001-02-13           전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
 ---------------------------------------------------------------------------}
  cardate     := FieldByName('cardate').AsString;
  juminid     := FieldByName('juminid').AsString;
 end;
end;
//31.04
procedure Tpic1061gForm.AssignPehremas;
begin
  with Res,QRes do begin
    empno       := FieldByName('empno').AsString;
    reconyn     := FieldByName('reconyn').AsString;
    trdate      := FieldByName('trdate').AsString;
    jobgun      := FieldByName('jobgun').AsString;
    pstate      := FieldByName('pstate').AsString;
    paycl       := FieldByName('paycl').AsString;
    payra       := FieldByName('payra').AsString;
    orgnum      := FieldByName('orgnum').AsString;
    deptcode    := FieldByName('deptcode').AsString;
    e1empno     := FieldByName('e1empno').AsString;
    e2empno     := FieldByName('e2empno').AsString;
    e1existyn   := FieldByName('e1existyn').AsString;
    e2existyn   := FieldByName('e2existyn').AsString;
   end;
end;

// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다.....
function Tpic1061gForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if FreeCheck = False then
  begin
     QCode.Close;
     // QCode.Sql.Text := 'select codename from pyccode '+
     //                   'where codeid = :lcodeid and codeno = :lcodesub ';
     QCode.Parambyname('lcodeid').AsString  := s1;
     QCode.Parambyname('lcodesub').AsString := s2;
     QCode.Open;
     if trim(QCode.FieldByName('CodeName').AsString) = ''  then
        QcodeDisp := '코드에러'
     else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
     Qcode.Close;
  end
  else
  begin
      str := TextCodeDisp(s1,s2,HomeDir+'\pic1060g.cod');
      if trim(str) = '' then QcodeDisp := '코드에러'
                        else QcodeDisp := str;
  end;
end;

// 입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..................
function Tpic1061gForm.QDeptDisp(s1,s2 : String) : String;
begin
  QDept.Close;
  // QDept.Sql.Text := 'select deptname,fieldcode,placecode,deptna1,deptna2,deptna3, '+
  //                   '       deptlevel,fincode,deptabbr,boncode                    '+
  //                   'from pycdept                                                 '+
  //                   'where (deptcode = :ldept and orgnum = :lorgnum)              ';
  QDept.ParamByName('Ldept').AsString   := s1;
  QDept.ParamByName('Lorgnum').AsString := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then begin
     Mas.fieldcode  := Qdept.FieldByName('Fieldcode').AsString;
//     Mas.jobplace   := Qdept.FieldByName('PlaceCode').AsString;
     Mas.fincode    := Qdept.FieldByName('Fincode').AsString;
     Mas.boncode    := Qdept.FieldByName('boncode').AsString;
     QDeptDisp      := QDept.FieldByName('Deptname').AsString;
  end else QDeptDisp := '부서코드에러';
  QDept.Close;
end;

// 직책명을 구해준다............................................................
function Tpic1061gForm.PayDunmCheck(s1,s2,s3,s4,s5 : String) : String;
var                             //부서코드,차수,직책,BAND,보임여부
  gu : string;                  //PayraYn_Check(보임여부) & 발령코드 233,253 에서만 부름.
  temp: String;
  i: Integer;
  flag: Boolean;
begin
                          // 임원중 보임이 있으면 직책은 ''
  gu := '';
  if ((anfrdate.Text <  payrachdate) and (Copy(s4,1,1) = '0')) or  //s4 -> BAND
     ((anfrdate.Text >= payrachdate) and (Copy(s4,1,1) = 'A')) then
  begin
    if s5 <> 'Y' then
    begin
      PaydunmCheck := '';  //직책명.
      system.Exit;
    end;
  end
  else                     //직대이후,부장,차장,등의 직책은 ''
  begin
    if ((anfrdate.Text <  payrachdate) and (copy(s3,1,1)  <> '1')  and
        (copy(s3,1,1)  <> '2')         and (copy(s3,1,1)  <> '3')  and
        (copy(s3,1,1)  <> '4')         and (copy(s3,1,1)  <> '5')) or
       ((anfrdate.Text >= payrachdate) and (copy(s3,1,1)  >  'C')) then
    begin
       PaydunmCheck := '';
       system.Exit;
    end;
  end;
  QDept.Close;
  // QDept.Sql.Text := 'select deptname,fieldcode,placecode,deptna1,deptna2,deptna3, '+
  //                   '       deptlevel,fincode,deptabbr,boncode                    '+
  //                   'from pycdept                                                 '+
  //                   'where (deptcode = :ldept and orgnum = :lorgnum)              ';
  QDept.ParamByName('Ldept').AsString     := s1;
  QDept.ParamByName('lorgnum').AsString   := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then begin
     //직책명 구하기
     if ((anfrdate.Text <  payrachdate) and
         ((copy(s3,1,1) = '1') or (copy(s3,1,1) = '2') or (copy(s3,1,1) = '4') or (Copy(s4,1,1) = '0') )) or
        ((anfrdate.Text >= payrachdate) and
         ((copy(s3,1,2) >= 'A5') And (copy(s3,1,1) <= 'C11') or (Copy(s4,1,1) = 'A')) ) then //직급만 '0'인사람.
     begin
        if (s3 = '03') or (s3 = '2B5') or (s3 = 'A21') or (s3 = 'A91') then
           gu := Qdept.FieldByName('deptabbr').AsString
        else
           gu := Qdept.FieldByName('deptabbr').AsString+'장';  // 부서테이블 - 부서요약명
     end
     else  // 직위첫자리가 3,5는 ~장직대
     begin
        if (s3 = 'C51') then
           gu := Qdept.FieldByName('deptabbr').AsString+'PL'
        else
           gu := Qdept.FieldByName('deptabbr').AsString+'장직대';
     end;
  end;

// -------------------------------------------------------------------------------
//    버전    수정일    수정자   관련근거                 수정내용
//    31.10  2000.12.21 윤형식  직책명에러수정         영문자와 한글 혼합일때 copy관련 에러 수정
// -------------------------------------------------------------------------------
//  PaydunmCheck := copy(gu,1,30);
//  QDept.Close;
  temp := copy(gu,1,30);
  flag := True;
  for i := 1 to length(temp) do
  begin
      if ((Integer(temp[i]) and Integer($80)) = integer($80)) then
      begin
          if flag = True then
              flag := False
          else
              flag := True;
      end;
  end;
  if flag = False then temp := copy(gu,1,29)
  else temp := copy(gu,1,30);
  QDept.Close;
  PaydunmCheck := Temp;
end;

// 노조원 체크..................................................................
// s1 : 후부서,s2 후직위
procedure Tpic1061gForm.nojo_check(s1,s2 : string; var nojopayra : string);
var
  d1,d2,p1,p2 : string;
  tnojopayra1,tnojopayra2  : string;
begin
 {======================================================================
   31.00   98.12.31    직위,직급변경     하나로신인사재개발
                       하나로는 모두 비노조원으로 취급, 직위 <= '99' 또는 직위 > 99 면 모두 비노조원으로 변경.
  노조원여부(노조구분) 체크
  1. 직위 <100 또는 직위 >900 보다 큰경우 노조원구분 비노조원(10)
   nojopayra := '20';
   if (copy(s2,1,3) < '100') or (copy(s2,1,3) > '999') then begin
      nojopayra := '10'; system.exit;
   end;
 2.직위를 조건으로 하여 인사변수화일에 존재여부 확인(변수구분,변수1 = 직위
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1,value2 from pimvari where gubun = ''60'' and sgubun = ''0001'' ');
   Qsave.Open;
   tnojopayra1 := Qsave.FieldByName('value1').AsString;
   tnojopayra2 := Qsave.FieldByName('value2').AsString;
   Qsave.Close;
   if copy(s2,1,3) <= tnojoPayra1 then begin
      nojopayra := '10'; system.exit;
   end;
   if (copy(s2,1,3) <= tnojoPayra2) and (Mas.Payrayn  = 'Y') then begin
      nojopayra := '10'; system.exit;
   end;

  부서,직위조건으로 인사변수화일에 존재여부 확인
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1 from pimvari ');
   Qsave.Sql.Add('where (gubun = ''61'') and ');
   Qsave.Sql.Add(Format('(value1 <= ''%s'' and value2 >= ''%s'') and ',
                 [s1,s1]));
   Qsave.Sql.Add(Format('(value3 <= ''%s'' and value4 >= ''%s'') ',
                 [s2,s2]));
   Qsave.Open;
   if Qsave.RecordCount > 0 then nojopayra := '10';
   Qsave.Close;
   if (Mas.nogubun >= '20') and (nojopayra = '20') then
      nojopayra := Mas.nogubun;
}
   nojopayra := '20';
   if (copy(s2,1,2) <= '99') or (copy(s2,1,2) > '99') then begin
      nojopayra := '10'; system.exit;
   end;
// 2.직위를 조건으로 하여 인사변수화일에 존재여부 확인(변수구분,변수1 = 직위
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1,value2 from pimvari where gubun = ''60'' and sgubun = ''0001'' ');
   Qsave.Open;
   tnojopayra1 := Qsave.FieldByName('value1').AsString;
   tnojopayra2 := Qsave.FieldByName('value2').AsString;
   Qsave.Close;
   if copy(s2,1,3) <= tnojoPayra1 then begin
      nojopayra := '10'; system.exit;
   end;
   if (copy(s2,1,3) <= tnojoPayra2) and (Mas.Payrayn  = 'Y') then begin
      nojopayra := '10'; system.exit;
   end;

//  부서,직위조건으로 인사변수화일에 존재여부 확인
   Qsave.Sql.Clear;
   Qsave.Sql.Add('select value1 from pimvari                         ');
   Qsave.Sql.Add('where (gubun = ''61'') and                         ');
   Qsave.Sql.Add(Format('(value1 <= ''%s'' and value2 >= ''%s'') and ', [s1,s1])                                             );
   Qsave.Sql.Add(Format('(value3 <= ''%s'' and value4 >= ''%s'')     ', [s2,s2])                                             );
   Qsave.Open;
   if Qsave.RecordCount > 0 then nojopayra := '10';
   Qsave.Close;
   if (Mas.nogubun >= '20') and (nojopayra = '20') then
      nojopayra := Mas.nogubun;

end;

// 직렬이 space가 아니면 직렬 : 발령후직렬, 직렬구분 첫번째자리 : '0'...........
// 31.00   98.12.31    ,김혜진   발령안등록에서 직렬을 입력하지 않으므로 실질적으로
//                               이 루틴을 타지 않는다.(X) - 직군으로 바뀜.
//31.04    99.07.14     김혜진   발령후 직군을 업적평가마스터에도 적용.

procedure Tpic1061gForm.jobline_Check;
begin
  Res.jobgun    := Mas.Jobgun;
  if trim(Qanno.FieldByName('jobgun').AsString) <> '' then begin
//     Mas.jobline   := Qanno.FieldByName('jobline').AsString;
//     Mas.jobgun    := copy(Qanno.FieldByName('jobline').AsString,1,1)+'0';
     Mas.jobgun    := Qanno.FieldByName('jobgun').AsString;
     Res.jobgun    := Qanno.FieldByName('jobgun').AsString;
     if (Qanno.FieldByName('jobgun').AsString  = exjob1) or
        (Qanno.FieldByName('jobgun').AsString  = exjob2) or
        (Qanno.FieldByName('jobgun').AsString  = exjob3) or
        (Qanno.FieldByName('jobgun').AsString  = exjob4) or
        (Qanno.FieldByName('jobgun').AsString  = exjob5) then
     begin
       Res.reconyn   := 'N';
       Res.prjexcode := '9';
     end;
  end;
end;

//31.04
// 현조직차수,부서코드체크......................................................
procedure Tpic1061gForm.Deptcode_Check;
var
  nojo      : string;
begin
  {부서(인사마스터) <>발령후 부서(발령화일) or 차수(인사마스터) <> 발령후차수(발령화일) 이면}
  {현소속부문,현근무지 인사마스터 임시변수에 후차수,후소속을 부서코드화일에서 }
  {읽어서 저장한다..}
//  if (Mas.deptcode <> Qanno.FieldByName('deptcode').AsString) or
//     (Mas.orgnum   <> Qanno.FieldByName('orgnum').AsString) then begin
     {현소속부문,재무부서 임시변수 :발령후차수,부서로 부서코드화일에서 읽어서 저장}
//     QDeptDisp(Qanno.FieldByName('deptcode').AsString,Qanno.FieldByName('orgnum').AsString);
     {현조직전보일,현전보일 구하기 }
//2001.11.23 shm
{     if ((Qanno.FieldByName('ancode').AsString = '211')    and
         (Qanno.FieldByName('andetcode').AsString = '12')) or
        ((Qanno.FieldByName('ancode').AsString = '995')    and  //코드변경 shm 2001.07.20
         (Qanno.FieldByName('andetcode').AsString = '12'))
     then begin
         Mas.offtrDate := Qanno.FieldByName('anfrdate').AsString; //조직전보일만. shm
     end else begin
        if (Qanno.FieldByName('ancode').AsString <> '935') then
        begin
           Mas.offtrDate  := Qanno.FieldByName('anfrdate').AsString;
           Mas.realtrDate := Qanno.FieldByName('anfrdate').AsString;
           Res.Trdate     := Qanno.FieldByName('anfrdate').AsString;
           Res.e1existyn  := 'N';  Res.e2existyn  := 'N';
        end;
     end;}
//2001.11.23 shm
//차수가 바뀌었을때 조직전보,코드변경,차수변경 발령시 조직전보일 update
//                  실제전보 발령시 조직전보일, 실제전보일 update
//                  그외 발령시 조직전보일 update
  if (Mas.orgnum <> Qanno.FieldByName('orgnum').AsString) then
  begin
     {현소속부문,재무부서 임시변수 :발령후차수,부서로 부서코드화일에서 읽어서 저장}
     QDeptDisp(Qanno.FieldByName('deptcode').AsString,Qanno.FieldByName('orgnum').AsString);
     if ((Qanno.FieldByName('ancode').AsString    = '211')  and
         (Qanno.FieldByName('andetcode').AsString = '12'))  or
        ((Qanno.FieldByName('ancode').AsString    = '995')  and
         (Qanno.FieldByName('andetcode').AsString = '12'))  or
//        ((Qanno.FieldByName('ancode').AsString    = '955')  and  //직무변동 shm
//         (Qanno.FieldByName('andetcode').AsString = '12'))  or
         (Qanno.FieldByName('ancode').AsString    = '935')
     then begin
         Mas.offtrDate  := Qanno.FieldByName('anfrdate').AsString;
     end else begin
     if ((Qanno.FieldByName('ancode').AsString    = '211')  and
         (Qanno.FieldByName('andetcode').AsString = '11')) or
        ((Qanno.FieldByName('ancode').AsString    = '211')  and
         (Qanno.FieldByName('andetcode').AsString = '13'))
     then begin
         Mas.offtrDate  := Qanno.FieldByName('anfrdate').AsString;
         Mas.realtrDate := Qanno.FieldByName('anfrdate').AsString;
     end else begin
        if (Qanno.FieldByName('ancode').AsString <> '935') then
        begin
           Mas.offtrDate  := Qanno.FieldByName('anfrdate').AsString;
           Res.Trdate     := Qanno.FieldByName('anfrdate').AsString;
           Res.e1existyn  := 'N';  Res.e2existyn  := 'N';
        end;
     end; end;
  END; //ORGNUM 비교 END 2002.01.09 SHM
//부서(인사마스터) <> 발령후 부서(발령화일)
  if (Mas.deptcode <> Qanno.FieldByName('deptcode').AsString) then
  begin
    QDeptDisp(Qanno.FieldByName('deptcode').AsString,Qanno.FieldByName('orgnum').AsString);  //정규용 추가
    if ((Qanno.FieldByName('ancode').AsString    = '211')  and
        (Qanno.FieldByName('andetcode').AsString = '12'))  or
       ((Qanno.FieldByName('ancode').AsString    = '995')  and
        (Qanno.FieldByName('andetcode').AsString = '12'))  //or
//       ((Qanno.FieldByName('ancode').AsString    = '955')  and
//        (Qanno.FieldByName('andetcode').AsString = '12'))
    then begin
        Mas.offtrDate  := Qanno.FieldByName('anfrdate').AsString;
    end
    else
    begin
      if ((Qanno.FieldByName('ancode').AsString    = '211')  and
          (Qanno.FieldByName('andetcode').AsString = '11' )) or
         ((Qanno.FieldByName('ancode').AsString    = '211')  and
          (Qanno.FieldByName('andetcode').AsString = '13' ))
      then begin
        Mas.lseplace   := Qanno.FieldByName('mark1').AsString; //사내공모전보시 data관리를 위해.최준영씨 요청 2002.02.01 shm
        Mas.realtrDate := Qanno.FieldByName('anfrdate').AsString;
      end;
    end; //end;

//  if (Qanno.FieldByName('bancode').AsString <> '411') then  //2001.09.06 shm  ???????
    if (Qanno.FieldByName('ancode').AsString <> '411') then     //2002.01.09 shm
     Mas.jobdept := Qanno.FieldByName('deptcode').AsString;   // 근무부서할당.

  end;  //발령전후 부서가 다르면 END.

  Res.orgnum     := Qanno.FieldByName('orgnum').AsString;
  Res.deptcode   := Qanno.FieldByName('deptcode').AsString;
  if Res.Trdate = '' then
    Res.Trdate := Mas.Realtrdate;
end;

//31.04
// 현보임여부 체크 & 수정..............................................................
procedure Tpic1061gForm.PayraYn_Check;
var
  nojo : string;
begin
{===============================================================
  31.00      98.12.31      김혜진      직위,직급코드변경.
                                       직급전환발령과 구분하였음을 주의.
 if Qanno.FieldByname('paycl').AsString = '00' then begin
    if trim(Mas.payrayn) = '' then begin
       Mas.payrayn := 'N';
       Mas.cpayradate := '';
    end;
  end else begin
    if (copy(Qanno.FieldByname('payra').AsString,2,1) = '0') or
       (copy(Qanno.FieldByname('payra').AsString,2,1) = '5') then  begin
       Mas.payrayn := 'Y';
       if (Mas.Paycl <> Qanno.FieldByname('paycl').AsString) or
          ((copy(Mas.payra,2,1) <> '0') and (copy(Mas.payra,2,1) <> '5')) or
          ((Qanno.FieldByname('ancode').AsString = '211') and
           (Qanno.FieldByname('andetcode').AsString = '11')) or
          (Qanno.FieldByname('ancode').AsString = '251') then
            Mas.cpayradate := Qanno.FieldByname('anfrdate').AsString;
    end else begin
       Mas.payrayn := 'N';
       Mas.cpayradate := '';
    end;
  end; }

 if ((anfrdate.Text  <   payrachdate)                       and
     (Copy(Qanno.FieldByname('paycl').AsString,1,1) = '0')  and
     (Copy(Qanno.FieldByname('payra').AsString,1,1) = '0')) or
    ((anfrdate.Text  >=  payrachdate)                       and
     (Copy(Qanno.FieldByname('paycl').AsString,1,1) = 'A')  and
     (Copy(Qanno.FieldByname('payra').AsString,1,2) < 'A5')) then  //직급이 회장~사장대우 20060821 HES
 begin
    if trim(Mas.payrayn) = '' then  //2002.03.01 shm
    begin
       Mas.payrayn := 'N';   Mas.jobpayrayn := 'N';
       Mas.cpayradate := '';
       Res.reconyn    := 'N';
       Res.paycl := Qanno.FieldByname('paycl').AsString;
       Res.payra := Qanno.FieldByname('payra').AsString;
    end;
 end
 else  //임원이외의 모두. 2001.09.10 shm 직급 0* 직위 1~5 보임발령시....
 begin                        //직위가독립이사 ~ 반장직대.
    if (((anfrdate.Text  <   payrachdate)                       and
         (copy(Qanno.FieldByname('payra').AsString,1,1) >= '1') and
         (copy(Qanno.FieldByname('payra').AsString,1,1) <= '5')) or
        ((anfrdate.Text  >=  payrachdate)                       and
         (copy(Qanno.FieldByname('payra').AsString,1,2) >= 'A5') and
         (copy(Qanno.FieldByname('payra').AsString,1,2) <= 'C1')))  then
    begin
       Mas.payrayn    := 'Y';
       if  (copy(Qanno.FieldByname('ancode').AsString,1,2) <> '41') then //2001.09.10 shm
           Mas.jobpayrayn := 'Y'
       else
           Mas.jobpayrayn := 'N';
//       IF  Qanno.FieldByname('payra').AsString = '4C' THEN  //담당은 근무부서 보임아니다.
//           Mas.jobpayrayn := 'N';                           //송장에 영향주지 않는다.2002.01.09 SHM
       //31.04  발령후 보임자라도 겸직,직무대리,대행,호봉관련 발령일 경우에는
       //  업적평가에 영향이 없다.
       if (Copy(Qanno.FieldByname('ancode').Asstring,1,2)<> '23') and
          (Copy(Qanno.FieldByname('ancode').Asstring,1,2)<> '24') and
          (Copy(Qanno.FieldByname('ancode').Asstring,1,2)<> '34') and
          (Qanno.FieldByname('ancode').Asstring <> '311') and
          (Qanno.FieldByname('ancode').Asstring <> '322') and
          (Copy(Qanno.FieldByname('ancode').Asstring,1,2) <> '33') then
          Res.reconyn := 'N';

//  31.07  2000.03.31    하병수 대리 요청.  직급전환,조정시 보임일 기록 X.
       if (Qanno.FieldByName('ancode').Asstring ='342') or (Qanno.FieldByName('ancode').Asstring ='343') then
       begin                                                                                                    //직급전환,조정
//         if ((copy(Mas.payra,2,1) <> '0') and (copy(Mas.payra,2,1) <> '5')) then
//              Mas.cpayradate := Qanno.FieldByname('anfrdate').AsString;
       end
       else //23X(겸직),24X(직무),34X(급호,호봉,직급),--> 결국 거의 모두(직위가 1 ~ 5 사이)
       begin
         if (Mas.Paycl <> Qanno.FieldByname('paycl').AsString) or//직위가 발령과 마스터가 다르거나 (승급?)
    {       ((copy(Mas.payra,1,1) <> '1') and (copy(Mas.payra,1,1) <> '2') and//직위가 1~ 5 사이가 아니거나..
             (copy(Mas.payra,1,1) <> '3') and (copy(Mas.payra,1,1) <> '4') and
             (copy(Mas.payra,1,1) <> '5')) or }
            ((Qanno.FieldByname('ancode').AsString = '211') and               //발령코드가 211(전보)고, 세부구분이 11(실제전보)이거나.
             (Qanno.FieldByname('andetcode').AsString = '11')) or
            (Qanno.FieldByname('ancode').AsString = '251') then                //전입 시에 날짜수정.
               Mas.cpayradate := Qanno.FieldByname('anfrdate').AsString;
       end;
    end
    else  //직위가 1 ~ 5사이가 아니면
    begin  // 발령후 팀원이면
       Mas.payrayn    := 'N';
       Mas.jobpayrayn := 'N';
       Mas.cpayradate := '';
       Res.reconyn    := 'Y';
       if Res.pstate = '' then
         Res.Pstate := '10';
       if (copy(Qanno.FieldByName('empno').Asstring,1,1)<>'Y') AND
          (copy(Qanno.FieldByName('empno').Asstring,1,1)<>'P') AND
        //(copy(Qanno.FieldByName('empno').Asstring,1,1)<>'J') AND
          (Qanno.FieldByName('paycl').Asstring <> 'H10') AND    //dsa2000 2017.01.05. J사번 숫자사번으로 변경에 따른 수정
          (res.Empno = '') then    //기존 업적평가대상화일에 존재하지 않았던 사원
       begin
          ErrorWrite(Qanno.FieldByName('annono').AsString,
                     Qanno.FieldByName('anfrdate').AsString,
                     Qanno.FieldByName('antodate').AsString,
                     Qanno.FieldByName('ancode').AsString,
                     Qanno.FieldByName('empno').AsString,
                     Qanno.FieldByName('korname').AsString,
                     '업적평가신규추가');
       end;
    end;
    Res.payra := Qanno.FieldByname('payra').AsString;
    Res.paycl := Qanno.FieldByname('paycl').AsString;
  end;
  
  if (Mas.deptcode <> Qanno.FieldByName('deptcode').AsString) or
     (Mas.orgnum   <> Qanno.FieldByName('orgnum').AsString) or
     (Mas.payra    <> Qanno.FieldByName('payra').AsString) then
  begin
     //현직책명 : 직책명라이브러리
     Mas.Paydunm := PaydunmCheck(Qanno.FieldByName('deptcode').AsString,
                                 Qanno.FieldByName('orgnum').AsString,
                                 Qanno.FieldByName('payra').AsString,
                                 Qanno.FieldByName('paycl').AsString,
                                 Mas.Payrayn);
//     //현노조원 여부 : 노조 라이브러리
//     nojo := '';
//     nojo_Check(Qanno.FieldByName('deptcode').AsString,
//                Qanno.FieldByName('payra').AsString,nojo);  // 후부서,후직위
//     Mas.nogubun := copy(nojo,1,2);
  end;
end;

// 현직무대리일 to를 구한다.....................................................
procedure Tpic1061gForm.Payra_Check;
begin
{  31.00      98.12.31      김혜진      직위,직급코드변경에 따라 직무대리일to변경.
================================================================================
}
  if (Qanno.fieldbyname('ancode').Asstring='342') or (Qanno.fieldbyname('ancode').Asstring='343') //직급전환,직급조정
                                                  or (Qanno.fieldbyname('ancode').Asstring='328')  then  //직무대리해제  2003.11.27 정규용추가
  begin
//jissi    뭐야?
    if (Qanno.fieldbyname('ancode').Asstring='328')  then //직무대리해제  2003.11.27 정규용추가
    if ((anfrdate.Text < payrachdate) and (copy(Mas.payra,2,1) = '5') and
        (copy(Qanno.FieldByname('payra').AsString,1,1) <> '3')        and
        (copy(Qanno.FieldByname('payra').AsString,1,1) <> '5'))       or
       ((anfrdate.Text  >=  payrachdate) and (Mas.payra = 'D11')      and
        (Qanno.FieldByname('payra').AsString <> 'C15'))               then
        // 현직무대리일 To 할당
        Mas.reppaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
  end
  else begin
    if (Mas.payra <> Qanno.FieldByname('payra').AsString) then
    begin
      if ((anfrdate.Text  <   payrachdate)                             and
          ((copy(Mas.payra,1,1) = '5') or (copy(Mas.payra,1,1) = '3')) and
           (copy(Qanno.FieldByname('payra').AsString,1,1) <> '3')      and
           (copy(Qanno.FieldByname('payra').AsString,1,1) <> '5')    ) or
         ((anfrdate.Text  >=  payrachdate) and (Mas.payra = 'C15')  and
           (Qanno.FieldByname('payra').AsString <> 'C15')         ) then
        // 직위첫자리가 '3',5' (직무대리직급)면 현직무대리일 To 할당
          Mas.reppaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
    end;
  end;
end;

// 발령구분별로 작업을 한다.....................................................
procedure Tpic1061gForm.ancode_Check;
var
  str   : string;
begin
  if Qanno.FieldByName('ancode').AsString = '111' then
  begin
    {신규채용일경우}
    {현전보일,현조직전보일,현입사일,현직급일,현직군일,현직렬일,최초입사일 : 발령일 From}
    {현입사직급,현입사호봉 : 후직급,후호봉}
    {현입사구분 : 발령세부구분}
    Mas.empcode    := Qanno.FieldByName('andetcode').AsString; // 발령세부 구분
    Mas.realtrdate := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 전보일
    Mas.offtrdate  := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 조직전보일
    Mas.empdate    := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 최초입사일
    Mas.orgempdate := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 입사일(하나로)
    Mas.paycldate  := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 직급일
    Mas.jobgundate := Qanno.FieldByName('anfrdate').AsString;  //발령일 -> 직군일
    Mas.emppaycl   := Qanno.FieldByName('paycl').AsString;
    Mas.jobpayra   := Qanno.FieldByName('payra').AsString;     //31.14 2001.08.31 shm 추가
   {30.00     98.12.31    김혜진    호봉,직렬 삭제.     하나로신인사재개발
    =====================================================================
    Mas.emppaygr   := FormatFloat('00',Qanno.FieldByName('paygr').AsFloat);
    Mas.empjobline := Qanno.FieldByName('jobline').AsString;
    Mas.joblinedate:= Qanno.FieldByName('anfrdate').AsString;}

    //31.04  신규채용 화일 write, - Res : 평가.
    Res.reconyn   := 'N';
    Res.prjexcode := '1';
    //2014.12.10.hjku.. I사번 체크는 사번으로.. 오류로 인해 변경..
    //if  copy(Qanno.FieldByName('ancode').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
    if  copy(Qanno.FieldByName('empno').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
        Res.pstate    := '82'
    else
        Res.pstate    := '10';
    Res.deptcode  := Qanno.FieldByName('deptcode').Asstring;
    Res.orgnum    := Qanno.FieldByName('orgnum').Asstring;
    Res.payra     := Qanno.FieldByName('payra').Asstring;
    Res.paycl     := Qanno.FieldByName('paycl').Asstring;
    Res.e1empno   := '';
    Res.e2empno   := '';
    Res.e1existyn := 'N';
    Res.e2existyn := 'N';
  end;

  {보임해제및 직무대리해제인 일경우}
  if (Qanno.FieldByName('ancode').AsString = '228') or (Qanno.FieldByName('ancode').AsString = '328') then
  begin
     Mas.jobpayrayn := 'N';
     Mas.payrayn    := 'N';
  end;


  {전보,전입일경우}
  if (Qanno.FieldByName('ancode').AsString = '251')  or
     (Qanno.FieldByName('ancode').AsString = '211') then
  begin
   {현인사상태 : 재직(10),현현원포함여부 :'Y'}
    Mas.pstateyn := 'Y';
    if (Qanno.FieldByName('ancode').AsString = '251') then //전입.
    begin
      Mas.orgempdate := Qanno.FieldByName('anfrdate').AsString;
      Mas.pstate   := '10';
    //31.04  신규채용 화일 write,
      Res.reconyn   := 'N';
      Res.prjexcode := '1';
      Res.deptcode  := Qanno.FieldByName('deptcode').Asstring;
      Res.orgnum    := Qanno.FieldByName('orgnum').Asstring;
      Res.payra     := Qanno.FieldByName('payra').Asstring;
      Res.paycl     := Qanno.FieldByName('paycl').Asstring;
      Res.e1empno   := '';
      Res.e2empno   := '';
      Res.e1existyn := 'N';
      Res.e2existyn := 'N';
    end;

    {교육관련(3x), 교육발령이 우선}
    if (copy(Qanno.FieldByName('andetcode').AsString,1,1) = '3') then//세부구분이 교육
    begin
      {현교육구분 : 발령세부구분,현교육기관,현교육과정 : 비고사항을 ","로 분리하여 차례대로 저장}
      {현교육기관 From,To,현교육지역 : 비고사항을 ","로 분리하여 차례대로저장}
      {현연락처 : 비고 3}
      {현인사상태 : 발령세부구분 }
      {현원포함여부 : 파견/교육훈련포함여부 }
       str := Qanno.FieldByName('Mark3').AsString;
       Mas.edugubun  := PasString(str,',',2);
       Mas.educont   := PasString(str,',',1);
       str := Qanno.FieldByName('Mark1').AsString;
       Mas.eduplace  := PasString(str,',',1);
       Mas.educourse := PasString(str,',',2);
       str := Qanno.FieldByName('Mark2').AsString;
       Mas.edufrdate := PasString(str,',',1);
       Mas.edutodate := PasString(str,',',2);
       Mas.eduarea   := PasString(str,',',3);
       Mas.pstate    := Qanno.FieldByName('andetcode').AsString;
       Mas.pstateyn  := edupstateyn; {파견/교육현원포함여부}
       Mas.edudufrdate := Qanno.FieldByName('hofrdate').AsString;
       Mas.edudutodate := Qanno.FieldByName('hotodate').AsString;
       //31.04
       Res.e1existyn := 'Y';  Res.e2existyn  := 'Y';
       Res.e1empno   := Eempno;
       Res.e2empno   := '';
       Res.pstate    := Qanno.FieldByName('andetcode').AsString;
       Res.deptcode  := Edeptcode;
    end;// 세부..교육.
  end;// 전입,전보 일경우.

  {겸직일경우}
  if Qanno.FieldByName('ancode').AsString = '233' then
  begin
  {현겸직직책명 : 직책명 lib(후부서(발령사항부서),겸직부서,겸직직위)}
  {현겸직일 from,to : 발령일 from,to}
    Mas.apdpaydunm := PaydunmCheck(Qanno.FieldByName('addeptcode').AsString,
                                   Qanno.FieldByName('orgnum').AsString,
                                   Qanno.FieldByName('adpayra').AsString,
                                   Qanno.FieldByName('paycl').AsString,
                                   Mas.Payrayn);
    Mas.apdpayfrdate := Qanno.FieldByName('anfrdate').AsString;
    Mas.apdpaytodate := Qanno.FieldByName('antodate').AsString;
  end;

  {겸직해제일경우}
  if Qanno.FieldByName('ancode').AsString = '238' then
  begin
  {현겸직일 to : 발령일 from을 1일 감소한다..}
//    Mas.apdpaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
     //------------------------------------------------------------------
     // 임현수대리님의 요청으로 겸직정보 삭제..CH.K.J. 수정(2005.11.21.)
     Mas.apdpaydunm   := '';
     Mas.apdpayfrdate := '';
     Mas.apdpaytodate := '';
     //------------------------------------------------------------------
  end;

  {직무대행일경우}
  if Qanno.FieldByName('ancode').AsString = '243' then
  begin
    {현직무댕직책명 : 직책명 lib(대행부서,후차수,대행직위)}
    {현직무대행일 from,to : 발령일 from,to}
     Mas.actpaydunm := PaydunmCheck(Qanno.FieldByName('addeptcode').AsString,
                                    Qanno.FieldByName('orgnum').AsString,
                                    Qanno.FieldByName('adpayra').AsString,
                                    Qanno.FieldByName('paycl').AsString,
                                    Mas.Payrayn);
     Mas.actpayfrdate := Qanno.FieldByName('anfrdate').AsString;
     Mas.actpaytodate := Qanno.FieldByName('antodate').AsString;
  end;

  {직무대행해제일경우}
  if Qanno.FieldByName('ancode').AsString = '248' then
  begin
{현겸직일 to : 발령일 from을 1일 감소한다..}
// Mas.actpaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
     //------------------------------------------------------------------
     // 임현수대리님의 요청으로 겸직정보 삭제..CH.K.J. 수정(2005.11.21.)
     Mas.actpaydunm   := '';
     Mas.actpayfrdate := '';
     Mas.actpaytodate := '';
     //------------------------------------------------------------------
  end;


  {승격일경우}
  if (Qanno.FieldByName('ancode').AsString = '311') or
     (Qanno.FieldByName('ancode').AsString = '123') then //임원승격 2001.07.20 shm
  begin
   {현승격일,현직급일 : 발령일 from}
    Mas.cpaycldate := Qanno.FieldByName('anfrdate').AsString;
    Mas.paycldate  := Qanno.FieldByName('anfrdate').AsString;
  end;

  {직무대리일경우}
  if Qanno.FieldByName('ancode').AsString = '322' then
  begin
    {현직무대리직급,현직무대리일 From : 후직급,발령일 from}
    {안써요
    Mas.reppaycl     := copy(Qanno.FieldByName('payra').AsString,1,1)+
                        copy(Qanno.FieldByName('paycl').AsString,2,1);
    }
    Mas.reppayfrdate := Qanno.FieldByName('anfrdate').AsString;
  end;

  {승급/승호일경우}
  if copy(Qanno.FieldByName('ancode').AsString,1,2) = '33' then
  begin
    {현최종장기승호일 : 발령일 from} //장기호봉.
    if Qanno.FieldByName('lpaygr').AsFloat > 0 then
       Mas.lragrdate := Qanno.FieldByName('anfrdate').AsString;
  end;

  {급호조정일경우}
  if Qanno.FieldByName('ancode').AsString = '341' then
  begin
   {현승역일 ,현직급일 : 휴직중휴가일 from,}
   {현최종장기승호일 : 휴직중휴가일 To }
    if Qanno.FieldByName('hofrdate').AsString <> '' then
    begin
      Mas.cpaycldate := Qanno.FieldByName('hofrdate').AsString;
      Mas.paycldate  := Qanno.FieldByName('hofrdate').AsString;
    end;
    if Qanno.FieldByName('hotodate').AsString <> '' then
      Mas.lragrdate := Qanno.FieldByName('hotodate').AsString;
  end;
 { 31.00   98.12.31     김혜진   직급전환발령    하나로신인사재개발
   31.06  2000.01.26    강기우   직급조정발령      ''
========================================================================
  현직급,직위 : 발령후직급,직위
  휴직중휴가일from이 null이 아니면
    현직급일,승격일 : 휴직중휴가일from
 }
  if (Qanno.FieldByName('ancode').Asstring = '342') or (Qanno.FieldByName('ancode').Asstring = '343') then
  begin
    Mas.paycl := Qanno.FieldByname('paycl').Asstring;
    Mas.payra := Qanno.FieldByname('payra').Asstring;
    if Trim(Qanno.FieldByName('hofrdate').Asstring) <> '' then
    begin
       Mas.paycldate  := Qanno.FieldByname('hofrdate').Asstring;
       Mas.cpaycldate := Qanno.FieldByname('hofrdate').Asstring;
    end;
  end;

  {호봉조정일경우}
  if Qanno.FieldByName('ancode').AsString = '346' then
    {현최종장기승호일 : 휴직중휴가일 To }
    if Qanno.FieldByName('hotodate').AsString <> '' then
       Mas.lragrdate := Qanno.FieldByName('hotodate').AsString;

//    31.02  99.02.08   김혜진   직급부여발령(355)추가. 하나로신인사재개발
  {직군부여/직군전환/직렬전환}
  if (Qanno.FieldByName('ancode').AsString = '351') or
     (Qanno.FieldByName('ancode').AsString = '355') or
     (Qanno.FieldByName('ancode').AsString = '352') then
  begin
    {현직군일,현직렬일 : 발령일 From}
    if (Qanno.FieldByName('ancode').AsString = '351') or
       (Qanno.FieldByName('ancode').AsString = '355') then
    begin
       Mas.jobgundate  := Qanno.FieldByName('anfrdate').AsString;
// 30.00      Mas.joblinedate := Qanno.FieldByName('anfrdate').AsString;
    end;
 // 30.00  else Mas.joblinedate := Qanno.FieldByName('anfrdate').AsString;
  end;

  {파견일경우}
  if Qanno.FieldByName('ancode').AsString = '411'   then
  begin
    {현파견구분 : 발령세부구분,현파견기간 : 발령일 From,to,현파견기관 : 비고1}
    {현파견목적 : 비고 2,현연락처 : 비고 3}
    {근무부서   : 겸직부서(사내파견일경우만)}
//파견시 근무지 근무부서 근무지로 수정. 2002.01.15 shm
    Mas.lsekind   := Qanno.FieldByName('andetcode').AsString;
    Mas.lsefrdate := Qanno.FieldByName('anfrdate').AsString;
    Mas.lsetodate := Qanno.FieldByName('antodate').AsString;
    Mas.jobdept   := Qanno.FieldByName('deptcode').AsString;
    
    Mas.lseplace  := Qanno.FieldByName('mark1').AsString;
    Mas.lsesayu   := Qanno.FieldByName('mark2').AsString;
//    Mas.lsecont   := Qanno.FieldByName('mark3').AsString;
    if (Qanno.FieldByName('andetcode').AsString = '21')  and
       (Qanno.FieldByName('adpayra').AsString   <> '' ) then     //2001.12.05 shm 추가
       Mas.jobpayra  := Qanno.FieldByName('adpayra').AsString
    else
       Mas.jobpayra  := Qanno.FieldByName('payra').AsString;

    if  Qanno.FieldByName('andetcode').AsString = '24' then   //2001.12.05 shm 자매파견
        Mas.jobpayrayn := 'N';

//    if  (Qanno.FieldByName('adpayra').AsString = '48') then   //팀장 31.14  2001.08.28 shm 추가
     if ((anfrdate.Text  <   payrachdate) and
         (Qanno.FieldByName('adpayra').AsString = '2C'))  or
        ((anfrdate.Text  >=  payrachdate) and
         (Qanno.FieldByName('adpayra').AsString = 'C11')) then    //31.16 정규용
         Mas.jobpayrayn := 'Y'
    else
         Mas.jobpayrayn := 'N';

//31.04
    Res.deptcode := Qanno.FieldByName('addeptcode').AsString;
    if Qanno.FieldByName('adpayra').AsString <> '' then
        res.payra  := Qanno.FieldByName('adpayra').AsString;

    if Mas.jobpayra = '' then
       Mas.jobpayra  := Qanno.FieldByName('payra').AsString;

    if Qanno.FieldByName('andetcode').AsString = '21' then
    begin
      Mas.jobdept   := Qanno.FieldByName('addeptcode').AsString;
    //31.04
      Res.e1existyn := 'N';  Res.e2existyn := 'N';
      Res.Trdate    := Qanno.FieldByName('anfrdate').AsString;
    end
    else
    begin  //31.04 대외파견등일 경우
      Res.e1existyn := 'Y'; Res.e2existyn := 'Y';
      Res.e1empno   := Eempno;
      Res.e2empno   := '';
      Res.deptcode  := Edeptcode;
      Res.Trdate    := Qanno.FieldByName('anfrdate').AsString;
    end;
  end;

  {파견연장일경우}
  if Qanno.FieldByName('ancode').AsString = '412' then
  begin
    {현파견구분 : 발령세부구분,현파견기간 : 발령일 to,현파견기관 : 비고1}
    {현파견목적 : 비고 2,현연락처 : 비고 3}
    {근무부서   : 겸직부서(사내퍄견일경우만)}
    Mas.lsekind   := Qanno.FieldByName('andetcode').AsString;
    Mas.lsetodate := Qanno.FieldByName('antodate').AsString;
    Mas.lseplace  := Qanno.FieldByName('mark1').AsString;
    Mas.lsesayu   := Qanno.FieldByName('mark2').AsString;
//    Mas.lsecont   := Qanno.FieldByName('mark3').AsString;

//  if  (Qanno.FieldByName('adpayra').AsString = '48') then   //팀장 31.14  2001.08.28 shm 추가
    if ((anfrdate.Text  <   payrachdate) and
         (Qanno.FieldByName('adpayra').AsString = '2C'))  or
        ((anfrdate.Text  >=  payrachdate) and
         (Qanno.FieldByName('adpayra').AsString = 'C11')) then
         Mas.jobpayrayn := 'Y'
    else
         Mas.jobpayrayn := 'N';
    if Qanno.FieldByName('andetcode').AsString = '21' then
      Mas.jobdept   := Qanno.FieldByName('addeptcode').AsString;
  end;

  {파견복귀일경우}
  if Qanno.FieldByName('ancode').AsString = '414' then
  begin
    {현파견기간 to : 발령일을 From 을 1을 감소,
    실근무부서(JOBDEPT)를 원래부서(DEPTCODE)와 동일하게 변경}
    Mas.lsetodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
    Mas.jobdept   := Qanno.FieldByName('deptcode').AsString;
    //31.04
    Res.deptcode  := Qanno.FieldByName('deptcode').AsString;
    Res.payra     := Qanno.FieldByName('payra').AsString;
    Res.Trdate    := Mas.Realtrdate;
    Res.e1existyn := 'N';  Res.e2existyn  := 'N';
  end;

 {휴직일경우}
  if Qanno.FieldByName('ancode').AsString = '511' then
  begin
   { 현휴직구분:발령세부구분,현휴직기간 from,to:발령일 from,to,}
   { 현휴직중휴가기간 : 휴직중 휴가일 from,to}
    Mas.lrkind   := Qanno.FieldByName('andetcode').AsString;
    Mas.lrfrdate := Qanno.FieldByName('anfrdate').AsString;
    Mas.lrtodate := Qanno.FieldByName('antodate').AsString;
    Mas.lvfrdate := Qanno.FieldByName('hofrdate').AsString;
    Mas.lvtodate := Qanno.FieldByName('hotodate').AsString;
    Res.Reconyn  := 'N';
    Res.prjexcode:= '3';
    Res.prjexfrdate:= Qanno.FieldByName('anfrdate').AsString;
    Res.prjextodate:= Qanno.FieldByName('antodate').AsString;
  end;

 {휴직연장일경우}
  if Qanno.FieldByName('ancode').AsString = '512' then
  begin
    { 현휴직구분:발령세부구분,현휴직기간 to:발령일to,}
    { 현휴직중휴가기간 : 휴직중 휴가일 from,to}
    Mas.lrkind   := Qanno.FieldByName('andetcode').AsString;//
    Mas.lrtodate := Qanno.FieldByName('antodate').AsString; //
    Mas.lvfrdate := Qanno.FieldByName('hofrdate').AsString; //
    Mas.lvtodate := Qanno.FieldByName('hotodate').AsString; //
    Res.Reconyn  := 'N';

    Res.prjexcode:= '3';
    Res.prjextodate:= Qanno.FieldByName('antodate').AsString;
  end;

  {휴직복귀일경우}
  if Qanno.FieldByName('ancode').AsString = '514' then
  begin
    {현휴직기간 to : 발령일을 From 을 1을 감소}
    Mas.lrtodate := DateCal1(Qanno.FieldByName('anfrdate').AsString); //
    //31.04
    Res.deptcode  := Qanno.FieldByName('deptcode').AsString;
    Res.payra     := Qanno.FieldByName('payra').AsString;
    Res.paycl     := Qanno.FieldByName('paycl').AsString;
    Res.Trdate    := Mas.Realtrdate;
    Res.e1existyn := 'N';   Res.e2existyn  := 'N';
  end;

  {징계일경우}
  if ((Qanno.FieldByName('ancode').AsString = '600') and (Qanno.FieldByName('andetcode').AsString = '61'))
    or (Qanno.FieldByName('ancode').AsString = '619')
    or ((Qanno.FieldByName('ancode').AsString = '600') and (Qanno.FieldByName('andetcode').AsString = '62'))
    or (Qanno.FieldByName('ancode').AsString = '629') then
  begin
    {현퇴사일,현퇴사사유1,2,현연락처 : 발령일 from,퇴사사유1,2,비고2}
    {현퇴사구분 : 널일겨우 (발령세부구분), 아닐경우 (발령구분 2) }
    Mas.retdate  := Qanno.FieldByName('anfrdate').AsString;
    if trim(Qanno.FieldByName('andetcode').AsString) <> '' then
       Mas.retgubun := Qanno.FieldByName('andetcode').AsString
    else
       Mas.retgubun := copy(Qanno.FieldByName('ancode').AsString,1,2);
    Mas.retsayu1 := Qanno.FieldByName('retsayu1').AsString;
    Mas.retsayu2 := Qanno.FieldByName('retsayu2').AsString;
//    Mas.retcont  := Qanno.FieldByName('mark3').AsString;
    Res.reconyn := 'N';
  end;

  {강직일경우}
  if (Qanno.FieldByName('ancode').AsString = '631') then
  begin
    {승격일,직급일 : 발령일 From 2009.10.15 이승철매니저 요청 강직일때 밴드조정일 그대로}
//    Mas.cpaycldate := Qanno.FieldByName('anfrdate').AsString;
//    Mas.paycldate  := Qanno.FieldByName('anfrdate').AsString;
  end;

  {면직/전적일경우}
  if (Qanno.FieldByName('ancode').AsString = '819') or
     (Qanno.FieldByName('ancode').AsString = '809') then
  begin
    {현퇴사일,현퇴사구분,현퇴사사유1,2,현연락처 : 발령일 from,발령세부구분,퇴사사유1,2,비고2}
    if Qanno.FieldByName('ancode').AsString = '809' then
      Mas.retdate  := DateCal1(Qanno.FieldByName('anfrdate').AsString)
    else
     Mas.retdate  := Qanno.FieldByName('anfrdate').AsString;
    Mas.retgubun := Qanno.FieldByName('andetcode').AsString;
    Mas.retsayu1 := Qanno.FieldByName('retsayu1').AsString;
    Mas.retsayu2 := Qanno.FieldByName('retsayu2').AsString;
//    Mas.retcont  := Qanno.FieldByName('mark2').AsString;
    Res.reconyn := 'N';
  end;

  {임시직에 관한사항}
  if (Qanno.FieldByName('ancode').AsString = '121') or  // 선임
     (Qanno.FieldByName('ancode').AsString = '124') or  // 재선임
     (Qanno.FieldByName('ancode').AsString = '131') or  // 계약
     (Qanno.FieldByName('ancode').AsString = '134') or  // 재계약
     (Qanno.FieldByName('ancode').AsString = '141') then // 위촉
  begin
   {현입사일,현입사직급,현입사호봉,현재임기간from,to,현직렬일,현직군일 :
    발령일 from,후직급,후호봉,발령일 from,to,발령일 from,from;}
    Mas.orgempdate := Qanno.FieldByName('anfrdate').AsString;
    Mas.emppaycl   := Qanno.FieldByName('paycl').AsString;
    Mas.jobpayra   := Qanno.FieldByName('payra').AsString;  //31.14 2001.08.31 shm 추가
    Mas.jobgundate := Qanno.FieldByName('anfrdate').AsString;
    Mas.empcode    := Qanno.FieldByName('andetcode').AsString;
    Mas.paycldate  := Qanno.FieldByName('anfrdate').AsString;
    Mas.otdufrdate := Qanno.FieldByName('anfrdate').AsString;
    Mas.otdutodate := Qanno.FieldByName('antodate').AsString;
    // 30.08 일반직 자동화.
    if copy(Qanno.FieldByName('empno').AsString,1,1) = 'Y' then//일반직일 경우.
    begin
      Mas.emppaygr   := FormatFloat('00',Qanno.FieldByName('paygr').AsFloat);
      Mas.paygr   := FormatFloat('00',Qanno.FieldByName('paygr').AsFloat);
    end;
{ 30.00     98.12.31     김혜진    직렬,호봉 삭제
=================================================================
  Mas.joblinedate:= Qanno.FieldByName('anfrdate').AsString;
  Mas.empjobline := Qanno.FieldByName('jobline').AsString;
}
    if (Qanno.FieldByName('ancode').AsString = '131') or  // 계약
       (Qanno.FieldByName('ancode').AsString = '134') or  // 재계약
       (Qanno.FieldByName('ancode').AsString = '141') then // 위촉
    begin
      if trim(Qanno.FieldByName('tcontr').AsString) <> '' then
           Mas.tcontr    := Qanno.FieldByName('tcontr').AsString;
      //30.08 일반직시 계약금약 '0'처리 허용.
      if (Qanno.FieldByName('tcontramt').AsFloat > 0) or
        ((Qanno.FieldByName('tcontramt').AsFloat = 0) AND (copy(Qanno.FieldByName('empno').AsString,1,1) = 'Y'))then
           Mas.tcontramt := FormatFloat('000000000000',Qanno.FieldByName('tcontramt').AsFloat);
      if ((Trim(Qanno.FieldByName('paygr').AsString) <> '') AND (copy(Qanno.FieldByName('empno').AsString,1,1) = 'Y')) then
           Mas.paygr     := Qanno.FieldByName('paygr').AsString;  //일반직시 호봉 입력.

      if Trim(Qanno.FieldByName('ttype').AsString) <> '' then
           Mas.ttype     := Qanno.FieldByName('ttype').AsString;    //근무 형태.
      if Trim(Qanno.FieldByName('tjobduty').AsString) <> '' then
           Mas.tjobduty  := Qanno.FieldByName('tjobduty').AsString; //일반직(직무 코드)-따로error처리(X)
      if Trim(Qanno.FieldByName('mark1').AsString) <> '' then
           Mas.tcond     := Qanno.FieldByName('mark1').AsString;  //비고1 - 계약직은 기타조건.
    end;
    if (Qanno.FieldByName('ancode').AsString = '121') or  // 선임
       (Qanno.FieldByName('ancode').AsString = '131') or  // 계약
       (Qanno.FieldByName('ancode').AsString = '141') then  // 위촉
    begin
        Mas.empdate    := Qanno.FieldByName('anfrdate').AsString;
    end;
  end; //임시직 경우 end;

  {연임,승진,승진연임,계약연장,계약변경,전환}
  if (Qanno.FieldByName('ancode').AsString = '122') or
//     (Qanno.FieldByName('ancode').AsString = '123') or  2001.09.25 shm 승진시 계약(선임)기간에 영향 X
     (Qanno.FieldByName('ancode').AsString = '125') or                   //선임기간 최초 계약일!!! shm
     (Qanno.FieldByName('ancode').AsString = '132') or
//     (Qanno.FieldByName('ancode').AsString = '721') or
     (Qanno.FieldByName('ancode').AsString = '711') then
  begin
    {현재임기간 : 발령일from,to | 계약사항 }
    Mas.otdufrdate := Qanno.FieldByName('anfrdate').AsString;
    if trim(Qanno.FieldByName('antodate').AsString) <> '' then  //계약 종료일.
        Mas.otdutodate := Qanno.FieldByName('antodate').AsString;
    if (Qanno.FieldByName('ancode').AsString = '132') or    //계약연장
       (Qanno.FieldByName('ancode').AsString = '711') then  //계약변경
    begin
       if Qanno.FieldByName('tcontr').AsString <> '' then
           Mas.tcontr    := Qanno.FieldByName('tcontr').AsString;  //계약 방법.
       //일반직시 계약금약 '0'처리 허용.
       if (Qanno.FieldByName('tcontramt').AsFloat > 0) or
        ((Qanno.FieldByName('tcontramt').AsFloat = 0) AND (copy(Qanno.FieldByName('empno').AsString,1,1) = 'Y'))then
            Mas.tcontramt := FormatFloat('000000000000',Qanno.FieldByName('tcontramt').AsFloat);
       if ((Trim(Qanno.FieldByName('paygr').AsString) <> '') AND (copy(Qanno.FieldByName('empno').AsString,1,1) = 'Y')) then
           Mas.paygr     := Qanno.FieldByName('paygr').AsString;  //일반직시 호봉 입력.

       if Trim(Qanno.FieldByName('ttype').AsString) <> '' then
           Mas.ttype     := Qanno.FieldByName('ttype').AsString;     //근무 형태
       if Trim(Qanno.FieldByName('tjobduty').AsString) <> '' then
           Mas.tjobduty  := Qanno.FieldByName('tjobduty').AsString;  //직무코드-따로error처리(X)
       if Trim(Qanno.FieldByName('mark1').AsString) <> '' then
           Mas.tcond     := Qanno.FieldByName('mark1').AsString;     //비고1,
    end;  //계약 연장, 계약 변경 END
  end;{연임,승진,승진연임,계약연장,계약변경,전환  END}

  {해임,계약해지,위촉해지}
  if (Qanno.FieldByName('ancode').AsString = '829') or
     (Qanno.FieldByName('ancode').AsString = '849') or
     (Qanno.FieldByName('ancode').AsString = '839') then
  begin
    {현퇴사일,연락처 : 발령일 from,비고 2}
    Mas.otdutodate := Qanno.FieldByName('anfrdate').AsString;
    Mas.retdate    := Qanno.FieldByName('anfrdate').AsString;
//    Mas.retcont    := Qanno.FieldByName('mark2').AsString;
    Mas.retsayu1   := Qanno.FieldByName('retsayu1').AsString;
    Mas.retsayu2   := Qanno.FieldByName('retsayu2').AsString;
    Res.reconyn := 'N';
    if (Qanno.FieldByName('ancode').AsString = '829') then
       Mas.retgubun := '95' else Mas.retgubun := '97';
  end;{해임,계약해지,위촉해지 END}

  {부서변동}
  if (Qanno.FieldByName('ancode').AsString = '712') then
  begin
    if Trim(Qanno.FieldByName('tjobduty').AsString) <> '' then
         Mas.tjobduty := Qanno.FieldByName('tjobduty').AsString;
  end;

{-------------------------------------------------------------------------------
    버전    수정일    수정자   관련근거          수정내용
    1.02  1998.4.20   김혜진   전(98.4.11)  계약,재계약,부서변동,계약변경,계약해지
                                            발령에서 파견업체 추가.
 -------------------------------------------------------------------------------}
  if (Qanno.FieldByName('ancode').Asstring = '131') or
     (Qanno.FieldByName('ancode').Asstring = '132') or
     (Qanno.FieldByName('ancode').Asstring = '134') or
     (Qanno.FieldByName('ancode').Asstring = '711') or
     (Qanno.FieldByName('ancode').Asstring = '712') or
     (Qanno.FieldByName('ancode').Asstring = '839') then
  begin
    if Trim(Qanno.FieldByname('tcompany').ASstring) <> '' then
         Mas.tcompany := Qanno.FieldByName('tcompany').Asstring;
  end;

  if (Qanno.FieldByName('ancode').AsString = '975')  then  //담당지정 추가 shm 2002.02.28
  begin
    Mas.paycl := Qanno.FieldByname('paycl').Asstring;
    Mas.payra := Qanno.FieldByname('payra').Asstring;
    Mas.payrayn := 'Y';
  end;


// 근무지 읽기..
  QDept.Close;
  // QDept.Sql.Text := 'select deptname,fieldcode,placecode,deptna1,deptna2,deptna3, '+
  //                   '       deptlevel,fincode,deptabbr,boncode                    '+
  //                   'from pycdept                                                 '+
  //                   'where (deptcode = :ldept and orgnum = :lorgnum)              ';
  QDept.ParamByName('Ldept').AsString     := Mas.jobdept;
  QDept.ParamByName('lorgnum').AsString   := Qanno.FieldByName('orgnum').AsString;
  QDept.Open;
  Mas.jobplace := Qdept.FieldByName('placecode').AsString;
  Qdept.close;
end;

//................근속제외 루틴.................................................
procedure Tpic1061gForm.exdu_check;
var
  Cal1 : integer;
  Cal2 : string[6];
  hyy,hmm,hdd : string[2];
begin
Try {에러루틴 케크}
  if (Qanno.Fieldbyname('ancode').Asstring = '511') or (Qanno.Fieldbyname('ancode').Asstring = '512')  then
  begin                                          //휴직 or 휴직연장인 사람경우...
     if (Qanno.FieldByName('andetcode').Asstring = '71') or  //공상휴직 or (병역휴직 and 1994년이후자)이거나...  --하나로 통신중.
        ((Qanno.FieldByName('andetcode').Asstring = '73') and (Qanno.FieldByname('anfrdate').Asstring >= '19940915'))  or
// 31.09  육아휴직 수정.
{        (  ((Qanno.FieldByName('andetcode').Asstring = '76') or (Qanno.FieldByName('andetcode').Asstring = '77')) //1996년이후에 출산 or 육아휴직
            and (Qanno.FieldByname('anfrdate').Asstring >= '19961118')
}
        ((Qanno.FieldByName('andetcode').Asstring = '76') and (Qanno.FieldByname('anfrdate').Asstring >= '19961118')
        ) then
             system.exit;
  end;
  if (Qanno.Fieldbyname('ancode').Asstring = '514') then
  begin                                  //복직인 경우.
     if (Mas.Pstate = '71') or                 //인사상태가 공상휴직이거나.
        ((Mas.pstate='73') and (Mas.lrfrdate >= '19940915')) or    //병역휴직 and 1994년이후자 이거나....
        (((Mas.pstate='76') or (Mas.pstate='77')) and (Mas.lrfrdate >= '19961118')) then  //1996년이후에 출산 or 육아휴직
          system.exit;
  end;
  if (Qanno.Fieldbyname('ancode').Asstring = '600') then       //징계발령은 모두 제외.(정직만 근속기간을 계산.)
     if (Qanno.FieldByName('andetcode').Asstring <> '64') then
       system.exit;
//  if (Qanno.Fieldbyname('ancode').Asstring <> '641') then
//       system.exit;

///////
  {1. 근속제외루틴 발령구분 = 복직일경우 발령일 from이 현최종근속제외기간 to 보다 작을 경우}
  if Qanno.FieldByName('ancode').AsString = '514' then
    if Qanno.FieldByName('anfrdate').AsString < Mas.lextodate then
    begin
     {현최종근속제외기간 To : 발령일 from을 1일 감소한다.}
     {현총근속제외년/월/일수 : 현최종근속제외년/월/일수를 감한다.}
     {현최종근속제외년/월/일수 : 현최종근속제외기간 from,to를 다시계산한다.}
     {현총근속제외년/월/일수 : 현최종근속제외년/월/일수를 더한다.}
     {사원번호, 현최종근속제외기간from을 key로하여 근속제외내역화일을 수정한다.}
     {근속재외기간 To ; 현최종근속제외기간 To}
     {근속재외년/월/일수 : 최종근속제외년/월/일수}
       Mas.lextodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
        {근속제외관리화일의 자료를 수정한다..}
       cal2 := DateCal(Mas.lexfrdate,Mas.lextodate);
       Mas.lexduyy := copy(Cal2,1,2);
       Mas.lexdumm := copy(Cal2,3,2);
       Mas.lexdudd := copy(Cal2,5,2);
       HelpDsr.Caption := '근속제외내역화일을 수정하고 있는 중입니다..';
       SendMessage(Phelp.handle,WM_PAINT,0,0);
       Qexdu.Close;  Qexdu.Sql.Clear;
       with Qexdu do begin
           Sql.Add('update pihexdu set ');
           Sql.Add(Format('extodate=''%s'',exduyy=''%3f'',exdumm=''%3f'',exdudd=''%3f'',',
                   [Mas.lextodate,StrToFloat(Mas.lexduyy),StrToFloat(Mas.lexdumm),
                    StrToFloat(Mas.lexdudd)] ));
           Sql.Add(Format('writetime=''%s'',writeemp=''%s'' ',
                   [copy(timedate(Query1),1,15),p_empno] ));
           Sql.Add(Format('where (empno = ''%s'' and exfrdate = ''%s'')',
                   [Mas.empno,Mas.lexfrdate] ));
           EXECSQL;
       end;
       Qexdu.Close;
       // 총근속제외 년,월,일수 계산..
       Qex1.sql.clear;  Qex1.close;
       Qex1.sql.add('select sum(exduyy) yy,sum(exdumm) mm,sum(exdudd) dd ');
       Qex1.sql.add('from pihexdu ');
       Qex1.sql.add(Format('where (empno = ''%s'' and exentyn =''Y'')',[Mas.empno]));
       Qex1.open;
       cal2  := calexdu(Qex1.FieldByName('yy').AsFloat,
                        Qex1.FieldByName('mm').AsFloat,
                        Qex1.FieldByName('dd').AsFloat);
       Mas.exdutyy := copy(cal2,1,2);
       Mas.exdutmm := copy(cal2,3,2);
       Mas.exdutdd := copy(cal2,5,2);
       Qex1.close;
       System.Exit;
     end else system.Exit;

  {2. 현 최종근속제외기간 From,to :발령일 From,to}
  Mas.lexfrdate := Qanno.FieldByName('anfrdate').AsString;
  Mas.lextodate := Qanno.FieldByName('antodate').AsString;
  {3. 현 푀종근속제외기간 년/월/일수 : 현근속제외기간 From,To로 다시계산 }
  cal2 := DateCal(Mas.lexfrdate,Mas.lextodate);
  Mas.lexduyy := copy(Cal2,1,2);
  Mas.lexdumm := copy(Cal2,3,2);
  Mas.lexdudd := copy(Cal2,5,2);
  {4. 근속제외루틴 (발령구분 = 휴직,휴직연장일경우
      휴직중휴가일 from이 space가 아니고 휴직중휴가일이 space가 아니면}
  if (Qanno.FieldByName('ancode').AsString = '511') or
     (Qanno.FieldByName('ancode').AsString = '512') then
     if (Qanno.FieldByName('hofrdate').AsString <> '') and
        (Qanno.FieldByName('hotodate').AsString <> '') then begin
         Cal2 := DateCal(Qanno.FieldByName('hofrdate').AsString,
                         Qanno.FieldByName('hotodate').AsString);
         hyy := copy(Cal2,1,2); hmm := copy(Cal2,3,2); hdd := copy(Cal2,5,2);

         Cal2 := CalExduMinus(StrToInt(Mas.lexduyy),StrToInt(Mas.lexdumm),StrToInt(Mas.lexdudd),
                              StrToInt(hyy),StrToInt(hmm),StrToInt(hdd));
         Mas.lexduyy   := copy(Cal2,1,2);
         Mas.lexdumm   := copy(Cal2,3,2);
         Mas.lexdudd   := copy(Cal2,5,2);
     end;
  {7.근속제외내역화일에 자료를 저장한다.}
  {사원번호 : 사원번호, 성명 : 성명,근속제외기간 from,to : 현최종근속제외기간 from,to}
  {조직차수,부서코드,직급,호봉,직위 : 발령후 데이타}
  {발령번호:발령번호,발령일 from,to : 발령일 from,to,발령구분 : 발령구분}
  {근속제외제외기간 년/월/일수 : 현최종근속제외 년.월./일수 }
  {근속제외포함여부,승격관련여부,승호관련여부 : Y}
  {근속제외구분 : 발령구분이 정직(641)이면 발령구분 그렇지 않으면 발령세부구분}
  {근속제외비고 : 비고 1}
  HelpDsr.Caption := '☞ 근속제외내역화일을 저장하고 있는 중입니다..';
  SendMessage(Phelp.handle,WM_PAINT,0,0);
  Qexdu.Close;
  Qexdu.Sql.Clear;
  with Qexdu do
  begin
     Sql.Add('insert into pihexdu                                                         ');
     Sql.Add('(empno,korname,exfrdate,extodate,orgnum,deptcode,paycl,paygr,payra,exannono,');
     Sql.Add(' exanfrdate,exantodate,exancode,exduyy,exdumm,exdudd,exentyn,excode,exbigo, ');
     Sql.Add(' exrasyn,exragryn,exingoyn,writetime,writeemp) values (                     ');
     Sql.Add(Format(' ''%s'',''%s'',''%s'',''%s'',''%s'', ',
             [Qanno.FieldByName('empno').AsString,Qanno.FieldByName('korname').AsString,
              Mas.lexfrdate,Mas.lextodate,Qanno.FieldByName('orgnum').AsString] ));
     Sql.Add(Format(' ''%s'',''%s'',''%3f'',''%s'',''%s'', ',
             [Qanno.FieldByName('deptcode').AsString,Qanno.FieldByName('paycl').AsString,
              Qanno.FieldByName('paygr').AsFloat,Qanno.FieldByName('payra').AsString,
              Qanno.FieldByName('annono').AsString] ));
     Sql.Add(Format(' ''%s'',''%s'',''%s'',''%3f'',',
             [Qanno.FieldByName('anfrdate').AsString,Qanno.FieldByName('antodate').AsString,
              Qanno.FieldByName('ancode').AsString,StrToFloat(Mas.lexduyy)] ));
     Sql.Add(Format(' ''%3f'',''%3f'',''%s'',:lancode,''%s'',',
             [StrToFloat(Mas.lexdumm),StrToFloat(Mas.lexdudd),'Y',
              Qanno.FieldByName('mark1').AsString] ));
     Sql.Add(Format(' ''%s'',''%s'',''%s'',''%s'',''%s'') ',
             ['Y','Y','Y',copy(timedate(Query1),1,15),p_empno] ));
     if Qanno.FieldByName('ancode').AsString = '641' then
        ParambyName('lancode').AsString := Qanno.FieldByName('ancode').AsString
     else ParambyName('lancode').AsString := Qanno.FieldByName('andetcode').AsString;
     EXECSQL;
  end;
  {5.현총근속제외횟수 1증가}
  Mas.exdutcnt := IntToStr(StrToInt(Mas.exdutcnt)+1);
  {6.현총근속제외 년/월/일수 : 현최종근속제외 년/월/일수를 더한다.}
  Qex1.sql.clear;  Qex1.close;
  Qex1.sql.add('select sum(exduyy) yy,sum(exdumm) mm,sum(exdudd) dd ');
  Qex1.sql.add('from pihexdu ');
  Qex1.sql.add(Format('where (empno = ''%s'' and exentyn =''Y'')',[Mas.empno]));
  Qex1.open;
  cal2  := calexdu(Qex1.FieldByName('yy').AsFloat,
                   Qex1.FieldByName('mm').AsFloat,
                   Qex1.FieldByName('dd').AsFloat);
  Mas.exdutyy := copy(cal2,1,2);
  Mas.exdutmm := copy(cal2,3,2);
  Mas.exdutdd := copy(cal2,5,2);
  Qex1.close;
//.....
EXCEPT ON E : EDataBaseError DO
   MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
END;
end;

//....................인사상태 Rtn.....................................
procedure Tpic1061gForm.pstate_Check;
begin
 {1.발령일 from이 시스템보다 크고나 발령구분이 전보,전입일경우는 루틴종료}
 if (Qanno.FieldByName('anfrdate').AsString > CurDate) or
    (Qanno.FieldByName('ancode').AsString = '211') or
    (Qanno.FieldByName('ancode').AsString = '251') or
    (Qanno.FieldByName('ancode').AsString = '935') or //차수변경
    (Qanno.FieldByName('ancode').AsString = '311') or
    (Qanno.FieldByName('ancode').AsString = '337') or
    (Qanno.FieldByName('ancode').AsString = '342') or  //31.00  현인사상태 그대로 유지.
    (Qanno.FieldByName('ancode').AsString = '343') or  //31.06            ''
    (Qanno.FieldByName('ancode').AsString = '995') or  //코드변경 2001.07.20 shm
    (Qanno.FieldByName('ancode').AsString = '955') or  //코드변경 2001.12.26 shm
    (Qanno.FieldByName('ancode').AsString = '712') then
     System.Exit;

 //2014.12.10.hjku.. I사번 체크는 사번으로.. 오류로 인해 변경..
 //if  copy(Qanno.FieldByName('ancode').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
 if  copy(Qanno.FieldByName('empno').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
 begin                                                           //I사번 현원포함안함
     Mas.pstate   := '82';
     Mas.pstateyn := 'N';
 end
 else
 begin
     Mas.pstate   := '10';
     Mas.pstateyn := 'Y';
 end;


 {2.발령구분 첫번째 = '1' 이면 현인사상태 : 재직,현현원포함여부 'Y'}
 if copy(Qanno.FieldByName('ancode').AsString,1,1) = '1' then system.exit;
 {2.발령구분이 파견,파견연장일경우 현인사상태 : 발령세부구분,
    현현원포함여부 : 파견/교육현원포함여부}
 if (Qanno.FieldByName('ancode').AsString = '411') or
    (Qanno.FieldByName('ancode').AsString = '412') then
 begin
   Mas.pstate   := Qanno.FieldByName('andetcode').AsString;
   Mas.pstateyn := edupstateYn;
   Res.pstate   := Qanno.FieldByName('andetcode').AsString;
 end;

 {2. 발령구분이 휴직,휴직연장일경우 현입사상태 : 발령세부구분,
     현현원포함여부 : 휴직자현원포함여부}
 if (Qanno.FieldByName('ancode').AsString = '511') or
    (Qanno.FieldByName('ancode').AsString = '512') then
 begin
   Mas.pstate   := Qanno.FieldByName('andetcode').AsString;
   Mas.pstateyn := hupstateYn;
   Res.pstate   := Qanno.FieldByName('andetcode').AsString;
 end;
 {2. 발령구분이 정직,징계 and 발령세부구분이 정직 이면 인사상태 : 정직
     현현원포함여부 : 정직자현원포함여부}
 if (Qanno.FieldByName('ancode').AsString = '641') or
    ((Qanno.FieldByName('ancode').AsString = '600') and
     (Qanno.FieldByName('andetcode').AsString = '64')) then
 begin
   Mas.pstate   := '60';
   Mas.pstateyn := jupstateYn;
 end;
 {2. 발령구분이 저직해고,권고사직,징계 and 발령세부구분 징계해고(61) 이면
 {   현인사상태 : 징계면직, 현현원포함여부 : 'N'}
 if (Qanno.FieldByName('ancode').AsString = '619') or
    (Qanno.FieldByName('ancode').AsString = '629') or
    ((Qanno.FieldByName('ancode').AsString = '600') and
     (Qanno.FieldByName('andetcode').AsString = '61')) then
 { 발령구분이 징계 and 발령세부구분 권고사직(62)인 경우는 나중에 사직서 받아서 의면면직 처리.
   루틴에서 뺌 2009.07.10 0884 이승철매니저 요청 }
//    ((Qanno.FieldByName('ancode').AsString = '600') and
//     (Qanno.FieldByName('andetcode').AsString = '62')) then
 begin
    Mas.pstate   := '94';
    Mas.pstateyn := 'N';
    Res.pstate   := '94';
 end;
 {2. 발령구분이 면직일경우 현인사상태 : 발령세부구분,현원포함여부 'N'}
 if (Qanno.FieldByName('ancode').AsString = '819') or
    (Qanno.FieldByName('ancode').AsString = '809') then
 begin
    Mas.pstate   := Qanno.FieldByName('andetcode').AsString;
    Mas.pstateyn := 'N';

    Res.pstate   := Qanno.FieldByName('andetcode').AsString;
 end;
 {2. 발령구분이 해임일경우 현인사상태 : 해임,현원포함여부 'N'}
 if (Qanno.FieldByName('ancode').AsString = '829') then
 begin
    Mas.pstate   := '95';
    Mas.pstateyn := 'N';
    Res.pstate   := '95';
 end;
  {2. 발령구분이 계약해지일경우 현인사상태 : 계약해지,현원포함여부 'N'}
 if (Qanno.FieldByName('ancode').AsString = '839') then
 begin
    Mas.pstate   := '97';
    Mas.pstateyn := 'N';
    Res.pstate   := '97';
 end;
//////////////////////////////////////////////////////////////////////////////////////
//  31.17 대기발령(461) 추가 (인사상태 처리)    2004.03.26 정규용
///////////////////////////////////////////////////////////////////////////////////////
 {2. 발령구분이 대기발령(461)일경우: 인사상태->대기발령 }
 if (Qanno.FieldByName('ancode').AsString = '461') then
 begin
   Mas.pstate := '40';  //대기발령
 end;
///////////////////////////////////////////////////////////////////////////////////////
end;

//........................작업처리 RTN 1........................................
function Tpic1061gForm.Work_Rtn1 : string;
{인사발령화일에서 자료를 읽어온다..}
begin
  Work_Rtn1 := 'True';
  HelpDsr.Caption := '인사발령화일을 읽는 중입니다..';
  SendMessage(Phelp.handle,WM_PAINT,0,0);
  with Qanno do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select a.empno,a.korname,a.annono,a.anseqno,a.anfrdate,a.antodate,      ');
       Sql.Add('       a.ancode,a.andetcode,a.orgnum,a.deptcode,a.paycl,a.payra,        ');
       Sql.Add('       a.paygr,a.jobgun,a.jobline,a.mark1,a.mark2,a.mark3,a.addeptcode, ');
       Sql.Add('       a.adpayra,a.rpaygr,a.lpaygr,a.spaygr,a.hofrdate,a.hotodate,      ');
       Sql.Add('       a.retsayu1,a.retsayu2,a.tcontr,a.tcontramt,a.tjobduty,a.tcompany,');
       Sql.Add('       a.ttype,a.bannono,a.banfrdate,a.bantodate,a.bancode,a.bandetcode,');
       Sql.Add('       a.borgnum,a.bdeptcode,a.bpaycl,a.bpaygr,a.bpayra,a.anupdyn       ');
       Sql.Add('from pihanno a,pihanba b                                                ');
       Sql.Add(Format('where ((a.anfrdate >= ''%s'' and a.anfrdate <= ''%s'') and       ',
               [anfrdate.Text,antodate.Text])                                           );
       Sql.Add('       (a.anupdyn = ''N'') and                                          ');
       Sql.Add('       ((a.annono = b.annono) and (b.anupdateyn = ''Y'')) )             ');
       Sql.Add('order by a.annono,a.anfrdate,a.anseqno');
       Open;
//       Edit1.Text := sql.text;
       ReadAnno := RecordCount;  {인사발령 읽은건수를 임시화일에 할당}
  end;
  SendMessage(readNum.handle,WM_PAINT,0,0);

  if ReadAnno <= 0 then Work_Rtn1 := '데이타NO';

end;

//........작업처리 RTN 2.............................// 진짜실행문은 1760 line
function Tpic1061gForm.Work_Rtn2 : string;  //T or F 결과.
var
  err, i, ErNum, AcNum, RdNum : integer;
const
  contr : array[1..6] of string[3] = ('111','121','124','131','134','141');
                                    //신규,선임,재선임,계약,재계약,위촉
  procedure DispGuage;  //그림 표시.
  begin
    ReadNum.Caption  := IntToStr(RdNum)+' / '+IntToStr(ReadAnno);
    CanCelno.Caption := InttoStr(Cancelanno);
    ErrNum.Caption   := InttoStr(ErNum);
    AcessNum.Caption := IntToStr(AcNum);
    SendMessage(ReadNum.handle,WM_PAINT,0,0);
    SendMessage(Cancelno.handle,WM_PAINT,0,0);
    SendMessage(AcessNum.handle,WM_PAINT,0,0);
    if RdNum <> ReadAnno then ga1.progress := (RdNum*100) div ReadAnno else ga1.progress := 100;
  end;

   procedure QsaveRtn;  //발령테이블 수정.
  begin
  {-------------------------------------------------------------------------------
      버전    수정일    수정자   관련근거          수정내용
      1.01  1998.2.23   김순례   콜(98.2.23)  발령화일의 회사구분필드(comgubun="3') 추가
   -------------------------------------------------------------------------------}
     with Qsave do begin
          HelpDsr.Caption := '인사발령화일을 수정하고 있는 중입니다.';
          SendMessage(Phelp.handle,WM_PAINT,0,0);
          Close; Sql.Clear;
          Sql.add('update pihanno set ');
          sql.add(Format('bannono =''%s'',banfrdate   =''%s'',bantodate =''%s'',',
                  [Mas.lannono,Mas.lanfrdate,Mas.lantodate]));
          sql.add(Format('bancode =''%s'',anupdyn     =''Y'' ,anupdtime =''%s'',comgubun = ''3'',writeemp =''%s'' ',
                  [Mas.lancode,copy(timedate(Query1),1,15), p_empno]));
          sql.add(Format('where ((empno    = ''%s'') and (annono = ''%s'') and',
                  [Qanno.FieldByName('empno').AsString,Qanno.FieldByName('annono').AsString]));
          sql.add(Format('       (anfrdate = ''%s'') and (ancode = ''%s''))',
                  [Qanno.FieldByName('anfrdate').AsString,Qanno.FieldByName('ancode').AsString]));
          EXECSQL;
     end;
  end;

{WORK_RTN_Check prcedure 시작}
begin
  Work_Rtn2 := 'True';
  ErNum := 0;  AcNum := 0; RdNum := 0; Cancelanno := 0;
  Qanno.First;      //사번,발령일,발령번호 순으로 모두조회
  while not Qanno.Eof do
  begin
    MasterSpace; {1.인사마스터 임시변수를 Clear 한다..}
    inc(RdNum);
    pehremasSpace;   //31.04 업적평가마스터화일에 update할 항목을 clear.

    SendMessage(DbGrid1.handle,WM_PAINT,0,0);

    {2. 신규채용,선임,재선임,계약,재계약이 아닐경우에만 데이타를 인사마스터에서 읽는다.}
    err := 0;
    for i := 1 to 6 do
       if Qanno.FieldByName('ancode').AsString = contr[i] then inc(err);//신규여부 조사.
    if err = 0 then
    begin
      HelpDsr.Caption := '기본인사사항 화일을 읽는 중입니다..';
      SendMessage(Phelp.handle,WM_PAINT,0,0);
      Qmas.Close;
      // Qmas.Sql.Text := 'select  * from pimpmas where empno = :lempno';
      Qmas.ParamByName('lempno').AsString := Qanno.FieldByName('empno').AsString;
      Qmas.Open;
      AssignMaster;
      Qmas.Close;
      //31.04   업적평가마스터화일의 인사사항을 추출
      Qres.Close;
      Qres.Sql.Clear;
      Qres.Sql.Add('SELECT empno,jobgun,orgnum,deptcode,trdate,paycl,payra,e1empno,e2empno,'+
                   '       e1existyn, e2existyn,reconyn,pstate                             '+
                   '  FROM pehremas                                                        '+
                   ' WHERE rabasdate ='''+Erabasdate+'''                                   '+
                   '   and empno = '''+Qanno.FieldByname('empno').Asstring+'''             ');
      Qres.Open;
      AssignPehremas;
      Qres.Close;
    end; {if err > 0 then begin}

    // 발령구분 = 발령정정,발령취소 일경우
    //   - 발령정정,취소 건수 계산
    //   - 기본인사사항 및 근속제외사항 정정요 메세지 출력후 다음자료 처리한다..
    if (Qanno.FieldByName('ancode').AsString = '915') or
       (Qanno.FieldByName('ancode').AsString = '925') then
    begin
      inc(Cancelanno);
      DispGuage;
      ErrorWrite(Qanno.FieldByName('annono').AsString,
                 Qanno.FieldByName('anfrdate').AsString,
                 Qanno.FieldByName('antodate').AsString,
                 Qanno.FieldByName('ancode').AsString,
                 Qanno.FieldByName('empno').AsString,
                 Qanno.FieldByName('korname').AsString,
                 '발령정정/취소');
      // 915,925일때는 발령경신이 된것처럼 처리한다..
      QsaveRtn;
//=======================================================================================
//  발령정정(915),발령취소(925)시 다른 발령가 동일하게 인사마스터에도 경신되게 주석처리
//                                          2003.11.26     최상용 요청        작업자:정규용
//=======================================================================================
//    MessageBox(pic1061gForm.handle,'기본인사사항 및 근속제외사항 정정요 !!.',
//               '확 인',MB_OK or $0010);
//    Qanno.Next; continue;
//=======================================================================================
    end;//발령 취소시.

    //3.임명,임명해제일 경우.........
    if (Qanno.FieldByName('ancode').AsString = '253') or
       (Qanno.FieldByName('ancode').AsString = '258') then
    begin
      inc(AcNum);
      DispGuage;
      QsaveRtn;
      Qanno.Next;
      continue;
    end;
    HelpDsr.Caption := '인사 발령사항 조건을 체크하는 중입니다..';
    SendMessage(Phelp.handle,WM_PAINT,0,0);

    Jobline_Check;    {4.  직군중 }
    Payrayn_Check;    {5.  보임여부 체크}
    Deptcode_Check;   {6.  현조직차수<>후조직차수 or 현차수 <> 후차수 }
    Payra_check;      {7.  직위체크}
    Ancode_check;     {8.  발령구분에 따른 체크}//실제 CHECK

    if (Qanno.Fieldbyname('ancode').Asstring = '511') or
       (Qanno.Fieldbyname('ancode').Asstring = '512') or
       (Qanno.Fieldbyname('ancode').Asstring = '514') or
       (Qanno.Fieldbyname('ancode').Asstring = '600') or
       (Qanno.Fieldbyname('ancode').Asstring = '641') then
    begin
       exdu_Check;     {9. 근속제외를 수정한다.//Work_Rtn2 에 속한다.}
    end;
    pstate_Check;     {10.인사상태}
    if Save_anno = True then {11..15 인사발령화일을 저장한다..}
    begin
      inc(AcNum);
      DispGuage;
    end
    else
    begin
      if  ErrText <> '' then
          ErrorWrite(Qanno.FieldByName('annono').AsString,
                     Qanno.FieldByName('anfrdate').AsString,
                     Qanno.FieldByName('antodate').AsString,
                     Qanno.FieldByName('ancode').AsString,
                     Qanno.FieldByName('empno').AsString,
                     Qanno.FieldByName('korname').AsString,
                     ErrText)
      else
          ErrorWrite(Qanno.FieldByName('annono').AsString,
                     Qanno.FieldByName('anfrdate').AsString,
                     Qanno.FieldByName('antodate').AsString,
                     Qanno.FieldByName('ancode').AsString,
                     Qanno.FieldByName('empno').AsString,
                     Qanno.FieldByName('korname').AsString,
                     ' ☞ 데이타중복 OR 수정오류');
      inc(ErNum);
      DispGuage;
    end;
    Qanno.Next;  //하나씩 저장한다.
  end; {while not Qanno.Eof do begin}

  ArrStr(ErrData.errLog,'');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10); System.Write(efile,ErrData);
  ArrStr(ErrData.errLog,'총읽은건수 : '+Readnum.Caption+
                        ' 처리건수  : '+AcessNum.Caption+
                        ' 에러건수  : '+ErrNum.Caption+
                        ' 발령정정/취소건수  : '+Cancelno.Caption
                        );
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10); System.Write(efile,ErrData);

  HelpDsr.Caption := '인사변수화일을 수정합니다..';
  SendMessage(Phelp.handle,WM_PAINT,0,0);
  {인사변수화일의 발령경신 최종발령일 : 입력발령일 To}
  {발령경신최종작업일}
  Qsave.Close;  Qsave.Sql.Clear;
  Qsave.Sql.add(Format('update pimvari set value1 = ''%s'',value2 = ''%s'' ',
                [antodate.Text,Curdate] ));
  Qsave.Sql.add('where (gubun =''30'' and sgubun = ''0002'') ');
  Qsave.EXECSQL;
  Qsave.Close;

//    32.00  2005.03.14 유효성   전(2005-4404)         인사발령화일 경신할 데이타가 작업완료후 사라지지 않도록 수정
//  Qanno.Close;
  MessageBox(pic1061gForm.handle,'기본인사사항과 근속제외사항을 반드시 확인하십시오 !!.',
             '안 내',MB_OK or $0030);
end;

// 데이타를 저장한다............................................................
function Tpic1061gForm.Save_anno : Boolean;
var
  ancode1   : string;
  annono1   : string;
  anfrdate1 : string;
  antodate1 : string;
  Tcardate,yy,mm,dd  : string;
  temp      : TDateTime;
//  StrDePassWord : String; //암호화되기전 Password
//  StrEnPassWord : String; //암호화된 Password


  s_Workyymm, s_Workyymmdd, s_yymmdd, temp_paycldate: String;
  s_birthdate: String;
  f_Temp : double;

  i_korage,  i_usaage : Integer;
  i_ErrFlag : Integer;
  i_comduyy, i_comdumm, i_comdudd, i_totcomdudd : Integer;
  i_payclyy, i_payclmm, i_paycldd, i_totpaycldd : Integer;
  i_hanaduyy,i_hanadumm,i_hanadudd : Integer;
begin
  Result  := True;
  ErrText := '';
  {인사발령화일의 발령구분,발령번호,발령일 from,to를 임시변수에 저장}
  ancode1   := Mas.lancode;
  annono1   := Mas.lannono;
  anfrdate1 := Mas.lanfrdate;
  antodate1 := Mas.lantodate;
  {최종발령사항에 인사발령화일의 발령후의 바령구분,번호,발령일을 저장}
  if Qanno.FieldByName('ancode').AsString <> '935' then
  begin
     Mas.lancode   := Qanno.FieldByName('ancode').AsString;
     Mas.lannono   := Qanno.FieldByName('annono').AsString;
     Mas.lanfrdate := Qanno.FieldByName('anfrdate').AsString;
     Mas.lantodate := Qanno.FieldByName('antodate').AsString;
  end;
  {현차수,현소속,현직위,현직급,현호봉 : 발령후 사항을 저장}
  Mas.empno     := Qanno.FieldByName('empno').AsString;
  Mas.korname   := Qanno.FieldByName('korname').AsString;
  Mas.payra     := Qanno.FieldByName('payra').AsString;

//  if copy(Qanno.FieldByName('ancode').AsString,1,2) = '41' then        //2001.09.10 shm
  if (((Qanno.FieldByName('ancode').AsString = '411')   or
       (Qanno.FieldByName('ancode').AsString = '412')   or
       (Qanno.FieldByName('ancode').AsString = '243'))  And              //직무대행시 2009.03.24 jissi
       (Qanno.FieldByName('adpayra').AsString <> '' ) ) then
     Mas.jobpayra  := Qanno.FieldByName('adpayra').AsString
  else
     Mas.jobpayra  := Qanno.FieldByName('payra').AsString;

  if Qanno.FieldByName('andetcode').AsString = '24' then     //2001.12.05 shm 추가
     Mas.jobpayra  := Qanno.FieldByName('payra').AsString;

  if Mas.jobpayra = '' then
     Mas.jobpayra  := Qanno.FieldByName('payra').AsString;

  if Mas.jobpayrayn = '' then
     Mas.jobpayrayn  := 'N';

  if (Qanno.FieldByName('ancode').AsString = '342') or
     (Qanno.FieldByName('ancode').AsString = '343') then
  begin
       with Qsave do
       begin
          close;
          sql.clear;
          sql.add(Format('select jobdept, payrayn, jobpayrayn  ' +
                         '  from pimpmas                  ' +
                         ' where empno      = ''%s''      ' ,[Mas.empno]));
          open;
          if recordcount > 0 then
          begin
             if trim(Qanno.FieldByName('addeptcode').AsString) = '' then
                Mas.jobdept    := FieldByName('jobdept').AsString;
             Mas.payrayn    := FieldByName('payrayn').AsString;
             Mas.jobpayrayn := FieldByName('jobpayrayn').AsString;
          end;
       end;
  end;

  Mas.paycl     := Qanno.FieldByName('paycl').AsString;
  Mas.deptcode  := Qanno.FieldByName('deptcode').AsString;
  Mas.orgnum    := Qanno.FieldByName('orgnum').AsString;

  if  ((Mas.jobpayrayn = 'Y') and (Qanno.FieldByName('ancode').AsString <> '829'))  then   //(보임자이며, 퇴임코드가 아닌경우)
      with Qsave do  //기존 보임자가 존재하는지 확인
      begin
          close;
          sql.clear;
          sql.add(Format('select jobdept, empno, korname  ' +
                         '  from pimpmas                  ' +
                         ' where jobdept    = ''%s''      ' +
                         '   and orgnum     = ''%s''      ' +
                         '   and pstate     < ''80''      ' +
                         '   and jobpayrayn = ''Y''       ' ,[Mas.jobdept,Mas.orgnum]));
          open;

          if  (Mas.empno <> fieldbyName('empno').AsString) and (RecordCount > 0) then
          begin
               Result  := False;
               ErrText := ' ☞ '+ FieldByName('jobdept').AsString + ' ' +
                          FieldByName('empno').AsString   + ' ' +
                          FieldByName('korname').AsString + '현근무부서보임자 입니다.' ;
               system.exit;
          end;
      end;

  TRY
  Database1.StartTransaction;
  {발령구분에 따라 자료를 생성 및 저장한다..}
  if (Qanno.FieldByName('ancode').AsString = '111') or
     (Qanno.FieldByName('ancode').AsString = '121') or
     (Qanno.FieldByName('ancode').AsString = '124') or
     (Qanno.FieldByName('ancode').AsString = '131') or
     (Qanno.FieldByName('ancode').AsString = '134') or
     (Qanno.FieldByName('ancode').AsString = '141') then
  begin
    with Qsave do  //기존사원이 존재하는지 검사.
    begin
      close;
      sql.clear;
      sql.add(Format('select empno from pimpmas where empno = ''%s'' ',[Mas.empno]));
      open;
      if recordcount > 0 then
      begin
         Result := False;
         Qsave.close;
         system.exit;
      end
      else Qsave.close;
    end;

    //31.08 저장전. 일반직경우 수습이아닌걸로 셋팅.
    //33.00 일반직(Y---)사원 경력일 default값(입사일-400) 넣는 부분 삭제(인사팀 임현수)
{    if copy(Mas.empno,1,1) = 'Y' then
    begin
      yy := copy(Mas.empdate,1,4);
      mm := copy(Mas.empdate,5,2);
      dd := copy(Mas.empdate,7,2);
      Temp := EncodeDate(strtoint(yy),strtoint(mm),strtoint(dd));
      Tcardate := FormatDateTime('yyyymmdd',Temp-400);
    end;}

    with Qsave do  //실제 저장.
    begin
       HelpDsr.Caption := '기본인사사항을 저장하고 있는 중입니다 !!.';
       SendMessage(Phelp.handle,WM_PAINT,0,0);
       close;
       Sql.Clear;
       Sql.add('insert into pimpmas ( empno       ,korname     ,jobpayra,jobpayrayn ,');
       sql.add('                      pstate      ,pstateyn    ,paycl               ,');
       sql.add('                      paygr       ,payra       ,orgnum              ,');
       sql.add('                      deptcode    ,fieldcode   ,paydunm             ,');
       sql.add('                      realtrdate  ,offtrdate   ,payrayn             ,');
       sql.add('                      cpayradate  ,jobplace    ,empdate             ,');
       sql.add('                      cpaycldate  ,paycldate   ,reppaycl            ,');
       sql.add('                      reppayfrdate,reppaytodate,apdpaydunm          ,');
       sql.add('                      actpayfrdate,actpaytodate,actpaydunm          ,');
       sql.add('                      apdpayfrdate,apdpaytodate,lragrdate           ,');
       sql.add('                      remark      ,empcode     ,emppaycl            ,');
       sql.add('                      emppaygr    ,jobgun      ,jobgundate          ,');
       sql.add('                      jobline     ,joblinedate ,nogubun,empjobline   ');

       // 31.08  일반직일 경우 DEFAULT로 수습이 아닌걸로 한다.(1년이전)
       if Copy(Mas.empno,1,1) = 'Y' then
           sql.add(',cardate');

       sql.add(' ) values ( ');
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',''%s'', ',
               [Mas.empno,Mas.korname,Mas.jobpayra,Mas.jobpayrayn] ));   //2009.6.1 Jobpyarayn 필드추가
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.pstate,Mas.pstateyn,Mas.paycl] ));
       sql.add(Format(' ''%3f'',''%s'' ,''%s'',',
               [StrToFloat(Mas.paygr),Mas.payra,Mas.orgnum] ));  //30.08 일반직 호봉 저장.
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.deptcode,Mas.fieldcode,Mas.paydunm] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.realtrdate,Mas.offtrdate,Mas.payrayn] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.cpayradate,Mas.jobplace,Mas.empdate] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.cpaycldate,Mas.paycldate,Mas.reppaycl] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.reppayfrdate,Mas.reppaytodate,Mas.apdpaydunm] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.actpayfrdate,Mas.actpaytodate,Mas.actpaydunm] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.apdpayfrdate,Mas.apdpaytodate,Mas.lragrdate] ));
       sql.add(Format(' ''%s'' ,''%s'' ,''%s'',',
               [Mas.remark,Mas.empcode,Mas.emppaycl] ));
       sql.add(Format(' ''%3f'',''%s'' ,''%s'',',
               [StrToFloat(Mas.paygr),Mas.jobgun,Mas.jobgundate] ));
// 31.08  일반직일 경우 DEFAULT로 수습이 아닌걸로 한다.(1년이전)
       if Copy(Mas.empno,1,1) = 'Y' then
       begin
         sql.add(Format(' ''%s'' ,''%s'' ,''%s'',''%s'',''%s'' )',
                 [Mas.jobline,Mas.joblinedate,Mas.nogubun,Mas.empjobline,Tcardate] ));
       end
       else
       begin
         sql.add(Format(' ''%s'' ,''%s'' ,''%s'',''%s'' )',
                 [Mas.jobline,Mas.joblinedate,Mas.nogubun,Mas.empjobline] ));
       end;

       EXECSQL;
    end;  //QSave END;

  end   //신규 종료.
  else
  begin  //신규아닐시에...
    HelpDsr.Caption := '기본인사사항을 수정하고 있는 중입니다 !!.';
    SendMessage(Phelp.handle,WM_PAINT,0,0);
    with Qsave do
    begin
         close;
         Sql.Clear;
         Sql.add('update pimpmas set ');
         sql.add(Format('pstate      =''%s'',pstateyn    =''%s'',paycl     =''%s'',',
                 [Mas.pstate,Mas.pstateyn,Mas.paycl] ));
         sql.add(Format('paygr       =''%3f'',payra       =''%s'',orgnum    =''%s'',',
                 [StrToFloat(Mas.paygr),Mas.payra,Mas.orgnum] ));
         sql.add(Format('jobpayra       =''%s'',',  //31.14  2001.08.20 shm 추가
                        [Mas.jobpayra] ));
         sql.add(Format('jobpayrayn     =''%s'',',  //31.14  2001.08.30 shm 추가
                        [Mas.jobpayrayn] ));
         sql.add(Format('deptcode    =''%s'',fieldcode   =''%s'',paydunm   =''%s'',',
                 [Mas.deptcode,Mas.fieldcode,Mas.paydunm] ));
         sql.add(Format('realtrdate  =''%s'',offtrdate   =''%s'',payrayn   =''%s'',',
                 [Mas.realtrdate,Mas.offtrdate,Mas.payrayn ] ));
         sql.add(Format('cpayradate  =''%s'',jobplace    =''%s'',empdate   =''%s'',',
                 [Mas.cpayradate,Mas.jobplace,Mas.empdate] ));
         sql.add(Format('cpaycldate  =''%s'',paycldate   =''%s'',reppaycl  =''%s'',',
                 [Mas.cpaycldate,Mas.paycldate,Mas.reppaycl] ));
         sql.add(Format('reppayfrdate=''%s'',reppaytodate=''%s'',apdpaydunm=''%s'',',
                 [Mas.reppayfrdate,Mas.reppaytodate,Mas.apdpaydunm] ));
         sql.add(Format('actpayfrdate=''%s'',actpaytodate=''%s'',actpaydunm=''%s'',',
                 [Mas.actpayfrdate,Mas.actpaytodate,Mas.actpaydunm] ));
         sql.add(Format('apdpayfrdate=''%s'',apdpaytodate=''%s'',lragrdate =''%s'',',
                 [Mas.apdpayfrdate,Mas.apdpaytodate,Mas.lragrdate] ));
         sql.add(Format('remark      =''%s'',empcode     =''%s'',emppaycl  =''%s'',',
                 [Mas.remark,Mas.empcode,Mas.emppaycl] ));
         sql.add(Format('emppaygr    =''%3f'',jobgun      =''%s'',jobgundate=''%s'',',
                 [StrToFloat(Mas.emppaygr),Mas.jobgun,Mas.jobgundate] ));
         sql.add(Format('jobline     =''%s'',joblinedate =''%s'',nogubun   =''%s'',',
                 [Mas.jobline,Mas.joblinedate,Mas.nogubun] ));
         sql.add(Format('empjobline     =''%s'' ',[Mas.empjobline] ));
         Sql.add(Format('where (empno = ''%s'')',[Mas.empno] ));
         EXECSQL;
       end;
  end; {if 조건}

// 추가,수정 공통 루틴(신규발령이든,다른발령이든.)..........................................................
  with Qsave do
  begin
       close;
       Sql.Clear;
       Sql.add('update pimpmas set ');
       sql.add(Format('lancode     =''%s'' ,lannono     =''%s'' ,lanfrdate =''%s'',',
               [Mas.lancode,Mas.lannono,Mas.lanfrdate] ));
       sql.add(Format('lantodate   =''%s'' ,exdutcnt    =''%3f'',exdutyy   =''%3f'',',
               [Mas.lantodate,StrToFloat(Mas.exdutcnt),StrToFloat(Mas.exdutyy)] ));
       sql.add(Format('exdutmm     =''%3f'',exdutdd     =''%3f'',lexfrdate =''%s'',',
               [StrToFloat(Mas.exdutmm),StrToFloat(Mas.exdutdd),Mas.lexfrdate] ));
       sql.add(Format('lextodate   =''%s'' ,lexduyy     =''%3f'',lexdumm   =''%3f'',',
               [Mas.lextodate,StrToFloat(Mas.lexduyy),StrToFloat(Mas.lexdumm)] ));
       sql.add(Format('lexdudd     =''%3f'',lrkind      =''%s'' ,lrfrdate  =''%s'',',
               [StrToFloat(Mas.lexdudd),Mas.lrkind,Mas.lrfrdate] ));
       sql.add(Format('lrtodate    =''%s'' ,lvfrdate    =''%s'' ,lvtodate  =''%s'',',
               [Mas.lrtodate,Mas.lvfrdate,Mas.lvtodate] ));
       sql.add(Format('lsekind     =''%s'' ,lsefrdate   =''%s'' ,lsetodate =''%s'',',
               [Mas.lsekind,Mas.lsefrdate,Mas.lsetodate] ));
       sql.add(Format('lseplace    =''%s'' ,lsesayu     =''%s'' ,lsecont   =''%s'',',
               [Mas.lseplace,Mas.lsesayu,Mas.lsecont] ));
       sql.add(Format('hugubun     =''%s'' ,hufrdate    =''%s'' ,hutodate  =''%s'' ',
               [Mas.hugubun,Mas.hufrdate,Mas.hutodate] ));
       Sql.add(Format('where (empno = ''%s'')',[Mas.empno] ));
       EXECSQL;

{-------------------------------------------------------------------------------
    버전    수정일    수정자   관련근거          수정내용
    1.02  1998.4.20   김혜진   전(98.4.11)  계약,재계약,부서변동,계약변경,계약해지
                                            발령에서 파견업체(tcompany) 추가.
 -------------------------------------------------------------------------------}
       close;
       Sql.Clear;
       Sql.add('update pimpmas set ');
       sql.add(Format('retdate     =''%s''  ,retgubun    =''%s''  ,retsayu1  =''%s'',',
               [Mas.retdate,Mas.retgubun,Mas.retsayu1] ));
       sql.add(Format('retsayu2    =''%s''  ,otdufrdate=''%s'',',  //retcont     =''%s''  ,
               [Mas.retsayu2,Mas.otdufrdate] ));                   //Mas.retcont,
       sql.add(Format('otdutodate  =''%s''  ,tcontr      =''%s''  ,tcontramt =''%12f'',',
               [Mas.otdutodate,Mas.tcontr,StrToFloat(Mas.tcontramt)] ));
       sql.add(Format('ttype       =''%s''  ,tjobduty    =''%s''  ,tcond     =''%s'',  tcompany = ''%s'',',
               [Mas.ttype,Mas.tjobduty,Mas.tcond,Mas.tcompany] ));
       sql.add(Format('edugubun    =''%s''  ,eduplace    =''%s''  ,educourse =''%s'',',
               [Mas.edugubun,Mas.eduplace,Mas.educourse] ));
       sql.add(Format('edufrdate   =''%s''  ,edutodate   =''%s''  ,eduarea   =''%s'',',
               [Mas.edufrdate,Mas.edutodate,Mas.eduarea] ));
       sql.add(Format('edudufrdate =''%s''  ,edudutodate   =''%s''  ,',
               [Mas.edudufrdate,Mas.edudutodate] ));
       sql.add(Format('educont     =''%s''  ,writetime   =''%s''  ,writeemp  =''%s'',',
               [Mas.educont,copy(timeDate(Query1),1,15),p_empno] ));
       sql.add(Format('fincode     =''%s''  ,boncode     =''%s''  ,jobdept   =''%s'',',
               [Mas.fincode,Mas.boncode,Mas.jobdept] ));
       sql.add(Format('orgempdate  =''%s''  ', [Mas.orgempdate] ));
       Sql.add(Format('where (empno = ''%s'')',[Mas.empno] ));
       EXECSQL;
  end;
  {인사발령화일을 수정한다..}

{ ---------------------------------------------------------------------------
    버전    수정일    수정자   관련근거                 수정내용
    31.12  2001.03.21 윤형식  전2001-02-13           전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
 ---------------------------------------------------------------------------}
  if (copy(Qanno.FieldByName('anfrdate').AsString,1,6) >= hisfryymm)
      and (copy(Qanno.FieldByName('anfrdate').AsString,1,6) <= histoyymm) then
  begin
      //이력월, 이력월말일
      s_Workyymm   := copy(Qanno.FieldByName('anfrdate').AsString,1,6);
      s_Workyymmdd := to_char(last_day(to_date(s_workyymm,'YYYYMM')),'YYYYMMDD');

      // 기존자료 삭제 후 재입력
      with Qsave do
      begin
          close;
          Sql.Clear;
          Sql.Text := Format('Delete From pihpmas where workyymm >= ''%s'' and empno = ''%s'' ',
                             [s_Workyymm, Qanno.FieldByName('empno').AsString]);
          Execsql;

          while s_Workyymm <= histoyymm do
          begin
              i_ErrFlag := 0;

              close;
              Sql.Clear;
              Sql.Text := Format('Insert Into pihpmas                                             '+
                                 'Select ''%s'' workyymm, A.* From pimpmas A Where empno = ''%s'' ',
                                 [s_Workyymm, Qanno.FieldByName('empno').AsString]);
              Execsql;

              // 연령계산
              if (copy(Mas.juminid,8,1) = '1') or (copy(Mas.juminid,8,1) = '2') then
                  s_birthdate := '19' + copy(Mas.juminid,1,6)
              else if (copy(Mas.juminid,8,1) = '3') or (copy(Mas.juminid,8,1) = '4') then
                  s_birthdate := '20' + copy(Mas.juminid,1,6)
              else
                  s_birthdate := '00000000';

            TRY
              f_Temp := to_date(s_birthdate,'YYYYMMDD');

              i_korage := strtoint(copy(s_workyymm,1,4)) - strtoint(copy(s_birthdate,1,4));

              s_yymmdd := datecal(s_birthdate, s_Workyymmdd);
              i_usaage := strtoint(copy(s_yymmdd,1,2));
            EXCEPT
              i_korage := 0;
              i_usaage := 0;
              Inc(i_ErrFlag);
            END;

              // 근속일계산
              if (Mas.retdate <> '') then
              begin
                  s_yymmdd := datecal(Mas.empdate, Mas.retdate);
                  i_totcomdudd := StrToInt(DateDay(Mas.empdate, Mas.retdate));
              end
              else
              begin
                  s_yymmdd := datecal(Mas.empdate, s_workyymmdd);
                  i_totcomdudd := StrToInt(DateDay(Mas.empdate, s_workyymmdd));
              end;

              if (s_yymmdd = '000000') then Inc(i_ErrFlag);

              i_comduyy := strtoint(copy(s_yymmdd,1,2));
              i_comdumm := strtoint(copy(s_yymmdd,3,2));
              i_comdudd := strtoint(copy(s_yymmdd,5,2));

              // 재급일
              if  (trim(Mas.cardate) <> '') and  (Mas.empdate = Mas.paycldate) then // (경력이 있는경우) AND (입사일 == 직급일)
                 temp_paycldate := Mas.cardate
              else
                 temp_paycldate := Mas.paycldate;

              if Mas.retdate <> '' then   // 재직자는 todate, 퇴사자는 퇴사일
              begin
                  s_yymmdd := datecal(temp_paycldate, Mas.retdate);
                  i_totpaycldd := StrToInt(DateDay(temp_paycldate, Mas.retdate));
              end
              else
              begin
                  s_yymmdd := datecal(temp_paycldate, s_Workyymmdd);
                  i_totpaycldd := StrToInt(DateDay(temp_paycldate, s_Workyymmdd));
              end;

              if (s_yymmdd = '000000') then Inc(i_ErrFlag);

              i_payclyy := strtoint(copy(s_yymmdd,1,2));
              i_payclmm := strtoint(copy(s_yymmdd,3,2));
              i_paycldd := strtoint(copy(s_yymmdd,5,2));

              // 하나로 근속일계산
              if (Mas.retdate <> '') then
              begin
                  s_yymmdd := datecal(Mas.orgempdate, Mas.retdate);
              end
              else
              begin
                  s_yymmdd := datecal(Mas.orgempdate, s_workyymmdd);
              end;

              if (s_yymmdd = '000000') then Inc(i_ErrFlag);

              i_comduyy := strtoint(copy(s_yymmdd,1,2));
              i_comdumm := strtoint(copy(s_yymmdd,3,2));
              i_comdudd := strtoint(copy(s_yymmdd,5,2));

              if i_ErrFlag = 0 then // 에러없을 때만저장
              begin
                  close;
                  Sql.Clear;
                  Sql.Text := Format('Update pihpmas Set                           '+
                                     '  korage    = ' + inttostr(i_korage    ) +' ,'+
                                     '  usaage    = ' + inttostr(i_usaage    ) +' ,'+
                                     '  comduyy   = ' + inttostr(i_comduyy   ) +' ,'+
                                     '  comdumm   = ' + inttostr(i_comdumm   ) +' ,'+
                                     '  comdudd   = ' + inttostr(i_comdudd   ) +' ,'+
                                     '  totcomdudd= ' + inttostr(i_totcomdudd) +' ,'+
                                     '  payclyy   = ' + inttostr(i_payclyy   ) +' ,'+
                                     '  payclmm   = ' + inttostr(i_payclmm   ) +' ,'+
                                     '  paycldd   = ' + inttostr(i_paycldd   ) +' ,'+
                                     '  totpaycldd= ' + inttostr(i_totpaycldd) +' ,'+
                                     '  hanaduyy  = ' + inttostr(i_hanaduyy  ) +' ,'+
                                     '  hanadumm  = ' + inttostr(i_hanadumm  ) +' ,'+
                                     '  hanadudd  = ' + inttostr(i_hanadudd  ) +'  '+
                                     'where workyymm = ''%s'' and empno = ''%s''   ',
                                     [s_Workyymm, Qanno.FieldByName('empno').AsString]);
                  Execsql;
              end;

              s_Workyymm := kpaylib.to_char( kpaylib.add_months(
                              kpaylib.to_date(s_Workyymm,'YYYYMM'), 1), 'YYYYMM');
          end;
      end;
  end;

  {발령전 발령번호,발령일 from,to,발령구분,경신여부:Y,경신일시 : 시스템일시}
  with Qsave do
  begin
       HelpDsr.Caption := '인사발령화일을 수정하고 있는 중입니다.';
       SendMessage(Phelp.handle,WM_PAINT,0,0);
       Close; Sql.Clear;
       Sql.add('update pihanno set ');
       sql.add(Format('bannono     =''%s'',banfrdate   =''%s'',bantodate =''%s'',',
               [annono1,anfrdate1,antodate1]));
       sql.add(Format('bancode     =''%s'',anupdyn     =''Y'' ,anupdtime =''%s'', writeemp =''%s'' ',
               [ancode1,copy(timedate(Query1),1,15), p_empno]));
       sql.add(Format('where ((empno    = ''%s'') and (annono = ''%s'') and',
               [Qanno.FieldByName('empno').AsString,Qanno.FieldByName('annono').AsString]));
       sql.add(Format('       (anfrdate = ''%s'') and (ancode = ''%s''))',
               [Qanno.FieldByName('anfrdate').AsString,Qanno.FieldByName('ancode').AsString]));
       EXECSQL;
  end;

  with Qsave do
  begin
       HelpDsr.Caption := '사용자 화일을 수정하고 있는 중입니다.';
       SendMessage(Phelp.handle,WM_PAINT,0,0);
       Close;
       Sql.Clear;
       SQL.Add('select empno,korname,substr(juminid,8,7) jumin from pimpmas      '+
               ' where not exists(select * from pymenuuser where empno = :pEmpno)'+
               '   and empno = :pEmpno                                           ');
  //   Sql.Add('select  from pymenuuser where empno = :empno ');
       ParamByName('pEmpno').AsString := Qanno.FieldByName('empno').AsString;
       Open;

       if FieldByName('empno').AsString <> '' then // 신규채용이면
       begin
            //StrDePassWord := fieldByName('empno').AsString;      //2013.11.종합인사 암호화작업으로 삭제.
            //EnCode(StrDePassWord, StrEnPassWord, chr(vk_return));//uses CsReg
            Newperson := Newperson + FieldByName('empno').AsString + '   ' + FieldByName('korname').AsString +#13;
            memo1.Lines.Add(FieldByName('empno').AsString + '   ' + FieldByName('korname').AsString);

            Close;
            Sql.Clear;
            Sql.add('Insert into pymenuuser                                   '+
                    '              ( groupid,  empno,     korname,            '+
                    '                password, grade,     passtodate,         '+
                    '                lockyn,   writetime, writeman   )        '+
                    '     select :lgroupid,                                   '+
                    '            empno,                                       '+
                    '            korname,                                     '+
     //             '            '''+StrEnPassWord+''',                       '+ //2013.11. 종합인사 암호화작업으로 변경
                    '            empno,                                       '+ //2013.11. 사번을 암호로 저장. 신규시 첫 패스워드는 사번
                    '            ''EEEEEEEEEE'',                              '+
                    '            to_char(Add_months(sysdate,3),''YYYYMMDD''), '+
                    '            ''N'',                                       '+
                    '            to_char(sysdate,''YYYYMMDDHH24MISSD''),      '+
                    '            '''+P_empno+'''                              '+
                    '       from pimpmas                                      '+
                    '      where empno = :lempno                              ');
            ParamByName('lempno').AsString := Qanno.FieldByName('empno').AsString;

     //     신규시 첫 패스워드는 사번(M사번은 임원그룹G003)              작업자: jissi
            if copy(Qanno.FieldByName('empno').AsString,1,1) = 'M' then
                 ParamByName('lgroupid').AsString := 'G003'
            else ParamByName('lgroupid').AsString := 'G099';
            Execsql;


            //2017.07.31.hjku.. 신규 발령시 열린HR 일반사용자 권한 등록 요청.. EHR 변재식 차장 요청
            Close;
            Sql.Clear;
            Sql.add('INSERT INTO hper.EHR_LETTNEMPLYRSCRTYESTBS (                    '+
                    '            SCRTY_DTRMN_TRGET_ID, MBER_TY_CODE, AUTHOR_CODE     '+
                    ')VALUES( :LEMPNO, ''USR'', :LAUTHOR_CODE)                       ');
            ParamByName('lempno').AsString := Qanno.FieldByName('empno').AsString;

            if copy(Qanno.FieldByName('empno').AsString,1,1) = 'M' then
                 ParamByName('LAUTHOR_CODE').AsString := 'ROLE_BM'
            else ParamByName('LAUTHOR_CODE').AsString := 'ROLE_USER';
            Execsql;


            //dsa2000  2018.10.02  Add  신규입사자 발생시 MyHR 자율책임근무제 대상자관리에 데이터 생성.(이주영과장 요청)
            if Copy(Qanno.FieldByName('empno').AsString,1,1) <> 'M' then
            begin
                 Sql.Clear;
                 Sql.Add(' INSERT INTO EHR_CHOICEWORK_TARGET                  '+
                         '        (EMPNO,TARGETYN,CORETIMEYN,OTLIMIT,OTREQPER)'+
                         ' VALUES (:Lempno, ''Y'', ''Y'', 20, 10)             ');
                 ParamByName('Lempno').AsString := Qanno.FieldByName('empno').AsString;
                 Execsql;
            end;
       end;
  end;

  //퇴사시 메뉴 사용 못하게     작업자:jissi
  if (mas.empno <> '') and (mas.pstate >= '80') then
  begin
     with Qsave do
     begin
       Close;
       Sql.Clear;
       Sql.add(' update pymenuuser                                           '+
               '    set lockyn    = ''Y'',                                   '+
               '        bigo      = ''퇴사'',                                '+
               '        writetime = to_char(sysdate,''YYYYMMDDHH24MISSD''),  '+
               '        writeman  = '''+P_empno+'''                          '+
               '  where empno     = :lempno                                  ');
       ParamByName('lempno').AsString := Qanno.FieldByName('empno').AsString;
       Execsql;
       close;
     end;
  end;

  //2015.01.23.hjku..수습에서 수습해제 발령경신시 그룹ID를 G097에서 일반사용자 그룹인 G099로 변경 요청.. 강륜종 팀장 요청
  if (copy(Qanno.FieldByName('empno').AsString,1,1) <> 'M') and
     (Qanno.FieldByName('ancode').AsString = '288')
  then
  begin
     with Qsave do
     begin
       Close;
       Sql.Clear;
       Sql.add(' update pymenuuser                                           '+
               '    set groupid   = ''G099'',                                '+
               '        writetime = to_char(sysdate,''YYYYMMDDHH24MISSD''),  '+
               '        writeman  = '''+P_empno+'''                          '+
               '  where empno     = :lempno                                  '+
               '    and groupid   = ''G097''                                 ');
       ParamByName('lempno').AsString := Qanno.FieldByName('empno').AsString;
       Execsql;
       close;
     end;
  end;

  //31.04  업적평가마스터화일의 자료를 경신한다.  KHJ
  if Eanupdyn  = 'Y' then    //업적기준화일에서 발령적용여부가 ='Y' 면(부서이동,직급,직위 변동시)
  begin                      //(부서이동,직급,직위 변동시)
    with Qsave do
    begin
      HelpDsr.Caption := '업적평가마스터화일을 수정하고 있는 중입니다.';
      SendMessage(Phelp.handle,WM_PAINT,0,0);
      //기존에 없던 사원이고 평가대상자가 아니면 아무것도 하지 않음.
      if (Res.empno = '') and (res.reconyn = 'N') and (Res.prjexcode <> '1')then
      begin
       //부서,직위,직급이 변경된 발령이면 평가자사항을 변경해야 하므로.
        if (Mas.orgnum <> Res.orgnum) or (Mas.deptcode <> Res.deptcode) or
           (Mas.payra  <> Res.payra) or (Mas.paycl <> Res.paycl) then
        begin
          close;
          sql.clear;
          sql.add(Format('update pehremas set e1existyn = ''N'',e2existyn = ''N'' '+
                         'where rabasdate = ''%s'' and reconyn = ''Y'' and        '+
                         '      (e1empno = ''%s'' or e2empno = ''%s'')            ',
                      [Erabasdate,Qanno.FieldBYname('empno').Asstring,
                       Qanno.FieldBYname('empno').Asstring]));
          EXECSQL;
          Close;
        end;
      Database1.Commit;
      System.exit;
      end;
//jissi
      if ((anfrdate.Text < payrachdate) and
          ((Copy(Res.payra,1,1) <= '5') OR  //보임자(?)--(5)직대..
           (Copy(Res.paycl,1,1)  = '0') or   //임원
           (Copy(Res.paycl,1,1)  > '9'))) or //계약직
         ((anfrdate.Text >= payrachdate) and
          ((Copy(Res.payra,1,2) <= 'C1') OR  //보임자(?)--(5)직대..
           (Copy(Res.paycl,1,1)  = 'A') or   //임원
           (Copy(Res.paycl,1,2)  > 'D4'))) then //계약직
      begin
        close;
        sql.clear;
        if (Res.Jobgun >= '10') and (Res.jobgun <= '30') then
        begin
          Sql.Add(Format('delete from pehreaim_A  '+   //평가테이블
                         'where rabasdate = ''%s'' and empno = ''%s'' ',
                      [Erabasdate,Qanno.FieldBYname('empno').Asstring]));
          EXECSQL;
        end
        else if (Res.Jobgun = '40') then
        begin
          Sql.Add(Format('delete from pehreaim_B  '+
                         'where rabasdate = ''%s'' and empno = ''%s'' ',
                      [Erabasdate,Qanno.FieldBYname('empno').Asstring]));
          EXECSQL;
        end;
        close;
        sql.clear;
        sql.add(Format('delete from pehremas                         '+
                       ' where rabasdate = ''%s'' and empno = ''%s'' ',
                     [Erabasdate,Qanno.FieldBYname('empno').Asstring]));
        EXECSQL;
        close;
        sql.clear;
        sql.add(Format('update pehremas set e1existyn = ''N'',e2existyn = ''N'' '+
                       'where rabasdate = ''%s'' and reconyn = ''Y'' and        '+
                       '      (e1empno = ''%s'' or e2empno = ''%s'')            ',
                       [Erabasdate,Qanno.FieldBYname('empno').Asstring,
                        Qanno.FieldBYname('empno').Asstring]));
        EXECSQL;

        Database1.Commit;
        System.exit;
      end;

      //신규채용일 경우, 또는 보임자가 보임해제되어 업적평가 대상인 경우  insert.
      if (Res.empno = '') and
         (((res.reconyn = 'N') and (Res.prjexcode = '1')) or
          (res.reconyn = 'Y')) then
      begin
        Close;
        Sql.Clear;
        sql.add(Format('insert into pehremas                                               '+
                       '(rabasdate,empno,korname,jobgun,orgnum,deptcode,pstate,paycl,payra,'+
                       ' empdate,trdate,reconyn,                                           '+
                       ' e1existyn,e2existyn,prjexcode,prjexfrdate,prjextodate )           '+
                       'values (                                                           '+
                       ' ''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',   '+
                       ' ''%s'',''%s'',''%s'',                                             '+
                       ' ''%s'',''%s'',''%s'',''%s'',''%s'' )                              ',
                [Erabasdate,Qanno.FieldBYname('empno').Asstring,Qanno.FieldByName('korname').Asstring,Res.jobgun,Res.orgnum,Res.deptcode,Res.pstate,Res.paycl,Res.payra,
                 Qanno.FieldByname('anfrdate').Asstring,Res.trdate,Res.reconyn,
                 Res.e1existyn,Res.e2existyn,Res.prjexcode,Res.prjexfrdate,Res.prjextodate]));
        EXECSQL;
        close;
        sql.clear;
        sql.add(Format('update pehremas set e1existyn = ''N'',e2existyn = ''N'' '+
                       ' where rabasdate = ''%s'' and reconyn = ''Y'' and       '+
                       '       (e1empno = ''%s'' or e2empno = ''%s'')           ',
                        [Erabasdate,Qanno.FieldBYname('empno').Asstring,
                        Qanno.FieldBYname('empno').Asstring]));
        EXECSQL;
      end;
      //기존에 있던 사원이면 업적평가 대상화일에  update.
      if (res.empno <> '') then
      begin
        close;
        sql.clear;
        sql.add(Format('update pehremas                                             '+
                       ' set                                                        '+
                       '   jobgun = ''%s'',orgnum = ''%s'',deptcode = ''%s'',       '+
                       '   pstate = ''%s'',paycl = ''%s'',payra=''%s'',             '+
                       '   empdate = ''%s'',trdate = ''%s'',reconyn = ''%s'',       '+
                       '   e1existyn = ''%s'',e2existyn = ''%s'',prjexcode = ''%s'','+
                       '   prjexfrdate = ''%s'',prjextodate = ''%s''                '+
                       ' where rabasdate = ''%s'' and empno = ''%s''                ',
                      [Res.jobgun,Res.orgnum,Res.deptcode,
                       Res.pstate,Res.paycl,Res.payra,
                       Qanno.FieldByname('anfrdate').Asstring,Res.trdate,Res.reconyn,
                       Res.e1existyn,Res.e2existyn,Res.prjexcode,
                       Res.prjexfrdate,Res.prjextodate,
                       Erabasdate,Qanno.FieldBYname('empno').Asstring]));
        EXECSQL;
      end;
    end;
  end;
  Database1.Commit;
  EXCEPT ON E : EDataBaseError DO
  begin
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     Result := False;
     Database1.Rollback;
     System.exit;
  end;
  END; //Try

end;

// 파견교육현원포함여부,정직자현원포함여부,휴직자포함여부,발령경신최종발령일을 읽어온다..
procedure Tpic1061gForm.QVariDisp;
begin
 Qsave.Close;
 with Qsave do
 begin
  Sql.Clear;
  Sql.Add('select value1,value2 from pimvari where gubun = ''30'' and sgubun = ''0002'' ');
  Open;
  lastdate1 := fieldByName('value1').AsString;
  lastdate2 := fieldByName('value2').AsString;

  lastDate.Caption := '  '+copy(fieldByName('value1').AsString,1,4)+'년 '+
                           copy(fieldByName('value1').AsString,5,2)+'월 '+
                           copy(fieldByName('value1').AsString,7,2)+'일 ';

{ ---------------------------------------------------------------------------
    버전    수정일    수정자   관련근거                 수정내용
    31.12  2001.03.21 윤형식  전2001-02-13           전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
 ---------------------------------------------------------------------------}
  // 인사이력보관월 기간
  Close;  Sql.Clear;
  Sql.Add('select value1, value2 from pimvari where gubun = ''50'' and sgubun = ''0004'' ');
  Open;
  hisfryymm := FieldByName('value1').Asstring;
  histoyymm := FieldByName('value2').Asstring;

  {파견교육포함여부,정직자포함여부,휴직자포함여부를 읽어온다..}
  Close; Sql.Clear;
  Sql.Add('select value2,value3,value4 from pimvari where gubun = ''50'' and sgubun = ''0003'' ');
  Open;
  edupstateyn := FieldByName('value2').AsString;
  jupstateyn  := FieldByName('value3').AsString;
  hupstateyn  := FieldByName('value4').AsString;

//31.04  대외파견자의 부서를 파견/교육 별도부서로 지정하기 위해.
   Close;  Sql.Clear;
   Sql.Add('select value1 from pimvari                  '+
           'where  gubun = ''50'' and sgubun = ''1001'' ');
   Open;
   Edeptcode := FieldByname('value1').Asstring;

   //업적평가 기준일, 인사발령경신여부
   Close;  Sql.Clear;
   Sql.Add('select sgubun,value1 from pehrebas          '+
           ' where rabasdate = ''00000000''             '+
           '   and gubun = ''00'' and sgubun = ''0001'' ');
   Open;
   Erabasdate := FieldBYName('value1').Asstring;

   Close;  Sql.Clear;
   Sql.Add('select sgubun,nvl(value1,''N'') value1 from pehrebas '+
           ' where rabasdate = ''00000000''                      '+
           '   and gubun = ''00'' and sgubun = ''0002''          ');
   Open;
   Eanupdyn := FieldByname('value1').Asstring;

   //대외파견자의 평가자를 임시로 인사팀담당자로 함.
   Close;  Sql.Clear;
   Sql.Add('select value3 from pehrebas                 '+
           ' where rabasdate = '''+Erabasdate+'''       '+
           '   and gubun = ''11'' and sgubun = ''0005'' ');
   Open;
   Eempno := FieldByname('value3').Asstring;

   Close;  Sql.Clear;
   Sql.Add('select nvl(value1,''ZZ'') value1,nvl(value2,''ZZ'') value2,'+
           '       nvl(value3,''ZZ'') value3,nvl(value4,''ZZ'') value4,'+
           '       nvl(value5,''ZZ'') value5                           '+
           'from pehrebas where rabasdate = '''+Erabasdate+'''         '+
           ' and gubun = ''11'' and sgubun = ''0004''                  ');
   Open;
   exjob1 := FieldByName('value1').Asstring;
   exjob2 := FieldByName('value2').Asstring;
   exjob3 := FieldByName('value3').Asstring;
   exjob4 := FieldByName('value4').Asstring;
   exjob5 := FieldByName('value5').Asstring;

   Close;
 end;

end;

// 폼이 활성화 될때.............................................................
procedure Tpic1061gForm.FormCreate(Sender: TObject);
var
  i : integer;
begin
   if Database1.Connected then Database1.Connected := False;
   for i := 0 to Database1.Params.Count-1 do
   begin
     if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
       Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);

     if System.Pos('USER NAME', Database1.Params[i]) > 0 then
       Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
     if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
       Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
   end;

   Application.ProcessMessages;
   Try
      Database1.Connected := True;
   EXCEPT ON E : EDataBaseError DO begin
      MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
      halt(0); end;
   END;
   
   IsBatchLoaded     := False;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;
     
  HomeDir   := HomeDirOpen;
  P_empno   := PassEmp(cmdline,1);
  P_korname := PassEmp(cmdline,2);
  password  := PassEmp(cmdline,3);
  pclass    := PassEmp(cmdline,4);
end;

// 종료버턴을 누를경우..........................................................
procedure Tpic1061gForm.BExitClick(Sender: TObject);
begin
   if Not IsBatchLoaded then Close
   else helpDsr.Caption := '현원,통계생성 중 작업을 종료할 수 없습니다!!';

end;

procedure Tpic1061gForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  codeToText(HomeDir+'\pic1060g.cod','',3);
end;

// 일자를 더블클릭 할경우.......................................................
procedure Tpic1061gForm.anfrdateDblClick(Sender: TObject);
begin
 Calendar := TCalendar.Create(Self);
 Try
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then
      TMaskEdit(Sender).Text := Calendar.DayCaption;
 Finally
   Calendar.Free;
 End;
end;

//............작업을 시작한다. (실행)...........................................
// 실행버턴을 누를경우
procedure Tpic1061gForm.BSaveClick(Sender: TObject);
begin
  if IsBatchLoaded then  //배치 작업중 클릭 못하게
  begin
    helpDsr.Caption := '현원,통계생성 중 다른 작업을 할 수 없습니다!!';
    System.Exit;
  end;
   if DateMaxMin(anfrdate.Text,antodate.Text) = False then
  begin
     MessageBox(handle,'발령일 필드에러입니다 !!.','확 인',MB_OK or $0020);
     system.exit;
  end;
  DbGrid1.Visible := True;
  System.AssignFile(efile,HomeDir+'\list\pic1060g.err');
  System.ReWrite(efile);
  ArrStr(ErrData.errLog,'               ***** 인사발령반영현황 결과 리스트 *********');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10); System.Write(efile,ErrData);
  ArrStr(ErrData.errLog,'');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10); System.Write(efile,ErrData);
  ArrStr(ErrData.errLog,'');
  ErrData.lfcr[1] := chr(13);  ErrData.lfcr[2] := chr(10); System.Write(efile,ErrData);
  memo1.Text      := '';
  memo1.Lines.Add('아래 사원들의 주민번호를 "기본인사등록"에서 반드시 입력하시기 바랍니다.(즉시)');
  memo1.Lines.Add('');
  memo1.Visible   := false;
  newperson       := '';     // jissi
  if Work_Rtn1 = '데이타NO' then    //근거에 해당하는 발령일을 발령테이블에서 찾는다.
  begin
     MessageBox(handle,'해당되는 자료가 없습니다 !!.','확 인',MB_OK or $0020);
     Qanno.Close;
  end
  else Work_Rtn2;  // 실제 실행..

  system.Close(efile);
  helpDsr.Caption := '작업완료 !!. (작업결과화일명 : '+HomeDir+'\list\pic1060g.err)';
  Ga1.Progress := 0;

//    32.00  2005.03.14 유효성   전(2005-4404)         인사발령화일 경신할 데이타가 작업완료후 사라지지 않도록 수정
//  DbGrid1.Visible := False;

  Panel2.Caption  := '작업이 완료되었습니다 !!';
  anfrdate.SetFocus;
//////////////////////////////////////////////////////////////////////////////////////////////
//  발령경신시 전월 발령사항이 있으면 사용자에게 알림                    정규용 추가
//////////////////////////////////////////////////////////////////////////////////////////////
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select count(*) cnt from pihanno A,pyccode B      '+
            ' where A.anfrdate = :ANFRDATE                     '+
            '  and to_char(Add_Months(sysdate,-1),''YYYYMM'')  '+
            '                = SUBSTR(A.anfrdate,1,6)          '+
            '  and B.codeid =''I300''                          '+
            '  and A.ancode = B.codeno                         ');
    ParamByName('ANFRDATE').AsString := anfrdate.Text;
    Open;


    if (FieldByName('cnt').AsString > '0') and (AcessNum.Caption > '0') then //처리건수
      MessageDlg('알림!!  전월 발령건이 ' + FieldByName('cnt').AsString + '건 있습니다. '+#13+#10+
               ''+#13+#10+'반드시 전월 현원/통계 재생성을 하셔야 합니다!!', mtWarning, [mbOK], 0);
  end;
///////////////////////////////////////////////////////////////////////////////////////////////////
//  신규채용시 주민번호 입력하라고 알림  jissi
///////////////////////////////////////////////////////////////////////////////////////////////////
  if newperson <> '' then
  begin
      memo1.Top      := 152;
      memo1.height   := 220;
      memo1.Visible  := true;
      memo1.readonly := true;
  end;
end;

// 디비그리드 다시그리기........................................................
procedure Tpic1061gForm.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlack;
     Pen.Color   := clRed;
     Brush.color := $00FFD2D2;
     FillRect(Rect);
     case Field.Index of
       0 : TextOut(Rect.Left+2,Rect.Top+1,' ☞'+copy(Field.AsString,1,4)+'-'+
                                                copy(Field.AsString,5,4));
       1 : TextOut(Rect.Left+2,Rect.Top+1,' '+Field.AsString+'('+
                                              QannoEmpno.AsString+')');
       2 : TextOut(Rect.Left+2,Rect.Top+1,' '+copy(Field.AsString,1,4)+'/'+
                                              copy(Field.AsString,5,2)+'/'+
                                              copy(Field.AsString,7,2));
       3 : TextOut(Rect.Left+2,Rect.Top+1,' '+copy(Field.AsString,1,4)+'/'+
                                              copy(Field.AsString,5,2)+'/'+
                                              copy(Field.AsString,7,2));
       4 : TextOut(Rect.Left+2,Rect.Top+1,
                   ' '+Field.AsString+'->'+Qanno.FieldByName('Nancode').AsString);
     end;
   end else
   with (Sender as TDBGrid).Canvas do
   begin
     Font.Color  := clBlack;
     Brush.color := clwhite;
     FillRect(Rect);
     Pen.color := clblack;
     case Field.Index of
//       0 : TextOut(Rect.Left+2,Rect.Top+1,'   '+copy(Field.AsString,1,2)+'-'+
//                                                copy(Field.AsString,3,4));
       0 : TextOut(Rect.Left+2,Rect.Top+1,'   '+copy(Field.AsString,1,4)+'-'+
                                                copy(Field.AsString,5,4));
       1 : TextOut(Rect.Left+2,Rect.Top+1,' '+Field.AsString+'('+
                                              QannoEmpno.AsString+')');
       2 : TextOut(Rect.Left+2,Rect.Top+1,' '+copy(Field.AsString,1,4)+'/'+
                                              copy(Field.AsString,5,2)+'/'+
                                              copy(Field.AsString,7,2));
       3 : TextOut(Rect.Left+2,Rect.Top+1,' '+copy(Field.AsString,1,4)+'/'+
                                              copy(Field.AsString,5,2)+'/'+
                                              copy(Field.AsString,7,2));
       4 : TextOut(Rect.Left+2,Rect.Top+1,
                   ' '+Field.AsString+'->'+Qanno.FieldByName('Nancode').AsString);
     end;
   end;
end;

// 개인인사사항을 클릭했을경우..................................................
procedure Tpic1061gForm.insaBtnClick(Sender: TObject);
var
  ObjName : String;
begin
  if TBitBtn(Sender).Name = 'insaBtn' then  ObjName     := UpperCase('pia1010a.exe')
  else ObjName     := UpperCase('pic2010a.exe');

  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

  if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(GetHomeDir+'\Bin\2tier\'+ObjName)) then
  begin
    FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
    FM_DownLoad.PL_ProgramCall(GetHomeDir+'\Bin\2Tier\'+ObjName);
    if FM_DownLoad.FL_Ret < 32 then
      MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;

end;

// 키부분 키제어................................................................
procedure Tpic1061gForm.Keycontrol(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
HelpDsr.Caption := '';
if not(ssShift  in Shift) then begin
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    case TMaskEdit(Sender).Tag of
      1 : begin
          if EnterKey <> 0 then antodate.Setfocus;
          EnterKey := 1;
          antodate.Text := anfrdate.Text;
          end;
      2 : anfrdate.SetFocus;
    end; {case end}
  end; {inner if end}
end else begin {if end}
  if (Key = vk_Tab) or (Key = vk_Return) then  begin
    case TMaskEdit(Sender).Tag of
      1 : antodate.SetFocus;
      2 : anfrdate.SetFocus;
    end; {case end}
  end; {inner if end}
end; {else end}

end;

procedure Tpic1061gForm.KeyPress(Sender: TObject; var Key: Char);
begin
  Helpdsr.Caption := '';
  if Key = Chr(13) then
     Key := Chr(0);   {소리제겅용}
end;

procedure Tpic1061gForm.QannoCalcFields(DataSet: TDataSet);
begin
  Qanno.FieldByName('Nancode').AsString :=
  QcodeDisp('I300',Qanno.FieldByName('ancode').AsString);
end;

procedure Tpic1061gForm.BitBtn1Click(Sender: TObject);
var
  m_workym : String;
  m_Pempno, m_Cregubun, m_Orgnum, m_Manunit : String;
  m_Ipoyn, m_Epoyn, m_Jpoyn, m_Hpoyn : String;
  m_Tolastdate, m_Polastdate : String;
  m_returnOK: Integer;

begin
   // 전월 통계자료 재 생성...
  Try
    subform := Tsubform.Create(Owner);
    subform.s_hisfryymm := hisfryymm;
    subform.s_histoyymm := histoyymm;
    subform.ShowModal;

    // return:
    m_returnOK := subform.returnOK; // Ok이면 1; cancel이면 0;
    m_workym   := subform.returnYM; // Ok이면 해당월(YYYYMM); cancel이면 '';
  FINALLY
    subform.Free;
  ENd;

  if m_returnOK = 0 then
    System.Exit;

  if Not IsBatchLoaded then
  begin
    IsBatchLoaded := True;
  end
  else begin
    helpDsr.Caption := '이미 현원,통계 생성중입니다!! 기다려주세요';
    System.Exit;
  end;
  helpDsr.Caption := '작업중입니다.';
  Application.Processmessages;

  // 기준자료 추출중...
  with Qtext do
  begin
    // 조직차수
    Close;
    SQL.Clear;
    SQL.ADD('SELECT distinct orgnum  FROM pihtopo ');
    SQL.ADD('WHERE topoym = '''+ m_workym +''' ');
    Open;
    m_Orgnum := FieldByName('orgnum').AsString;

    // 인원관리단위, 최종작업년월
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT VALUE1, VALUE2,                                                             ');
    SQL.ADD('        TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(VALUE2,1,6), ''YYYYMM''), 1), ''YYYYMM'') ');
    SQL.ADD(' FROM PIMVARI   WHERE GUBUN = ''50'' AND SGUBUN = ''0001''                          ');
    Open;
    m_Manunit := FieldByName('value1').AsString;
    // Topoym  := FieldByName('value2').AsString;

    // 직위체계변경일
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT VALUE3, VALUE4 FROM PIMVARI ');
    SQL.ADD(' WHERE GUBUN = ''00'' AND SGUBUN = ''0001'' ');
    Open;
    payrachdate := FieldByName('value2').AsString;

    // 계획인원/현원생성일
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT VALUE1, VALUE2 FROM PIMVARI ');
    SQL.ADD(' WHERE GUBUN = ''50'' AND SGUBUN = ''0002'' ');
    Open;
    m_Tolastdate := FieldByName('value1').AsString; // 전월 현원 재생성에서는 영향력 없슴
    m_Polastdate := FieldByName('value2').AsString; // 전월 현원 재생성에서는 영향력 없슴

    // 통계 최종작업년월/일자
    // Close;
    // SQL.Clear;
    // SQL.ADD(' SELECT VALUE1, VALUE2, ');
    // SQL.ADD('        TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(VALUE1,1,6), ''YYYYMM''), 1), ''YYYYMM'') ');
    // SQL.ADD(' FROM PIMVARI  WHERE GUBUN = ''70'' AND SGUBUN = ''0001'' ');
    // Open;
    // m_Lasttongym  := FieldByName('value1').AsString;
    // m_Lastjobdate := FieldByName('value2').AsString;

    // 현원포함여부
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT UPPER(VALUE1), UPPER(VALUE2), UPPER(VALUE3), UPPER(VALUE4) ');
    SQL.ADD(' FROM PIMVARI  WHERE GUBUN = ''50'' AND SGUBUN = ''0003'' ');
    Open;
    m_Ipoyn := Fields[0].AsString;
    m_Epoyn := Fields[1].AsString;
    m_Jpoyn := Fields[2].AsString;
    m_Hpoyn := Fields[3].AsString;

    Close;
  end;

  helpDsr.Caption := '작업중입니다.';
  Application.Processmessages;

  m_Pempno          := passemp(cmdline,1);   //2001.07.09 shm

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    컴포넌트 교체(TSocket -> Indy Rexec) 및 에러체크 부분 수정 (자체개선)               정규용                                        ////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// K.J. 막음  Indy Rexec -> TMax 사용
{
  Rexec.Host      := passemp(cmdline,10);                                                                          //
  Rexec.Username  := passemp(cmdline,11);                                                                          //
  Rexec.Password  := passemp(cmdline,12);                                                                          //
                                                                                                                   //
  IdAntiFreeze1.Process;                                                                                           //
  helpDsr.Caption := '[전월현원] 업데이트 중입니다....';                                                           //
                                                                                                                   //
  rxcMsg := Rexec.Execute('~/HINSA/proc/bin/Ibin/pie1011g ' + m_Pempno + ' ' + '11' + ' '   //2001.07.09 shm                  //
                                  +  m_workym + ' ' + m_Orgnum + ' ' + m_Manunit + ' '                             //
                                  +  m_Ipoyn + ' ' + m_Epoyn + ' ' + m_Jpoyn + ' ' + m_Hpoyn + ' '                 //
                                  +  m_Tolastdate + ' ' + m_Polastdate);                                           //
  Rexec.Disconnect;                                                                                                //
  if Pos('OK',rxcMsg) > 0 then                                                                                     //
  begin                                                                                                            //
    helpDsr.Caption := '[전월통계] 업데이트 중입니다....';                                                         //
    rxcMsg := Rexec.Execute('~/HINSA/proc/bin/Ibin/pie2011g ' + m_Pempno + ' '                                                //
                                                   + m_workym + ' ' +  m_Epoyn + ' ' + m_Jpoyn + ' ' + m_Hpoyn);   //
                                                                                                                   //
    if Pos('OK',rxcMsg) > 0  then                                                                                  //
    begin                                                                                                          //
      helpDsr.Caption := '현원,통계생성이 정상적으로 완료되었습니다.';                                             //
    end                                                                                                            //
    else begin                                                                                                     //
      helpDsr.Caption := '[전월통계] 에러!! 관리자에게 문의하세요!!';                                              //
    end;                                                                                                           //
  end                                                                                                              //
  else begin                                                                                                       //
     helpDsr.Caption := '[전월현원] 에러!! 관리자에게 문의하세요!!';                                               //
  end;                                                                                                             //                                                                                                       //
                                                                                                                   //
  IsBatchLoaded     := False;
}                  //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------
//       Memo1.Clear;
//       Memo1.Lines.Add('실행중...');
       Rundate := copy(timedate(Query1),1,14);
       ProgId1  := 'pie1011g';
       ProgId2  := 'pie2011g';

       // 경진의 메모(주의사항) :1) 꼭 bin디렉토리에서 실행하라(권한 문제 땜시 그렇다구 하네여..
       //                        2) 서버에서 컴파일 후 src에 있는 실행파일을 bin으로 복사할때 꼭 mv 시켜라
       //                           (cp는 권한 까지 복사하기때문)...
       //             logfile확인 :tmax/log/ulog/htmax_batch.out
       CmdStr  := '/hper/insa/HINSA/proc/bin/Ibin/pie1011g ' + m_Pempno + ' ' + '11' + ' '   //2001.07.09 shm
                                  +  m_workym + ' ' + m_Orgnum + ' ' + m_Manunit + ' '
                                  +  m_Ipoyn + ' ' + m_Epoyn + ' ' + m_Jpoyn + ' ' + m_Hpoyn + ' '
                                  +  m_Tolastdate + ' ' + m_Polastdate + ' ' + m_Pempno+' '+ProgId1 +' '+Rundate   ;

       showmessage(CmdStr);

       if Pos('OK',CmdStr) > 0 then
       begin
          CmdStr  := '/hper/insa/HINSA/proc/bin/Ibin/pie2011g' + m_Pempno + ' ' + '11' + ' '
                                   +  m_workym + ' ' + m_Orgnum + ' ' + m_Manunit + ' '
                                   +  m_Ipoyn + ' ' + m_Epoyn + ' ' + m_Jpoyn + ' ' + m_Hpoyn + ' '
                                   +  m_Tolastdate + ' ' + m_Polastdate  + ' ' + m_Pempno+' '+ProgId2 +' '+Rundate  ;
          if Pos('OK',CmdStr) > 0  then
          begin
             helpDsr.Caption := '현원,통계생성이 정상적으로 완료되었습니다.';
          end
          else begin
             helpDsr.Caption := '[전월통계] 에러!! 관리자에게 문의하세요!!';
          end;
       end else
       begin
          helpDsr.Caption := '[전월현원] 에러!! 관리자에게 문의하세요!!';
       end;
{
       with TDS_batch do
       begin
          Close;
          ServiceName := 'HINSA_batch';
          ClearFieldInfo;
          ClearParamInfo;
          AddParam('cmdstr', 300, CmdStr);
          Execute;

          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          ClearParamInfo;
          AddField('RESULT', ftString, 5000);
          Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                             ' WHERE RUNDATE = ''%s''     '+
                             '   AND PROGID  = ''%s''     '+
                             ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
          Open;

          while not Eof do
          begin
             Memo1.Lines.Add(FieldByName('RESULT').AsString);
             Next;
          end;
       end; }   //with TDS_batch do
       /////////////////////////////////////////////////////////////////////////

end;

procedure Tpic1061gForm.PhelpDblClick(Sender: TObject);
begin
  ShowMessage(rxcMsg);
end;

procedure Tpic1061gForm.FormShow(Sender: TObject);
begin
  CurDate := TimeDate(Query1);
  L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                        copy(CurDate,5,2)+'/'+
                        copy(CurDate,7,2);

   anfrdate.Text := CurDate;
//   if PassDialog(pic1061gForm,p_empno,p_korname,password) = False then halt(0);
   L_UserName.Caption := p_korname+'('+p_empno+')';
   // 파견교육현원포함여부,정직자현원포함여부,휴직자포함여부,발령경신최종발령일을 읽어온다..
   QvariDisp;

   FreeCheck := DiskSpaceCheck;
   HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
   SendMessage(pHelp.handle,WM_PAINT,0,0);
   if FreeCheck = True then MakeTextFile;

   HelpDsr.Caption := '';

  EnterKey := 1;
  DbGrid1.Visible := False;
  anfrdate.SetFocus;
end;

end.
