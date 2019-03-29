
/* Result Sets Interface */
#ifndef SQL_CRSR
#  define SQL_CRSR
  struct sql_cursor
  {
    unsigned int curocn;
    void *ptr1;
    void *ptr2;
    unsigned int magic;
  };
  typedef struct sql_cursor sql_cursor;
  typedef struct sql_cursor SQL_CURSOR;
#endif /* SQL_CRSR */

/* Thread Safety */
typedef void * sql_context;
typedef void * SQL_CONTEXT;

/* Object support */
struct sqltvn
{
  unsigned char *tvnvsn; 
  unsigned short tvnvsnl; 
  unsigned char *tvnnm;
  unsigned short tvnnml; 
  unsigned char *tvnsnm;
  unsigned short tvnsnml;
};
typedef struct sqltvn sqltvn;

struct sqladts
{
  unsigned int adtvsn; 
  unsigned short adtmode; 
  unsigned short adtnum;  
  sqltvn adttvn[1];       
};
typedef struct sqladts sqladts;

static struct sqladts sqladt = {
  1,1,0,
};

/* Binding to PL/SQL Records */
struct sqltdss
{
  unsigned int tdsvsn; 
  unsigned short tdsnum; 
  unsigned char *tdsval[1]; 
};
typedef struct sqltdss sqltdss;
static struct sqltdss sqltds =
{
  1,
  0,
};

/* File name & Package Name */
struct sqlcxp
{
  unsigned short fillen;
           char  filnam[12];
};
static struct sqlcxp sqlfpn =
{
    11,
    "pkc10803.pc"
};


static unsigned int sqlctx = 150195;


static struct sqlexd {
   unsigned long  sqlvsn;
   unsigned int   arrsiz;
   unsigned int   iters;
   unsigned int   offset;
   unsigned short selerr;
   unsigned short sqlety;
   unsigned int   occurs;
            short *cud;
   unsigned char  *sqlest;
            char  *stmt;
   sqladts *sqladtp;
   sqltdss *sqltdsp;
   unsigned char  **sqphsv;
   unsigned long  *sqphsl;
            int   *sqphss;
            short **sqpind;
            int   *sqpins;
   unsigned long  *sqparm;
   unsigned long  **sqparc;
   unsigned short  *sqpadto;
   unsigned short  *sqptdso;
   unsigned int   sqlcmax;
   unsigned int   sqlcmin;
   unsigned int   sqlcincr;
   unsigned int   sqlctimeout;
   unsigned int   sqlcnowait;
            int   sqfoff;
   unsigned int   sqcmod;
   unsigned int   sqfmod;
   unsigned char  *sqhstv[45];
   unsigned long  sqhstl[45];
            int   sqhsts[45];
            short *sqindv[45];
            int   sqinds[45];
   unsigned long  sqharm[45];
   unsigned long  *sqharc[45];
   unsigned short  sqadto[45];
   unsigned short  sqtdso[45];
} sqlstm = {12,45};

/* SQLLIB Prototypes */
extern sqlcxt (/*_ void **, unsigned int *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlcx2t(/*_ void **, unsigned int *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlbuft(/*_ void **, char * _*/);
extern sqlgs2t(/*_ void **, char * _*/);
extern sqlorat(/*_ void **, unsigned int *, void * _*/);

/* Forms Interface */
static int IAPSUCC = 0;
static int IAPFAIL = 1403;
static int IAPFTL  = 535;
extern void sqliem(/*_ unsigned char *, signed int * _*/);

 static char *sq0008 = 
"NVL(B.YBONAMT,0))+NVL(B.SBONTAXAMT,0\
))+NVL(B.SOPAYSUM,0))+NVL(B.MEDSUPAMT,0))+NVL(B.HOMESUPAMT,0))+NVL(B.AIDAMT2,\
0))* 1) YY_TAXSUM1 , case  when DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FI\
XPAY,0))<>0 then (((NVL(B.FIXPAY,0)+NVL(B.QUATERPAY,0))+NVL(B.HOLIPAY,0))/DEC\
ODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0))) else 0  end  MONTHRATE ,N\
VL(B.CHILDDED,0) ,NVL(A.MATEDCNT,0) ,NVL(A.FAMIDCNT,0)  from PKMPMAS A ,PKMPC\
ALC B ,PKCPBAS C where ((b.empno>=:b1 and b.empno<=:b2) and a.empno=b.empno) \
          ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,398,0,0,0,0,0,1,0,
20,0,0,2,1166,0,4,433,0,0,45,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,
97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
215,0,0,3,40,0,4,476,0,0,1,1,0,1,0,1,97,0,0,
234,0,0,4,68,0,5,493,0,0,0,0,0,1,0,
249,0,0,5,92,0,4,512,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
280,0,0,6,40,0,4,535,0,0,1,0,0,1,0,2,97,0,0,
299,0,0,7,595,0,4,553,0,0,25,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,
414,0,0,8,2556,0,9,637,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
441,0,0,8,0,0,15,643,0,0,0,0,0,1,0,
456,0,0,8,0,0,13,650,0,0,34,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
607,0,0,8,0,0,15,663,0,0,0,0,0,1,0,
622,0,0,8,0,0,15,671,0,0,0,0,0,1,0,
637,0,0,8,0,0,15,684,0,0,0,0,0,1,0,
652,0,0,8,0,0,15,690,0,0,0,0,0,1,0,
667,0,0,9,92,0,4,784,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
694,0,0,10,115,0,4,826,0,0,4,3,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
725,0,0,11,249,0,4,850,0,0,7,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,
768,0,0,12,170,0,4,886,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
791,0,0,13,92,0,4,1171,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
818,0,0,14,92,0,4,1182,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
845,0,0,15,157,0,4,1212,0,0,4,2,0,1,0,2,4,0,0,2,4,0,0,1,4,0,0,1,4,0,0,
876,0,0,16,132,0,4,1254,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,97,0,0,
903,0,0,17,2085,0,4,1281,0,0,4,3,0,1,0,1,4,0,0,1,4,0,0,2,4,0,0,1,97,0,0,
934,0,0,18,334,0,5,1394,0,0,20,20,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
1029,0,0,19,83,0,4,1445,0,0,3,2,0,1,0,1,97,0,0,1,3,0,0,2,97,0,0,
1056,0,0,20,50,0,3,1465,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1097,0,0,21,0,0,29,1475,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKC10803(급여 세금계산_2015년 7월 이전까지 사용)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 유미나
 Version        : 30.01 
 Date           : 1999.02.24

Update Contents
  Version   date(yy.mm.dd)   programmer   description        relevant doc.no
  1.00      1997.02.16       김승회       최초개발본         설계명세서
  2.00      1997.12.08       이랑교       하나로전용         설계명세서
  3.00      1998.07.10       김승회       고용보험료로직변경 전(1998.6.30)
 30.00      1998.12.29       김승회       계산로직변경       하나로인사재개발
 30.01      1999.02.24       유미나     Y2K(주민번호관련)    하나로인사재개발
 30.05      1999.09.17       김승회       계산로직변경       소득세법변경
 40.00      2002.01.22       유효성       계산로직변경       소득세법변경 
 40.10      2002.02.18       유효성       소득세법 개정(컬럼 anuded, standded 추가,
                                          계산로직을 직급에 따라 2분화)            
 40.20      2003.02.18       강륜종       소득세액누계액(CALCTAXSUM)에 잘못된 데이터 저장에 따른 수정작업
                            (Dsa2000)     소득세액누계액(CALCTAXSUM) 0 을 저장(사용치 않는것으로 판단했기때문.)
 40.21      2004.02.24       강륜종       Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.                                           
 41.00      2004.06.18       Dsa2000      직급코드값 변동에 따른 수정.  
                                    PAYCL코드 10이 사외이사에서 부장으로 변경.   사외이사는 0Z로 코드 변경.      
 42.00      2004.11.         Dsa2000      Rexec대체 서비스를 위한 수정적업.                                   
 43.00      2005.01.10       Dsa2000      월차수당 페지 및 정보통신수당(ITAMT) 신설에따른 고용보험 루틴 수정.
 44.00      2006.07.18.      Dsa2000      지급항목별 1년 총과세 추정치 금액 구하는 SQL 추가(9월 추가수정)
 45.00      2007.01          dsa2000      다자녀추가공제
 46.00      2007.09.12       dsa2000      특별공제액 변경에 따라 추가 speded matedcnt famidcnt
 47.00      2008.02.         dsa2000      세금로직변경 :
 48.00			2012.09.13			 hjku	        근로소득 간이세액표 특별공제 상향조정분 반영
 49.00			2014.01.04			 hjku	        2014년 세율 변경분 적용
 ============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS     -1*/
#define  FAIL        -2

/********* Function Prototype 정의 ************/

void  Process_Calc();
void  Check_Existence();
void  Get_PresidentEmpno();
int   Get_TaxRate(double taxlevel, double *taxrate, double *yearded);
void  Process_TaxCalc();
void  add_months(char *,int,char *);
void  print_errmsg(int errcode, char *errmsg);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    empno[5]         = "";   /* 사   번      */
     char    korname[13]      = "";   /* 성   명      */
     char    juminid[13+1]    = "";   /* 주민등록번호   */
     char    paydate[7]       = "";   /* 급 여 지 급 월       */
     char    paynum[3]        = "";   /* 급  호  차  수       */
     char    paycl[4]         = "";   /* 직   급      */
     float   paygr;                   /* 호   봉      */  
     char    pstate[3]        = "";   /* 인  사  상  태       */
     char    orgnum[4]        = "";   /* 조  직  차  수       */  
     char    deptcode[7]      = "";   /* 부  서  코  드       */
     char    bldcode[3]       = "";   /* 근 무 지 코 드       */
     char    payyn[2]         = "";   /* 급여지급여부         */
     char    paycalckind[2]   = "";   /* 당월급여계산방식     */
     char    ducalckind[2]    = "";   /* 당월직무계산방식     */
     char    bpaycalckind[2]  = "";   /* 전월급여계산방식     */
     char    bducalckind[2]   = "";   /* 전월급여계산방식    */
     char    paybank[4]       = "";   /* 급여지급은행*        2017.09.05 eyha size 변경 */ 
     char    payacnt[21]      = "";   /* 급여통장번호*        */
     double  basicamt;                /* 당월  기본급         */
     double  infoamt;                 /* 당월정보수당         */
     double  dutyamt;                 /* 당월직무수당         */
     double  promamt;                 /* 업무추진비           */
     double  bbasicamt;               /* 전월기본급소급액     */
     double  binfoamt;                /* 전월정보수당소급액   */  
     double  bdutyamt;                /* 전월직무수당소급액   */
     double  bonusamt;                /* 정기상여금           */  
     double  devidemon;               /* 상여금분할월수       */ 
     double  incentamt;               /* 능률제고수당          */
     double  trainamt;                /* 체력단련비           */
     double  winteramt;               /* 월동보조비  => 영업인센티브로 변경 2006.04.19.*/
     double  mbonamt;                 /* 월차수당(*)          */
     double  ybonamt;                 /* 연차수당(*)    */
     double  sbonamt;                 /* 특별상여금(총액)     */
     double  sbontaxamt;              /* 특별상여금(과세)     */
     double  mateamt;                 /* 가족수당(배우자)     */
     double  partamt;                 /* 가족수당(존속)       */
     double  childamt;                /* 가족수당(비속)       */
     double  liceamt;                 /* 자격수당          */ 
     double  ovtmamt;                 /* 초과근무수당          */
     double  sptmamt;                 /* 특별근무수당          */
     double  aidamt1;                 /* 기타수당1          */
     double  aidamt2;                 /* 기타수당2          */
     double  aidamt3;                 /* 유치수수료          */
     double  mcaramt;                 /* 식대교통비           */
     double  mcartaxamt;              /* 식대교통비(과세)  */
     double  yueduamt;                /* 학자금(회사)      */
     double  selfeduamt;              /* 학자금(복지기금)     */
     double  odamt;                   /* 운전지원금(총액)     */
     double  odtaxamt;                /* 운전지원금(과세)     */
     double  drvliceamt;              /* 운전면허지원금  */
     double  bokjisupamt;             /* 복지연금          */
     double  lectsupamt;              /* 사내강사료          */
     double  edusupamt;               /* 교육비지원금          */
     double  medsupamt;               /* 의료비지원금          */
     double  homesupamt;              /* 귀향지원금   */
     double  longsupamt;              /* 장기휴가비   */
     double  supamt1;                 /* 기타지원금1   */
     double  supamt2;                 /* 기타지원금2          */
     double  supamt3;                 /* 기타지원금3          */
     double  basicded;                /* 기초공제액          */
     double  mateded;                 /* 배우자공제액          */
     double  famided;                 /* 부양자공제액          */
