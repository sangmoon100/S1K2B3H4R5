
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
    "pke2010g.pc"
};


static unsigned int sqlctx = 150771;


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
   unsigned char  *sqhstv[20];
   unsigned long  sqhstl[20];
            int   sqhsts[20];
            short *sqindv[20];
            int   sqinds[20];
   unsigned long  sqharm[20];
   unsigned long  *sqharc[20];
   unsigned short  sqadto[20];
   unsigned short  sqtdso[20];
} sqlstm = {12,20};

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
"select holidate  from pkcholi where ((holidate>=:b0 and holidate<=:b1) and \
holikind<>'0') order by holidate            ";

 static char *sq0010 = 
"select empno ,korname ,paycl  from pkmyemas where (empno>=:b0 and empno<=:b\
1) order by empno            ";

 static char *sq0012 = 
"select empno ,korname ,empdate ,yytotdd  from pkmyemas where (empno>=:b0 an\
d empno<=:b1) order by empno            ";

 static char *sq0024 = 
"select empno ,nvl(empdate,'00000000') ,ymdpsdd ,paycl  from pkmyemas where \
(empno>=:b0 and empno<=:b1) order by empno            ";

 static char *sq0034 = 
"select duyymm  from pkhduty where (empno=:b0 and duyymm between :b1 and :b2\
)           ";

 static char *sq0038 = 
"select EXFRDATE ,EXTODATE  from PKHEXDD where ((EMPNO=:b0 and UPPER(EXFIXYN\
)='Y') and ((SUBSTR(EXFRDATE,1,4)=:b1 or SUBSTR(EXTODATE,1,4)=:b1) or :b1 bet\
ween substr(exfrdate,1,4) and SUBSTR(EXTODATE,1,4)))           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,91,0,4,217,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
28,0,0,2,56,0,2,283,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
51,0,0,3,78,0,4,340,0,0,2,1,0,1,0,2,3,0,0,1,97,0,0,
74,0,0,4,352,0,3,405,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
109,0,0,5,99,0,4,509,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
136,0,0,6,192,0,4,565,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
167,0,0,7,131,0,4,630,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
194,0,0,8,119,0,9,669,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
217,0,0,8,0,0,15,675,0,0,0,0,0,1,0,
232,0,0,8,0,0,13,682,0,0,1,0,0,1,0,2,97,0,0,
251,0,0,8,0,0,15,686,0,0,0,0,0,1,0,
266,0,0,8,0,0,15,692,0,0,0,0,0,1,0,
281,0,0,9,66,0,4,714,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
304,0,0,10,104,0,9,738,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
327,0,0,10,0,0,15,741,0,0,0,0,0,1,0,
342,0,0,10,0,0,15,745,0,0,0,0,0,1,0,
357,0,0,10,0,0,13,751,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
384,0,0,10,0,0,15,756,0,0,0,0,0,1,0,
399,0,0,10,0,0,15,762,0,0,0,0,0,1,0,
414,0,0,10,0,0,15,769,0,0,0,0,0,1,0,
429,0,0,11,50,0,5,774,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
452,0,0,10,0,0,15,781,0,0,0,0,0,1,0,
467,0,0,12,115,0,9,831,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
490,0,0,12,0,0,15,835,0,0,0,0,0,1,0,
505,0,0,12,0,0,13,841,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,
536,0,0,12,0,0,15,846,0,0,0,0,0,1,0,
551,0,0,12,0,0,15,852,0,0,0,0,0,1,0,
566,0,0,12,0,0,15,860,0,0,0,0,0,1,0,
581,0,0,13,70,0,4,898,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
608,0,0,14,157,0,4,962,0,0,3,2,0,1,0,1,97,0,0,2,4,0,0,1,97,0,0,
635,0,0,15,75,0,4,980,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
658,0,0,16,86,0,4,996,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
681,0,0,17,90,0,4,1024,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
708,0,0,18,102,0,4,1041,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
735,0,0,19,97,0,4,1082,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
762,0,0,20,155,0,4,1102,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
793,0,0,21,329,0,5,1151,0,0,20,20,0,1,0,1,97,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
888,0,0,22,40,0,4,1188,0,0,1,0,0,1,0,2,4,0,0,
907,0,0,23,39,0,4,1200,0,0,1,0,0,1,0,2,4,0,0,
926,0,0,24,129,0,9,1220,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
949,0,0,24,0,0,15,1224,0,0,0,0,0,1,0,
964,0,0,24,0,0,13,1230,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,
995,0,0,24,0,0,15,1235,0,0,0,0,0,1,0,
1010,0,0,24,0,0,15,1241,0,0,0,0,0,1,0,
1025,0,0,24,0,0,15,1266,0,0,0,0,0,1,0,
1040,0,0,24,0,0,15,1273,0,0,0,0,0,1,0,
1055,0,0,25,166,0,5,1284,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,
0,1,97,0,0,
1094,0,0,24,0,0,15,1300,0,0,0,0,0,1,0,
1109,0,0,26,93,0,4,1324,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1140,0,0,27,360,0,4,1342,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1171,0,0,28,73,0,4,1385,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1198,0,0,29,69,0,4,1402,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1225,0,0,30,175,0,4,1460,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1256,0,0,31,81,0,4,1566,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
1283,0,0,32,139,0,4,1589,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1314,0,0,33,1218,0,4,1606,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1345,0,0,34,87,0,9,1660,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1372,0,0,34,0,0,15,1665,0,0,0,0,0,1,0,
1387,0,0,34,0,0,13,1671,0,0,1,0,0,1,0,2,97,0,0,
1406,0,0,34,0,0,15,1676,0,0,0,0,0,1,0,
1421,0,0,34,0,0,15,1683,0,0,0,0,0,1,0,
1436,0,0,35,79,0,4,1687,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
1459,0,0,36,158,0,4,1729,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
1482,0,0,37,117,0,4,1774,0,0,3,2,0,1,0,1,97,0,0,1,4,0,0,2,97,0,0,
1509,0,0,38,215,0,9,1812,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1540,0,0,38,0,0,15,1819,0,0,0,0,0,1,0,
1555,0,0,38,0,0,13,1826,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1578,0,0,38,0,0,15,1830,0,0,0,0,0,1,0,
1593,0,0,38,0,0,15,1839,0,0,0,0,0,1,0,
1608,0,0,39,99,0,4,1847,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1635,0,0,40,99,0,4,1872,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1662,0,0,41,99,0,4,1897,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1689,0,0,42,99,0,4,1922,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1716,0,0,43,50,0,3,1948,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1757,0,0,44,0,0,29,1958,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


 /* ----------------------------------------------------------------------------
 PROGRAM-NAME   : PKE2010G(연차대상자 추출/계산)  
                : 작업시간이 20분정도 소요됨...(process_knte()에서 많은 시간소요됨)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 상여금
 Programmer     : 이랑교
 Version        : 10.01
 Date           : 1998.05.26

[USING LIB]
MIS2 : /hper/insa/HINSA/common/lib/src/hperlib/avgpay.pc

[관련테이블]
SELECT : PKCPBAS  PKMPMAS PKHPHIS  PKHYPHIS          PKMYEMAS 
         PKHMOHIS PKHDUTY PKHDUSUM PKCMCBAS PKCHOLI  PKHEXDD 
I/U/D  : PKMYEMAS
------------------------------------------------------------------------------
Update Contents
 버  전   수 정 일..    수정자   관련근거       수정내용
 01.00    1997.02.02.  김승회   설계명세서      최초개발본      
 10.01    1998.05.26.  이랑교   전1998.05.13   반연차항목추가
 10.20    2000.07.14.  유효성                  분기/반기결산시 계산로직 추가
 10.30    2002.08.28.  유효성   전2002-3755    전문계약직 추가       
 10.40    2002.11.19.  박수향                  연간근로일수-->pkhduty(근태)의 근로일수로 변경 (미입력제외함)
                NVL(CONYN,'N') ='Y' 결재여부는 연차수당계산시에는 체크안함(최상용 과장 요청).
 10.41    2004.02.24   강륜종                  Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.                
 11.00    2004.06.18   강륜종(dsa2000)         직급코드값 변동에 따른 수정.  
                                         코드 10이 사외이사에서 부장으로 변경.   사외이사는 0Z로 코드 변경.    
 12.00    2004.11.     강륜종(dsa2000)         Rexec대체 서비스를 위한 수정작업. 
 20.00    2005.01.05.  dsa2000                 연차근무비율 80% 이상이면 10일 => 15일로 인상.
                연차근무비율 80% 이상 체크 안하도록 수정(무조건 15일 지급하게..이석희 대리 요청)
                근무기준일80% 미만자도 지급.
 21.00    2005.01.13.  DSA2000                 정보통신수당(ITAMT) 추가. --2005년 01월부터 월차폐지후 신설.
----------------------------------------------------------------------------- */

#include <string.h> 
#include <math.h>
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
float  get_sundaycnt(char*, char*);
float  get_sun(char*, char*);/* parksh20021119*/

float  get_dupholiday(char*,char*);
void  get_dayname(char *,char *);
void  get_payclkind(char *,char *);
void   add_days(char*,int,char*);
void  set_to_empdate(char *);
float   get_exdd();

float  get_ocaramt();
float  get_pay3sum();
float  get_bon12sum();
float  get_avggross();
float  get_commonpay(char *empno);
float  get_term(char *,char *);
float  get_duty(char *,char *);     /* parksh20021119*/

void  process_gen();
void  delete_records();
void  gen_records();
float  get_yytotdd(char*,char*);
float  get_dutotdd(char*,char*);  /* parksh20021119*/
void  process_payclkind();
void  process_knte();
void  calc_yeamt();


