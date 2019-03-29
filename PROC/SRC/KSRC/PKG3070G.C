
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
    "pkg3070g.pc"
};


static unsigned int sqlctx = 151603;


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
   unsigned char  *sqhstv[38];
   unsigned long  sqhstl[38];
            int   sqhsts[38];
            short *sqindv[38];
            int   sqinds[38];
   unsigned long  sqharm[38];
   unsigned long  *sqharc[38];
   unsigned short  sqadto[38];
   unsigned short  sqtdso[38];
} sqlstm = {12,38};

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

 static char *sq0007 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(D.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
nvl(restmm,0) ,nvl(sprestmm,0) ,NVL(trim(TJOBDUTY),' ')  from PKHOTHIS A ,(se\
lect A.EMPNO ,A.TOTPAY  from PKHDYPHIS A where (A.EMPNO,A.SEQNO) in (select B\
.EMPNO ,max(B.SEQNO) SEQNO  from PKHDYPHIS B where B.YEARPAYNUM=:b0 group by \
B.EMPNO)) B ,PIMPMAS D where (((((SUBSTR(OVTMDATE,1,6)=:b1 and (A.EMPNO>=:b2 \
and A.EMPNO<=:b3)) and A.EMPNO=B.EMPNO) and B.EMPNO=D.EMPNO) and UPPER(NVL(CO\
NYN,' '))='Y') and D.PAYCL>='D91') order by A.EMPNO,OVTMDATE            ";

 static char *sq0009 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(A.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
NVL(RESTMM,0) ,NVL(SPRESTMM,0)  from PKHOTHIS A ,PKHYPHIS B where (((((SUBSTR\
(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and A.EMPNO<=:b2)) and B.YEARPAYNUM=:b3)\
 and A.EMPNO=B.EMPNO) and UPPER(NVL(CONYN,' '))='Y') and PAYCL<='D41') order \
by A.EMPNO,OVTMDATE            ";

 static char *sq0019 = 
"select A.EMPNO ,count(*)  ,sum(EXTHH) ,sum(NIGHTHH) ,sum(HOLIHH) ,sum(OVTMH\
H) ,sum(GENEXT) ,sum(HOLIEXT) ,sum(EXTAMT) ,sum(NIGHTAMT) ,sum(HOLIAMT) ,sum(\
OVTMAMT) ,sum(OVTMHH) ,sum(OVMCAMT) ,B.TOTPAY  from PKHOTHIS A ,PKHYPHIS B wh\
ere ((((A.EMPNO=B.EMPNO and B.YEARPAYNUM=:b0) and SUBSTR(OVTMDATE,1,6)=:b1) a\
nd (A.EMPNO>=:b2 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') group by A\
.EMPNO,B.TOTPAY union all select A.EMPNO ,count(*)  ,sum(A.EXTHH) ,sum(A.NIGH\
THH) ,sum(A.HOLIHH) ,sum(A.OVTMHH) ,sum(A.GENEXT) ,sum(A.HOLIEXT) ,sum(A.EXTA\
MT) ,sum(A.NIGHTAMT) ,sum(A.HOLIAMT) ,sum(A.OVTMAMT) ,sum(A.OVTMHH) ,sum(A.OV\
MCAMT) ,B.TOTPAY  from PKHOTHIS A ,(select A.EMPNO ,A.TOTPAY  from PKHDYPHIS \
A where (A.EMPNO,A.SEQNO) in (select B.EMPNO ,max(B.SEQNO) SEQNO  from PKHDYP\
HIS B where B.YEARPAYNUM=:b0 group by B.EMPNO)) B where ((((A.EMPNO=B.EMPNO a\
nd SUBSTR(OVTMDATE,1,6)=:b1) and (A.EMPNO>=:b2 and A.EMPNO<=:b3)) and A.EMPNO\
 like 'Y%') and UPPER(NVL(CONYN,' '))='Y') group by A.EMPNO,B.TOTPAY order by\
 EMPNO            ";

 static char *sq0033 = 
"select EMPNO ,DAYKIND ,sum(OVTMHH) ,sum(OVTMAMT)  from PKHOTHIS where ((SUB\
STR(OVTMDATE,1,6)=:b0 and (EMPNO>=:b1 and EMPNO<=:b2)) and UPPER(NVL(CONYN,' \
'))='Y') group by EMPNO,DAYKIND order by EMPNO,DAYKIND            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,53,0,4,260,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,44,0,1,270,0,0,0,0,0,1,0,
39,0,0,3,47,0,4,395,0,0,1,0,0,1,0,2,4,0,0,
58,0,0,4,47,0,4,400,0,0,1,0,0,1,0,2,4,0,0,
77,0,0,5,252,0,5,405,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
104,0,0,6,75,0,2,425,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
131,0,0,7,609,0,9,495,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
162,0,0,7,0,0,15,501,0,0,0,0,0,1,0,
177,0,0,7,0,0,13,507,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,4,0,0,2,3,0,0,2,3,0,0,2,97,0,0,
236,0,0,7,0,0,15,513,0,0,0,0,0,1,0,
251,0,0,8,254,0,5,588,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
278,0,0,9,414,0,9,638,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
309,0,0,9,0,0,15,644,0,0,0,0,0,1,0,
324,0,0,9,0,0,13,650,0,0,10,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,4,0,0,2,3,0,0,2,3,0,0,
379,0,0,9,0,0,15,655,0,0,0,0,0,1,0,
394,0,0,10,117,0,4,1975,0,0,3,2,0,1,0,1,97,0,0,1,4,0,0,2,97,0,0,
421,0,0,11,81,0,4,1995,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
444,0,0,12,66,0,4,2016,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
467,0,0,13,265,0,4,2059,0,0,6,5,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
506,0,0,14,143,0,4,2218,0,0,7,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,2,4,0,0,
549,0,0,15,187,0,4,2239,0,0,9,2,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
600,0,0,16,44,0,4,2341,0,0,1,0,0,1,0,2,4,0,0,
619,0,0,17,433,0,5,2372,0,0,29,29,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
750,0,0,18,269,0,5,2411,0,0,10,10,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
805,0,0,19,1017,0,9,2565,0,0,8,8,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
852,0,0,19,0,0,15,2570,0,0,0,0,0,1,0,
867,0,0,19,0,0,13,2587,0,0,15,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,
942,0,0,19,0,0,15,2595,0,0,0,0,0,1,0,
957,0,0,20,57,0,2,2645,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
980,0,0,21,196,0,3,2658,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1003,0,0,22,251,0,3,2674,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1034,0,0,23,188,0,5,2718,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1069,0,0,24,187,0,4,2735,0,0,9,2,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
1120,0,0,25,143,0,4,2799,0,0,7,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,2,4,0,0,
1163,0,0,26,374,0,5,2830,0,0,38,38,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,4,0,
0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1330,0,0,27,221,0,5,2863,0,0,10,10,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1385,0,0,28,384,0,3,2903,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1420,0,0,29,230,0,5,2987,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,
1459,0,0,30,248,0,5,3045,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1494,0,0,31,216,0,5,3067,0,0,5,5,0,1,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
1529,0,0,32,193,0,5,3087,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1560,0,0,33,218,0,9,3126,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1587,0,0,33,0,0,15,3132,0,0,0,0,0,1,0,
1602,0,0,33,0,0,13,3140,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
1633,0,0,33,0,0,15,3144,0,0,0,0,0,1,0,
1648,0,0,34,80,0,5,3171,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1679,0,0,35,80,0,5,3189,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1710,0,0,36,82,0,5,3207,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1741,0,0,37,93,0,4,3233,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1772,0,0,38,75,0,2,3250,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1799,0,0,39,77,0,4,3306,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
1826,0,0,40,50,0,3,3373,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1867,0,0,41,0,0,29,3383,0,0,0,0,0,2,6,76,79,71,95,68,66,
1888,0,0,42,122,0,4,3420,0,0,4,2,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
1919,0,0,43,126,0,4,3438,0,0,4,2,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
1950,0,0,44,108,0,3,3456,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1977,0,0,45,219,0,4,3479,0,0,9,2,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
2028,0,0,46,122,0,3,3488,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,
2083,0,0,47,228,0,5,3512,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
2110,0,0,48,219,0,4,3542,0,0,9,2,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,
2161,0,0,49,242,0,5,3551,0,0,10,10,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2216,0,0,50,325,0,4,3585,0,0,8,6,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3070G(초과근무수당  계산/월별집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 30.00
 Date           : 1999.01.05

Update Contents
 Version  date(yy.mm.dd)  programmer       description                        relevant doc.no
 1.00     1997.02.13      김승회             최초개발본                         설계명세서
 30.00    1999.01.05      민정숙           시간당통상임금계산로직변경         하나로재개발
 30.05    1999.09.05      이랑교
             1.휴식시간, 근무시간중 휴식시간추가
             2. Hint 연동에서 자료입력 (사번 근무일등 인사사항은 급여마스터기준으로 update)
 30.10    2000.07.25.     유효성           집계테이블의 시간당 통상임금 update 부분 수정
 30.20    2001.08.09.     유효성           휴일근무시 식사시간 제외 추가       전(2001-3450)
                                           (pkhothis에 mealhh, mealamt,excephh,excepamt 추가)
 30.30    2001.11.13.     유효성           근태테이블(pkhduty)의 대휴(repoff)를 불러와
                                           최종계산된 초과수당(pkhotsum의 ovtmamt)에서 빼는 로직 추가.
 30.40    2002.08.28      유효성           전문계약직 추가                     전(2002-3755)
 30.41    2003.02.27      강륜종           2003년 02월 1일부터 초과근무 야근식대 인상 : 3000 => 3500
 30.42    2004.02.24      강륜종           Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.
 30.50    2004.08.27.     강륜종(dsa200)   야근식대 DB에서(PKCOTBAS) 읽어오도록 변경
 30.60    2004.11.        강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.
          2008.09         김태호           일반직 사원을 정규사원과 동일 하게 변경함.
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
#define  FRTIME1  "2200"   /* 야간근무시작시간    */
#define  TOTIME1  "3000"   /* 야간근무종료시간(익일06:00)  */
#define  FRTIME2  "4600"   /* 야간근무시작시간(익일22:00)   */
#define  TOTIME2  "4800"   /* 야간근무종료시간(익일24:00)  */


/*** 함수 Prototype 선언  ***/

/*DB package에서 계산 jissi. 2014.11.05
double  get_tongpay(char *);
*/
void    get_lastsaturday(char* yymm, char* lastsaturday);
void    get_dayname(char *indate,char *result);
void    get_lastday(char* yymm, char* result);
void    add_days(char* indate,int m, char* rdate);
double  calc_term(char *frdate,char *todate);
void    trail_spaces(char *dest);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 


/***  초과근무이력테이블(PKHOTHIS) 참조변수  ***/
     char    ovtmdate[9]      = "";  /* 근무일자   */
     char    empno[5]         = "";  /* 사번     */
     char    korname[13]      = "";  /* 성명     */
     char    paycl[4]         = "";  /* 직급     */
     double  paygr            = 0;   /* 호봉     */
     char    payra[4]         = "";  /* 직위     */
     char    orgnum[4]        = "";  /* 조직차수   */
     char    deptcode[7]      = "";  /* 부서코드   */
     char    otkind[3]        = "";  /* 초과근무구분   */
     char    daykind[2]       = "";  /* 근무일구분   */
     char    frapptime[5]     = "";  /* 근무예정시간From  */
     char    toapptime[5]     = "";  /* 근무예정시간To  */
     char    toappdate[9]     = "";  /* 근무예정일To   */
     char    ovtmdesc[31]     = "";  /* 근무내역   */
     char    frrealtime[13]   = "";  /* 실제개시시간   */
     char    torealtime[13]   = "";  /* 실제종료시간   */
     float   exthh            = 0;   /* 연장근로시간   */
     double  nighthh          = 0;   /* 야간근로시간   */
     double  holihh           = 0;   /* 휴일근로시간   */
     double  overhh           = 0;   /* 초과근무시간계  */
     float   ovtmhh           = 0;   /* 초과근무시간총계  */
     float   genext           = 0;   /* 일반연장근로시간  */
     double  holiext          = 0;   /* 휴일연장근로시간  */
     char    apptime[13]      = "";  /* 신청시각   */
     char    conyn[2]         = "";  /* 결재여부   */
     char    contime[13]      = "";  /* 결재일시   */
     char    conemp[5]        = "";  /* 결재자사번   */
     char    conlemp[5]       = "";  /* 최종결재자사번  */
     char    conltime[13]     = "";  /* 최종결재일시   */
     char    giveyn[2]        = "";  /* 지급여부   */
     double  ovtmrate         = 0;   /* 초과근무비율   */
     double  extamt           = 0;   /* 연장근로수당   */
     double  nightamt         = 0;   /* 야간근로수당   */
     double  holiamt          = 0;   /* 휴일근로수당   */
     double  overamt          = 0;   /* 초과근무수당계  */
     double  ovtmamt          = 0;   /* 초과근무수당총계  */
     double  ovmcamt          = 0;
     double  ovminamt         = 0;   /* 기준통상임금(최저) 적용 (2008.02.18 추가)     */
     double  y_manrate        = 0;   /* 일반직 관리수수료율  (2008.03.20 추가),통상임금 계산시 사용     */
     char    tjobduty[3]      = "";  /* 담당직무  E1,H1 변경 KTH   */
     char    dinner[2]        = "";  /* 석식장소   */

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 ============================================================================= */
     double  totpay    = 0;

/*  double  basicamt  = 0;
  double  infoamt   = 0;
  double  dutyamt   = 0;  */

     double  t_nighthh     = 0;  /* 야간근로시간   */
     float  t_genexthh     = 0;  /* 일반연장근로시간  */
     double  t_holihh      = 0;  /* 휴일근로시간   */
     double  t_holiexthh   = 0;  /* 휴일연장근로시간  */
     double  t_extamt      = 0;  /* 연장근로수당   */
     double  t_nightamt    = 0;  /* 야간근로수당   */
     double  t_holiamt     = 0;  /* 휴일근로수당    */
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.01    1999.08.17       이랑교     notes에서 초과근무 등록후 수당계산
 ============================================================================= */
     int     t_restmm      = 0;  /* 초과근무제외시간  */
     double  t_restamt     = 0;  /* 초과근무제외수당  */
     int     t_sprestmm    = 0;  /* 근무시간에 휴식한 제외시간  */
     double  t_sprestamt   = 0;  /* 근무시간에 휴식한 제외수당  */

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성     휴일근무시 식사시간 제외 추가  전(2001-3450)
============================================================================= */
     double  t_mealhh      = 0;  /* 식사시간제외시간           */
     double  t_excephh     = 0;  /* 9시간이상시 제외시간   */
     double  t_mealamt     = 0;  /* 식사시간제외수당             */
     double  t_excepamt    = 0;  /* 9시간이상시 제외수당   */

     double  s_totdd;
     float   s_exthh;
     double  s_nighthh;
     double  s_holihh;
     double  s_tothh;
     float   s_genext;
     double  s_holiext;
     double  s_extamt;
     double  s_nightamt;
     double  s_holiamt;
     double  s_ovtmamt;
     double  s_ovmcamt;
     float   s_ovtmhh;

     char    workmm[7]       = "";  /* 작업년월   */
     char    frempno[5]      = "";  /* 사번FROM   */
     char    toempno[5]      = "";  /* 사번TO   */
     char    totalYN[2]      = "";  /* 집계여부   */
     char    jobempno[5]     = "";  /* 작업자사번   */
     char    sumkind[2]      = "";  /* 집계형태   */
     char    bgntime[5]      = "";  /* 석식시작 시간*/
     char    endtime[5]      ="" ;  /* 석식end 시간*/
     int     rephh           = 0 ;  /*대휴기준시간*/
     char    comchdate[9]    = "";  /* 통상임금기준변경일 2014.11 jissi */
     char    yearpaynum[7]   = "";  /* 반영연봉차수       2016.12 jissi */

     char    t_paycl[4]      = "";

     long    s_count         = 0;
     long    f_count         = 0;
     double  total_amt       = 0;

     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* 10분단위 계산위한 분단위 변수 */
     int     t_extmm         = 0;   /* 연장근로분 */
     int     t_nightmm       = 0;   /* 야간근로분 */
     int     t_holimm        = 0;   /* 휴일근로분 */
     int     t_genextmm      = 0;   /* 일반연장근로분 */
     int     t_holiextmm     = 0;   /* 휴일연장근로분 */
     int     t_mealmm        = 0;   /* 식사시간제외분 */

     int     pre_genextsum   = 0;   /* 전,당월 일반연장합 */
     int     pre_holiextsum  = 0;   /* 전,당월 휴일연장합 */
     int     pre_nightsum    = 0;   /* 전,당월 야간근로합 */
     int     pre_holisum     = 0;   /* 전,당월 휴일근로합 */
     int     pre_mealsum     = 0;   /* 전,당월 식사시간합 */
     int     pre_restsum     = 0;   /* 전,당월 초과근무제외합 */
     int     pre_sprestsum   = 0;   /* 전,당월 근로시간휴식제외합 */

     int     nxt_extmm       = 0;   /* 이월 연장근로분 */
     int     nxt_nightmm     = 0;   /* 이월 야간근로분 */
     int     nxt_holimm      = 0;   /* 이월 휴일근로분 */
     int     nxt_genextmm    = 0;   /* 이월 일반연장근로분 */
     int     nxt_holiextmm   = 0;   /* 이월 휴일연장근로분 */
     int     nxt_mealmm      = 0;   /* 이월 식사시간제외분 */
     int     nxt_restmm      = 0;   /* 이월 초과근무제외시간 */
     int     nxt_sprestmm    = 0;   /* 이월 근무시간에 휴식한 제외시간 */

/* EXEC SQL END DECLARE SECTION; */ 

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


char  LSaturday[8+1]  = "";
char  mm[3] = "";
int   id;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = "";
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0;

void main(int argc,char *argv[])
{
     int  flag;
     char FL_file[255];


     /*dsa2000 Rexec 대체 파라미터 추가...*/
     if  (argc != 10) {  /*/hper/insa/HINSA/proc/bin/Kbin/pkg3070g 201509 0000 zzzz Y 0 2563 pkg3070g 20151007140600 201601*/
          printf("[Usage] : pkg3070g 1.작업월 2.사번fr 3.사번to 4.집계방법(전체Y, 일부N) .\n");
          printf("[Usage] :          5.집계방법(전체0,일부1)  6.작업자사번 7.프로그램ID 8.시작시간 9.반영연봉차수  \n");
          exit(1);
     }

     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkg3070g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }

     strcpy(workmm,argv[1]);
     strcpy(frempno,argv[2]);
     strcpy(toempno,argv[3]);
     strcpy(totalYN,argv[4]);
     strcpy(sumkind,argv[5]);
     strcpy(jobempno,argv[6]);
     strcpy(yearpaynum,argv[9]);

     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"초과근무수당 생성/계산 시작...[pkg3070g]");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/

     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[6]);
     strcpy(log_progid,   argv[7]);
     strcpy(log_rundate,  argv[8]);

     /* 통상임금기준변경일 2014.11 jissi */
     /* EXEC SQL
     SELECT  value1
       INTO  :comchdate
       FROM PKCVARI
      WHERE gubun ='CM'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select value1 into :b0  from PKCVARI where gubun='CM'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)comchdate;
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



     /* EXEC SQL DECLARE log_db DATABASE; */ 

     hinsa_log_db_connect();
     /*========================================================*/

     /* EXEC SQL LOCK TABLE PKHOTHIS
       IN   EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKHOTHIS IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )24;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     /*get_lastsaturday(workmm,LSaturday);
     printf(" 마지막 토요일 : %s \n",LSaturday);
     return;
     */

     if  (clear_records() != SUCCESS)
     {
          sprintf(log_buff, "= 작업실패 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0," 작업실패. !!!\n");
     }

     s_count = f_count = total_amt =  0;

     /*하절기 동절기 식사시간 세팅 :  동절기 근무제 폐지 2008.11 kth. 동절기 근무제 부활(2006.11.) dsa2000.    동절기 근무제 폐지(2004.11.)*/
     strncpy(mm,workmm+4,2) ;

     strcpy(bgntime, "1800")  ;
     strcpy(endtime, "1900")  ;
     rephh = 8 ;

           /*
     if ((strcmp( mm, "11") == 0 ) ||
         (strcmp( mm, "12") == 0 ) ||
         (strcmp( mm, "01") == 0 ) ||
         (strcmp( mm, "02") == 0 ))
        {
          strcpy(bgntime, "1700")  ;
          strcpy(endtime, "1800")  ;
          rephh = 7 ;
        }
     else
        {
          strcpy(bgntime, "1800")  ;
          strcpy(endtime, "1900")  ;
          rephh = 8 ;
        }*/

     /*정규직 초과근무 계산*/
     flag =  process_records();

     printf("\n 정규직 ====================================");
     sprintf(log_buff, "\n 정규직 ===================================="); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
     sprintf(log_buff, "\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
     sprintf(log_buff, "\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n 총수당액 : %10.0f \n",total_amt);
     sprintf(log_buff,"\n 총수당액 : %10.0f \n",total_amt); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);


     s_count = f_count = total_amt =  0;


     /*계약직 초과근무 계산*/
     flag =  process_records_con();

     printf("\n 계약직 ====================================");
     sprintf(log_buff, "\n계약직 ===================================="); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
     sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
     sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n 총수당액 : %10.0f \n",total_amt);
     sprintf(log_buff,"\n 총수당액 : %10.0f \n",total_amt); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     printf("\n totalYN : [%s] flag [%d] \n",totalYN,flag);

     process_sumstep1();

     print_Lastamt();

/* ===============================================================================
 Version  date(yy.mm.dd)  programmer    description                        relevant doc.no
 30.30    2001.11.13.      유효성       근태테이블(pkhduty)의 대휴(repoff)및 교휴(speoff)  를 불러와
                                        최종계산된 초과수당(pkhotsum의 ovtmamt)에서 빼는 로직 추가.
 ============================================================================= */
     if  (process_repoff() != SUCCESS )
     {
          sprintf(log_buff,"대휴수당 계산작업 실패"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업이 실패했습니다.\n");
     }

     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [작업 성공] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0,"OK ====== [작업 성공] =====\n");
     }

}

