
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
    "pkc10801.pc"
};


static unsigned int sqlctx = 150179;


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
   unsigned char  *sqhstv[22];
   unsigned long  sqhstl[22];
            int   sqhsts[22];
            short *sqindv[22];
            int   sqinds[22];
   unsigned long  sqharm[22];
   unsigned long  *sqharc[22];
   unsigned short  sqadto[22];
   unsigned short  sqtdso[22];
} sqlstm = {12,22};

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

 static char *sq0010 = 
"select nvl(b.empno,'*') ,replace(nvl(a.juminid,'####'),' ','')  from pkmpma\
s a ,pkmpcalc b where ((b.empno>=substr(:b0,1,4) and b.empno<=substr(:b1,1,4)\
) and a.empno=b.empno)           ";

 static char *sq0023 = 
"select A.EMPNO ,NVL(A.PAYCALCKIND,' ') ,NVL(A.DUCALCKIND,' ') ,NVL(A.BPAYCA\
LCKIND,' ') ,NVL(A.BDUCALCKIND,' ') ,NVL(CBASICSUM,0) ,NVL(CINFOSUM,0) ,NVL(C\
DUTYSUM,0) ,NVL(SOBASICAMT,0) ,NVL(SOINFOAMT,0) ,NVL(SODUTYAMT,0)  from PKHPD\
AY A ,PKMPCALC B where ((A.PAYDATE=:b0 and A.EMPNO=B.EMPNO) and (A.EMPNO>=sub\
str(:b1,1,4) and B.EMPNO<=substr(:b2,1,4)))           ";

 static char *sq0025 = 
"select NVL(A.MATEDCNT,0) ,NVL(A.FAMIDCNT,0) ,NVL(A.OBSDCNT,0) ,NVL(A.SILVER\
DCNT,0) ,NVL(A.WOMANDCNT,0) ,NVL(A.MATECNT,0) ,NVL(A.PARENTCNT,0) ,NVL(A.CHIL\
DCNT,0) ,NVL(B.ODAMT,0) ,B.EMPNO ,NVL(B.PAYCL,' ') ,NVL(CHILDDEDCNT,0) ,NVL(A\
.MATEAMT,0) ,NVL(A.PARTAMT,0) ,NVL(A.CHILDAMT,0)  from PKMPMAS A ,PKMPCALC B \
where (A.EMPNO=B.EMPNO and (B.EMPNO>=substr(:b0,1,4) and B.EMPNO<=substr(:b1,\
1,4)))           ";

 static char *sq0028 = 