/*********************************************
  Global Variable
**********************************************/
/* EXEC SQL BEGIN DECLARE SECTION; */ 


     char   workyy[5]      = "";     /*   기준년도           */
     char   empno[5]       = "";     /*   사번               */
     char   korname[13]    = "";     /*   성명               */
   /*infra   char  paycl[3]       = "";    */  /*   직급               */  
     char  paycl[4]        = "";     /*   BAND               */
     float  paygr;      /*   호봉               */
     char   paynum[3]      = "";     /*   급호차수           */
     char   orgnum[4]      = "";     /*   조직차수           */
     char   deptcode[7]    = "";     /*   부서코드           */
     char   payclkind[2]   = "";     /*   직제               */
     char   pstate[3]      = "";     /*   인사상태           */
     char   empdate[9]     = "";     /*   입사일             */
     char   payyn[2]       = "";     /*   급여지급여부       */
     char   yearyn[2]      = "";     /*   연차수당지급여부   */
                                     /*   연차계산기준       */
     char   yearkind[2]    = "";     /*   연차계산구분       */
     float  yytotdd;                 /*   연간근로일수       */
     char   yyfrdate[9]    = "";     /*   근무기준일 from    */
     char   yytodate[9]    = "";     /*   근무기준일 to      */
     float  yybasedd;                /*   근무기준일수  */
                                     /*   연차일수           */
     float  yydeddd;                 /*   해당년도 연차공제일수 */
     float  yyexdd;                  
     float  yyrealdd;                /*   실근무일수         */
     float  yyate;                   /*   근무비율           */
     float  yearcredd;               /*   연차발생일수       */
                                     /*   가산일수            */
     float  dutytotdd;               /*   총근속일수(2003이전)         */
     float  dutyexdd;                /*   근속제외일수       */
     float  dutydeddd;               /*   입사이후의 총연차공제일수(2002년까지의 연차공제일수 + 이후 연차공제일수) */
     float  dutyrealdd;              /*   실근속일수         */
     float  yearadddd;               /*   연차가산일수       */
     
     float  dutytotddtmp;            /*   2003이후 총근속일수 parksh 20021120  */
     float  dutyexddtmp;             /*   2003이후 근속제외일수 parksh 20021120 */
     float  dutydedddtmp;            /*   2003이후 연차공제일수 parksh 20021120 */
     float  dutyrealddtmp;           /*   2003이후 근속일수 parksh 20021120 */
     
                                     /*   연차정산           */
     float  yeartotdd;               /*   연차대상일수       */
     float  yearusedd;               /*   연차사용일수       */
     float  yeardpsdd;               /*   연차적치일수       */
                                     /*   월차정산           */
     float  mondpsdd;                /*   월차적치일수       */
                                     /*   연월차정산         */
     float  ymdpsdd;                 /*   연월차정산일수     */ 
                                     /*   수당계산           */
     float  pay3sum;                 /*   3개월급여합        */
     float  bon12sum;                /*   12개월상여합       */
     float  avggross;                /*   평균임금           */
     float  commonpay;               /*   통상임금           */
     float  basepay;                 /*   수당기준임금       */
     float  ymamt;                   /*   연월차수당         */
                                     /*   수당지급           */
     char   holdkind[2]    = "";     /*   유보방식           */
     float  holdrate;                /*   기준유보율         */
     float  holdamt;                 /*   기준유보액         */
     float  realamt;                 /*   실지급액           */
                                     /*   최종작업           */
     char   writetime[16]   = "";     /*   최종작업일시       */
     char   writeman[5]     = "";     /*   최종작업자         */
     char   jobstep[2]      = "";     /* 작업단계범위   */
     char   frempno[5]      = "";     /* 사번FROM   */
     char   toempno[5]      = "";     /* 사번TO   */
     char   halfyn[1+1]     = "";     /* 가정산[Y/N]   */
            
     char   bldcode[3]      = "";     /* 근무지코드   */
     float  trafdays;                 /* 교통비지급일수  */  
     float  avgodamt;                 /* 평균O/D 지원금  */
     char   baseyymm[6+1]   = "";
     char   ENDDATE[4+1]    = "";

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


char  to_empdate[8+1]   = "";   /* 연차수당대상자의 기준입사일 */
int  s_count;
int  f_count;
int  id;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno               = 0; 
char    DsaTime[16]         = ""; 

void main(int argc,char *argv[])
{
     char FL_file[255];
         
     if  (argc != 10) {  /*/hper8/HINSA/proc/bin/Kbin/pke2010g 2004 3 0000 zzzz 1 200410 D006 pke2010g 2004110500000 */
          printf("[Usage] : pke2010g 1.기준년도 2.작업구분[1.생성,2.계산,3.all ] 3.사번fr 4.사번to \n");
          printf("[Usage] :          5.연차계산구분[] 6.기준월(최종급여반영월) 7.작업자 8.프로그램ID 9.시작시간\n");   
          exit(1);
     }   /*== 2000.7.14 추가 => 분기/반기결산시 기준월(최종급여반영월)을 입력받음 ================*/  
     
     sprintf(workyy,"%s",  argv[1]);  
     sprintf(jobstep,"%s",  argv[2]);
     sprintf(frempno,"%s",  argv[3]);
     sprintf(toempno,"%s",  argv[4]);
     sprintf(yearkind,"%s",  argv[5]);
     sprintf(baseyymm,"%s",  argv[6]);
     sprintf(writeman,"%s",  argv[7]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pke2010g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"연차대상자 추출/계산 프로그램 시작...");                
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[7]);
     strcpy(log_progid,   argv[8]);
     strcpy(log_rundate,  argv[9]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     /* EXEC SQL
     SELECT substr(to_char(LAST_DAY(to_date(:baseyymm, 'YYYYMM')) ,'YYYYMMDD'), 5,4)
       into :ENDDATE
       from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select substr(to_char(LAST_DAY(to_date(:b0,'YYYYMM')),'\
YYYYMMDD'),5,4) into :b1  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)baseyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ENDDATE;
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

  
                 
     /*
     EXEC SQL 
     lock table pkmyemas in exclusive mode nowait;  */   
     /*========= 2000.7.14.
     if (strcmp(halfyn,"Y")== 0)
           {   sprintf(ENDDATE,"0630");                        
               sprintf(baseyymm,"%.4s06",  workyy);             
           }
           else
           {  sprintf(ENDDATE,"1231");           
              sprintf(baseyymm,"%.4s12",  workyy);
             }
           ==========================*/
           
     set_to_empdate(to_empdate);  /* 입사기준일을 구한다 */
     printf("입사기준일 : %.8s \n",to_empdate);   /* Test dsa2000 */ 
     
     if  (strcmp(jobstep,"1") == 0)
          process_gen();
     else if (strcmp(jobstep,"2") == 0)
          calc_yeamt();
     else
     {
          process_gen();   
          calc_yeamt();  
     }
      
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("ERROR [작업 실패]\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [연차생성/계산 작업성공] =====");
          Write_batlog(seqno++, log_buff);                  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK  [연차생성/계산 작업성공].\n");   
     }
}

void process_gen()
{
  
     delete_records();
       
     gen_records();
     
     process_payclkind();  
     
     process_knte();
  
} 

/*****************************************************************************
  기존의 자료를 삭제하는 함수.
 *****************************************************************************/