/*****************************************************************************
  계산 전 해당항목을 Clear하는 함수.
 *****************************************************************************/
clear_records()
{
     ovminamt  = 0; /* 통상임금이 시간당 최저 임금보다 낮을 경우 최저임금으로 계산 */
     y_manrate = 0;/* 일반직 통상임금 계산시 관리수수료율 사용 */

     /* EXEC SQL
     SELECT   nvl(OVMINAMT,0)
       INTO   :ovminamt
       FROM   PKCOTBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(OVMINAMT,0) into :b0  from PKCOTBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )39;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&ovminamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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



     /* EXEC SQL
     SELECT   nvl(Y_MANRATE,0)
       INTO   :y_manrate
       FROM   PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(Y_MANRATE,0) into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )58;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&y_manrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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



     /* EXEC SQL
     UPDATE  PKHOTHIS
        SET  EXTHH    = 0,  NIGHTHH   = 0,  HOLIHH   = 0,
             OVTMHH   = 0,  OVMCAMT   = 0,  GENEXT   = 0,
             HOLIEXT  = 0,  EXTAMT    = 0,  NIGHTAMT = 0,
             HOLIAMT  = 0,  OVTMAMT   = 0,  RESTAMT  = 0,
             SPRESTAMT= 0,  MEALHH    = 0,  MEALAMT  = 0,
             EXCEPHH  = 0,  EXCEPAMT  = 0
      WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  (EMPNO >= :frempno AND EMPNO <= :toempno ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS  set EXTHH=0,NIGHTHH=0,HOLIHH=0,OVTMHH=\
0,OVMCAMT=0,GENEXT=0,HOLIEXT=0,EXTAMT=0,NIGHTAMT=0,HOLIAMT=0,OVTMAMT=0,RESTAM\
T=0,SPRESTAMT=0,MEALHH=0,MEALAMT=0,EXCEPHH=0,EXCEPAMT=0 where (SUBSTR(OVTMDAT\
E,1,6)=:b0 and (EMPNO>=:b1 and EMPNO<=:b2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )77;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, 자료 Clear Error. \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 자료 Clear Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

/*2002.6.17 유효성 추가 */
     /* EXEC SQL
     DELETE  FROM PKHOTSUM
      WHERE (EMPNO >= :frempno AND EMPNO <= :toempno)
        AND OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHOTSUM  where ((EMPNO>=:b0 and EMPNO<=:b\
1) and OVTMYYMM=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )104;
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
     sqlstm.sqhstv[2] = (unsigned char  *)workmm;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, 자료 Delete Error. \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d,  자료 Delete Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  대상자료를 추출하는 함수.== 계약직사원
 *****************************************************************************/
process_records_con()
{
     char  t_date[11]   = "";
     int   term = 0;
     char  stime[5] = "";
     char  etime[5] = "";
     int   daykind  = 0;
     char  str[8+1]   = "";
     int   dd   = 0;
/* 2016.12.14 jissi 반영연봉차수로 변경
     EXEC SQL DECLARE cursor_2 CURSOR FOR
     SELECT
            NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
            NVL(A.KORNAME,' '),NVL(D.PAYCL,' '),
            NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
            NVL(TOREALTIME,'*'), totpay,
            nvl(restmm, 0), nvl(sprestmm, 0),NVL(TRIM(TJOBDUTY),' ')
      FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C,PIMPMAS D
     WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  (to_char(C.YEARPAYNUM) =  B.YEARPAYNUM )
       AND  (A.EMPNO = B.EMPNO)
       AND  (B.EMPNO = D.EMPNO)
       AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
 *infra   AND  A.PAYCL >='99'  *
       AND  D.PAYCL >='D91'
     ORDER  BY A.EMPNO, OVTMDATE;
*/
     /* EXEC SQL DECLARE cursor_2 CURSOR FOR
     SELECT
            NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
            NVL(A.KORNAME,' '),NVL(D.PAYCL,' '),
            NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
            NVL(TOREALTIME,'*'), totpay,
            nvl(restmm, 0), nvl(sprestmm, 0),NVL(TRIM(TJOBDUTY),' ')
      FROM  PKHOTHIS A,
            ( SELECT A.EMPNO, A.TOTPAY
                FROM PKHDYPHIS A 
               WHERE (A.EMPNO, A.SEQNO) IN ( SELECT B.EMPNO, MAX(B.SEQNO) AS SEQNO  
                                               FROM PKHDYPHIS B                     
                                              WHERE B.YEARPAYNUM = :yearpaynum     
                                              GROUP BY B.EMPNO )) B,   /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
             PIMPMAS D
     WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  (A.EMPNO = B.EMPNO)
       AND  (B.EMPNO = D.EMPNO)
       AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
/oinfra   AND  A.PAYCL >='99'  o/
       AND  D.PAYCL >='D91'
     ORDER  BY A.EMPNO, OVTMDATE; */ 

     /* EXEC SQL OPEN cursor_2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )131;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, cursor_2 Open Error\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d,  cursor_2 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor_2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )162;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }

     while(1)
     {
          /* EXEC SQL FETCH cursor_2
             INTO :ovtmdate,   :empno,      :korname, :paycl,
                  :frapptime,  :frrealtime,
                  :torealtime, :totpay,  :t_restmm ,  :t_sprestmm,  :tjobduty ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )177;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
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
          sqlstm.sqhstv[2] = (unsigned char  *)korname;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)paycl;
          sqlstm.sqhstl[3] = (unsigned long )4;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)frapptime;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)frrealtime;
          sqlstm.sqhstl[5] = (unsigned long )13;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)torealtime;
          sqlstm.sqhstl[6] = (unsigned long )13;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&totpay;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)tjobduty;
          sqlstm.sqhstl[10] = (unsigned long )3;
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
               /* EXEC SQL CLOSE cursor_2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )236;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }

          trail_spaces(frapptime);
          trail_spaces(frrealtime);
          trail_spaces(torealtime);
          trail_spaces(paycl);

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;

          strncpy(str,frrealtime,8);

          /* ========================================
          심야근로, 식사시간
          ========================================  */

          if ((get_nighthh(frrealtime,torealtime) == SUCCESS) &&
              (get_genexthh_con(frrealtime, torealtime) == SUCCESS) &&
              (process_holihh(frrealtime,torealtime) == SUCCESS) &&       /* 정규직과 일반직 사원 휴일 수당 동일 하게 계산 작업 kth*/
              (get_mealhh_con(frrealtime, torealtime) == SUCCESS) &&      /* 정규직, 계약직 식사시간 분리 - 2018.02.08 SangMoon Lee */
              (get_excepthh(frrealtime, torealtime)== SUCCESS))
          {
               if  (update_record() != SUCCESS)
               {
                    printf(" EMPNO : %s, KORNAME : %s \n ", empno,korname);
                    /*sprintf(log_buff, "EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                              /*Write_batlog(seqno++, log_buff);*/
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                    printf(" 초과근무일자 : %s \n",t_date);
                    printf(" BAND : %s \n",paycl);
               }
               s_count++;
          }
          else
          {
               f_count++;
               printf(" 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
               /*sprintf(log_buff, " 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff);*/
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               printf(" 초과근무일자 : %s \n",t_date);
          }
     }
}

/*****************************************************************************
  대상자료를 추출하는 함수.== 정규사원
 *****************************************************************************/
process_records()
{
     char  t_date[11]   = "";

     /* EXEC SQL
     UPDATE  PKHOTHIS A
        SET (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCODE )=
          (SELECT B.PAYCL,B.PAYGR,B.PAYRA,B.ORGNUM,B.DEPTCODE
                 FROM   PKMPMAS B
                 WHERE A.EMPNO = B.EMPNO
          )
     WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  UPPER(NVL(CONYN,' ')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where ((SUBSTR(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and \
A.EMPNO<=:b2)) and UPPER(NVL(CONYN,' '))='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )251;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
     }
/*
     EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT
             NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             NVL(RESTMM,0),NVL(SPRESTMM,0)
       FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C
      WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
        AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  (to_char(C.YEARPAYNUM) =  B.YEARPAYNUM)
        AND  (A.EMPNO = B.EMPNO)
        AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
        AND  PAYCL <='D41'       *infra   PAYCL <='99' *
      ORDER  BY A.EMPNO, OVTMDATE;
*/
     /* EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT
             NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             NVL(RESTMM,0),NVL(SPRESTMM,0)
       FROM  PKHOTHIS A, PKHYPHIS B
      WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
        AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  (B.YEARPAYNUM = :yearpaynum)
        AND  (A.EMPNO = B.EMPNO)
        AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
        AND  PAYCL <='D41'      /oinfra   PAYCL <='99' o/
      ORDER  BY A.EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0009;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )278;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
     sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, Cursor1 Open Error\n",  sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, Cursor1 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )309;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }

     while(1)
     {
          /* EXEC SQL FETCH cursor1
             INTO :ovtmdate, :empno, :korname, :paycl,
                  :frapptime,:frrealtime,
                  :torealtime, :totpay, :t_restmm,:t_sprestmm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )324;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
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
          sqlstm.sqhstv[2] = (unsigned char  *)korname;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)paycl;
          sqlstm.sqhstl[3] = (unsigned long )4;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)frapptime;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)frrealtime;
          sqlstm.sqhstl[5] = (unsigned long )13;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)torealtime;
          sqlstm.sqhstl[6] = (unsigned long )13;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&totpay;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
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


          if (sqlca.sqlcode == 1403) {
            /* EXEC SQL CLOSE cursor1; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 11;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )379;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            return(SUCCESS);
          }

          trail_spaces(frapptime);
          trail_spaces(frrealtime);
          trail_spaces(torealtime);
          trail_spaces(paycl);

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;


          if ( (get_nighthh(frrealtime,torealtime)    == SUCCESS) &&
               (get_genexthh(frrealtime,torealtime)   == SUCCESS) &&
               (process_holihh(frrealtime,torealtime) == SUCCESS) &&
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가
============================================================================= */
               (get_mealhh(frrealtime, torealtime) == SUCCESS) &&
               (get_excepthh(frrealtime, torealtime)== SUCCESS) )
          {
               if  (update_record() != SUCCESS)
               {
                    printf(" EMPNO : %s, KORNAME : %s \n ", empno,korname);
                    /*sprintf(log_buff, " EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                              /*Write_batlog(seqno++, log_buff);*/
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                    printf(" 초과근무일자 : %s \n",t_date);
                    printf(" BAND : %s \n",paycl);
               }
               s_count++;
          }
          else
          {
               f_count++;
               printf(" 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
               /*sprintf(log_buff, " 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff);*/
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               printf(" 초과근무일자 : %s \n",t_date);
          }
     }

}


/**********************************************************************************************
  야간근로시간을 실제근무시작시간과 실제근무종료시간으로 부터 구하는 함수. (총 10시간 이내범위)

  (야간근로시간 인정시간)
  당일 22:00 ~ 익일 06:00 (8시간)
  익일 22:00 ~ 익일 24:00 (2시간)
  => 초과근무 시작시간과 종료시간을 계산하여 실제 야간근로시간에 해당되는 시간을 산출.
***********************************************************************************************/
get_nighthh(char *frtime, char *totime)
{
     int    dd       = 0;
     int    tmp      = 0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     int    btime1   = 0;
     int    btime2   = 0;
     int    btime3   = 0;
     int    btime4   = 0;
     int    istime   = 0;
     int    ietime   = 0;

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);
     btime1 = atoi(FRTIME1);
     btime2 = atoi(TOTIME1);
     btime3 = atoi(FRTIME2);
     btime4 = atoi(TOTIME2);

           //printf(" 초과근무일자 : %s \n",frtime);

     dd = check_datetime(frtime,totime);
     if  (dd == FAIL)
          return(FAIL);

     if  (dd == 1)
     {
          strncpy(t_str,totime+8,4);
          //printf(" 초과근무일자 : %s \n",t_str);

          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }
     else if ((dd == 0) && (strcmp(stime,"0000") >= 0) &&
              (strcmp(stime,"0800") < 0))
     {
          strncpy(t_str,frtime+8,4);
          tmp   = atoi(t_str);
          istime   = tmp + 2400;

          strncpy(t_str,totime+8,4);
          tmp = atoi(t_str);
          ietime = tmp + 2400;
          //printf(" 초과근무일자 : %s,%s,%s,%s \n",tmp,istime,ietime);
     }

     if ((istime >= btime1) && (istime <= btime2) &&
         (ietime > btime2) )
     {
          t_nighthh = get_hourterm(istime,btime2);  /* 야간근무시간 인정시간 : 실제시작시간 ~ 익일06:00 */
          t_nightmm = get_minterm(istime,btime2);
     }
     else if ((ietime >= btime1) &&
              (ietime <= btime2) &&
              (istime < btime1))
     {
          t_nighthh = get_hourterm(btime1,ietime);  /* 야간근무시간 인정시간 : 22:00 ~ 실제종료시간  */
          t_nightmm = get_minterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) &&
              (ietime <= btime2) && (ietime >  istime))
     {
          t_nighthh = get_hourterm(istime,ietime);
          t_nightmm = get_minterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime))
     {
          t_nighthh = get_hourterm(btime1,btime2);  /* 야간근무시간 인정시간 : 22:00 ~ 익일06:00  */
          t_nightmm = get_minterm(btime1,btime2);
     }
     else
     {
          t_nighthh = 0;
     }

     if ((ietime >= btime3) && (ietime <= btime4)) {
          t_nighthh += get_hourterm(btime3,ietime); /* 야간근무시간 인정시간 : 익일 야간근무시간까지 합산(2시간이내) */
          t_nightmm += get_minterm(btime3,ietime);
     }

     return(SUCCESS);
}
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가
============================================================================= */