"select a.empno ,upper(nvl(nojoyn,' '))  from pkmpcalc a ,pkmpmas b where ((\
upper(nvl(a.payyn,' '))='Y' and (a.empno>=substr(:b0,1,4) and a.empno<=substr\
(:b1,1,4))) and a.empno=b.empno) order by a.empno            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,373,0,0,0,0,0,1,0,
20,0,0,2,101,0,4,442,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,
55,0,0,3,116,0,4,490,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
86,0,0,4,40,0,4,514,0,0,1,0,0,1,0,2,97,0,0,
105,0,0,5,132,0,4,555,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,97,0,0,
132,0,0,6,73,0,4,582,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
155,0,0,7,99,0,5,608,0,0,3,3,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,
182,0,0,8,92,0,4,623,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
209,0,0,9,58,0,5,636,0,0,2,2,0,1,0,1,4,0,0,1,97,0,0,
232,0,0,10,185,0,9,660,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
255,0,0,10,0,0,15,667,0,0,0,0,0,1,0,
270,0,0,10,0,0,13,674,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
293,0,0,10,0,0,15,679,0,0,0,0,0,1,0,
308,0,0,10,0,0,15,687,0,0,0,0,0,1,0,
323,0,0,10,0,0,15,695,0,0,0,0,0,1,0,
338,0,0,11,95,0,4,711,0,0,3,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,
365,0,0,12,40,0,4,724,0,0,1,1,0,1,0,1,97,0,0,
384,0,0,13,68,0,5,742,0,0,0,0,0,1,0,
399,0,0,14,80,0,2,764,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
422,0,0,15,488,0,4,826,0,0,22,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,4,0,0,
525,0,0,16,89,0,4,852,0,0,3,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,
552,0,0,17,67,0,5,870,0,0,0,0,0,1,0,
567,0,0,18,2451,0,3,888,0,0,4,4,0,1,0,1,97,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
598,0,0,19,69,0,5,968,0,0,0,0,0,1,0,
613,0,0,20,242,0,5,980,0,0,1,1,0,1,0,1,97,0,0,
632,0,0,21,212,0,5,1003,0,0,1,1,0,1,0,1,97,0,0,
651,0,0,22,98,0,4,1023,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
678,0,0,23,360,0,9,1063,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
705,0,0,23,0,0,15,1070,0,0,0,0,0,1,0,
720,0,0,23,0,0,13,1078,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
779,0,0,23,0,0,15,1085,0,0,0,0,0,1,0,
794,0,0,23,0,0,15,1095,0,0,0,0,0,1,0,
809,0,0,23,0,0,15,1101,0,0,0,0,0,1,0,
824,0,0,24,165,0,5,1113,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
879,0,0,25,400,0,9,1154,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
902,0,0,25,0,0,15,1160,0,0,0,0,0,1,0,
917,0,0,25,0,0,13,1166,0,0,15,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,
992,0,0,25,0,0,15,1176,0,0,0,0,0,1,0,
1007,0,0,25,0,0,15,1183,0,0,0,0,0,1,0,
1022,0,0,25,0,0,15,1189,0,0,0,0,0,1,0,
1037,0,0,26,72,0,5,1257,0,0,1,1,0,1,0,1,97,0,0,
1056,0,0,27,191,0,5,1279,0,0,11,11,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
1115,0,0,28,213,0,9,1329,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1138,0,0,28,0,0,15,1335,0,0,0,0,0,1,0,
1153,0,0,28,0,0,13,1341,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1176,0,0,28,0,0,15,1345,0,0,0,0,0,1,0,
1191,0,0,28,0,0,15,1352,0,0,0,0,0,1,0,
1206,0,0,29,189,0,4,1368,0,0,5,3,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
1241,0,0,28,0,0,15,1382,0,0,0,0,0,1,0,
1256,0,0,30,90,0,5,1397,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
1287,0,0,28,0,0,15,1409,0,0,0,0,0,1,0,
1302,0,0,31,73,0,4,1429,0,0,2,1,0,1,0,1,97,0,0,2,3,0,0,
1325,0,0,32,606,0,5,1548,0,0,10,10,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1380,0,0,33,692,0,5,1599,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1403,0,0,34,163,0,5,1627,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1426,0,0,35,662,0,5,1650,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1449,0,0,36,141,0,5,1688,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1472,0,0,37,122,0,5,1707,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1495,0,0,38,59,0,4,1728,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1518,0,0,39,121,0,5,1741,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1549,0,0,40,439,0,5,1756,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1572,0,0,41,50,0,3,1788,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1613,0,0,42,0,0,29,1798,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKC10801C(급여생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.02.16

Update Contents
Version  date(yy.mm.dd) programmer      description     relevant doc.no
   1.00     1997.02.16    김승회         최초개발본      설계명세서
   2.00     1997.12.08    이랑교         하나로전용      설계명세서
   3.00     1998.09.04    이랑교         석식대공제금,체육활동지원금 항목추가
  30.00     1998.12.29    김승회         계산로직변경    하나로인사재개발
  30.01     1999.03.15    김승회         재무ERP관련 급여항목 추가
  30.02     1999.04.10    이랑교         재무erp관련 급여항목추가 lectsupamt,edusupamt
  30.03     1999.05.18    이랑교         재무erp관련 급여항목추가 hsorgamt,hsintamt
  30.04     1999.07.15    이랑교         재무erp관련 급여항목추가 lectsupamt3,lectsupamt4
  30.05     1999.11.23    이랑교         독립비상임이사(직급,직위 '10') = 월정급만 지급하고
                  나머지 제수당은 지급하지 않습니다.
  31.00     2002.02.18    유효성         소득세법 개정(컬럼 anuded, standded 추가,
                                         계산로직을 직급에 따라 2분화)           
  32.00     2002.08.19    유효성         전문계약직(J사번) 신설에 따른 반영
  33.00     2003.02.18    강륜종         세법 변경에 따른 특별공제액 변경 3인이상 180만원 => 240만원
  34.00     2004.02.24    강륜종         Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.  
  35.00     2004.05.10.   강륜종(Dsa2000)특별공제액 DB에서 읽도록 SPECIALDED2, SPECIALDED3 추가  
  36.00     2004.06.18    강륜종(dsa2000)직급코드값 변동에 따른 수정.  
                                   PAYCL코드 10이 사외이사에서 부장으로 변경.   사외이사는 0Z로 코드 변경.       
  37.00     2004.11.      강륜종(dsa2000)Rexec대체 서비스를 위한 수정적업.                                   
  38.00     2005.01.10    dsa2000        월차수당 폐지 및 정보통신수당(ITAMT) 신설
                                         유치원학자금 비과세 처리루틴 추가.
  38.01     2005.01.27.   dsa2000        J사번 사우회비(sauamt) 공제 가능토록 PAYCL='C1' 제외.                                         
  39.00     2007.01       dsa2000        다자녀추가공제  
  40.00     2007.04.18    유재승(D022)   가족수당 항목별(비속,존속,배우자) 일할계산값을 반영 생성하기 위한 필드추가에 따른 수정.
============================================================================= */

#include <string.h> 
#include <stdio.h>
#include <stdlib.h>
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

void  Generate_Records();
void  Get_Criteria();
void  Gen_EmpRecord();
void  Extract_DayPayEmp();
void  Calc_BasicGongje();
void  Update_Record3();
void  CalMidEnt_DayPay();
void  Process_Calc();
void  Get_Pays();
void  Get_DedSum();
void  print_errmsg(int errcode, char *errmsg);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     /* 당월급여내역  (PKMPCALC) 참조 변수                           */
     char    empno[5]        = "";   /* 사   번      */
     char    korname[13]     = "";   /* 성   명      */
     char    juminid[13+1]   = "";   /* 주민등록번호   */  
/*     char    paydate[7]      = "";    급 여 지 급 월       */
     char    paydate[9]      = "";   /* 급 여 지 급 일 자    */
     char    paynum[3]       = "";   /* 급  호  차  수       */
     /* infra  char  paycl[3]  = "";    직   급      */  
     char    paycl[4]        = "";   /* 직   급      */
     char    payra[3+1]      = "";
     float   paygr;                  /* 호   봉      */  
     char    pstate[3]       = "";   /* 인  사  상  태       */
     char    orgnum[4]       = "";   /* 조  직  차  수       */  
     char    deptcode[7]     = "";   /* 부  서  코  드       */
     char    bldcode[3]      = "";   /* 근 무 지 코 드       */
     char    payyn[2]        = "";   /* 급여지급여부         */
     char    paycalckind[2]  = "";   /* 당월급여계산방식     */
     char    ducalckind[2]   = "";   /* 당월직무계산방식     */
     char    bpaycalckind[2] = "";   /* 전월급여계산방식     */
     char    bducalckind[2]  = "";   /* 전월급여계산방식    */
     char    paybank[4]      = "";   /* 급여지급은행*        2017.09.05 eyha size 변경 */  
     char    payacnt[21]     = "";   /* 급여통장번호*        */
     double  basicamt;               /* 당월  기본급         */
     double  infoamt;                /* 당월정보수당         */
     double  dutyamt;                /* 당월직무수당         */
     double  promamt;                /* 업무추진비           */
     double  bbasicamt;              /* 전월기본급소급액     */
     double  binfoamt;               /* 전월정보수당소급액   */  
     double  bdutyamt;               /* 전월직무수당소급액   */
     double  bonusamt;               /* 정기상여금           */  
     double  devidemon;              /* 상여금분할월수       */ 
     double  tmp_anudamt;            /* 국민연금 누계액      */ 
     
     double  incentamt;              /* 능률제고수당          */
     double  trainamt;               /* 체력단련비           */
     double  winteramt;              /* 월동보조비  => 영업인센티브로 변경 2006.04.19.*/
     double  mbonamt;                /* 월차수당(*)          */
     double  ybonamt;                /* 연차수당(*)    */
     double  sbonamt;                /* 특별상여금(총액)     */
     double  sbontaxamt;             /* 특별상여금(과세)     */
     double  mateamt;                /* 가족수당(배우자)     */
     double  partamt;                /* 가족수당(존속)       */
     double  childamt;               /* 가족수당(비속)       */
     double  liceamt;                /* 자격수당          */ 
     double  ovtmamt;                /* 초과근무수당          */
     double  sptmamt;                /* 특별근무수당          */
     double  aidamt1;                /* 기타수당1          */
     double  aidamt2;                /* 기타수당2          */
     double  aidamt3;                /* 기타수당3          */
     double  mcaramt;                /* 식대교통비           */
     double  mcartaxamt;             /* 식대교통비(과세)  */
     double  yueduamt;               /* 학자금(회사)      */
     double  selfeduamt;             /* 학자금(복지기금)     */
     double  odamt;                  /* 운전지원금(총액)     */
     double  odtaxamt;               /* 운전지원금(과세)     */
     double  drvliceamt;             /* 운전면허지원금  */
     double  bokjisupamt;            /* 복지연금          */
     double  lectsupamt;             /* 사내강사료          */
     double  edusupamt;              /* 교육비지원금          */
     double  medsupamt;              /* 의료비지원금          */
     double  homesupamt;             /* 귀향지원금   */
     double  longsupamt;             /* 장기휴가비   */
     double  supamt1;                /* 기타지원금1(삭제)  */
     double  supamt2;                /* 기타지원금2(삭제)    */
     double  supamt3;                /* 기타지원금3(삭제)  */
     double  basicded;               /* 기초공제액          */
     double  mateded;                /* 배우자공제액          */
     double  famided;                /* 부양자공제액          */
     double  obsded;                 /* 장애자공제액          */
     double  silverded;              /* 경로우대장애액       */
     double  womanded;               /* 부녀자공제액         */
     double  eduded;                 /* 자녀양육비공제액     */
     double  speded;                 /* 특별공제액           */  
     double  standded;               /* 표준공제액           */  
     double  fewded1;                /* 소수부양자공제액1     */
     double  fewded2;                /* 소수부양자공제액2     */
     double  etcded1;                /* 기타공제액1          */
     double  etcded2;                /* 기타공제액2          */
     double  etcded3;                /* 기타공제액3          */
     double  taxpay;                 /* 과세급여          */
     double  notaxpay;               /* 비과세급여           */
     double  taxbonus;               /* 과세상여(삭제)       */ 
     double  notaxbonus;             /* 비과세상여          */
     double  paysum;                 /* 지급총액          */
     double  taxpaysum;              /* 과세급여총액          */
     double  notaxpaysum;            /* 비과세급여총액       */
     double  saveamt1;               /* 저축금1(재형저축)    */
     double  saveamt2;               /* 저축금2(장기저축)    */
     double  saveamt3;               /* 복지연금          */
     double  saveaddamt;             /* 출연기금          */  
     double  meddamt;                /* 피보험자의료보험     */
     double  empldamt;               /* 고용보험료          */
     double  anudamt;                /* 국민연금본인각출료   */
     double  hsamt;                  /* 주택자금대촐          */
     double  fbamt;                  /* 외환복지대촐          */
     double  nbamt;                  /* 국제화재대출          */
     double  sacorpamt;              /* 사주회사대출이자      */
     double  sabankamt;              /* 사주은행대출이자     */     
     double  sacorpcp;              /* 사주회사대출원금    20110919 kth 원금 상환시작  */
     double  sabankcp;              /* 사주은행대출원금    20110919 kth 원금 상환시작 */          
     double  sangamt;                /* 상조회대촐          */
     double  loanamt1;               /* 기타대출1          */
     double  loanamt2;               /* 기타대출2          */
     double  loanamt3;               /* 사내근로복지기금대출_2012.07.변경사용. */
     double  ticketamt;              /* 사용식권금액   */
     double  nojoamt;                /* 노조회비공제금       */
     double  sauamt;                 /* 사우회비공제금       */
     double  igamt;                  /* IG회비공제금         */
     double  sobiamt;                /* 소비조합할부금       */
     double  parkamt;                /* 주차비공제금         */
     double  chollamt;               /* 천리안사용료          */
     double  meddedamt;              /* 의료비가불공제금     */
     double  edudedamt;              /* 교육비공제금          */
     double  dedamt1;                /* 기타공제1          */
     double  dedamt2;                /* 기타공제2          */
     double  dedamt3;                /* 기타공제3          */
     double  dedamt4;                /* 기타공제4          */
     double  dedamt5;                /* 기금조성공제          */
     double  bondedamt;              /* 기지급상여금   */
     double  labinded;               /* 근로소득공제액       */
     double  labneedded;             /* 근로소득필요경비계   */
     double  labinamt;               /* 근로소득금액         */
     double  inded;                  /* 소득공제액          */
     double  taxinamt;               /* 과세표준금액          */
     double  calctax;                /* 산촐세액             */  
     double  labtaxded;              /* 근로소득세액공제     */
     double  savetaxded;             /* 저축세액공제         */
     double  intax;                  /* 소득세               */
     double  jutax;                  /* 주민세               */
     double  dedsum;                 /* 공제액계             */
     double  realpay;                /* 실지급액          */
     double  taxgross;               /* 당년과세수입누계     */
     double  notaxgross;             /* 당년비과세수입누계   */
     double  intaxsum;               /* 당년소득세누계       */
     double  calctaxsum;             /* 당년산출세누계       */
     double  kita1;                  /* 기타1          */
     double  kita2;                  /* 기타2          */
     double  kita3;                  /* 기타3                */
     double  kita4;                  /* 기타4          */
     double  kita5;                  /* 기타5                */
     double  btaxpay;                /* 전월조정과세급여     */
     double  bnotaxpay;              /* 전월조정비과세급여   */
     double  btaxbon;                /* 전월과세상여         */
     double  bnotaxbon;              /* 전월비과세상여       */
     double  sopay;                  /* 소급급여             */
     double  sobon;                  /* 소급상여             */
     double  sopaysum;               /* 소급급여합   */
     double  sobonsum;               /* 소급상여합(삭제)  */
     double  payholdamt;             /* 급여압류액   */
     char    cretime[16]  = "";      /* 급여생성일시         */
     char    writetime[16]  = "";    /* 최종작업일시         */
     char    writeman[5]  = "";      /* 최종작업자           */  
     char    president_empno[5]  = "";  /* 사장님사번           */  
     
     /* ===========================================================
      연봉제 관련 추가항목
        ===========================================================  */
     double  fixpay;      /* 월정급여   */
     double  bfixpay;     /* 전월월정급여   */
     double  quaterpay;   /* 분기급여   */
     double  holipay;     /* 명절급여   */
     double  roleamt;     /* 직책수당   */
     
     double  childded;    /* 다자녀추가공제액 dsa2000  2007.01. Add*/
     
     /*  급여마스터  (PKMPMAS) 참조 변수               */
     double  matecnt;        /* 가족수(배우자)       */
     double  parentcnt;      /* 가족수(존속)          */
     double  childcnt;       /* 가족수(비속)         */
     double  v_mateamt;      /* 가족수당(배우자)     */
     double  v_partamt;      /* 가족수당(존속)       */
     double  v_childamt;     /* 가족수당(비속)       */
     double  matedcnt;       /* 배우자공제수         */
     double  famidcnt;       /* 부양자공제수         */
     double  obsdcnt;        /* 장애자공제수         */
     double  silverdcnt;     /* 경로우대공제수       */
     double  womandcnt;      /* 부녀자공제수         */
     double  childdedcnt;    /* 다자녀추가공제 2007.01. Add  */
     
     /*  급여지급기준(PKCPBAS) 참조 변수               */
     
     char    cpaynum[3];    /* 현급호차수          */
     char    bonusyn[2];
     double  bonusmon;      /* 상여금분할개월수     */
     double  cbasicded;     /* 기초공제액          */
     double  cmateded;      /* 배우자공제액          */
     double  cfamided;      /* 부양자공제액          */
     double  cobsded;       /* 장애자공제액          */
     double  csilverded;    /* 경로우대공제액       */
     double  cwomanded;     /* 부녀자공제액          */
     double  ceduded;       /* 자녀양육비공제액     */
     double  cstdded;       /* 특별공제액          */
     double  cfewded1;      /* 소수부양자공제액1     */
     double  cfewded2;      /* 소수부양자공제액2     */
     double  cetcded1;      /* 다자녀추가공제1(2명일때 50)          2007.01. 변경 사용*/
     double  cetcded2;      /* 다자녀추가공제1(2명 초과시 1인당 100)*/
     double  cetcded3;      /* 기타공제액3          */
     double  avgodamt;      /* O/D지원금   */
     double  csauamt;       /* 사우회비   */
     double  specialded2;   /* 특별공제액2인이하   dsa2000 2004.05.10. 추가 */
     double  specialded3;   /* 특별공제액3인이상   dsa2000 2004.05.10. 추가 */
     char    holyonly[2];   /* 명절연봉만 따로 지급 여부 dsa2000  2007.02. add*/
     double  nojorate;      /* 노조회비율   */
     
     /*  가족수당지급기준(PKCFMBAS)         */
     double  c_mateamt;           /* 가족수당(배우자)   */
     double  c_childamt;          /* 가족수당(직계비속) */
     double  c_parentamt;         /* 가족수당(직계존속) */
/*     char    MaxPayDate[7];        월급여최종지급월   */
     char    MaxPayDate[9];       /* 월급여최종지급일자 */
/*     char    MaxHisPayDate[7];  */   
     char    MaxHisPayDate[9];     
     char    PrevPayMontt[7];     /* 전월               */
     char    frempno[5];
     char    toempno[5];
     int     rcount;
     /*  9801 item add *****************/
     double  childeduamt;         /* 자녀학자금   */
     double  medpayamt ;          /* 의료비가불금 */
     double  ovmcamt;             /* 야근식대 */
     /*  9801 item add *****************/
     /*  01/21/2000 1:42오후 item add 사우회비 공제 제외자 *****************/
     char    sauexdfremp[5] ;     /* 사우회비공제 제외자 from */
     char    sauexdtoemp[5] ;     /* 사우회비공제 제외자 to */
     double  itamt;               /* 정보통신수당 신설 DSA2000 2005.01.07.   */
     double  yuedunotax;          /* 유치원학자금 비과세 추가 dsa2000  2005.01.*/
     /*char  paymm[7]  = "";             해당년도 + 급여지급월수       */ 
     
     /* 2008.03.05 고용/산재 계산 이전에 따른 추가 */  
     double  empldrate      = 0;  /* 고용보험료율     */  
     double  y_empldrate    = 0;  /* 일반직 고용보험료율   */   
     double  y_wacirate     = 0;  /* 일반직 산재보험료율   */   
     
     double  y_empldamt     = 0;  /* 일반직 고용보험료   */   
     double  y_waciamt      = 0;  /* 일반직 산재보험료   */
     char    exfryymm[6+1]  = "";  /* 만60세이상 시작년월  */  
     double  basemm;        
     char  sqlsum[100];
     char  sqlstr[1024];
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



int   rcount     = 0;
int   i          = 0;
char  msg[500+1] = "";
int   id ;
char  dir[80];

/*=== dsa2000 2004.10. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 


/* 일반직 관리자 확인 필드 */
char  YManager[2]             = "N";    


void main(int argc, char *argv[])
{
     char FL_file[255];
                       
     if  (argc != 7) {  /* pkc10801 200501 0000 zzzz D006 pkc10801 2004110100000 */
          printf("[Usage] : pkc10801 1.급여년월 2.사번fr 3.사번to 4.작업자  5.프로그램ID 6.시작시간 \n");
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkc10801");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(paydate,"%.8s",argv[1]);
     sprintf(frempno,"%.4s",argv[2]);
     sprintf(toempno,"%.4s",argv[3]);
     sprintf(writeman,"%.4s",argv[4]);
     
     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"급여생성 프로그램 시작...[pkq10801]");        
     hinsa_db_connect();
     /*dsa2000  수정..End......................................*/

    
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"다른 작업자가 DB수정 작업 중입니다...");
          sprintf(log_buff, " 다른 작업자가 DB수정 작업 중입니다..."); 
          Write_batlog(seqno++, log_buff);                           /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }

  
     printf("월급여 생성중...");
     sprintf(log_buff, "월급여 생성중..."); 
     Write_batlog(seqno++, log_buff);      /*dsa2000 Rexec 대체*/      
     Generate_Records();                

     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); 
          Write_batlog(seqno++, log_buff);                     /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [월급여생성 작업성공] ====="); 
          Write_batlog(seqno++, log_buff);                           /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [월급여생성 작업성공] =====\n");
     }
        
}