void delete_records()
{
     printf("기존 자료 삭제중...\n");
     /* EXEC SQL
     delete  from pkmyemas
      where  empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pkmyemas  where (empno>=:b0 and empno<=:b1\
)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
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
          print_errmsg(sqlca.sqlcode,"PKMYEMAS  자료삭제오류...");
          sprintf(log_buff, "[ERRCODE : %d] PKMYEMAS  자료삭제오류...\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
}

/*****************************************************************************
  set_to_empdate function (입사기준일을 구한다. 해당년도의 10% 되는 날= 입사기준일)
 *****************************************************************************/
void set_to_empdate(char *to_empdate)
{
     float  totdd, i, j;
     float  k = 0;  
     char  t1_date[8+1]  = "";
     char  t2_date[8+1]  = "";
     char  buf[50+1]  = "";
     
     sprintf(t1_date,"%s",workyy);
     sprintf(t2_date,"%s",workyy);
     sprintf(t1_date+4,"0101");
     sprintf(t2_date+4,ENDDATE);
     totdd = get_yytotdd(t1_date,t2_date);
     totdd = ceil(totdd * 0.1);
     
     i = j = 0;
     while (j < totdd)
     {
          get_dayname(t1_date,buf);
          i = is_holiday(t1_date);
          if  (k == FAIL)
               error_quit("작업실패...");
          if ((strcmp(buf,"SUNDAY") != 0) && (i == 0))
               j++;
          add_days(t1_date,1,t1_date);
       
     }
     add_days(t1_date,-1,t1_date);
     sprintf(to_empdate,"%.8s",t1_date);
}

/*****************************************************************************
  is_holiday() function.
 *****************************************************************************/
is_holiday(char *pdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          int   count;
          char  t_date[8+1] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     sprintf(t_date,"%s",pdate);
     
     /* EXEC  SQL
     select  count(*)
       into  :count
       from  pkcholi  
      where  holidate = :t_date 
     and  holikind <> '0' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkcholi where (holidate\
=:b1 and holikind<>'0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )51;
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
     sqlstm.sqhstv[1] = (unsigned char  *)t_date;
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


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"휴일테이블 읽기오류...");
          printf(" 대상날짜 : [%s] \n",t_date);
          return(FAIL);
     }
     return(count);
}

/*****************************************************************************
  연차수당 대상자를 생성하는 함수.
 *****************************************************************************/
void gen_records()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          float  count;
          char  t_empdate[8+1] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char   t1_date[8+1]  = "";
     char   t2_date[8+1]  = "";
     
     /*******************************
     급호차수가 급여마스터에 존재... 
     EXEC SQL
     SELECT  CPAYNUM
     INTO  :paynum
     FROM  PKCPBAS;
     if (sqlca.sqlcode != 0)
     {  print_errmsg(sqlca.sqlcode,"현급호차수 읽기오류...");
      error_quit("작업실패...");
     }
     *******************************/
     printf("연차수당 대상자 생성 중...\n");
     
     sprintf(t1_date,"%s",workyy);
     sprintf(t2_date,"%s",workyy);
     sprintf(t1_date+4,"0101");
     sprintf(t2_date+4,ENDDATE);
     yytotdd = get_yytotdd(t1_date,t2_date);
     if  (yytotdd == FAIL)
          error_quit("작업실패...");
     
     sprintf(t_empdate,"%s",to_empdate);

/*  =======================================================================
  연봉제에 의한 수정
  EXEC SQL 
  INSERT INTO PKMYEMAS   
  (WORKYY, EMPNO, KORNAME, PAYCL, PAYGR, EMPDATE, PAYNUM, 
   ORGNUM, DEPTCODE, PSTATE, PAYYN, YEARKIND, YYTOTDD, COMMONPAY)
   SELECT :WORKYY, EMPNO, KORNAME, PAYCL, PAYGR, EMPDATE, PAYNUM,
   ORGNUM, DEPTCODE, PSTATE, PAYYN, :YEARKIND, :YYTOTDD,
   (BASICAMT+INFOAMT+DUTYAMT)
  FROM  PKMPMAS
  WHERE  (EMPNO >= :FREMPNO AND EMPNO <= :TOEMPNO)   
  AND   (PAYCL BETWEEN '10' AND 'A9')      
  ======================================================================= */
  
     /* EXEC SQL 
     insert into pkmyemas(
            workyy,  empno,    korname, paycl, paygr,     empdate, paynum, 
            orgnum,  deptcode, pstate,  payyn, yearkind,  yytotdd)
     select :workyy, empno,    korname, paycl, paygr,     empdate, paynum,
            orgnum,  deptcode, pstate,  payyn, :yearkind, :yytotdd
     from   pkmpmas
     where  (empno >= :frempno and empno <= :toempno)
/o==========================================================================
 10.30    2002.08.28.  유효성  전2002-3755    전문계약직 추가 
===========================================================================o/  
/o  and   ((paycl between '11' and '93')  or paycl ='E1') /o2001.1. 계약직 포함o/
/o  and   ((paycl between '11' and '93')  or paycl ='E1' or paycl ='C1') /o2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  o/
/oinfra  and   ((paycl between '10' and '93')  or paycl ='E1' or paycl ='C1') o/
       and  ((paycl between 'C11' and 'D41')  or paycl ='H11' or paycl ='D91')  
       and  (pstate < '80') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pkmyemas (workyy,empno,korname,paycl,paygr,\
empdate,paynum,orgnum,deptcode,pstate,payyn,yearkind,yytotdd)select :b0 ,empn\
o ,korname ,paycl ,paygr ,empdate ,paynum ,orgnum ,deptcode ,pstate ,payyn ,:\
b1 ,:b2  from pkmpmas where (((empno>=:b3 and empno<=:b4) and ((paycl between\
 'C11' and 'D41' or paycl='H11') or paycl='D91')) and pstate<'80')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )74;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyy;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)yearkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&yytotdd;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
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

     
  /*and  empdate <= :t_empdate;  dsa2000 2005.01.06. 근무기준일80% 미만자도 지급하기 위해...*/
  
     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"연차대상자 생성오류...");
          sprintf(log_buff, "[ERRCODE : %d] 연차대상자 생성오류...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }

/* 2002.1.7. 유효성 주석처리 start --> 인사팀 요청 
  EXEC SQL DECLARE c5 CURSOR FOR
  select  empno
  from  pkmyemas
  where  workyy = :workyy
  order by empno;

  EXEC SQL OPEN c5;
  if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
  {
   print_errmsg(sqlca.sqlcode,"Cursor c5 Open Error...");
   EXEC SQL CLOSE c5;
   error_quit("작업실패...");
  }
  
  while(1)
  {
   EXEC SQL FETCH c5
   INTO  :empno;
   if (sqlca.sqlcode == 1403) 
   {
     EXEC SQL CLOSE c5;
     return;
   }
   else if (sqlca.sqlcode != 0)
   {
     print_errmsg(sqlca.sqlcode,"Cursor c5 Data Fetch Error...");
     EXEC SQL CLOSE c5;
     error_quit("작업실패...");
   } 
   
   EXEC SQL
   select  count(*)
   into  :count
   from  pkhphis
   where  substr(paydate,1,4) = :workyy and empno = :empno;
   if (sqlca.sqlcode != 0)
   {
     print_errmsg(sqlca.sqlcode,"월급여이력 Check Error...");
     EXEC SQL CLOSE c5;
     error_quit("작업실패...");
   }

   if (count == 0)
   {
     EXEC SQL
     delete  from pkmyemas
     where  workyy = :workyy and empno = :empno;
     if (sqlca.sqlcode != 0)
     {
      print_errmsg(sqlca.sqlcode,"연차대상자 중 월급여이력 미존재자 삭제실패...");
      EXEC SQL CLOSE c5;
      error_quit("작업실패...");
     }
   }
  }
 2002.1.7. 유효성 주석처리 end --> 인사팀 요청 */
}

/*****************************************************************************
  연간근로일수를 구하는 함수(휴일제외한)
 *****************************************************************************/
float get_yytotdd(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          float count;
          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     float  result = 0.0;  
     float  tmp    = 0.0 ;
     /*float  getsun  = 0.0 ; parksh  */
     
     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     result = get_term(t1_date,t2_date);  /*365*/
     
     /* EXEC  SQL
     select  count(*)
       into  :count                       /o40o/
       from  pkcholi  
      where  (holidate >= :t1_date and holidate <= :t2_date) 
        and   holikind <> '0' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkcholi where ((holidat\
e>=:b1 and holidate<=:b2) and holikind<>'0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )109;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류...");
          sprintf(log_buff, "[ERRCODE : %d] 당해년도 휴일총일수 읽기오류...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     if ((tmp=get_dupholiday(frdate,todate)) == FAIL)
          return(FAIL);  
      
     /*if ((getsun =get_sundaycnt(frdate,todate)) ==FAIL)
              return(FAIL);
     result = result - (count + getsun-tmp) ;   parksh 삭제 */
        
     result = result - (count + get_sundaycnt(frdate,todate)-tmp);    
     
     return(result);
}


/*****************************************************************************
  parksh 추가-> 시작일과 종료일까지 근태월의 근로일수
 *****************************************************************************/
float get_dutotdd(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          float count;
          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";   
     /* EXEC SQL END DECLARE SECTION; */ 

     
     float  result = 0.0;  
     float  tmp    = 0.0 ;
           /* float   getsun  =0.0;     parksh 삭제 */
           
     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     
     result = get_duty(t1_date,t2_date);    /* 근태월의 총일수*/
     
     
     /* parksh 20021119  시작일부터 종료일까지의 휴일중 pkhduty(근태월)의 휴일만 구하기*/
     /*EXEC  SQL       parksh 20021119 막음 
     select  count(*)
     into  :count
     from  pkcholi  
     where  (holidate >= :t1_date and holidate <= :t2_date)
     and   holikind <> '0' ;*/
     
     /* EXEC  SQL
     select  count(*)
       into  :count
       from  pkcholi  
      where  substr(holidate,1,6) in (select duyymm       /o parksh 20021119 추가 o/
                                        from pkhduty 
                                       where duyymm between substr(:t1_date,1,6) and substr(:t2_date,1,6)
                                       /oAND NVL(CONYN,'N') ='Y' 결재여부 o/
                                         and empno = :empno) 
        and  holikind <> '0' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkcholi where (substr(h\
olidate,1,6) in (select duyymm  from pkhduty where (duyymm between substr(:b1\
,1,6) and substr(:b2,1,6) and empno=:b3)) and holikind<>'0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )136;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류...");
          sprintf(log_buff, "[ERRCODE : %d] 당해년도 휴일총일수 읽기오류...",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     /*getsun = get_sun(t1_date,t2_date);
      
     printf("\n 근태월 휴일수count[ %5.0f]",count);
     printf("\n 근태월 총근로일수[ %5.0f]",result);
     result = result - (count + getsun);  
     printf("\n 근태월 일요일수[ %5.0f]",getsun);         parksh 삭제 */
        
     result = result - (count + get_sun(t1_date,t2_date));
     
     return(result);
}

/*****************************************************************************
  frdate~todate의 일요일수를 구하는 함수.
 *****************************************************************************/
float get_sundaycnt(char *frdate, char *todate)
{
     char  fr_date[8+1]   = ""; 
     char  to_date[8+1]   = "";
     char  buf[50]       = "";
     float  fsunday = 0.0 ;
     float  count = 0.0 ;
   
   
     sprintf(fr_date,"%s",frdate);
     sprintf(to_date,"%s",todate);
     
   /* parksh 20030321  
     while(1)
     {
      get_dayname(fr_date,buf);
      if (strcmp(buf,"SUNDAY") == 0)
        break;
      add_days(fr_date,1,fr_date);  
     }
   
     while(1)
     {
      get_dayname(to_date,buf);
      if (strcmp(buf,"SUNDAY") == 0)
        break;
      add_days(to_date,-1,to_date);
     }
           
     count = floor(get_term(fr_date,to_date) / 7) + 1;
   */
     /* EXEC SQL
     select  
            floor((to_date(:to_date,'yyyymmdd')-next_day(last_day(add_months(to_date(:fr_date,'yyyymmdd'),-1)),1))/7) + 1 
       into :count
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (floor(((to_date(:b0,'yyyymmdd')-next_day(last_d\
ay(add_months(to_date(:b1,'yyyymmdd'),(-1))),1))/7))+1) into :b2  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )167;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)to_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)fr_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&count;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
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
          print_errmsg(sqlca.sqlcode,"당해년도 일요일수 구하기 오류...");
          sprintf(log_buff, "[ERRCODE : %d] 당해년도 일요일수 구하기 오류...",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
   
     return(count);
}

/*****************************************************************************
  근태에 등록된 휴일 중 일요일의 수를 구하는 함수.
 *****************************************************************************/
float  get_dupholiday(char *frdate,char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          float count;
          char  t1_date[8+1]   = "";
          char  t2_date[8+1]   = "";
          char  holidate[8+1]  = "";
          char  buf[50+1]      = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     
     /* EXEC SQL DECLARE c4 CURSOR FOR
     select  holidate
       from  pkcholi
      where  (holidate >= :t1_date and holidate <= :t2_date) 
        and  holikind <> '0'
      order  by holidate; */ 

     
     /* EXEC SQL OPEN c4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )194;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t2_date;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
     {
          print_errmsg(sqlca.sqlcode,"Cursor c4 Open Error...");
          sprintf(log_buff, "[ERRCODE : %d] Cursor c4 Open Error...",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )217;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     count = 0;
     while(1)
     {
          /* EXEC SQL FETCH c4
          INTO  :holidate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )232;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)holidate;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )251;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

          
               return(count);
          }
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c4 Data Fetch Error...");
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )266;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          get_dayname(holidate,buf);
          if (strcmp(buf,"SUNDAY") == 0)
            count++;  
     }  
}

/****************************************************************************
       요일명을 구하는 함수.
 ***************************************************************************/
void   get_dayname(char *indate,char *result)
{
  /* EXEC SQL BEGIN DECLARE SECTION; */ 

       char idate[8+1]     = "";
       char ddname[20]   = "";
  /* EXEC SQL END   DECLARE SECTION; */ 

  int count;
  
  sprintf(idate,"%s",indate);
  /* EXEC SQL 
  select   to_char(to_date(:idate,'YYYYMMDD'),'DAY')
    into  :ddname
    from  dual; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 5;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select to_char(to_date(:b0,'YYYYMMDD'),'DAY') into :b1  fr\
om dual ";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )281;
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

/*****************************************************************************
  연차테이블에 직제를 반영하는 함수.
 *****************************************************************************/
void process_payclkind()
{
     /* EXEC SQL DECLARE c1 CURSOR FOR
     select  empno, korname, paycl
       from  pkmyemas
      where  empno >= :frempno and empno <= :toempno
      order  by empno; */ 

     
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0010;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )304;
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
          /* EXEC SQL CLOSE c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )327;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          print_errmsg(sqlca.sqlcode,"Cursor c1 Open Error...");
          sprintf(log_buff, "[ERRCODE : %d] Cursor c1 Open Error...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )342;
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
          /* EXEC SQL FETCH c1
          INTO  :empno, :korname, :paycl; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )357;
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
          sqlstm.sqhstv[1] = (unsigned char  *)korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)paycl;
          sqlstm.sqhstl[2] = (unsigned long )4;
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )384;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          } 
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c1 Data Fetch Error...");
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )399;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          get_payclkind(paycl,payclkind);  
          if  (strcmp(payclkind,"*") == 0)
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )414;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          else
          {
               /* EXEC SQL
               update  pkmyemas
                  set  payclkind = :payclkind
                where  empno = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmyemas  set payclkind=:b0 where empn\
o=:b1";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )429;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)payclkind;
               sqlstm.sqhstl[0] = (unsigned long )2;
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


               if  (sqlca.sqlcode != 0)
               {
                    print_errmsg(sqlca.sqlcode,"직제 Update Error...");
                    /* EXEC SQL CLOSE c1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 5;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )452;
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
}

/*****************************************************************************
  직제를 구하는 함수.
 *****************************************************************************/
void get_payclkind(char *kind,char *result)
{
   /*  =======================================================================
     연봉제에 의한 수정
   
     if ((strcmp(kind,"10") >= 0) && (strcmp(kind,"99") <= 0))
      sprintf(result,"1");
     else if ((strcmp(kind,"A1") >= 0) && (strcmp(kind,"A9") <= 0))
      sprintf(result,"2");
     else
     {
      printf(" %s (%s) 에 대한 직제코드값을 구할 수 없습니다.\n",
      korname,empno);
      sprintf(result,"*");  
     }
     =======================================================================   */
     if ((strcmp(kind,"10") >= 0) && (strcmp(kind,"93") <= 0)    
          || (strcmp(kind,"E1") == 0) || (strcmp(kind,"C1") == 0))
          sprintf(result,"1");
     else
     {
          printf(" %s (%s) 에 대한 직제코드값을 구할 수 없습니다.\n",korname,empno);
          /*sprintf(log_buff, " %s (%s) 에 대한 직제코드값을 구할 수 없습니다.\n",korname,empno);
                     Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
          sprintf(result,"*");  
     }
}

/*****************************************************************************
  근태관련사항를 처리하는 함수.
 *****************************************************************************/
void process_knte()
{   
     printf("근태관련사항 처리중...\n");
     /* EXEC SQL DECLARE c2 CURSOR FOR
     select  empno, korname, empdate, yytotdd 
       from  pkmyemas
      where  empno >= :frempno and empno <= :toempno
      order  by empno; */ 

     
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0012;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )467;
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
          print_errmsg(sqlca.sqlcode,"Cursor c2 Open Error...");
          /* EXEC SQL CLOSE c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )490;
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
           /* EXEC SQL FETCH c2
           INTO  :empno, :korname, :empdate, :yytotdd; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 5;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )505;
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
           sqlstm.sqhstv[1] = (unsigned char  *)korname;
           sqlstm.sqhstl[1] = (unsigned long )13;
           sqlstm.sqhsts[1] = (         int  )0;
           sqlstm.sqindv[1] = (         short *)0;
           sqlstm.sqinds[1] = (         int  )0;
           sqlstm.sqharm[1] = (unsigned long )0;
           sqlstm.sqadto[1] = (unsigned short )0;
           sqlstm.sqtdso[1] = (unsigned short )0;
           sqlstm.sqhstv[2] = (unsigned char  *)empdate;
           sqlstm.sqhstl[2] = (unsigned long )9;
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)&yytotdd;
           sqlstm.sqhstl[3] = (unsigned long )sizeof(float);
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
                /* EXEC SQL CLOSE c2; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 5;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )536;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                return;
           }
           else if (sqlca.sqlcode != 0)
           {
                print_errmsg(sqlca.sqlcode,"Cursor c2 Data Fetch Error...");
                /* EXEC SQL CLOSE c2; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 5;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )551;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                error_quit("작업실패...");
           }
           
           if  (set_knteitems() != SUCCESS)
           {
                /*sprintf(log_buff, " %s (%s) 에 대한 set_knteitems() Error...\n",korname,empno);
                          Write_batlog(seqno++, log_buff);   dsa2000 Rexec 대체*/
                /* EXEC SQL CLOSE c2; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 5;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )566;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                error_quit("작업실패...");
           }
           s_count++;
     }
   
}

/*****************************************************************************
  근태관련사항를 구하는 함수.
 *****************************************************************************/
set_knteitems()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_date[8+1]   = "";
          float  count;
          float  tempcnt;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char  basedate[8+1] = "";
     char  tmpdate[8+1] = "";
     
     sprintf(basedate,"%s",workyy);
     sprintf(basedate+4,"0101");
     
     if  (strcmp(empdate,basedate) <= 0)      /* 근무기준일FROM */
          sprintf(yyfrdate,"%s",basedate);
     else
          sprintf(yyfrdate,"%s",empdate);
     
     sprintf(basedate+4,ENDDATE);       /* 근무기준일TO    */
     sprintf(yytodate,"%s",basedate);                               
     
     yybasedd = get_dutotdd(yyfrdate,yytodate);  /* 근무기준일수  parksh 20021120수정  
                                                       get_yytotdd(년근무기준일수) -> get_dutotdd(년중 근태월의 근무기준일수)*/
     if  (yybasedd == FAIL)
          error_quit("작업실패...");
     
     /* EXEC  SQL          /o 연차공제일수  o/
     select  ymdedcnt  
       into  :yydeddd
       from  pkhdusum
      where  empno = :empno and duyy = :workyy; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select ymdedcnt into :b0  from pkhdusum where (empno=:b\
1 and duyy=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )581;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yydeddd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)workyy;
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

  
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"연차공제일수 읽기오류...");
          printf(" %s (%s) 에 대한 연간근태내역을 구할 수 없습니다.\n", korname,empno);
          sprintf(log_buff, "[ERRCODE : %d] 연차공제일수 읽기오류...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     else if (sqlca.sqlcode == 1403)
          yydeddd = 0;
     
           /* 
           yyexdd = get_exdd() 
           yyrealdd = yybasedd - yydeddd - yyexdd ;  실근무일수 parksh 20021120 막음  */
           
     yyrealdd = yybasedd - yydeddd ;                /* parksh 20021120 실근무일수 구하기 */   
     
     yyate   = ceil((yyrealdd / yytotdd * 100)*100)/100 ;  /* 근무비율  */ 
     
     /*dsa2000   2005.01.05.  연차기본발생일 10일=>15일로 증가, 80%이상 무조건 15일로 (월차폐지로 인하여) */
     /* 연차발생일수  */
     /*if (yyate == 100)      
      yearcredd = 10;
     else if ((yyate < 100) && (yyate >= 90)) 
      yearcredd = 8;
     else if (yyate < 90) 
      yearcredd = 0;
     else
     {  printf(" %s (%s)  에 대한 근무비율값에 이상이 있습니다.\n" ,korname,empno);
      return(FAIL);
     }*/
     
     yearcredd = 15;   /*모든사원 기본으로 15개 지급함.(80% 조항 삭제)  dsa2000  2005.01.06.*/
     /*if  (yyate >= 80)
      yearcredd = 15;
     else if (yyate < 80) 
      yearcredd = 0;
     else
     {
      printf(" %s (%s)  에 대한 근무비율값에 이상이 있습니다.\n" ,korname,empno);
      return(FAIL);
     }*/
     
         
     /****************** 2002까지는 기존로직, 2003년부터 총근속일수는 근태월의 근무일수합 *******************/
           /* parksh 20021120   :  yytodate -> 20021231 */
     sprintf(tmpdate,"%.8s","20021231");
     dutytotdd = get_term(empdate,tmpdate );  
      
           /* 근속제외일수   */
           /*
            * 근속제외 당해년도 12.31 이후까지 등록된 경우 당해년도 12.31까지만 계산함. */
           /*  EXEC SQL
            *  select  nvl(sum(exdays),0)
            *  into  :dutyexdd
            *  from  pkhexdd
            *  where  empno = :empno   
            *    and   upper(exfixyn) = 'Y'
            */
     /* EXEC SQL
     select  nvl(sum(to_date(least(:tmpdate,extodate),'YYYYMMDD')  /o parksh :workyy -> 2002 o/
                     - to_date(exfrdate,'YYYYMMDD') +1),0)
       into  :dutyexdd
       from  pkhexdd
      where  empno = :empno   
        and   upper(exfixyn) = 'Y' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(sum(((to_date(least(:b0,extodate),'YYYYMMDD'\
)-to_date(exfrdate,'YYYYMMDD'))+1)),0) into :b1  from pkhexdd where (empno=:b\
2 and upper(exfixyn)='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )608;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tmpdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&dutyexdd;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
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
     {
          print_errmsg(sqlca.sqlcode,"근속제외일수 읽기오류...");
          printf(" %s (%s) 에 대한 근속제외일수를 구할 수 없습니다.\n",korname,empno);
          sprintf(log_buff, "[ERRCODE : %d] 근속제외일수 읽기오류...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     /*2002.1.7. 유효성 추가 start */
     /* EXEC  SQL      
     select  count(*)
       into  :tempcnt
       from  pkhdusum
      where  empno = :empno and duyy <= '2002'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkhdusum where (empno=:\
b1 and duyy<='2002')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )635;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&tempcnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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

   /*parksh :workyy -> 2002 */  
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"tempcnt 읽기오류...");
          printf(" %s (%s) 에 대한 tempcnt내역을 구할 수 없습니다.\n", korname,empno);
          sprintf(log_buff, " %s (%s) 에 대한 tempcnt내역을 구할 수 없습니다.\n", korname,empno); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     if  (tempcnt != 0)
     {     
          /* EXEC  SQL        /o 2002년 까지 연차공제일수  o/
          select  sum(nvl(ymdedcnt,0))  
            into  :dutydeddd
            from  pkhdusum
           where  empno = :empno and duyy <= '2002'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select sum(nvl(ymdedcnt,0)) into :b0  from pkhdusu\
m where (empno=:b1 and duyy<='2002')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )658;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&dutydeddd;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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

  /*parksh :workyy -> 2002 */
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"연차공제일수 읽기오류...");
               printf(" %s (%s) 에 대한 연간근태내역을 구할 수 없습니다.\n",korname,empno);
               sprintf(log_buff, " %s (%s) 에 대한 연간근태내역을 구할 수 없습니다.\n", korname,empno); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          else if (sqlca.sqlcode == 1403)
               dutydeddd = 0;
     }
     else dutydeddd = 0 ; 
/****  2002.1.7. 유효성 추가 end  */

        dutyrealdd = dutytotdd - dutyexdd - dutydeddd ;       /* 2002년까지의 실근속일수  */
/*===========================================================================================================*/  
  
  
/******** parksh  2003년부터  ENDDATE 까지의 실근속일수 구하기 (20030101부터 근태체크 방법이 다르므로)  *********/
     sprintf(tmpdate,"%.8s","20030101");
     dutytotddtmp = get_duty(tmpdate,yytodate);  /*20030101 부터 enddate 까지의 총근무일수 */
          
           /* parksh  2003 ~ workyy까지 근속제외일수 */
     /* EXEC  SQL      
     select  count(*)
       into  :tempcnt
       from  pkhdusum
      where  empno = :empno 
        and ( duyy > '2002' and duyy <= :workyy); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkhdusum where (empno=:\
b1 and (duyy>'2002' and duyy<=:b2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )681;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&tempcnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)workyy;
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

   /*parksh  2003 ~ workyy까지 */  
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"tempcnt 읽기오류...");
          printf(" %s (%s) 에 대한 tempcnt내역을 구할 수 없습니다.\n", korname,empno);
          sprintf(log_buff, " %s (%s) 에 대한 tempcnt내역을 구할 수 없습니다.\n", korname,empno); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     if  (tempcnt != 0)
     {     
          /* EXEC  SQL        /o parksh 2003 ~ workyy까지 연차공제일수  o/
          select  sum(nvl(ymdedcnt,0))  
            into  :dutydedddtmp
            from  pkhdusum
           where  empno = :empno and ( duyy >= '2003' and duyy <= :workyy); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select sum(nvl(ymdedcnt,0)) into :b0  from pkhdusu\
m where (empno=:b1 and (duyy>='2003' and duyy<=:b2))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )708;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&dutydedddtmp;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
          sqlstm.sqhstv[2] = (unsigned char  *)workyy;
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

  
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"연차공제일수 읽기오류...");
               printf(" %s (%s) 에 대한 연간근태내역을 구할 수 없습니다.\n", korname,empno);
               sprintf(log_buff, " %s (%s) 에 대한 연간근태내역을 구할 수 없습니다.\n", korname,empno); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          else if (sqlca.sqlcode == 1403)
               dutydedddtmp = 0; /*dutydeddd = 0;   Dsa2000: parksh가 dutydeddd로 수정한것을 dutydedddtmp로 바꿈*/
     }
     else dutydedddtmp = 0 ;           /*dutydeddd = 0;   Dsa2000: parksh가 dutydeddd로 수정한것을 dutydedddtmp로 바꿈*/
          
     dutyrealddtmp = dutytotddtmp - dutydedddtmp ; /* 2003 ~ enddate까지  실근속일수 */

/*************************************************************************************************************/

     dutytotdd   = dutytotdd  + dutytotddtmp ;    /* empdate ~ enddate 까지의 총근속일수 */
     dutyrealdd  = dutyrealdd + dutyrealddtmp;    /* empdate ~ enddate 까지의 실근속일수 */
     dutydeddd   = dutydeddd  + dutydedddtmp ;    /* empdate ~ enddate 까지의 연차공제일수 */
          /*
     if  (dutydeddd != 0 )
     {
          printf("empno :%s, 총근속일[%f],총실근속일[%f],총연차공제일[%f] \n",empno,dutytotdd,dutyrealdd,dutydeddd); 
     }   */
     
     /* 연차가산일수  */ 
     if  (yearcredd > 0)
          yearadddd  = floor(dutyrealdd/365) - 1;
     else
          yearadddd = 0;   
     if  (yearadddd <= 0) 
          yearadddd = 0;  
     
     yeartotdd = yearcredd + yearadddd;   /* 연차대상일수  */
     
     /* EXEC SQL        /o 연차사용일수  o/
     select  nvl(year,0)+nvl(yearhalf,0) * .5        /o select  year   o/
       into  :yearusedd
       from  pkhdusum
      where  empno = :empno   
        and  duyy = :workyy; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (nvl(year,0)+(nvl(yearhalf,0)* .5)) into :b0  fr\
om pkhdusum where (empno=:b1 and duyy=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )735;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yearusedd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)workyy;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"연차사용일수 읽기오류...");
          printf(" %s (%s) 에 대한 연차사용일수를 구할 수 없습니다.\n",korname,empno);
          sprintf(log_buff, " %s (%s) 에 대한 연차사용일수를 구할 수 없습니다.\n",korname,empno); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     else if (sqlca.sqlcode == 1403)
          yearusedd = 0;
     
     yeardpsdd = yeartotdd - yearusedd;   /* 연차적치일수  */ 
     
     /* 월차적치일수   */
     /* EXEC SQL
     select  mondpsdd
       into  :mondpsdd
       from  pkhmohis
      where  empno = :empno 
        and  workyymm = (  
                           select  max(workyymm)
                             from  pkhmohis
                            where  empno = :empno 
                              and  substr(workyymm,1,4) = :workyy); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select mondpsdd into :b0  from pkhmohis where (empno=:b\
1 and workyymm=(select max(workyymm)  from pkhmohis where (empno=:b1 and subs\
tr(workyymm,1,4)=:b3)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )762;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mondpsdd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[3] = (unsigned char  *)workyy;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"월차이력화일 읽기오류...");
          printf(" %s (%s) 에 대한 월차이력화일이 존재하지 않습니다.\n",korname,empno);
          sprintf(log_buff, " %s (%s) 에 대한 월차이력화일이 존재하지 않습니다.\n",korname,empno); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     else if (sqlca.sqlcode == 1403)
          mondpsdd = 0;
     
     ymdpsdd = yeardpsdd + mondpsdd;       /* 연월차정산일수 */
     
     
     /* parksh 20021120 연차적치일수 마이너스값 보정 막음
     if (mondpsdd < 0)
     {
       월차수당내역갱신 
      if (ymdpsdd < 0)
        ymdpsdd = 0; 
     
       *****************
      EXEC SQL
      UPDATE  PKHMOHIS
      SET  
        MONCRESUM   = 0,
        MONUSESUM   = 0,
        MONGIVESUM   = 0,
        MONDPSDD  = 0
      WHERE  EMPNO = :empno AND WORKYYMM = :t_date;
      if (sqlca.sqlcode != 0)
      {
        print_errmsg(sqlca.sqlcode,"월차이력화일 Update Error...");
        printf("실패한 사람 :  %s [%s] \n",korname,empno);
        return(FAIL);
      }
      ************************ 
     } */
     
     /* EXEC  SQL
     update  pkmyemas
        set  yyfrdate    = :yyfrdate,
             yytodate    = :yytodate,
             yybasedd    = :yybasedd,
             yydeddd     = :yydeddd + :yyexdd ,
             yyrealdd    = :yyrealdd,
             yyate       = :yyate,
             yearcredd   = :yearcredd,
             dutytotdd   = :dutytotdd,
             dutyexdd    = :dutyexdd + :dutydeddd ,
             dutyrealdd  = :dutyrealdd,
             yeartotdd   = :yeartotdd,
             yearadddd   = :yearadddd,
             yearusedd   = :yearusedd,
             yeardpsdd   = :yeardpsdd,
             mondpsdd    = :mondpsdd,
             ymdpsdd     = :ymdpsdd,
             writeman    = :writeman,
             writetime   = to_char(sysdate,'YYYYMMDDHH24MISSD')
      where  empno = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmyemas  set yyfrdate=:b0,yytodate=:b1,yybasedd\
=:b2,yydeddd=(:b3+:b4),yyrealdd=:b5,yyate=:b6,yearcredd=:b7,dutytotdd=:b8,dut\
yexdd=(:b9+:b10),dutyrealdd=:b11,yeartotdd=:b12,yearadddd=:b13,yearusedd=:b14\
,yeardpsdd=:b15,mondpsdd=:b16,ymdpsdd=:b17,writeman=:b18,writetime=to_char(sy\
sdate,'YYYYMMDDHH24MISSD') where empno=:b19";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )793;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)yyfrdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)yytodate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&yybasedd;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&yydeddd;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&yyexdd;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&yyrealdd;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&yyate;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&yearcredd;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&dutytotdd;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&dutyexdd;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&dutydeddd;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&dutyrealdd;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&yeartotdd;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&yearadddd;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&yearusedd;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&yeardpsdd;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&mondpsdd;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&ymdpsdd;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)writeman;
     sqlstm.sqhstl[18] = (unsigned long )5;
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
          print_errmsg(sqlca.sqlcode,"연차내역화일 Update Error1...");
          printf("실패한 사람 :  %s [%s] \n",korname,empno);
          sprintf(log_buff, "연차내역화일 Update Error1..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }  
     return(SUCCESS);
}

/*****************************************************************************
  연차수당을 계산하는 함수.  
 *****************************************************************************/
void calc_yeamt()
{   
     /* EXEC SQL
     select  trafdays
       into  :trafdays
       from  pkcmcbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select trafdays into :b0  from pkcmcbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )888;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&trafdays;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
          print_errmsg(sqlca.sqlcode,"식교비지급기준 읽기오류...");
          sprintf(log_buff, "식교비지급기준 읽기오류..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* EXEC SQL 
     select  avgodamt
       into  :avgodamt
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select avgodamt into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )907;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
          print_errmsg(sqlca.sqlcode,"급여지급기준 읽기오류(평균임금포함 OD지원금)...");
          sprintf(log_buff, "급여지급기준 읽기오류(평균임금포함 OD지원금)..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     s_count = 0;
     
     /* EXEC SQL DECLARE c3 CURSOR FOR
     select  empno, nvl(empdate,'00000000'), ymdpsdd, paycl
     from  pkmyemas 
     where  empno >= :frempno and empno <= :toempno
     order by empno; */ 

     
     /* EXEC SQL OPEN c3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0024;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )926;
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
          print_errmsg(sqlca.sqlcode,"Cursor c3 Open Error...");
          /* EXEC SQL CLOSE c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )949;
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
          /* EXEC SQL FETCH c3
          INTO  :empno, :empdate, :ymdpsdd, :paycl; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )964;
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
          sqlstm.sqhstv[1] = (unsigned char  *)empdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&ymdpsdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
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
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )995;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c3 Data Fetch Error...");
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1010;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }

/*  =======================================================================
  연봉제에 의한 수정

   pay3sum = get_pay3sum();
   if (pay3sum == FAIL) 
   {  
   EXEC SQL CLOSE c3;
   error_quit("작업실패...");
   }

   bon12sum  = get_bon12sum();
   if (bon12sum == FAIL) 
   {  
     EXEC SQL CLOSE c3;
     error_quit("작업실패...");
   }
  =======================================================================   */
   
          get_avgpay(empno,baseyymm,empdate,&avggross);  
          if  (avggross == FAIL) 
          {  
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1025;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          commonpay = get_commonpay(empno);
          if  (commonpay == FAIL) 
          {  
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1040;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (avggross > commonpay)
               basepay = avggross;
          else
               basepay = commonpay; 
          
          ymamt = ceil( basepay * 8 / 184 * ymdpsdd ); 
          
          /* EXEC SQL 
          update  pkmyemas
             set  pay3sum    = 0, 
                  bon12sum   = 0,
                  avggross   = :avggross, 
                  commonpay  = :commonpay,
                  basepay    = :basepay, 
                  ymamt      = :ymamt,
                  writeman   = :writeman, 
                  writetime  = to_char(sysdate,'YYYYMMDDHH24MISSD') 
           where  empno = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmyemas  set pay3sum=0,bon12sum=0,avggross\
=:b0,commonpay=:b1,basepay=:b2,ymamt=:b3,writeman=:b4,writetime=to_char(sysda\
te,'YYYYMMDDHH24MISSD') where empno=:b5";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1055;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&avggross;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&commonpay;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&basepay;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&ymamt;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)writeman;
          sqlstm.sqhstl[4] = (unsigned long )5;
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


          if  (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode, "연차수당내역 Update Error2...");
               sprintf(log_buff,  "연차수당내역 Update Error2..."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1094;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          s_count++;
     }
}

/*****************************************************************************
  3개월 급여합을 구하는 함수. : 사용안함. avgpay.pc 사용
 *****************************************************************************/
float get_pay3sum()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[7] = "";
          char  t2_date[7] = "";
          float  sum;
          float  count;
     /* EXEC SQL END DECLARE SECTION; */ 

     float  tmp;
     
     add_months(baseyymm,-2,t1_date);
     add_months(baseyymm,0,t2_date);
     
     count = 0;
     /* EXEC SQL
     SELECT  COUNT(*)
       INTO  :count
       FROM  PKHPHIS
      WHERE  EMPNO = :empno   
        AND  (PAYDATE >= :t1_date AND PAYDATE <= :t2_date ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKHPHIS where (EMPNO=:b\
1 and (PAYDATE>=:b2 and PAYDATE<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1109;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"3개월급여합 읽기오류1...");
          printf("실패한 사람 :  %s [%s] \n",korname,empno);
          sprintf(log_buff,"3개월급여합 읽기오류1..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }  
     
     if  (count == 0)
          return(0);  
     
     /* EXEC SQL 
     SELECT  SUM(NVL(BASICAMT,0)+NVL(INFOAMT,0)+NVL(DUTYAMT,0)+
             NVL(BBASICAMT,0)+NVL(BINFOAMT,0)+NVL(BDUTYAMT,0)+
             NVL(MATEAMT,0)+NVL(PARTAMT,0)+NVL(CHILDAMT,0)+
             NVL(OVTMAMT,0)+NVL(SPTMAMT,0)+NVL(MCARAMT,0)+
             NVL(LICEAMT,0)+NVL(MBONAMT,0)+NVL(SOPAY,0)+NVL(ITAMT,0) )
       INTO  :sum
       FROM  PKHPHIS
      WHERE  EMPNO = :empno   
        AND  (PAYDATE >= :t1_date AND PAYDATE <= :t2_date); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum((((((((((((((((NVL(BASICAMT,0)+NVL(INFOAMT,0\
))+NVL(DUTYAMT,0))+NVL(BBASICAMT,0))+NVL(BINFOAMT,0))+NVL(BDUTYAMT,0))+NVL(MA\
TEAMT,0))+NVL(PARTAMT,0))+NVL(CHILDAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NV\
L(MCARAMT,0))+NVL(LICEAMT,0))+NVL(MBONAMT,0))+NVL(SOPAY,0))+NVL(ITAMT,0))) in\
to :b0  from PKHPHIS where (EMPNO=:b1 and (PAYDATE>=:b2 and PAYDATE<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1140;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&sum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"3개월급여합 읽기오류2...");
          printf("실패한 사람 :  %s [%s] \n",korname,empno);
          sprintf(log_buff,"3개월급여합 읽기오류2..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     tmp = get_ocaramt();
     if  (tmp == FAIL)
          return(FAIL);
     
     
     return(sum + tmp);
}

/*****************************************************************************
  3개월급여합에서의 자가운전지원금을 처리하는 함수.  
 *****************************************************************************/
float get_ocaramt()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char   t_date[7] = "";
          float  trafamt;
          float  tmp[3];
          float  count;
     /* EXEC SQL END DECLARE SECTION; */ 

     int i;
     
     for (i = 0;i < 3; i++)
     {
          add_months(baseyymm,-i,t_date);
          /* EXEC SQL
          SELECT  COUNT(*)  
            INTO  :count  
            FROM  PKHPHIS
           WHERE  EMPNO = :empno AND PAYDATE = :t_date; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select count(*)  into :b0  from PKHPHIS where (EMP\
NO=:b1 and PAYDATE=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1171;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&count;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
          sqlstm.sqhstv[2] = (unsigned char  *)t_date;
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
               print_errmsg(sqlca.sqlcode, "3개월급여합에서의 자가운전지원금 읽기오류1...");
               printf("실패한 사람 :  %s [%s] \n",korname,empno);
               sprintf(log_buff,"3개월급여합에서의 자가운전지원금 읽기오류1..."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          
          
          if  (count > 0)
          {
               /* EXEC SQL
               SELECT   ODAMT
               INTO  :tmp[i]
               FROM  PKHPHIS
               WHERE  EMPNO = :empno AND PAYDATE = :t_date; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select ODAMT into :b0  from PKHPHIS where (EM\
PNO=:b1 and PAYDATE=:b2)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1198;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&tmp[i];
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
               sqlstm.sqhstv[2] = (unsigned char  *)t_date;
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
                    print_errmsg(sqlca.sqlcode,"3개월급여합에서의 자가운전지원금 읽기오류2...");
                    printf("실패한 사람 :  %s [%s] \n", korname,empno);
                    sprintf(log_buff,"3개월급여합에서의 자가운전지원금 읽기오류2..."); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }

/* ****************************
                 EXEC SQL 
     SELECT  NVL(TRAFAMT,0)
     INTO  :trafamt
     FROM  PKCPBLD
     WHERE  BLDCODE = :bldcode;

     if (sqlca.sqlcode != 0)
     {
      printf(" Module Name : get_ocaramt() \n"); 
      printf(" TABLE ID : PKCPBLD \n"); 
      printf(" SQL STATEMENT : SELECT \n");
      return(FAIL);
     }
 **************************** */

               if  (tmp[i] > 0)
                    tmp[i] = avgodamt;
               else
                    tmp[i] = 0;
        }
        else
             tmp[i] = 0;
     }

     return(tmp[0]+tmp[1]+tmp[2]);
}

/*****************************************************************************
  12개월간 상여합을 구하는 함수.  
 *****************************************************************************/
float get_bon12sum()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char   t1_date[7] = "";
          char   t2_date[7] = "";
          char   tmp[7]     = "";
          float  sum;
          float  count;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     add_months(baseyymm,-11,t1_date);
     add_months(baseyymm,0,t2_date);
     
     /* EXEC SQL
     SELECT  SUM(NVL(BONUSAMT,0)  + NVL(INCENTAMT,0)  + NVL(TRAINAMT,0)  +
           /oNVL(WINTERAMT,0) + NVL(HOMESUPAMT,0) + NVL(YBONAMT12,0) + NVL(SOBON,0)) dsa2000  2006.04.19. WINTERAMT 삭제 영업인세티브 평균임금 미포함.o/ 
             NVL(YBONAMT12,0) + NVL(SOBON,0)) /o 2006.09. NVL(HOMESUPAMT,0) 삭제  선택적복리후생비로 변경 사용. o/
       INTO  :sum
       FROM  PKHPHIS
      WHERE  EMPNO = :empno   
        AND  (PAYDATE >= :t1_date AND PAYDATE <= :t2_date); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(((((NVL(BONUSAMT,0)+NVL(INCENTAMT,0))+NVL(TR\
AINAMT,0))+NVL(YBONAMT12,0))+NVL(SOBON,0))) into :b0  from PKHPHIS where (EMP\
NO=:b1 and (PAYDATE>=:b2 and PAYDATE<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1225;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&sum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"12개월상여합 읽기오류1...");
          printf("실패한 사람 :  %s [%s] \n",korname,empno);
          sprintf(log_buff,"12개월상여합 읽기오류1..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     /* 전년도 연차수당을 계산 */
     /* **************************
     add_months(baseyymm,-12,tmp);
     EXEC  SQL
     SELECT  NVL(YBONAMT12,0)
     INTO  :count
     FROM  PKHPHIS
     WHERE  EMPNO = :empno AND PAYDATE = :tmp;
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"12개월상여합 읽기오류2...");
      printf("실패한 사람 :  %s [%s] \n",korname,empno);
      return(FAIL);
     }
     else if (sqlca.sqlcode == 1403)
      count = 0;
     ************************** */
     
     return(sum);
}
/*****************************************************************************
  평균임금을 구하는 함수.
 *****************************************************************************/
float  get_avggross()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char   t1_date[9] = "";
          char   t2_date[9] = "";
          char   basedate[9] = "";
          float  result;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     int  index;
     
     add_months(baseyymm,-12,t1_date); 
     add_months(baseyymm,-3,t2_date);  
      
     sprintf(t1_date+6,"15");
     sprintf(t2_date+6,"15");
     sprintf(basedate,"%.4s%s",workyy,ENDDATE);
     
     if  (strcmp(empdate,t1_date) <= 0)
          index = 1;
     else if ((strcmp(empdate,t1_date) >  0) && 
              (strcmp(empdate,t2_date) <= 0))
          index = 2;
     else
          index = 3;
     
     
     switch (index)
     {    
          case 1 :
          {
               result = ceil(pay3sum/3) + ceil(bon12sum/12);
               break;  
          }
          case 2 :/* 6개월*/
          { 
               result = ceil(pay3sum/3) + 
               ceil(bon12sum/
               get_term(empdate,basedate)*30);
               break;
          }  
          case 3 :  /* 3개월*/
          {
               result = ceil((pay3sum + bon12sum) / 
               get_term(empdate,basedate)*30);
               break;
          }  
     }
     
     return(result);
}

/*****************************************************************************
  시작일과 종료일까지의 기간을 일단위로 구하는 함수.  
 *****************************************************************************/
float get_term(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
          float result;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     
     /* EXEC SQL
     SELECT  TO_DATE(:t2_date,'YYYYMMDD') - TO_DATE(:t1_date,'YYYYMMDD') + 1
       INTO  :result
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select ((TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD'\
))+1) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1256;
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
     sqlstm.sqhstv[2] = (unsigned char  *)&result;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
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


     
     return(result);
}

/*****************************************************************************           
  시작일과 종료일까지의  근태월(pkhduty)의 일수를 구하는 함수.                        
 *****************************************************************************/
float  get_duty(char *frdate, char *todate)        
{                                       
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char   t1_date[8+1] = "";
          char   t2_date[8+1] = "";
          float  result;
          float  notin;     /* 미입력한 일수*/
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t1_date,"%.6s",frdate);
     sprintf(t2_date,"%.6s",todate);
     
     /* EXEC SQL    /o근태월의 lastday 합o/
     SELECT NVL(SUM(to_char(LAST_DAY(to_date(duyymm,'YYYYMM')),'DD')),0)
       INTO :result
       FROM pkhduty
      WHERE duyymm between :t1_date and :t2_date
       /o AND NVL(CONYN, 'N') ='Y' 결재여부o/
        AND empno = :empno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(sum(to_char(LAST_DAY(to_date(duyymm,'YYYYMM'\
)),'DD')),0) into :b0  from pkhduty where (duyymm between :b1 and :b2 and emp\
no=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1283;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&result;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
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
          print_errmsg(sqlca.sqlcode,"근속월의 일수 읽기오류...");
          printf(" %s (%s) 에 대한 근속월의 일수를 구할 수 없습니다.\n",korname,empno);
          sprintf(log_buff,"근속월의 일수 읽기오류..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }
     
     /* EXEC SQL    /o 근태월중 미입력 일수 o/ 
     SELECT  NVL(SUM(decode(dd1,99,1,0) + decode(dd2,99,1,0) + decode(dd3,99,1,0) + decode(dd4,99,1,0) + decode(dd5,99,1,0) 
             + decode(dd6,99,1,0) + decode(dd7,99,1,0) + decode(dd8,99,1,0) + decode(dd9,99,1,0) + decode(dd10,99,1,0) 
             + decode(dd11,99,1,0)+ decode(dd12,99,1,0)+ decode(dd13,99,1,0)+ decode(dd14,99,1,0)+ decode(dd15,99,1,0) 
             + decode(dd16,99,1,0)+ decode(dd17,99,1,0)+ decode(dd18,99,1,0)+ decode(dd19,99,1,0)+ decode(dd20,99,1,0) 
             + decode(dd21,99,1,0)+ decode(dd22,99,1,0)+ decode(dd23,99,1,0)+ decode(dd24,99,1,0)+ decode(dd25,99,1,0) 
             + decode(dd26,99,1,0)+ decode(dd27,99,1,0)+ decode(dd28,99,1,0)+ decode(dd29,99,1,0)+ decode(dd30,99,1,0) 
             + decode(dd31,99,1,0)  ),0)
            INTO  :notin
      FROM  pkhduty 
     WHERE  duyymm between :t1_date and :t2_date
       /o  AND NVL(CONYN, 'N') ='Y' 결재여부o/
       AND  empno = :empno
       AND ( dd1  ='99' or dd2  ='99' or dd3  ='99' or dd4  ='99' or dd5  ='99' or 
             dd6  ='99' or dd7  ='99' or dd8  ='99' or dd9  ='99' or dd10 ='99' or 
             dd11 ='99' or dd12 ='99' or dd13 ='99' or dd14 ='99' or dd15 ='99' or 
             dd16 ='99' or dd17 ='99' or dd18 ='99' or dd19 ='99' or dd20 ='99' or
             dd21 ='99' or dd22 ='99' or dd23 ='99' or dd24 ='99' or dd25 ='99' or 
             dd26 ='99' or dd27 ='99' or dd28 ='99' or dd29 ='99' or dd30 ='99' or dd31 ='99') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select NVL(sum(((((((((((((((((((((((((((((((decode(dd1,99,1,0)+deco\
de(dd2,99,1,0))+decode(dd3,99,1,0))+decode(dd4,99,1,0))+decode(dd5,99,1,0))+\
decode(dd6,99,1,0))+decode(dd7,99,1,0))+decode(dd8,99,1,0))+decode(dd9,99,1,\
0))+decode(dd10,99,1,0))+decode(dd11,99,1,0))+decode(dd12,99,1,0))+decode(dd\
13,99,1,0))+decode(dd14,99,1,0))+decode(dd15,99,1,0))+decode(dd16,99,1,0))+d\
ecode(dd17,99,1,0))+decode(dd18,99,1,0))+decode(dd19,99,1,0))+decode(dd20,99\
,1,0))+decode(dd21,99,1,0))+decode(dd22,99,1,0))+decode(dd23,99,1,0))+decode\
(dd24,99,1,0))+decode(dd25,99,1,0))+decode(dd26,99,1,0))+decode(dd27,99,1,0)\
)+decode(dd28,99,1,0))+decode(dd29,99,1,0))+decode(dd30,99,1,0))+decode(dd31\
,99,1,0))),0) into :b0  from pkhduty where ((duyymm between :b1 and :b2 and \
empno=:b3) and ((((((((((((((((((((((((((((((dd1='99' or dd2='99') or dd3='9\
9') or dd4='99') or dd5='99') or dd6='99') or dd7='99') or dd8='99') or dd9=\
'99') or dd10='99') or dd11='99') or dd12='99') or dd13='99') or dd14='99') \
or dd15='99') or dd16='99') or dd17='99') or");
     sqlstm.stmt = " dd18='99') or dd19='99') or dd20='99') or dd21='99') o\
r dd22='99') or dd23='99') or dd24='99') or dd25='99') or dd26='99') or dd27=\
'99') or dd28='99') or dd29='99') or dd30='99') or dd31='99'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1314;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&notin;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
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

       
         
     result   = result-notin ;
       
     return(result);    
}       
 
/*****************************************************************************           
  시작일과 종료일까지의  근태월(pkhduty)의 일요일수를 구하는 함수(근태에 등록된 휴일 중 일요일의 수 제외).                        
 *****************************************************************************/          

float  get_sun(char *frdate, char *todate)        
{                                            
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
          char    duty_mm[6+1]= "";
          char    duty_dd[2];
          char    duty_fr[8+1]= "";
          char    duty_to[8+1]= "";  
          float  temp_sunday=0.0;
          float  temp_dupsun=0.0;
          float  result = 0.0 ;
          float    count = 0.0 ;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t1_date,"%.6s",frdate);
     sprintf(t2_date,"%.6s",todate);
     
     /* EXEC SQL DECLARE c8 CURSOR FOR
     SELECT duyymm 
       FROM pkhduty
      WHERE empno = :empno
        AND duyymm BETWEEN :t1_date AND :t2_date; */ 

       /* AND NVL(CONYN,'N') ='Y'결재여부*/
        
     /* EXEC SQL OPEN c8; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0034;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1345;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)empno;
     sqlstm.sqhstl[0] = (unsigned long )5;
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
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
     {
          print_errmsg(sqlca.sqlcode,"Cursor c8 Open Error...");
          /* EXEC SQL CLOSE c8; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1372;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     count=0;  
     while(1)
     {
          /* EXEC SQL FETCH c8
          INTO  :duty_mm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1387;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)duty_mm;
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c8; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1406;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               
               return(result);
          }
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c4 Data Fetch Error...");
               /* EXEC SQL CLOSE c8; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1421;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          /* EXEC SQL
          SELECT  to_char(LAST_DAY(to_date(:duty_mm,'YYYYMM')),'YYYYMMDD')  /o근태월의 마지막날짜구하기o/
            INTO  :duty_to
            FROM  dual; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_char(LAST_DAY(to_date(:b0,'YYYYMM')),'YY\
YYMMDD') into :b1  from dual ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1436;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)duty_mm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)duty_to;
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


           
          sprintf(duty_fr,"%.6s01", duty_mm); /* 근태월의 01일*/
          sprintf(duty_to,"%.8s", duty_to);   /* 근태월의 마지막일 */
          
          /*printf("empno :%s, temp_sunday:%5.0f, get_sundaycnt:%5.0f\n", empno, temp_sunday, get_sundaycnt(duty_fr,duty_to));
          */
          
          temp_sunday = temp_sunday + get_sundaycnt(duty_fr,duty_to);
          temp_dupsun = temp_dupsun + get_dupholiday(duty_fr,duty_to);
          
          result = temp_sunday - temp_dupsun;
     }  
       
       /*result = temp_sunday - temp_dupsun;
       */
     return(result);    
}
        
/*****************************************************************************
  통상임금을 구하는 함수.
 *****************************************************************************/
float get_commonpay(char *empno)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          float  result;
     /* EXEC SQL END DECLARE SECTION; */ 

  
/*  =======================================================================
  연봉제에 의한 수정
 
  EXEC SQL
  SELECT  NVL(BASICAMT,0)+NVL(INFOAMT,0)+NVL(DUTYAMT,0)+NVL(PROMAMT,0)
  INTO  :result
  FROM  PKMPMAS
  WHERE  EMPNO = :empno;
  =======================================================================   */
     result = 0;
     
     /* EXEC SQL
     /o select   ceil(realtotpay/23) o/
     /o 2014.11.19 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)         
     select  ceil(totpay/18)  o/
     select  CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)
       into  :result
       from  pkhyphis
      where  empno = :empno 
        and  yearpaynum = (select to_char(yearpaynum) from pkcpbas); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CEIL(((((TOTPAY+TONGAMT1)+TONGAMT2)+TONGAMT3)/12\
)) into :b0  from pkhyphis where (empno=:b1 and yearpaynum=(select to_char(ye\
arpaynum)  from pkcpbas ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1459;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&result;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)empno;
     sqlstm.sqhstl[1] = (unsigned long )0;
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
          printf("get_commonpay() -> 통상임금 Read Error \n"); 
          printf("[ERROR_CODE] : (%d) \n",sqlca.sqlcode);
          return(FAIL);
     }
   
     if  (sqlca.sqlcode == 1403)
     {
          printf(" empno : [%s]의 해당년도 연봉자료가 존해하지 않음...\n",empno);
          result = 0;
     }

/*  =======================================================================
  연봉제에 의한 수정

  if (strncmp(paycl,"A",1) == 0)
   result = result - 125000; 
  =======================================================================   */

     return(result); 
}