/* ===========================================================================
  40.10     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가,
                                   계산로직을 직급에 따라 2분화)           
============================================================================= */  
     double  anuded;                  /* 국민연금보험료 공제액*/
     double  standded;                /* 표준공제액 */
     double  speded;                  /* 특별공제액 */  
     double  obsded;                  /* 장애자공제액          */
     double  silverded;               /* 경로우대장애액       */
     double  womanded;                /* 부녀자공제액         */
     double  eduded;                  /* 자녀양육비공제액     */
     double  spededamt;               /* 특별공제액           */  
     double  etcded1;                 /* 기타공제액1          */
     double  etcded2;                 /* 기타공제액2          */
     double  taxpay;                  /* 과세급여          */
     double  notaxpay;                /* 비과세급여           */
     double  taxbonus;                /* 과세상여(삭제)  */
     double  notaxbonus;              /* 비과세상여          */
     double  paysum;                  /* 지급총액          */
     double  taxpaysum;               /* 과세급여총액          */
     double  notaxpaysum;             /* 비과세급여총액       */
     double  saveamt1;                /* 저축금1(재형저축)    */
     double  saveamt2;                /* 저축금2(장기저축)    */
     double  saveamt3;                /* 복지연금          */
     double  saveaddamt;              /* 출연기금          */  
     double  meddamt;                 /* 피보험자의료보험     */
     double  empldamt;                /* 고용보험료          */
     double  anudamt;                 /* 국민연금본인각출료   */
     double  hsamt;                   /* 주택자금대촐          */
     double  fbamt;                   /* 외환복지대촐          */
     double  nbamt;                   /* 국제화재대출          */
     double  sacorpamt;               /* 사주회사대출          */
     double  sabankamt;               /* 사주은행대출          */
     double  sangamt;                 /* 상조회대촐          */
     double  loanamt1;                /* 기타대출1          */
     double  loanamt2;                /* 기타대출2          */
     double  loanamt3;                /* 사내근로복지기금대출_2012.07.변경사용. */
     double  ticketamt;               /* 사용식권금액   */
     double  nojoamt;                 /* 노조회비공제금       */
     double  sauamt;                  /* 사우회비공제금       */
     double  igamt;                   /* IG회비공제금         */
     double  sobiamt;                 /* 소비조합할부금       */
     double  parkamt;                 /* 주차비공제금         */
     double  chollamt;                /* 천리안사용료          */
     double  meddedamt;               /* 의료비가불공제금     */
     double  edudedamt;               /* 교육비공제금          */
     double  dedamt1;                 /* 기타공제1          */
     double  dedamt2;                 /* 기타공제2          */
     double  dedamt3;                 /* 기타공제3          */
     double  dedamt4;                 /* 기타공제4          */
     double  dedamt5;                 /* 기타공제5          */
     double  bondedamt;               /* 기지급상여금   */
     double  labinded;                /* 근로소득공제액       */
     double  labneedded;              /* 근로소득필요경비계   */
     double  labinamt;                /* 근로소득금액         */
     double  inded;                   /* 소득공제액          */
     double  taxinamt;                /* 과세표준금액          */
     double  calctax;                 /* 산촐세액             */  
     double  labtaxded;               /* 근로소득세액공제     */
     double  savetaxded;              /* 저축세액공제         */
     double  intax;                   /* 소득세               */
     double  jutax;                   /* 주민세               */
     double  dedsum;                  /* 공제액계             */
     double  realpay;                 /* 실지급액          */
     double  taxgross;                /* 당년과세수입누계     */
     double  notaxgross;              /* 당년비과세수입누계   */
     double  intaxsum;                /* 당년소득세누계       */
     double  calctaxsum;              /* 당년산출세누계       */
     double  kita1;                   /* 기타1          */
     double  kita2;                   /* 기타2          */
     double  kita3;                   /* 기타3                */
     double  kita4;                   /* 기타4          */
     double  kita5;                   /* 기타5                */
     double  btaxpay;                 /* 전월조정과세급여     */
     double  bnotaxpay;               /* 전월조정비과세급여   */
     double  btaxbon;                 /* 전월과세상여         */
     double  bnotaxbon;               /* 전월비과세상여       */
     double  sopay;                   /* 소급급여             */
     double  sobon;                   /* 소급상여             */
     char    cretime[16]      = "";   /* 급여생성일시         */
     char    writetime[16]    = "";   /* 최종작업일시         */
     char    writeman[5]      = "";   /* 최종작업자           */  
     char    president_empno[5] = ""; /* 사장님 사번   */
     
     double  fixpay;                  /* 월정급여   */
     double  bfixpay;                 /* 전월월정급여   */
     double  quaterpay;               /* 분기급여   */
     double  holipay;                 /* 명절급여   */
     double  roleamt;                 /* 직책수당   */
     
     double  tmp_taxgross;
     double  tmp_notaxgross;
     double  tmp_intaxsum;
     double  tmp_calctaxsum;
     
     /*  월급여이력화일(pkhphis)          */
     double  qcalctax;                /* 산출세액        */
     
     /*  급여마스터  (PKMPMAS) 참조 변수               */
     double  matecnt;                 /* 가족수(배우자)     */
     double  parentcnt;               /* 가족수(존속)        */
     double  childcnt;                /* 가족수(비속)       */
     double  matedcnt;                /* 배우자공제수       */
     double  famidcnt;                /* 부양자공제수       */
     double  obscnt;                  /* 장애자공제수       */
     double  silverdcnt;              /* 경로우대공제수     */
     double  womancnt;                /* 부녀자공제수       */
     double  yueduamt;                /* 유치원학자금        */ 
     
     /*  급여지급기준(PKCPBAS) 참조 변수               */
     char    cpaynum[3]  = "";        /* 현급호차수        */
     double  bonusmon;                /* 상여금분할개월수   */
     char    bonusyn[2]  = "";        /* 상역금지급여부     */  
     double  stdded;                  /* 표준공제액        */
     double  proprate;                /* 재형저축기금율     */
     double  jutaxrate;               /* 주민세율        */
     double  indedbasic;              /* 소득공제기본액     */
     double  indedbrate;              /* 소득공제기본율     */
     double  indedorate;              /* 소득공제초과율     */
     double  indedlimit;              /* 소득공제한도액     */
     double  indedorate2;             /* 소득공제초과율2    */
     double  indedlimit2;             /* 소득공제한도액2    */
     double  indedorate3;             /* 소득공제초과율3    */
     double  indedlimit3;             /* 소득공제한도액3    */
     double  indedorate4;             /* 소득공제초과율4    */
     double  indedlimit4;             /* 소득공제한도액4    */  
     double  taxdedbasic;             /* 세액공제기본액     */
     double  taxdedbrate;             /* 세액공제기본율     */
     double  taxdedorate;             /* 세액공제초과율     */
     double  taxdedlimit;             /* 세액공제한도액     */
     double  avgodamt;                /* 평균자가운전지원금 */
     char    holyonly[2];             /* 명절연봉만 따로 지급 여부 dsa2000  2007.02. add*/
     
     /*   고용보험계산항목(PKCEMTBL) 참조 변수          
                3.00       1998.07.10         이랑교          하나로전용      설계명세서    */
     char    basicamtyn[1+1]   = "";  /* 기본급   */
     char    infoamtyn[1+1]    = "";  /* 정보수당   */
     char    dutyamtyn[1+1]    = "";  /* 직무수당             */
     char    promamtyn[1+1]    = "";  /* 업무추진비   */
     char    bonusamtyn[1+1]   = "";  /* 정기상여금   */
     char    incentamtyn[1+1]  = "";  /* 능률제고수당   */
     char    trainamtyn[1+1]   = "";  /* 체력단련비   */
     char    winteramtyn[1+1]  = "";  /* 월동보조비  => 영업인센티브로 변경 2006.04.19.*/
     char    ybonamtyn[1+1]    = "";  /* 연차수당   */
     char    sbonamtyn[1+1]    = "";  /* 특별상여금(총액)  */
     char    homesupamtyn[1+1] = "";  /* 귀향지원금    */
     char    longsupamtyn[1+1] = "";  /* 장기휴가비     */
     char    mbonamtyn[1+1]    = "";  /* 월차수당   */
     char    mateamtyn[1+1]    = "";  /* 가족수당(배우자)  */
     char    partamtyn[1+1]    = "";  /* 가족수당(존속)  */
     char    childamtyn[1+1]   = "";  /* 가족수당(비속)  */
     char    liceamtyn[1+1]    = "";  /* 자격수당   */
     char    ovtmamtyn[1+1]    = "";  /* 초과근무수당   */
     char    sptmamtyn[1+1]    = "";  /* 특별근무수당   */
     char    aidamt1yn[1+1]    = "";  /* 기타수당1   */
     char    aidamt2yn[1+1]    = "";  /* 기타수당2   */
     char    aidamt3yn[1+1]    = "";  /* 유치수수료   */
     char    mcaramtyn[1+1]    = "";  /* 식대교통비   */
     char    yueduamtyn[1+1]   = "";  /* 학자금(회사)   */
     char    selfeduamtyn[1+1] = "";  /* 학자금(복지기금)  */
     char    odamtyn[1+1]      = "";  /* 운전지원금(총액)  */
     char    drvliceamtyn[1+1] = "";  /* 운전면허지원금  */
     char    lectsupamtyn[1+1] = "";  /* 사내강사료   */
     char    edusupamtyn[1+1]  = "";  /* 교육비지원금          */
     char    bokjisupamtyn[1+1]= "";  /* 복지연금   */
     char    medsupamtyn[1+1]  = "";  /* 의료비지원금         */
     char    supamt1yn[1+1]    = "";  /* 기타지원금1   */
     char    supamt2yn[1+1]    = "";  /* 기타지원금2   */
     char    supamt3yn[1+1]    = "";  /* 기타지원금3   */
     char    ovmcamtyn[1+1]    = "";  /* 야근식대   */
     char    childeduamtyn[1+1]= "";  /* 자녀학자금   */
     char    taxpayyn[1+1]     = "";  /* 과세급여   */
     char    notaxpayyn[1+1]   = "";  /* 비과세급여   */
     char    taxbonusyn[1+1]   = "";  /* 과세상여   */
     char    sopayyn[1+1]      = "";  /* 소급급여   */
     char    sobonyn[1+1]      = "";  /* 소급상여   */
     char    exfryymm[6+1]     = "";  /* 만60세이상 시작년월  */
     double  empldrate         = 0;   /* 고용보험료율   */
/*=============================================================================== 
=> 변경된 급여급항목을 고려한 새로운 고용보험료 산정대상항목 추가
=============================================================================== */
     char    fixpayyn[1+1]     = "";  /* 월정급여   */
     char    quaterpayyn[1+1]  = "";  /* 분기급여   */
     char    holipayyn[1+1]    = "";  /* 휴일급여             */
     char    roleamtyn[1+1]    = "";  /* 직책수당   */
     char    itamtyn[1+1]      = "";  /* 정보통신수당   2005.01.  */  
             
     char    month[7]          = "";  /* 월급여최종지급월   */
     char    frempno[5]        = "";
     char    toempno[5]        = "";
     double  basemm;
     
     double  yuedunotax        = 0;   /* 유치원학자금 비과세금액 추가 dsa2000  2006.07.*/
     double  yy_taxsum18       = 0;   /* 1년 과세급여총액 추정치 18개월 분할 (세금 계산을 위한) dsa2000  2006.07.*/
     double  yy_taxsum12       = 0;   /* 1년 과세급여총액 추정치 12개월 분할 (세금 계산을 위한) dsa2000  2006.07.*/
     double  yy_taxsum4        = 0;   /* 1년 과세급여총액 추정치  4개월 분할 (세금 계산을 위한) dsa2000  2006.07.*/
     double  yy_taxsum1        = 0;   /* 1년 과세급여총액 추정치  1회성 지급 (세금 계산을 위한) dsa2000  2006.07.*/
     double  monthrate         = 0;   /* 당월 지급되는 (월정+분기+명절연봉)/월정 의 비율  2006.08.*/
     
     double  childded          = 0;   /*dsa2000 2007.01 Add  다자녀추가공제 */
     double  yytaxminus        = 0;   /*dsa2000 2007. 06.*/
     double  specialded2;      /* 특별공제액2인이하   dsa2000 추가 */
     double  specialded3;      /* 특별공제액3인이상   dsa2000 추가 */
     double  cstdded;          /* 특별공제액          */     
/* EXEC SQL END   DECLARE SECTION; */ 

/* EXEC SQL INCLUDE SQLCA;
 */ 
/*
 * $Header: sqlca.h 24-apr-2003.12:50:58 mkandarp Exp $ sqlca.h 
 */

/* Copyright (c) 1985, 2003, Oracle Corporation.  All rights reserved.  */
 