/*2012.08.10 일반직관리자 조회모듈 통일
CheckYManager()
{
     char temp_ymanager[5];
     
     memset(temp_ymanager,'\0',sizeof(temp_ymanager));
     
     EXEC SQL
     SELECT  YMANAGER 
       INTO  :temp_ymanager
       FROM  PKCPBAS;
     
     if  (strncmp(log_writeman,temp_ymanager,4)==0)
     {
          strcpy(YManager,"Y");
     }
     else 
     {
          strcpy(YManager,"N");   
     }
}
*/

CheckYManager()
{
     char temp_ymanager1[5];
     char temp_ymanager2[5];
     char temp_ymanager3[5];
     char temp_ymanager4[5];
     char temp_ymanager5[5];
     
     memset(temp_ymanager1,'\0',sizeof(temp_ymanager1));
     memset(temp_ymanager2,'\0',sizeof(temp_ymanager2));
     memset(temp_ymanager3,'\0',sizeof(temp_ymanager3));
     memset(temp_ymanager4,'\0',sizeof(temp_ymanager4));
     memset(temp_ymanager5,'\0',sizeof(temp_ymanager5));
     
     /* EXEC SQL
     SELECT VALUE1,VALUE2,VALUE3,VALUE4,VALUE5
       INTO  :temp_ymanager1,:temp_ymanager2,:temp_ymanager3,:temp_ymanager4,:temp_ymanager5
       FROM PKCVARI
      WHERE GUBUN='YY' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select VALUE1 ,VALUE2 ,VALUE3 ,VALUE4 ,VALUE5 into :b0,\
:b1,:b2,:b3,:b4  from PKCVARI where GUBUN='YY'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)temp_ymanager1;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)temp_ymanager2;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)temp_ymanager3;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)temp_ymanager4;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)temp_ymanager5;
     sqlstm.sqhstl[4] = (unsigned long )5;
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


     
     if  ((strncmp(log_writeman,temp_ymanager1,4)==0)|| 
     			(strncmp(log_writeman,temp_ymanager2,4)==0)|| 
     			(strncmp(log_writeman,temp_ymanager3,4)==0)|| 
     			(strncmp(log_writeman,temp_ymanager4,4)==0)|| 
     			(strncmp(log_writeman,temp_ymanager5,4)==0)) 
     {
          strcpy(YManager,"Y");
          printf("debug : YManager\n");
     }
     else 
     {
          strcpy(YManager,"N");   
     }
}


Get_EmpldAmt()
{
     /* dsa2000 2007.02. Add  : 명절연봉만 따로 나가는때에 고용보험료 0원으로 처리.*/
     /* 2014.05.12 하은영 명절연봉만 따로 나갈때에도 고용보험료를 계산되도록 수정처리 
     if  (strcmp(holyonly, "Y") == 0 )
     {
          empldamt = 0;
     }
     else
     {
          if  (set_empldamt() != SUCCESS) 
               return(FAIL);
     }
     */
     
     if  (set_empldamt() != SUCCESS) 
         return(FAIL);
     
     return(SUCCESS);  
}