/*****************************************************************************
  기준일+M 일을 구하는 함수.
 *****************************************************************************/
void add_days(char* indate,int m, char* rdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_date[8+1]  = "";
          float  t_adddays;
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
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1482;
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
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
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

/* ****************************************************************************
  get_exdd   function. 근속제외일수 구하기
 **************************************************************************** */
float get_exdd()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char   t_exfrdate[8+1]   = "";
          char   t_extodate[8+1]   = "";
          float  count;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char  t1[8+1];
     char  t2[8+1];
     float  exdays;
     float  tmp  = 0.0 ;
     
     sprintf(t1,"%.4s0101",workyy);
     sprintf(t2,"%.4s%s",workyy,ENDDATE);
     
     /* EXEC SQL DECLARE c6 CURSOR FOR
     SELECT  EXFRDATE, EXTODATE
       FROM  PKHEXDD
      WHERE  EMPNO = :empno      
        AND  UPPER(EXFIXYN) = 'Y'   
        AND  (SUBSTR(EXFRDATE,1,4) = :workyy  OR
              SUBSTR(EXTODATE,1,4) = :workyy  OR    
              :workyy between substr(exfrdate,1,4) 
        and  SUBSTR(EXTODATE,1,4)); */ 

     
     /* EXEC SQL OPEN c6; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0038;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1509;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)empno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)workyy;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workyy;
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
          print_errmsg(sqlca.sqlcode,"Cursor c6 Open Error...");
          printf(" %s (%s) 에 대한 근속제외일수 읽기오류...\n", korname,empno);
          sprintf(log_buff," %s (%s) 에 대한 근속제외일수 읽기오류...\n", korname,empno); /*dsa2000 Rexec 대체*/
                     Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE c6; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1540;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
     }
     
     exdays = 0;
     while(1)
     {
          /* EXEC SQL FETCH c6
          INTO  :t_exfrdate, :t_extodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1555;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)t_exfrdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)t_extodate;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1578;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(exdays);
          }
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c6 Data Fetch Error...");
               printf(" %s (%s) 에 대한 근속제외일수 읽기오류...\n", korname,empno);
               sprintf(log_buff," %s (%s) 에 대한 근속제외일수 읽기오류...\n", korname,empno); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1593;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          } 
          
          if ((strcmp(t_exfrdate,t1) >= 0) && (strcmp(t_extodate,t2) <= 0))
          {
               exdays += get_term(t_exfrdate,t_extodate);
            
               /* EXEC  SQL
               select  count(*)
                 into  :count
                 from  pkcholi  
                where  (holidate >= :t_exfrdate and holidate <= :t_extodate) 
                  and  holikind <> '0' ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select count(*)  into :b0  from pkcholi where\
 ((holidate>=:b1 and holidate<=:b2) and holikind<>'0')";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1608;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&count;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)t_exfrdate;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)t_extodate;
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
                    print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류1...");
                    sprintf(log_buff," %s (%s) 에 대한 근속제외일수 읽기오류...\n", korname,empno); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
               
               if ((tmp=get_dupholiday(t_exfrdate,t_extodate)) == FAIL)
                    return(FAIL);  
               
               
               exdays = exdays - (count + get_sundaycnt(t_exfrdate,t_extodate)-tmp);      
          }   
          
          else if ((strcmp(t_exfrdate,t1) >= 0) && (strcmp(t_extodate,t2) > 0))
          {
               exdays += get_term(t_exfrdate,t2);
                      
               /* EXEC  SQL
               select  count(*)
                 into  :count
                 from  pkcholi  
                where  (holidate >= :t_exfrdate and holidate <= :t2) 
                  and   holikind <> '0' ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select count(*)  into :b0  from pkcholi where\
 ((holidate>=:b1 and holidate<=:b2) and holikind<>'0')";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1635;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&count;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)t_exfrdate;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)t2;
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
                    print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류1...");
                    sprintf(log_buff,"당해년도 휴일총일수 읽기오류1...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
               
               if ((tmp=get_dupholiday(t_exfrdate,t2)) == FAIL)
                    return(FAIL);     
               
               exdays = exdays - (count + get_sundaycnt(t_exfrdate,t2)-tmp);      
            
          }   
             
          else if ((strcmp(t_exfrdate,t1) < 0) && (strcmp(t_extodate,t2) <= 0))
          {
               exdays += get_term(t1,t_extodate);
               
               /* EXEC  SQL
               select  count(*)
                 into  :count
                 from  pkcholi  
                where  (holidate >= :t1 and holidate <= :t_extodate) 
                  and  holikind <> '0' ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select count(*)  into :b0  from pkcholi where\
 ((holidate>=:b1 and holidate<=:b2) and holikind<>'0')";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1662;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&count;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)t1;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)t_extodate;
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
                    print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류1...");
                    sprintf(log_buff,"당해년도 휴일총일수 읽기오류1...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
               
               if ((tmp=get_dupholiday(t1,t_extodate)) == FAIL)
                    return(FAIL);     
               
               exdays = exdays - (count + get_sundaycnt(t1,t_extodate)-tmp); 
          }
             
          else if ((strcmp(t_exfrdate,t1) < 0) && (strcmp(t_extodate,t2) > 0))
          {
               exdays += get_term(t1,t2);
                   
               /* EXEC  SQL
               select  count(*)
                 into  :count
                 from  pkcholi  
                where  (holidate >= :t1 and holidate <= :t2) 
                  and  holikind <> '0' ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select count(*)  into :b0  from pkcholi where\
 ((holidate>=:b1 and holidate<=:b2) and holikind<>'0')";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1689;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&count;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)t1;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)t2;
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
                    print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류2...");
                    sprintf(log_buff,"당해년도 휴일총일수 읽기오류2...",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
               
               if ((tmp=get_dupholiday(t1,t2)) == FAIL)
                    return(FAIL);     
               
               exdays = exdays - (count + get_sundaycnt(t1,t2)-tmp); 
               
          }  
     }
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
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1716;
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
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1757;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