/*
NAME
  SQLCA : SQL Communications Area.
FUNCTION
  Contains no code. Oracle fills in the SQLCA with status info
  during the execution of a SQL stmt.
NOTES
  **************************************************************
  ***                                                        ***
  *** This file is SOSD.  Porters must change the data types ***
  *** appropriately on their platform.  See notes/pcport.doc ***
  *** for more information.                                  ***
  ***                                                        ***
  **************************************************************

  If the symbol SQLCA_STORAGE_CLASS is defined, then the SQLCA
  will be defined to have this storage class. For example:
 
    #define SQLCA_STORAGE_CLASS extern
 
  will define the SQLCA as an extern.
 
  If the symbol SQLCA_INIT is defined, then the SQLCA will be
  statically initialized. Although this is not necessary in order
  to use the SQLCA, it is a good pgming practice not to have
  unitialized variables. However, some C compilers/OS's don't
  allow automatic variables to be init'd in this manner. Therefore,
  if you are INCLUDE'ing the SQLCA in a place where it would be
  an automatic AND your C compiler/OS doesn't allow this style
  of initialization, then SQLCA_INIT should be left undefined --
  all others can define SQLCA_INIT if they wish.

  If the symbol SQLCA_NONE is defined, then the SQLCA variable will
  not be defined at all.  The symbol SQLCA_NONE should not be defined
  in source modules that have embedded SQL.  However, source modules
  that have no embedded SQL, but need to manipulate a sqlca struct
  passed in as a parameter, can set the SQLCA_NONE symbol to avoid
  creation of an extraneous sqlca variable.
 
MODIFIED
    lvbcheng   07/31/98 -  long to int
    jbasu      12/12/94 -  Bug 217878: note this is an SOSD file
    losborne   08/11/92 -  No sqlca var if SQLCA_NONE macro set 
  Clare      12/06/84 - Ch SQLCA to not be an extern.
  Clare      10/21/85 - Add initialization.
  Bradbury   01/05/86 - Only initialize when SQLCA_INIT set
  Clare      06/12/86 - Add SQLCA_STORAGE_CLASS option.
*/
 
#ifndef SQLCA
#define SQLCA 1
 
struct   sqlca
         {
         /* ub1 */ char    sqlcaid[8];
         /* b4  */ int     sqlabc;
         /* b4  */ int     sqlcode;
         struct
           {
           /* ub2 */ unsigned short sqlerrml;
           /* ub1 */ char           sqlerrmc[70];
           } sqlerrm;
         /* ub1 */ char    sqlerrp[8];
         /* b4  */ int     sqlerrd[6];
         /* ub1 */ char    sqlwarn[8];
         /* ub1 */ char    sqlext[8];
         };

#ifndef SQLCA_NONE 
#ifdef   SQLCA_STORAGE_CLASS
SQLCA_STORAGE_CLASS struct sqlca sqlca
#else
         struct sqlca sqlca
#endif
 
#ifdef  SQLCA_INIT
         = {
         {'S', 'Q', 'L', 'C', 'A', ' ', ' ', ' '},
         sizeof(struct sqlca),
         0,
         { 0, {0}},
         {'N', 'O', 'T', ' ', 'S', 'E', 'T', ' '},
         {0, 0, 0, 0, 0, 0},
         {0, 0, 0, 0, 0, 0, 0, 0},
         {0, 0, 0, 0, 0, 0, 0, 0}
         }
#endif
         ;
#endif
 
#endif
 
/* end SQLCA */


int    rcount  = 0;
int    i  = 0;
int    id  = 0;
char   dir[80] ="";
char   tmp_buf[101]   = "";
char   msg[500+1]   = "";

double  YY_TaxPay       = 0;
double  YY_TaxPay_Org  = 0;
double  YY_TaxInAmt     = 0;   /* 년과세표준금액       */
double  YY_TaxAmt       = 0;   /* 년과세금액합          */
double  YY_LabInDed     = 0;   /* 년근로소득공제액      */
double  YY_LabNeedDed   = 0;   /* 년근로소득필요경비계   */
double  YY_LabInAmt     = 0;   /* 년근로소득금액   */
double  YY_InDed        = 0;   /* 년소득공제액    */
double  YY_CalcTax      = 0;   
double  labtaxdedlimit  = 0;   /* 근로소득 세액공제 한도           */

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno               = 0; 

void main(int argc,char *argv[] )
{
     char FL_file[255];
                                          
     if  (argc != 7) {  /* pkc10803 200607 0000 zzzz D006 pkc10803 20060719152849 */
          printf("[Usage] : pkc10803 1.급여년월 2.사번fr 3.사번to 4.작업자 5.프로그램ID 6.시작시간 \n");
          exit(1);
     }
      
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkc10803");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(paydate,"%6s",argv[1]);
     sprintf(frempno,"%4s",argv[2]);
     sprintf(toempno,"%4s",argv[3]);
     sprintf(writeman,"%4s",argv[4]);
     
     /* Dsa2000  2004.02.24.   DB Connect 실시..*******  DB_connect(id,0); */
     hinsa_log_print(0,"급여계산 프로그램 시작...[pkq10802]");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     /* EXEC SQL 
     lock table pkmpcalc in exclusive mode nowait; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock table pkmpcalc in exclusive mode nowait";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     sprintf(log_buff, " [세금 및 공제금 계산... ] ");
     Write_batlog(seqno++, log_buff);                   /*dsa2000 Rexec 대체*/
     Process_Calc();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);                     /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [월급여계산 작업성공] =====");
          Write_batlog(seqno++, log_buff);                           /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [월급여계산 작업성공] =====\n");
     }     
}