/******************************************************************************
  Parameter로 넘겨 받은 급여지급월에 상응하는 데이타가 있는지 체크하는 루틴.
******************************************************************************/
void Check_Existence()
{
     /* EXEC SQL 
     select   count(*)
       into  :rcount
       from  pkmpcalc
      where  (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4) ) 
        and   paydate = :paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpcalc where ((empno>\
=substr(:b1,1,4) and empno<=substr(:b2,1,4)) and paydate=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
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
     sqlstm.sqhstl[3] = (unsigned long )9;
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select presempno into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )86;
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
          double  temp_totamt;   
          double  temp_empldamt;             
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char    str[4+1];
     double  mm = 0;
     
     empldamt    = 0;
     y_empldamt  = 0;
     y_waciamt   = 0;
     temp_totamt = 0;
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
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select NVL(CONCAT(DECODE(SUBSTR(:b0,8,1),'1','19',\
'2','19','3','20','4','20','19'),SUBSTR(:b0,1,6)),'99999999') into :b2  from \
DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )105;
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
               select nvl(taxpaysum,0)                                     
                into  :temp_totamt
                from  pkmpcalc, pkcemtbl
               where  empno = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select nvl(taxpaysum,0) into :b0  from pkmpca\
lc ,pkcemtbl where empno=:b1";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )132;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&temp_totamt;
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

   /* 2011.01.13 KTH 고용보험 과총으로 변경 주석*/
               /*=====03/23/2000 1:52오전 독립비상임이사는 고용보험 적용안됨====
                 and paycl <> '10' ;
                 ===============================================================*/
               /*2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  */
               /*   and paycl <> '0Z' ;           */
                 
                 /* if (sqlca.sqlcode != 0)  */
           /*    if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
               {
                    printf("[사번] : %s 의  고용보험료 구하기 에러... \n",empno);
                    print_errmsg(sqlca.sqlcode,"고용보험료 계산오류...");
                    sprintf(log_buff, "고용보험료 계산오류..."); 
                    Write_batlog(seqno++, log_buff);     */       /*dsa2000 Rexec 대체*/
         /*           return(FAIL);
               }     
               */
               if  (strncmp(YManager,"Y",1)==0)
               {
                    y_empldamt = temp_totamt * y_empldrate;
                    y_waciamt  = temp_totamt * y_wacirate;
                    
                    /* EXEC SQL
                    UPDATE  PKMPCALC a
                       SET  EMPLDAMT = FLOOR(:y_empldamt/10)*10,  /o2008.03.18 원단위 절삭 2011.01.13 KTH 고용보험 과총으로 변경o/
                            DEDAMT1   = FLOOR(:y_waciamt/10)*10   /o2008.03.18 원단위 절삭 2011.01.13 KTH 고용보험 과총으로 변경o/   
                    WHERE  empno=:empno ; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 5;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "update PKMPCALC a  set EMPLDAMT=(FLOOR((\
:b0/10))* 10),DEDAMT1=(FLOOR((:b1/10))* 10) where empno=:b2";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )155;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&y_empldamt;
                    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)&y_waciamt;
                    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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


               
               }
               else 
               {
                    /*     empldamt   = temp_totamt * empldrate;    2011.01.13 KTH 고용보험 과총으로 변경    */
                    empldamt   = temp_totamt * empldrate;
                      
                    temp_empldamt = 0;
                    
                    /*2013.11.22.hjku. 고용보험 소급분 추가*/     
                    /* EXEC SQL
                    SELECT nvl(AMT ,0)
                      into :temp_empldamt
                      FROM PKMADDTAX
                     WHERE paydate =:paydate
                       and gubun ='E'
                       and EMPNO = :empno ; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 5;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "select nvl(AMT,0) into :b0  from PKMADDT\
AX where ((paydate=:b1 and gubun='E') and EMPNO=:b2)";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )182;
                    sqlstm.selerr = (unsigned short)0;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&temp_empldamt;
                    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)paydate;
                    sqlstm.sqhstl[1] = (unsigned long )9;
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
                         temp_empldamt = 0;    
            
                    empldamt = empldamt + temp_empldamt;
              
                    /* EXEC SQL
                    UPDATE  PKMPCALC a
                    SET  EMPLDAMT = floor(:empldamt)
                    WHERE  empno=:empno ; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 5;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "update PKMPCALC a  set EMPLDAMT=floor(:b\
0) where empno=:b1";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )209;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&empldamt;
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
               if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
               {
                    print_errmsg(sqlca.sqlcode,"일반직 고용/산재 생성 실패 ");
                    error_quit("작업실패...");
               }                
          }
     }
     return(SUCCESS);
}


void Process_InsCalc()
{
     /* EXEC SQL DECLARE cursor4 CURSOR FOR 
     select  nvl(b.empno,'*'),    replace(nvl(a.juminid,'####'),' ','')
       from  pkmpmas a, pkmpcalc b
      where  (b.empno >= substr(:frempno,1,4) and b.empno <= substr(:toempno,1,4) ) 
        and  a.empno = b.empno; */ 
     
     
     /* EXEC SQL OPEN cursor4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0010;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )232;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != 1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor4 Open Error...");
          sprintf(log_buff, "Cursor cursor4 Open Error 2.....");
          Write_batlog(seqno++, log_buff);                       /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE cursor4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )255;
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
          /* EXEC SQL FETCH  cursor4 
          INTO  :empno, :juminid; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )270;
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
          sqlstm.sqhstv[1] = (unsigned char  *)juminid;
          sqlstm.sqhstl[1] = (unsigned long )14;
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


          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )293;
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
               print_errmsg(sqlca.sqlcode,"Cursor cursor4 Data Fetch Error 1...");
               /* EXEC SQL CLOSE cursor4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )308;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (Get_EmpldAmt() == SUCCESS)
               rcount++;
          else
          {
               /* EXEC SQL CLOSE cursor4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )323;
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

void Process_Calc()
{
     char  str[4+1] = "";
     
     Check_Existence();
     Get_PresidentEmpno();
     
     /* ===============================================================================
             급여지급 항목변경 : => 급여지급항목변경에 따른 고용보험료 산정대상항목을 추가
        =============================================================================== */
     /* EXEC SQL
     select   nvl(empldrate,0),nvl(y_empldrate,0),nvl(y_wacirate,0)
       into  :empldrate, :y_empldrate, :y_wacirate
       from  pkcemtbl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(empldrate,0) ,nvl(y_empldrate,0) ,nvl(y_waci\
rate,0) into :b0,:b1,:b2  from pkcemtbl ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )338;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&empldrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&y_empldrate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&y_wacirate;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_date(:b0,'YYYYMM')  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )365;
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycalctime=to_char(sysdate,'YYYYMM\
DDHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )384;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if (sqlca.sqlcode != 0) 
     {
         print_errmsg(sqlca.sqlcode,"급여지급기준 쓰기오류...");
         sprintf(log_buff, "급여지급기준 쓰기오류...."); 
         Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
         error_quit("작업실패...");
     }  
     
     Process_InsCalc();
}



/*****************************************************************************
  Generate_Records()
*****************************************************************************/
void Generate_Records()
{
     /* EXEC SQL 
     delete from pkmpcalc
      where empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pkmpcalc  where (empno>=substr(:b0,1,4) an\
d empno<=substr(:b1,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )399;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          hinsa_log_print(0,"삭제오류...[pkq10801]");        
          print_errmsg(sqlca.sqlcode,"월급여 기존자료 삭제실패...");
          sprintf(log_buff, "월급여 기존자료 삭제실패...");
          Write_batlog(seqno++, log_buff);                 /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }

     
     /* 2017.04.04 eyha 무조건 정규직 
     CheckYManager();
     printf("일반직 관리자 확인\n");  */
     
     Get_Criteria();
     printf("급여지급기준 읽기 완료\n");
     
     Gen_EmpRecord();  
     /* ===============================================================================
              Version  date(yy.mm.dd)  programmer  description             relevant doc.no
           30.00     1998.12.29     김승회     급여지급 항목변경        하나로인사재개발
     => 일할계산부분은 차후에 반영
        =============================================================================== */
     /*
     Extract_DayPayEmp();
     */
     Calc_BasicGongje(); /* 기초공제 Update_Record2 루틴 포함.*/
      
     Update_Record3();   /* 상여금 분할개월수을 DB에 반영하는 함수. */
     
/*     CalMidEnt_DayPay();  일할계산 */
     
     Get_Pays();
     
     printf("과세 비과세 Sum 계산 완료\n");
     
     Process_Calc();/* 고용보험/산재 보험 계산 */
      
     Get_DedSum();
     
     printf("공제금 합 계산 완료\n");
}

/*****************************************************************************
   급여기준테이블에서 급여계산에 필요한 값들을 얻는 함수.
*****************************************************************************/
void Get_Criteria()
{       /* 2004.05.10. Dsa2000  특별공제액 DB에서 읽도록 SPECIALDED2, SPECIALDED3 추가 */
        /* 2005.01.10. Dsa2000  유치원학자금(yuedunotax) 비과세 추가 */
        
/*2008.03.25 NUMBER값이 NULL인 경우 0으로 초기화
  EXEC SQL 
  select    cpaynum,      bonusyn,    basicded,  
           mateded,      famided,    obsded,      
           silverded,    womanded,   eduded,   
           stdded,       fewded1,    fewded2,   
           etcded1,      etcded2,    etcded3, 
    avgodamt,     sauamt,     specialded2, 
    specialded3,  childnotax, holyonly */
     /* EXEC SQL 
     SELECT   CPAYNUM,            NVL(BONUSYN,'N'),  NVL(BASICDED,0),  
              NVL(MATEDED,0),     NVL(FAMIDED,0),    NVL(OBSDED,0),      
              NVL(SILVERDED,0),   NVL(WOMANDED,0),   NVL(EDUDED,0),   
              NVL(STDDED,0),      NVL(FEWDED1,0),    NVL(FEWDED2,0),   
              NVL(ETCDED1,0),     NVL(ETCDED2,0),    NVL(ETCDED3,0), 
              NVL(AVGODAMT,0),    NVL(SAUAMT,0),     NVL(SPECIALDED2,0), 
              NVL(SPECIALDED3,0), NVL(CHILDNOTAX,0), NVL(HOLYONLY,'N') ,
              NVL(NOJORATE,0)
       INTO   :cpaynum,     :bonusyn,   :cbasicded, 
              :cmateded,    :cfamided,  :cobsded, 
              :csilverded,  :cwomanded, :ceduded, 
              :cstdded,     :cfewded1,  :cfewded2, 
              :cetcded1,    :cetcded2,  :cetcded3, 
              :avgodamt,    :csauamt,   :specialded2, 
              :specialded3, :yuedunotax,:holyonly,
              :nojorate
       FROM   PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CPAYNUM ,NVL(BONUSYN,'N') ,NVL(BASICDED,0) ,NVL(\
MATEDED,0) ,NVL(FAMIDED,0) ,NVL(OBSDED,0) ,NVL(SILVERDED,0) ,NVL(WOMANDED,0) \
,NVL(EDUDED,0) ,NVL(STDDED,0) ,NVL(FEWDED1,0) ,NVL(FEWDED2,0) ,NVL(ETCDED1,0)\
 ,NVL(ETCDED2,0) ,NVL(ETCDED3,0) ,NVL(AVGODAMT,0) ,NVL(SAUAMT,0) ,NVL(SPECIAL\
DED2,0) ,NVL(SPECIALDED3,0) ,NVL(CHILDNOTAX,0) ,NVL(HOLYONLY,'N') ,NVL(NOJORA\
TE,0) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:\
b15,:b16,:b17,:b18,:b19,:b20,:b21  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )422;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cpaynum;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonusyn;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&cbasicded;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&cmateded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&cfamided;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&cobsded;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&csilverded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&cwomanded;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&ceduded;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&cstdded;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&cfewded1;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&cfewded2;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&cetcded1;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&cetcded2;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&cetcded3;
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
     sqlstm.sqhstv[16] = (unsigned char  *)&csauamt;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&specialded2;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&specialded3;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)holyonly;
     sqlstm.sqhstl[20] = (unsigned long )2;
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&nojorate;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
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
          print_errmsg(sqlca.sqlcode,"급여지급기준 읽기오류...");
          sprintf(log_buff, " 급여지급기준 읽기오류....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     /* EXEC SQL 
     select  NVL(mateamt,0), NVL(childamt,0), NVL(parentamt,0)
       into  :c_mateamt, :c_childamt, :c_parentamt
       from  pkcfmbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(mateamt,0) ,NVL(childamt,0) ,NVL(parentamt,0\
) into :b0,:b1,:b2  from pkcfmbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )525;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&c_mateamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&c_childamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&c_parentamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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
          print_errmsg(sqlca.sqlcode,"가족수당지급기준 읽기오류...");
          sprintf(log_buff, " 급여지급기준 읽기오류....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
}

/*****************************************************************************
  금월 해당 사번의 월급여레코드를 생성하는 함수.
******************************************************************************/  
void Gen_EmpRecord()
{
     /* EXEC SQL 
     update  pkcpbas
        set  paycretime = to_char(sysdate,'YYYYMMDDHH24MISSD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycretime=to_char(sysdate,'YYYYMMD\
DHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )552;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"급여지급기준 쓰기오류...");
          sprintf(log_buff, " 급여지급기준 쓰기오류....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
  
  /* ===============================================================================
           Version  date(yy.mm.dd)  programmer  description             relevant doc.no
        30.00     1998.12.29     김승회     급여지급 항목변경        하나로인사재개발

  => 1. 추가항목 : fixpay, bfixpay, quaterpay, holipay, roleamt 
     2. 삭제항목 : 연봉제관련 변경된 급여지급항목 참조
     =============================================================================== */
     /* EXEC SQL 
     insert into pkmpcalc 
      (
           paydate, empno, korname, paycl, pstate, 
           orgnum, deptcode, boncode, bldcode, jobdept, 
           payyn, paybank, payacnt, paybank1, payacnt1,
           basicamt, dutyamt, bonusamt, trainamt, winteramt, homesupamt,
           mbonamt, ybonamt, sbonamt, sbontaxamt, liceamt, 
           ovtmamt, sptmamt, aidamt1, aidamt2, aidamt3, 
           mcaramt, mcartaxamt, yueduamt, selfeduamt, odamt, 
           odtaxamt, drvliceamt, lectsupamt, edusupamt, bokjisupamt, 
           medsupamt, longsupamt,
           saveamt1, saveamt2, saveamt3, meddamt, anudamt, 
           hsamt, fbamt, nbamt, sacorpamt, sabankamt, 
           sangamt, loanamt1, loanamt2, loanamt3, ticketamt, 
           sauamt, igamt, sobiamt, parkamt, chollamt, 
           meddedamt, edudedamt, dedamt1, dedamt2, dedamt3, 
           dedamt4, dedamt5, bondedamt, 
           taxpay, notaxpay, cretime, payra, sopaysum,  
           childeduamt, ovmcamt, medpayamt, 
           trainsupamt, ovmcded, payholdamt,
           fixpay, bfixpay, quaterpay, holipay, roleamt ,
           aidamt11, aidamt12, aidamt13, aidamt14, 
           aidamt21, aidamt22, aidamt23, aidamt24,
           taxpay1, taxpay2, taxpay3, taxpay4, 
           notaxpay1, notaxpay2, notaxpay3, notaxpay4, 
           sopaysum1, sopaysum2, sopaysum3, 
           sopaysum4, sopaysum5, sopaysum6,
           lectsupamt1,lectsupamt2,lectsupamt3,lectsupamt4,
           edusupamt1,edusupamt2, hsorgamt,hsintamt, 
           nojoamt, /o 2003.06.19.  강륜종(Dsa2000)  노조회비 발생으로 인하여 nojoamt 추가함....  o/
           itamt,sacorpcp, sabankcp    /o 2005.01. 정보통신수당 신설.    dsa2000  20110919 kth 우리사주 원금 상환시작 o/ 
           )
     select
           substr(:paydate,1,8), empno, korname, paycl, pstate,
           orgnum, deptcode, boncode, bldcode, jobdept, 
           payyn, paybank, payacnt, paybank1, payacnt1,
           basicamt, dutyamt, bonusamt, trainamt, winteramt, homesupamt,  /o 이사대우이상의 임원은 기존지급방식 o/
           0,                                  /ombonamt, 월차수당 폐지 및 정보통신수당 신설...dsa2000  2005.01.10.o/
           ybonamt, sbonamt, sbontaxamt, liceamt, 
           ovtmamt, sptmamt, aidamt1, aidamt2, aidamt3, 
           mcaramt, mcartaxamt, yueduamt, selfeduamt, odamt, 
           odtaxamt, drvliceamt, lectsupamt, edusupamt, bokjisupamt, 
           medsupamt,longsupamt,
           saveamt1, saveamt2, saveamt3, meddamt, anudamt, 
           hsamt, fbamt, nbamt, sacorpamt, sabankamt, 
           sangamt, loanamt1, loanamt2, loanamt3, ticketamt, 
           sauamt, igamt, sobiamt, parkamt, chollamt, 
           meddedamt, edudedamt, dedamt1, dedamt2, dedamt3, 
           dedamt4, dedamt5,
           bondedamt, taxpay, notaxpay, 
           to_char(sysdate,'YYYYMMDDHH24MISSD'), payra, soguppay, 
           childeduamt, ovmcamt, medpayamt, 
           trainsupamt, ovmcded, payholdamt,
           fixpay, bfixpay, quaterpay, holipay, roleamt,
           aidamt11, aidamt12, aidamt13, aidamt14, 
           aidamt21, aidamt22, aidamt23, aidamt24,
           taxpay1, taxpay2, taxpay3, taxpay4, 
           notaxpay1, notaxpay2, notaxpay3, notaxpay4, 
           soguppay1, soguppay2, soguppay3, 
           soguppay4, soguppay5, soguppay6,
           lectsupamt1,lectsupamt2, lectsupamt3,lectsupamt4,
           edusupamt1,edusupamt2,   hsorgamt,hsintamt ,
           /odecode(nvl(nojoyn,'N'),'Y', Trunc(fixpay * 0.01), 0) nojoamt,   dsa2000 2005.10.19 노조원회비 자동계산되도록.o/ 
           /odecode(nvl(nojoyn,'N'),'Y', Trunc((fixpay+quaterpay+holipay) * 0.01), 0) nojoamt,   2008.07.01 노조원회 월정,명절,분기연봉의 1%로 자동계산되도록.o/         
           decode(nvl(nojoyn,'N'),'Y', TRUNC(FIXPAY *(:nojorate/100)), 0) nojoamt,   /o2008.07.01 노조원회공제률을 적용하여 자동계산되도록.+quaterpayo/                 
           itamt,sacorpcp, sabankcp     /o  20110919 kth 우리사주 원금 상환시작 o/ 
      from pkmpmas
     where upper(payyn) = 'Y'
       and (empno >= :frempno and empno <= :toempno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into pkmpcalc (paydate,empno,korname,paycl,pstate,orgnum,dept\
code,boncode,bldcode,jobdept,payyn,paybank,payacnt,paybank1,payacnt1,basicam\
t,dutyamt,bonusamt,trainamt,winteramt,homesupamt,mbonamt,ybonamt,sbonamt,sbo\
ntaxamt,liceamt,ovtmamt,sptmamt,aidamt1,aidamt2,aidamt3,mcaramt,mcartaxamt,y\
ueduamt,selfeduamt,odamt,odtaxamt,drvliceamt,lectsupamt,edusupamt,bokjisupam\
t,medsupamt,longsupamt,saveamt1,saveamt2,saveamt3,meddamt,anudamt,hsamt,fbam\
t,nbamt,sacorpamt,sabankamt,sangamt,loanamt1,loanamt2,loanamt3,ticketamt,sau\
amt,igamt,sobiamt,parkamt,chollamt,meddedamt,edudedamt,dedamt1,dedamt2,dedam\
t3,dedamt4,dedamt5,bondedamt,taxpay,notaxpay,cretime,payra,sopaysum,childedu\
amt,ovmcamt,medpayamt,trainsupamt,ovmcded,payholdamt,fixpay,bfixpay,quaterpa\
y,holipay,roleamt,aidamt11,aidamt12,aidamt13,aidamt14,aidamt21,aidamt22,aida\
mt23,aidamt24,taxpay1,taxpay2,taxpay3,taxpay4,notaxpay1,notaxpay2,notaxpay3,\
notaxpay4,sopaysum1,sopaysum2,sopaysum3,sopaysum4,sopaysum5,sopaysum6,lectsu\
pamt1,lectsupamt2,lectsupamt3,lectsupamt4,ed");
     sqlbuft((void **)0,
       "usupamt1,edusupamt2,hsorgamt,hsintamt,nojoamt,itamt,sacorpcp,sabankc\
p)select substr(:b0,1,8) ,empno ,korname ,paycl ,pstate ,orgnum ,deptcode ,b\
oncode ,bldcode ,jobdept ,payyn ,paybank ,payacnt ,paybank1 ,payacnt1 ,basic\
amt ,dutyamt ,bonusamt ,trainamt ,winteramt ,homesupamt ,0 ,ybonamt ,sbonamt\
 ,sbontaxamt ,liceamt ,ovtmamt ,sptmamt ,aidamt1 ,aidamt2 ,aidamt3 ,mcaramt \
,mcartaxamt ,yueduamt ,selfeduamt ,odamt ,odtaxamt ,drvliceamt ,lectsupamt ,\
edusupamt ,bokjisupamt ,medsupamt ,longsupamt ,saveamt1 ,saveamt2 ,saveamt3 \
,meddamt ,anudamt ,hsamt ,fbamt ,nbamt ,sacorpamt ,sabankamt ,sangamt ,loana\
mt1 ,loanamt2 ,loanamt3 ,ticketamt ,sauamt ,igamt ,sobiamt ,parkamt ,chollam\
t ,meddedamt ,edudedamt ,dedamt1 ,dedamt2 ,dedamt3 ,dedamt4 ,dedamt5 ,bonded\
amt ,taxpay ,notaxpay ,to_char(sysdate,'YYYYMMDDHH24MISSD') ,payra ,soguppay\
 ,childeduamt ,ovmcamt ,medpayamt ,trainsupamt ,ovmcded ,payholdamt ,fixpay \
,bfixpay ,quaterpay ,holipay ,roleamt ,aidamt11 ,aidamt12 ,aidamt13 ,aidamt1\
4 ,aidamt21 ,aidamt22 ,aidamt23 ,aidamt24 ,t");
     sqlstm.stmt = "axpay1 ,taxpay2 ,taxpay3 ,taxpay4 ,notaxpay1 ,notaxpay2\
 ,notaxpay3 ,notaxpay4 ,soguppay1 ,soguppay2 ,soguppay3 ,soguppay4 ,soguppay5\
 ,soguppay6 ,lectsupamt1 ,lectsupamt2 ,lectsupamt3 ,lectsupamt4 ,edusupamt1 ,\
edusupamt2 ,hsorgamt ,hsintamt ,decode(nvl(nojoyn,'N'),'Y',TRUNC((FIXPAY* (:b\
1/100))),0) nojoamt ,itamt ,sacorpcp ,sabankcp  from pkmpmas where (upper(pay\
yn)='Y' and (empno>=:b2 and empno<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )567;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&nojorate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toempno;
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


     
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 생성오류...1");
          sprintf(log_buff, " 월급여화일 생성오류....1");
          Write_batlog(seqno++, log_buff);              /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     /* 유치원 학자금 6세 이하 과세액 계산 처리 2010.07.19  시작 */
     /* EXEC SQL   
     update pkmpcalc set YUEDUTAX = NVL(YUEDUAMT ,0)
     where NVL(YUEDUAMT,0) > 0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set YUEDUTAX=NVL(YUEDUAMT,0) where NVL\
(YUEDUAMT,0)>0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )598;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
                 
     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"유치원 학자금 비과세 처리 오류...2");
          sprintf(log_buff, " 유치원 학자금 비과세 처리 오류....2");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }                                          
     
     /* EXEC SQL      
     update pkmpcalc d  set YUEDUTAX = NVL(YUEDUAMT,0) - 100000  
      where NVL(YUEDUAMT,0) > 0   
        and empno in    
            (	 
              select empno  
                from pnhschis h     
               where SCKIND = '11'     
/o                 and scyymm = substr(:paydate,1,6)       o/ 
                 and scyymm = substr(:paydate,1,6)        
                 and famijuid > to_char(to_number(substr(scyymm,1,4))-6)||'0101' ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc d  set YUEDUTAX=(NVL(YUEDUAMT,0)-100000\
) where (NVL(YUEDUAMT,0)>0 and empno in (select empno  from pnhschis h where \
((SCKIND='11' and scyymm=substr(:b0,1,6)) and famijuid>(to_char((to_number(su\
bstr(scyymm,1,4))-6))||'0101'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )613;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
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


                                                                  
     /* 유치원 학자금 6세 이하 과세액 계산 처리 2010.07.19  끝 */                 
     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"유치원 학자금 비과세 처리 오류...");
          sprintf(log_buff, " 유치원 학자금 비과세 처리 오류....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }                      


     /* 2017.04.04 eyha 3월 유치원학자금 과지급에 대한 조정처리 */
     /* EXEC SQL      
     update pkmpcalc d  set YUEDUTAX = (select b.amt from PKMADDTAX b 
                                        where d.paydate = b.paydate 
                                          and d.empno   = b.empno 
                                          and b.gubun   = 'G')     
      where empno in    
            (	select empno                 
                from PKMADDTAX h     
               where paydate = :paydate 
                 and gubun   = 'G'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc d  set YUEDUTAX=(select b.amt  from PKM\
ADDTAX b where ((d.paydate=b.paydate and d.empno=b.empno) and b.gubun='G')) w\
here empno in (select empno  from PKMADDTAX h where (paydate=:b0 and gubun='G\
'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )632;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
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

      
                                                                
                 
     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"유치원 학자금 과세 처리 오류...");
          sprintf(log_buff, " 유치원 학자금 과세 처리 오류....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }                      
                                           
     /* EXEC SQL
     select  count(*)
       into  :rcount
       from  pkmpcalc
      where  (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpcalc where (empno>=\
substr(:b1,1,4) and empno<=substr(:b2,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )651;
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

      /*Dsa2000 추가..선택한 사원만 계산이 되도록..*/
     
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 읽기오류1...");
          sprintf(log_buff, " 월급여화일 읽기오류1....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     printf("월급여 생성건수 : [%d] \n",rcount);
     sprintf(log_buff, "월급여 생성건수 : [%d] \n",rcount);
     Write_batlog(seqno++, log_buff);                      /*dsa2000 Rexec 대체*/
}

/******************************************************************************
              일할계산내역화일에서 일할계산자를 추출하는 함수. (사용 안하고 있음)
******************************************************************************/
void Extract_DayPayEmp()
{
/*
  select   a.empno, nvl(a.paycalckind,' '), nvl(a.ducalckind,' '), 
   nvl(a.bpaycalckind,' '), nvl(a.bducalckind,' '),
   cbasicsum, cinfosum, cdutysum, 
   sobasicamt, soinfoamt, sodutyamt  
  from  pkhpday a, pkmpcalc b */
   
     /* EXEC SQL DECLARE cursor1 CURSOR FOR 
     SELECT  A.EMPNO,    NVL(A.PAYCALCKIND,' '), NVL(A.DUCALCKIND,' '), 
             NVL(A.BPAYCALCKIND,' '),NVL(A.BDUCALCKIND,' '),
             NVL(CBASICSUM,0),   NVL(CINFOSUM,0),    NVL(CDUTYSUM,0), 
             NVL(SOBASICAMT,0),  NVL(SOINFOAMT,0),   NVL(SODUTYAMT,0)
       FROM  PKHPDAY A, PKMPCALC B   
      WHERE  A.PAYDATE = :paydate AND A.EMPNO = B.EMPNO 
        AND (A.EMPNO >= substr(:frempno,1,4) AND B.EMPNO <= substr(:toempno,1,4)); */ 

     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0023;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )678;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor1 Open Error...");
          sprintf(log_buff, " Cursor cursor1 Open Error....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )705;
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
          /* EXEC SQL FETCH cursor1 
          INTO    :empno, :paycalckind, :ducalckind, 
                  :bpaycalckind, :bducalckind, 
                  :basicamt, :infoamt, :dutyamt, :bbasicamt, 
                  :binfoamt, :bdutyamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )720;
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
          sqlstm.sqhstv[1] = (unsigned char  *)paycalckind;
          sqlstm.sqhstl[1] = (unsigned long )2;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)ducalckind;
          sqlstm.sqhstl[2] = (unsigned long )2;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)bpaycalckind;
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)bducalckind;
          sqlstm.sqhstl[4] = (unsigned long )2;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&basicamt;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&infoamt;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&dutyamt;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&bbasicamt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&binfoamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&bdutyamt;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
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
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )779;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("일할계산 대상자 : [%d]명 \n",rcount);
               sprintf(log_buff, "일할계산 대상자 : [%d]명 \n",rcount);
               Write_batlog(seqno++, log_buff);                        /*dsa2000 Rexec 대체*/
               return;
          }  
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error...");
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )794;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }  
          
          if  (Update_Record1() == FAIL)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )809;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          rcount++;
     }
}