/*****************************************************************************
  실제근무시작시간과 실제근무종료시간으로 부터 식사시간을 구하는 함수.== 정규직
******************************************************************************/
get_mealhh(char *frtime, char *totime)
{
     int    dd       =  0;
     int    tmp      =  0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     char   str[8+1] = "";
     int    btime1   =  0;
     int    btime2   =  0;
     int    istime   =  0;
     int    ietime   =  0;
     int    daykind  =  0;
     /* double t_mealmm =  0; */

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);


     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     dd = check_datetime(frtime,totime);


     if  (dd == FAIL)
          return(FAIL);

     if ((daykind == 1)  && (dd == 0) ) /*평일이면서 초과근무시간이 당일 범위 이내이면 계산안함.*/
          return (SUCCESS) ;

     if  (dd == 1)
     {
          strncpy(t_str,totime+8,4);
          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }


/* 아침, 점심, 저녁 식사시간을 차례로 계산 */
     if  (daykind == 4 )
     {
/*아침*/

          btime1 = 800 ;
          btime2 = 900 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm  = get_minterm(istime, btime2) ;
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm  = get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm = get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm = get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm = 0;
          }

/*점심*/
          btime1 = 1200 ;
          btime2 = 1300 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm +=  get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm  += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }
     }

/*저녁*/
     /* 석식시간은 동절기, 하절기에 따른 구분값 적용하여 계산 */
     btime1 = atoi(bgntime) ;
     btime2 = atoi(endtime) ;


     if ((istime >= btime1) && (istime <= btime2) &&
         (ietime > btime2) )
     {
          t_mealmm += get_minterm(istime,btime2);
     }
     else if ((ietime >= btime1) &&
              (ietime <= btime2) &&
              (istime < btime1))
     {
          t_mealmm += get_minterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) &&
              (ietime <= btime2) && (ietime >  istime))
     {
          t_mealmm += get_minterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime))
     {
          t_mealmm += get_minterm(btime1,btime2);
     }
     else
     {
          t_mealmm += 0;
     }


/*다음날 아침*/

     if ((dd == 1) && (strcmp(etime,"0800") > 0))
     {
          btime1 = 800 + 2400 ;
          btime2 = 900 + 2400 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )    {
               t_mealmm += get_minterm(istime, btime2) ;
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }


/* 다음날 점심*/

          btime1 = 1200 + 2400 ;
          btime2 = 1300 + 2400 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm  +=  get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm  += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }


/*다음날 저녁*/

          btime1 = atoi(bgntime) + 2400;
          btime2 = atoi(endtime) + 2400;


          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm  += get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }
     }
     t_mealhh = floor(t_mealmm / 60) ;

     return(SUCCESS);
}

/* 계약직 식사시간 기준 변경으로 식사시간 로직 정규직, 계약직 분리 - 2018.02.08 SangMoon Lee */
/* 계약직은 조식시간 제외 되도록... - HR팀 김선일M [SR-1802-0251] */

/*****************************************************************************
  실제근무시작시간과 실제근무종료시간으로 부터 식사시간을 구하는 함수.== 계약직
******************************************************************************/
get_mealhh_con(char *frtime, char *totime)
{
     int    dd       =  0;
     int    tmp      =  0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     char   str[8+1] = "";
     int    btime1   =  0;
     int    btime2   =  0;
     int    istime   =  0;
     int    ietime   =  0;
     int    daykind  =  0;
     /* double t_mealmm =  0; */

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);


     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     dd = check_datetime(frtime,totime);


     if  (dd == FAIL)
          return(FAIL);

     if ((daykind == 1)  && (dd == 0) ) /*평일이면서 초과근무시간이 당일 범위 이내이면 계산안함.*/
          return (SUCCESS) ;

     if  (dd == 1)
     {
          strncpy(t_str,totime+8,4);
          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }


/* 아침, 점심, 저녁 식사시간을 차례로 계산 */
     if  (daykind == 4 )
     {
/*아침 제외*/

/*점심*/
          btime1 = 1200 ;
          btime2 = 1300 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm =  get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm  = get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm = get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm = get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm = 0;
          }
     }

/*저녁*/
     /* 석식시간은 동절기, 하절기에 따른 구분값 적용하여 계산 */
     btime1 = atoi(bgntime) ;
     btime2 = atoi(endtime) ;


     if ((istime >= btime1) && (istime <= btime2) &&
         (ietime > btime2) )
     {
          t_mealmm += get_minterm(istime,btime2);
     }
     else if ((ietime >= btime1) &&
              (ietime <= btime2) &&
              (istime < btime1))
     {
          t_mealmm += get_minterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) &&
              (ietime <= btime2) && (ietime >  istime))
     {
          t_mealmm += get_minterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime))
     {
          t_mealmm += get_minterm(btime1,btime2);
     }
     else
     {
          t_mealmm += 0;
     }


/*다음날 아침*/

     if ((dd == 1) && (strcmp(etime,"0800") > 0))
     {
          btime1 = 800 + 2400 ;
          btime2 = 900 + 2400 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )    {
               t_mealmm += get_minterm(istime, btime2) ;
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }


/* 다음날 점심*/

          btime1 = 1200 + 2400 ;
          btime2 = 1300 + 2400 ;

          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm  +=  get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm  += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }


/*다음날 저녁*/

          btime1 = atoi(bgntime) + 2400;
          btime2 = atoi(endtime) + 2400;


          if ((istime >= btime1) && (istime <= btime2) &&
              (ietime > btime2) )
          {
               t_mealmm  += get_minterm(istime,btime2);
          }
          else if ((ietime >= btime1) &&
                   (ietime <= btime2) &&
                   (istime < btime1))
          {
               t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime <= btime2) && (ietime >  istime))
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }
     }
     t_mealhh = floor(t_mealmm / 60) ;

     return(SUCCESS);
}

/****************************************************************************
       19:00(18:00)~08:00 9시간이상근무시 1시간 제외하는 함수
 ****************************************************************************/
get_excepthh(char *frtime, char* totime)
{
     char ba[20];
     char bb[20];
     int term = 0 ;
     int tmp = 0 ;

     char str[8+1] ="";

     int dd;
     sprintf(ba,"%s",frtime+8);
     sprintf(bb,"%s",totime+8);

     dd = check_datetime(frtime,totime);

     if  (dd == 0)
          return(SUCCESS);

     if  (dd == 1)
     {
          if  (strcmp(ba, endtime) < 0 )
               strcpy(ba, endtime)  ;

          if  (strcmp(bb, "0800") > 0 )
               strcpy(bb,  "0800")  ;

          tmp = atoi(bb) + 2400 ;

          tmp = (int)(get_minterm(atoi(ba), tmp) / 60)  ;

          /*2014.05.20.hjku. 휴식초과가 한시간 미만일 경우 9시간 근무한 대상자에 대해 제외시간 처리.. 홍원영M

          if  ( tmp >= 9 )
                t_excephh = 1 ;
          */

          if  (( tmp >= 9 ) &&(floor(t_restmm/60)<1))
                t_excephh = 1 ;
     }

     return (SUCCESS) ;
}

/****************************************************************************
        E1,H1평일 오전 시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
float get_hourterm_con(int a,int b)
{
     int   mm1,mm2;
     int   hh1,hh2;
     float result;
     int   hh, qq;

     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);

     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;

/*
     mm2 = mm2 - mm1-1;
     result = round((float)mm2/60);
     printf("\ndebug mm2[%d],result[%d]",mm2,result);*/

     mm2 = mm2 - mm1;

     /*근무시간 오등록으로 음수가 나올 경우 check 2015.10.13 jissi*/
     if  (mm2 < 0)
          mm2 = 0;

     hh = ((int)mm2/60);
     qq = ((int)(mm2 -hh*60)/15);

     result = hh + 0.25 * qq; /* 15분 단위로 계산 */
     /*printf("\ndebug mm2[%d],hh[%d],qq[%d],result[%f]",mm2,hh,qq,result);*/

     return(result);
}


/****************************************************************************
        시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
get_hourterm(int a,int b)
{
     int mm1,mm2;
     int hh1,hh2;

     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);

     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;
     mm2 = mm2 - mm1;

     /*근무시간 오등록으로 음수가 나올 경우 check 2015.10.13 jissi*/
     if  (mm2 < 0)
          mm2 = 0;

     return((int)(mm2/60));
}

/****************************************************************************
        시작시간과 종료시간 사이의 간격을 분단위로 구하는 함수.
 ****************************************************************************/
get_minterm(int a,int b)
{
     int mm1,mm2;
     int hh1,hh2;

     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);

     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;
     mm2 = mm2 - mm1;
     return(mm2);
}

/****************************************************************************
       실제근무시작시간과 실제근무종료시간을 시간간격을 구하는 함수.

float get_ovtmhh(char *a, char* b)
{
  char ba[20];
  char bb[20];

  int i,j,dd;
  sprintf(ba,"%s",a+8);
  sprintf(bb,"%s",b+8);
  i = atoi(ba);
  j = atoi(bb);

  dd = check_datetime(a,b);
  if (dd == 0)
   return(get_hourterm(i,j));
  else if (dd == 1) {
   j = j + 2400;
   return(get_hourterm(i,j));
  }
  else
   return(0);
}
 ****************************************************************************/