/*****************************************************************************
  세금계산과 공제금을 구해 실지급액을 구한다.
*****************************************************************************/
void Process_Calc()
{
     char  str[4+1] = "";
     
     Check_Existence();
     Get_PresidentEmpno();
     
     /* ===============================================================================
             급여지급 항목변경 : => 급여지급항목변경에 따른 고용보험료 산정대상항목을 추가
        =============================================================================== */
     /* EXEC SQL
     select nvl(basicamtyn,' '),   nvl(dutyamtyn,' '),   nvl(bonusamtyn,' '),
            nvl(trainamtyn,' '),   nvl(winteramtyn,' '), nvl(homesupamtyn,' '),
            nvl(ybonamtyn,' '),    nvl(sbonamtyn,' '),   nvl(longsupamtyn,' '),
            nvl(mbonamtyn,' '),    nvl(mateamtyn,' '),   nvl(partamtyn,' '),
            nvl(childamtyn,' '),   nvl(liceamtyn,' '),   nvl(ovtmamtyn,' '),
            nvl(sptmamtyn,' '),    nvl(aidamt1yn,' '),   nvl(aidamt2yn,' '),
            nvl(aidamt3yn,' '),    nvl(mcaramtyn,' '),   nvl(yueduamtyn,' '),
            nvl(selfeduamtyn,' '), nvl(odamtyn,' '),     nvl(drvliceamtyn,' '),
            nvl(lectsupamtyn,' '), nvl(edusupamtyn,' '), nvl(bokjisupamtyn,' '),
            nvl(medsupamtyn,' '),  nvl(supamt1yn,' '),   nvl(supamt2yn,' '),
            nvl(supamt3yn,' '),    nvl(ovmcamtyn,' '),   nvl(childeduamtyn,' '), 
            nvl(taxpayyn,' '),     nvl(notaxpayyn,' '),
            nvl(taxbonusyn,' '),   nvl(sopayyn,' '),     nvl(sobonyn,' '),
            nvl(exfryymm,' '),     nvl(empldrate,0),
            nvl(fixpayyn,' '),     nvl(quaterpayyn,' '), nvl(holipayyn,' '),
            nvl(roleamtyn,' '),    nvl(itamtyn, ' ') /o정보통신수당YN 추가..  dsa2000  2005.01.10. o/
       into :basicamtyn,           :dutyamtyn,           :bonusamtyn, 
            :trainamtyn,           winteramtyn,          :homesupamtyn,
            :ybonamtyn,            :sbonamtyn,           :longsupamtyn,
            :mbonamtyn,            :mateamtyn,           :partamtyn,
            :childamtyn,           :liceamtyn,           :ovtmamtyn,
            :sptmamtyn,            :aidamt1yn,           :aidamt2yn,
            :aidamt3yn,            :mcaramtyn,           :yueduamtyn,
            :selfeduamtyn,         :odamtyn,             :drvliceamtyn,
            :lectsupamtyn,         :edusupamtyn,         :bokjisupamtyn,
            :medsupamtyn,          :supamt1yn,           :supamt2yn,
            :supamt3yn,            :ovmcamtyn ,          :childeduamtyn,
            :taxpayyn,             :notaxpayyn,          
            :taxbonusyn,           :sopayyn,             :sobonyn,
            :exfryymm,             :empldrate,           
            :fixpayyn,             :quaterpayyn,         :holipayyn,
            :roleamtyn,            :itamtyn
      from  pkcemtbl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select nvl(basicamtyn,' ') ,nvl(dutyamtyn,' ') ,nvl(bonusamtyn,' ') \
,nvl(trainamtyn,' ') ,nvl(winteramtyn,' ') ,nvl(homesupamtyn,' ') ,nvl(ybona\
mtyn,' ') ,nvl(sbonamtyn,' ') ,nvl(longsupamtyn,' ') ,nvl(mbonamtyn,' ') ,nv\
l(mateamtyn,' ') ,nvl(partamtyn,' ') ,nvl(childamtyn,' ') ,nvl(liceamtyn,' '\
) ,nvl(ovtmamtyn,' ') ,nvl(sptmamtyn,' ') ,nvl(aidamt1yn,' ') ,nvl(aidamt2yn\
,' ') ,nvl(aidamt3yn,' ') ,nvl(mcaramtyn,' ') ,nvl(yueduamtyn,' ') ,nvl(self\
eduamtyn,' ') ,nvl(odamtyn,' ') ,nvl(drvliceamtyn,' ') ,nvl(lectsupamtyn,' '\
) ,nvl(edusupamtyn,' ') ,nvl(bokjisupamtyn,' ') ,nvl(medsupamtyn,' ') ,nvl(s\
upamt1yn,' ') ,nvl(supamt2yn,' ') ,nvl(supamt3yn,' ') ,nvl(ovmcamtyn,' ') ,n\
vl(childeduamtyn,' ') ,nvl(taxpayyn,' ') ,nvl(notaxpayyn,' ') ,nvl(taxbonusy\
n,' ') ,nvl(sopayyn,' ') ,nvl(sobonyn,' ') ,nvl(exfryymm,' ') ,nvl(empldrate\
,0) ,nvl(fixpayyn,' ') ,nvl(quaterpayyn,' ') ,nvl(holipayyn,' ') ,nvl(roleam\
tyn,' ') ,nvl(itamtyn,' ') into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10\
,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b1");
     sqlstm.stmt = "9,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b3\
0,:b31,:b32,:b33,:b34,:b35,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44  from\
 pkcemtbl ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basicamtyn;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)dutyamtyn;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonusamtyn;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)trainamtyn;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)winteramtyn;
     sqlstm.sqhstl[4] = (unsigned long )2;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)homesupamtyn;
     sqlstm.sqhstl[5] = (unsigned long )2;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)ybonamtyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)sbonamtyn;
     sqlstm.sqhstl[7] = (unsigned long )2;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)longsupamtyn;
     sqlstm.sqhstl[8] = (unsigned long )2;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)mbonamtyn;
     sqlstm.sqhstl[9] = (unsigned long )2;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)mateamtyn;
     sqlstm.sqhstl[10] = (unsigned long )2;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)partamtyn;
     sqlstm.sqhstl[11] = (unsigned long )2;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)childamtyn;
     sqlstm.sqhstl[12] = (unsigned long )2;
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)liceamtyn;
     sqlstm.sqhstl[13] = (unsigned long )2;
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)ovtmamtyn;
     sqlstm.sqhstl[14] = (unsigned long )2;
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)sptmamtyn;
     sqlstm.sqhstl[15] = (unsigned long )2;
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)aidamt1yn;
     sqlstm.sqhstl[16] = (unsigned long )2;
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)aidamt2yn;
     sqlstm.sqhstl[17] = (unsigned long )2;
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)aidamt3yn;
     sqlstm.sqhstl[18] = (unsigned long )2;
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)mcaramtyn;
     sqlstm.sqhstl[19] = (unsigned long )2;
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)yueduamtyn;
     sqlstm.sqhstl[20] = (unsigned long )2;
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)selfeduamtyn;
     sqlstm.sqhstl[21] = (unsigned long )2;
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)odamtyn;
     sqlstm.sqhstl[22] = (unsigned long )2;
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)drvliceamtyn;
     sqlstm.sqhstl[23] = (unsigned long )2;
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)lectsupamtyn;
     sqlstm.sqhstl[24] = (unsigned long )2;
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)edusupamtyn;
     sqlstm.sqhstl[25] = (unsigned long )2;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)bokjisupamtyn;
     sqlstm.sqhstl[26] = (unsigned long )2;
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)medsupamtyn;
     sqlstm.sqhstl[27] = (unsigned long )2;
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)supamt1yn;
     sqlstm.sqhstl[28] = (unsigned long )2;
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)supamt2yn;
     sqlstm.sqhstl[29] = (unsigned long )2;
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)supamt3yn;
     sqlstm.sqhstl[30] = (unsigned long )2;
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)ovmcamtyn;
     sqlstm.sqhstl[31] = (unsigned long )2;
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)childeduamtyn;
     sqlstm.sqhstl[32] = (unsigned long )2;
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)taxpayyn;
     sqlstm.sqhstl[33] = (unsigned long )2;
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)notaxpayyn;
     sqlstm.sqhstl[34] = (unsigned long )2;
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)taxbonusyn;
     sqlstm.sqhstl[35] = (unsigned long )2;
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)sopayyn;
     sqlstm.sqhstl[36] = (unsigned long )2;
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)sobonyn;
     sqlstm.sqhstl[37] = (unsigned long )2;
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)exfryymm;
     sqlstm.sqhstl[38] = (unsigned long )7;
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&empldrate;
     sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)fixpayyn;
     sqlstm.sqhstl[40] = (unsigned long )2;
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)quaterpayyn;
     sqlstm.sqhstl[41] = (unsigned long )2;
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)holipayyn;
     sqlstm.sqhstl[42] = (unsigned long )2;
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)roleamtyn;
     sqlstm.sqhstl[43] = (unsigned long )2;
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)itamtyn;
     sqlstm.sqhstl[44] = (unsigned long )2;
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"고용보험료 계산기준 읽기오류...");
          sprintf(log_buff, "고용보험료 계산기준 읽기오류...");
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     select to_date(:exfryymm,'YYYYMM')
     from  dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_date(:b0,'YYYYMM')  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )215;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)exfryymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"고용보험 만60세 이상 시작월 등록오류...");
          sprintf(log_buff, "고용보험 만60세 이상 시작월 등록오류...");
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     sprintf(str,"%.4s",exfryymm);
     basemm = atoi(str) * 12;
     sprintf(str,"%.2s",exfryymm+4);
     basemm = atoi(str) + basemm;
     basemm = basemm - (12*4);
     
     /* EXEC SQL
     update  pkcpbas
     set  paycalctime = to_char(sysdate,'YYYYMMDDHH24MISSD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycalctime=to_char(sysdate,'YYYYMM\
DDHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )234;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"급여지급기준 쓰기오류...");
          sprintf(log_buff, "급여지급기준 쓰기오류...."); 
          Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
     
     Process_TaxCalc();
}

/******************************************************************************
  Parameter로 넘겨 받은 급여지급월에 상응하는 데이타가 있는지 체크하는 루틴.
******************************************************************************/
void Check_Existence()
{
     /* EXEC SQL 
     select  count(*)
       into  :rcount
       from  pkmpcalc
      where  (empno >= :frempno and empno <= :toempno ) 
        and  paydate = :paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpcalc where ((empno>\
=:b1 and empno<=:b2) and paydate=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )249;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&rcount;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)paydate;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 읽기오류1...");
          sprintf(log_buff, "월급여화일 읽기오류1...."); 
          Write_batlog(seqno++, log_buff);              /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
      
     if  (rcount == 0)
          error_quit("해당하는 자료가 없습니다...");
} 

/****************************************************************************
  사장님의 사번을 구하는 함수.
*****************************************************************************/
void Get_PresidentEmpno()
{
     /* EXEC SQL 
     select  presempno
       into  :president_empno
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select presempno into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )280;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)president_empno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"사장님사번을 구하는 과정에서 Error...");
          sprintf(log_buff, "사장님사번을 구하는 과정에서 Error."); 
          Write_batlog(seqno++, log_buff);                        /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}

/*****************************************************************************
   세금계산을 하는 Function.
*****************************************************************************/
void Process_TaxCalc()
{
     /* EXEC SQL 
     SELECT   NVL(BONUSYN,' '),     BONUSMON,             NVL(PROPRATE,0),      NVL(JUTAXRATE,0),  NVL(STDDED,0),
              NVL(INDEDBASIC,0),    NVL(INDEDBRATE,0),    NVL(INDEDORATE,0),    NVL(INDEDLIMIT,0),
              NVL(INDEDORATE2,0),   NVL(INDEDLIMIT2,0),
              NVL(TAXDEDBASIC,0),   NVL(TAXDEDBRATE,0),   NVL(TAXDEDORATE,0),   NVL(TAXDEDLIMIT,0),
              NVL(AVGODAMT,0),         
              NVL(INDEDLIMIT3,0),   NVL(INDEDORATE3,0),   NVL(INDEDLIMIT4,0),   NVL(INDEDORATE4,0),
              NVL(CHILDNOTAX,0),
              HOLYONLY,             /oDSA2000  2007.02.o/
              NVL(STDDED,0),        NVL(SPECIALDED2,0),   NVL(SPECIALDED3,0)   /odsa2000 2011.09. 특별공제액 Reado/
       into   :bonusyn,             :bonusmon,            :proprate,            :jutaxrate,        :stdded, 
              :indedbasic,          :indedbrate,          :indedorate,          :indedlimit,
              :indedorate2,         :indedlimit2,                               
              :taxdedbasic,         :taxdedbrate,         :taxdedorate,         :taxdedlimit,
              :avgodamt,            
              :indedlimit3,         :indedorate3, :indedlimit4, :indedorate4,
              :yuedunotax,          /o 2006.07. Dsa2000  유치원학자금(yuedunotax) 비과세 추가 o/
              :holyonly,
              :cstdded,             :specialded2,         :specialded3
     from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(BONUSYN,' ') ,BONUSMON ,NVL(PROPRATE,0) ,NVL\
(JUTAXRATE,0) ,NVL(STDDED,0) ,NVL(INDEDBASIC,0) ,NVL(INDEDBRATE,0) ,NVL(INDED\
ORATE,0) ,NVL(INDEDLIMIT,0) ,NVL(INDEDORATE2,0) ,NVL(INDEDLIMIT2,0) ,NVL(TAXD\
EDBASIC,0) ,NVL(TAXDEDBRATE,0) ,NVL(TAXDEDORATE,0) ,NVL(TAXDEDLIMIT,0) ,NVL(A\
VGODAMT,0) ,NVL(INDEDLIMIT3,0) ,NVL(INDEDORATE3,0) ,NVL(INDEDLIMIT4,0) ,NVL(I\
NDEDORATE4,0) ,NVL(CHILDNOTAX,0) ,HOLYONLY ,NVL(STDDED,0) ,NVL(SPECIALDED2,0)\
 ,NVL(SPECIALDED3,0) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:\
b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b20,:b21,:b22,:b23,:b24  from pkcpbas\
 ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )299;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonusyn;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&bonusmon;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&proprate;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&jutaxrate;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&stdded;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&indedbasic;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&indedbrate;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&indedorate;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&indedlimit;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&indedorate2;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&indedlimit2;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&taxdedbasic;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&taxdedbrate;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&taxdedorate;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&taxdedlimit;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&indedlimit3;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&indedorate3;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&indedlimit4;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&indedorate4;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)holyonly;
     sqlstm.sqhstl[21] = (unsigned long )2;
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&cstdded;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&specialded2;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&specialded3;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0)
     {   
          print_errmsg(sqlca.sqlcode,"급여지급기준 읽기오류1...");
          sprintf(log_buff, "급여지급기준 읽기오류1..");
          Write_batlog(seqno++, log_buff);              /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
   
     bonusyn[1] = '\0';
     
     /* EXEC SQL DECLARE cursor1 CURSOR FOR 
     SELECT NVL(B.EMPNO,      '*'),   NVL(B.Paycl,       '*'),   REPLACE(NVL(A.JUMINID,'####'),' ',''), 
            NVL(B.PAYSUM  , 0),   NVL(B.TAXPAYSUM, 0), NVL(B.NOTAXPAYSUM,0),   NVL(B.MEDDAMT,   0),
            NVL(B.BASICDED, 0),   NVL(B.MATEDED,   0), NVL(B.FAMIDED,    0),   NVL(B.OBSDED,    0), 
            NVL(B.SILVERDED,0),   NVL(B.WOMANDED,  0), NVL(B.SAVEAMT1,   0), /oNVL(B.DEDSUM,   0), o/
            NVL(B.MATEAMT,  0),   NVL(B.PARTAMT,   0), NVL(B.CHILDAMT,   0),   NVL(B.SAVEAMT3,  0), 
            NVL(B.YUEDUAMT, 0),   NVL(B.SELFEDUAMT,0), NVL(B.SBONAMT,    0),   NVL(B.DEVIDEMON, 0),            
           (
            NVL(B.TICKETAMT,0) + NVL(B.NOJOAMT,   0) + NVL(B.SAUAMT,     0) + NVL(B.IGAMT,    0)  + 
            NVL(B.SOBIAMT,  0) + NVL(B.PARKAMT,   0) + NVL(B.EMPLDAMT,   0) +  /o 2008.03.05 EMPLDAMT  계산 로직이 PKC10801로 옮겨지면서 추가 o/
            NVL(B.CHOLLAMT, 0) + NVL(B.MEDDEDAMT, 0) + NVL(B.EDUDEDAMT,  0) + 
            NVL(B.DEDAMT1,  0) + NVL(B.DEDAMT2,   0) + NVL(B.DEDAMT3,    0) + NVL(B.DEDAMT4,  0) + NVL(B.DEDAMT5,  0) + 
            NVL(B.BONDEDAMT,0) + NVL(B.SAVEAMT1,  0) + NVL(B.SAVEAMT2,   0) + NVL(B.SAVEAMT3, 0) + 
            NVL(B.HSAMT,    0) + NVL(B.FBAMT,     0) + NVL(B.NBAMT,      0) + NVL(B.SACORPAMT,0) + NVL(B.SABANKAMT,0) + 
            NVL(B.SANGAMT,  0) + NVL(B.LOANAMT1,  0) + NVL(B.LOANAMT2,   0) + NVL(B.LOANAMT3,0)+ 
            NVL(B.MEDDAMT,  0) + NVL(B.ANUDAMT,   0) + NVL(B.PAYHOLDAMT, 0) +
            NVL(B.OVMCDED,  0) + NVL(B.SACORPCP,  0) + NVL(B.SABANKCP,   0) 
            ) DEDSUM,
            NVL(B.STANDDED, 0),   NVL(B.SPEDED,    0), NVL(B.ANUDED,     0),
            /o ===========================================================================
             DSA2000  2006.07.18. 지급항목별 1년 총과세 추정치 금액 구하는 SQL 추가....o/
            /o 2014.02.07.hjku. DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0)) 값이 0일때 오류 수정 o/
            /o 2015.01.20 하은영 연봉분할개월수 18 -> 12로 함에 따라서 12로 변경o/
            CASE WHEN DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0)) <> 0
                 THEN     
                     ( NVL(B.FIXPAY,     0)  + NVL(B.QUATERPAY,     0) + NVL(B.HOLIPAY,   0)) / 
                       ( (NVL(B.FIXPAY,  0)  + NVL(B.QUATERPAY,     0) + NVL(B.HOLIPAY,   0)) /
                          DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0))         
                        )  * 12   
                 ELSE 0 END YY_TAXSUM18,        /o NVL(B.FIXPAY,  0) 18개월 분할지급 항목들..o/
            ( NVL(B.MATEAMT,    0)  + NVL(B.PARTAMT,       0)  + NVL(B.LICEAMT,   0)   + NVL(B.CHILDAMT,0)  + NVL(B.BOKJISUPAMT,0) + 
              NVL(B.MCARTAXAMT, 0)  + NVL(B.SPTMAMT,       0)  + NVL(B.OVTMAMT,   0)   + NVL(B.OVMCAMT, 0)  + NVL(B.ODTAXAMT,   0) +
              NVL(B.CHILDEDUAMT,0)  + NVL(B.SELFEDUAMT,    0)  + NVL(B.ITAMT,     0)   +
            ( NVL(B.YUEDUAMT,   0)  - LEAST(NVL(B.YUEDUAMT,0),   TO_NUMBER(:yuedunotax)))+     /o (유치원학자금_과세부분 계산) o/
              NVL(B.TRAINSUPAMT,0)  + NVL(B.LECTSUPAMT,    0)  + NVL(B.EDUSUPAMT, 0)   + NVL(B.AIDAMT1, 0)  +  
              NVL(B.AIDAMT3,    0)  + NVL(B.TAXPAY1,       0)  + Decode(PAYDATE,'201211',NVL(B.LONGSUPAMT,0),0) /o LONGSUPAMT(장기휴가비) 한시적 추가 2012.11.26.. 정문선M 요청 o/
            )      * 12  YY_TAXSUM12,                                                 /o 12개월 분할지급 항목들..  B.AIDAMT3 추가 2006.11.o/ 
              NVL(B.WINTERAMT,  0)  *  4 YY_TAXSUM4 ,                                 /o  4개월 분할지급 항목들..o/ 
            ( NVL(B.TAXPAY2,    0)  + NVL(B.TAXPAY3,       0)  + NVL(B.TAXPAY4,   0)   + NVL(B.YBONAMT,0)   + NVL(B.SBONTAXAMT,0) + 
              NVL(B.SOPAYSUM,   0)  + NVL(B.MEDSUPAMT,     0)  + NVL(B.HOMESUPAMT,0)   + NVL(B.AIDAMT2,0) 
            )      *  1  YY_TAXSUM1 ,                                                 /o 1회성      지급 항목들..o/
            /o 2014.02.07.hjku. DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0)) 값이 0일때 오류 수정 o/
            CASE WHEN DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0)) <> 0  
                 THEN          
                     ( NVL(B.FIXPAY,     0)  + NVL(B.QUATERPAY,     0) + NVL(B.HOLIPAY,   0))  
                       / DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0))   
                 ELSE 0 END  MONTHRATE,   /o NVL(B.FIXPAY,0) 월정,분기,명절 연봉 받는 비율o/
             /o===========================================================================o/
            NVL(B.CHILDDED,     0),                                                   /o 다자녀추가공제. DSA2000  2007.01. ADD o/
            NVL(A.MATEDCNT,     0), NVL(A.FAMIDCNT,0)                                 /o 특별공제액 변경에 따라,DSA2000  2007.09. ADD o/
      FROM  PKMPMAS A, PKMPCALC B, PKCPBAS C  
     WHERE  (b.empno >= :frempno AND b.empno <= :toempno)  
       AND  a.empno = b.empno; */ 
   
     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select NVL(B.EMPNO,'*') ,NVL(B.Paycl,'*') ,REPLACE(NVL(A.JUMINID,'##\
##'),' ','') ,NVL(B.PAYSUM,0) ,NVL(B.TAXPAYSUM,0) ,NVL(B.NOTAXPAYSUM,0) ,NVL\
(B.MEDDAMT,0) ,NVL(B.BASICDED,0) ,NVL(B.MATEDED,0) ,NVL(B.FAMIDED,0) ,NVL(B.\
OBSDED,0) ,NVL(B.SILVERDED,0) ,NVL(B.WOMANDED,0) ,NVL(B.SAVEAMT1,0) ,NVL(B.M\
ATEAMT,0) ,NVL(B.PARTAMT,0) ,NVL(B.CHILDAMT,0) ,NVL(B.SAVEAMT3,0) ,NVL(B.YUE\
DUAMT,0) ,NVL(B.SELFEDUAMT,0) ,NVL(B.SBONAMT,0) ,NVL(B.DEVIDEMON,0) ,(((((((\
((((((((((((((((((((((((((NVL(B.TICKETAMT,0)+NVL(B.NOJOAMT,0))+NVL(B.SAUAMT,\
0))+NVL(B.IGAMT,0))+NVL(B.SOBIAMT,0))+NVL(B.PARKAMT,0))+NVL(B.EMPLDAMT,0))+N\
VL(B.CHOLLAMT,0))+NVL(B.MEDDEDAMT,0))+NVL(B.EDUDEDAMT,0))+NVL(B.DEDAMT1,0))+\
NVL(B.DEDAMT2,0))+NVL(B.DEDAMT3,0))+NVL(B.DEDAMT4,0))+NVL(B.DEDAMT5,0))+NVL(\
B.BONDEDAMT,0))+NVL(B.SAVEAMT1,0))+NVL(B.SAVEAMT2,0))+NVL(B.SAVEAMT3,0))+NVL\
(B.HSAMT,0))+NVL(B.FBAMT,0))+NVL(B.NBAMT,0))+NVL(B.SACORPAMT,0))+NVL(B.SABAN\
KAMT,0))+NVL(B.SANGAMT,0))+NVL(B.LOANAMT1,0))+NVL(B.LOANAMT2,0))+NVL(B.LOANA\
MT3,0))+NVL(B.MEDDAMT,0))+NVL(B.ANUDAMT,0))+");
     sqlbuft((void **)0,
       "NVL(B.PAYHOLDAMT,0))+NVL(B.OVMCDED,0))+NVL(B.SACORPCP,0))+NVL(B.SABA\
NKCP,0)) DEDSUM ,NVL(B.STANDDED,0) ,NVL(B.SPEDED,0) ,NVL(B.ANUDED,0) , case \
 when DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FIXPAY,0))<>0 then ((((NVL(\
B.FIXPAY,0)+NVL(B.QUATERPAY,0))+NVL(B.HOLIPAY,0))/(((NVL(B.FIXPAY,0)+NVL(B.Q\
UATERPAY,0))+NVL(B.HOLIPAY,0))/DECODE(HOLYONLY,'Y',NVL(B.HOLIPAY,0),NVL(B.FI\
XPAY,0))))* 12) else 0  end  YY_TAXSUM18 ,(((((((((((((((((((((NVL(B.MATEAMT\
,0)+NVL(B.PARTAMT,0))+NVL(B.LICEAMT,0))+NVL(B.CHILDAMT,0))+NVL(B.BOKJISUPAMT\
,0))+NVL(B.MCARTAXAMT,0))+NVL(B.SPTMAMT,0))+NVL(B.OVTMAMT,0))+NVL(B.OVMCAMT,\
0))+NVL(B.ODTAXAMT,0))+NVL(B.CHILDEDUAMT,0))+NVL(B.SELFEDUAMT,0))+NVL(B.ITAM\
T,0))+(NVL(B.YUEDUAMT,0)-LEAST(NVL(B.YUEDUAMT,0),TO_NUMBER(:b0))))+NVL(B.TRA\
INSUPAMT,0))+NVL(B.LECTSUPAMT,0))+NVL(B.EDUSUPAMT,0))+NVL(B.AIDAMT1,0))+NVL(\
B.AIDAMT3,0))+NVL(B.TAXPAY1,0))+Decode(PAYDATE,'201211',NVL(B.LONGSUPAMT,0),\
0))* 12) YY_TAXSUM12 ,(NVL(B.WINTERAMT,0)* 4) YY_TAXSUM4 ,(((((((((NVL(B.TAX\
PAY2,0)+NVL(B.TAXPAY3,0))+NVL(B.TAXPAY4,0))+");
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )414;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != 1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor1 Open Error...");
          sprintf(log_buff, "Cursor cursor1 Open Error 2.....");
          Write_batlog(seqno++, log_buff);                       /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 45;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )441;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
     }
   
     rcount = 0;
     while(1)
	     {
          /* EXEC SQL FETCH  cursor1 INTO  
          :empno,       :paycl,       :juminid,    :paysum,     :taxpaysum,  :notaxpaysum,
          :meddamt,     :basicded,    :mateded,    :famided,
          :obsded,      :silverded,   :womanded,   :saveamt1,
          :mateamt,     :partamt,     :childamt,   :saveamt3,    
          :yueduamt,    :selfeduamt,  :sbonamt,    :devidemon,   
          :dedsum,      /o 공제총액 o/
          :standded,    :speded,      :anuded, 
          :yy_taxsum18, :yy_taxsum12, :yy_taxsum4, :yy_taxsum1, :monthrate,
          :childded,    :matedcnt,    :famidcnt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 45;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )456;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)paycl;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)juminid;
          sqlstm.sqhstl[2] = (unsigned long )14;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&paysum;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&taxpaysum;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&notaxpaysum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&meddamt;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&basicded;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&mateded;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&famided;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&obsded;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&silverded;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&womanded;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&saveamt1;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&mateamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&partamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&childamt;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&saveamt3;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&yueduamt;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&selfeduamt;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&sbonamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&devidemon;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&dedsum;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&standded;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&speded;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&anuded;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&yy_taxsum18;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&yy_taxsum12;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&yy_taxsum4;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&yy_taxsum1;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&monthrate;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&childded;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&matedcnt;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&famidcnt;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 45;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )607;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("처리된 작업대상자 : [%d] 명 \n",rcount);
               return;
          }      
          
          if  (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error 1...");
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 45;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )622;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if ((Calc_TaxStep1() == SUCCESS) && 
              (Calc_TaxStep2() == SUCCESS) && 
              (Calc_TaxStep3() == SUCCESS) && 
              (Get_RealPay()   == SUCCESS))
          {
               if(Update_Record() == SUCCESS)
                rcount++;
               else
               {
                /* EXEC SQL CLOSE cursor1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 45;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )637;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                error_quit("작업실패...");
               }
          }
          else
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 45;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )652;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
     }
}

/*****************************************************************************
   연과세급여 추정치를 구하는 함수.
*****************************************************************************/
Calc_TaxStep1()
{
     char buf[3] = "";
     char emp[2] = "";     
     double ybonsuamt = 0; /*2009년 연차 수당 1/3 급여 추정액에 넣기 위한 변수 2009.10.20 */
     
     if  (Get_AccuSums() == FAIL)     /* 전월누계읽기  */
          return(FAIL);
     
     sprintf(emp,"%.1s",empno);
     sprintf(buf,"%.2s",paydate+4);
     
     /* dsa2000  2006.07.18. 지급항목별 1년 총과세 추정치 금액 구하는 SQL 추가로 인한 로직변경 ....
                             단, 6,12월에는 기존 상여월 로직 반영.                                       */
     /*if ((bonusyn[0] == 'Y') || (bonusyn[0] == 'y')) 
     {
         if (devidemon != 0)
      YY_TaxPay = (tmp_taxgross+taxpaysum) / devidemon * 12;   
         else
      YY_TaxPay = (tmp_taxgross+taxpaysum) * 12;
     }
     else  YY_TaxPay = taxpaysum * 12;   */
     
     
     /* 2009년 연차 수당 1/3을 넣는 루틴 2009.10.20 KTH   시작   
          
     
      EXEC SQL
      SELECT nvl(AMT10 ,0)+nvl(AMT11 ,0)+nvl(AMT12 ,0)
       into :ybonsuamt
       FROM YEARAMT2009
      WHERE EMPNO = :empno ;
                    
      if  (sqlca.sqlcode != 0)
           ybonsuamt = 0;       
       */ 
      
    /* 2009년 연차 수당 1/3을 넣는 루틴 2009.10.20 KTH  끝   */       
        
     if ((strcmp(emp,"Q") == 0 )||( strcmp(emp,"P") == 0 )||( strcmp(emp,"J") == 0 ))    /*Q사번은 실적직 계약직으로 총과세금액 * 12로 구함*/
     {
          YY_TaxPay = taxpaysum * 12;
     }  
     else if ( strcmp(buf,"06") == 0 )                                 /*6,12월 은 기존 상여월 계산방식 (연말정산방식) */
     {
          if  (devidemon != 0 )                                           
               YY_TaxPay = (tmp_taxgross+taxpaysum) / devidemon * 12 - yytaxminus;
          else
               YY_TaxPay = (tmp_taxgross+taxpaysum) * 12;
         
   //      if ( strcmp(paydate,"200806") == 0 ) && ( strcmp(empno,"0438") == 0 )  
   //          YY_TaxPay = 277193328;    /*퇴사후 복직에따른 세금임의계산*/
         
     }
     else if ( strcmp(buf,"12") == 0 )     /*6,12월 은 기존 상여월 계산방식 (연말정산방식) 10월은 임시로 처리 ||( strcmp(buf,"11") == 0 )*/
     {
          if  (devidemon != 0 )                     {                      
               YY_TaxPay = (tmp_taxgross+taxpaysum) / devidemon * 12;
               /*printf(" [%s][%f][%f]\n",empno,YY_TaxPay,ybonsuamt);       +ybonsuamt 12월 급여에 추가    */
             }
          else
               YY_TaxPay = (tmp_taxgross+taxpaysum) * 12;
     }
     else
          /* YY_TaxPay = taxpaysum * 12;*/
          YY_TaxPay = yy_taxsum18+yy_taxsum12+yy_taxsum4+yy_taxsum1;/* 지급항목 각 개월수별 합계를 년 총과세 추정치로*/
     /*===========================================================================================*/
     
     /* 2009년 연차 수당 1/3을 넣는 루틴 2009.10.20 KTH   시작  */  
          
     /*
      EXEC SQL
      SELECT nvl(AMT10 ,0)+nvl(AMT11 ,0)+nvl(AMT12 ,0)
       into :ybonsuamt
       FROM YEARAMT2009
      WHERE EMPNO = :empno ;
                    
      if  (sqlca.sqlcode != 0)
           ybonsuamt = 0;       
       
      
     2009년 연차 수당 1/3을 넣는 루틴 2009.10.20 KTH  끝   */    
     
/* 2013년 연차 수당 1/3을 넣는 루틴 2013.10.22 hjku   시작 */
/*2014.06.20.hjku. 세금계산시 IB 수정 조정. 홍원영M 요청*/     
      /* EXEC SQL
      SELECT nvl(AMT ,0)
        into :ybonsuamt
        FROM PKMADDTAX
       WHERE paydate =:paydate
         and gubun ='T'
         and EMPNO = :empno ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 45;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "select nvl(AMT,0) into :b0  from PKMADDTAX where ((pay\
date=:b1 and gubun='T') and EMPNO=:b2)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )667;
      sqlstm.selerr = (unsigned short)0;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&ybonsuamt;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)paydate;
      sqlstm.sqhstl[1] = (unsigned long )7;
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)empno;
      sqlstm.sqhstl[2] = (unsigned long )5;
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqphsv = sqlstm.sqhstv;
      sqlstm.sqphsl = sqlstm.sqhstl;
      sqlstm.sqphss = sqlstm.sqhsts;
      sqlstm.sqpind = sqlstm.sqindv;
      sqlstm.sqpins = sqlstm.sqinds;
      sqlstm.sqparm = sqlstm.sqharm;
      sqlstm.sqparc = sqlstm.sqharc;
      sqlstm.sqpadto = sqlstm.sqadto;
      sqlstm.sqptdso = sqlstm.sqtdso;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    
      if  (sqlca.sqlcode != 0)
           ybonsuamt = 0;    
            
/* 2009년 연차 수당 1/3을 넣는 루틴 2013.10.22 hjku  끝   */ 
     
     YY_TaxPay = floor(YY_TaxPay+ybonsuamt);  /* 2009년 ybonsuamt 연차 수당 1/3을 넣기 2009.10.20 KTH  +ybonsuamt   */    
     /*printf(" [%s][%f][%f]\n",empno,YY_TaxPay,ybonsuamt);                 */
     return(SUCCESS);
}

/****************************************************************************
  Get_AccuSums()  Function.
*****************************************************************************/
Get_AccuSums()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  year[5]   = "";
          char  basedate[7]   = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char buf[3] = "";
     yytaxminus = 0;
     
     sprintf(year,"%.4s",paydate);
     sprintf(buf,"%.2s",paydate+4);
     if  (strcmp(buf,"01") == 0)
     {
          tmp_taxgross   = 0;
          tmp_notaxgross = 0; 
          tmp_intaxsum   = 0;
          tmp_calctaxsum = 0;
          return(SUCCESS);
     }
     
     /* EXEC SQL
     select   nvl(max(paydate),'#') 
       into  :basedate
       from  pkhphis
      where  empno = :empno and substr(paydate,1,4) = :year 
        and  paydate < :paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(max(paydate),'#') into :b0  from pkhphis whe\
re ((empno=:b1 and substr(paydate,1,4)=:b2) and paydate<:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )694;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)empno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)year;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)paydate;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"급여이력화일 읽기오류1...");
          sprintf(log_buff, "급여이력화일 읽기오류1..."); 
          Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     if  (basedate[0] == '#') 
     {
          tmp_taxgross   = 0;
          tmp_notaxgross = 0; 
          tmp_intaxsum   = 0;
          tmp_calctaxsum = 0;
          return(SUCCESS);
     }


     /* EXEC SQL 
     select   nvl(taxgross,0)-nvl(b.amt,0), nvl(notaxgross,0),  
              nvl(intaxsum,0), nvl(calctaxsum,0)
      into    :tmp_taxgross, :tmp_notaxgross, 
              :tmp_intaxsum, :tmp_calctaxsum
     from    pkhphis a, pkmaddtax b
     where  a.empno     = b.empno(+)
        and  a.empno     = :empno  
        and  a.paydate    = :basedate
        and  b.paydate(+) = :paydate 
		and  b.gubun(+)  = 'T'  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (nvl(taxgross,0)-nvl(b.amt,0)) ,nvl(notaxgross,0\
) ,nvl(intaxsum,0) ,nvl(calctaxsum,0) into :b0,:b1,:b2,:b3  from pkhphis a ,p\
kmaddtax b where ((((a.empno=b.empno(+) and a.empno=:b4) and a.paydate=:b5) a\
nd b.paydate(+)=:b6) and b.gubun(+)='T')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )725;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&tmp_taxgross;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&tmp_notaxgross;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&tmp_intaxsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&tmp_calctaxsum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)empno;
     sqlstm.sqhstl[4] = (unsigned long )5;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)basedate;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)paydate;
     sqlstm.sqhstl[6] = (unsigned long )7;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}




     /*2014.06.20.hjku. 세금계산시 IB 수정 조정. 홍원영M 요청
     EXEC SQL 
     select  nvl(taxgross,0), nvl(notaxgross,0),  
             nvl(intaxsum,0), nvl(calctaxsum,0)
     into    :tmp_taxgross, :tmp_notaxgross, 
             :tmp_intaxsum, :tmp_calctaxsum
     from    pkhphis
     where   empno = :empno  and  paydate = :basedate;
     */     
          
     if  (sqlca.sqlcode != 0)
     {
          printf("basedate : [%s], empno : [%s] \n",basedate, empno);
          print_errmsg(sqlca.sqlcode,"급여이력화일 읽기오류2...");
          sprintf(log_buff, "급여이력화일 읽기오류2..."); 
          Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
      
     /*************** 2008.06. Add : 6월세금 조정을 위한 추가 ***************/
     /* 아래 수당의 1~6월까지의 합계금액을  세금조정을 위하여 연간과세추정치에서 마이너스를 해 줌.  0891 생각.*/
     if (strcmp(paydate,"200806") == 0) /*임시 : */
     {
         /* EXEC SQL /o상반기 영업인센티브n + 특상 + 각종 포상금 세금 제외하기 위해 .o/
         select (sum(nvl(winteramt,0))/2) + (sum(nvl(sbontaxamt,0))/2) +  (sum(nvl(taxpay4,0))/2)
           into :yytaxminus
           from pkhphis
          where empno = :empno  
            and paydate between '200801' and '200805'; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 45;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select (((sum(nvl(winteramt,0))/2)+(sum(nvl(sbontax\
amt,0))/2))+(sum(nvl(taxpay4,0))/2)) into :b0  from pkhphis where (empno=:b1 \
and paydate between '200801' and '200805')";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )768;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&yytaxminus;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)empno;
         sqlstm.sqhstl[1] = (unsigned long )5;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqphsv = sqlstm.sqhstv;
         sqlstm.sqphsl = sqlstm.sqhstl;
         sqlstm.sqphss = sqlstm.sqhsts;
         sqlstm.sqpind = sqlstm.sqindv;
         sqlstm.sqpins = sqlstm.sqinds;
         sqlstm.sqparm = sqlstm.sqharm;
         sqlstm.sqparc = sqlstm.sqharc;
         sqlstm.sqpadto = sqlstm.sqadto;
         sqlstm.sqptdso = sqlstm.sqtdso;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     }
     /***************************************************************************************/
        
     return(SUCCESS);
}

/*****************************************************************************
   연간근로소득금액을 구하는 루틴.
*****************************************************************************/
Calc_TaxStep2()
{
     double  t1, t2, t3, t4, t5 ;
     t1 = t2 = t3 = t4 = t5 = 0;      

     /*2014.02.24.hjku. 월1000만원 이상자 세금계산 로직 적용하기 위해 start*/
     
     YY_TaxPay_Org = YY_TaxPay;     
     
     YY_TaxPay = fmin(YY_TaxPay,120000000);
     
     if (YY_TaxPay < indedbasic)
           t1 = (YY_TaxPay  * indedbrate) / 100;  /* 20091019 kth 총급여액이 500만원 이하인경 400만원 공제로 변경  */
     else  t1 = (indedbasic * indedbrate) / 100;   
     
     if ((YY_TaxPay > indedbasic) && (YY_TaxPay <= indedlimit2))
     {
          t2 = (YY_TaxPay - indedbasic) * indedorate / 100;
     }  
     else if ((YY_TaxPay > indedlimit2) && (YY_TaxPay <= indedlimit3))
     {
          t2 = (indedlimit2 - indedbasic ) * indedorate  / 100;
          t3 = (YY_TaxPay   - indedlimit2) * indedorate2 / 100;
     }  
     else if ((YY_TaxPay > indedlimit3) && (YY_TaxPay <= indedlimit4))
     {
          t2 = (indedlimit2 - indedbasic ) * indedorate  / 100;
          t3 = (indedlimit3 - indedlimit2) * indedorate2 / 100;
          t4 = (YY_TaxPay   - indedlimit3) * indedorate3 / 100;
     }  
     else if (YY_TaxPay > indedlimit4)
     {
          t2 = (indedlimit2 - indedbasic ) * indedorate  / 100;
          t3 = (indedlimit3 - indedlimit2) * indedorate2 / 100;
          t4 = (indedlimit4 - indedlimit3) * indedorate3 / 100;  
          t5 = (YY_TaxPay   - indedlimit4) * indedorate4 / 100;  
     }   
     
     YY_LabInDed = t1 + t2 + t3 + t4 + t5;
     
/*   if (YY_LabInDed > indedlimit)  YY_LabInDed = indedlimit; 2002.01.근로소득공제액 한도 없어짐   */
      
     YY_LabInDed   = floor(YY_LabInDed);
     
     YY_LabNeedDed = YY_LabInDed;
     
     YY_LabInAmt   = YY_TaxPay - YY_LabNeedDed;
     
     if  (YY_LabInAmt < 0)
          YY_LabInAmt = 0;

/* ===== 특별공제액 변경에 따른 추가 dsa2000 2007.09.12. ====================
    ○ 부양가족 2인 이하  110만원 → 110만원 +연간 총급여액의 2.5% 공제
    ○ 부양가족 3인 이상  240만원 → 250만원 +연간 총급여액의 5.0% 공제 + ((총급여액 - 40,000,000)*5.0%) kth 추가 

   ===== 2012.09.12 근로소득 간이세액표 특별공제 상향조정분 반영  ====================
특별공제액 반영(SPEDED)
○ 부양가족 2인 이하  : 210만원 + 연간 총급여액의 4% 공제
○ 부양가족 3인 이상  : 350만원 + 연간 총급여액의 7.0% 공제 + ((총급여액 - 40,000,000)*5.0%)
============================================================================= 
*/          
     if ( (strcmp(paycl, "H11") == 0 ) || (strcmp(paycl, "D91") == 0 ) ) /*계약직, 전문계약직.2011.09. pkc10801.pc에서 가져옴*/
     {
          speded = 0 ; 
          standded = cstdded ;
     }
     else 
     {   
          if  (matedcnt + famidcnt + 1 <= 2 ) 
               speded = specialded2 ;
          else
               speded = specialded3 ;
             
          standded = 0 ;         
     } 

     /*2014.02.21.hjku. 2014년 이전 자료 백업
     if ((matedcnt + famidcnt + 1) <= 2 )  
          //2012.09.12 근로소득 간이세액표 특별공제 상향조정분 반영
          //speded = speded + (YY_TaxPay * 2.5 / 100);
          speded = speded + (YY_TaxPay * 4.0 / 100);
     else if ((YY_TaxPay - 40000000) >  0)
     			//2012.09.12 근로소득 간이세액표 특별공제 상향조정분 반영
          //speded = speded + (YY_TaxPay * 5.0 / 100) + ((YY_TaxPay - 40000000) * 5.0 / 100);
          speded = speded + (YY_TaxPay * 7.0 / 100) + ((YY_TaxPay - 40000000) * 5.0 / 100);
     else 
          //2012.09.12 근로소득 간이세액표 특별공제 상향조정분 반영
          //speded = speded + (YY_TaxPay * 5.0 / 100);      
          speded = speded + (YY_TaxPay * 7.0 / 100);     
     */
     
     /*2014.02.21.hjku. 2014년 이후 특별공제*/
     if ((matedcnt + famidcnt + 1) <= 2 )  /*본인포함+1*/
     {
              if (YY_TaxPay <= 30000000) {
                 speded = speded + (YY_TaxPay * 4.0 / 100);
        }else if((YY_TaxPay >  30000000)&&(YY_TaxPay <=  45000000)) {
                 speded = speded + (YY_TaxPay * 4.0 / 100) - ((YY_TaxPay - 30000000) * 5.0 / 100);        
        }else if((YY_TaxPay >  45000000)&&(YY_TaxPay <=  70000000)) {
                 speded = speded + (YY_TaxPay * 2.0 / 100);
        }else if((YY_TaxPay >  70000000)&&(YY_TaxPay <= 120000000)) {
                 speded = speded + (YY_TaxPay * 1.0 / 100);        
        }
     }else {
              if (YY_TaxPay <= 30000000) {
                 speded = speded + (YY_TaxPay * 7.0 / 100);
        }else if((YY_TaxPay >  30000000)&&(YY_TaxPay <=  45000000)) {
                 speded = speded + (YY_TaxPay * 7.0 / 100) - ((YY_TaxPay - 30000000) * 5.0 / 100);        
        }else if((YY_TaxPay >  45000000)&&(YY_TaxPay <=  70000000)) {
                 speded = speded + (YY_TaxPay * 5.0 / 100);
        }else if((YY_TaxPay >  70000000)&&(YY_TaxPay <= 120000000)) {
                 speded = speded + (YY_TaxPay * 3.0 / 100);        
        }
             
        if ((YY_TaxPay - 40000000) >  0)
        {
             speded = speded + ((YY_TaxPay - 40000000) * 4.0 / 100);
        }
     }
/*============================================================================= */              
     speded = trunc(speded);
  
/* ===========================================================================
  40.10     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가,
                                   계산로직을 직급에 따라 2분화)           
============================================================================= */
/*   YY_InDed = basicded + mateded + famided + obsded + silverded + womanded;*/
     YY_InDed = basicded + mateded + famided + speded + anuded + standded +
                childded;   /*dsa2000  2007.01. Add  */
     
     return(SUCCESS);
     /*****
     YY_InDed = ( basicded + mateded + famided + obsded + silverded + womanded ) * 12;
     
     labinded   =   YY_LabInDed   / 12;
     labneedded =   YY_LabNeedDed   / 12;
     labinamt   =   YY_LabInAmt   / 12;
     inded     =   YY_InDed      / 12;
     *****/
}
/*****************************************************************************
   연과세표준을 구하는 함수.
*****************************************************************************/
Calc_TaxStep3()
{
     double   taxrate;
     double   yearded;
     double   YY_Intax,YY_Intax1,YY_Intax2;
     double   YY_Jutax;
     double   temp_Intax;
     double   temp_Jutax;
     char     emp[2] = "";
     char     buf[3] = "";

/* ===========================================================================
  40.10     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가,
                                   계산로직을 직급에 따라 2분화)           
============================================================================= */
     /*YY_TaxInAmt = YY_TaxPay - YY_LabNeedDed - YY_InDed - stdded;  */
     
     YY_TaxInAmt = YY_TaxPay - YY_LabNeedDed - YY_InDed ;   
     
     if  (YY_TaxInAmt < 0)
          YY_TaxInAmt = 0;
     
     if  (Get_TaxRate(YY_TaxInAmt,&taxrate,&yearded) == FAIL)
          return(FAIL);
                              
     YY_CalcTax  = (YY_TaxInAmt*taxrate/100) - yearded; 
     YY_CalcTax  = floor(YY_CalcTax); 
     
/*2014.01.22.hjku. 2014 근로소득공제 변경..
     if  (YY_CalcTax < taxdedbasic)
     {
          labtaxded = YY_CalcTax * taxdedbrate / 100;
     }  
     else
     {
          labtaxded = (taxdedbasic * taxdedbrate / 100) + ((YY_CalcTax - taxdedbasic) * taxdedorate / 100); 
              
          if  (labtaxded > taxdedlimit)
               labtaxded = taxdedlimit;
     }
*/     
     /*근로소득 세액공제*/
     if        (YY_TaxPay <= 55000000) {
        labtaxdedlimit = 660000;
     }else if  (YY_TaxPay <= 70000000) {
        labtaxdedlimit = fmax(660000-floor((YY_TaxPay-55000000)*1/2),630000);
     }else if  (YY_TaxPay >  70000000) {
        labtaxdedlimit = fmax(630000-floor((YY_TaxPay-70000000)*1/2),taxdedlimit  );
     }
     
     if (YY_CalcTax < taxdedbasic) {
          labtaxded = YY_CalcTax * taxdedbrate / 100;
     }else {
          labtaxded = (taxdedbasic * taxdedbrate / 100) +
                                      (YY_CalcTax - taxdedbasic) * taxdedorate /100 ;
     }
     labtaxded  = fmin(labtaxdedlimit,labtaxded);

     labtaxded  = floor(labtaxded); 
      
     savetaxded = saveamt1*12*proprate/100;
     savetaxded = floor(savetaxded);   
     
     YY_Intax = YY_CalcTax - labtaxded - savetaxded;
     

     if(YY_TaxPay_Org > 120000000) {
        YY_Intax1 = fmax(fmin(YY_TaxPay_Org, 168000000)-120000000,0) * 0.98 * 0.35;
        YY_Intax2 = fmax((YY_TaxPay_Org-168000000),0)  * 0.98 * 0.38;  
     } else {
        YY_Intax1 = 0;
        YY_Intax2 = 0;
     } 
     YY_Intax = YY_Intax + YY_Intax1 + YY_Intax2;

     YY_TaxPay = YY_TaxPay_Org;
          
     /*2014.02.24.hjku. 월1000만원 이상자 세금계산 로직 적용하기 위해 end*/
     
     if  (YY_Intax < 0) 
          YY_Intax = 0;
     
     /* dsa2000  2006.07.18. 지급항목별 1년 총과세 추정치 금액 구하는 SQL 추가로 인한 로직  변경 
     if ((bonusyn[0] == 'Y') || (bonusyn[0] == 'y'))
      intax = floor((((YY_Intax / 12) * devidemon)-tmp_intaxsum) / 10) * 10;
     else
      intax = floor(YY_Intax / 12 / 10) * 10; */  
     sprintf(emp,"%.1s",empno);
     sprintf(buf,"%.2s",paydate+4);
     if  ((strcmp(emp,"Q") == 0)||( strcmp(emp,"P") == 0 )||( strcmp(emp,"J") == 0 ))  /*Q사번은 실적직 계약직으로 총과세금액 * 12로 구함*/
     {
           intax = floor(YY_Intax / 12 / 10) * 10;
     }
     else if ( (strcmp(buf,"06") == 0) || (strcmp(buf,"12") == 0) )  /*6,12월은 기존 상여월 계산방식 (연말정산처럼)*/
     {   
          intax = floor( ( ( (YY_Intax / 12) * devidemon)-tmp_intaxsum) / 10) * 10;
     }
     else 
     {
          /*intax = floor(YY_Intax / 12 / 10) * 10;*/          
/* printf("debug : empno[%s],YY_Intax[%f],YY_Intax1[%f],YY_Intax2[%f],YY_TaxPay[%f],yy_taxsum18[%f],yy_taxsum12[%f],yy_taxsum4[%f],yy_taxsum1[%f],monthrate[%f]\n",
                empno, YY_Intax,YY_Intax1,YY_Intax2, YY_TaxPay, yy_taxsum18, yy_taxsum12, yy_taxsum4, yy_taxsum1, monthrate);  */
                         
          if(YY_Intax<=0) {
               intax = 0;          
          }else {
              /* 2015.01.20 하은영 연봉분할개월수 18 -> 12로 함에 따라서 12로 변경*/
              intax = floor( YY_Intax * ((yy_taxsum18 / YY_TaxPay * monthrate/12) +
                                         (yy_taxsum12 / YY_TaxPay / 12          ) +
                                         (yy_taxsum4  / YY_TaxPay / 4           ) +
                                         (yy_taxsum1  / YY_TaxPay               ) ) / 10) * 10;
         }
     }        
     /*===========================================================================================*/
     
     if  (intax < 0)
          intax = 0;
     
     savetaxded   = floor(savetaxded / 12);
     jutax        = intax * jutaxrate / 100;
     jutax        = floor(jutax / 10) * 10;
     
/* 2013년 세금보정금액 넣는 루틴 2013.10.22 hjku   시작       
*/
     temp_Intax = 0;
     temp_Jutax = 0;
     
      /* EXEC SQL
      SELECT nvl(AMT ,0)
        into :temp_Intax
        FROM PKMADDTAX
       WHERE paydate =:paydate
         and gubun ='I'
         and EMPNO = :empno ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 45;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "select nvl(AMT,0) into :b0  from PKMADDTAX where ((pay\
date=:b1 and gubun='I') and EMPNO=:b2)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )791;
      sqlstm.selerr = (unsigned short)0;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&temp_Intax;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)paydate;
      sqlstm.sqhstl[1] = (unsigned long )7;
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)empno;
      sqlstm.sqhstl[2] = (unsigned long )5;
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqphsv = sqlstm.sqhstv;
      sqlstm.sqphsl = sqlstm.sqhstl;
      sqlstm.sqphss = sqlstm.sqhsts;
      sqlstm.sqpind = sqlstm.sqindv;
      sqlstm.sqpins = sqlstm.sqinds;
      sqlstm.sqparm = sqlstm.sqharm;
      sqlstm.sqparc = sqlstm.sqharc;
      sqlstm.sqpadto = sqlstm.sqadto;
      sqlstm.sqptdso = sqlstm.sqtdso;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    
      if  (sqlca.sqlcode == 0) 
           intax = temp_Intax ;
            
      /* EXEC SQL
      SELECT nvl(AMT ,0)
        into :temp_Jutax
        FROM PKMADDTAX
       WHERE paydate =:paydate
         and gubun ='J'
         and EMPNO = :empno ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 45;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "select nvl(AMT,0) into :b0  from PKMADDTAX where ((pay\
date=:b1 and gubun='J') and EMPNO=:b2)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )818;
      sqlstm.selerr = (unsigned short)0;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&temp_Jutax;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)paydate;
      sqlstm.sqhstl[1] = (unsigned long )7;
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)empno;
      sqlstm.sqhstl[2] = (unsigned long )5;
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqphsv = sqlstm.sqhstv;
      sqlstm.sqphsl = sqlstm.sqhstl;
      sqlstm.sqphss = sqlstm.sqhsts;
      sqlstm.sqpind = sqlstm.sqindv;
      sqlstm.sqpins = sqlstm.sqinds;
      sqlstm.sqparm = sqlstm.sqharm;
      sqlstm.sqparc = sqlstm.sqharc;
      sqlstm.sqpadto = sqlstm.sqadto;
      sqlstm.sqptdso = sqlstm.sqtdso;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    
      if  (sqlca.sqlcode == 0)
           jutax = temp_Jutax;
            
/*2013년 세금보정금액 넣는 루틴 2013.10.22 hjku  끝   */

     return(SUCCESS);

}

/****************************************************************************
  Get_TaxRate  Function.
*****************************************************************************/
Get_TaxRate(double taxlevel, double *taxrate, double *yearded)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          double  t_rate;
          double  t_yearded;
          double  t_taxlevel;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     t_taxlevel = taxlevel;
   
     /* EXEC SQL
     select nvl(taxrate,0), nvl(yearded,0)
       into  :t_rate, :t_yearded
       from  pkcpbas, pkcptax
      where  (:t_taxlevel >= taxpayfr and :t_taxlevel < taxpayto) 
        and  (taxnum = (select ctaxnum from  pkcpbas)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(taxrate,0) ,nvl(yearded,0) into :b0,:b1  fro\
m pkcpbas ,pkcptax where ((:b2>=taxpayfr and :b2<taxpayto) and taxnum=(select\
 ctaxnum  from pkcpbas ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )845;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&t_rate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_yearded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&t_taxlevel;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&t_taxlevel;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"연세율표 읽기오류...");
          sprintf(log_buff, "연세율표 읽기오류....");
          Write_batlog(seqno++, log_buff);           /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
   
     *taxrate = t_rate + 1; /* 2011.02.23 kth 김현순 메니져 요청으로 1% 올림*/
     *yearded = t_yearded;
   
     return(SUCCESS);
}

/*****************************************************************************
  각 사원의 고용보험료를 구해 DB에 반영하는 Procedure.  
*****************************************************************************/
set_empldamt()
{
/* ===========================================================================
    변경사유 : 고용보험료 산정 관련 프로그램 변경/추가 요청 
    변경일자 : 1998.07.10    변경자   : 김승회
    [변경내용] ===>
  1. 기존방식은 프로그램내에서 고용보험료 산정에 계산되는 항목들을 관리.
  2. 고용보험 계산항목테이블(PKCEMTBL)에 등록된 기준에 따라 고용보험를 계산.
 =========================================================================== */
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char    stmpjuminid[8+1];
     /* EXEC SQL END DECLARE SECTION; */ 

   
     char  str[4+1];
     double  mm = 0;
   
     empldamt = 0;
     if  (strcmp(president_empno,empno) != 0)
     {  
          /* EXEC SQL
          SELECT NVL(CONCAT(DECODE( SUBSTR(:juminid,8,1),
             '1','19','2','19','3','20','4','20','19'),
            SUBSTR(:juminid,1,6)), '99999999' )
                         into :stmpjuminid
          FROM    DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 45;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select NVL(CONCAT(DECODE(SUBSTR(:b0,8,1),'1','19',\
'2','19','3','20','4','20','19'),SUBSTR(:b0,1,6)),'99999999') into :b2  from \
DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )876;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)juminid;
          sqlstm.sqhstl[0] = (unsigned long )14;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)juminid;
          sqlstm.sqhstl[1] = (unsigned long )14;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)stmpjuminid;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          if  (sqlca.sqlcode != 0)
          {
               printf("[사번] : %s 의  [주민등록번호] : %s \n",empno, juminid);
               sprintf(log_buff, "[사번] : %s 의  [주민등록번호] : %s 확인요망 \n",empno, juminid);
               Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
               return(FAIL);
          }
          
          sprintf(str,"%.4s",stmpjuminid);
          mm = atoi(str) * 12;
          sprintf(str,"%.2s",stmpjuminid+4);
          mm = atoi(str) + mm;
          
     /* ===============================================================================
              Version  date(yy.mm.dd)  programmer  description             relevant doc.no
           30.00     1998.12.29     김승회     급여지급 항목변경        하나로인사재개발
     => 급여지급항목변경에 따른 고용보험료 산정대상항목을 추가
        =============================================================================== */
          if  (mm > basemm) 
          {
          
               /* EXEC SQL
               select floor(
                        nvl(
                           (
                           decode(upper(nvl(basicamtyn,' ')),'Y',basicamt+bbasicamt,0) + 
                           decode(upper(nvl(dutyamtyn,' ')),'Y',dutyamt+bdutyamt,0) +
                           decode(upper(nvl(bonusamtyn,' ')),'Y',bonusamt,0) +
                           decode(upper(nvl(trainamtyn,' ')),'Y',trainamt,0) + 
                           decode(upper(nvl(winteramtyn,' ')),'Y',winteramt,0) +
                           decode(upper(nvl(homesupamtyn,' ')),'Y',homesupamt,0) +
                           decode(upper(nvl(fixpayyn,' ')),'Y',fixpay+bfixpay,0)   + 
                           decode(upper(nvl(quaterpayyn,' ')),'Y',quaterpay,0)   + 
                           decode(upper(nvl(holipayyn,' ')),'Y',holipay,0)   + 
                           decode(upper(nvl(roleamtyn,' ')),'Y',roleamt,0)   + 
                           decode(upper(nvl(ybonamtyn,' ')),'Y',ybonamt,0)   + 
                           decode(upper(nvl(sbonamtyn,' ')),'Y',sbonamt,0)   + 
                           decode(upper(nvl(longsupamtyn,' ')),'Y',longsupamt,0)   + 
                           decode(upper(nvl(mbonamtyn,' ')),'Y',mbonamt,0)   + 
                           decode(upper(nvl(mateamtyn,' ')),'Y',mateamt,0)   + 
                           decode(upper(nvl(partamtyn,' ')),'Y',partamt,0)   + 
                           decode(upper(nvl(childamtyn,' ')),'Y',childamt,0)   + 
                           decode(upper(nvl(liceamtyn,' ')),'Y',liceamt,0)   + 
                           decode(upper(nvl(ovtmamtyn,' ')),'Y',ovtmamt,0)   + 
                           decode(upper(nvl(sptmamtyn,' ')),'Y',sptmamt,0)   + 
                           decode(upper(nvl(aidamt1yn,' ')),'Y',aidamt1,0)   + 
                           decode(upper(nvl(aidamt2yn,' ')),'Y',aidamt2,0)   + 
                           decode(upper(nvl(aidamt3yn,' ')),'Y',aidamt3,0)   + 
                           decode(upper(nvl(mcaramtyn,' ')),'Y',mcaramt,0)   + 
                           decode(upper(nvl(yueduamtyn,' ')),'Y',yueduamt,0)   + 
                           decode(upper(nvl(selfeduamtyn,' ')),'Y',selfeduamt,0)   + 
                           decode(upper(nvl(odamtyn,' ')),'Y',decode(odamt,0,0,:avgodamt),0) + 
                           decode(upper(nvl(drvliceamtyn,' ')),'Y',drvliceamt,0)   + 
                           decode(upper(nvl(lectsupamtyn,' ')),'Y',lectsupamt,0)   + 
                           decode(upper(nvl(edusupamtyn,' ')),'Y',edusupamt,0)   + 
                           decode(upper(nvl(bokjisupamtyn,' ')),'Y',bokjisupamt,0) + 
                           decode(upper(nvl(medsupamtyn,' ')),'Y',medsupamt,0)   + 
                           /o
                           decode(upper(nvl(supamt1yn,' ')),'Y',supamt1,0)   + 
                           decode(upper(nvl(supamt2yn,' ')),'Y',supamt2,0)   + 
                           decode(upper(nvl(supamt3yn,' ')),'Y',supamt3,0)   + o/
                           decode(upper(nvl(ovmcamtyn,' ')),'Y',ovmcamt,0)   + 
                           decode(upper(nvl(childeduamtyn,' ')),'Y',childeduamt,0) + 
                           decode(upper(nvl(taxpayyn,' ')),'Y',taxpay,0)    + 
                           decode(upper(nvl(notaxpayyn,' ')),'Y',notaxpay,0)   + 
                           /o
                           decode(upper(nvl(taxbonusyn,' ')),'Y',taxbonus,0)   + o/
                           decode(upper(nvl(sopayyn,' ')),'Y',sopaysum,0)    +
                           decode(upper(nvl(itamtyn,' ')),'Y', itamt,0)            /o정보통신수당 고용보험 계산시 포함 dsa2000 2005.01.o/
                           /o
                           decode(upper(nvl(sobonyn,' ')),'Y',sobonsum,0)o/
                           )
                           ,0) * :empldrate
                           )
                 into  :empldamt
                 from  pkmpcalc, pkcemtbl
                where  empno = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 45;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlbuft((void **)0,
                 "select floor((nvl((((((((((((((((((((((((((((((((((((((dec\
ode(upper(nvl(basicamtyn,' ')),'Y',(basicamt+bbasicamt),0)+decode(upper(nvl(\
dutyamtyn,' ')),'Y',(dutyamt+bdutyamt),0))+decode(upper(nvl(bonusamtyn,' '))\
,'Y',bonusamt,0))+decode(upper(nvl(trainamtyn,' ')),'Y',trainamt,0))+decode(\
upper(nvl(winteramtyn,' ')),'Y',winteramt,0))+decode(upper(nvl(homesupamtyn,\
' ')),'Y',homesupamt,0))+decode(upper(nvl(fixpayyn,' ')),'Y',(fixpay+bfixpay\
),0))+decode(upper(nvl(quaterpayyn,' ')),'Y',quaterpay,0))+decode(upper(nvl(\
holipayyn,' ')),'Y',holipay,0))+decode(upper(nvl(roleamtyn,' ')),'Y',roleamt\
,0))+decode(upper(nvl(ybonamtyn,' ')),'Y',ybonamt,0))+decode(upper(nvl(sbona\
mtyn,' ')),'Y',sbonamt,0))+decode(upper(nvl(longsupamtyn,' ')),'Y',longsupam\
t,0))+decode(upper(nvl(mbonamtyn,' ')),'Y',mbonamt,0))+decode(upper(nvl(mate\
amtyn,' ')),'Y',mateamt,0))+decode(upper(nvl(partamtyn,' ')),'Y',partamt,0))\
+decode(upper(nvl(childamtyn,' ')),'Y',childamt,0))+decode(upper(nvl(liceamt\
yn,' ')),'Y',liceamt,0))+decode(upper(nvl(ovtmamtyn,' ");
               sqlbuft((void **)0,
                 "')),'Y',ovtmamt,0))+decode(upper(nvl(sptmamtyn,' ')),'Y',s\
ptmamt,0))+decode(upper(nvl(aidamt1yn,' ')),'Y',aidamt1,0))+decode(upper(nvl\
(aidamt2yn,' ')),'Y',aidamt2,0))+decode(upper(nvl(aidamt3yn,' ')),'Y',aidamt\
3,0))+decode(upper(nvl(mcaramtyn,' ')),'Y',mcaramt,0))+decode(upper(nvl(yued\
uamtyn,' ')),'Y',yueduamt,0))+decode(upper(nvl(selfeduamtyn,' ')),'Y',selfed\
uamt,0))+decode(upper(nvl(odamtyn,' ')),'Y',decode(odamt,0,0,:b0),0))+decode\
(upper(nvl(drvliceamtyn,' ')),'Y',drvliceamt,0))+decode(upper(nvl(lectsupamt\
yn,' ')),'Y',lectsupamt,0))+decode(upper(nvl(edusupamtyn,' ')),'Y',edusupamt\
,0))+decode(upper(nvl(bokjisupamtyn,' ')),'Y',bokjisupamt,0))+decode(upper(n\
vl(medsupamtyn,' ')),'Y',medsupamt,0))+decode(upper(nvl(ovmcamtyn,' ')),'Y',\
ovmcamt,0))+decode(upper(nvl(childeduamtyn,' ')),'Y',childeduamt,0))+decode(\
upper(nvl(taxpayyn,' ')),'Y',taxpay,0))+decode(upper(nvl(notaxpayyn,' ')),'Y\
',notaxpay,0))+decode(upper(nvl(sopayyn,' ')),'Y',sopaysum,0))+decode(upper(\
nvl(itamtyn,' ')),'Y',itamt,0)),0)* :b1)) into :b2  fr");
               sqlstm.stmt = "om pkmpcalc ,pkcemtbl where empno=:b3";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )903;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&avgodamt;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&empldrate;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&empldamt;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)empno;
               sqlstm.sqhstl[3] = (unsigned long )5;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqphsv = sqlstm.sqhstv;
               sqlstm.sqphsl = sqlstm.sqhstl;
               sqlstm.sqphss = sqlstm.sqhsts;
               sqlstm.sqpind = sqlstm.sqindv;
               sqlstm.sqpins = sqlstm.sqinds;
               sqlstm.sqparm = sqlstm.sqharm;
               sqlstm.sqparc = sqlstm.sqharc;
               sqlstm.sqpadto = sqlstm.sqadto;
               sqlstm.sqptdso = sqlstm.sqtdso;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                 /*infra       and   paycl <> '0Z' ; */
                 
               if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
               {
                    printf("[사번] : %s 의  고용보험료 구하기 에러... \n",empno);
                    print_errmsg(sqlca.sqlcode,"고용보험료 계산오류...");
                    sprintf(log_buff, "고용보험료 계산오류..."); 
                    Write_batlog(seqno++, log_buff);            /*dsa2000 Rexec 대체*/
                    return(FAIL);
               }     
          }
     }
     return(SUCCESS);
}


/*****************************************************************************
               실지급액을 계산하는 루틴. 
*****************************************************************************/
Get_RealPay()
{  
     char buf[3] = "";
     
     taxgross   = tmp_taxgross   + taxpaysum;
     notaxgross = tmp_notaxgross + notaxpaysum;
     intaxsum   = tmp_intaxsum   + intax;
     calctaxsum = 0; /*tmp_calctaxsum + floor(calctax/12);  Dsa2000    2003.02.18     0 으로 Setting*/  
     
     /* dsa2000 2007.02. Add  : 명절연봉만 따로 나가는때에 고용보험료 0원으로 처리.*/
     /*2008.03.05 pkc0801.pc 로 옮김으로 삭제
     if (strcmp(holyonly, "Y") == 0 )
     {  empldamt = 0;  }
     else
     { if (set_empldamt() != SUCCESS) 
      return(FAIL);    }  */
     
/*printf("debug[before]=%f\n",dedsum);     */
     dedsum     = dedsum  + intax + jutax + savetaxded;
     realpay    = paysum - dedsum;
     
/*printf("debug[after] : dedsum=%f,intax=%f,jutax=%f,savetaxded=%f,\n",dedsum,intax,jutax,savetaxded);          */
   
     return(SUCCESS);
}

/***************************************************************************
  Update_Record()  Function.
****************************************************************************/
Update_Record()
{
     labinded   = YY_LabInDed;
     labneedded   = YY_LabNeedDed;
     labinamt  = YY_LabInAmt;
     inded   = YY_InDed;
     taxinamt  = YY_TaxInAmt;
     calctax   = YY_CalcTax;
     
     /* EXEC SQL 
     update  pkmpcalc
        set  
             /oempldamt   = :empldamt, 2008.03.05 pkc0801.pc로 옮김으로 삭제o/
             labinded     = :labinded, 
             labneedded   = :labneedded,
             labinamt     = :labinamt, 
             inded        = :inded, 
             taxinamt     = :taxinamt, 
             calctax      = :calctax,
             labtaxded    = :labtaxded, 
             savetaxded   = :savetaxded,
             intax        = :intax, 
             jutax        = :jutax, 
             dedsum       = :dedsum,
             realpay      = :realpay, 
             taxgross     = :taxgross,
             notaxgross   = :notaxgross, 
             intaxsum     = :intaxsum,
             calctaxsum   = :calctaxsum, 
             writeman     = :writeman,
             writetime    = to_char(sysdate,'YYYYMMDDHH24MISSD'),
             speded       = :speded,     /o특별공제액 변경에 따른 추가 dsa2000 2007.09.12o/
             standded     = :standded     
      where  empno = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set labinded=:b0,labneedded=:b1,labina\
mt=:b2,inded=:b3,taxinamt=:b4,calctax=:b5,labtaxded=:b6,savetaxded=:b7,intax=\
:b8,jutax=:b9,dedsum=:b10,realpay=:b11,taxgross=:b12,notaxgross=:b13,intaxsum\
=:b14,calctaxsum=:b15,writeman=:b16,writetime=to_char(sysdate,'YYYYMMDDHH24MI\
SSD'),speded=:b17,standded=:b18 where empno=:b19";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )934;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&labinded;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&labneedded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&labinamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&inded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&taxinamt;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&calctax;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&labtaxded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&savetaxded;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&intax;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&jutax;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&dedsum;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&realpay;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&taxgross;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&notaxgross;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&intaxsum;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&calctaxsum;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)writeman;
     sqlstm.sqhstl[16] = (unsigned long )5;
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&speded;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&standded;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)empno;
     sqlstm.sqhstl[19] = (unsigned long )5;
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


      
     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류...");
          sprintf(log_buff, "월급여화일 쓰기오류...SQLCODE[%s]\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);            /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  기준월 + m 개월한 날짜를 구하는 함수.  
 *****************************************************************************/
void add_months(char *p_date,int i,char *result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_date[6+1]  = "";
          char  retdate[6+1] = "";
          int   n;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t_date,"%.6s",p_date);
     
     n = i;
     /* exec sql 
     select to_char(add_months(to_date(:t_date,'YYYYMM'),:n),'YYYYMM')
     into :retdate
     from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(add_months(to_date(:b0,'YYYYMM'),:b1),'Y\
YYYMM') into :b2  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1029;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_date;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&n;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)retdate;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     retdate[6] = '\0';
     sprintf(result,"%s",retdate);
}

/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1056;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)log_rundate;
     sqlstm.sqhstl[0] = (unsigned long )16;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)log_progid;
     sqlstm.sqhstl[1] = (unsigned long )16;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&seqno;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)log_writeman;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)message;
     sqlstm.sqhstl[4] = (unsigned long )0;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     {  
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);   
          return(FAIL);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 45;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1097;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
                                                                            