/***************************************************************************
  Update_Record1() Function.
****************************************************************************/
Update_Record1()
{
     /* EXEC SQL 
     UPDATE   PKMPCALC
        SET  
            PAYCALCKIND   = :paycalckind, 
            DUCALCKIND   = :ducalckind,
            BPAYCALCKINd   = :bpaycalckind, 
            BDUCALCKIND   = :bducalckind, 
            BASICAMT   = :basicamt,
            /oINFOAMT   = :infoamt, o/
            DUTYAMT   = :dutyamt, 
            BBASICAMT   = :bbasicamt, 
            BINFOAMT   = :binfoamt, 
            BDUTYAMT   = :bdutyamt
      WHERE EMPNO = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMPCALC  set PAYCALCKIND=:b0,DUCALCKIND=:b1,BPA\
YCALCKINd=:b2,BDUCALCKIND=:b3,BASICAMT=:b4,DUTYAMT=:b5,BBASICAMT=:b6,BINFOAMT\
=:b7,BDUTYAMT=:b8 where EMPNO=:b9";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )824;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paycalckind;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ducalckind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bpaycalckind;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bducalckind;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&basicamt;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&dutyamt;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&bbasicamt;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&binfoamt;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&bdutyamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)empno;
     sqlstm.sqhstl[9] = (unsigned long )5;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
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
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기 오류1...");
          sprintf(log_buff, " 월급여화일 쓰기 오류1...."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
   기초 공제 내역을 계산하는 함수.
*****************************************************************************/
void Calc_BasicGongje()
{
     /* EXEC SQL DECLARE cursor2 CURSOR FOR
      SELECT  NVL(A.MATEDCNT  ,0),   NVL(A.FAMIDCNT,0),  NVL(A.OBSDCNT,0), 
              NVL(A.SILVERDCNT,0),   NVL(A.WOMANDCNT,0), NVL(A.MATECNT,0), 
              NVL(A.PARENTCNT ,0),   NVL(A.CHILDCNT,0),  NVL(B.ODAMT,0),
              B.EMPNO, NVL(B.PAYCL,' '),
              NVL(CHILDDEDCNT,0),                                  /oDSA2000 200701. CHILDDEDCNT ADD 다자녀추가공제.o/
              NVL(A.MATEAMT, 0),   NVL(A.PARTAMT, 0),  NVL(A.CHILDAMT, 0)
        FROM  PKMPMAS A, PKMPCALC B   
       WHERE  A.EMPNO = B.EMPNO 
         AND (B.EMPNO >= substr(:frempno,1,4) AND B.EMPNO <= substr(:toempno,1,4)); */ 

     
     /* EXEC SQL OPEN cursor2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0025;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )879;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor2 Open Error...");
          sprintf(log_buff, " Cursor cursor2 Open Error...");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE cursor2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )902;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
     }
     
     while(1) 
     {
          /* EXEC SQL FETCH cursor2 INTO 
          :matedcnt,   :famidcnt,  :obsdcnt,   
          :silverdcnt, :womandcnt, :matecnt,  
          :parentcnt,  :childcnt,  :odamt, 
          :empno,      :paycl,
          :childdedcnt,
          :v_mateamt,  :v_partamt, :v_childamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )917;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&matedcnt;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&famidcnt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&obsdcnt;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&silverdcnt;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&womandcnt;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&matecnt;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&parentcnt;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&childcnt;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&odamt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)empno;
          sqlstm.sqhstl[9] = (unsigned long )5;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)paycl;
          sqlstm.sqhstl[10] = (unsigned long )4;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&childdedcnt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&v_mateamt;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&v_partamt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&v_childamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
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
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )992;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
               return;
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor2 Data Fetch Error...");
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1007;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (Update_Record2() == FAIL)
          {
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1022;
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

/***************************************************************************
  Update_Record2() Function.
****************************************************************************/
Update_Record2()
{  
     if  (odamt > 0) 
          odamt = avgodamt;
     else
          odamt = 0;
     
     basicded   = cbasicded;
     mateded    = cmateded * matedcnt;
     famided    = cfamided * famidcnt;
     obsded     = cobsded  * obsdcnt;
     silverded  = csilverded * silverdcnt;
     womanded   = cwomanded * womandcnt;
     
     /* 가족수당 */
     /* 가족수당 항목별 일할계산값 반영을 위해 수정  : 2007.04.18 : 유재승(D022)
     mateamt    = c_mateamt   * matecnt; 
     partamt    = c_parentamt * parentcnt;
     childamt   = c_childamt  * childcnt; */  
     mateamt    = v_mateamt;
     partamt    = v_partamt;
     childamt   = v_childamt;
     
     /*dsa2000  2007.01. Add  다자녀추가공제     */
     childded        = 0;
     if  (childdedcnt == 2)
          childded = cetcded1;
     else if (childdedcnt > 2)
          childded = cetcded2 * (childdedcnt - 2);
     /*dsa2000 end...............................*/
  
/* ===========================================================================
  31.00     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가, 계산로직을 직급에 따라 2분화)           
============================================================================= pkc10802.pc로 이관.2011.09.
     if  (strcmp(paycl, "H11") == 0 )
     {
          speded = 0 ; 
          standded = cstdded ;
     }
     else if (strcmp(paycl, "D91") == 0 )
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
     }  */
         
  /*****추가 end*******************************************/  

  /* dsa2000 2007.02. Add  : 명절연봉만 따로 나가는때에 가족수당, 자격수당,상조회비 0원으로 처리. */
     if  (strcmp(holyonly, "Y") == 0 )
     {
          /* EXEC SQL 
          update  pkmpcalc
             set  fixpay   = 0,
                  itamt    = 0,
                  liceamt  = 0,
                  sauamt   = 0
           where  empno    = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmpcalc  set fixpay=0,itamt=0,liceamt=0,sa\
uamt=0 where empno=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1037;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
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


          
          mateamt  = 0;
          partamt  = 0;
          childamt = 0;
          csauamt  = 0;
     }  
     /*********************************************************/
     
     /*2013.08.21.hjku... 홍원영M요청...인턴사원 사우회비 제외      
     if  (strncmp(empno,"I",1)==0)
     {
     	csauamt  = 0;
     }
     */
     	      
     /* EXEC SQL 
     update  pkmpcalc
        set  basicded   = :basicded, 
             mateded    = :mateded, 
             famided    = :famided, 
             obsded     = 0, 
             silverded  = 0,
             womanded   = 0,
             speded     = :speded,
             standded   = :standded,
             mateamt    = :mateamt, 
             partamt    = :partamt, 
             childamt   = :childamt,
             sauamt     = :csauamt,
             childded   = :childded   /odsa2000 2007.01. Addo/
      where  empno = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set basicded=:b0,mateded=:b1,famided=:\
b2,obsded=0,silverded=0,womanded=0,speded=:b3,standded=:b4,mateamt=:b5,partam\
t=:b6,childamt=:b7,sauamt=:b8,childded=:b9 where empno=:b10";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1056;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&basicded;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&mateded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&famided;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&speded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&standded;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&mateamt;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&partamt;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&childamt;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&csauamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&childded;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)empno;
     sqlstm.sqhstl[10] = (unsigned long )5;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
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
          return(SUCCESS);
     else 
     {
          sprintf(log_buff, " empno...: %s", empno);
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류2...");
          sprintf(log_buff, " 월급여화일 쓰기오류2...");
          Write_batlog(seqno++, log_buff);              /*dsa2000 Rexec 대체*/
          return(FAIL);
     }  
}

/*****************************************************************************
  상여금 분할개월수을 DB에 반영하는 함수.
*****************************************************************************/
void Update_Record3()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  year[4+1]     = "";
          char  nojoyn[1+1]   = "";   
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(year,"%.4s",paydate);
     
     /* EXEC SQL DECLARE cursor3 CURSOR FOR
     select  a.empno, upper(nvl(nojoyn,' ')) 
       from  pkmpcalc a, pkmpmas b
      where  upper(nvl(a.payyn,' ')) = 'Y'  
        and (a.empno >= substr(:frempno,1,4) and a.empno <= substr(:toempno,1,4)) 
        and  a.empno = b.empno
      order by a.empno; */ 

     
     /* EXEC SQL OPEN cursor3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0028;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1115;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor3 Open Error...");
          sprintf(log_buff, " Cursor cursor3 Open Error...");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE cursor3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1138;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
     }
     
     while (1) 
     {
          /* EXEC SQL FETCH cursor3 INTO :empno, :nojoyn; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1153;
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
          sqlstm.sqhstv[1] = (unsigned char  *)nojoyn;
          sqlstm.sqhstl[1] = (unsigned long )2;
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1176;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor3 Data Fetch Error...");
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1191;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
   
/* ===========================================================================
  31.00     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가,
                                   계산로직을 직급에 따라 2분화)           
============================================================================= */
/*
   EXEC SQL 
   select   count(*)+1
   into  :devidemon
   from  pkhphis  
   where  substr(paydate,1,4) = :year 
   and   empno = :empno;
*/   
          /* EXEC SQL 
          select  count(distinct substr(paydate,1,6))+1, nvl(sum(nvl(anudamt,0)),0)
                  /osubstr(:paydate,1,4)||decode(length(count(*)),1,'0'||to_char(count(*)+1),to_char(count(*)+1)) ao/
            into  :devidemon, :tmp_anudamt /o, :paymm o/
            from  pkhphis
           where  substr(paydate,1,4) = :year 
             and  empno = :empno
             and  substr(paydate,1,6) < substr(:paydate,1,6); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select (count(distinct substr(paydate,1,6))+1) ,nv\
l(sum(nvl(anudamt,0)),0) into :b0,:b1  from pkhphis where ((substr(paydate,1,\
4)=:b2 and empno=:b3) and substr(paydate,1,6)<substr(:b4,1,6))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1206;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&devidemon;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&tmp_anudamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[3] = (unsigned char  *)empno;
          sqlstm.sqhstl[3] = (unsigned long )5;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)paydate;
          sqlstm.sqhstl[4] = (unsigned long )9;
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

 /*dsa2000  2006.06. 추가. 당월 제외한 이력 Count/Sum 되도록 */
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"급여이력읽기 오류...");
               sprintf(log_buff, " 급여이력읽기 오류...."); 
               Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1241;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");  
          }
   
