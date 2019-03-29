
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
    "pke1020g.pc"
};


static unsigned int sqlctx = 150675;


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
   unsigned char  *sqhstv[39];
   unsigned long  sqhstl[39];
            int   sqhsts[39];
            short *sqindv[39];
            int   sqinds[39];
   unsigned long  sqharm[39];
   unsigned long  *sqharc[39];
   unsigned short  sqadto[39];
   unsigned short  sqtdso[39];
} sqlstm = {12,39};

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
"select a.empno ,a.korname ,anfrdate ,b.kifrdate ,to_char((add_months(to_dat\
e(anfrdate,'YYYYMMDD'),3)-1),'YYYYMMDD') antodate ,c.kitodate  from pihanno a\
 ,pkmgbmas b ,pkcgbbas c where (((((((c.bonyymm=:b0 and c.bonkind=:b1) and b.\
bonyymm=:b0) and b.bonkind=:b1) and b.empno=a.empno) and ancode='111') and (a\
.payra='D51' and bpayra is null )) and (anfrdate>to_char(add_months(to_date(c\
.kifrdate,'YYYYMMDD'),((-1)* 3)),'YYYYMMDD') and anfrdate<=c.kitodate)) order\
 by anfrdate,a.empno            ";

 static char *sq0018 = 
"select a.empno ,a.korname ,exkind ,exfrdate ,b.kifrdate ,extodate ,b.kitoda\
te  from pkhexdd a ,pkmgbmas b where (((((bonyymm=:b0 and bonkind=:b1) and a.\
empno=b.empno) and (kifrdate is  not null  and kitodate is  not null )) and (\
((exfrdate>=kifrdate and exfrdate<kitodate) or (extodate>=kifrdate and extoda\
te<kitodate)) or (exfrdate<=kifrdate and extodate>=kitodate))) and upper(exfi\
xyn)='Y') order by a.empno,a.exfrdate            ";

 static char *sq0020 = 