float get_ovtmhh(char *a, char* b)
{
     char  ba[20];
     char  bb[20];
     int   daykind1  = 0;
     int   daykind2  = 0;
     char  str[8+1]  = "";
     int   i,j,dd;
     int   tmp       = 0;

     sprintf(ba,"%s",a+8,4);
     sprintf(bb,"%s",b+8,4);
     i = atoi(ba);
     j = atoi(bb);

     strncpy(str,a,8);
     daykind1 = get_daykind(str);

     strncpy(str,b,8);
     daykind2 = get_daykind(str);

     dd = check_datetime(a,b);

     //if ((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 ))E1,H1 을 담당직무 비서 09,기사 15로 변경함. KTH
     if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
     {
          if  ((dd == 1)&&(daykind1!=4))
          {
               j  = j + 2400;

               if ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830") <= 0)&&(daykind2!=4))
               {
                    /*return(get_hourterm_con(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm_con(atoi("1800"),j));
                    else
                         return(get_hourterm_con(i,j));
               }
               else
               {
                    /*return(get_hourterm(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm(atoi("1800"),j));
                    else
                         return(get_hourterm(i,j));
               }
          }
          else if  ((dd == 1)&&(daykind1==4))
          {
               j  = j + 2400;

               if ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830") <= 0)&&(daykind2!=4)) {
                    return(get_hourterm_con(i,j));
               }
               else
               {
                    return(get_hourterm(i,j));
               }
          }
          else if ((dd==0)&&(daykind1!=4))
          {
               if(((strcmp(ba,"0600") > 0)&&(strcmp(ba,"0830") <  0))||
                  ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830")<= 0)))
               {
                    /*return(get_hourterm_con(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm_con(atoi("1800"),j));
                    else
                         return(get_hourterm_con(i,j));
               }
               else
               {
                    /*return(get_hourterm(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm(atoi("1800"),j));
                    else
                         return(get_hourterm(i,j));
               }
          }
          else
          {
               return(get_hourterm(i,j));
          }
     }
     else
     {
          if (daykind1!=4)
          {
               if  (dd == 0)
               {
                    /*return(get_hourterm(i,j));
                    평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm(atoi("1800"),j));
                    else
                         return(get_hourterm(i,j));
               }
               else if (dd == 1)
               {
                    j = j + 2400;

                    /*return(get_hourterm(i,j));
                    평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0))
                         return(get_hourterm(atoi("1800"),j));
                    else
                         return(get_hourterm(i,j));
               }
               else
                    return(0);
          }
          else
          {
               if  (dd == 0)
                    return(get_hourterm(i,j));
               else if (dd == 1)
               {
                    j = j + 2400;
                    return(get_hourterm(i,j));
               }
               else
                    return(0);
          }
     }
}



/****************************************************************************
  실제근무시간의 유효성을 Check 하는 함수.
****************************************************************************/
check_datetime(char *frtime,char *totime)
{
     int len       = 0;
     int  dd;
     char t_yy[3]  = "";
     char t_mm[3]  = "";
     char t_dd[3]  = "";
     char frstr[9] = "";
     char tostr[9] = "";

     len = strlen(frtime);
     if  (len != 12)
     {
          printf("실제시작시간값이 유효하지 않습니다.\n");
          sprintf(log_buff, "실제시작시간값이 유효하지 않습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     len  = strlen(totime);
     if  (len != 12)
     {
          printf("실제종료시간값이 유효하지 않습니다.\n");
          sprintf(log_buff, "실제종료시간값이 유효하지 않습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     strncpy(frstr,frtime,8);
     strncpy(tostr,totime,8);
     dd = calc_term(frstr,tostr);
     if  (dd == FAIL)
          return(FAIL);

     if ((dd < 0) || (dd >= 2))
     {
          printf("시작일과 종료일의 간격이 유효하지 않습니다.\n");
          sprintf(log_buff, "시작일과 종료일의 간격이 유효하지 않습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     return(dd);
}

/***************************************************************************
  계약직 일반연장시간을 처리하는 함수.(2008.05.08 추가)
****************************************************************************/
get_genexthh_con(char *frtime,char *totime)
{
     int   tmp       = 0;
     int   dd        = 0;
     int   daykind1  = 0;
     int   daykind2  = 0;
     char  stime[5]  = "";
     char  etime[5]  = "";
     char  str[8+1]  = "";
     int   term      = 0;

     dd = check_datetime(frtime,totime);

     if (dd == FAIL) return(FAIL);

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);


     strncpy(str,frtime,8);
     daykind1 = get_daykind(str);

     strncpy(str,totime,8);
     daykind2 = get_daykind(str);

     /*printf("\nDEBUG frdate[%s],todate[%s], dakind1[%d],daykind2[%d],dd[%d]",frtime,totime,daykind1,daykind2,dd);*/

     /* 2008.05.08. 추가 E1,H1 평일 오전 0600~0830 사이 초과 근무수당 15분분단위로 초과근무 계산 (인력팀 정정명씨,신영섭대리 통해서.)*/
     /*printf("\nDEBUG dd[%d], dakind1[%d],daykind2[%d]/n",dd,daykind1,daykind2);
     담당직무 비서 09,기사 15로 변경함. KTH */

     //if((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 ))
     if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
     {
          if  (daykind1 != 4)
          {
              if ((dd == 1)&&(daykind2 != 4))
              {/* 예->200805050900~200805060830,또는 200805061900~200805070830 입력시 */
                   if ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0))
                   {
                        tmp   = atoi(etime);
                        tmp   = tmp + 2400;

                        /*t_genexthh = get_hourterm_con(atoi(stime),tmp);
                          평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                        if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                        {
                             t_genexthh = get_hourterm_con(atoi("1800"),tmp);
                             t_genextmm = get_minterm(atoi("1800"),tmp);
                        }
                        else
                        {
                             t_genexthh = get_hourterm_con(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);
                        }
                   }
                   else
                   {
                        tmp   = atoi(etime);
                        tmp   = tmp + 2400;

                        /*t_genexthh = get_hourterm(atoi(stime),tmp);
                          평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                        if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                        {
                             t_genexthh = get_hourterm(atoi("1800"),tmp);
                             t_genextmm = get_minterm(atoi("1800"),tmp);
                        }
                        else
                        {
                             t_genexthh = get_hourterm(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);
                        }
                   }

                   return(SUCCESS);
              }
              else if (dd == 0)
              {
                   if(((strcmp(stime,"0600") > 0)&&(strcmp(stime,"0830") <= 0))||
                      ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0)))
                   {
                        /*t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                          평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                        if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                        {
                             t_genexthh = get_hourterm_con(atoi("1800"),atoi(etime));
                             t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                        }
                        else
                        {
                             t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                             t_genextmm = get_minterm(atoi(stime),atoi(etime));
                        }
                   }
                   else
                   {
                        /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                          평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                        if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                        {
                             t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                             t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                        }
                        else
                        {
                             t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                             t_genextmm = get_minterm(atoi(stime),atoi(etime));
                        }
                   }

                   return(SUCCESS);
              }
              else if ((dd == 1)&&(daykind2 == 4))  // 날짜가 2일이면서 첫날이 휴일이 경우 일반연장 넣어줌.  kth.
              {
                   tmp     = atoi(etime);
                   tmp     = tmp + 2400;

                   /*t_genexthh = get_hourterm(atoi(stime),tmp);
                     평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                   if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                   {
                        t_genexthh = get_hourterm(atoi("1800"),tmp);
                        t_genextmm = get_minterm(atoi("1800"),tmp);
                   }
                   else
                   {
                        t_genexthh = get_hourterm(atoi(stime),tmp);
                        t_genextmm = get_minterm(atoi(stime),tmp);
                   }

                   return(SUCCESS);
              }
          }
          else
          {
               t_genexthh = 0;
               return(SUCCESS);
          }
     }
     else
     {    //h1, e1 이 아닐 경우 일반연장 계산해 줌. kth 정규직과 동일하게 시간계산.
          if  (daykind1 != 4)
          {
               if ((dd==1) && (strcmp(etime,"0800") > 0))
               {
                    tmp     = atoi("0800");
                    tmp     = tmp + 2400;
                    /*t_genexthh = get_hourterm(atoi(stime),tmp);
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                    {
                         t_genexthh = get_hourterm(atoi("1800"),tmp);
                         t_genextmm = get_minterm(atoi("1800"),tmp);
                    }
                    else
                    {
                         t_genexthh = get_hourterm(atoi(stime),tmp);
                         t_genextmm = get_minterm(atoi(stime),tmp);
                    }
                    t_holihh   = get_hourterm(atoi("0800"),atoi(etime));
                    t_holimm   = get_minterm(atoi("0800"),atoi(etime));
                    if  (t_holihh > 8)
                    {
                         t_holiexthh = t_holihh - 8;
                         t_holiextmm = t_holimm - (8 * 60);
                    }
               }
               else
               {
                    if  (dd == 1)
                    {
                         tmp   = atoi(etime);
                         tmp   = tmp + 2400;
                         /*t_genexthh = get_hourterm(atoi(stime),tmp);
                           평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                         if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                         {
                         	   t_genexthh = get_hourterm(atoi("1800"),tmp);
                             t_genextmm = get_minterm(atoi("1800"),tmp);
                         }
                         else
                         {
                             t_genexthh = get_hourterm(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);
                         }
                    }
                    else
                    {
                         /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                           평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                         if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                         {
                         	   t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                             t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                         }
                         else
                         {
                             t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                             t_genextmm = get_minterm(atoi(stime),atoi(etime));
                         }
                    }
               }
               return(SUCCESS);
          }
          else
          {
               t_genexthh = 0;
               t_genextmm = 0;
               return(SUCCESS);
          }//h1, e1 이 아닐 경우 일반연장 계산해 줌. kth 정규직과 동일하게 시간계산 끝
     }

/* ========================================
   일반연장
========================================  */
     /*EXEC SQL                                         // 정규직 사원과 동일하게 계산 하게 위해 일반연장 넣는 부분 주석 처리 kth.
     SELECT  (TO_DATE(:torealtime,'YYYYMMDDHH24MI') -  //  위에서 t_genexthh 시간을 구하는 데 마지막에 강제로 넣어 줌...
       TO_DATE(:frrealtime,'YYYYMMDDHH24MI')
      ) * 24 * 60  cal
     INTO  :term
     FROM  DUAL;

     t_genexthh  =  floor(term/60); */

     return(SUCCESS);
}


/***************************************************************************
  일반연장시간을 처리하는 함수.
****************************************************************************/
get_genexthh(char *frtime,char *totime)
{
     int    tmp      = 0;
     int    dd       = 0;
     int    daykind  = 0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   str[8+1] = "";

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     if  (daykind != 4)
     {
          dd = check_datetime(frtime,totime);
          if  (dd == FAIL)
               return(FAIL);
          if ((dd==1) && (strcmp(etime,"0800") > 0))
          {
               tmp     = atoi("0800");
               tmp     = tmp + 2400;
               /*t_genexthh = get_hourterm(atoi(stime),tmp);
                 평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
               if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
               {
                    t_genexthh = get_hourterm(atoi("1800"),tmp);
                    t_genextmm = get_minterm(atoi("1800"),tmp);
               }
               else
               {
                    t_genexthh = get_hourterm(atoi(stime),tmp);
                    t_genextmm = get_minterm(atoi(stime),tmp);
               }
               t_holihh   = get_hourterm(atoi("0800"),atoi(etime));
               t_holimm   = get_minterm(atoi("0800"),atoi(etime));
               if  (t_holihh > 8)
               {
                    t_holiexthh = t_holihh - 8;
                    t_holiextmm = t_holimm - (8 * 60);
               }
          }
          else
          {
               if  (dd == 1)
               {
                    tmp   = atoi(etime);
                    tmp   = tmp + 2400;
                    /*t_genexthh = get_hourterm(atoi(stime),tmp);
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                    {
                    	   t_genexthh = get_hourterm(atoi("1800"),tmp);
                    	   t_genextmm = get_minterm(atoi("1800"),tmp);
                    }
                    else
                    {
                         t_genexthh = get_hourterm(atoi(stime),tmp);
                         t_genextmm = get_minterm(atoi(stime),tmp);
                    }
               }
               else
               {
                    /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                    {
                    	   t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                         t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                    }
                    else
                    {
                         t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                         t_genextmm = get_minterm(atoi(stime),atoi(etime));
                    }
               }
          }
          return(SUCCESS);
     }
     else
     {
          t_genexthh = 0;
          t_genextmm = 0;
          return(SUCCESS);
     }
}

/*****************************************************************************
  기준월의 마지막 토요일을 구하는 함수.
 *****************************************************************************/
void get_lastsaturday(char* yymm, char* lastsaturday)
{
     char  t_date[8+1]  = "";
     char  t_dayname[20]  = "";

     get_lastday(yymm,t_date);
     while(1)
     {
          get_dayname(t_date,t_dayname);
          if  (strcmp(t_dayname,"SATURDAY") == 0)
               break;
          add_days(t_date,-1,t_date);
     }
     sprintf(lastsaturday,"%.8s",t_date);
}

/*****************************************************************************
  기준일+M 일을 구하는 함수.
 *****************************************************************************/
void add_days(char* indate,int m, char* rdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char    t_date[8+1]  = "";
          double  t_adddays;
     /* EXEC SQL END DECLARE SECTION; */ 


     sprintf(t_date,"%s",indate);
     t_adddays = m;

     /* EXEC SQL
     SELECT   TO_CHAR(TO_DATE(TO_CHAR(TO_DATE(:t_date,'YYYYMMDD')+
                                              :t_adddays,'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD')
     INTO  :t_date
     FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )394;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_adddays;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)t_date;
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



     sprintf(rdate,"%s",t_date);
}

/*****************************************************************************
  기준월의 마지막일을 구하는 함수.
 *****************************************************************************/
void get_lastday(char* yymm, char* result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  basedate[9] = "";
     /* EXEC SQL END DECLARE SECTION; */ 


     sprintf(basedate,"%.6s01",yymm);

     /* EXEC SQL
     SELECT   TO_CHAR(LAST_DAY(TO_DATE(:basedate,'YYYYMMDD')),'YYYYMMDD')
       INTO  :basedate
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMMDD')),'YYYYM\
MDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )421;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
     sqlstm.sqhstl[1] = (unsigned long )9;
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



     basedate[8] = '\0';
     sprintf(result,"%s",basedate);
}

/****************************************************************************
       요일명을 구하는 함수.
 ***************************************************************************/
void get_dayname(char *indate,char *result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char idate[8+1]   = "";
          char ddname[20] = "";
     /* EXEC SQL END   DECLARE SECTION; */ 

     int count;

     strcpy(idate,indate);
     /* EXEC SQL
     SELECT  TO_CHAR(TO_DATE(:idate,'YYYYMMDD'),'DAY')
       INTO  :ddname
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'DAY') into :b1 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )444;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)idate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ddname;
     sqlstm.sqhstl[1] = (unsigned long )20;
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



     count = 0;
     while (ddname[count] != ' ')
          count++;

     ddname[count] = '\0';

     sprintf(result,"%s",ddname);
}

/****************************************************************************
  근무일의 종류를 결정하는 함수.
  1 -> 평일, 2 -> 휴무토요일, 3 -> 근무토요일, 4 -> 휴일
 ****************************************************************************/
get_daykind(char *indate)
{

     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char day[8+1];
          int  count;
     /* EXEC SQL END   DECLARE SECTION; */ 


     char dayname[100];
     int  i = 0;

     get_dayname(indate,dayname);
     if  (strcmp(dayname,"SUNDAY") == 0)
          return(4);

     sprintf(day,"%s",indate);
     count  = 0;
     /*2015.10.06 jissi 휴일/평일적용 특이자 체크 추가
     EXEC     SQL
     SELECT   COUNT(*)
       INTO  :count
       FROM   PKCHOLI
      WHERE   HOLIDATE = :day;
     */

     /* EXEC   SQL
     SELECT COUNT(*)
       INTO :count
       FROM
           (
            SELECT   HOLIDATE
              FROM   PKCHOLI
             WHERE   HOLIDATE = :day
            UNION
            SELECT   DUTYDATE
              FROM   PKHOLIEMP
             WHERE   DUTYDATE = :day
               AND   EMPNO    = :empno
               AND   DUKIND   = '49'     /o휴일적용o/
            MINUS
            SELECT   DUTYDATE
              FROM   PKHOLIEMP
             WHERE   DUTYDATE = :day
               AND   EMPNO    = :empno
               AND   DUKIND   = '00'     /o평일적용o/
           ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from (select HOLIDATE  from \
PKCHOLI where HOLIDATE=:b1 union select DUTYDATE  from PKHOLIEMP where ((DUTY\
DATE=:b1 and EMPNO=:b3) and DUKIND='49') minus select DUTYDATE  from PKHOLIEM\
P where ((DUTYDATE=:b1 and EMPNO=:b3) and DUKIND='00')) ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )467;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)day;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)day;
     sqlstm.sqhstl[2] = (unsigned long )9;
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
     sqlstm.sqhstv[4] = (unsigned char  *)day;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)empno;
     sqlstm.sqhstl[5] = (unsigned long )5;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
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


     /*printf("DEBUG count[%d],day[%s],empno[%s]\n",count,day, empno);*/
     if  (count >= 1)
     {
          i = 4;
          return(i);
     }

   /*2004.8.4. 유효성 수정 : 주5일근무에따라 토요일도 휴일로 친다.. */
   /*  if (strcmp(dayname,"SATURDAY") == 0)
     {
      if (strcmp(indate,LSaturday) == 0)
        i = 3;
      else
        i = 2;
     }
     else
        i = 1;
   */
     if  (strcmp(dayname,"SATURDAY") == 0)
          i = 4;
     else
          i = 1;

     return(i);
}
 /************************************************************************
  휴일근로시간과 휴일연장근로시간을 구하는 함수.
 *************************************************************************/
process_holihh(char *frtime, char *totime)
{
     char    stime[5] = "";
     char    etime[5] = "";
     char    str[9]   = "";
     int     tmp      = 0;
     int     dd       = 0;
     int     daykind  = 0;
     double  a,b;
     int     a1,b1;

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);

     daykind    = get_daykind(str);
     if  (daykind == 4)
     {
          dd = check_datetime(frtime,totime);
          if  (dd == FAIL)
               return(FAIL);

          if ((dd==1) && (strcmp(etime,"0800") > 0) )
          {
               tmp    = atoi("0800");
               tmp   = tmp + 2400;
               a = get_hourterm(atoi(stime),tmp);
               b = get_hourterm(atoi("0800"),atoi(etime));

               a1 = get_minterm(atoi(stime),tmp);
               b1 = get_minterm(atoi("0800"),atoi(etime));

               t_holihh = a + b;
               t_holimm = a1 + b1;

   /**2001.08.10. 유효성 수정
   익일 0800 이후까지 근무시 분단위 계산 보정 추가*/
               tmp  =  get_minterm(atoi(stime), atoi(etime) + 2400 ) ;

               if  (tmp - (t_holihh*60) >= 60)
               {
                    a += 1 ;
                    t_holihh = a + b;
               }/* 10분단위 절사시 불필요 */
   /*추가 end */
               if  (a > 8)
               {
                    t_holiexthh = a - 8;
                    t_holiextmm = a1 - (8 * 60);
               }
               if  (b > 8)
               {
                    t_holiexthh = t_holiexthh + (b - 8);
                    t_holiextmm = t_holiextmm + (b1 - (8 * 60));
               }
          }
          else
          {
               if  (dd == 1)
               {
                    tmp      = atoi(etime);
                    tmp      = tmp + 2400;
                    t_holihh = get_hourterm(atoi(stime),tmp);
                    t_holimm = get_minterm(atoi(stime),tmp);
               }
               else
               {
                    t_holihh = get_hourterm(atoi(stime), atoi(etime));
                    t_holimm = get_minterm(atoi(stime), atoi(etime));
               }

               if  (t_holihh > 8)
               {
                    t_holiexthh = t_holihh - 8;
                    t_holiextmm = t_holimm - (8 * 60);
               }
          }
     }

     return(SUCCESS);
}
/****************************************************************************
   계산된 근무시간을 DB에 저장하는 Procedure.
 ****************************************************************************/
update_record()
{
     char    dname[100+1]  = "";
     double  tongpay;
     int     daykind;
     double  ovtmnightamt;  /*dsa2000 */
     char    t_date[8+1]  = "";
     char    t_chkdate[5]  = "";

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 =============================================================================
  if (read_basicinfo(empno, &totpay) == FAIL)
   return(FAIL);    */
     /*DB package에서 계산 jissi. 2014.11.05
      tongpay = get_tongpay(paycl);
     */
     /*
     EXEC SQL
     SELECT  case when :ovtmdate < :comchdate                      *2014.11.17이후 초과근무수당 계산할 때 통상임금이 총연봉 18분할에서 고정식교비포함 12분할로*
                  then hper.COMMONUTIL.GET_OLDBASEPAY(:empno)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(:empno) end  *DB package에서 계산 jissi. 2014.11.05*
       INTO :tongpay
       FROM DUAL;
     */
     /* EXEC SQL
     SELECT  case when :ovtmdate < :comchdate                      /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                  then hper.COMMONUTIL.GET_OLDBASEPAY(:empno,:yearpaynum)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(:empno,:yearpaynum) end  /oDB package에서 계산 jissi. 2016.12.14o/
       INTO :tongpay
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select  case  when :b0<:b1 then hper.COMMONUTIL.GET_OLD\
BASEPAY(:b2,:b3) else hper.COMMONUTIL.GET_NEWBASEPAY(:b2,:b3)  end  into :b6 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )506;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)comchdate;
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
     sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[3] = (unsigned long )7;
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
     sqlstm.sqhstv[5] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&tongpay;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
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


     /*2016.08.24 jissi HR팀 홍원영M 요청 SR-1608-0885
       휴일근로시간이 1시간인 경우 기존처럼 식사제외시간을 제외하지 않고 0으로 반영
       ※단, 일반연장근로는 제외함. */
     /* printf("\n debug t_mealhh[%f] t_holihh[%f] t_genexthh[%f] t_holiexthh[%f]\n ",t_mealhh,t_holihh,t_genexthh,t_holiexthh); */
     if ((t_holihh == 1) && (t_genexthh == 0) && (t_holiexthh == 0))
          t_mealhh = 0;
     /* printf("\n debug t_mealhh[%f] t_holihh[%f] t_genexthh[%f] t_holiexthh[%f]\n ",t_mealhh,t_holihh,t_genexthh,t_holiexthh); */

     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */

     pre_PKHOTFWD(); /* 전월 이월 데이터 조회 */
/*sprintf(log_buff, "\n [DEBUG] pre_genextsum=%d, pre_holiextsum=%d, pre_nightsum=%d, pre_holisum=%d, pre_mealsum=%.f"
                , pre_genextsum, pre_holiextsum, pre_nightsum, pre_holisum, pre_mealsum);
Write_batlog(seqno++, log_buff);*/
     /* EXEC SQL
     SELECT  PRE_GENEXTSUM, PRE_HOLIEXTSUM, PRE_NIGHTSUM,
             PRE_HOLISUM, PRE_MEALSUM, PRE_RESTSUM, PRE_SPRESTSUM
       INTO  :pre_genextsum, :pre_holiextsum, :pre_nightsum,
             :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum
       FROM  PKHOTFWD
      WHERE  EMPNO    = :empno
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select PRE_GENEXTSUM ,PRE_HOLIEXTSUM ,PRE_NIGHTSUM ,PRE\
_HOLISUM ,PRE_MEALSUM ,PRE_RESTSUM ,PRE_SPRESTSUM into :b0,:b1,:b2,:b3,:b4,:b\
5,:b6  from PKHOTFWD where (EMPNO=:b7 and OVTMYYMM=:b8)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )549;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)empno;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)workmm;
     sqlstm.sqhstl[8] = (unsigned long )7;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
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


     
     
     /* 10분 절사 */
     t_genextmm  = floor(t_genextmm  / 10) * 10;
     t_holiextmm = floor(t_holiextmm / 10) * 10;
     t_nightmm   = floor(t_nightmm   / 10) * 10;
     t_holimm    = floor(t_holimm    / 10) * 10;
     t_mealmm    = floor(t_mealmm    / 10) * 10;
     t_restmm    = floor(t_restmm    / 10) * 10;
     t_sprestmm  = floor(t_sprestmm  / 10) * 10;

     /* 일반연장 */
     t_genexthh     = (int)t_genextmm / 60;
     pre_genextsum  = pre_genextsum + (t_genextmm % 60);
     /* 휴일연장 */
     t_holiexthh    = (int)t_holiextmm / 60;
     pre_holiextsum = pre_holiextsum + (t_holiextmm % 60);
     /* 야간근로 */
     t_nighthh      = (int)t_nightmm / 60;
     pre_nightsum   = pre_nightsum + (t_nightmm % 60);
     /* 휴일근로 */
     t_holihh       = (int)t_holimm / 60;
     pre_holisum    = pre_holisum + (t_holimm % 60);
     /* 식사시간 */
     t_mealhh       = (int)t_mealmm / 60;
     pre_mealsum    = pre_mealsum + (t_mealmm % 60);


/*
sprintf(log_buff, "\n [DEBUG] t_genextmm=%d, t_holiextmm=%d, t_nightmm=%d, t_holimm=%d, t_mealmm=%d"
                , t_genextmm, t_holiextmm, t_nightmm, t_holimm, t_mealmm);
Write_batlog(seqno++, log_buff);

sprintf(log_buff, "\n [DEBUG] t_genexthh=%.f, pre_genextsum=%d, t_holiexthh=%.f, pre_holiextsum=%d"
                , t_genexthh, pre_genextsum, t_holiexthh, pre_holiextsum);
Write_batlog(seqno++, log_buff);

sprintf(log_buff, "\n [DEBUG] t_holihh=%.f, pre_holisum=%d, t_nighthh=%.f, pre_nightsum=%d, t_mealhh=%.f, pre_mealsum=%d"
                , t_holihh, pre_holisum, t_nighthh, pre_nightsum, t_mealhh, pre_mealsum);
Write_batlog(seqno++, log_buff);*/
     /******************************************************************************/

     t_extamt   = (t_genexthh * tongpay * 1.5) +
                  (t_holiexthh* tongpay * 0.5);
     t_nightamt =  t_nighthh  * tongpay * 0.5;
     t_holiamt  =  t_holihh   * tongpay * 1.5;
     t_mealamt  =  t_mealhh   * tongpay * 1.5;
     t_excepamt =  t_excephh  * tongpay * 1.5;

     t_extamt   = ceil(t_extamt);
     t_nightamt = ceil(t_nightamt);
     t_holiamt  = ceil(t_holiamt);
     t_mealamt  = floor(t_mealamt);
     t_excepamt = floor(t_excepamt);

     ovtmhh     = get_ovtmhh(frrealtime,torealtime);

     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* ==============================================
         초과근무에서 휴식시간분만큼을 제외하는 로직 추가
      * ============================================== */
     /* t_restamt  = floor(floor(t_restmm/60)  * tongpay * 1.5); */
     t_restamt   = floor((int)t_restmm/60  * tongpay * 1.5);
     pre_restsum = pre_restsum + (t_restmm % 60);

     /* ==============================================
         일상근무에서 휴식시간분만큼을 제외하는 로직 추가
      * ============================================== */
     /* t_sprestamt= floor(floor(t_sprestmm/60) * tongpay ); */
     t_sprestamt   = floor((int)t_sprestmm/60 * tongpay );
     pre_sprestsum = pre_sprestsum + (t_sprestmm % 60);

     total_amt  = total_amt + (t_extamt + t_nightamt + t_holiamt)
                - t_restamt - t_sprestamt - t_mealamt - t_excepamt  ;

     if  (total_amt <= 0 )
          printf("\n 오류자료입니다. 사번[%s],성명[%s],초과근무일[%s] 11", empno,korname,ovtmdate);

     /* 야근식대처리부분 */
     sprintf(t_date,"%.8s",ovtmdate);
     daykind    = get_daykind(t_date);

     switch (daykind)
     {
          case 2 :
          case 3 :
          case 4 :
               ovmcamt = 0;
               break;
          case 1 :
/* dsa2000  2003.02.01 부터 초과근무 야근식대 인상 : 3000 => 3500원
                        ovmcamt = 3000;   ovmcamt = 3500; */

/* dsa2000 2004.08.27. 야근식대 DB에서 읽어오도록 변경 -초과근무기준관리에서 변경 가능 */
          /* EXEC SQL
          SELECT OVTMNIGHTAMT
            INTO :ovtmnightamt
            FROM PKCOTBAS; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select OVTMNIGHTAMT into :b0  from PKCOTBAS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )600;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&ovtmnightamt;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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



/* dsa2000 end ===============================================================================*/
     }


     strncpy(t_chkdate,frrealtime+8,4);
     if ( strcmp(t_chkdate,"1800") >= 0 )
     {
          ovmcamt = ovtmnightamt;
     }
     else
     {
          ovmcamt = 0;
     }



    /*** 2000-11-29 삭제-->인사팀 요청 ************************************************
     if ( ( strcmp(paycl,"E1")== 0 ) && (ovmcamt = 3000) )
     {
      EXEC SQL
      SELECT  DECODE( GREATEST(SUBSTR(:frrealtime,9,4),'0900'),'0900',3000,
         4000 )
      INTO  :ovmcamt
      FROM   DUAL;  }
    **********************************************************************************/

     /* EXEC SQL
     UPDATE  PKHOTHIS
        SET  EXTHH        = (:t_genexthh + :t_holiexthh),
             NIGHTHH      = :t_nighthh,
             HOLIHH       = :t_holihh,
             GENEXT       = :t_genexthh,
             HOLIEXT      = :t_holiexthh,
             OVTMHH       = :ovtmhh,
             OVMCAMT      = :ovmcamt,
             EXTAMT       = :t_extamt,
             NIGHTAMT     = :t_nightamt,
             HOLIAMT      = :t_holiamt,
             OVTMAMT      = (:t_extamt + :t_nightamt + :t_holiamt - :t_restamt - :t_sprestamt- :t_mealamt - :t_excepamt ),
             RESTAMT      = :t_restamt,
             SPRESTAMT    = :t_sprestamt ,
             MEALHH       = :t_mealhh,
             MEALAMT      = :t_mealamt ,
             EXCEPHH      = :t_excephh,
             EXCEPAMT     = :t_excepamt,
             WRITETIME    = TO_Char(sysdate,'YYYYMMDDHH24MISS'),
             WRITEMAN     = :jobempno
      WHERE  EMPNO        = :empno AND OVTMDATE = :ovtmdate
        AND  NVL(FRAPPTIME,'*')  = :frapptime
        AND  NVL(FRREALTIME,'*') = :frrealtime; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS  set EXTHH=(:b0+:b1),NIGHTHH=:b2,HOLIHH\
=:b3,GENEXT=:b0,HOLIEXT=:b1,OVTMHH=:b6,OVMCAMT=:b7,EXTAMT=:b8,NIGHTAMT=:b9,HO\
LIAMT=:b10,OVTMAMT=((((((:b8+:b9)+:b10)-:b14)-:b15)-:b16)-:b17),RESTAMT=:b14,\
SPRESTAMT=:b15,MEALHH=:b20,MEALAMT=:b16,EXCEPHH=:b22,EXCEPAMT=:b17,WRITETIME=\
TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=:b24 where (((EMPNO=:b25 and OVT\
MDATE=:b26) and NVL(FRAPPTIME,'*')=:b27) and NVL(FRREALTIME,'*')=:b28)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )619;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&t_genexthh;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_holiexthh;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&t_nighthh;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&t_holihh;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&t_genexthh;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&t_holiexthh;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&ovtmhh;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&ovmcamt;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&t_extamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&t_nightamt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&t_holiamt;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&t_extamt;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&t_nightamt;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&t_holiamt;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&t_restamt;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&t_sprestamt;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&t_mealamt;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&t_excepamt;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&t_restamt;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&t_sprestamt;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&t_mealhh;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&t_mealamt;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&t_excephh;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&t_excepamt;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[24] = (unsigned long )5;
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)empno;
     sqlstm.sqhstl[25] = (unsigned long )5;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)ovtmdate;
     sqlstm.sqhstl[26] = (unsigned long )9;
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)frapptime;
     sqlstm.sqhstl[27] = (unsigned long )5;
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)frrealtime;
     sqlstm.sqhstl[28] = (unsigned long )13;
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
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



     /*debug
     printf("\n debug t_nighthh[%f] t_holihh[%f]t_genexthh[%f],t_holiexthh[%f]",t_nighthh,t_holihh,t_genexthh,t_holiexthh);
     printf("\n debug update[%d] empno[%s]frapptime[%s],frrealtime[%s],torealtime[%s]",sqlca.sqlcode,empno,frapptime,frrealtime,torealtime);*/

     if  (sqlca.sqlcode != 0)
     {
          printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
          return(FAIL);
     }
     //else
     //     return(SUCCESS);

     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* EXEC SQL
     UPDATE  PKHOTFWD
        SET  STATE           = 2
            ,PRE_GENEXTSUM   = :pre_genextsum
            ,PRE_HOLIEXTSUM  = :pre_holiextsum
            ,PRE_NIGHTSUM    = :pre_nightsum
            ,PRE_HOLISUM     = :pre_holisum
            ,PRE_MEALSUM     = :pre_mealsum
            ,PRE_RESTSUM     = :pre_restsum
            ,PRE_SPRESTSUM   = :pre_sprestsum
            ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
            ,WRITEMAN        = TO_Char(:jobempno)
      WHERE  EMPNO           = TO_Char(:empno   )
        AND  OVTMYYMM        = TO_Char(:workmm  )
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTFWD  set STATE=2,PRE_GENEXTSUM=:b0,PRE_HOLI\
EXTSUM=:b1,PRE_NIGHTSUM=:b2,PRE_HOLISUM=:b3,PRE_MEALSUM=:b4,PRE_RESTSUM=:b5,P\
RE_SPRESTSUM=:b6,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=TO_Ch\
ar(:b7) where (EMPNO=TO_Char(:b8) and OVTMYYMM=TO_Char(:b9))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )750;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)empno;
     sqlstm.sqhstl[8] = (unsigned long )5;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)workmm;
     sqlstm.sqhstl[9] = (unsigned long )7;
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


/*sprintf(log_buff, "\n [FWD_UP] EMPNO=%s,PRE_GENEXTSUM=%d, PRE_HOLIEXTSUM=%d, PRE_NIGHTSUM=%d"
                , empno, pre_genextsum, pre_holiextsum, pre_nightsum);
Write_batlog(seqno++, log_buff);     
sprintf(log_buff, "\n [FWD_UP] PRE_HOLISUM=%d, PRE_MEALSUM=%d, PRE_RESTSUM=%d, PRE_SPRESTSUM=%d"
                , pre_holisum, pre_mealsum, pre_restsum, pre_sprestsum);
Write_batlog(seqno++, log_buff);*/
     if  (sqlca.sqlcode != 0)
     {
          printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
          return(FAIL);
     }
     else
          return(SUCCESS);
     /******************************************************************************/
}

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 ============================================================================= */
/****************************************************************************
   개인별 통상임금을 구하는 함수.  사용 안함 jissi 2014.11.05
 ***************************************************************************/
double  get_tongpay(char *paycl)
{
     double baseamt = 0;
/* infra    if (strlen(paycl) != 2)*/
     if  (strlen(paycl) != 3)
          return(FAIL);

/* =============================================================================
 30.40    2002.08.28       유효성       전문계약직 추가                     전(2002-3755)
 ============================================================================= */
/*
  if (((strcmp(paycl,"10") >= 0) && (strcmp(paycl,"99") <= 0))  ||
      (strcmp(paycl,"E1") == 0 ) )  협력사원포함
*/
/*
  if (((strcmp(paycl,"10") >= 0) && (strcmp(paycl,"99") <= 0))
     || (strcmp(paycl,"E1") == 0 )
           || (strcmp(paycl,"H1") == 0 )      //일반직 추가 2008.02.18
     || (strcmp(paycl,"C1") == 0 ) )
*/

/*infra   if ((strcmp(paycl,"10") >= 0) && (strcmp(paycl,"H1") <= 0)) */
/*  if ((strcmp(paycl,"H11") == 0 )||(strcmp(paycl,"K11") == 0 ))      */
     if ((strcmp(paycl,"C11") >= 0) && (strcmp(paycl,"K11") <= 0))
     {
      /* 2008.03.20 일반직일 경우 연봉에서 관리수수료율을 뺀 금액으로 통상임금 계산 */
          if  (strncmp(empno,"Y",1)==0)
          {
               baseamt = ceil(totpay/18/226);   /*  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11
                                                                     2010.05.11 kth ceil(totpay*  /18/226) 없앰.   */
          }
          else
          {
               baseamt = ceil(totpay/18/226);                       /*  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 */
          }
/*
printf("\nDEBUG : empno=%s,totpay=%f,baseamt=%f,manrate=%f\n",empno,totpay,baseamt,y_manrate);  */

          if(baseamt < ovminamt) baseamt = ovminamt; /*추가 2008.02.18 시간당 최저임금 적용*/

          return(baseamt);
     }

/*  if(baseamt < ovminamt) baseamt = ovminamt;*/

     return(baseamt);
}

/****************************************************************************
  초과근무월별집계를 수행하는 Procedure1.
 ****************************************************************************/
process_sumstep1()
{


/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description
 30.10    2000.07.25       유효성    시간당통상임금 update 로직수정
 ============================================================================= *

  SELECT  EMPNO, COUNT(*), SUM(EXTHH), SUM(NIGHTHH),
   SUM(HOLIHH), SUM(OVTMHH), SUM(GENEXT), SUM(HOLIEXT),
   SUM(EXTAMT), SUM(NIGHTAMT), SUM(HOLIAMT), SUM(OVTMAMT),
   SUM(OVTMHH), SUM(OVMCAMT)
  FROM  PKHOTHIS
  WHERE  SUBSTR(OVTMDATE,1,6) = :workmm AND
    ( EMPNO >= :frempno AND EMPNO <= :toempno ) AND
   ( UPPER(NVL(CONYN,' ')) = 'Y' )
  GROUP BY EMPNO
  ORDER BY EMPNO;
=======================================================================================*/
/*
     SELECT  A.EMPNO, COUNT(*), SUM(EXTHH), SUM(NIGHTHH),
             SUM(HOLIHH), SUM(OVTMHH), SUM(GENEXT), SUM(HOLIEXT),
             SUM(EXTAMT), SUM(NIGHTAMT), SUM(HOLIAMT), SUM(OVTMAMT),
             SUM(OVTMHH), SUM(OVMCAMT), B.TOTPAY
       FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C
      WHERE  A.EMPNO = B.EMPNO
        AND  B.YEARPAYNUM = C.YEARPAYNUM
        AND  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  ( A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
      GROUP BY A.EMPNO, B.TOTPAY
      ORDER BY A.EMPNO;
*/
       /* EXEC SQL DECLARE cursor2_1 CURSOR FOR
           SELECT  A.EMPNO, COUNT(*), SUM(EXTHH), SUM(NIGHTHH),
                   SUM(HOLIHH), SUM(OVTMHH), SUM(GENEXT), SUM(HOLIEXT),
                   SUM(EXTAMT), SUM(NIGHTAMT), SUM(HOLIAMT), SUM(OVTMAMT),
                   SUM(OVTMHH), SUM(OVMCAMT), B.TOTPAY
             FROM  PKHOTHIS A, PKHYPHIS B
            WHERE  A.EMPNO = B.EMPNO
              AND  B.YEARPAYNUM = :yearpaynum
              AND  SUBSTR(OVTMDATE,1,6) = :workmm
              AND  ( A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
              AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
            GROUP BY A.EMPNO, B.TOTPAY
           UNION ALL 
           SELECT  A.EMPNO, COUNT(*), SUM(A.EXTHH), SUM(A.NIGHTHH),
                  SUM(A.HOLIHH), SUM(A.OVTMHH), SUM(A.GENEXT), SUM(A.HOLIEXT),
                  SUM(A.EXTAMT), SUM(A.NIGHTAMT), SUM(A.HOLIAMT), SUM(A.OVTMAMT),
                  SUM(A.OVTMHH), SUM(A.OVMCAMT), B.TOTPAY
            FROM  PKHOTHIS A, 
                  ( SELECT A.EMPNO, A.TOTPAY
                      FROM PKHDYPHIS A 
                     WHERE (A.EMPNO, A.SEQNO) IN ( SELECT B.EMPNO, MAX(B.SEQNO) AS SEQNO  
                                                     FROM PKHDYPHIS B                     
                                                    WHERE B.YEARPAYNUM = :yearpaynum     
                                                           GROUP BY B.EMPNO )) B   /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
           WHERE  A.EMPNO = B.EMPNO
             AND  SUBSTR(OVTMDATE,1,6) = :workmm
             AND  ( A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
             AND  A.EMPNO LIKE 'Y%'
             AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
           GROUP BY A.EMPNO, B.TOTPAY
           ORDER BY EMPNO; */ 

       /* EXEC SQL OPEN cursor2_1; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 29;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = sq0019;
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )805;
       sqlstm.selerr = (unsigned short)1;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqcmod = (unsigned int )0;
       sqlstm.sqhstv[0] = (unsigned char  *)yearpaynum;
       sqlstm.sqhstl[0] = (unsigned long )7;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)workmm;
       sqlstm.sqhstl[1] = (unsigned long )7;
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
       sqlstm.sqhstv[4] = (unsigned char  *)yearpaynum;
       sqlstm.sqhstl[4] = (unsigned long )7;
       sqlstm.sqhsts[4] = (         int  )0;
       sqlstm.sqindv[4] = (         short *)0;
       sqlstm.sqinds[4] = (         int  )0;
       sqlstm.sqharm[4] = (unsigned long )0;
       sqlstm.sqadto[4] = (unsigned short )0;
       sqlstm.sqtdso[4] = (unsigned short )0;
       sqlstm.sqhstv[5] = (unsigned char  *)workmm;
       sqlstm.sqhstl[5] = (unsigned long )7;
       sqlstm.sqhsts[5] = (         int  )0;
       sqlstm.sqindv[5] = (         short *)0;
       sqlstm.sqinds[5] = (         int  )0;
       sqlstm.sqharm[5] = (unsigned long )0;
       sqlstm.sqadto[5] = (unsigned short )0;
       sqlstm.sqtdso[5] = (unsigned short )0;
       sqlstm.sqhstv[6] = (unsigned char  *)frempno;
       sqlstm.sqhstl[6] = (unsigned long )5;
       sqlstm.sqhsts[6] = (         int  )0;
       sqlstm.sqindv[6] = (         short *)0;
       sqlstm.sqinds[6] = (         int  )0;
       sqlstm.sqharm[6] = (unsigned long )0;
       sqlstm.sqadto[6] = (unsigned short )0;
       sqlstm.sqtdso[6] = (unsigned short )0;
       sqlstm.sqhstv[7] = (unsigned char  *)toempno;
       sqlstm.sqhstl[7] = (unsigned long )5;
       sqlstm.sqhsts[7] = (         int  )0;
       sqlstm.sqindv[7] = (         short *)0;
       sqlstm.sqinds[7] = (         int  )0;
       sqlstm.sqharm[7] = (unsigned long )0;
       sqlstm.sqadto[7] = (unsigned short )0;
       sqlstm.sqtdso[7] = (unsigned short )0;
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
            /* EXEC SQL CLOSE cursor2_1; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 29;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )852;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            printf("ERROR_CODE : %d, 추출된 자료에 이상이 있습니다.\n", sqlca.sqlcode);
            sprintf(log_buff, "ERROR_CODE : %d, 추출된 자료에 이상이 있습니다.\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
            Write_batlog(seqno++, log_buff);
            return(FAIL);
       }
       /*
       if (check_existence() == SUCCESS)
       */
       /*2002.6.17. 유효성 오류수정
         pkhothis에 없는 자료는 삭제안됨.--> clear record함수에 pkhotsum을 삭제하는 로직 추가
        delete_records();
       */
       
       s_count = f_count = 0;
       while(1)
       {
            /* EXEC SQL FETCH cursor2_1
            INTO :empno, :s_totdd, :s_exthh, :s_nighthh,
                 :s_holihh, :s_tothh, :s_genext, :s_holiext,
                 :s_extamt, :s_nightamt, :s_holiamt, :s_ovtmamt,
                 :s_ovtmhh, :s_ovmcamt, :totpay; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 29;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )867;
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
            sqlstm.sqhstv[1] = (unsigned char  *)&s_totdd;
            sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&s_exthh;
            sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&s_nighthh;
            sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)&s_holihh;
            sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&s_tothh;
            sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&s_genext;
            sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
            sqlstm.sqhsts[6] = (         int  )0;
            sqlstm.sqindv[6] = (         short *)0;
            sqlstm.sqinds[6] = (         int  )0;
            sqlstm.sqharm[6] = (unsigned long )0;
            sqlstm.sqadto[6] = (unsigned short )0;
            sqlstm.sqtdso[6] = (unsigned short )0;
            sqlstm.sqhstv[7] = (unsigned char  *)&s_holiext;
            sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[7] = (         int  )0;
            sqlstm.sqindv[7] = (         short *)0;
            sqlstm.sqinds[7] = (         int  )0;
            sqlstm.sqharm[7] = (unsigned long )0;
            sqlstm.sqadto[7] = (unsigned short )0;
            sqlstm.sqtdso[7] = (unsigned short )0;
            sqlstm.sqhstv[8] = (unsigned char  *)&s_extamt;
            sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[8] = (         int  )0;
            sqlstm.sqindv[8] = (         short *)0;
            sqlstm.sqinds[8] = (         int  )0;
            sqlstm.sqharm[8] = (unsigned long )0;
            sqlstm.sqadto[8] = (unsigned short )0;
            sqlstm.sqtdso[8] = (unsigned short )0;
            sqlstm.sqhstv[9] = (unsigned char  *)&s_nightamt;
            sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[9] = (         int  )0;
            sqlstm.sqindv[9] = (         short *)0;
            sqlstm.sqinds[9] = (         int  )0;
            sqlstm.sqharm[9] = (unsigned long )0;
            sqlstm.sqadto[9] = (unsigned short )0;
            sqlstm.sqtdso[9] = (unsigned short )0;
            sqlstm.sqhstv[10] = (unsigned char  *)&s_holiamt;
            sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[10] = (         int  )0;
            sqlstm.sqindv[10] = (         short *)0;
            sqlstm.sqinds[10] = (         int  )0;
            sqlstm.sqharm[10] = (unsigned long )0;
            sqlstm.sqadto[10] = (unsigned short )0;
            sqlstm.sqtdso[10] = (unsigned short )0;
            sqlstm.sqhstv[11] = (unsigned char  *)&s_ovtmamt;
            sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[11] = (         int  )0;
            sqlstm.sqindv[11] = (         short *)0;
            sqlstm.sqinds[11] = (         int  )0;
            sqlstm.sqharm[11] = (unsigned long )0;
            sqlstm.sqadto[11] = (unsigned short )0;
            sqlstm.sqtdso[11] = (unsigned short )0;
            sqlstm.sqhstv[12] = (unsigned char  *)&s_ovtmhh;
            sqlstm.sqhstl[12] = (unsigned long )sizeof(float);
            sqlstm.sqhsts[12] = (         int  )0;
            sqlstm.sqindv[12] = (         short *)0;
            sqlstm.sqinds[12] = (         int  )0;
            sqlstm.sqharm[12] = (unsigned long )0;
            sqlstm.sqadto[12] = (unsigned short )0;
            sqlstm.sqtdso[12] = (unsigned short )0;
            sqlstm.sqhstv[13] = (unsigned char  *)&s_ovmcamt;
            sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
            sqlstm.sqhsts[13] = (         int  )0;
            sqlstm.sqindv[13] = (         short *)0;
            sqlstm.sqinds[13] = (         int  )0;
            sqlstm.sqharm[13] = (unsigned long )0;
            sqlstm.sqadto[13] = (unsigned short )0;
            sqlstm.sqtdso[13] = (unsigned short )0;
            sqlstm.sqhstv[14] = (unsigned char  *)&totpay;
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
                 /* EXEC SQL CLOSE cursor2_1; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 12;
                 sqlstm.arrsiz = 29;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )942;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)4352;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                 return(SUCCESS);
            }
       
            if  (calc_sum1() == SUCCESS)
            {
                 s_count++;
            }
            else
            {
                 f_count++;
                 printf("[집계단계1]에 실패한 EMPNO : %s \n", empno);
                 /*sprintf(log_buff, "[집계단계1]에 실패한 EMPNO : %s \n", empno); *dsa2000 Rexec 대체*/
                          /*Write_batlog(seqno++, log_buff);*/
            }
       }
}



/**************************************************************************
  기본인사사항과 시간별집계를 처리한다.
 **************************************************************************/
calc_sum1()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          double  tongpay;

          /* 전,당월합 60분 이상시 사용. 시간 임시변수 */
          int     tmp_genexthh  = 0;
          int     tmp_holiexthh = 0;
          int     tmp_nighthh   = 0;
          int     tmp_holihh    = 0;
          int     tmp_mealhh    = 0;
          int     tmp_restmm    = 0;
          int     tmp_sprestmm  = 0;

          /* 임금 임시변수 */
          double  tmp_extamt    = 0;
          double  tmp_nightamt  = 0;
          double  tmp_holiamt   = 0;
          double  tmp_mealamt   = 0;
          double  tmp_excepamt  = 0;
          double  tmp_restamt   = 0;
          double  tmp_sprestamt = 0;
          double  tmp_ovtmamt   = 0;

          int     tmp_exthh     = 0;
     /* EXEC SQL END DECLARE SECTION; */ 


     /* EXEC SQL
     DELETE  PKHOTSUM
      WHERE  EMPNO    = :empno
        AND   OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHOTSUM  where (EMPNO=:b0 and OVTMYYMM=:b\
1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )957;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)  )
     {
          printf("ERROR_CODE : %d, 삭제 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 삭제 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC SQL
     INSERT INTO PKHOTSUM
             (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE)
     SELECT   PAYDATE, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE
       FROM  PKHPHIS
      WHERE  EMPNO   = :empno
        AND   PAYDATE = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE)select PAYDATE ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PAYRA ,\
ORGNUM ,DEPTCODE  from PKHPHIS where (EMPNO=:b0 and PAYDATE=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )980;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)  )
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패1\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패1\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC SQL
     INSERT  INTO PKHOTSUM
            (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE)
     SELECT   :workmm, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE
     FROM  PKMPMAS
     WHERE  EMPNO   = :empno
     AND   (0 = (SELECT COUNT(*)
                   FROM   PKHOTSUM
                  WHERE  EMPNO = :empno AND OVTMYYMM = :workmm)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE)select :b0 ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PAYRA ,ORGN\
UM ,DEPTCODE  from PKMPMAS where (EMPNO=:b1 and 0=(select count(*)   from PKH\
OTSUM where (EMPNO=:b1 and OVTMYYMM=:b0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1003;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
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
     sqlstm.sqhstv[2] = (unsigned char  *)empno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패2\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패2\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* ==============================================================================
      Version  date(yy.mm.dd)  programmer  description               relevant doc.no
      30.00    1999.01.05       민정숙     기존루틴삭제              하나로재개발
      ============================================================================= */
     /*mjs  if (read_basicinfo(empno,  &totpay) == FAIL)
        return(FAIL);
        */

     /* DB package에서 계산 jissi. 2014.11.05
     tongpay = get_tongpay(paycl);

     if  (tongpay == FAIL)
          return(FAIL);

     EXEC  SQL
     UPDATE  PKHOTSUM
        SET TONGPAY = :tongpay
     WHERE  EMPNO = :empno AND OVTMYYMM = :workmm;
     */
     /*
     EXEC  SQL
     UPDATE  PKHOTSUM
        SET TONGPAY = (case when OVTMYYMM < :comchdate                         *2014.11.17이후 초과근무수당 계산할 때 통상임금이 총연봉 18분할에서 고정식교비포함 12분할로*
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO) end)
     WHERE  EMPNO = :empno AND OVTMYYMM = :workmm;
     */
     /* EXEC  SQL
     UPDATE  PKHOTSUM
        SET TONGPAY = (case when OVTMYYMM < :comchdate                        /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:yearpaynum)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO,:yearpaynum) end)
     WHERE  EMPNO = :empno AND OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM  set TONGPAY= case  when OVTMYYMM<:b0 t\
hen hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:b1) else hper.COMMONUTIL.GET_NEWBAS\
EPAY(EMPNO,:b1)  end  where (EMPNO=:b3 and OVTMYYMM=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1034;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)comchdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
     sqlstm.sqhstl[4] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0)  && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 통상임금 반영실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 통상임금 반영실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     // 개인별 PKHOTFWD 조회 -> 이월 게산 -> 시간단위 당월 합산 -> 이훨 Update
     /* EXEC SQL
     SELECT  PRE_GENEXTSUM, PRE_HOLIEXTSUM, PRE_NIGHTSUM,
             PRE_HOLISUM, PRE_MEALSUM, PRE_RESTSUM, PRE_SPRESTSUM
       INTO  :pre_genextsum, :pre_holiextsum, :pre_nightsum,
             :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum
       FROM  PKHOTFWD
      WHERE  EMPNO    = :empno
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select PRE_GENEXTSUM ,PRE_HOLIEXTSUM ,PRE_NIGHTSUM ,PRE\
_HOLISUM ,PRE_MEALSUM ,PRE_RESTSUM ,PRE_SPRESTSUM into :b0,:b1,:b2,:b3,:b4,:b\
5,:b6  from PKHOTFWD where (EMPNO=:b7 and OVTMYYMM=:b8)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1069;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)empno;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)workmm;
     sqlstm.sqhstl[8] = (unsigned long )7;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
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



     /* 60분 이상시 시간 보관 */
     if (pre_genextsum % 60 >= 0)
     {
       tmp_genexthh = (int)pre_genextsum / 60;
       nxt_genextmm   = pre_genextsum % 60;
     }

     if (pre_holiextsum % 60 >= 0)
     {
       tmp_holiexthh = (int)pre_holiextsum / 60;
       nxt_holiextmm = pre_holiextsum % 60;
     }

     if (pre_nightsum % 60 >= 0)
     {
       tmp_nighthh = (int)pre_nightsum / 60;
       nxt_nightmm = pre_nightsum % 60;
     }

     if (pre_holisum % 60 >= 0)
     {
       tmp_holihh = (int)pre_holisum / 60;
       nxt_holimm = pre_holisum % 60;
     }

     if (pre_mealsum % 60 >= 0)
     {
       tmp_mealhh = (int)pre_mealsum / 60;
       nxt_mealmm = pre_mealsum % 60;
     }

     if (pre_restsum % 60 >= 0)
     {
       tmp_restmm = ((int)pre_restsum / 60) * 60;
       nxt_restmm = pre_restsum % 60;
     }

     if (pre_sprestsum % 60 >= 0)
     {
       tmp_sprestmm = ((int)pre_sprestsum / 60) * 60;
       nxt_sprestmm = pre_sprestsum % 60;
     }

     tmp_exthh = tmp_genexthh + tmp_holiexthh;
     /* 60분 이상시 시간 보관 end */
/*sprintf(log_buff, "\n [NXT_HH] pre_genextsum=%d, nxt_genext=%d, pre_holiextsum=%d, nxt_holiext=%d"
                , pre_genextsum, nxt_genextmm, pre_holiextsum, nxt_holiextmm);
Write_batlog(seqno++, log_buff);
sprintf(log_buff, "\n [NXT_HH] pre_nightsum=%d, nxt_night=%d, pre_holisum=%d, nxt_holi=%d"
                , pre_nightsum, nxt_nightmm, pre_holisum, nxt_holimm);
Write_batlog(seqno++, log_buff);
sprintf(log_buff, "\n [NXT_HH] pre_mealsum=%d, nxt_meal=%d, pre_restsum=%d, nxt_rest=%d, pre_sprestsum=%d, nxt_sprest=%d"
                , pre_mealsum, nxt_mealmm, pre_restsum, nxt_restmm, pre_sprestsum, nxt_sprestmm);
Write_batlog(seqno++, log_buff);*/

     /* EXEC SQL
     SELECT  case when :ovtmdate < :comchdate                      /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                  then hper.COMMONUTIL.GET_OLDBASEPAY(:empno,:yearpaynum)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(:empno,:yearpaynum) end  /oDB package에서 계산 jissi. 2016.12.14o/
       INTO :tongpay
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select  case  when :b0<:b1 then hper.COMMONUTIL.GET_OLD\
BASEPAY(:b2,:b3) else hper.COMMONUTIL.GET_NEWBASEPAY(:b2,:b3)  end  into :b6 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1120;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)comchdate;
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
     sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[3] = (unsigned long )7;
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
     sqlstm.sqhstv[5] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&tongpay;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
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



     /* 임금계산 */
     tmp_extamt    = (tmp_genexthh  * tongpay * 1.5) +
                     (tmp_holiexthh * tongpay * 0.5);
     tmp_nightamt  =  tmp_nighthh   * tongpay * 0.5;
     tmp_holiamt   =  tmp_holihh    * tongpay * 1.5;
     tmp_mealamt   =  tmp_mealhh    * tongpay * 1.5;
     tmp_restamt   =  floor((int)tmp_restmm/60  * tongpay * 1.5);
     tmp_sprestamt =  floor((int)tmp_sprestmm/60 * tongpay );

     tmp_extamt    = ceil(tmp_extamt);
     tmp_nightamt  = ceil(tmp_nightamt);
     tmp_holiamt   = ceil(tmp_holiamt);
     tmp_mealamt   = floor(tmp_mealamt);

     tmp_ovtmamt  = (tmp_extamt + tmp_nightamt + tmp_holiamt)
                  - tmp_restamt - tmp_sprestamt - tmp_mealamt;
     /* 임금계산 end */
/*sprintf(log_buff, "\n [TMP_PAY] tmp_extamt=%d, tmp_nightamt=%d"
                , (int)tmp_extamt, (int)tmp_nightamt);
Write_batlog(seqno++, log_buff);
sprintf(log_buff, "\n [TMP_PAY] tmp_holiamt=%d, tmp_mealamt=%d"
                , (int)tmp_holiamt, (int)tmp_mealamt);
Write_batlog(seqno++, log_buff);*/
     /******************************************************************************/
     /* EXEC SQL
     UPDATE  PKHOTSUM
        SET
             TOTDD    = :s_totdd,
             OVTMDD   = :s_totdd,
             EXTHH    = (:s_exthh+:tmp_exthh),
             NIGHTHH  = (:s_nighthh+:tmp_nighthh),
             HOLIHH   = (:s_holihh+:tmp_holihh),
             OVERHH   = (:s_exthh+:s_nighthh+:s_holihh+:tmp_exthh+:tmp_nighthh+:tmp_holihh),
             TOTHH    = (:s_exthh+:s_nighthh+:s_holihh+:tmp_exthh+:tmp_nighthh+:tmp_holihh),
             GENEXT   = (:s_genext+:tmp_genexthh),
             HOLIEXT  = (:s_holiext+:tmp_holiexthh),
             EXTAMT   = (:s_extamt+:tmp_extamt),
             NIGHTAMT = (:s_nightamt+:tmp_nightamt),
             HOLIAMT  = (:s_holiamt+:tmp_holiamt),
             OVERAMT  = (:s_ovtmamt+:tmp_ovtmamt),
             OVTMAMT  = (:s_ovtmamt+:tmp_ovtmamt),
             OVMCAMT  = :s_ovmcamt,
             REALHH   = :s_ovtmhh
      WHERE  EMPNO    = :empno
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM  set TOTDD=:b0,OVTMDD=:b0,EXTHH=(:b2+:b\
3),NIGHTHH=(:b4+:b5),HOLIHH=(:b6+:b7),OVERHH=(((((:b2+:b4)+:b6)+:b3)+:b5)+:b7\
),TOTHH=(((((:b2+:b4)+:b6)+:b3)+:b5)+:b7),GENEXT=(:b20+:b21),HOLIEXT=(:b22+:b\
23),EXTAMT=(:b24+:b25),NIGHTAMT=(:b26+:b27),HOLIAMT=(:b28+:b29),OVERAMT=(:b30\
+:b31),OVTMAMT=(:b30+:b31),OVMCAMT=:b34,REALHH=:b35 where (EMPNO=:b36 and OVT\
MYYMM=:b37)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1163;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&s_totdd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&s_totdd;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&tmp_exthh;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&tmp_nighthh;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&tmp_holihh;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&tmp_exthh;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&tmp_nighthh;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&tmp_holihh;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&tmp_exthh;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&tmp_nighthh;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&tmp_holihh;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&s_genext;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&tmp_genexthh;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&s_holiext;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&tmp_holiexthh;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&s_extamt;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&tmp_extamt;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&s_nightamt;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&tmp_nightamt;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&s_holiamt;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&tmp_holiamt;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&s_ovtmamt;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&tmp_ovtmamt;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&s_ovtmamt;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&tmp_ovtmamt;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&s_ovmcamt;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&s_ovtmhh;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)empno;
     sqlstm.sqhstl[36] = (unsigned long )5;
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)workmm;
     sqlstm.sqhstl[37] = (unsigned long )7;
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
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
         printf("ERROR_CODE : %d, 시간별집계 실패\n",sqlca.sqlcode);
         sprintf(log_buff, "ERROR_CODE : %d, 시간별집계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
         Write_batlog(seqno++, log_buff);
         return(FAIL);
     }
     //else
     //	 return(SUCCESS);
     
     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* EXEC SQL
     UPDATE  PKHOTFWD
        SET  STATE           = 3
            ,NXT_GENEXT      = :nxt_genextmm
            ,NXT_HOLIEXT     = :nxt_holiextmm
            ,NXT_NIGHT       = :nxt_nightmm
            ,NXT_HOLI        = :nxt_holimm
            ,NXT_MEAL        = :nxt_mealmm
            ,NXT_REST        = :nxt_restmm
            ,NXT_SPREST      = :nxt_sprestmm
            ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
            ,WRITEMAN        = :jobempno
      WHERE  EMPNO           = :empno
        AND  OVTMYYMM        = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTFWD  set STATE=3,NXT_GENEXT=:b0,NXT_HOLIEXT\
=:b1,NXT_NIGHT=:b2,NXT_HOLI=:b3,NXT_MEAL=:b4,NXT_REST=:b5,NXT_SPREST=:b6,WRIT\
ETIME=TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=:b7 where (EMPNO=:b8 and O\
VTMYYMM=:b9)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1330;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&nxt_genextmm;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&nxt_holiextmm;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&nxt_nightmm;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&nxt_holimm;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&nxt_mealmm;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&nxt_restmm;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&nxt_sprestmm;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)empno;
     sqlstm.sqhstl[8] = (unsigned long )5;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)workmm;
     sqlstm.sqhstl[9] = (unsigned long )7;
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


     
/*sprintf(log_buff, "\n [FWD_UP] EMPNO=%s,NXT_GENEXT=%d, NXT_HOLIEXT=%d, NXT_NIGHT=%d"
                , empno, nxt_genextmm, nxt_holiextmm, nxt_nightmm);
Write_batlog(seqno++, log_buff);     
sprintf(log_buff, "\n [FWD_UP] NXT_HOLI=%d, NXT_MEAL=%d, NXT_REST=%d, NXT_SPREST=%d"
                , nxt_holimm, nxt_mealmm, nxt_restmm, nxt_sprestmm);
Write_batlog(seqno++, log_buff);*/

     if  (sqlca.sqlcode != 0)
     {
          printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
          return(FAIL);
     }
     else
          return(SUCCESS);
     /******************************************************************************/
}

/* ===============================================================================
 Version  date(yy.mm.dd)  programmer    description                        relevant doc.no
 30.30    2001.11.13.      유효성       근태테이블(pkhduty)의 대휴(repoff)및 교휴를 불러와
                                        최종계산된 초과수당(pkhotsum의 ovtmamt)에서 빼는 로직 추가.
 ============================================================================= */
process_repoff()
{
    /*pkhotsum table에 없는 사원은 INSERT*/
     /* EXEC SQL
     INSERT   INTO PKHOTSUM
            (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE, WRITEMAN)
     SELECT   :workmm, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE, '****'
       FROM  PKMPMAS
      WHERE  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO   IN (SELECT   EMPNO
                           FROM   PKHDUTY
                          WHERE   DUYYMM = :workmm
                            AND   (NVL(REPOFF, 0) <> 0  or NVL(SPEOFF,0) <> 0)
                            AND   EMPNO  NOT IN (SELECT EMPNO
                                                   FROM PKHOTSUM
                                                  WHERE OVTMYYMM = :workmm )) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE,WRITEMAN)select :b0 ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PA\
YRA ,ORGNUM ,DEPTCODE ,'****'  from PKMPMAS where ((EMPNO>=:b1 and EMPNO<=:b2\
) and EMPNO in (select EMPNO  from PKHDUTY where ((DUYYMM=:b0 and (NVL(REPOFF\
,0)<>0 or NVL(SPEOFF,0)<>0)) and EMPNO not  in (select EMPNO  from PKHOTSUM w\
here OVTMYYMM=:b0))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1385;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
     sqlstm.sqhstl[4] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패3\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패3\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

   /*통상임금 UPDATE*/
   /*
     EXEC SQL
     UPDATE PKHOTSUM A
     SET TONGPAY = (SELECT CEIL(TOTPAY /23/226)
                      FROM PKHYPHIS B, PKCPBAS C
                     WHERE A.EMPNO = B.EMPNO
                       AND B.YEARPAYNUM = TO_CHAR(C.YEARPAYNUM) )
     WHERE OVTMYYMM = :workmm
       AND (EMPNO >= :frempno AND EMPNO <= :toempno )
       AND WRITEMAN ='****' ;
   */
   /*
     EXEC SQL
     UPDATE PKHOTSUM A
        SET TONGPAY = (SELECT GREATEST(CEIL(TOTPAY /18/226),:ovminamt) * 기준통상임금(최저) 적용* *  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 *
                         FROM PKHYPHIS B, PKCPBAS C
                        WHERE A.EMPNO = B.EMPNO
                          AND B.YEARPAYNUM = TO_CHAR(C.YEARPAYNUM) )
      WHERE OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND EMPNO NOT LIKE 'Y%'
        AND WRITEMAN ='****' ;

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 정규직 통상임금 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 정규직통상임금 UPDATE 실패\n", sqlca.sqlcode); *dsa2000 Rexec 대체*
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }


     EXEC SQL
     UPDATE PKHOTSUM A
        SET TONGPAY = (SELECT GREATEST(CEIL((TOTPAY*(1-y_manrate/100)) /18/226),:ovminamt) * 기준통상임금(최저) 적용* *  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 *
                         FROM PKHYPHIS B, PKCPBAS C
                        WHERE A.EMPNO = B.EMPNO
                          AND B.YEARPAYNUM = TO_CHAR(C.YEARPAYNUM) )
      WHERE OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND EMPNO LIKE 'Y%'
        AND WRITEMAN ='****' ;

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 일반직 통상임금 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 일반직 통상임금 UPDATE 실패\n", sqlca.sqlcode); *dsa2000 Rexec 대체*
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
   */
   /*
     EXEC SQL
     UPDATE PKHOTSUM A
        SET TONGPAY  = (case when OVTMYYMM < :comchdate                        *2014.11.17이후 초과근무수당 계산할 때 통상임금이 총연봉 18분할에서 고정식교비포함 12분할로*
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO) end)
      WHERE OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND WRITEMAN ='****' ;
   */
     /* EXEC SQL
     UPDATE PKHOTSUM A
        SET TONGPAY  = (case when OVTMYYMM < :comchdate                        /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:yearpaynum)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO,:yearpaynum) end)
      WHERE OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND WRITEMAN ='****' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set TONGPAY= case  when OVTMYYMM<:b0\
 then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:b1) else hper.COMMONUTIL.GET_NEWB\
ASEPAY(EMPNO,:b1)  end  where ((OVTMYYMM=:b3 and (EMPNO>=:b4 and EMPNO<=:b5))\
 and WRITEMAN='****')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1420;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)comchdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frempno;
     sqlstm.sqhstl[4] = (unsigned long )5;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)toempno;
     sqlstm.sqhstl[5] = (unsigned long )5;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 통상임금 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 통상임금 UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

   /*대휴갯수 UPDATE*/
/*     EXEC SQL         KTH 2010.05.26 대휴 일수 계산 (휴일 근무 하고 초과근무 안올리고 대체 휴무 하기 때문에 주석 처리)
                                                       김현순 메니져가 확인 할 수 있는 사항이라고 함.
     UPDATE  PKHOTSUM A
        SET  REPOFFDD = (SELECT NVL(REPOFF,0)
                           FROM PKHDUTY B
                          WHERE A.EMPNO = B.EMPNO
                            AND B.DUYYMM = :workmm)
      WHERE  OVTMYYMM = :workmm
        AND  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO IN (SELECT EMPNO FROM PKHDUTY
                        WHERE DUYYMM = :workmm
                          AND NVL(REPOFF,0) <> 0 ) ;

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 대휴갯수 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 대휴갯수UPDATE 실패\n", sqlca.sqlcode); /dsa2000 Rexec 대체/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }  */

   /*대휴금액 UPDATE*/
/*     EXEC SQL
     UPDATE  PKHOTSUM A
        SET  REPOFFAMT = ceil(NVL(REPOFFDD,0) * :rephh * NVL(TONGPAY,0) * 1.5)
      WHERE  OVTMYYMM = :workmm
        AND  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO IN (SELECT EMPNO FROM PKHDUTY
                        WHERE DUYYMM = :workmm
                          AND NVL(REPOFF,0) <> 0 ) ;

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 대휴금액 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 대휴금액UPDATE 실패\n", sqlca.sqlcode); /dsa2000 Rexec 대체/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
*/

   /*교휴갯수 UPDATE 20090427 KTH 추가*/
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  SPEOFFDD = (SELECT NVL(SPEOFF,0)
                           FROM PKHDUTY B
                          WHERE A.EMPNO = B.EMPNO
                            AND B.DUYYMM = :workmm)
     WHERE OVTMYYMM = :workmm
       AND (EMPNO >= :frempno AND EMPNO <= :toempno )
       AND EMPNO IN (SELECT EMPNO FROM PKHDUTY
                      WHERE DUYYMM = :workmm
                        AND NVL(SPEOFF,0) <> 0 ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set SPEOFFDD=(select NVL(SPEOFF,0)  \
from PKHDUTY B where (A.EMPNO=B.EMPNO and B.DUYYMM=:b0)) where ((OVTMYYMM=:b0\
 and (EMPNO>=:b2 and EMPNO<=:b3)) and EMPNO in (select EMPNO  from PKHDUTY wh\
ere (DUYYMM=:b0 and NVL(SPEOFF,0)<>0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1459;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
     sqlstm.sqhstl[4] = (unsigned long )7;
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




     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 교휴갯수 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 교휴갯수UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

   /*교휴금액 UPDATE 20090427 KTH 추가 */
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  SPEOFFAMT = ceil(NVL(SPEOFFDD,0) * :rephh * NVL(TONGPAY,0) )
      WHERE  OVTMYYMM = :workmm
        AND  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO IN (SELECT EMPNO FROM PKHDUTY
                        WHERE DUYYMM = :workmm
                          AND NVL(SPEOFF,0) <> 0 ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set SPEOFFAMT=ceil(((NVL(SPEOFFDD,0)\
* :b0)* NVL(TONGPAY,0))) where ((OVTMYYMM=:b1 and (EMPNO>=:b2 and EMPNO<=:b3)\
) and EMPNO in (select EMPNO  from PKHDUTY where (DUYYMM=:b1 and NVL(SPEOFF,0\
)<>0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1494;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&rephh;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
     sqlstm.sqhstl[4] = (unsigned long )7;
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



     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 교휴금액 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 교휴금액UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }



   /*최종초과수당 UPDATE*/
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  OVTMAMT = NVL(OVERAMT, 0) - NVL(REPOFFAMT, 0)- NVL(SPEOFFAMT, 0),
             WRITETIME = to_char(sysdate,'yyyymmddhh24mi'),
             WRITEMAN  = :jobempno
      WHERE  OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set OVTMAMT=((NVL(OVERAMT,0)-NVL(REP\
OFFAMT,0))-NVL(SPEOFFAMT,0)),WRITETIME=to_char(sysdate,'yyyymmddhh24mi'),WRIT\
EMAN=:b0 where (OVTMYYMM=:b1 and (EMPNO>=:b2 and EMPNO<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1529;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 최종초과수당 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 최종초과수당 UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }


     return(SUCCESS);

}



/****************************************************************************
  초과근무월별집계를 수행하는 Procedure2.
 ****************************************************************************/
process_sumstep2()
{
     char  t_empno[4+1]  = "";

     /* EXEC SQL DECLARE cursor3 CURSOR FOR
     SELECT  EMPNO, DAYKIND, SUM(OVTMHH), SUM(OVTMAMT)
       FROM  PKHOTHIS
      WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  ( EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
      GROUP  BY EMPNO, DAYKIND
      ORDER  BY EMPNO, DAYKIND; */ 


     /* EXEC SQL OPEN cursor3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0033;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1560;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, OPEN cursor3 Error...\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, OPEN cursor3 Error..\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1587;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }


     s_count = f_count = 0;
     while(1)
     {
          /* EXEC SQL FETCH cursor3
          INTO :empno, :daykind, :s_tothh, :s_ovtmamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1602;
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
          sqlstm.sqhstv[1] = (unsigned char  *)daykind;
          sqlstm.sqhstl[1] = (unsigned long )2;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&s_ovtmamt;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 38;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1633;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }

          if  (calc_sum2() == SUCCESS)
          {
              if  (strcmp(t_empno,empno) != 0)
                   s_count++;
               sprintf(t_empno,"%s",empno);
          }
          else
          {
               f_count++;
               printf("[집계단계2]에 실패한 EMPNO : %s \n", empno);
               /*sprintf(log_buff, "[집계단계2]에 실패한 EMPNO : %s \n", empno); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff); */
          }
     }
}

/**************************************************************************
  집계단계2를 처리한다.
 **************************************************************************/
calc_sum2()
{
     if  (strcmp(daykind,"1") == 0 )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTGENHH = :s_tothh,
                  OTGENAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTGENHH=:b0,OTGENAMT=:b1 wher\
e (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1648;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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
               printf("ERROR_CODE : %d, 근무일자별 집계단계1 실패\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계1 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                        Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }

     if ((strcmp(daykind,"2") == 0) || (strcmp(daykind,"3") == 0) )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTSATHH = :s_tothh,
                  OTSATAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTSATHH=:b0,OTSATAMT=:b1 wher\
e (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1679;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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
               printf("ERROR_CODE : %d, 근무일자별 집계단계2 실패\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계2 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }

     if  (strcmp(daykind,"4") == 0 )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTHOLIHH = :s_tothh,
                  OTHOLIAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTHOLIHH=:b0,OTHOLIAMT=:b1 wh\
ere (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1710;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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
               printf("ERROR_CODE : %d, 근무일자별 집계단계3 실패\n",sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계3 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }
}

/***************************************************************************
  작업년월에 해당하는 월별집계자료가 존재하는 지를 검사.
 ***************************************************************************/
check_existence()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          double  count;
     /* EXEC SQL END DECLARE SECTION; */ 


     /* EXEC SQL
     SELECT  COUNT(*)
       INTO  :count
       FROM  PKHOTSUM
      WHERE  (EMPNO >= :frempno AND EMPNO <= :toempno)
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKHOTSUM where ((EMPNO>\
=:b1 and EMPNO<=:b2) and OVTMYYMM=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1741;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
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
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
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



     if  (count > 0)
          return(SUCCESS);
     else
          return(FAIL);
}
/****************************************************************************
  이미 존재하는 월별집계자료를 삭제하는 Procedure.
 ****************************************************************************/
delete_records()
{
     /* EXEC SQL
     DELETE  FROM PKHOTSUM
      WHERE  (EMPNO >= :empno AND EMPNO <= :empno)
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHOTSUM  where ((EMPNO>=:b0 and EMPNO<=:b\
0) and OVTMYYMM=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1772;
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
     sqlstm.sqhstv[1] = (unsigned char  *)empno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)workmm;
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



     if  (sqlca.sqlcode != 0)
     {
          printf("ERROR_CODE : %d,기존자료 삭제실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기존자료 삭제실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/****************************************************************************
  trail_spaces function.
 ****************************************************************************/
void trail_spaces(char *dest)
{
     int len,i,flag;

     len = strlen(dest);

     i    = 0;
     flag = 0;
     while (i < len)
     {
          if (*(dest+i) == ' ')
          {
               flag = 1;
               break;
          }
          else
            i++;
     }

     if  (flag)
         *(dest+i) = '\0';
     else
         *(dest+len) = '\0';
}
/****************************************************************************
  calc_term function.
 ****************************************************************************/
double  calc_term(char *frdate,char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[9] = "";
          char  t2_date[9] = "";
          double  term;
     /* EXEC SQL END   DECLARE SECTION; */ 


     strncpy(t1_date,frdate,8);
     strncpy(t2_date,todate,8);
     /* EXEC SQL
     SELECT  TO_DATE(:t2_date,'YYYYMMDD') - TO_DATE(:t1_date,'YYYYMMDD')
       INTO  :term
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD')\
) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1799;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t2_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&term;
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
          return(FAIL);
     else
          return(term);
}

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     루틴삭제                    하나로재개발
 ============================================================================= */
/* mjs  begin
read_basicinfo(char *empno, double *totpay)
{
  EXEC SQL BEGIN DECLARE SECTION;
   char  t_empno[4+1] = "";
   char  t_paycl[2+1] = "";
   double  t_totpay;
  EXEC SQL END DECLARE SECTION;

  sprintf(t_empno,"%.4s",empno);

  EXEC SQL
  SELECT  PAYCL, totpay
  INTO  :t_paycl, :t_totpay
  FROM  PKHOTHIS
  WHERE  EMPNO = :t_empno;
  if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
  {
   printf("월급여이력 읽기오류!!! \n");
   return(FAIL);
  }
  else if (sqlca.sqlcode == 1403)
  {
   EXEC SQL
   SELECT  PAYCL, BASICAMT, INFOAMT, NVL(DUTYAMT,0)
   INTO  :t_paycl, :t_basicamt, :t_infoamt, :t_dutyamt
   FROM  PKMPMAS
   WHERE  EMPNO = :t_empno;
   if (sqlca.sqlcode != 0)
   {
     printf("월급여마스터 읽기오류!!! \n");
     return(FAIL);
   }

   sprintf(paycl,"%.2s",t_paycl);
   *basicamt = t_basicamt;
   *infoamt  = t_infoamt;
   *dutyamt  = t_dutyamt;
  }
  else
  {
   sprintf(paycl,"%.2s",t_paycl);
   *basicamt = t_basicamt;
   *infoamt  = t_infoamt;
   *dutyamt  = t_dutyamt;
  }
  return(SUCCESS);
}  mjs end */

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{
     /* EXEC SQL AT log_db
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1826;
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
          return(FAILURE);
     }

     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1867;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}

pre_PKHOTFWD()
{

  /* EXEC SQL BEGIN DECLARE SECTION; */ 

    char tmp_empno[5];
    char tmp_workmm[7];
    char tmp_jobempno[5];

    int  count = 0, pre_count = 0;
    int  state = 0, pre_state = 0;

    /*int  pre_genext;
    int  pre_holiext;
    int  pre_night;
    int  pre_holi;
    int  pre_meal;
    int  pre_rest;
    int  pre_sprest;*/
  /* EXEC SQL END DECLARE SECTION; */ 


  strncpy(tmp_empno,empno,5);
  strncpy(tmp_workmm,workmm,7);
  strncpy(tmp_jobempno,jobempno,5);

  /* 당월 존재여부 체크 */
	/*EXEC SQL
  SELECT COUNT(*)
    INTO :count
    FROM PKHOTFWD a
        ,PKHOTSUM b
   WHERE b.EMPNO    = :empno
     AND b.OVTMYYMM = :workmm
     AND b.EMPNO    = a.EMPNO(+)
     AND b.OVTMYYMM = a.OVTMYYMM(+);*/
  /* EXEC SQL
  SELECT COUNT(*),max(STATE)
    INTO :count, :state
    FROM PKHOTFWD
   WHERE EMPNO    = :empno
     AND OVTMYYMM = :workmm
   ORDER BY EMPNO, OVTMYYMM, STATE; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 38;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select count(*)  ,max(STATE) into :b0,:b1  from PKHOTFWD w\
here (EMPNO=:b2 and OVTMYYMM=:b3) order by EMPNO,OVTMYYMM,STATE ";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )1888;
  sqlstm.selerr = (unsigned short)0;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)4352;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (unsigned char  *)&count;
  sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         short *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned long )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (unsigned char  *)&state;
  sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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
  sqlstm.sqhstv[3] = (unsigned char  *)workmm;
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



  /* 전월 존재여부 체크 */
  /*EXEC SQL
  SELECT COUNT(*)
    INTO :pre_count
    FROM PKHOTFWD a
        ,PKHOTSUM b
   WHERE b.EMPNO    = :empno
     AND b.OVTMYYMM = :workmm-1
     AND b.EMPNO    = a.EMPNO(+)
     AND b.OVTMYYMM = a.OVTMYYMM(+);*/
  /* EXEC SQL
  SELECT COUNT(*),max(STATE)
    INTO :pre_count, :pre_state
    FROM PKHOTFWD
   WHERE EMPNO    = :empno
     AND OVTMYYMM = :workmm-1
   ORDER BY EMPNO, OVTMYYMM, STATE; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 38;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select count(*)  ,max(STATE) into :b0,:b1  from PKHOTFWD w\
here (EMPNO=:b2 and OVTMYYMM=(:b3-1)) order by EMPNO,OVTMYYMM,STATE ";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )1919;
  sqlstm.selerr = (unsigned short)0;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)4352;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (unsigned char  *)&pre_count;
  sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         short *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned long )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (unsigned char  *)&pre_state;
  sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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
  sqlstm.sqhstv[3] = (unsigned char  *)workmm;
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



/*sprintf(log_buff, "\n [PKHOTFWD] count=%d, pre_count=%d, workmm=%s, empno=%s"
                , count, pre_count, tmp_workmm, tmp_empno);
Write_batlog(seqno++, log_buff);*/

  /* 당월 없으면 생성 */
  if (count == 0)
  {
  	/* 전월 데이터도 없으면 모두 0 */
  	if (pre_count == 0)
  	{
  		/* EXEC SQL
	  	INSERT INTO PKHOTFWD
	  	VALUES (:workmm, :empno, 1,
	  	        0, 0, 0, 0, 0, 0, 0,
	  	        0, 0, 0, 0, 0, 0, 0,
	            TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 38;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PKHOTFWD  values (:b0,:b1,1,0,0,0,0,0,0,0,0,\
0,0,0,0,0,0,TO_Char(sysdate,'YYYYMMDDHH24MISS'),:b2)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1950;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)workmm;
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
    sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
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



      if (sqlca.sqlcode != 0)
      {
        printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
        sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
        Write_batlog(seqno++, log_buff);
        return(FAIL);
      }
      return(SUCCESS);

/*sprintf(log_buff, "\n [PKHOTFWD] workmm=%s, empno=%s, tmp_jobempno=%s"
                , tmp_workmm, tmp_empno, tmp_jobempno);
Write_batlog(seqno++, log_buff);*/
  	}
  	/* 전월 데이터 있으면 조회 후 전,당월 이월합에 Insert */
  	else
  	{
	  	/* EXEC SQL
	  	SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
	  	       nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0)
	  	  INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
	  	       :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum
	      FROM PKHOTFWD
	  	 WHERE EMPNO    = :empno
	       AND OVTMYYMM = (:workmm-1); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 38;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select nvl(NXT_GENEXT,0) ,nvl(NXT_HOLIEXT,0) ,nvl(NXT_NI\
GHT,0) ,nvl(NXT_HOLI,0) ,nvl(NXT_MEAL,0) ,nvl(NXT_REST,0) ,nvl(NXT_SPREST,0) \
into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from PKHOTFWD where (EMPNO=:b7 and OVTMYYMM\
=(:b8-1))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1977;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)empno;
    sqlstm.sqhstl[7] = (unsigned long )5;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)workmm;
    sqlstm.sqhstl[8] = (unsigned long )7;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
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



	  	/* EXEC SQL
	  	INSERT INTO PKHOTFWD
	  	VALUES (:workmm, :empno, 1,
	  	        :pre_genextsum, :pre_holiextsum, :pre_nightsum, :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
	  	        0, 0, 0, 0, 0, 0, 0,
	            TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 38;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PKHOTFWD  values (:b0,:b1,1,:b2,:b3,:b4,:b5,\
:b6,:b7,:b8,0,0,0,0,0,0,0,TO_Char(sysdate,'YYYYMMDDHH24MISS'),:b9)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2028;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)workmm;
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
    sqlstm.sqhstv[2] = (unsigned char  *)&pre_genextsum;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&pre_holiextsum;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&pre_nightsum;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&pre_holisum;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&pre_mealsum;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&pre_sprestsum;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)jobempno;
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



	    if (sqlca.sqlcode != 0)
      {
        printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
        sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
        Write_batlog(seqno++, log_buff);
        return(FAIL);
      }
  	}
  }
  /* 당월 데이터가 있으면 집계위해 초기화 */
  else
  {
  	if (state != 2)
  	{
  	  /* 전월 데이터도 없으면 모두 0 */
  	  if (pre_count == 0)
  	  {
	    	/* EXEC SQL
	    	UPDATE PKHOTFWD
	    	   SET STATE           = 1
	    	      ,PRE_GENEXTSUM   = 0
	    	      ,PRE_HOLIEXTSUM  = 0
              ,PRE_NIGHTSUM    = 0
              ,PRE_HOLISUM     = 0
              ,PRE_MEALSUM     = 0
              ,PRE_RESTSUM     = 0
              ,PRE_SPRESTSUM   = 0
              ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
              ,WRITEMAN        = :jobempno
        WHERE EMPNO    = :empno
	        AND OVTMYYMM = :workmm; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 38;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKHOTFWD  set STATE=1,PRE_GENEXTSUM=0,PRE_HOLIE\
XTSUM=0,PRE_NIGHTSUM=0,PRE_HOLISUM=0,PRE_MEALSUM=0,PRE_RESTSUM=0,PRE_SPRESTSU\
M=0,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=:b0 where (EMPNO=:\
b1 and OVTMYYMM=:b2)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )2083;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)jobempno;
      sqlstm.sqhstl[0] = (unsigned long )5;
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
      sqlstm.sqhstv[2] = (unsigned char  *)workmm;
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


      
	      if (sqlca.sqlcode != 0)
        {
          printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
        }
      
/*sprintf(log_buff, "\n [PKHOTFWD] workmm=%s, empno=%s, tmp_jobempno=%s"
                , tmp_workmm, tmp_empno, tmp_jobempno);
Write_batlog(seqno++, log_buff);*/
  	  }
  	  /* 전월 데이터 있으면 조회 후 전,당월 이월합에 update */
  	  else
  	  {
	    	/* EXEC SQL
	    	SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
	    	       nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0)
	    	  INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
	    	       :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum
	        FROM PKHOTFWD
	    	 WHERE EMPNO    = :empno
	         AND OVTMYYMM = (:workmm-1); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 38;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "select nvl(NXT_GENEXT,0) ,nvl(NXT_HOLIEXT,0) ,nvl(NXT_\
NIGHT,0) ,nvl(NXT_HOLI,0) ,nvl(NXT_MEAL,0) ,nvl(NXT_REST,0) ,nvl(NXT_SPREST,0\
) into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from PKHOTFWD where (EMPNO=:b7 and OVTMYY\
MM=(:b8-1))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )2110;
      sqlstm.selerr = (unsigned short)0;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
      sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
      sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
      sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[3] = (         int  )0;
      sqlstm.sqindv[3] = (         short *)0;
      sqlstm.sqinds[3] = (         int  )0;
      sqlstm.sqharm[3] = (unsigned long )0;
      sqlstm.sqadto[3] = (unsigned short )0;
      sqlstm.sqtdso[3] = (unsigned short )0;
      sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
      sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
      sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[5] = (         int  )0;
      sqlstm.sqindv[5] = (         short *)0;
      sqlstm.sqinds[5] = (         int  )0;
      sqlstm.sqharm[5] = (unsigned long )0;
      sqlstm.sqadto[5] = (unsigned short )0;
      sqlstm.sqtdso[5] = (unsigned short )0;
      sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
      sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[6] = (         int  )0;
      sqlstm.sqindv[6] = (         short *)0;
      sqlstm.sqinds[6] = (         int  )0;
      sqlstm.sqharm[6] = (unsigned long )0;
      sqlstm.sqadto[6] = (unsigned short )0;
      sqlstm.sqtdso[6] = (unsigned short )0;
      sqlstm.sqhstv[7] = (unsigned char  *)empno;
      sqlstm.sqhstl[7] = (unsigned long )5;
      sqlstm.sqhsts[7] = (         int  )0;
      sqlstm.sqindv[7] = (         short *)0;
      sqlstm.sqinds[7] = (         int  )0;
      sqlstm.sqharm[7] = (unsigned long )0;
      sqlstm.sqadto[7] = (unsigned short )0;
      sqlstm.sqtdso[7] = (unsigned short )0;
      sqlstm.sqhstv[8] = (unsigned char  *)workmm;
      sqlstm.sqhstl[8] = (unsigned long )7;
      sqlstm.sqhsts[8] = (         int  )0;
      sqlstm.sqindv[8] = (         short *)0;
      sqlstm.sqinds[8] = (         int  )0;
      sqlstm.sqharm[8] = (unsigned long )0;
      sqlstm.sqadto[8] = (unsigned short )0;
      sqlstm.sqtdso[8] = (unsigned short )0;
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


      
	    	/* EXEC SQL
	    	UPDATE PKHOTFWD
	    	   SET STATE           = 1
	    	      ,PRE_GENEXTSUM   = :pre_genextsum
	    	      ,PRE_HOLIEXTSUM  = :pre_holiextsum
              ,PRE_NIGHTSUM    = :pre_nightsum
              ,PRE_HOLISUM     = :pre_holisum
              ,PRE_MEALSUM     = :pre_mealsum
              ,PRE_RESTSUM     = :pre_restsum
              ,PRE_SPRESTSUM   = :pre_sprestsum
              ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
              ,WRITEMAN        = :jobempno
        WHERE EMPNO    = :empno
	        AND OVTMYYMM = :workmm; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 38;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKHOTFWD  set STATE=1,PRE_GENEXTSUM=:b0,PRE_HOL\
IEXTSUM=:b1,PRE_NIGHTSUM=:b2,PRE_HOLISUM=:b3,PRE_MEALSUM=:b4,PRE_RESTSUM=:b5,\
PRE_SPRESTSUM=:b6,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=:b7 \
where (EMPNO=:b8 and OVTMYYMM=:b9)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )2161;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
      sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
      sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
      sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[3] = (         int  )0;
      sqlstm.sqindv[3] = (         short *)0;
      sqlstm.sqinds[3] = (         int  )0;
      sqlstm.sqharm[3] = (unsigned long )0;
      sqlstm.sqadto[3] = (unsigned short )0;
      sqlstm.sqtdso[3] = (unsigned short )0;
      sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
      sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
      sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[5] = (         int  )0;
      sqlstm.sqindv[5] = (         short *)0;
      sqlstm.sqinds[5] = (         int  )0;
      sqlstm.sqharm[5] = (unsigned long )0;
      sqlstm.sqadto[5] = (unsigned short )0;
      sqlstm.sqtdso[5] = (unsigned short )0;
      sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
      sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[6] = (         int  )0;
      sqlstm.sqindv[6] = (         short *)0;
      sqlstm.sqinds[6] = (         int  )0;
      sqlstm.sqharm[6] = (unsigned long )0;
      sqlstm.sqadto[6] = (unsigned short )0;
      sqlstm.sqtdso[6] = (unsigned short )0;
      sqlstm.sqhstv[7] = (unsigned char  *)jobempno;
      sqlstm.sqhstl[7] = (unsigned long )5;
      sqlstm.sqhsts[7] = (         int  )0;
      sqlstm.sqindv[7] = (         short *)0;
      sqlstm.sqinds[7] = (         int  )0;
      sqlstm.sqharm[7] = (unsigned long )0;
      sqlstm.sqadto[7] = (unsigned short )0;
      sqlstm.sqtdso[7] = (unsigned short )0;
      sqlstm.sqhstv[8] = (unsigned char  *)empno;
      sqlstm.sqhstl[8] = (unsigned long )5;
      sqlstm.sqhsts[8] = (         int  )0;
      sqlstm.sqindv[8] = (         short *)0;
      sqlstm.sqinds[8] = (         int  )0;
      sqlstm.sqharm[8] = (unsigned long )0;
      sqlstm.sqadto[8] = (unsigned short )0;
      sqlstm.sqtdso[8] = (unsigned short )0;
      sqlstm.sqhstv[9] = (unsigned char  *)workmm;
      sqlstm.sqhstl[9] = (unsigned long )7;
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


      
	      if (sqlca.sqlcode != 0)
        {
          printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
        }
  	  }
    }
  }
}

print_Lastamt()
{

  /* EXEC SQL BEGIN DECLARE SECTION; */ 

  	int last_ovtmamt, last_ovtmamt_Y = 0;
  /* EXEC SQL END DECLARE SECTION; */ 


  /* EXEC SQL
  SELECT MAX(OVTMAMT), MAX(OVTMAMT_Y)
    INTO :last_ovtmamt, :last_ovtmamt_Y
    FROM
         (
         SELECT NVL(SUM(OVTMAMT),0) OVTMAMT,0 OVTMAMT_Y
           FROM PKHOTSUM
          WHERE OVTMYYMM = :workmm
            AND EMPNO >= :frempno AND EMPNO <= :toempno
            AND EMPNO NOT LIKE 'Y%'
         UNION
         SELECT 0,NVL(SUM(OVTMAMT),0)
           FROM PKHOTSUM
          WHERE OVTMYYMM = :workmm
            AND EMPNO >= :frempno AND EMPNO <= :toempno
            AND EMPNO LIKE 'Y%'
         )
  ; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 38;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select max(OVTMAMT) ,max(OVTMAMT_Y) into :b0,:b1  from (se\
lect NVL(sum(OVTMAMT),0) OVTMAMT ,0 OVTMAMT_Y  from PKHOTSUM where (((OVTMYYM\
M=:b2 and EMPNO>=:b3) and EMPNO<=:b4) and EMPNO not like 'Y%') union select 0\
 ,NVL(sum(OVTMAMT),0)  from PKHOTSUM where (((OVTMYYMM=:b2 and EMPNO>=:b3) an\
d EMPNO<=:b4) and EMPNO like 'Y%')) ";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )2216;
  sqlstm.selerr = (unsigned short)0;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)4352;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (unsigned char  *)&last_ovtmamt;
  sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         short *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned long )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (unsigned char  *)&last_ovtmamt_Y;
  sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         short *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned long )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (unsigned char  *)workmm;
  sqlstm.sqhstl[2] = (unsigned long )7;
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         short *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned long )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (unsigned char  *)frempno;
  sqlstm.sqhstl[3] = (unsigned long )5;
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         short *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned long )0;
  sqlstm.sqadto[3] = (unsigned short )0;
  sqlstm.sqtdso[3] = (unsigned short )0;
  sqlstm.sqhstv[4] = (unsigned char  *)toempno;
  sqlstm.sqhstl[4] = (unsigned long )5;
  sqlstm.sqhsts[4] = (         int  )0;
  sqlstm.sqindv[4] = (         short *)0;
  sqlstm.sqinds[4] = (         int  )0;
  sqlstm.sqharm[4] = (unsigned long )0;
  sqlstm.sqadto[4] = (unsigned short )0;
  sqlstm.sqtdso[4] = (unsigned short )0;
  sqlstm.sqhstv[5] = (unsigned char  *)workmm;
  sqlstm.sqhstl[5] = (unsigned long )7;
  sqlstm.sqhsts[5] = (         int  )0;
  sqlstm.sqindv[5] = (         short *)0;
  sqlstm.sqinds[5] = (         int  )0;
  sqlstm.sqharm[5] = (unsigned long )0;
  sqlstm.sqadto[5] = (unsigned short )0;
  sqlstm.sqtdso[5] = (unsigned short )0;
  sqlstm.sqhstv[6] = (unsigned char  *)frempno;
  sqlstm.sqhstl[6] = (unsigned long )5;
  sqlstm.sqhsts[6] = (         int  )0;
  sqlstm.sqindv[6] = (         short *)0;
  sqlstm.sqinds[6] = (         int  )0;
  sqlstm.sqharm[6] = (unsigned long )0;
  sqlstm.sqadto[6] = (unsigned short )0;
  sqlstm.sqtdso[6] = (unsigned short )0;
  sqlstm.sqhstv[7] = (unsigned char  *)toempno;
  sqlstm.sqhstl[7] = (unsigned long )5;
  sqlstm.sqhsts[7] = (         int  )0;
  sqlstm.sqindv[7] = (         short *)0;
  sqlstm.sqinds[7] = (         int  )0;
  sqlstm.sqharm[7] = (unsigned long )0;
  sqlstm.sqadto[7] = (unsigned short )0;
  sqlstm.sqtdso[7] = (unsigned short )0;
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



  /* 정규직 초과근무 이월수당 합산 */
  printf("\n 정규직 전월 이월수당 합산 =======================");
  sprintf(log_buff, "\n 정규직 전월 이월수당 합산 ======================="); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);

  printf("\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt);
  sprintf(log_buff,"\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);
  
  /* 계약직 초과근무 이월수당 합산 */
  printf("\n 계약직 전월 이월수당 합산 =======================");
  sprintf(log_buff, "\n 계약직 전월 이월수당 합산 ======================="); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);

  printf("\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt_Y);
  sprintf(log_buff,"\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt_Y); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);
}