/* ===========================================================================
  31.00     2002.02.18    유효성   소득세법 개정(컬럼 anuded, standded 추가,
                                   계산로직을 직급에 따라 2분화)           
============================================================================= */      
/*   EXEC  SQL 
   update   pkmpcalc
   set      devidemon = :devidemon
   where    empno = :empno;*/
   
   /*dsa2000 2006.07. 연금보험료 당월까지누적분(tmp_anudamt+anudamt)에서 
                      당월까지누적분/급여개월수*12(즉 1년치)로 변경 공제*/
          /* EXEC  SQL 
          update  pkmpcalc
             set  devidemon = :devidemon,             
                  /oanuded  = :tmp_anudamt + nvl(anudamt,0)o/
                  anuded    = (:tmp_anudamt + nvl(anudamt,0)) / :devidemon * 12
          where   empno = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 22;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmpcalc  set devidemon=:b0,anuded=(((:b1+n\
vl(anudamt,0))/:b0)* 12) where empno=:b3";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1256;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&devidemon;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&tmp_anudamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&devidemon;
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


          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류3...");
               sprintf(log_buff, " 월급여화일 쓰기오류3...."); 
               Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 22;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1287;
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


/******************************************************************************
              중도입사자 일할계산 임당.
******************************************************************************/
void CalMidEnt_DayPay()
{
     int totday = 0;
     /*
     0. 당월만근일수  
     1. 당월중도입사자 추출
     2. 당월내역 수정
     */
     
     /* EXEC SQL 
     SELECT  TO_CHAR(LAST_DAY(TO_DATE(:paydate,'YYYYMM')),'DD')
       INTO  :totday
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMM')),'DD') in\
to :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1302;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&totday;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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


     
     
     /* 임원 *
     EXEC SQL 
     UPDATE  PKMPCALC B
     SET  (
      BASICAMT,
      DUTYAMT,
      MCARAMT)=
      (
      SELECT  CEIL(B.BASICAMT * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.DUTYAMT  * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),   
        CEIL(B.MCARAMT  * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday)     
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01' 
      AND  A.EMPNO = B.EMPNO
      AND  A.EMPNO < '09'   )
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01'  
      AND  A.EMPNO = B.EMPNO
      AND  A.PAYCL < '09'   )
     AND  PAYCL < '09' ;
      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 임원...  ");
      error_quit("작업실패...");
     }
      
     
     EXEC SQL   
     UPDATE  PKMPCALC B
     SET  MCARTAXAMT = GREATEST(MCARAMT - 50000 ,0)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01'  
      AND  A.EMPNO = B.EMPNO
      AND  A.PAYCL < '09'   )
     AND  PAYCL < '09' ;
      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산식교비과세 임원...  ");
      error_quit("작업실패...");
     }
     
     EXEC SQL 
     UPDATE  PKMPCALC B
     SET  (
      FIXPAY,
      HOLIPAY,
      QUATERPAY,
      MATEAMT,
      PARTAMT,
      CHILDAMT,
      MCARAMT
      )=
      (
      SELECT  CEIL(B.FIXPAY    * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.HOLIPAY   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.QUATERPAY * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.MATEAMT   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.PARTAMT   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.CHILDAMT  * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
        CEIL(B.MCARAMT   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday)
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01'
      AND  A.EMPNO = B.EMPNO
      AND  A.PAYCL >= '09' )
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01' 
      AND  A.EMPNO = B.EMPNO
      AND  A.PAYCL >= '09' )
     AND  PAYCL >= '09';
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 연봉대상자...  ");
      error_quit("작업실패...");
     }
     
     EXEC SQL   
     UPDATE  PKMPCALC B
     SET  MCARTAXAMT = GREATEST(MCARAMT - 50000 ,0)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
      AND  A.EMPDATE > :paydate||'01' 
      AND  A.EMPNO = B.EMPNO   
      AND  A.PAYCL >= '09'   )
     AND  PAYCL >= '09' ;
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 식교비과세 연봉대상자...  ");
      error_quit("작업실패...");
     }
     ***** */
     
     /* 당월 중도 입사자 가족수당만 일할 */
     /* EXEC SQL 
     UPDATE  PKMPCALC B
        SET  (
              MATEAMT,
              PARTAMT,
              CHILDAMT
             )=
             (
             SELECT  CEIL(B.MATEAMT   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
                     CEIL(B.PARTAMT   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
                     CEIL(B.CHILDAMT  * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday)
               FROM  PKMPMAS A
              WHERE  A.PAYYN ='Y'
/o                AND  A.EMPDATE > :paydate||'01'  o/
                AND  A.EMPDATE > substr(:paydate,1,6)||'01'                
                AND  A.EMPNO = B.EMPNO
             /o infra   AND  A.PAYCL >= '09' ) o/
                AND  A.PAYCL >= 'C11' )
              WHERE  EMPNO IN 
            (
             SELECT  EMPNO
               FROM  PKMPMAS A
              WHERE  A.PAYYN ='Y'
/o                AND  A.EMPDATE > :paydate||'01'  o/ 
                AND  A.EMPDATE > substr(:paydate,1,6)||'01'                
                AND  A.EMPNO = B.EMPNO
                AND  A.PAYCL >= 'C11' )
                AND  PAYCL >= 'C11'         
            /o infra   AND  A.PAYCL >= '09' )
            infra  AND  PAYCL >= '09' o/
                AND     (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMPCALC B  set (MATEAMT,PARTAMT,CHILDAMT)=(sele\
ct CEIL(((B.MATEAMT* ((:b0-TO_NUMBER(SUBSTR(A.EMPDATE,7,2)))+1))/:b0)) ,CEIL(\
((B.PARTAMT* ((:b0-TO_NUMBER(SUBSTR(A.EMPDATE,7,2)))+1))/:b0)) ,CEIL(((B.CHIL\
DAMT* ((:b0-TO_NUMBER(SUBSTR(A.EMPDATE,7,2)))+1))/:b0))  from PKMPMAS A where\
 (((A.PAYYN='Y' and A.EMPDATE>(substr(:b6,1,6)||'01')) and A.EMPNO=B.EMPNO) a\
nd A.PAYCL>='C11')) where ((EMPNO in (select EMPNO  from PKMPMAS A where (((A\
.PAYYN='Y' and A.EMPDATE>(substr(:b6,1,6)||'01')) and A.EMPNO=B.EMPNO) and A.\
PAYCL>='C11')) and PAYCL>='C11') and (empno>=substr(:b8,1,4) and empno<=subst\
r(:b9,1,4)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1325;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&totday;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&totday;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&totday;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&totday;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&totday;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&totday;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)paydate;
     sqlstm.sqhstl[6] = (unsigned long )9;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)paydate;
     sqlstm.sqhstl[7] = (unsigned long )9;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)frempno;
     sqlstm.sqhstl[8] = (unsigned long )5;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)toempno;
     sqlstm.sqhstl[9] = (unsigned long )5;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
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

       /*Dsa2000 추가..선택한 사원만 계산이 되도록..*/
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 연봉대상자...  ");
          sprintf(log_buff, " 중도입사자 일할계산 연봉대상자...."); 
          Write_batlog(seqno++, log_buff);                        /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
}