"select a.empno ,a.korname ,exkind ,exfrdate ,b.sufrdate ,extodate ,b.sutoda\
te  from pkhexdd a ,pkmgbmas b where (((((bonyymm=:b0 and bonkind=:b1) and a.\
empno=b.empno) and (sufrdate is  not null  and sutodate is  not null )) and (\
((exfrdate>=sufrdate and exfrdate<sutodate) or (extodate>=sufrdate and extoda\
te<sutodate)) or (exfrdate<=sufrdate and extodate>=sutodate))) and upper(exfi\
xyn)='Y') order by a.empno,a.exfrdate            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,58,0,2,243,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
28,0,0,2,41,0,2,257,0,0,1,1,0,1,0,1,97,0,0,
47,0,0,3,680,0,4,270,0,0,39,2,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,97,0,
0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,
218,0,0,4,388,0,3,304,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
245,0,0,5,58,0,2,328,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
268,0,0,6,91,0,5,384,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
295,0,0,7,88,0,5,398,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
326,0,0,8,69,0,5,413,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
353,0,0,9,183,0,5,428,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
380,0,0,10,492,0,9,465,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
411,0,0,10,0,0,15,471,0,0,0,0,0,1,0,
426,0,0,10,0,0,13,477,0,0,6,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,
465,0,0,10,0,0,15,481,0,0,0,0,0,1,0,
480,0,0,10,0,0,15,490,0,0,0,0,0,1,0,
495,0,0,11,85,0,5,497,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
526,0,0,12,85,0,5,511,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
557,0,0,13,85,0,5,527,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
588,0,0,14,85,0,5,543,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
619,0,0,15,141,0,5,557,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
646,0,0,16,178,0,5,572,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
677,0,0,17,270,0,5,589,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
712,0,0,18,432,0,9,620,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
735,0,0,18,0,0,15,627,0,0,0,0,0,1,0,
750,0,0,18,0,0,13,633,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,
793,0,0,18,0,0,15,638,0,0,0,0,0,1,0,
808,0,0,18,0,0,15,647,0,0,0,0,0,1,0,
823,0,0,19,151,0,5,662,0,0,8,8,0,1,0,1,4,0,0,1,9,0,0,1,97,0,0,1,97,0,0,1,4,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,
870,0,0,20,432,0,9,696,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
893,0,0,20,0,0,15,702,0,0,0,0,0,1,0,
908,0,0,20,0,0,13,708,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,
951,0,0,20,0,0,15,713,0,0,0,0,0,1,0,
966,0,0,20,0,0,15,722,0,0,0,0,0,1,0,
981,0,0,21,104,0,5,737,0,0,5,5,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
1016,0,0,22,137,0,5,752,0,0,7,7,0,1,0,1,9,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
1059,0,0,23,78,0,5,771,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1090,0,0,24,301,0,5,858,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1113,0,0,25,95,0,5,892,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1136,0,0,26,66,0,5,907,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1159,0,0,27,65,0,5,942,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1182,0,0,28,210,0,5,958,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1205,0,0,29,81,0,5,974,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1228,0,0,30,69,0,5,1068,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
1255,0,0,31,269,0,5,1085,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1286,0,0,32,265,0,5,1111,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1317,0,0,33,310,0,5,1137,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1348,0,0,34,137,0,5,1164,0,0,5,5,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,
0,0,
1383,0,0,35,82,0,5,1179,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1406,0,0,36,81,0,4,1207,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
1433,0,0,37,50,0,3,1308,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1474,0,0,38,0,0,29,1318,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ===================== Program Header ==========================================
 PROGRAM-NAME   : PKE1020G(상여금 생성/계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 일반상여금
 Programmer     : 이랑교
 Version        : 30.01
 Date           : 1999.02.04

Update Contents
   Version    date(yy.mm.dd) programmer       description     relevant doc.no
   1.00       1997.12.31       허철행           최초개발본      설계명세서
   2.00       1998.06.11       김승회           수정본         전산처리요청
   30.01     1999.02.04       이랑교    신인사관련 항목추가및 제도변경녀
   30.02     1999.06.28       이랑교    교육 파견자 총액의 70%만 지급
   30.03     2000.07.18       유효성    교육 파견자 복귀후 총액의 100% 지급
   31.00     2001.03.05       유효성    임원 연봉제에 따른 로직 수정
   31.01     2004.02.24      강륜종             Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. 
   32.00     2004.11.        강륜종(dsa2000)    Rexec대체 서비스를 위한 수정적업.     
================================================================================ */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

#define  COL_HOME  5
#define  COL_END   60
#define  SU_TERM   3   /*수습기간 : 99.01.01 이후 입사자는 인턴기간 1개월이 
                         없으므로  수습기간은 3개월이다.    */
/* #define SU_TERM  2   수습기간 : 99.01.01 입사자는 인턴기간 1개월때문에 수습기간이 2개월
*/
/* ===========================================================================
  Function Prototype 정의 
   =========================================================================== */

void  calc_bonamt();
float  get_days(char *,char *);

/* ===========================================================================
  Global Variable
   =========================================================================== */

/* EXEC SQL BEGIN DECLARE SECTION; */ 


  /* ----------------------------------------------------
   상여금 마스터 관련변수 
     ---------------------------------------------------- */

     char    empno[4+1]        = "";   /* 사번    */ 
     char    korname[12+1]     = "";   /* 성명    */ 
     char    empdate[8+1]      = "";   /* 입사일   */ 
     char    paynum[2+1]       = "";   /* 급여차수   */ 
     char    paycl[4]          = "";   /* 직급    */ 
     float   paygr             = 0;    /* 호봉    */ 
     char    orgnum[3+1]       = "";   /* 조직차수   */ 
     char    deptcode[6+1]     = "";   /* 부서코드   */ 
                               
     char    bonyn[1+1]        = "";   /* 상여금 지급여부  */ 
                                       /* <특이사항>   */ 
     char    spkind[3+1]       = "";   /* 특이구분(인사상태)  */ 
     char    spfrdate[8+1]     = "";   /* 특이기간 from  */ 
     char    sptodate[8+1]     = "";   /* 특이기간 to   */ 
     float   spdd              = 0;    /* 특이일   */ 
                               
     float   bonkidd           = 0;    /* 상여기준일수   */ 
     char    kifrdate[8+1]     = "";   /* 근속기준일From  */ 
     char    kitodate[8+1]     = "";   /* 근속기준일To   */ 
     float   bongivedd         = 0;    /* 상여지급일수   */  
     char    sufrdate[8+1]     = "";   /* 수습기간From   */ 
     char    sutodate[8+1]     = "";   /* 수습기간To   */ 
     float   sudd              = 0;    /* 수습일수   */ 
                          
     char    basicyn[1+1]      = "";   /* 기본급 포함여부  */ 
     char    infoyn[1+1]       = "";   /* 정보통신수당 포함여부*/ 
     char    dutyyn[1+1]       = "";   /* 직무수당 포함여부  */ 
     char    promyn[1+1]       = "";   /* 업무추진비 포함여부  */ 
     float   standamt          = 0;    /* 기준임금   */ 
                          
     float   kiamt             = 0;    /* 기준지급액   */ 
     float   kirate            = 0;    /* 기준지급율   */ 
     float   fixamt            = 0;    /* 정액지급액   */ 
     float   giveamt           = 0;    /* 총지급액   */ 
                         
     float   holdrate          = 0;    /* 유보율   */ 
     float   holdamt           = 0;    /* 유보액   */ 
     float   realamt           = 0;    /* 실지급액   */ 
        

  /* ----------------------------------------------------
   상여금 지급기준 
     ---------------------------------------------------- */

     char     bonkind[1+1]   = "";    /* 상여구분   */
     char     bonyymm[6+1]   = "";    /* 지급년월   */
     char     paytype[1+1]   = "";    /* 지급방식   */
                                      
     char     regyn[1+1]     = "";    /* 상여지급여부(정규)  */
     char     staffyn[1+1]   = "";    /* 상여지급여부(임원)  */
     char     tempyn[1+1]    = "";    /* 상여지급여부(임시)  */
                                      
     float    r_kirate       = 0;     /* 상여기준지급율(정규) */
     float    s_kirate       = 0;     /* 상여기준지급율(임원) */
     float    t_kirate       = 0;     /* 상여기준지급율(임시) */
                                      
     float    r_kiamt        = 0;     /* 상여정액지급액(정규) */
     float    s_kiamt        = 0;     /* 상여정액지급액(임원) */
     float    t_kiamt        = 0;     /* 상여정액지급액(임시) */
                                      
     char     r_kidate[8+1]  = "";    /* 지급기준근속일(정규) */
     char     s_kidate[8+1]  = "";    /* 지급기준근속일(임원) */
     char     t_kidate[8+1]  = "";    /* 지급기준근속일(임시) */
     char     datedesc[40+1] = "";    /* 지급기준근속일설명  */
                                     
     char     r_basic[1+1]   = "";    /* 기본급포함여부(정규) */
     char     s_basic[1+1]   = "";    /* 기본급포함여부(임원) */
     char     t_basic[1+1]   = "";    /* 기본급포함여부(임시) */
                                      
     char     r_info[1+1]    = "";    /* 정보수당포함여부-정규*/
     char     s_info[1+1]    = "";    /* 정보수당포함여부-임원*/
     char     t_info[1+1]    = "";    /* 정보수당포함여부-임시*/
                                
     char     r_duty[1+1]    = "";    /* 직무수당포함여부-정규*/
     char     s_duty[1+1]    = "";    /* 직무수당포함여부-임원*/
     char     t_duty[1+1]    = "";    /* 직무수당포함여부-임시*/
                                      
     char     r_prom[1+1]    = "";    /* 추진비포함여부-정규   */
     char     s_prom[1+1]    = "";    /* 추진비포함여부-임원  */
     char     t_prom[1+1]    = "";    /* 추진비포함여부-임시   */
                                     
     char     r_fixpay[1+1]  = "";    /* 월정연봉포함여부  */
                                      
     char     givekind[1+1]  = "";    /* 지급율 구분   */
     float    giverate       = 0;     /* 일괄지급율   */
                            
     char     holdkind[1+1]  = "";    /* 유보율 구분   */
     float    b_holdrate     = 0;     /* 일괄유보율   */
     float    b_holdamt      = 0;     /* 일괄유보액   */
                            
     char     b_kifrdate[8+1]  = "";  /* 근속기준일From  */
     char     b_kitodate[8+1]  = "";  /* 근속기준일To   */
     float    kidd             = 0;   /* 상여기준일수   */
                                                  
     char     fixmonthyn[1+1]  = "";  /* 정액제근속개월적용  */
     char     fixrateyn[1+1]   = "";  /* 정액제지급율적용  */

     char     anfrdate[8+1]    = "";  /* 발령일From   */
     char     antodate[8+1]    = "";  /* 발령일To    */
     char     exfrdate[8+1]    = "";  /* 근속제외From   */
     char     extodate[8+1]    = "";  /* 근속제외To    */
     /* varchar  exkind[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } exkind;


     char     jobempno[4+1]    = "";  /* 작업자사번   */                     
     
     float    t_term;
     char     t_frdate[8+1];
     char     t_todate[8+1];
     int      trainrate =0;

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



char  msg[300+1]    = "";
int   id;
char  delkind[1+1]  = "";

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 


void main(int argc, char *argv[])
{
     char FL_file[255];
     
     if  (argc != 7) {  /* /hper8/HINSA/proc/bin/Kbin/pke1020g 200406 7 1 D006 pke1020g 2004110500000 */
          printf("[Usage] : pke1020g 1.지급년월  2.상여구분  3.삭제유형(1,2) 4.작업자 5.프로그램ID 6.시작시간 \n");
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pke1020g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(bonyymm,"%s",  argv[1]);
     sprintf(bonkind,"%s",  argv[2]);
     sprintf(delkind,"%s",  argv[3]);
     sprintf(jobempno,"%s",  argv[4]);  
     
     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"상여금 생성/계산 프로그램 시작...");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/   
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     calc_bonamt();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("ERROR [작업 실패]\n");
     }
     else
     {
          sprintf(log_buff, "OK ======[상여금 추출/계산작업 완료]====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK [상여금 추출/계산작업 완료].\n");   
     }              
              
}