/******************************************************************************
  과세급여, 과세상여, 비과세급여, 비과세상여를 구해 DB에 반영하는 함수. 
******************************************************************************/
void  Get_Pays()
{
  /* ===============================================================================
           Version  date(yy.mm.dd)  programmer  description             relevant doc.no
        30.01     1999.03.15     김승회      재무ERP 관련 급여항목 추가
     =============================================================================== */
     /* EXEC SQL
     update pkmpcalc
        set
            lectsupamt =  NVL(lectsupamt1,0) + NVL(lectsupamt2,0)+
                          NVL(lectsupamt3,0) + NVL(lectsupamt4,0),
            edusupamt  =  NVL(edusupamt1 ,0) + NVL(edusupamt2,0),
            hsamt      =  NVL(hsorgamt ,0)+ NVL(hsintamt,0),
            aidamt1    = (NVL(aidamt11 ,0)+ NVL(aidamt12 ,0) + NVL(aidamt13  ,0)+ NVL(aidamt14 ,0)),
            aidamt2    = (NVL(aidamt21 ,0)+ NVL(aidamt22 ,0) + NVL(aidamt23  ,0)+ NVL(aidamt24 ,0)),
            taxpay     = (NVL(taxpay1  ,0)+ NVL(taxpay2  ,0) + NVL(taxpay3   ,0)+ NVL(taxpay4  ,0)),
            notaxpay   = (NVL(notaxpay1,0)+ NVL(notaxpay2,0) + NVL(notaxpay3 ,0)+ NVL(notaxpay4,0)),
            sopaysum   = (NVL(sopaysum1,0)+ NVL(sopaysum2,0) + NVL(sopaysum3 ,0)+
                          NVL(sopaysum4,0)+ NVL(sopaysum5,0) + NVL(sopaysum6 ,0))
      where empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set lectsupamt=(((NVL(lectsupamt1,0)+N\
VL(lectsupamt2,0))+NVL(lectsupamt3,0))+NVL(lectsupamt4,0)),edusupamt=(NVL(edu\
supamt1,0)+NVL(edusupamt2,0)),hsamt=(NVL(hsorgamt,0)+NVL(hsintamt,0)),aidamt1\
=(((NVL(aidamt11,0)+NVL(aidamt12,0))+NVL(aidamt13,0))+NVL(aidamt14,0)),aidamt\
2=(((NVL(aidamt21,0)+NVL(aidamt22,0))+NVL(aidamt23,0))+NVL(aidamt24,0)),taxpa\
y=(((NVL(taxpay1,0)+NVL(taxpay2,0))+NVL(taxpay3,0))+NVL(taxpay4,0)),notaxpay=\
(((NVL(notaxpay1,0)+NVL(notaxpay2,0))+NVL(notaxpay3,0))+NVL(notaxpay4,0)),sop\
aysum=(((((NVL(sopaysum1,0)+NVL(sopaysum2,0))+NVL(sopaysum3,0))+NVL(sopaysum4\
,0))+NVL(sopaysum5,0))+NVL(sopaysum6,0)) where (empno>=substr(:b0,1,4) and em\
pno<=substr(:b1,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1380;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류5...");
          sprintf(log_buff, " 월급여화일 쓰기오류5...."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* ===============================================================================
              Version  date(yy.mm.dd)  programmer  description             relevant doc.no
           30.00     1998.12.29     김승회     급여지급 항목변경        하나로인사재개발
     
     => 변경된 급여지급항목 참조
        =============================================================================== */
     /* EXEC SQL 
     update  pkmpcalc
        set   
             basicamt   = 0,
             bbasicamt  = 0,
             dutyamt   = 0,
             bdutyamt  = 0,
             bonusamt  = 0,
             trainamt  = 0
             /owinteramt  = 0,  dsa2000  2006.04.19 영업인센티브로 변경사용으로 인하여 막음o/
             /ohomesupamt  = 0   dsa2000  2006.06.   선택적복리후생비 변경사용으로 인하여 막음o/
      where  (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4))
        /oinfra   and  paycl >= '09';o/
        and  paycl >= 'C11'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set basicamt=0,bbasicamt=0,dutyamt=0,b\
dutyamt=0,bonusamt=0,trainamt=0 where ((empno>=substr(:b0,1,4) and empno<=sub\
str(:b1,1,4)) and paycl>='C11')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1403;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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

  
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode !=1403))
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류5...");
          sprintf(log_buff, " 월급여화일 쓰기오류5...."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     
     /* EXEC SQL 
     update pkmpcalc
        set   
            taxpaysum = 
                          (
                          basicamt + bbasicamt + dutyamt + bdutyamt +
                          bonusamt + trainamt + winteramt + homesupamt +
                          mateamt  + partamt + childamt + 
                          liceamt + ovtmamt + sptmamt + 
                          aidamt1 + aidamt2 + aidamt3 + 
                          mcartaxamt + selfeduamt  + 
                          odtaxamt   + drvliceamt  + lectsupamt + 
                          edusupamt  + bokjisupamt + medsupamt  +    /osupamt1 + supamt2 + supamt3 + o/
                          sbontaxamt +  longsupamt + itamt +                /odsa2000  2005.01. ITAMT신설 월차수당mbonamt 폐지  +  o/
                          taxpay + sopaysum + /otaxbonus +sobonsum +o/
                          childeduamt +   /oyueduamt +o/
                          nvl(yuedutax,0)  + /o yueduamt - least(nvl(yueduamt,0), TO_NUMBER(:yuedunotax))  + dsa2000  2005.01. 비과세처리 yueduamt o/
                          trainsupamt +  ovmcamt + ybonamt    + /o ybonamt 연차수당 과세처리로 변경 2012.04.09 kth 정문선 매니져 요청 o/
                          fixpay + bfixpay + quaterpay +  holipay + roleamt
                          ), 
            notaxpaysum = 
                          ( 
                          sbonamt  - sbontaxamt +  
                          mcaramt  - mcartaxamt + 
                          odamt    - odtaxamt   +                /o ovmcamt  + * 98 01 add 98.09.04 과세o/
                          notaxpay + 
                          nvl(yueduamt,0) - nvl(yuedutax,0)  /o   유치원학자금 비과세 수정 2010.07.19 kth o/
                          /oleast(nvl(yueduamt,0), TO_NUMBER(:yuedunotax))   유치원학자금 비과세 추가.. 2005.01.  dsa2000o/
                          )
      where  empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set taxpaysum=((((((((((((((((((((((((\
(((((((((((((((basicamt+bbasicamt)+dutyamt)+bdutyamt)+bonusamt)+trainamt)+win\
teramt)+homesupamt)+mateamt)+partamt)+childamt)+liceamt)+ovtmamt)+sptmamt)+ai\
damt1)+aidamt2)+aidamt3)+mcartaxamt)+selfeduamt)+odtaxamt)+drvliceamt)+lectsu\
pamt)+edusupamt)+bokjisupamt)+medsupamt)+sbontaxamt)+longsupamt)+itamt)+taxpa\
y)+sopaysum)+childeduamt)+nvl(yuedutax,0))+trainsupamt)+ovmcamt)+ybonamt)+fix\
pay)+bfixpay)+quaterpay)+holipay)+roleamt),notaxpaysum=((((((((sbonamt-sbonta\
xamt)+mcaramt)-mcartaxamt)+odamt)-odtaxamt)+notaxpay)+nvl(yueduamt,0))-nvl(yu\
edutax,0)) where (empno>=substr(:b0,1,4) and empno<=substr(:b1,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1426;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류6...");
          sprintf(log_buff, " 월급여화일 쓰기오류6...");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* EXEC SQL 
     update pkmpcalc
        set paysum   = (taxpaysum+notaxpaysum),
            realpay  = (taxpaysum+notaxpaysum)    /o명절연봉만 지급시 급여생성만해도 실지급액 업데이트 되도록 항상Update.o/
      where empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set paysum=(taxpaysum+notaxpaysum),rea\
lpay=(taxpaysum+notaxpaysum) where (empno>=substr(:b0,1,4) and empno<=substr(\
:b1,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1449;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류7...");
          sprintf(log_buff, " 월급여화일 쓰기오류7....");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}

/*****************************************************************************
  공제금합을 계산하는 루틴.
*****************************************************************************/
void Get_DedSum()
{  
     /* EXEC SQL 
     update   pkmpcalc
        set   sauamt   = 0
      where  (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4))
   /oinfra   and  (paycl = '0Z' or paycl = 'E0' or paycl='H1' ) ;o/   /o2008.02.19.  일반직사원은 사우회비 공제에서 제외o/  
       and  (paycl = 'H51' or paycl='K11' ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set sauamt=0 where ((empno>=substr(:b0\
,1,4) and empno<=substr(:b1,1,4)) and (paycl='H51' or paycl='K11'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1472;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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

 
     /*and  (paycl = '0Z' or paycl = 'E0' ) ;*/   /*2005.01.27.  dsa2000 J사번 공제 가능토록 'C1' 제외.*/  
     /*and  (paycl = '0Z' or paycl = 'E0' or paycl = 'C1') ;*/
     /*2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  
     and  (paycl = '10' or paycl = 'E0' or paycl = 'C1') ;독립비상임이사,고문,전문계약직*/
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode !=1403))
     {
          print_errmsg(sqlca.sqlcode,"독립비상임이사 월정급제외하고 는 0 : 공제금합");
          sprintf(log_buff, " 독립비상임이사 월정급제외하고 는 0 : 공제금합"); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     /*====================================================================
     기준테이블의 사우회비 공제 제외자는 sauamt를 0으로 세팅 
     01/21/2000 11:52오전        정세영대리 요청
     ====================================================================*/
     /* EXEC SQL
     SELECT SAUEXDFREMP, SAUEXDTOEMP
       INTO :sauexdfremp, :sauexdtoemp 
       from pkcpbas ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select SAUEXDFREMP ,SAUEXDTOEMP into :b0,:b1  from pkcp\
bas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1495;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sauexdfremp;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)sauexdtoemp;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode !=1403))
     {
          print_errmsg(sqlca.sqlcode,"사우회비 공제 제외자 읽기 error");
          sprintf(log_buff, " 사우회비 공제 제외자 읽기 error..."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
           
           
     /* EXEC SQL 
     update   pkmpcalc
        set   sauamt   = 0
      where  (empno >= :sauexdfremp and empno <= :sauexdtoemp) /o급여기준관리에 등록된 사원 공제 안함.o/
        AND  (empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set sauamt=0 where ((empno>=:b0 and em\
pno<=:b1) and (empno>=substr(:b2,1,4) and empno<=substr(:b3,1,4)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1518;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sauexdfremp;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)sauexdtoemp;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toempno;
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

       /*Dsa2000 추가..선택한 사원만 계산이 되도록..*/
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode !=1403))
     {
          print_errmsg(sqlca.sqlcode,"사우회비 공제 제외자 세팅 error ");
          sprintf(log_buff, " 사우회비 공제 제외자 세팅 error."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
      
   /*======================================================*/  
   
     /* EXEC SQL 
     update pkmpcalc  
        set dedsum = (ticketamt + nojoamt + sauamt   + igamt + 
                      sobiamt   + parkamt + chollamt + meddedamt + edudedamt + 
                      dedamt1   + dedamt2 + dedamt3  + dedamt4   + dedamt5   + 
                      empldamt  + saveamt1+ saveamt2 + saveamt3  + bondedamt + 
                      hsamt     + fbamt   + nbamt    + sacorpamt + 
                      sabankamt + sangamt + loanamt1 + loanamt2  + loanamt3 + 
                      meddamt   + anudamt + payholdamt+
                      ovmcded   + sacorpcp+ sabankcp
                     )
      where  empno >= substr(:frempno,1,4) and empno <= substr(:toempno,1,4); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set dedsum=(((((((((((((((((((((((((((\
((((((ticketamt+nojoamt)+sauamt)+igamt)+sobiamt)+parkamt)+chollamt)+meddedamt\
)+edudedamt)+dedamt1)+dedamt2)+dedamt3)+dedamt4)+dedamt5)+empldamt)+saveamt1)\
+saveamt2)+saveamt3)+bondedamt)+hsamt)+fbamt)+nbamt)+sacorpamt)+sabankamt)+sa\
ngamt)+loanamt1)+loanamt2)+loanamt3)+meddamt)+anudamt)+payholdamt)+ovmcded)+s\
acorpcp)+sabankcp) where (empno>=substr(:b0,1,4) and empno<=substr(:b1,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1549;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


      
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류6...");
          sprintf(log_buff, " 월급여화일 쓰기오류6..."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}
/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int   Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1572;
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
     sqlstm.arrsiz = 22;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1613;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