void calc_bonamt()
{
     /* 기존자료삭제 */
     if  (delkind[0] == '1')
     {
          /* EXEC SQL
          delete from pkmgbmas
           where  bonyymm = :bonyymm
             and  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from pkmgbmas  where (bonyymm=:b0 and bonk\
ind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )5;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"0. 기존자료삭제1");
               sprintf(log_buff, "기존자료삭제1 Error\n"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }  
     }  
     else if (delkind[0] == '2')
     {    
          /* EXEC SQL
          delete from pkmgbmas
          where  bonyymm <> :bonyymm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from pkmgbmas  where bonyymm<>:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )28;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
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


          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"0. 기존자료삭제2");
               sprintf(log_buff, "기존자료삭제2 Error\n"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
     
     /* 1. 상여지급기준읽기   */
     /* EXEC SQL
     select  paytype, upper(regyn), upper(staffyn), upper(tempyn),
             r_kirate, s_kirate, t_kirate, r_kiamt, s_kiamt,
             t_kiamt, r_kidate, s_kidate, t_kidate, datedesc,
             upper(r_basic), upper(s_basic), upper(t_basic),
             upper(r_info), upper(s_info), upper(t_info),
             upper(r_duty), upper(s_duty), upper(t_duty),
             upper(r_prom), upper(s_prom), upper(t_prom),
             givekind, giverate, holdkind, holdrate,
             holdamt, kifrdate, kitodate, kidd,
             fixmonthyn, fixrateyn, r_fixpay
       into  :paytype, :regyn, :staffyn, :tempyn, 
             :r_kirate, :s_kirate, :t_kirate, :r_kiamt, :s_kiamt, 
             :t_kiamt, :r_kidate, :s_kidate, :t_kidate, :datedesc,
             :r_basic, :s_basic, :t_basic, 
             :r_info, :s_info, :t_info,
             :r_duty, :s_duty, :t_duty,
             :r_prom, :s_prom, :t_prom,
             :givekind, :giverate, :holdkind, :b_holdrate, 
             :b_holdamt, :b_kifrdate, :b_kitodate, :kidd,
             :fixmonthyn, :fixrateyn, :r_fixpay
       from  pkcgbbas
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select paytype ,upper(regyn) ,upper(staffyn) ,upper(tem\
pyn) ,r_kirate ,s_kirate ,t_kirate ,r_kiamt ,s_kiamt ,t_kiamt ,r_kidate ,s_ki\
date ,t_kidate ,datedesc ,upper(r_basic) ,upper(s_basic) ,upper(t_basic) ,upp\
er(r_info) ,upper(s_info) ,upper(t_info) ,upper(r_duty) ,upper(s_duty) ,upper\
(t_duty) ,upper(r_prom) ,upper(s_prom) ,upper(t_prom) ,givekind ,giverate ,ho\
ldkind ,holdrate ,holdamt ,kifrdate ,kitodate ,kidd ,fixmonthyn ,fixrateyn ,r\
_fixpay into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14\
,:b15,:b16,:b17,:b18,:b19,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:\
b30,:b31,:b32,:b33,:b34,:b35,:b36  from pkcgbbas where (bonyymm=:b37 and bonk\
ind=:b38)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )47;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paytype;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)regyn;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)staffyn;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)tempyn;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&r_kirate;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&s_kirate;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&t_kirate;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&r_kiamt;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&s_kiamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&t_kiamt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)r_kidate;
     sqlstm.sqhstl[10] = (unsigned long )9;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)s_kidate;
     sqlstm.sqhstl[11] = (unsigned long )9;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)t_kidate;
     sqlstm.sqhstl[12] = (unsigned long )9;
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)datedesc;
     sqlstm.sqhstl[13] = (unsigned long )41;
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)r_basic;
     sqlstm.sqhstl[14] = (unsigned long )2;
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)s_basic;
     sqlstm.sqhstl[15] = (unsigned long )2;
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)t_basic;
     sqlstm.sqhstl[16] = (unsigned long )2;
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)r_info;
     sqlstm.sqhstl[17] = (unsigned long )2;
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)s_info;
     sqlstm.sqhstl[18] = (unsigned long )2;
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)t_info;
     sqlstm.sqhstl[19] = (unsigned long )2;
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)r_duty;
     sqlstm.sqhstl[20] = (unsigned long )2;
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)s_duty;
     sqlstm.sqhstl[21] = (unsigned long )2;
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)t_duty;
     sqlstm.sqhstl[22] = (unsigned long )2;
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)r_prom;
     sqlstm.sqhstl[23] = (unsigned long )2;
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)s_prom;
     sqlstm.sqhstl[24] = (unsigned long )2;
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)t_prom;
     sqlstm.sqhstl[25] = (unsigned long )2;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)givekind;
     sqlstm.sqhstl[26] = (unsigned long )2;
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&giverate;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)holdkind;
     sqlstm.sqhstl[28] = (unsigned long )2;
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&b_holdrate;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&b_holdamt;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)b_kifrdate;
     sqlstm.sqhstl[31] = (unsigned long )9;
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)b_kitodate;
     sqlstm.sqhstl[32] = (unsigned long )9;
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&kidd;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)fixmonthyn;
     sqlstm.sqhstl[34] = (unsigned long )2;
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)fixrateyn;
     sqlstm.sqhstl[35] = (unsigned long )2;
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)r_fixpay;
     sqlstm.sqhstl[36] = (unsigned long )2;
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[37] = (unsigned long )7;
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[38] = (unsigned long )2;
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"1. 상여지급기준읽기");
          sprintf(log_buff, "1. 상여지급기준읽기"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* 2.1 상여금 대상자 추출 */
     /* EXEC SQL
     insert  into pkmgbmas (
             empno,     korname, empdate, paynum,    paycl, paygr, orgnum, deptcode,
             bonkind,   bonyymm, bonyn,   writetime, writeman)
     select  empno,     korname, empdate, paynum,    paycl, paygr, orgnum, deptcode,
             :bonkind, :bonyymm, 'Y',     to_char(sysdate,'YYYYMMDDHH24MISS'), :jobempno
       from  pkmpmas
      where  upper(payyn) = 'Y'
        and  empno not like 'Y%'  /o일반직 급여통합에 따른 대상자에서 Y사번 제외  2008.01.o/
        and  empno not like 'Q%'  /o 분기연봉 대상자에서 Q사번 제외 2008.08.20 (김태호)o/
        and  empno not like 'J%'  /o 분기연봉 대상자에서 J사번 제외 2008.12.21 (김태호)o/
        and  empno not like 'P%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pkmgbmas (empno,korname,empdate,paynum,payc\
l,paygr,orgnum,deptcode,bonkind,bonyymm,bonyn,writetime,writeman)select empno\
 ,korname ,empdate ,paynum ,paycl ,paygr ,orgnum ,deptcode ,:b0 ,:b1 ,'Y' ,to\
_char(sysdate,'YYYYMMDDHH24MISS') ,:b2  from pkmpmas where ((((upper(payyn)='\
Y' and empno not like 'Y%') and empno not like 'Q%') and empno not like 'J%')\
 and empno not like 'P%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )218;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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

 /* 분기연봉 대상자에서 P사번 제외 2008.12.21 (김태호)*/
       
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"2.1 상여금 대상자 추출");
          sprintf(log_buff, "2.1 상여금 대상자 추출"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* 2.2  지급여부 <> 'Y'인 자료삭제 */
     if  (strcmp(regyn,"Y") != 0)
     {
          /* EXEC SQL
          delete  from pkmgbmas
          where  bonyymm = :bonyymm
          and  bonkind  = :bonkind ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from pkmgbmas  where (bonyymm=:b0 and bonk\
ind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )245;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


/* =================================== ==========================================
  31.00  2001.03.05  유효성   임원 연봉제에 따른 수정
================================================================================ */   
/*   and  ((paycl between '09' and '93') or (paycl ='E1')
     or       (empno like 'P%'))  ;   
*/
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"지급여부 <> 'Y'인 자료삭제");
               sprintf(log_buff, "지급여부 <> 'Y'인 자료삭제"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
   
/* =================================== ==========================================
  31.00  2001.03.05  유효성   임원 연봉제에 따른 수정
================================================================================ */   
/* 주석처리 start
  if (strcmp(staffyn,"Y") != 0)
  {
   EXEC SQL
   delete  from pkmgbmas
   where  bonyymm = :bonyymm
   and  bonkind  = :bonkind
   and  (paycl between '01' and '08');
   if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
   {
     print_errmsg(sqlca.sqlcode,"지급여부 <> 'Y'인 자료삭제");
     error_quit("작업실패...");
   }
  }
*/  
/*
  if (strcmp(tempyn,"Y") != 0)
  {
   EXEC SQL
   delete  from pkmgbmas
   where  bonyymm = :bonyymm
   and  bonkind  = :bonkind
   and  paycl like 'A%';
   if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
   {
     print_errmsg(sqlca.sqlcode,"지급여부 <> 'Y'인 자료삭제");
     error_quit("작업실패...");
   }
  }
주석처리 end */  
  
  /* 3.1 kifrdate, kitodate, bonkidd, bongivedd 설정 */

  /* 3.1.1 kifrdate 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  kifrdate = empdate
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind
        and  empdate > :b_kifrdate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set kifrdate=empdate where ((bonyymm=:\
b0 and bonkind=:b1) and empdate>:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )268;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)b_kifrdate;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1.1 kifrdate 설정");
          sprintf(log_buff, "3.1.1 kifrdate 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     update  pkmgbmas
        set  kifrdate = :b_kifrdate
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind
        and  empdate <= :b_kifrdate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set kifrdate=:b0 where ((bonyymm=:b1 a\
nd bonkind=:b2) and empdate<=:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )295;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)b_kifrdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)b_kifrdate;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1.1 kifrdate 설정...");
          sprintf(log_buff, "3.1.1 kifrdate 설정..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* 3.1.2 kitodate 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  kitodate = :b_kitodate
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set kitodate=:b0 where (bonyymm=:b1 an\
d bonkind=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )326;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)b_kitodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[2] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"3.1.2 kitodate 설정");
          sprintf(log_buff, "3.1.2 kitodate 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
   
     /* 3.1.3 bonkidd 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  bonkidd  = :kidd,
             bongivedd= (to_date(kitodate,'YYYYMMDD')-to_date(kifrdate,'YYYYMMDD')+1)
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind
        and  length(replace(kitodate,' ','')) = 8 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set bonkidd=:b0,bongivedd=((to_date(ki\
todate,'YYYYMMDD')-to_date(kifrdate,'YYYYMMDD'))+1) where ((bonyymm=:b1 and b\
onkind=:b2) and length(replace(kitodate,' ',''))=8)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )353;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&kidd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[2] = (unsigned long )2;
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

 /* 정액이 아닐때만*/
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1.3 bonkidd 설정");
          sprintf(log_buff, "3.1.3 bonkidd 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
   
     /* 3.2 sufrdate, sutodate, sudd 설정 */
   
     /* EXEC SQL DECLARE c1 CURSOR FOR
     select  a.empno, a.korname, anfrdate, b.kifrdate,
             to_char(add_months(to_date(anfrdate,'YYYYMMDD'),3) - 1,'YYYYMMDD') antodate,
             c.kitodate
       from  pihanno a, pkmgbmas b, pkcgbbas c
      where  c.bonyymm = :bonyymm
        and  c.bonkind = :bonkind
        and  b.bonyymm = :bonyymm
        and  b.bonkind = :bonkind
        and  b.empno   = a.empno
        and  ancode   = '111'
   /oinfra   and  (a.payra = '78' and bpayra is null) o/
        and  (a.payra = 'D51' and bpayra is null)
   /o  and  (a.payra = '590' and bpayra is null)  o/
        and  (anfrdate > to_char(add_months(to_date(c.kifrdate,'YYYYMMDD'),-1*3),'YYYYMMDD')
   /o                 > to_char(add_months(to_date(c.kifrdate,'yyyymmdd'),-3),'yyyymmdd') o/
        and  anfrdate <= c.kitodate)
      order  by anfrdate, a.empno; */ 

   
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0010;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )380;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[3] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"Cursor c1 Open Error...");
          sprintf(log_buff, "Cursor c1 Open Error..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )411;
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
          /* EXEC SQL FETCH   c1 INTO   
          :empno, :korname, :anfrdate, :kifrdate, :antodate, :kitodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )426;
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
          sqlstm.sqhstv[2] = (unsigned char  *)anfrdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)kifrdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)antodate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)kitodate;
          sqlstm.sqhstl[5] = (unsigned long )9;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )465;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor c1 Data Fetch Error...");
               sprintf(log_buff, "Cursor c1 Data Fetch Error..."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )480;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          /* 3.2.1 sufrdate 설정 */
          if  (strcmp(anfrdate,kifrdate) > 0)
          {
               /* EXEC SQL
               update  pkmgbmas
               set  sufrdate = :anfrdate
               where  bonyymm = :bonyymm
               and  bonkind  = :bonkind
               and  empno  = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas  set sufrdate=:b0 where ((bon\
yymm=:b1 and bonkind=:b2) and empno=:b3)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )495;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)anfrdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.2.1 sufrdate 설정");
                    error_quit("작업실패...");
               }
          }
          else
          {
               /* EXEC SQL
               update  pkmgbmas
                  set  sufrdate = :kifrdate
                where  bonyymm  = :bonyymm
                  and  bonkind  = :bonkind
                  and  empno    = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas  set sufrdate=:b0 where ((bon\
yymm=:b1 and bonkind=:b2) and empno=:b3)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )526;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)kifrdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.2.1 sufrdate 설정");
                    error_quit("작업실패...");
               }
          }
          
          /* 3.2.2 sutodate 설정 */
          if  (strcmp(antodate,kitodate) < 0)
          {
               /* EXEC SQL
               update  pkmgbmas
               set  sutodate = :antodate
               where  bonyymm = :bonyymm
               and  bonkind  = :bonkind
               and  empno  = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas  set sutodate=:b0 where ((bon\
yymm=:b1 and bonkind=:b2) and empno=:b3)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )557;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)antodate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.2.2 sutodate 설정");
                    sprintf(log_buff, "3.2.2 sutodate 설정"); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    error_quit("작업실패...");
               }
          }
          else
          {
               /* EXEC SQL
               update  pkmgbmas
                  set  sutodate = :kitodate
                where  bonyymm = :bonyymm
                  and  bonkind  = :bonkind
                  and  empno  = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas  set sutodate=:b0 where ((bon\
yymm=:b1 and bonkind=:b2) and empno=:b3)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )588;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)kitodate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.2.2 sutodate 설정");
                    error_quit("작업실패...");
               }
          }
          
          /* 3.2.3 sudd 설정 */
          /* EXEC SQL
          update  pkmgbmas
             set  sudd     =   to_date(sutodate,'YYYYMMDD')-to_date(sufrdate,'YYYYMMDD')+1
           where  bonyymm  = :bonyymm
             and  bonkind  = :bonkind
             and  empno    = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set sudd=((to_date(sutodate,'YYYY\
MMDD')-to_date(sufrdate,'YYYYMMDD'))+1) where ((bonyymm=:b0 and bonkind=:b1) \
and empno=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )619;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[1] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.2.3 sudd 설정");
               sprintf(log_buff, "3.2.3 sudd 설정"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
          
          /* 3.2.4 상여대상기간 보정 */
          /* EXEC SQL
          update  pkmgbmas
             set  kifrdate  = null,
                  kitodate  = null,
                  bongivedd = 0
           where  bonyymm = :bonyymm
             and  bonkind  = :bonkind
             and  empno  = :empno
             and  ((to_date(sutodate,'YYYYMMDD')+1) >= to_date(:kitodate,'YYYYMMDD')); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set kifrdate=null ,kitodate=null \
,bongivedd=0 where (((bonyymm=:b0 and bonkind=:b1) and empno=:b2) and (to_dat\
e(sutodate,'YYYYMMDD')+1)>=to_date(:b3,'YYYYMMDD'))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )646;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[1] = (unsigned long )2;
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
          sqlstm.sqhstv[3] = (unsigned char  *)kitodate;
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


          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"3.2.4 상여대상기간 보정");
               sprintf(log_buff, "3.2.4 상여대상기간 보정"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
          
          /* EXEC SQL
          update  pkmgbmas
             set  kifrdate  = to_char(to_date(sutodate,'YYYYMMDD')+1,'yyyymmdd'),
                  bongivedd = (to_date(:kitodate,'YYYYMMDD')-(to_date(sutodate,'YYYYMMDD')+1) +1)
           where  bonyymm  = :bonyymm
             and  bonkind  = :bonkind
             and  empno    = :empno
             and  ((to_date(sutodate,'YYYYMMDD')+1) < to_date(:kitodate,'YYYYMMDD')); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set kifrdate=to_char((to_date(sut\
odate,'YYYYMMDD')+1),'yyyymmdd'),bongivedd=((to_date(:b0,'YYYYMMDD')-(to_date\
(sutodate,'YYYYMMDD')+1))+1) where (((bonyymm=:b1 and bonkind=:b2) and empno=\
:b3) and (to_date(sutodate,'YYYYMMDD')+1)<to_date(:b0,'YYYYMMDD'))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )677;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)kitodate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[2] = (unsigned long )2;
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
          sqlstm.sqhstv[4] = (unsigned char  *)kitodate;
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


          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"3.2.4 상여대상기간 보정");
               error_quit("작업실패...");
          }
     }
     
     /* 3.3 spkind, spfrdate, sptodate, spdd 설정 */
     /* 3.3.1 근속제외1 - 수습기간이 없는 경우 */
     /* EXEC SQL DECLARE c2 CURSOR FOR
     select  a.empno, a.korname, exkind, exfrdate, b.kifrdate, extodate, 
             b.kitodate
     from  pkhexdd a, pkmgbmas b
     where  bonyymm  = :bonyymm
       and  bonkind  = :bonkind
       and  a.empno  = b.empno
       and  (kifrdate is not null and kitodate is not null)
       and  ((exfrdate >= kifrdate and exfrdate < kitodate) or
            (extodate >= kifrdate and extodate < kitodate) or
            (exfrdate <= kifrdate and extodate >= kitodate))
       and  upper(exfixyn) = 'Y'
     order  by a.empno, a.exfrdate; */ 

   
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0018;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )712;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
          print_errmsg(sqlca.sqlcode,"Cursor c2 Open Error...");
          sprintf(log_buff, "Cursor c2 Open Error..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )735;
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
          /* EXEC SQL FETCH   c2 INTO   
          :empno, :korname, :exkind, :exfrdate, :kifrdate, 
          :extodate, :kitodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )750;
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
          sqlstm.sqhstv[2] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)exfrdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)kifrdate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)extodate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)kitodate;
          sqlstm.sqhstl[6] = (unsigned long )9;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )793;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
          {
               print_errmsg(sqlca.sqlcode,"Cursor c2 Data Fetch Error...");
               sprintf(log_buff, "Cursor c2 Data Fetch Error...."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )808;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (strcmp(kifrdate,exfrdate) >= 0)
               sprintf(t_frdate,"%s",kifrdate);
          else
               sprintf(t_frdate,"%s",exfrdate);
          
          if  (strcmp(kitodate,extodate) <= 0)
               sprintf(t_todate,"%s",kitodate);
          else
               sprintf(t_todate,"%s",extodate);
          t_term = get_days(t_frdate,t_todate);
          
          /* EXEC SQL
          update  pkmgbmas
             set  bongivedd  = bongivedd - :t_term,
                  spkind     = :exkind,
                  spfrdate   = :t_frdate,
                  sptodate   = :t_todate,
                  spdd       = spdd + :t_term        
           where  bonyymm  = :bonyymm
             and  bonkind  = :bonkind
             and  empno    = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set bongivedd=(bongivedd-:b0),spk\
ind=:b1,spfrdate=:b2,sptodate=:b3,spdd=(spdd+:b0) where ((bonyymm=:b5 and bon\
kind=:b6) and empno=:b7)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )823;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[1] = (unsigned long )6;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)t_frdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)t_todate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[5] = (unsigned long )7;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[6] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.3.1 근속제외1");
               sprintf(log_buff, "3.3.1 근속제외1"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
   
     /* 3.3.2 근속제외2 - 수습기간이 있는 경우 */
     /* EXEC SQL DECLARE c3 CURSOR FOR
     select  a.empno, a.korname, exkind, exfrdate, b.sufrdate, 
             extodate, b.sutodate
       from  pkhexdd a, pkmgbmas b
      where  bonyymm = :bonyymm
        and  bonkind = :bonkind
        and  a.empno  = b.empno
        and  (sufrdate is not null and sutodate is not null)
        and  ((exfrdate >= sufrdate and exfrdate < sutodate) or
             (extodate >= sufrdate and extodate < sutodate) or
             (exfrdate <= sufrdate and extodate >= sutodate))
        and  upper(exfixyn) = 'Y'
      order  by a.empno, a.exfrdate; */ 

   
     /* EXEC SQL OPEN c3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )870;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
     {
          print_errmsg(sqlca.sqlcode,"Cursor c3 Open Error...");
          sprintf(log_buff, "Cursor c3 Open Error..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )893;
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
          /* EXEC SQL FETCH   c3 INTO   
          :empno, :korname, :exkind, :exfrdate, :sufrdate, 
          :extodate, :sutodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )908;
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
          sqlstm.sqhstv[2] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)exfrdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)sufrdate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)extodate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)sutodate;
          sqlstm.sqhstl[6] = (unsigned long )9;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )951;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor c3 Data Fetch Error...");
               sprintf(log_buff, "Cursor c3 Data Fetch  Error..."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )966;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (strcmp(sufrdate,exfrdate) >= 0)
               sprintf(t_frdate,"%s",sufrdate);
          else
               sprintf(t_frdate,"%s",exfrdate);
          
          if  (strcmp(sutodate,extodate) <= 0)
               sprintf(t_todate,"%s",sutodate);
          else
               sprintf(t_todate,"%s",extodate);
          t_term = get_days(t_frdate,t_todate);
          
          /* EXEC SQL
          update  pkmgbmas
             set  sudd  = sudd - :t_term,
                  spdd  = spdd + :t_term        
           where  bonyymm = :bonyymm
             and  bonkind  = :bonkind
             and  empno  = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set sudd=(sudd-:b0),spdd=(spdd+:b\
0) where ((bonyymm=:b2 and bonkind=:b3) and empno=:b4)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )981;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[3] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.3.2 근속제외2");
               sprintf(log_buff, "3.3.2 근속제외2."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
          
          /* EXEC SQL
          update  pkmgbmas
             set  spkind   = :exkind,
                  spfrdate = :t_frdate,
                  sptodate = :t_todate        
           where  bonyymm   = :bonyymm
             and  bonkind   = :bonkind
             and  empno     = :empno
             and  :exfrdate > nvl(spfrdate,' '); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas  set spkind=:b0,spfrdate=:b1,sptod\
ate=:b2 where (((bonyymm=:b3 and bonkind=:b4) and empno=:b5) and :b6>nvl(spfr\
date,' '))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1016;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[0] = (unsigned long )6;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)t_frdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)t_todate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[4] = (unsigned long )2;
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
          sqlstm.sqhstv[6] = (unsigned char  *)exfrdate;
          sqlstm.sqhstl[6] = (unsigned long )9;
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


          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"3.3.2 근속제외2");
               sprintf(log_buff, "3.3.2 근속제외2."); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
     
     /* 3.4 기준임금(standamt) 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  
             kirate  = :r_kirate,
             fixamt  = :r_kiamt   
      where  bonyymm  = :bonyymm
        and   bonkind  = :bonkind ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set kirate=:b0,fixamt=:b1 where (bonyy\
mm=:b2 and bonkind=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1059;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&r_kirate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&r_kiamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[3] = (unsigned long )2;
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


   /* ==============================================================================
     31.00  2001.03.05  유효성   임원 연봉제에 따른 수정
   ================================================================================ */     
   /*  and  ((paycl between '09' and '93') or (paycl = 'E1'));
   */
           
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정1");
          sprintf(log_buff, "3.4 기준임금(standamt) 설정1"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
   
   /* ==============================================================================
     31.00  2001.03.05  유효성   임원 연봉제에 따른 주석처리
   ================================================================================ */     
   /*주석처리 start
   
     EXEC SQL
     update  pkmgbmas
     set  basicyn = :s_basic,
      infoyn  = :s_info,
      dutyyn  = :s_duty,
      promyn  = :s_prom,
      kirate  = :s_kirate,
      fixamt  = :s_kiamt   
     where  bonyymm = :bonyymm
     and  bonkind  = :bonkind
     and  (paycl between '01' and '08');
           
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정2");
      error_quit("작업실패...");
     }
   */  
   /*
     EXEC SQL
     update  pkmgbmas
     set  basicyn = :t_basic,
      infoyn  = :t_info,
      dutyyn  = :t_duty,
      promyn  = :t_prom,
      kirate  = :t_kirate,
      fixamt  = :t_kiamt   
     where  bonyymm = :bonyymm
     and  bonkind  = :bonkind
     and  paycl   like 'A%';
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정3");
      error_quit("작업실패...");
     }
   */  
   /*
     EXEC SQL
     update  pkmgbmas a
     set  standamt = 
        ( 
        select  decode(basicyn,'Y',basicamt,0)  +
         decode(infoyn,'Y',infoamt,0)  +
         decode(dutyyn,'Y',dutyamt,0)  +
         decode(promyn,'Y',promamt,0)
        from  pkmpmas b
        where  a.empno = b.empno
        )
     where  bonyymm = :bonyymm
     and  bonkind  = :bonkind
     and  (paycl between '01' and '08');
   
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정4-1");
      error_quit("작업실패...");
     }
   주석처리 end */  
   
     if  (r_fixpay[0] == 'Y')
     {
          /* EXEC SQL
          update  pkmgbmas a
             set  standamt = 
                           ( select  ceil(totpay/c.yearpaydiv)
                               from  pkhyphis b, pkcpbas c
                              where  b.empno = a.empno
                                and  b.yearpaynum = to_char(c.yearpaynum)
                           )
           where  bonyymm  = :bonyymm
             and  bonkind  = :bonkind
          /o  and  (paycl between '09' and '93')  o/
   /o =================================== ==========================================
     31.00  2001.03.05  유효성   임원 연봉제에 따른 수정
   ================================================================================ o/          
                  /o
                  and  ((paycl between '09' and '93') or (paycl = 'E1'))
                  o/
             and  empno in 
                          (select empno 
                            from  pkhyphis
                           where  yearpaynum = (select to_char(yearpaynum) from pkcpbas)); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas a  set standamt=(select ceil((totp\
ay/c.yearpaydiv))  from pkhyphis b ,pkcpbas c where (b.empno=a.empno and b.ye\
arpaynum=to_char(c.yearpaynum))) where ((bonyymm=:b0 and bonkind=:b1) and emp\
no in (select empno  from pkhyphis where yearpaynum=(select to_char(yearpaynu\
m)  from pkcpbas )))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1090;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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

 
         
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정4-2");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정4-2"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
     
     if ((strcmp(paytype,"1") == 0) || (strcmp(paytype,"3") == 0))
     {    
          
          /* EXEC SQL
          update  pkmgbmas a
             set  kiamt = ceil(standamt * kirate / 100)
           where  bonyymm = :bonyymm
             and  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkmgbmas a  set kiamt=ceil(((standamt* kira\
te)/100)) where (bonyymm=:b0 and bonkind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1113;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정5-1");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정5-1"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
     else
     {
          /* EXEC SQL
          UPDATE  PKMGBMAS A
             set  kiamt = 0
           where  bonyymm  = :bonyymm
             and  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS A  set kiamt=0 where (bonyymm=:b0 \
and bonkind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1136;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정5-2");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정5-2"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }
     }
   
     if ((strcmp(paytype,"2") == 0) || (strcmp(paytype,"3") == 0))
     {
      
          if  (strcmp(fixrateyn,"Y") == 0)
          {
               /* ============================= 정액일경우 일할안함
               EXEC SQL
               update  pkmgbmas
               set  fixamt   = ceil(fixamt * ((bongivedd+sudd)/bonkidd))
               where  bonyymm = :bonyymm
               and  bonkind  = :bonkind;
               
               if (sqlca.sqlcode != 0) {
                print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정6-1");
                error_quit("작업실패...");
               }
               * ============================= */
          }
     }
     else
     {
           /* EXEC SQL
           update  pkmgbmas
              set  fixamt = 0
            where  bonyymm = :bonyymm
              and  bonkind  = :bonkind; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 39;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "update pkmgbmas  set fixamt=0 where (bonyymm=:b0 \
and bonkind=:b1)";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )1159;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
           sqlstm.sqhstl[0] = (unsigned long )7;
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


           
           if  (sqlca.sqlcode != 0) 
           {
                print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정6-2");
                sprintf(log_buff, "3.4 기준임금(standamt) 설정6-2"); /*dsa2000 Rexec 대체*/
                Write_batlog(seqno++, log_buff);
                error_quit("작업실패...");
           }
     }
     
     /* 3.5.1 총지급액(giveamt) 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  giveamt = ceil(kiamt * ((nvl(bongivedd,0)/decode(bonkidd,null,1,0,1,bonkidd))+ 
             decode(nvl(sudd,0),0,1,0.8)*(sudd/decode(bonkidd,null,1,0,1,bonkidd))))
      where  bonyymm  = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set giveamt=ceil((kiamt* ((nvl(bongive\
dd,0)/decode(bonkidd,null ,1,0,1,bonkidd))+(decode(nvl(sudd,0),0,1,0.8)* (sud\
d/decode(bonkidd,null ,1,0,1,bonkidd)))))) where (bonyymm=:b0 and bonkind=:b1\
)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1182;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.5.1 총지급액(giveamt) 설정");
          sprintf(log_buff, "3.5.1 총지급액(giveamt) 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }  
     
     /* 3.5.2 정액일 경우  */
     /* EXEC SQL
     update  pkmgbmas
        set  giveamt = giveamt + fixamt 
      where  bonyymm = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set giveamt=(giveamt+fixamt) where (bo\
nyymm=:b0 and bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1205;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.5.2 총지급액(giveamt) 설정");
          sprintf(log_buff, "3.5.2 총지급액(giveamt) 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }  
     
     /* ======================================================
          30.02  1999.06.28  이랑교  교육 파견자 총액의 70%만 지급
              3.5.2 총지급액(giveamt) 설정 =교육파견자 전액의 70%만 지급
              일할반영 안되어 있슴
   
     update  pkmgbmas
     set  giveamt = ceil( giveamt * 70 / 100 )
     where  bonyymm = '199906'
     and  bonkind  = '7'
           AND   PAYCL  > '08'
           AND   EMPNO IN ( SELECT EMPNO FROM PIMPMAS
                       WHERE (PSTATE = '32' OR EDUGUBUN ='4B'
                              OR LSEKIND ='25'))  ;
   
              ====================================================== */
   /* kth 주석 교육파견 100% 로 변경 2009.03.23 쿼리 전부 주석처리 필요 없어 주석처리  
   
   EXEC SQL
     update  pkmgbmas
     set  giveamt = ceil( giveamt * 100 / 100 ) 
     where  bonyymm = :bonyymm
     and  bonkind  = :bonkind     */
   /*infra        AND   PAYCL  > '08' */
           /*AND   PAYCL  >= 'C11' 
           AND   EMPNO IN ( SELECT EMPNO FROM PIMPMAS  */
     /*======Ver 30.03 (2000.7.18.) 교육복귀후는 100% 지급 ====================
                       WHERE (PSTATE = '32' OR EDUGUBUN ='4B'
                              OR LSEKIND ='25'))  ;  
     ====================================================================*/
                       /*WHERE (PSTATE = '32' OR (EDUGUBUN ='4B' AND nvl(EDUTODATE, '9') >= :bonyymm||'01')
                              OR (LSEKIND ='25' AND nvl(LSETODATE, '9') >= :bonyymm||'01') ))  ;
      
      
     if ((sqlca.sqlcode != 0)&&(sqlca.sqlcode != 1403)) {
      print_errmsg(sqlca.sqlcode,"3.5.2 총지급액(giveamt) 설정=교육파견자 전액의 100% ");
      sprintf(log_buff, "3.5.2 총지급액(giveamt) 설정");*/ /*dsa2000 Rexec 대체*/
      /*Write_batlog(seqno++, log_buff);
      error_quit("작업실패...");
     }*/
   
   /*  2009.03.23  김태호 수습은 80%로 지급으로 변경 함 
     EXEC SQL
     select trainrate      //수습 지급율 
       into :trainrate
       from pkcpbas;
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정4-2");
          sprintf(log_buff, "3.4 기준임금(standamt) 설정4-2"); 
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
   
     EXEC SQL
     update  pkmgbmas
        set  giveamt  =  ceil( giveamt * :trainrate / 100 )  수습사원  전액 * 80% 변경 2009.03.23  
      where  bonyymm  =  :bonyymm
        and  bonkind  =  :bonkind
        and  paycl    >= 'C11'                                                          
        and  empno in (select empno from pkmpmas where payyn ='Y' and payra = 'D51');
      
      
     if ((sqlca.sqlcode != 0)&&(sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"3.5.2 총지급액(giveamt)설정 = 수습사원 전액 * 80% ");
          sprintf(log_buff, "3.5.2 총지급액(giveamt) 설정");
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     } */
   /*  2009.03.23  김태호 수습은 80%로 지급으로 변경 함  끝*/
   
     /* 3.6 유보액 설정 */
   
     /* 3.6.1 유보율 설정 */
     switch(holdkind[0])  
     {
          case '1' :  /* 일괄유보율 */
          {
               /* EXEC SQL
               update  pkmgbmas
                  set  holdrate = :b_holdrate
                where  bonyymm  = :bonyymm
                  and  bonkind  = :bonkind; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas  set holdrate=:b0 where (bony\
ymm=:b1 and bonkind=:b2)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1228;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&b_holdrate;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.6.1 유보율 설정1");
                    sprintf(log_buff, "3.6.1 유보율 설정1"); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    error_quit("작업실패...");
               }
               break;
          }
          case '2' :  /* 직급별 유보율 */
          {
               /* EXEC SQL
               update  pkmgbmas a
                  set  holdrate = 
                               (
                                select  nvl(b.holdrate,0)
                                  from  pkcgbhol b
                                 where  :holdkind = b.holdkind
                                   and  a.bonkind  = b.bonkind
                                   and  (a.paycl >= payclfr and a.paycl < payclto)
                               )
                where  bonyymm = :bonyymm
                  and  bonkind  = :bonkind
                  and  (bonkind, :holdkind) in (select  bonkind, holdkind
                                                  from  pkcgbhol); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas a  set holdrate=(select nvl(b\
.holdrate,0)  from pkcgbhol b where ((:b0=b.holdkind and a.bonkind=b.bonkind)\
 and (a.paycl>=payclfr and a.paycl<payclto))) where ((bonyymm=:b1 and bonkind\
=:b2) and (bonkind,:b0) in (select bonkind ,holdkind  from pkcgbhol ))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1255;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[0] = (unsigned long )2;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[3] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.6.1 유보율 설정2");
                    sprintf(log_buff, "3.6.1 유보율 설정2"); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    error_quit("작업실패...");
               }
               break;
          }
          case '3' :  /* 금액별 유보율 */
          {
               /* EXEC SQL
               update  pkmgbmas a
                  set  holdrate = 
                               (
                               select  nvl(b.holdrate,0)
                                 from  pkcgbhol b
                                where  :holdkind = b.holdkind
                                  and  a.bonkind = b.bonkind
                                  and  (giveamt  >= amtfr and giveamt < amtto)
                               )
                where  bonyymm  = :bonyymm
                  and  bonkind  = :bonkind
                  and  (bonkind, :holdkind) in (select bonkind, holdkind
                                                  from  pkcgbhol); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas a  set holdrate=(select nvl(b\
.holdrate,0)  from pkcgbhol b where ((:b0=b.holdkind and a.bonkind=b.bonkind)\
 and (giveamt>=amtfr and giveamt<amtto))) where ((bonyymm=:b1 and bonkind=:b2\
) and (bonkind,:b0) in (select bonkind ,holdkind  from pkcgbhol ))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1286;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[0] = (unsigned long )2;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[3] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.6.1 유보율 설정3");
                    sprintf(log_buff, "3.6.1 유보율 설정3"); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    error_quit("작업실패...");
               }
               break;
          }
          case '4' :  /* 직급+금액별 유보율 */
          {
               /* EXEC SQL
               update  pkmgbmas a
               set  holdrate = 
                                (
                                select  nvl(b.holdrate,0)
                                 from   pkcgbhol b
                                where   :holdkind = b.holdkind
                                  and   a.bonkind  = b.bonkind
                                  and   (a.paycl >= payclfr and a.paycl < payclto)
                                  and   (giveamt >= amtfr and giveamt < amtto)
                                )
               where  bonyymm = :bonyymm
                 and  bonkind  = :bonkind
                 and  (bonkind, :holdkind) in (select  bonkind, holdkind
                                                 from  pkcgbhol); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pkmgbmas a  set holdrate=(select nvl(b\
.holdrate,0)  from pkcgbhol b where (((:b0=b.holdkind and a.bonkind=b.bonkind\
) and (a.paycl>=payclfr and a.paycl<payclto)) and (giveamt>=amtfr and giveamt\
<amtto))) where ((bonyymm=:b1 and bonkind=:b2) and (bonkind,:b0) in (select b\
onkind ,holdkind  from pkcgbhol ))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1317;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[0] = (unsigned long )2;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[2] = (unsigned long )2;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)holdkind;
               sqlstm.sqhstl[3] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.6.1 유보율 설정4");
                    sprintf(log_buff, "3.6.1 유보율 설정4"); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    error_quit("작업실패...");
               }
          }
     }
   
     /* 3.6.2 유보액 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  holdamt = floor(giveamt * holdrate /100) +
             decode(:holdkind,'1',decode(:b_holdamt,0,0,:b_holdamt),0)
      where  bonyymm  = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set holdamt=(floor(((giveamt* holdrate\
)/100))+decode(:b0,'1',decode(:b1,0,0,:b1),0)) where (bonyymm=:b3 and bonkind\
=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1348;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)holdkind;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&b_holdamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&b_holdamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[4] = (unsigned long )2;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"3.6.2 유보액 설정");
          sprintf(log_buff, "3.6.2 유보율 설정1"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
     
     /* 3.7 실지급액 설정 */
     /* EXEC SQL
     update  pkmgbmas
        set  realamt  = giveamt - holdamt
      where  bonyymm  = :bonyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmgbmas  set realamt=(giveamt-holdamt) where (b\
onyymm=:b0 and bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1383;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"3.7 실지급액 설정");
          sprintf(log_buff, "3.7 실지급액 설정"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
}

/************************************************************
  시작일과 종료일까지의 기간을 일단위로 구하는 함수.  
 *************************************************************/
float  get_days(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
          float  result;
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
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select ((TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD'\
))+1) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1406;
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

/*
void  make_report()
{
EXEC SQL BEGIN DECLARE SECTION;
  float  r_inwon;
  float  s_inwon;
  float  t_inwon;

  float  r_excnt;
  float  s_excnt;
  float  t_excnt;

  float  r_midcnt;
  float  s_midnt;
  float  t_midcnt;

  float  r_sucnt;
  float  s_sunt;
  float  t_sucnt;
  
  char  codename[20+1]  = "";
EXEC SQL END DECLARE SECTION;  

  
  EXEC SQL
  SELECT  codename
  INTO  :codename
  FROM  PYCODE
  WHERE  CODEID = 'K310' AND CODENO = :bonkind;
  if (sqlca.sqlcode != 0) {
   print_errmsg(sqlca.sqlcode,"상여구분코드 읽기오류");
   error_quit("작업실패...");
  }
  
  for (i=0; i<COL_END; i++) 
  {
   if (i >= COL_HOME)
     sprintf(msg+i,"=");
   else
     sprintf(msg+i," ");
  }
  printf("%s\n",msg);
  printf("%s\n",msg);

  for (i=0; i<COL_HOME; i++)
   sprintf(msg+i," ");
  sprintf(msg+i,"      <%.4s> 년 <%.2s> %20s  계산내역총계",bonyymm,bonyymm+4,codename);
  printf("%s\n",msg);
  for (i=0; i<COL_END; i++) 
  {
   if (i >= COL_HOME)
     sprintf(msg+i,"=");
   else
     sprintf(msg+i," ");
  }
  printf("%s\n",msg);
  printf("%s\n",msg);

  printf("\n\n",msg);
  

  printf("     1. 인원\n\n");
  for (i=0; i<COL_END; i++) 
  {
   if (i >= COL_HOME)
     sprintf(msg+i,"-");
   else
     sprintf(msg+i," ");
  }
  printf("%s\n",msg);

  for (i=0; i<COL_HOME; i++)
   sprintf(msg+i," ");
  sprintf(msg+i,");
  printf("%s\n",msg);
  for (i=0; i<COL_END; i++) 
  {
   if (i >= COL_HOME)
     sprintf(msg+i,"=");
   else
     sprintf(msg+i," ");
  }
  printf("%s\n",msg);
  printf("%s\n",msg);
  
}

*/


/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1433;
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
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1474;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
