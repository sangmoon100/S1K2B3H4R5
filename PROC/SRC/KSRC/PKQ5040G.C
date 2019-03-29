
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
    "pkq5040g.pc"
};


static unsigned int sqlctx = 154323;


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
   unsigned char  *sqhstv[42];
   unsigned long  sqhstl[42];
            int   sqhsts[42];
            short *sqindv[42];
            int   sqinds[42];
   unsigned long  sqharm[42];
   unsigned long  *sqharc[42];
   unsigned short  sqadto[42];
   unsigned short  sqtdso[42];
} sqlstm = {12,42};

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

 static char *sq0002 = 
"select NVL(TAXPAYFR,0) ,NVL(TAXPAYTO,0) ,NVL(TAXRATE,0) ,NVL(YEARDED,0)  fr\
om PKCPTAX where TAXNUM=(select CTAXNUM  from PKCPBAS )           ";

 static char *sq0014 = 
"select A.* , case  when MRFRDATE_CALC<='20121231' then MRFRDATE_CALC else '\
'  end  MRFRDATE_2012 , case  when MRFRDATE_CALC<='20121231' then LEAST(MRTOD\
ATE_CALC,'20121231') else ''  end  MRTODATE_2012 , case  when MRTODATE_CALC>=\
'20130101' then GREATEST(MRFRDATE_CALC,'20130101') else ''  end  MRFRDATE_201\
3 , case  when MRTODATE_CALC>='20130101' then MRTODATE_CALC else ''  end  MRT\
ODATE_2013  from (select EMPNO ,MRFRDATE ,MRTODATE , case  when BRETFRDAY is \
 not null  then LEAST(MRFRDATE,BRETFRDAY) else MRFRDATE  end  MRFRDATE_CALC ,\
 case  when BRETTODAY is  not null  then GREATEST(MRTODATE,BRETTODAY) else MR\
TODATE  end  MRTODATE_CALC  from PKMMRMAS where (EMPNO>=:b0 and EMPNO<=:b1)) \
A            ";

 static char *sq0018 = 
"select empno ,upper(nvl(ovtmyn,'n'))  from PKMMRMAS where ((empno>=:b0 and \
empno<=:b1) and paycl>='C11') order by empno            ";

 static char *sq0030 = 
"select EMPNO ,REALYY_CALC ,REALYY_2012 ,REALYY_2013 ,BRETINTAX ,RETAMTSUM ,\
FIXDED ,LEAST(GREATEST((RETAMTSUM-FIXDED),0),CONDED) CONDED ,RINDED ,GREATEST\
((RETAMTSUM-RINDED),0) TAXSTAMT  from (select A.* ,RETUTIL.GET_FIXDED(RETAMTS\
UM) FIXDED ,RETUTIL.GET_CONDED(REALYY_CALC) CONDED ,RETUTIL.GET_RINDED(RETAMT\
SUM,REALYY_CALC) RINDED ,GREATEST((RETAMTSUM-RETUTIL.GET_RINDED(RETAMTSUM,REA\
LYY_CALC)),0) TAXSTAMT  from (select EMPNO ,NVL(REALYY_CALC,0) REALYY_CALC ,N\
VL(REALYY_2012,0) REALYY_2012 ,NVL(REALYY_2013,0) REALYY_2013 ,NVL(BRETINTAX,\
0) BRETINTAX ,(NVL(RETAMT,0)+NVL(BRETAMT,0)) RETAMTSUM  from PKMMRMAS where (\
EMPNO>=:b0 and EMPNO<=:b1)) A )            ";

 static char *sq0041 = 
"select EMPNO ,RETYY ,RETAMT  from PKMMRMAS where (EMPNO>=:b0 and EMPNO<=:b1\
) order by RETYY,EMPNO            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,253,0,0,0,0,0,1,0,
20,0,0,2,141,0,9,306,0,0,0,0,0,1,0,
35,0,0,2,0,0,13,316,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
66,0,0,2,0,0,15,329,0,0,0,0,0,1,0,
81,0,0,3,464,0,4,363,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,1,4,0,0,1,3,0,0,1,3,0,0,
132,0,0,4,575,0,4,383,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
183,0,0,5,69,0,4,408,0,0,2,1,0,1,0,2,3,0,0,1,97,0,0,
206,0,0,6,51,0,2,414,0,0,1,1,0,1,0,1,97,0,0,
225,0,0,7,22,0,2,427,0,0,0,0,0,1,0,
240,0,0,8,56,0,2,437,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
263,0,0,9,417,0,3,449,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
294,0,0,10,162,0,5,476,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
317,0,0,11,420,0,4,502,0,0,9,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,
3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
368,0,0,12,463,0,5,524,0,0,0,0,0,1,0,
383,0,0,13,120,0,5,548,0,0,0,0,0,1,0,
398,0,0,14,704,0,9,679,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
421,0,0,14,0,0,13,683,0,0,9,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
472,0,0,14,0,0,15,689,0,0,0,0,0,1,0,
487,0,0,15,586,0,5,720,0,0,37,37,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,97,0,0,
650,0,0,16,42,0,4,902,0,0,1,0,0,1,0,2,4,0,0,
669,0,0,17,93,0,5,907,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
692,0,0,18,131,0,9,930,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
715,0,0,18,0,0,13,940,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
738,0,0,18,0,0,15,944,0,0,0,0,0,1,0,
753,0,0,19,61,0,5,968,0,0,3,3,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,
780,0,0,20,61,0,5,980,0,0,3,3,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,
807,0,0,21,237,0,5,997,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
830,0,0,22,226,0,5,1017,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
853,0,0,23,91,0,5,1034,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
876,0,0,24,53,0,4,1057,0,0,2,0,0,1,0,2,97,0,0,2,4,0,0,
899,0,0,25,95,0,5,1076,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
922,0,0,26,260,0,5,1092,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
953,0,0,27,104,0,5,1114,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
976,0,0,28,246,0,5,1130,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
999,0,0,29,102,0,5,1136,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1022,0,0,30,657,0,9,1304,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1045,0,0,30,0,0,13,1308,0,0,10,0,0,1,0,2,97,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
1100,0,0,30,0,0,15,1313,0,0,0,0,0,1,0,
1115,0,0,30,0,0,15,1321,0,0,0,0,0,1,0,
1130,0,0,31,216,0,4,1361,0,0,7,5,0,1,0,1,97,0,0,2,4,0,0,2,4,0,0,1,97,0,0,1,4,0,
0,1,4,0,0,1,3,0,0,
1173,0,0,32,219,0,4,1374,0,0,7,4,0,1,0,1,97,0,0,1,3,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,1,4,0,0,1,4,0,0,
1216,0,0,33,87,0,4,1390,0,0,4,3,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,2,4,0,0,
1247,0,0,34,800,0,5,1413,0,0,42,42,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,4,0,0,1,97,0,0,
1430,0,0,35,83,0,5,1512,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1453,0,0,36,83,0,5,1523,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1476,0,0,37,98,0,5,1533,0,0,0,0,0,1,0,
1491,0,0,38,127,0,5,1543,0,0,1,1,0,1,0,1,97,0,0,
1510,0,0,39,240,0,5,1563,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1533,0,0,40,182,0,5,1583,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1556,0,0,41,109,0,9,1620,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1579,0,0,41,0,0,13,1629,0,0,3,0,0,1,0,2,97,0,0,2,3,0,0,2,3,0,0,
1606,0,0,42,71,0,5,1643,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
1633,0,0,43,50,0,3,1660,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1674,0,0,44,0,0,29,1670,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ5040G(퇴직중간 정산 생성/계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 윤 형식
 Version        : 1.00
 Date           : 1998.02.17

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1998.02.17         윤 형식         최초개발본      설계명세서
   
[2003.08.11] [강륜종 추가]  임원 평균임금/지급율 계산 방식이 pkq5090g.pc 에 반영된 내용이 반영이 되어 있지 않아 추가함.
   31.00      2001.03.13         유효성        임원 연봉제에 따른 평균임금 계산방법 변경
                                               임원 평균임금= (총연봉+1년분중식비)/12
   32.00      2002.06.21         유효성        임원 퇴직지급율 계산시 직위별 재임기간으로 
                                               산정하게 제도 변경됨
[2003.08.11] [강륜종 추가 End........................................]

   32.01      2004.02.24         강륜종        Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. 
   33.00      2004.10.12       강륜종(dsa2000) 중간정산 여러번 하는 사원을 위한 세금 계산로직 추가.   
   34.00      2004.12.         강륜종(dsa2000) Rexec대체 서비스를 위한 수정작업.       
   34.01      2005.01.13       dsa2000         퇴직세액공제   2005년부터 폐지   
   34.02      2006.03.07       dsa2000         퇴직소득공제 세율변경 (50% => 45%)
==================================================================================================================*/ 

/*=============================================================================
user lib : 평균임금 구하는...
  lib_name : hperlib.a
  lib_src  : avgpay.pc
  lib_function_name  : get_mr_avgpay(
      p_empno,
      t_baseyymm,
      &avgpay1, * 초과근무수당 100%적용 평균임금*
      &avgpay2, * 초과근무수당 상한값 적용평균임금* 
      &ovtmamt1,* 초과근무수당 100%  *   
      &ovtmamt2)* 초과근무수당 상한값*   
============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
/*#include "mis.h"*/
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS -1*/
#define  FAIL        -2
/*#define  HOMEDIR  "/hper/insa"    Dsa2000 추가*/

/* 함수의 Proto type 선언 */
void Make_PKMMRMAS();
void Calc_Retintax();
void Calc_Avggross();
void Calc_Retrealamt();
void Calc_Retamt();

/* 전역 변수 선언 */
/* EXEC SQL BEGIN DECLARE SECTION ; */ 

     char   g_mrtodate[8+1] = "";  /* 중간 정산 기산일 to */
     char   g_isall[1+1]    = "";  /* 전체 삭제 여부      */
     char   g_frempno[4+1]  = "";  /* 사번from            */
     char   g_toempno[4+1]  = "";  /* 사번to              */
     char   g_workemp[4+1]  = "";  /* 작업사번            */

/*2012년 이전 근속년수 추가 시작 2013.02.18*/     
     char    empno[5];
     char    mrfrdate[9];
     char    mrtodate[9];
     char    bretfrday[9];     
     int     dutydd;
     int     dutymm;     
     int     exdd; 
     int     realdd;    
     int     realmm;    
     int     realyy;    
          
     int     retdd;    
     int     retmm;    
     int     retyy;    

     int     dutydd2012;  
     int     exdd2012;    

     int     retdd2012;
     int     retmm2012;
     int     retyy2012;     

     int     retyy2013; 
     
    double avgtaxstamt1;    
    double rettaxrate1;
    double retavgtax1;
    double retcalctax1;
        

/*정산(합산) 변수*/
     char    mrfrdate_calc[9];
     char    mrtodate_calc[9];          
     int     dutydd_calc;  
     int     dutymm_calc;       
     int     exdd_calc;    
     int     realdd_calc;
     int     realmm_calc;
     int     realyy_calc;   

    double retamtsum;             
    double fixded; 
    double conded; 
    double rinded; 
    double taxstamt;
    double avgtaxstamt;    
    double retavgtaxstamt;    
    double rettaxrate;
    double retavgtax;
    double retavgcalctax;    
    double retcalctax;
    
    double calcintax;
    double calcjutax;
        
    double retintax;
    double retjutax;     
    
    double bretintax;

 /*2012.12.31 이전 변수*/
     char    mrfrdate_2012[9];
     char    mrtodate_2012[9];          
     int     dutydd_2012;  
     int     dutymm_2012;       
     int     exdd_2012;    
     int     realdd_2012;
     int     realmm_2012;
     int     realyy_2012;   

    double taxstamt_2012; 
    double avgtaxstamt_2012;    
    double retavgtaxstamt_2012;    
    double rettaxrate_2012;
    double retavgtax_2012;
    double retavgcalctax_2012;    
    double retcalctax_2012;
    double retintax_2012;       
     
/*2013.01.01 이전 변수*/     
     char    mrfrdate_2013[9];
     char    mrtodate_2013[9];          
     int     dutydd_2013;  
     int     dutymm_2013;       
     int     exdd_2013;    
     int     realdd_2013;
     int     realmm_2013;
     int     realyy_2013;    
     
    double taxstamt_2013; 
    double avgtaxstamt_2013;    
    double retavgtaxstamt_2013;    
    double rettaxrate_2013;
    double retavgtax_2013;
    double retavgcalctax_2013;    
    double retcalctax_2013;
    double retintax_2013;    
    
    double change_pay_2016     ;  //2015.12.15 eyha add
    double change_payded_2016  ;  //2015.12.15 eyha add         
    double taxstamt_2016       ;  //2015.12.15 eyha add    
    double rettaxrate_2016     ;  //2015.12.15 eyha add    
    double retavgtax_2016      ;  //2015.12.15 eyha add
    double retcalctax_2016     ;  //2015.12.15 eyha add
    double retintax_2016       ;  //2015.12.15 eyha add
    double retintax_calc       ;  //2015.12.15 eyha add                        
    

    struct
    {      double taxfr   ;
           double taxto   ;
           double taxrate ;
           double yearded ;
    } taxtbl[10];
     
/*2012년 이전 근속년수 추가 종료 2013.02.18*/     
     
/* EXEC SQL END DECLARE SECTION ; */ 


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


int     id;

/*Dsa2000 추가*/
char    cmdline[256];
/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 
int  taxtblcnt=0;
int  taxtblidx=0;

FILE *fp = stdout;

void main(int argc,char *argv[])
{
     char FL_file[255];
     char *HOMEDIR;
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/proc/");
     
     if  (argc != 8) {   /* /hper8/HINSA/proc/bin/Kbin/pkq5040g 20161231 1 0000 zzzz D006 pkq5040g 2004110100000 */  
          printf("[Usage] : pkq5040g 1.중간정산기산일TO 2. 1 or 0(전체) 3.사번FROM 4.사번TO 5.작업사번 6.프로그램ID 7.시작시간\n");
          exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq5040g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     strcpy(g_mrtodate,argv[1]);
     strcpy(g_isall   ,argv[2]);
     strcpy(g_frempno ,argv[3]);
     strcpy(g_toempno ,argv[4]);
     strcpy(g_workemp ,argv[5]);
     
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"퇴직중간 정산 생성/계산 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[5]);
     strcpy(log_progid,   argv[6]);
     strcpy(log_rundate,  argv[7]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     /* EXEC SQL LOCK TABLE PKMMRMAS
       IN EXCLUSIVE MODE NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKMMRMAS IN EXCLUSIVE MODE NOWAIT";
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
          sprintf(log_buff, "다른 사용자가 점유 사용중...\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("다른 사용자가 점유 사용중...\n");
     }
     
     
     /**************************************
       2003.8.11  강륜종(Dsa2000) 추가  :   임원 퇴직지급율 계산 프로그램 call   : 2004.10.12.  임원은 계산 안하므로 막음..
     ***************************************
     memset(cmdline,'\0',256);                     
     sprintf(cmdline,"%s/bin/Kbin/pkq5100g %.8s %s %s %s %s",
        HOMEDIR,g_mrtodate,g_frempno,g_toempno,g_workemp,argv[6]);
     system(cmdline);
      Dsa2000 End ================================================================== */                                
     
     /* 6.3.1 생성 처리 Logic */
     /* 2008.05.15 퇴직중간정산처리 이외에는 동작가능하도록 */
     if(strncmp(g_mrtodate,"20080430",8)!=0) Make_PKMMRMAS();
     
     /* 6.4.1 퇴직금 계산 Logic */
     Calc_Retamt();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [ 작 업 성 공 ] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [작업 성공] =====\n");
     }
            
     return;
}
/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()
{
     int i=0;

     /* EXEC SQL DECLARE ctax CURSOR FOR
     SELECT NVL(TAXPAYFR,0), NVL(TAXPAYTO,0), NVL(TAXRATE,0), NVL(YEARDED,0)
       FROM PKCPTAX
      WHERE TAXNUM = (Select CTAXNUM From PKCPBAS); */ 


     /* EXEC SQL OPEN ctax; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0002;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
           Write_batlog(seqno++, "연세율표  fetch Error");  
           exit(1);
     }

     while(1)
     {
          /* EXEC SQL FETCH ctax INTO
          :taxtbl[i].taxfr,     :taxtbl[i].taxto,
          :taxtbl[i].taxrate,   :taxtbl[i].yearded; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )35;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(taxtbl[i].taxfr);
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(taxtbl[i].taxto);
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(taxtbl[i].taxrate);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(taxtbl[i].yearded);
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




          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
            Write_batlog(seqno++, "연말정산 기초자료   read Error");  
            exit(1);
          }

          if (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close ctax; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )66;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               taxtblcnt = i;
               break;
          }
          i++;
     }
}


double GetTax(double taxlevel)
{
     int i;
     double res;
     
     if (taxlevel <= 0 )
       return 0 ;
     
     for (i=0 ;i <taxtblcnt ; ++i)
     {
          if ((taxtbl[i].taxfr < taxlevel) && (taxtbl[i].taxto >= taxlevel))
          {
                res = taxlevel * taxtbl[i].taxrate / 100;
                res = res - taxtbl[i].yearded;
                taxtblidx = i;
               return res;
          }
     }
}

CalcTax2012(   int  m_realyy_calc,        int  m_realyy_2012,         double  m_taxstamt_2012,   
            double *m_avgtaxstamt_2012,double *m_retavgtaxstamt_2012,    
            double *m_rettaxrate_2012, double *m_retavgtax_2012,      double *m_retavgcalctax_2012,    
            double *m_retcalctax_2012)
{
    /* EXEC SQL    
         SELECT AVGTAXSTAMT_2012,
                RETAVGTAXSTAMT_2012,
                RETUTIL2.GET_RETTAXRATE(AVGTAXSTAMT_2012)             RETTAXRATE_2012,
                0                                                     RETAVGTAX_2012,
                RETUTIL2.GET_RETAVGTAX(AVGTAXSTAMT_2012)              RETAVGCALCTAX_2012,
               (RETUTIL2.GET_RETAVGTAX(AVGTAXSTAMT_2012)*REALYY_2012) RETCALCTAX_2012   
          INTO :m_avgtaxstamt_2012[0], :m_retavgtaxstamt_2012[0], :m_rettaxrate_2012[0], :m_retavgtax_2012[0], :m_retavgcalctax_2012[0], :m_retcalctax_2012[0]
          FROM (SELECT A.*,
                       FLOOR(TAXSTAMT_2012/REALYY_2012) AVGTAXSTAMT_2012,
                       0 RETAVGTAXSTAMT_2012
                  FROM (SELECT :m_taxstamt_2012 TAXSTAMT_2012, :m_realyy_calc REALYY_CALC, :m_realyy_2012 REALYY_2012 FROM DUAL)A
               )A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select AVGTAXSTAMT_2012 ,RETAVGTAXSTAMT_2012 ,RETUTIL2.G\
ET_RETTAXRATE(AVGTAXSTAMT_2012) RETTAXRATE_2012 ,0 RETAVGTAX_2012 ,RETUTIL2.G\
ET_RETAVGTAX(AVGTAXSTAMT_2012) RETAVGCALCTAX_2012 ,(RETUTIL2.GET_RETAVGTAX(AV\
GTAXSTAMT_2012)* REALYY_2012) RETCALCTAX_2012 into :b0,:b1,:b2,:b3,:b4,:b5  f\
rom (select A.* ,FLOOR((TAXSTAMT_2012/REALYY_2012)) AVGTAXSTAMT_2012 ,0 RETAV\
GTAXSTAMT_2012  from (select :b6 TAXSTAMT_2012 ,:b7 REALYY_CALC ,:b8 REALYY_2\
012  from DUAL ) A ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )81;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2012[0];
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2012[0];
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2012[0];
    sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2012[0];
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2012[0];
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2012[0];
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2012;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2012;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}

CalcTax2013(   int  m_realyy_calc,        int  m_realyy_2013,         double m_taxstamt_2013,   
            double *m_avgtaxstamt_2013,double *m_retavgtaxstamt_2013,    
            double *m_rettaxrate_2013, double *m_retavgtax_2013,      double *m_retavgcalctax_2013,    
            double *m_retcalctax_2013)
{
    /* EXEC SQL    
         SELECT AVGTAXSTAMT_2013,
                RETAVGTAXSTAMT_2013,
                RETUTIL2.GET_RETTAXRATE(RETAVGTAXSTAMT_2013)          RETTAXRATE_2013,
                RETUTIL2.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)           RETAVGTAX_2013,
                FLOOR(RETUTIL2.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5) RETAVGCALCTAX_2013,
               (FLOOR(RETUTIL2.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5)*REALYY_2013) RETCALCTAX_2013   
          INTO :m_avgtaxstamt_2013[0], :m_retavgtaxstamt_2013[0], :m_rettaxrate_2013[0], :m_retavgtax_2013[0], :m_retavgcalctax_2013[0], :m_retcalctax_2013[0]
          FROM (SELECT A.*,
                       FLOOR(TAXSTAMT_2013/REALYY_2013) AVGTAXSTAMT_2013,
                       FLOOR(TAXSTAMT_2013/REALYY_2013)*5 RETAVGTAXSTAMT_2013
                  FROM (SELECT :m_taxstamt_2013 TAXSTAMT_2013, :m_realyy_calc REALYY_CALC, :m_realyy_2013 REALYY_2013 FROM DUAL)A
               )A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select AVGTAXSTAMT_2013 ,RETAVGTAXSTAMT_2013 ,RETUTIL2.G\
ET_RETTAXRATE(RETAVGTAXSTAMT_2013) RETTAXRATE_2013 ,RETUTIL2.GET_RETAVGTAX(RE\
TAVGTAXSTAMT_2013) RETAVGTAX_2013 ,FLOOR((RETUTIL2.GET_RETAVGTAX(RETAVGTAXSTA\
MT_2013)/5)) RETAVGCALCTAX_2013 ,(FLOOR((RETUTIL2.GET_RETAVGTAX(RETAVGTAXSTAM\
T_2013)/5))* REALYY_2013) RETCALCTAX_2013 into :b0,:b1,:b2,:b3,:b4,:b5  from \
(select A.* ,FLOOR((TAXSTAMT_2013/REALYY_2013)) AVGTAXSTAMT_2013 ,(FLOOR((TAX\
STAMT_2013/REALYY_2013))* 5) RETAVGTAXSTAMT_2013  from (select :b6 TAXSTAMT_2\
013 ,:b7 REALYY_CALC ,:b8 REALYY_2013  from DUAL ) A ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )132;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2013[0];
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2013[0];
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2013[0];
    sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2013[0];
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2013[0];
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2013[0];
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2013;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2013;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}


/***************************************************************************
 6.3.1 생성 처리 Logic
***************************************************************************/
void Make_PKMMRMAS()
{
     int i ;
     
     i = 0;
     
     /* EXEC SQL
     SELECT COUNT(*) 
       into :i
       FROM PKMMRMAS
      WHERE NVL(MRTODATE,' ') <> :g_mrtodate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKMMRMAS where NVL(MRTO\
DATE,' ')<>:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )183;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&i;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_mrtodate;
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

 
     
     /* EXEC SQL
     DELETE FROM PKMMRMAS
      WHERE NVL(MRTODATE,' ') <> :g_mrtodate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKMMRMAS  where NVL(MRTODATE,' ')<>:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )206;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
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

 
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("삭제중...\n");
     }
     
     
     /*  6.3.1.1 중간정산 마스터 삭제 */
     if  (strcmp(g_isall,"0") == 0) /* 전체삭제 */
     {
          /* EXEC SQL
          DELETE FROM PKMMRMAS; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from PKMMRMAS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )225;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               error_quit("삭제중...\n");
          }
     }
     else
     {
          /* EXEC SQL
          DELETE FROM PKMMRMAS
          WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from PKMMRMAS  where (EMPNO>=:b0 and EMPNO\
<=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )240;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


          
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               error_quit("삭제중...\n");
          }
     }
     
     /* 6.3.1.2 중간정산신청에서 중간정산마스터로 insert */
     /* 갯수 체크 */
     /* EXEC SQL
     INSERT INTO PKMMRMAS (EMPNO, KORNAME, JUMINID, PAYCL, PAYGR, PAYRA, PSTATE,
            ORGNUM, DEPTCODE, EMPDATE, CALCYN, APPDATE,
            MRFRDATE, MRTODATE, OVTMYN, WRITETIME, WRITEMAN)
     SELECT EMPNO, KORNAME, JUMINID, PAYCL, PAYGR, PAYRA, PSTATE,
            ORGNUM, DEPTCODE, EMPDATE, CALCYN, APPDATE,
            MRFRDATE, MRTODATE, OVTMYN, TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), :g_workemp
       FROM PKMMRAPP
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND MRTODATE = :g_mrtodate
        AND UPPER(CALCYN) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMMRMAS (EMPNO,KORNAME,JUMINID,PAYCL,PAYGR\
,PAYRA,PSTATE,ORGNUM,DEPTCODE,EMPDATE,CALCYN,APPDATE,MRFRDATE,MRTODATE,OVTMYN\
,WRITETIME,WRITEMAN)select EMPNO ,KORNAME ,JUMINID ,PAYCL ,PAYGR ,PAYRA ,PSTA\
TE ,ORGNUM ,DEPTCODE ,EMPDATE ,CALCYN ,APPDATE ,MRFRDATE ,MRTODATE ,OVTMYN ,T\
O_CHAR(SYSDATE,'YYYYMMDDHH24MISS') ,:b0  from PKMMRAPP where (((EMPNO>=:b1 an\
d EMPNO<=:b2) and MRTODATE=:b3) and UPPER(CALCYN)='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )263;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_workemp;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
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
          error_quit("추출중...\n");
     }
     
     /* 6.3.1.3 급여마스터로 부터 추가인적사항을 setting */
     /* 2017.09.20 eyha 금융기관 코드 사이즈 변경 적용 
     EXEC SQL
     UPDATE PKMMRMAS A SET
            (PAYBANK, PAYACNT) =
            (SELECT NVL(PAYBANK,'99'), NVL(PAYACNT,'NULL')
               FROM PKMPMAS B
              WHERE A.EMPNO = B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno;  */
      
     /* EXEC SQL
     UPDATE PKMMRMAS A SET
            (PAYBANK, PAYACNT) =
            (SELECT NVL(PAYBANK,'NULL'), NVL(PAYACNT,'NULL')
               FROM PKMPMAS B
              WHERE A.EMPNO = B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS A  set (PAYBANK,PAYACNT)=(select NVL(PA\
YBANK,'NULL') ,NVL(PAYACNT,'NULL')  from PKMPMAS B where A.EMPNO=B.EMPNO) whe\
re (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )294;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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

      
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("인사사항 갱신중...\n");
     }
     
/*  6.3.1.4 은행명 없는 사원
    EXEC SQL DECLARE cs_paybank CURSOR FOR
        SELECT EMPNO, KORNAME
        FROM PKMMRAMS
        WHERE PAYBANK = '99'
           OR PAYBANK NOT IN (SELECT CODENO FROM PYCCODE C
                              WHERE C.CODEID = 'K930')
           OR PAYACNT = 'NULL'
        ORDER BY EMPNO ;  */
}

int get_RealYYMMDD(char *m_empno,char *m_empdate,char *m_retdate, int *m_dutydd, int *m_dutymm, int *m_exdd, int *m_realdd, int *m_realmm, int *m_realyy)
{
    /* EXEC SQL
         SELECT  HPER.RETUTIL2.GET_DUTYDD(       EMPDATE, RETDATE)   DUTYDD                                                                                    
                ,HPER.RETUTIL2.GET_DUTYMM(       EMPDATE, RETDATE)   DUTYMM
                ,HPER.RETUTIL2.GET_EXDD  (EMPNO, EMPDATE, RETDATE)     EXDD                                                                                    
                ,HPER.RETUTIL2.GET_REALDD(EMPNO, EMPDATE, RETDATE)   REALDD
                ,HPER.RETUTIL2.GET_REALMM(EMPNO, EMPDATE, RETDATE)   REALMM
                ,HPER.RETUTIL2.GET_REALYY(EMPNO, EMPDATE, RETDATE)   REALYY
           INTO m_dutydd, m_dutymm, m_exdd, m_realdd, m_realmm, m_realyy                
           FROM (SELECT :m_empno EMPNO, :m_empdate EMPDATE, :m_retdate RETDATE FROM DUAL)A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select HPER.RETUTIL2.GET_DUTYDD(EMPDATE,RETDATE) DUTYDD \
,HPER.RETUTIL2.GET_DUTYMM(EMPDATE,RETDATE) DUTYMM ,HPER.RETUTIL2.GET_EXDD(EMP\
NO,EMPDATE,RETDATE) EXDD ,HPER.RETUTIL2.GET_REALDD(EMPNO,EMPDATE,RETDATE) REA\
LDD ,HPER.RETUTIL2.GET_REALMM(EMPNO,EMPDATE,RETDATE) REALMM ,HPER.RETUTIL2.GE\
T_REALYY(EMPNO,EMPDATE,RETDATE) REALYY into :b0,:b1,:b2,:b3,:b4,:b5  from (se\
lect :b6 EMPNO ,:b7 EMPDATE ,:b8 RETDATE  from DUAL ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )317;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)m_dutydd;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)m_dutymm;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)m_exdd;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)m_realdd;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)m_realmm;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)m_realyy;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)m_empno;
    sqlstm.sqhstl[6] = (unsigned long )0;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)m_empdate;
    sqlstm.sqhstl[7] = (unsigned long )0;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)m_retdate;
    sqlstm.sqhstl[8] = (unsigned long )0;
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


    
    return 0;
}

/***************************************************************************
6.4.1 퇴직금 계산 Logic
***************************************************************************/
void Calc_Retamt()
{
/* dsa2000 추가 2004.10.12  전산처리요청  1년에 여러번 중간정산하는자의 근속기간 및 세금 계산시
                                         기존 정산내역을 포함하여 계산되도록함.*/
        
        /* 종전 중간정산 자료를 종근무지 자료에 입력한다.*/
     /* EXEC SQL
     UPDATE  PKMMRMAS A
        SET (BRETMM     , BRETAMT   ,
             BRETINTAX  , BRETJUTAX ,
             BRETFRDAY  , BRETTODAY ,
             BRETSUBDATE ) =
            (SELECT  SUM(NVL(RETMM   ,0)), SUM(NVL(RETAMT,  0)),
                     SUM(NVL(REALRETINTAX,0)), SUM(NVL(REALRETJUTAX,0)),
                     MIN(MRFRDATE),        MAX(MRTODATE),
                     MAX(SUBDATE)
               FROM  PKHMRHIS B
              WHERE  A.EMPNO = B.EMPNO
                AND  SUBSTR(A.MRTODATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)
              GROUP  BY B.EMPNO )
      WHERE EMPNO IN (SELECT EMPNO 
                        FROM PKHMRHIS B
                       WHERE A.EMPNO = B.EMPNO
                         AND SUBSTR(A.MRTODATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS A  set (BRETMM,BRETAMT,BRETINTAX,BRETJU\
TAX,BRETFRDAY,BRETTODAY,BRETSUBDATE)=(select sum(NVL(RETMM,0)) ,sum(NVL(RETAM\
T,0)) ,sum(NVL(REALRETINTAX,0)) ,sum(NVL(REALRETJUTAX,0)) ,min(MRFRDATE) ,max\
(MRTODATE) ,max(SUBDATE)  from PKHMRHIS B where (A.EMPNO=B.EMPNO and SUBSTR(A\
.MRTODATE,1,4)=SUBSTR(B.MRTODATE,1,4)) group by B.EMPNO) where EMPNO in (sele\
ct EMPNO  from PKHMRHIS B where (A.EMPNO=B.EMPNO and SUBSTR(A.MRTODATE,1,4)=S\
UBSTR(B.MRTODATE,1,4)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )368;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          error_quit(sqlca.sqlcode,"1.2 중간정산자료 setting Error");
     }

     /* EXEC SQL
     UPDATE  PKMMRMAS A
        SET  BRETMM      = NVL(BRETMM    ,0),
             BRETAMT     = NVL(BRETAMT   ,0),
             BRETINTAX   = NVL(BRETINTAX ,0),
             BRETJUTAX   = NVL(BRETJUTAX ,0) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS A  set BRETMM=NVL(BRETMM,0),BRETAMT=NVL\
(BRETAMT,0),BRETINTAX=NVL(BRETINTAX,0),BRETJUTAX=NVL(BRETJUTAX,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )383;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


 
/*2013.02.15.hjku 근속년수 변경 시작 
	ReadTax();        */ 
	
/*입사일, 퇴사일모두 근속일에 포함(+1부분추가) 
     EXEC    SQL
     UPDATE  PKMMRMAS
        SET  dutymm = ceil(months_between(to_date(mrtodate,'YYYYMMDD') + 1,
                                          to_date(mrfrdate,'YYYYMMDD'))),
             dutydd = to_date(mrtodate,'YYYYMMDD')-
                      to_date(mrfrdate,'YYYYMMDD') + 1;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          error_quit(sqlca.sqlcode,"1.3 근속일수 setting Error");
     }
*/     
/* dsa2000 추가 end   2004.10.12.........................................................*/
  
  
    /* 근속기간 계산 
     EXEC SQL
     UPDATE PKMMRMAS 
        SET 
            DUDAYS = to_date(mrtodate,'YYYYMMDD')-to_date(mrfrdate,'YYYYMMDD') + 1
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno;
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("근속기간 계산중...\n");
     }
     */
     /* 근속제외일수 계산 
     EXEC SQL
     UPDATE PKMMRMAS R SET
            EXDD =
                  (SELECT SUM(MONTHS_BETWEEN(
                          TO_DATE(LEAST(X.EXTODATE   ,R.MRTODATE),'YYYYMMDD')+1,  
                          TO_DATE(GREATEST(X.EXFRDATE,R.MRFRDATE),'YYYYMMDD'))*31  )
                     FROM PKHEXDD X
                    WHERE R.EMPNO = X.EMPNO
                      AND UPPER(X.EXFIXYN) = 'Y'
                    GROUP BY R.EMPNO, X.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT R.EMPNO FROM PKHEXDD X, PKMMRMAS R
                       WHERE R.EMPNO = X.EMPNO
                         AND NOT (X.EXFRDATE > R.MRTODATE OR
                                  X.EXTODATE < R.MRFRDATE)
                         AND UPPER(X.EXFIXYN) = 'Y' );
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("근속제외일수 계산중...\n");
     }
     */
     /* 실근속 기간 계산 
     EXEC SQL
     UPDATE PKMMRMAS 
        SET REALDAYS = NVL(DUDAYS,0) - NVL(EXDD,0)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         error_quit("실근속 기간 계산(1)중...\n");
     }
     
     EXEC SQL
     UPDATE PKMMRMAS R SET
            DUTYYY = FLOOR(DUDAYS / 372),
            DUTYMM = FLOOR(MOD(DUDAYS,372) / 31),
            DUTYDD = MOD(MOD(DUDAYS,372),31),
            REALYY = FLOOR(REALDAYS / 372),
            REALMM = FLOOR(MOD(REALDAYS,372) /31),
            REALDD = MOD(MOD(REALDAYS,372),31)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     */
/*     
     EXEC SQL
     UPDATE PKMMRMAS R 
        SET
            RETmm = REALYY * 12 + REALMM + DECODE(REALDD,0,0,1), 
            RETYY = REALYY + DECODE(REALMM+REALDD,0,0,1)         
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          Write_batlog(seqno++, "실근속 기간 계산(2)중...\n"); 
          error_quit("실근속 기간 계산(2)중...\n");
     }


    -- 근속기간 계산 : 년도중 중간정산 받은자...(세금계산을 위한 년수 산출)
     EXEC SQL
     UPDATE PKMMRMAS A
        SET RETYY  = ceil(MONTHS_BETWEEN(TO_DATE(MRTODATE,'YYYYMMDD')+1,
                                         TO_DATE(NVL(BRETFRDAY,MRFRDATE),'YYYYMMDD'))/12)                                 
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO 
                        FROM PKHMRHIS B
                       WHERE A.EMPNO = B.EMPNO
                         AND SUBSTR(A.MRTODATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)) ;         
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          Write_batlog(seqno++, "실근속 기간 계산(3)중...\n"); 
          error_quit("근속기간 계산(3)중...\n");
     }        
===================================================================================*/ 
                       
     /* EXEC    SQL DECLARE c1 CURSOR FOR
         SELECT A.*,
                CASE WHEN MRFRDATE_CALC <='20121231'  THEN MRFRDATE_CALC                      ELSE '' END MRFRDATE_2012,
                CASE WHEN MRFRDATE_CALC <='20121231'  THEN LEAST(MRTODATE_CALC,'20121231')    ELSE '' END MRTODATE_2012,
                CASE WHEN MRTODATE_CALC >='20130101'  THEN GREATEST(MRFRDATE_CALC,'20130101') ELSE '' END MRFRDATE_2013,
                CASE WHEN MRTODATE_CALC >='20130101'  THEN MRTODATE_CALC                      ELSE '' END MRTODATE_2013      
         FROM (           
              SELECT  EMPNO,
                      MRFRDATE, 
                      MRTODATE,
                      CASE WHEN BRETFRDAY IS NOT NULL THEN LEAST   (MRFRDATE,BRETFRDAY)  ELSE MRFRDATE END MRFRDATE_CALC,
                      CASE WHEN BRETTODAY IS NOT NULL THEN GREATEST(MRTODATE,BRETTODAY)  ELSE MRTODATE END MRTODATE_CALC
                FROM  PKMMRMAS WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
             )A; */ 

           

     /* EXEC SQL OPEN  c1 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0014;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )398;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     while(1)
     {
          /* EXEC   SQL FETCH c1
          INTO  :empno, :mrfrdate, :mrtodate, :mrfrdate_calc, :mrtodate_calc,:mrfrdate_2012, :mrtodate_2012,:mrfrdate_2013, :mrtodate_2013; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )421;
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
          sqlstm.sqhstv[1] = (unsigned char  *)mrfrdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)mrtodate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)mrfrdate_calc;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)mrtodate_calc;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)mrfrdate_2012;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)mrtodate_2012;
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)mrfrdate_2013;
          sqlstm.sqhstl[7] = (unsigned long )9;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)mrtodate_2013;
          sqlstm.sqhstl[8] = (unsigned long )9;
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




          if  (sqlca.sqlcode == 1403 )
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )472;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }

          /* 최종분 근속 연수 */
          dutydd = dutymm = exdd = realdd = realmm = realyy = 0;

          get_RealYYMMDD(empno,mrfrdate,mrtodate,&dutydd,&dutymm,&exdd,&realdd,&realmm,&realyy);

          /* 정산(합산) 근속 연수 */
          dutydd_calc = dutymm_calc = exdd_calc = realdd_calc = realmm_calc = realyy_calc = 0;

          get_RealYYMMDD(empno,mrfrdate_calc,mrtodate_calc,&dutydd_calc,&dutymm_calc,&exdd_calc,&realdd_calc,&realmm_calc,&realyy_calc);


          /* 2012.12.31. 이전 근속 연수 */
          dutydd_2012 = dutymm_2012 = exdd_2012 = realdd_2012 = realmm_2012 = realyy_2012 = 0;

          if((strcmp(mrfrdate_2012,"")!=0)&&(strcmp(mrtodate_2012,"")!=0)  )
             get_RealYYMMDD(empno,mrfrdate_2012,mrtodate_2012,&dutydd_2012,&dutymm_2012,&exdd_2012,&realdd_2012,&realmm_2012,&realyy_2012);


          /* 2013.01.01. 이후 근속 연수 */
          dutydd_2013 = dutymm_2013 = exdd_2013 = realdd_2013 = realmm_2013 = realyy_2013 = 0;

          if((strcmp(mrfrdate_2013,"")!=0)&&(strcmp(mrtodate_2013,"")!=0)  )
             get_RealYYMMDD(empno,mrfrdate_2013,mrtodate_2013,&dutydd_2013,&dutymm_2013,&exdd_2013,&realdd_2013,&realmm_2013,&realyy_2013);


          realyy_2013 = realyy_calc - realyy_2012;

          /* EXEC SQL
          UPDATE  PKMMRMAS
             SET    
                     EXDAYS     = :exdd,                             
                     DUDAYS     = :dutydd,
                     REALDAYS   = :realdd,
                     DUTYDD     = :dutydd,
                     DUTYMM     = :dutymm,
                     EXDD       = :exdd,
                     REALDD     = :realdd,
                     REALMM     = :realmm,
                     REALYY     = :realyy,
                     RETMM      = :realmm,
                     RETYY      = :realyy_calc,
                     RETYY2013  = :realyy_2013,
                  MRFRDATE_CALC = :mrfrdate_calc,
                  MRTODATE_CALC = :mrtodate_calc,                      
                    DUTYDD_CALC = :dutydd_calc,
                    DUTYMM_CALC = :dutymm_calc,
                      EXDD_CALC = :exdd_calc,
                    REALDD_CALC = :realdd_calc,
                    REALMM_CALC = :realmm_calc,
                    REALYY_CALC = :realyy_calc,
                  MRFRDATE_2012 = :mrfrdate_2012,
                  MRTODATE_2012 = :mrtodate_2012,                      
                    DUTYDD_2012 = :dutydd_2012,
                    DUTYMM_2012 = :dutymm_2012,
                      EXDD_2012 = :exdd_2012,
                    REALDD_2012 = :realdd_2012,
                    REALMM_2012 = :realmm_2012,
                    REALYY_2012 = :realyy_2012,
                  MRFRDATE_2013 = :mrfrdate_2013,
                  MRTODATE_2013 = :mrtodate_2013,
                    DUTYDD_2013 = :dutydd_2013,
                    DUTYMM_2013 = :dutymm_2013,
                      EXDD_2013 = :exdd_2013,
                    REALDD_2013 = :realdd_2013,
                    REALMM_2013 = :realmm_2013,
                    REALYY_2013 = :realyy_2013                      
           WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMRMAS  set EXDAYS=:b0,DUDAYS=:b1,REALDAY\
S=:b2,DUTYDD=:b1,DUTYMM=:b4,EXDD=:b0,REALDD=:b2,REALMM=:b7,REALYY=:b8,RETMM=:\
b7,RETYY=:b10,RETYY2013=:b11,MRFRDATE_CALC=:b12,MRTODATE_CALC=:b13,DUTYDD_CAL\
C=:b14,DUTYMM_CALC=:b15,EXDD_CALC=:b16,REALDD_CALC=:b17,REALMM_CALC=:b18,REAL\
YY_CALC=:b10,MRFRDATE_2012=:b20,MRTODATE_2012=:b21,DUTYDD_2012=:b22,DUTYMM_20\
12=:b23,EXDD_2012=:b24,REALDD_2012=:b25,REALMM_2012=:b26,REALYY_2012=:b27,MRF\
RDATE_2013=:b28,MRTODATE_2013=:b29,DUTYDD_2013=:b30,DUTYMM_2013=:b31,EXDD_201\
3=:b32,REALDD_2013=:b33,REALMM_2013=:b34,REALYY_2013=:b11 where EMPNO=:b36";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )487;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&dutymm;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&realyy;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)mrfrdate_calc;
          sqlstm.sqhstl[12] = (unsigned long )9;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)mrtodate_calc;
          sqlstm.sqhstl[13] = (unsigned long )9;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&dutydd_calc;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&dutymm_calc;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&exdd_calc;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&realdd_calc;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&realmm_calc;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)mrfrdate_2012;
          sqlstm.sqhstl[20] = (unsigned long )9;
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)mrtodate_2012;
          sqlstm.sqhstl[21] = (unsigned long )9;
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&dutydd_2012;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&dutymm_2012;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&exdd_2012;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&realdd_2012;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&realmm_2012;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)mrfrdate_2013;
          sqlstm.sqhstl[28] = (unsigned long )9;
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)mrtodate_2013;
          sqlstm.sqhstl[29] = (unsigned long )9;
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&dutydd_2013;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&dutymm_2013;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&exdd_2013;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&realdd_2013;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&realmm_2013;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(int);
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


           
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
             Write_batlog(seqno++, "실근속 기간 계산(3)중...\n"); 
             error_quit("근속기간 계산(3)중...\n");
             break;
          }   

     } /* end of while */
      
/*2013.02.15.hjku 근속년수 변경 종료*/

     /* 평균임금/통산임금 계산 */
     Calc_Avggross();
     
     /* 퇴직금 계산 */
     Calc_Retrealamt();
}



/***************************************************************************
 평균임금/통산임금 계산
***************************************************************************/
void Calc_Avggross()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char     before3mon[6+1] = "" ; /*  3개월 전(g_mrtodate포함 3개월)*/
          char     before12mon[6+1] = "" ; /* 12개월 전(g_mrtodate포함12개월)*/
          long int odamt = 0;
          float    avgpay1;
          float    avgpay2;
          float    ovtmamt1;
          float    ovtmamt2;
          float    maxovtmamt;
          char     p_empno[4+1];
          char     ovtmyn[1+1];
     /* EXEC SQL END DECLARE SECTION; */ 

    
     char  t_baseyymm[6+1];
     int  flag;

/* ==============================================================  
    EXEC SQL
        SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'),-2),'YYYYMM'),
               TO_CHAR(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'),-11),'YYYYMM'),
               AVGODAMT
        INTO :before3mon, :before12mon, :odamt
        FROM PKCPBAS;

    if (sqlca.sqlcode != 0)
    {
        error_quit("임시변수 산정중...\n");
    }

    //  3개월 급여합 
    EXEC SQL
        UPDATE PKMMRMAS R SET
            PAY3SUM =
            (SELECT SUM(NVL(BASICAMT,0)+NVL(INFOAMT,0)+NVL(DUTYAMT,0)+
                        NVL(BBASICAMT,0)+NVL(BINFOAMT,0)+NVL(BDUTYAMT,0)+
                        NVL(MATEAMT,0)+NVL(PARTAMT,0)+NVL(CHILDAMT,0)+
                        NVL(OVTMAMT,0)+NVL(SPTMAMT,0)+NVL(MCARAMT,0)+
                        NVL(LICEAMT,0)+NVL(MBONAMT,0)+NVL(SOPAY,0)+
                        DECODE(NVL(ODAMT,0),0,0,:odamt)
                       )
             FROM PKHPHIS H
             WHERE R.EMPNO = H.EMPNO
               AND H.PAYDATE BETWEEN :before3mon AND :g_mrtodate
            )
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        error_quit("3개월 급여합 계산중...\n");
    }

    // 12개월 상여합
    EXEC SQL
        UPDATE PKMMRMAS R SET
            BON12SUM =
            (SELECT SUM(NVL(BONUSAMT,0)+NVL(INCENTAMT,0)+NVL(TRAINAMT,0)+
                        NVL(WINTERAMT,0)+NVL(YBONAMT,0)+ NVL(HOMESUPAMT,0)+
                        NVL(SOBON,0)
                       )
             FROM PKHPHIS H
             WHERE R.EMPNO = H.EMPNO
               AND H.PAYDATE BETWEEN :before12mon AND :g_mrtodate
            )
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        error_quit("12개월 상여합 계산중...\n");
    }

    // 평균 급여, 평균 상여, 평균 임금
    EXEC SQL
        UPDATE PKMMRMAS SET
            AVGPAY   = CEIL(PAY3SUM  / 3),
            AVGBON   = CEIL(BON12SUM /12),
            AVGGROSS = CEIL(PAY3SUM  / 3) + CEIL(BON12SUM /12)
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno;

    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        error_quit("평균 임금 계산중...\n");
    }

    // 통상 임금 
    // 1. 임원 / 정규직 
    EXEC SQL
        UPDATE PKMMRMAS R SET
            COMMONAMT =
            (SELECT NVL(BASICAMT,0) + NVL(INFOAMT,0) + NVL(DUTYAMT,0)
             FROM PKMPMAS P
             WHERE R.EMPNO = P.EMPNO
            )
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        error_quit("통상 임금 계산(1)중...\n");
    }

  // 2. 임시직
    EXEC SQL
        UPDATE PKMMRMAS R SET
            COMMONAMT =
            (SELECT NVL(BASICAMT,0) + NVL(INFOAMT,0) + NVL(DUTYAMT,0)
             FROM PKMPMAS P
             WHERE R.EMPNO = P.EMPNO
            )
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
          AND PAYCL >= 'A' ;

    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        error_quit("통상 임금 계산(2)중...\n");
    }
=============================================================== */

     /* EXEC SQL
     SELECT  MAXOVTMAMT 
       INTO  :maxovtmamt
       FROM  PKCMRBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select MAXOVTMAMT into :b0  from PKCMRBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )650;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&maxovtmamt;
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


     
     /* EXEC SQL
     UPDATE  PKMMRMAS
        SET  PAY3SUM  = 0,
             BON12SUM = 0,
             AVGPAY   = 0,
             AVGBON   = 0
      WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set PAY3SUM=0,BON12SUM=0,AVGPAY=0,AVGB\
ON=0 where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )669;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "급여합, 상여합 NULL 조정중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("급여합, 상여합 NULL 조정중...\n");
     }
     
     /* 평균 급여, 평균 상여, 평균 임금 */  
     sprintf(t_baseyymm,"%.6s",g_mrtodate);
     /* EXEC SQL DECLARE cur1 CURSOR FOR
     SELECT empno, upper(nvl(ovtmyn,'n'))
       FROM PKMMRMAS
      WHERE empno >= :g_frempno and empno <= :g_toempno
      //infra          AND paycl > '09'             /o 2003.8.11. Dsa2000  이사대우까지 임원계산로직 추가 o/
        AND paycl >= 'C11'             /o 2003.8.11. Dsa2000  이사대우까지 임원계산로직 추가 o/
      ORDER BY empno; */ 

     
     /* EXEC SQL OPEN cur1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0018;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )692;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
          Write_batlog(seqno++, "9.5.5.1 평균 임금 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("9.5.5.1 평균 임금 계산중...\n");
     }
     
     while (1)
     {
          /* EXEC SQL  FETCH  cur1
          INTO    :p_empno, :ovtmyn; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )715;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)p_empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)ovtmyn;
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
               /* EXEC SQL CLOSE cur1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )738;
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
               error_quit("9.5.5.2 평균 임금 계산중...\n");
          }
          sprintf(p_empno,"%.4s",p_empno);
          sprintf(ovtmyn,"%.1s",ovtmyn);

          /*  printf("[debug0] : empno=%s,t_baseyymm=%s \n",p_empno,t_baseyymm);               */
          
          if ((flag=get_mr_avgpay(p_empno,t_baseyymm,
               &avgpay1,&avgpay2,&ovtmamt1,&ovtmamt2)) != 0)
          {
               printf("empno : [%s] \n",p_empno);
               error_quit("9.5.5.3 평균 임금 계산중...\n");   
          }
          
          if  (ovtmyn[0] == 'Y') 
          { 
            /* printf("[debug1] : empno=%s,avgpay2=%f,maxovtmamt=%f \n",p_empno,avgpay2, maxovtmamt);              */
          	
               /* EXEC SQL
               update  PKMMRMAS
                  set  avggross = :avgpay2,
                       ovtmamt  = :maxovtmamt /o * 3 3개월 주석 KHT 2009.03 avgpay 에서 3개월 구함. o/
                where  empno = :p_empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMRMAS  set avggross=:b0,ovtmamt=:b1\
 where empno=:b2";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )753;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&avgpay2;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&maxovtmamt;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)p_empno;
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
                    error_quit("9.5.5.4 평균 임금 계산중...\n");
               }
          }
          else
          {
               /* EXEC SQL
               update  PKMMRMAS
                  set  avggross = :avgpay1,
                       ovtmamt  = :ovtmamt1  /o *3 3개월 주석 KHT 2009.03 avgpay 에서 3개월 구함. o/
                where  empno = :p_empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMRMAS  set avggross=:b0,ovtmamt=:b1\
 where empno=:b2";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )780;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&avgpay1;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&ovtmamt1;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)p_empno;
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
                    error_quit("9.5.5.4 **평균 임금 계산중...\n");
               }
          } 
     }
  
/* Dsa2000 추가 ====================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   31.00       2003.08.11         강 륜 종       임원 연봉제에 따른 평균임금,통상임금 계산방법 변경
                                                [임원평균임금=(총연봉+중식비연간총액)/12]
==================================================================================== */
     /* EXEC SQL
     UPDATE PKMMRMAS A
        SET AVGGROSS = ( SELECT CEIL(( TOTPAY + AVGMCARAMT ) /12)
                           FROM PKHYPHIS B, PKCPBAS C
                          WHERE A.EMPNO = B.EMPNO
                            AND B.YEARPAYNUM  = (SELECT TO_CHAR(YEARPAYNUM) FROM PKCPBAS)
                        )  
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
//        AND  <= '09' ;
        AND paycl <= 'A99'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS A  set AVGGROSS=(select CEIL(((TOTPAY+A\
VGMCARAMT)/12))  from PKHYPHIS B ,PKCPBAS C where (A.EMPNO=B.EMPNO and B.YEAR\
PAYNUM=(select TO_CHAR(YEARPAYNUM)  from PKCPBAS ))) where ((EMPNO>=:b0 and E\
MPNO<=:b1) and paycl<='A99')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )807;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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

     
    
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, " 임원 평균 임금 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit(" 임원 평균 임금 계산중...\n");
     }
/* Dsa2000 추가 End ******************************************************************/      


     /* 9.5.6-1 통상 임금 .... 임원 / 정규직 */
     /* EXEC SQL
     UPDATE PKMMRMAS r 
/o      SET commonamt = (select ceil(totpay/18)    (select ceil(realtotpay/23)o/
        SET commonamt = (select CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.12 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
                           from pkhyphis p
                          where r.empno = p.empno 
                            and yearpaynum = (select to_char(yearpaynum) from pkcpbas)  
                        )
      WHERE empno >= :g_frempno and empno <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS r  set commonamt=(select CEIL(((((TOTPA\
Y+TONGAMT1)+TONGAMT2)+TONGAMT3)/12))  from pkhyphis p where (r.empno=p.empno \
and yearpaynum=(select to_char(yearpaynum)  from pkcpbas ))) where (empno>=:b\
0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )830;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.5.6-1 통상 임금 (임원 / 정규직) 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("9.5.6-1 통상 임금 (임원 / 정규직) 계산중...\n");
     }

     /* 기준 임금 */
     /* EXEC SQL
     UPDATE PKMMRMAS 
        SET
            BASEAMT = GREATEST(AVGGROSS,COMMONAMT)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set BASEAMT=GREATEST(AVGGROSS,COMMONAM\
T) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )853;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "기준 임금 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("기준 임금 계산중...\n");
     }
}

/***************************************************************************
 퇴직금 계산
***************************************************************************/
void Calc_Retrealamt()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  taxnum[2+1] = ""  ;
          float jutaxrate   = 0.0 ;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     /* EXEC SQL
          SELECT CTAXNUM, JUTAXRATE
            INTO :taxnum, :jutaxrate
            FROM PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CTAXNUM ,JUTAXRATE into :b0,:b1  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )876;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)taxnum;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&jutaxrate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
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


     
     /* 퇴직금 지급율 직급
        2009.03.27 kth 단수제로 변경 retcl 을 사용 하지 않음.
     EXEC SQL
         UPDATE PKMMRMAS R SET
             RETCL = DECODE(PAYCL,'00','0'||TO_CHAR(PAYGR),'10')
         WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno;
     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         Write_batlog(seqno++, "퇴직금 지급율 직급 계산중...\n"); dsa2000 Rexec 대체
         error_quit("퇴직금 지급율 직급 계산중...\n");
     }*/
     
     /* 9.6.2 퇴직금 지급율 */
     /* EXEC SQL
     UPDATE PKMMRMAS R 
        SET
            RETRATE = NVL(ROUND(R.RETMM/12,2),0.0) /o 누진제에서 단수제로 전환작업 RETRATE ->  ROUND(REALMM/12,2) kth 2009.03.17o/
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS R  set RETRATE=NVL(ROUND((R.RETMM/12),2\
),0.0) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )899;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직금 지급율 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("퇴직금 지급율 계산중...\n");
     }
     
/* Dsa2000  추가 ======================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   32.00      2003.08.11         강륜종         임원 퇴직지급율 계산시 직위별 재임기간으로 산정하게 제도 변경됨
==================================================================================== */
     /* EXEC SQL
     UPDATE PKMMRMAS A
        SET RETRATE = (SELECT NVL(SUM(NVL(B.CLRETRATE,0)),0) 
                         FROM PKHRTDIR B       
                        WHERE A.EMPNO = B.EMPNO
                          AND B.CALCDATE = :g_mrtodate
                        GROUP BY B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO 
                        FROM PKHRTDIR
                       WHERE CALCDATE = :g_mrtodate
      GROUP BY EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS A  set RETRATE=(select NVL(sum(NVL(B.CL\
RETRATE,0)),0)  from PKHRTDIR B where (A.EMPNO=B.EMPNO and B.CALCDATE=:b0) gr\
oup by B.EMPNO) where ((EMPNO>=:b1 and EMPNO<=:b2) and EMPNO in (select EMPNO\
  from PKHRTDIR where CALCDATE=:b0 group by EMPNO))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )922;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.2.1 퇴직금 지급율 계산중_임원...\n"); /*dsa2000 Rexec 대체*/
          error_quit("9.6.2.1 퇴직금 지급율 계산중_임원...\n");
     }    
/* Dsa2000  추가 END *****************************************************************/


    /* 퇴직금 */
     /* EXEC SQL
     UPDATE PKMMRMAS R 
        SET
            RETAMT = CEIL(NVL(BASEAMT,0) * NVL(RETRATE,0.0))
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS R  set RETAMT=CEIL((NVL(BASEAMT,0)* NVL\
(RETRATE,0.0))) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )953;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직금 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("퇴직금 계산중...\n");
     }
        
        /* START...2008.05.15 퇴직금 중간정산시 단수제전환 보상금 반영하여 세금계산 로직 타도록 */
     if  (strncmp(g_mrtodate,"20080430",8)==0) 
     {
          printf("\nDEBUG 2008.05.15 퇴직중간정산");
          /* EXEC SQL
          UPDATE PKMMRMAS R SET
                 AVGGROSS  = (SELECT AVGGROSS FROM PKHMRHIS_REPAY H WHERE EMPNO=R.EMPNO AND MRTODATE='20080430'),          
                 RETAMT    = (SELECT REPAYSUM FROM PKHMRHIS_REPAY H WHERE EMPNO=R.EMPNO AND MRTODATE='20080430')
           WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMRMAS R  set AVGGROSS=(select AVGGROSS  \
from PKHMRHIS_REPAY H where (EMPNO=R.EMPNO and MRTODATE='20080430')),RETAMT=(\
select REPAYSUM  from PKHMRHIS_REPAY H where (EMPNO=R.EMPNO and MRTODATE='200\
80430')) where (EMPNO>=:b0 and EMPNO<=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )976;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



          /* EXEC SQL
          UPDATE PKMMRMAS R 
             SET
                 AVGGROSS  = NVL(AVGGROSS,0),
                 RETAMT    = NVL(RETAMT,0)                 
           WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMRMAS R  set AVGGROSS=NVL(AVGGROSS,0),RE\
TAMT=NVL(RETAMT,0) where (EMPNO>=:b0 and EMPNO<=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )999;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


        
  
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               Write_batlog(seqno++, "퇴직금중간정산 계산중...\n"); 
               error_quit("퇴직금중간정산 계산중...\n");
          }         
     }
  /* END... */        
  
/*삭제시작    (2013년 세법 적용하기 위해)
// dsa2000 2004.10.12.  전산처리요청  1년에 여러번 중간정산하는자의 근속기간 및 세금 계산시
//                                     기존 정산내역을 포함하여 계산되도록함.

     // 근로소득금액 : 중간정산퇴직금 + 기존 중간정산퇴직금 
     EXEC    SQL
     UPDATE  PKMMRMAS
        SET  RETAMTSUM = NVL(RETAMT,0) + NVL(BRETAMT,0) ;
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "5. 퇴직급여액 : 중간정산퇴직금 + 기존 중간정산퇴직금 "); 
          error_quit(sqlca.sqlcode,"5. 퇴직급여액 : 중간정산퇴직금 + 기존 중간정산퇴직금 ");
     }        
// dsa2000 2004.10.12. End  ...................................................................
        
        
//  퇴직 소득세 
//         퇴직 소득 공제 Calc_Retintax(); 
//   2002.3.11  퇴직소득공제액 계산 ceil 을 floor로 수정함         
     EXEC SQL
     UPDATE PKMMRMAS SET
            //RINDED = floor( (RETAMTSUM/2) + (300000 * RETYY) )     
            RINDED = floor( (RETAMTSUM*40/100) + (300000 * RETYY) )  
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND RETYY <= 5 ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("퇴직 소득 공제(1) 계산중...\n");
     }

     EXEC SQL
     UPDATE PKMMRMAS SET
            //RINDED = floor((RETAMTSUM/2) + 1500000 + 500000 * (RETYY - 5))  //dsa2000 2004.10.12.  RETAMT => RETAMTSUM로 변경 
            RINDED = floor( (RETAMTSUM*40/100) + 1500000 + 500000 * (RETYY - 5) ) //dsa2000  2006.03.07 50% =>45%로 변경 2011.01.14 kth 45%->40 변경 
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND RETYY > 5 AND RETYY <= 10 ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("퇴직 소득 공제(2) 계산중...\n");
     }

     EXEC SQL
     UPDATE PKMMRMAS SET
            //RINDED = floor( (RETAMTSUM/2) + 4000000 + 800000 * (RETYY - 10) )  //dsa2000 2004.10.12.  RETAMT => RETAMTSUM로 변경
            RINDED = floor( (RETAMTSUM*40/100) + 4000000 + 800000 * (RETYY - 10) ) //dsa2000  2006.03.07 50% =>45%로 변경 2011.01.14 kth 45%->40 변경 
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND RETYY > 10 AND RETYY <= 20 ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("퇴직 소득 공제(3) 계산중...\n");
     }

     EXEC SQL
     UPDATE PKMMRMAS SET
            //RINDED = floor((RETAMTSUM/2) + 12000000 + 1200000 * (RETYY - 20))  //dsa2000  RETAMT => RETAMTSUM로 변경 
            RINDED = floor((RETAMTSUM*40/100) + 12000000 + 1200000 * (RETYY - 20)) //dsa2000  2006.03.07 50% =>45%로 변경 2011.01.14 kth 45%->40 변경 
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND RETYY > 20 ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("퇴직 소득 공제(4) 계산중...\n");
     }

     // 퇴직 소득 금액, 퇴직 소득과세 표준 
     EXEC SQL
     UPDATE PKMMRMAS 
        SET
            RINAMT   = GREATEST(RETAMTSUM - RINDED,0), //dsa2000  RETAMT => RETAMTSUM로 변경 
            TAXSTAMT = GREATEST(RETAMTSUM - RINDED,0)
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직 소득금액, 퇴직 소득과세표준 계산중...\n"); 
          error_quit("퇴직 소득금액, 퇴직 소득과세표준 계산중...\n");
     }


     -- 년평균 퇴직과표 
     EXEC SQL
     UPDATE PKMMRMAS 
        SET
            AVGTAXSTAMT = FLOOR(TAXSTAMT / DECODE(RETYY,0,1,RETYY))
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "년평균 퇴직과표 계산중...\n"); 
          error_quit("년평균 퇴직과표 계산중...\n");
     }

     -- 퇴직세율, 퇴직연평균 산출세 
     EXEC SQL
     UPDATE PKMMRMAS R 
        SET
           (RETTAXRATE, RETAVGTAX) =
           (SELECT C.TAXRATE, FLOOR(R.AVGTAXSTAMT * C.TAXRATE / 100 - C.YEARDED)
              FROM PKCPTAX C
             WHERE TAXNUM = :taxnum
               AND R.AVGTAXSTAMT >= C.TAXPAYFR AND R.AVGTAXSTAMT < C.TAXPAYTO
           )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직세율, 퇴직연평균 산출세 계산중...\n"); 
          error_quit("퇴직세율, 퇴직연평균 산출세 계산중...\n");
     }

     -- 퇴직산출세액 
     EXEC SQL
     UPDATE PKMMRMAS 
        SET RETCALCTAX = RETAVGTAX * DECODE(RETYY,0,1,RETYY)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직산출세액 계산중...\n"); 
          error_quit("퇴직산출세액 계산중...\n");
     }

     -- 퇴직세액공제 20030225parksh 2003~2004년 공제금액(0.5->0.25),공제한도액(240000->120000)변경됨  2005년이후 폐지
     EXEC SQL
         UPDATE PKMMRMAS SET
             RETTAXDED = FLOOR(LEAST(RETCALCTAX * 0.25,
                                     DECODE(RETYY,0,1,RETYY) * 120000))
         WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
  ===============================================================================================*/
/*삭제종료    (2013년 세법 적용하기 위해)*/  

/*2013.02.15.hjku 산출 세액 변경 시작*/
     /* EXEC   SQL DECLARE c3 CURSOR FOR
            SELECT EMPNO,REALYY_CALC,REALYY_2012,REALYY_2013,BRETINTAX, RETAMTSUM,FIXDED,
                   LEAST(GREATEST((RETAMTSUM-FIXDED),0),CONDED) CONDED,RINDED,
                   GREATEST((RETAMTSUM -RINDED),0) TAXSTAMT 
             FROM (SELECT A.*,
                   RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED,
                   RETUTIL.GET_CONDED(REALYY_CALC) CONDED,
                   RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC) RINDED,
                   GREATEST((RETAMTSUM - RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC)),0) TAXSTAMT
              FROM (SELECT EMPNO, NVL(REALYY_CALC,0) REALYY_CALC, NVL(REALYY_2012,0) REALYY_2012, NVL(REALYY_2013,0) REALYY_2013, 
                           NVL(BRETINTAX,0) BRETINTAX,  
                           NVL(RETAMT,0) +  NVL(BRETAMT,0)  RETAMTSUM
                      FROM PKMMRMAS WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
              )A
            ); */ 
    

      /* EXEC SQL OPEN  c3 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 37;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0030;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1022;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
      sqlstm.sqhstl[0] = (unsigned long )5;
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     while(1)
     {
          /* EXEC  SQL FETCH c3
          INTO  :empno,:realyy_calc,:realyy_2012,:realyy_2013,:bretintax, :retamtsum,:fixded,:conded,:rinded,:taxstamt ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1045;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&bretintax;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&retamtsum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&fixded;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&conded;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&rinded;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&taxstamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
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



          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
          {
                /* EXEC SQL close c3; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 37;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )1100;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                sprintf(log_buff, "FETCH CURSOR c2 Error\n");
                Write_batlog(seqno++, log_buff); 
                exit(1);
          }

          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1115;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          taxstamt_2012 = avgtaxstamt_2012  = retavgtaxstamt_2012 = rettaxrate_2012 = retavgtax_2012 = retavgcalctax_2012 = retcalctax_2012  = retintax_2012 = 0;
          taxstamt_2013 = avgtaxstamt_2013  = retavgtaxstamt_2013 = rettaxrate_2013 = retavgtax_2013 = retavgcalctax_2013 = retcalctax_2013  = retintax_2013 = 0;
          
          retintax = retjutax = 0; /*신고대상 세액*/


          /* 2012년 이전 산출 세액 */
          if((realyy_calc >0)&&(realyy_2012>0)) {
            taxstamt_2012 = lround(taxstamt * realyy_2012 / realyy_calc);

            CalcTax2012(realyy_calc,realyy_2012,taxstamt_2012, &avgtaxstamt_2012, &retavgtaxstamt_2012, &rettaxrate_2012,&retavgtax_2012, &retavgcalctax_2012, &retcalctax_2012);
          }
          
          /* 2013년 이후 산출 세액 */
          if((realyy_calc >0)&&(realyy_2013>0)) {
            taxstamt_2013 = taxstamt - taxstamt_2012;

            CalcTax2013(realyy_calc,realyy_2013,taxstamt_2013, &avgtaxstamt_2013, &retavgtaxstamt_2013, &rettaxrate_2013,&retavgtax_2013, &retavgcalctax_2013, &retcalctax_2013);
          }

          /* 기납부세액 처리 */
          retintax_2012 = retcalctax_2012 - bretintax;
          retintax_2013 = retcalctax_2013;          

          avgtaxstamt       = floor(taxstamt / realyy_calc);
          retavgtaxstamt    = retavgtaxstamt_2013; 
          retavgtax         = retavgtax_2013;
          
          retavgcalctax     = trunc(retavgcalctax_2012  + retavgcalctax_2013);          
          retcalctax        = trunc(retcalctax_2012     + retcalctax_2013);
          
          
          /* 2015.12.18 eyha 2016년 퇴직세법 적용  */
          change_pay_2016 = change_payded_2016 = taxstamt_2016 = rettaxrate_2016 = retavgtax_2016 = retcalctax_2016 = retintax_2016 = retintax_calc = 0;               
          if ((retamtsum >0) && (strcmp(g_mrtodate,"20160101") >= 0))   
          {          	
          	  /* 환산급여(change_pay_2016), 환산급여공제(change_payded_2016)  */
              /* EXEC  SQL
              SELECT  a.CHANGE_PAY_2016,
                      RETUTIL.GET_CHANGE_PAYDED(substr(:g_mrtodate,1,4), CHANGE_PAY_2016) change_payded_2016
              INTO    :change_pay_2016, :change_payded_2016
              FROM   (SELECT  RETUTIL.GET_CHANGE_PAY(substr(:g_mrtodate,1,4), :retamtsum - :conded, :realyy_calc ) CHANGE_PAY_2016
                      FROM    DUAL
                      ) a; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.CHANGE_PAY_2016 ,RETUTIL.GET_CHANGE_P\
AYDED(substr(:b0,1,4),CHANGE_PAY_2016) change_payded_2016 into :b1,:b2  from \
(select RETUTIL.GET_CHANGE_PAY(substr(:b0,1,4),(:b4-:b5),:b6) CHANGE_PAY_2016\
  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1130;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&change_pay_2016;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&change_payded_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[3] = (unsigned long )9;
              sqlstm.sqhsts[3] = (         int  )0;
              sqlstm.sqindv[3] = (         short *)0;
              sqlstm.sqinds[3] = (         int  )0;
              sqlstm.sqharm[3] = (unsigned long )0;
              sqlstm.sqadto[3] = (unsigned short )0;
              sqlstm.sqtdso[3] = (unsigned short )0;
              sqlstm.sqhstv[4] = (unsigned char  *)&retamtsum;
              sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[4] = (         int  )0;
              sqlstm.sqindv[4] = (         short *)0;
              sqlstm.sqinds[4] = (         int  )0;
              sqlstm.sqharm[4] = (unsigned long )0;
              sqlstm.sqadto[4] = (unsigned short )0;
              sqlstm.sqtdso[4] = (unsigned short )0;
              sqlstm.sqhstv[5] = (unsigned char  *)&conded;
              sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[5] = (         int  )0;
              sqlstm.sqindv[5] = (         short *)0;
              sqlstm.sqinds[5] = (         int  )0;
              sqlstm.sqharm[5] = (unsigned long )0;
              sqlstm.sqadto[5] = (unsigned short )0;
              sqlstm.sqtdso[5] = (unsigned short )0;
              sqlstm.sqhstv[6] = (unsigned char  *)&realyy_calc;
              sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
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


                                            
                     
              /* 퇴직소득 과세표준(taxstamt_2016) = 환산급여 - 환산급여공제 */       
              taxstamt_2016 =  change_pay_2016 - change_payded_2016;       	
              
              /* 환산산출세율(rettaxrate_2016), 환산산출세액(retavgtax_2016), 산출세액(retcalctax_2016)  */                     
              /* EXEC  SQL
              SELECT a.*, 
                     RETUTIL.GET_RETCALCTAX(substr(:g_mrtodate,1,4), RETAVGTAX_2016, :realyy_calc)  RETAVGTAX_2016
              INTO :rettaxrate_2016, :retavgtax_2016, :retcalctax_2016     
              FROM (
                       SELECT 
                               RETUTIL.GET_RETTAXRATE(:taxstamt_2016) RETTAXRATE_2016,
                               RETUTIL.GET_RETAVGTAX(:taxstamt_2016)  RETAVGTAX_2016
                      FROM DUAL
                   ) a; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.* ,RETUTIL.GET_RETCALCTAX(substr(:b0,\
1,4),RETAVGTAX_2016,:b1) RETAVGTAX_2016 into :b2,:b3,:b4  from (select RETUTI\
L.GET_RETTAXRATE(:b5) RETTAXRATE_2016 ,RETUTIL.GET_RETAVGTAX(:b5) RETAVGTAX_2\
016  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1173;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&realyy_calc;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&rettaxrate_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)&retavgtax_2016;
              sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[3] = (         int  )0;
              sqlstm.sqindv[3] = (         short *)0;
              sqlstm.sqinds[3] = (         int  )0;
              sqlstm.sqharm[3] = (unsigned long )0;
              sqlstm.sqadto[3] = (unsigned short )0;
              sqlstm.sqtdso[3] = (unsigned short )0;
              sqlstm.sqhstv[4] = (unsigned char  *)&retcalctax_2016;
              sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[4] = (         int  )0;
              sqlstm.sqindv[4] = (         short *)0;
              sqlstm.sqinds[4] = (         int  )0;
              sqlstm.sqharm[4] = (unsigned long )0;
              sqlstm.sqadto[4] = (unsigned short )0;
              sqlstm.sqtdso[4] = (unsigned short )0;
              sqlstm.sqhstv[5] = (unsigned char  *)&taxstamt_2016;
              sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[5] = (         int  )0;
              sqlstm.sqindv[5] = (         short *)0;
              sqlstm.sqinds[5] = (         int  )0;
              sqlstm.sqharm[5] = (unsigned long )0;
              sqlstm.sqadto[5] = (unsigned short )0;
              sqlstm.sqtdso[5] = (unsigned short )0;
              sqlstm.sqhstv[6] = (unsigned char  *)&taxstamt_2016;
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

              
             
              /* 2016년 이후 소득세 */               
              retintax_2016 = retcalctax_2016;         
                       	
              
              /* 특례 적용 산출세액(retintax_calc)  */                     
              /* EXEC  SQL
              SELECT RETUTIL.GET_RETINTAX(substr(:g_mrtodate,1,4), :retcalctax, :retcalctax_2016)  RETINTAX_CALC                 
              INTO :retintax_calc
              FROM DUAL; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select RETUTIL.GET_RETINTAX(substr(:b0,1,4),:b\
1,:b2) RETINTAX_CALC into :b3  from DUAL ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1216;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&retcalctax;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&retcalctax_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)&retintax_calc;
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

   
              
              
              /*  printf("[debug 3 ] : empno=%s,change_pay_2016=%f,retintax_calc=%f  \n",empno,change_pay_2016,retintax_calc);  */                                                         
          }
           
    
          /* 2015.12.18 eyha 2016년 세법적용 
                    calcintax         = retcalctax - bretintax;  */
          if (strcmp(g_mrtodate,"20160101") >= 0)
            calcintax         = retintax_calc - bretintax;   
          else             
            calcintax         = retcalctax - bretintax;   
                             
          
          calcjutax         = trunc(calcintax/10);
          
          retintax          = trunc(calcintax/10)  * 10;
          retjutax          = trunc((calcintax * jutaxrate / 100) /10) * 10;
          
               /* EXEC SQL 
               UPDATE  PKMMRMAS
                  SET  RETAMTSUM           = :retamtsum,
                       FIXDED              = :fixded,
                       CONDED              = :conded,
                       RINDED              = :rinded,
                       RINAMT              = GREATEST(:retamtsum - :rinded,0),
                       TAXSTAMT            = :taxstamt, 
                       TAXSTAMT_2012       = :taxstamt_2012,                            
                       AVGTAXSTAMT_2012    = :avgtaxstamt_2012,
                       RETAVGTAXSTAMT_2012 = :retavgtaxstamt_2012,                          
                       RETTAXRATE_2012     = :rettaxrate_2012,                          
                       RETAVGTAX_2012      = :retavgtax_2012,
                       RETAVGCALCTAX_2012  = :retavgcalctax_2012,                           
                       RETCALCTAX_2012     = :retcalctax_2012,
                       TAXSTAMT_2013       = :taxstamt_2013,                                                    
                       AVGTAXSTAMT_2013    = :avgtaxstamt_2013,
                       RETAVGTAXSTAMT_2013 = :retavgtaxstamt_2013,                          
                       RETTAXRATE_2013     = :rettaxrate_2013,                          
                       RETAVGTAX_2013      = :retavgtax_2013,
                       RETAVGCALCTAX_2013  = :retavgcalctax_2013,                           
                       RETCALCTAX_2013     = :retcalctax_2013,
                       AVGTAXSTAMT         = :avgtaxstamt,
                       RETAVGTAXSTAMT      = :retavgtaxstamt,                           
                       RETAVGTAX           = :retavgtax,
                       RETAVGCALCTAX       = :retavgcalctax,                        
                       RETCALCTAX          = :retcalctax,
                       CALCINTAX           = :calcintax,
                       CALCJUTAX           = :calcjutax,                       
                       RETINTAX            = :retintax,
                       RETJUTAX            = :retjutax,
                       RETINTAX_2012       = :retintax_2012,                        
                       RETINTAX_2013       = :retintax_2013,
                       CHANGE_PAY_2016     = :change_pay_2016    ,  /o2015.12.15 eyha addo/
                       CHANGE_PAYDED_2016  = :change_payded_2016 ,
                       TAXSTAMT_2016       = :taxstamt_2016      ,
                       RETTAXRATE_2016     = :rettaxrate_2016    ,
                       RETAVGTAX_2016      = :retavgtax_2016     ,
                       RETCALCTAX_2016     = :retcalctax_2016    ,
                       RETINTAX_2016       = :retintax_2016      ,
                       RETTAXYY            = substr(:g_mrtodate,1,4),  	
                       RETINTAX_CALC       = :retintax_calc                          	                                                	                  
                WHERE  EMPNO = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 42;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMRMAS  set RETAMTSUM=:b0,FIXDED=:b1\
,CONDED=:b2,RINDED=:b3,RINAMT=GREATEST((:b0-:b3),0),TAXSTAMT=:b6,TAXSTAMT_201\
2=:b7,AVGTAXSTAMT_2012=:b8,RETAVGTAXSTAMT_2012=:b9,RETTAXRATE_2012=:b10,RETAV\
GTAX_2012=:b11,RETAVGCALCTAX_2012=:b12,RETCALCTAX_2012=:b13,TAXSTAMT_2013=:b1\
4,AVGTAXSTAMT_2013=:b15,RETAVGTAXSTAMT_2013=:b16,RETTAXRATE_2013=:b17,RETAVGT\
AX_2013=:b18,RETAVGCALCTAX_2013=:b19,RETCALCTAX_2013=:b20,AVGTAXSTAMT=:b21,RE\
TAVGTAXSTAMT=:b22,RETAVGTAX=:b23,RETAVGCALCTAX=:b24,RETCALCTAX=:b25,CALCINTAX\
=:b26,CALCJUTAX=:b27,RETINTAX=:b28,RETJUTAX=:b29,RETINTAX_2012=:b30,RETINTAX_\
2013=:b31,CHANGE_PAY_2016=:b32,CHANGE_PAYDED_2016=:b33,TAXSTAMT_2016=:b34,RET\
TAXRATE_2016=:b35,RETAVGTAX_2016=:b36,RETCALCTAX_2016=:b37,RETINTAX_2016=:b38\
,RETTAXYY=substr(:b39,1,4),RETINTAX_CALC=:b40 where EMPNO=:b41";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1247;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&retamtsum;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&fixded;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&conded;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&rinded;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&retamtsum;
               sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&rinded;
               sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)&taxstamt;
               sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[6] = (         int  )0;
               sqlstm.sqindv[6] = (         short *)0;
               sqlstm.sqinds[6] = (         int  )0;
               sqlstm.sqharm[6] = (unsigned long )0;
               sqlstm.sqadto[6] = (unsigned short )0;
               sqlstm.sqtdso[6] = (unsigned short )0;
               sqlstm.sqhstv[7] = (unsigned char  *)&taxstamt_2012;
               sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[7] = (         int  )0;
               sqlstm.sqindv[7] = (         short *)0;
               sqlstm.sqinds[7] = (         int  )0;
               sqlstm.sqharm[7] = (unsigned long )0;
               sqlstm.sqadto[7] = (unsigned short )0;
               sqlstm.sqtdso[7] = (unsigned short )0;
               sqlstm.sqhstv[8] = (unsigned char  *)&avgtaxstamt_2012;
               sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[8] = (         int  )0;
               sqlstm.sqindv[8] = (         short *)0;
               sqlstm.sqinds[8] = (         int  )0;
               sqlstm.sqharm[8] = (unsigned long )0;
               sqlstm.sqadto[8] = (unsigned short )0;
               sqlstm.sqtdso[8] = (unsigned short )0;
               sqlstm.sqhstv[9] = (unsigned char  *)&retavgtaxstamt_2012;
               sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[9] = (         int  )0;
               sqlstm.sqindv[9] = (         short *)0;
               sqlstm.sqinds[9] = (         int  )0;
               sqlstm.sqharm[9] = (unsigned long )0;
               sqlstm.sqadto[9] = (unsigned short )0;
               sqlstm.sqtdso[9] = (unsigned short )0;
               sqlstm.sqhstv[10] = (unsigned char  *)&rettaxrate_2012;
               sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[10] = (         int  )0;
               sqlstm.sqindv[10] = (         short *)0;
               sqlstm.sqinds[10] = (         int  )0;
               sqlstm.sqharm[10] = (unsigned long )0;
               sqlstm.sqadto[10] = (unsigned short )0;
               sqlstm.sqtdso[10] = (unsigned short )0;
               sqlstm.sqhstv[11] = (unsigned char  *)&retavgtax_2012;
               sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[11] = (         int  )0;
               sqlstm.sqindv[11] = (         short *)0;
               sqlstm.sqinds[11] = (         int  )0;
               sqlstm.sqharm[11] = (unsigned long )0;
               sqlstm.sqadto[11] = (unsigned short )0;
               sqlstm.sqtdso[11] = (unsigned short )0;
               sqlstm.sqhstv[12] = (unsigned char  *)&retavgcalctax_2012;
               sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[12] = (         int  )0;
               sqlstm.sqindv[12] = (         short *)0;
               sqlstm.sqinds[12] = (         int  )0;
               sqlstm.sqharm[12] = (unsigned long )0;
               sqlstm.sqadto[12] = (unsigned short )0;
               sqlstm.sqtdso[12] = (unsigned short )0;
               sqlstm.sqhstv[13] = (unsigned char  *)&retcalctax_2012;
               sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[13] = (         int  )0;
               sqlstm.sqindv[13] = (         short *)0;
               sqlstm.sqinds[13] = (         int  )0;
               sqlstm.sqharm[13] = (unsigned long )0;
               sqlstm.sqadto[13] = (unsigned short )0;
               sqlstm.sqtdso[13] = (unsigned short )0;
               sqlstm.sqhstv[14] = (unsigned char  *)&taxstamt_2013;
               sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[14] = (         int  )0;
               sqlstm.sqindv[14] = (         short *)0;
               sqlstm.sqinds[14] = (         int  )0;
               sqlstm.sqharm[14] = (unsigned long )0;
               sqlstm.sqadto[14] = (unsigned short )0;
               sqlstm.sqtdso[14] = (unsigned short )0;
               sqlstm.sqhstv[15] = (unsigned char  *)&avgtaxstamt_2013;
               sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[15] = (         int  )0;
               sqlstm.sqindv[15] = (         short *)0;
               sqlstm.sqinds[15] = (         int  )0;
               sqlstm.sqharm[15] = (unsigned long )0;
               sqlstm.sqadto[15] = (unsigned short )0;
               sqlstm.sqtdso[15] = (unsigned short )0;
               sqlstm.sqhstv[16] = (unsigned char  *)&retavgtaxstamt_2013;
               sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[16] = (         int  )0;
               sqlstm.sqindv[16] = (         short *)0;
               sqlstm.sqinds[16] = (         int  )0;
               sqlstm.sqharm[16] = (unsigned long )0;
               sqlstm.sqadto[16] = (unsigned short )0;
               sqlstm.sqtdso[16] = (unsigned short )0;
               sqlstm.sqhstv[17] = (unsigned char  *)&rettaxrate_2013;
               sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[17] = (         int  )0;
               sqlstm.sqindv[17] = (         short *)0;
               sqlstm.sqinds[17] = (         int  )0;
               sqlstm.sqharm[17] = (unsigned long )0;
               sqlstm.sqadto[17] = (unsigned short )0;
               sqlstm.sqtdso[17] = (unsigned short )0;
               sqlstm.sqhstv[18] = (unsigned char  *)&retavgtax_2013;
               sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[18] = (         int  )0;
               sqlstm.sqindv[18] = (         short *)0;
               sqlstm.sqinds[18] = (         int  )0;
               sqlstm.sqharm[18] = (unsigned long )0;
               sqlstm.sqadto[18] = (unsigned short )0;
               sqlstm.sqtdso[18] = (unsigned short )0;
               sqlstm.sqhstv[19] = (unsigned char  *)&retavgcalctax_2013;
               sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[19] = (         int  )0;
               sqlstm.sqindv[19] = (         short *)0;
               sqlstm.sqinds[19] = (         int  )0;
               sqlstm.sqharm[19] = (unsigned long )0;
               sqlstm.sqadto[19] = (unsigned short )0;
               sqlstm.sqtdso[19] = (unsigned short )0;
               sqlstm.sqhstv[20] = (unsigned char  *)&retcalctax_2013;
               sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[20] = (         int  )0;
               sqlstm.sqindv[20] = (         short *)0;
               sqlstm.sqinds[20] = (         int  )0;
               sqlstm.sqharm[20] = (unsigned long )0;
               sqlstm.sqadto[20] = (unsigned short )0;
               sqlstm.sqtdso[20] = (unsigned short )0;
               sqlstm.sqhstv[21] = (unsigned char  *)&avgtaxstamt;
               sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[21] = (         int  )0;
               sqlstm.sqindv[21] = (         short *)0;
               sqlstm.sqinds[21] = (         int  )0;
               sqlstm.sqharm[21] = (unsigned long )0;
               sqlstm.sqadto[21] = (unsigned short )0;
               sqlstm.sqtdso[21] = (unsigned short )0;
               sqlstm.sqhstv[22] = (unsigned char  *)&retavgtaxstamt;
               sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[22] = (         int  )0;
               sqlstm.sqindv[22] = (         short *)0;
               sqlstm.sqinds[22] = (         int  )0;
               sqlstm.sqharm[22] = (unsigned long )0;
               sqlstm.sqadto[22] = (unsigned short )0;
               sqlstm.sqtdso[22] = (unsigned short )0;
               sqlstm.sqhstv[23] = (unsigned char  *)&retavgtax;
               sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[23] = (         int  )0;
               sqlstm.sqindv[23] = (         short *)0;
               sqlstm.sqinds[23] = (         int  )0;
               sqlstm.sqharm[23] = (unsigned long )0;
               sqlstm.sqadto[23] = (unsigned short )0;
               sqlstm.sqtdso[23] = (unsigned short )0;
               sqlstm.sqhstv[24] = (unsigned char  *)&retavgcalctax;
               sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[24] = (         int  )0;
               sqlstm.sqindv[24] = (         short *)0;
               sqlstm.sqinds[24] = (         int  )0;
               sqlstm.sqharm[24] = (unsigned long )0;
               sqlstm.sqadto[24] = (unsigned short )0;
               sqlstm.sqtdso[24] = (unsigned short )0;
               sqlstm.sqhstv[25] = (unsigned char  *)&retcalctax;
               sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[25] = (         int  )0;
               sqlstm.sqindv[25] = (         short *)0;
               sqlstm.sqinds[25] = (         int  )0;
               sqlstm.sqharm[25] = (unsigned long )0;
               sqlstm.sqadto[25] = (unsigned short )0;
               sqlstm.sqtdso[25] = (unsigned short )0;
               sqlstm.sqhstv[26] = (unsigned char  *)&calcintax;
               sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[26] = (         int  )0;
               sqlstm.sqindv[26] = (         short *)0;
               sqlstm.sqinds[26] = (         int  )0;
               sqlstm.sqharm[26] = (unsigned long )0;
               sqlstm.sqadto[26] = (unsigned short )0;
               sqlstm.sqtdso[26] = (unsigned short )0;
               sqlstm.sqhstv[27] = (unsigned char  *)&calcjutax;
               sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[27] = (         int  )0;
               sqlstm.sqindv[27] = (         short *)0;
               sqlstm.sqinds[27] = (         int  )0;
               sqlstm.sqharm[27] = (unsigned long )0;
               sqlstm.sqadto[27] = (unsigned short )0;
               sqlstm.sqtdso[27] = (unsigned short )0;
               sqlstm.sqhstv[28] = (unsigned char  *)&retintax;
               sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[28] = (         int  )0;
               sqlstm.sqindv[28] = (         short *)0;
               sqlstm.sqinds[28] = (         int  )0;
               sqlstm.sqharm[28] = (unsigned long )0;
               sqlstm.sqadto[28] = (unsigned short )0;
               sqlstm.sqtdso[28] = (unsigned short )0;
               sqlstm.sqhstv[29] = (unsigned char  *)&retjutax;
               sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[29] = (         int  )0;
               sqlstm.sqindv[29] = (         short *)0;
               sqlstm.sqinds[29] = (         int  )0;
               sqlstm.sqharm[29] = (unsigned long )0;
               sqlstm.sqadto[29] = (unsigned short )0;
               sqlstm.sqtdso[29] = (unsigned short )0;
               sqlstm.sqhstv[30] = (unsigned char  *)&retintax_2012;
               sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[30] = (         int  )0;
               sqlstm.sqindv[30] = (         short *)0;
               sqlstm.sqinds[30] = (         int  )0;
               sqlstm.sqharm[30] = (unsigned long )0;
               sqlstm.sqadto[30] = (unsigned short )0;
               sqlstm.sqtdso[30] = (unsigned short )0;
               sqlstm.sqhstv[31] = (unsigned char  *)&retintax_2013;
               sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[31] = (         int  )0;
               sqlstm.sqindv[31] = (         short *)0;
               sqlstm.sqinds[31] = (         int  )0;
               sqlstm.sqharm[31] = (unsigned long )0;
               sqlstm.sqadto[31] = (unsigned short )0;
               sqlstm.sqtdso[31] = (unsigned short )0;
               sqlstm.sqhstv[32] = (unsigned char  *)&change_pay_2016;
               sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[32] = (         int  )0;
               sqlstm.sqindv[32] = (         short *)0;
               sqlstm.sqinds[32] = (         int  )0;
               sqlstm.sqharm[32] = (unsigned long )0;
               sqlstm.sqadto[32] = (unsigned short )0;
               sqlstm.sqtdso[32] = (unsigned short )0;
               sqlstm.sqhstv[33] = (unsigned char  *)&change_payded_2016;
               sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[33] = (         int  )0;
               sqlstm.sqindv[33] = (         short *)0;
               sqlstm.sqinds[33] = (         int  )0;
               sqlstm.sqharm[33] = (unsigned long )0;
               sqlstm.sqadto[33] = (unsigned short )0;
               sqlstm.sqtdso[33] = (unsigned short )0;
               sqlstm.sqhstv[34] = (unsigned char  *)&taxstamt_2016;
               sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[34] = (         int  )0;
               sqlstm.sqindv[34] = (         short *)0;
               sqlstm.sqinds[34] = (         int  )0;
               sqlstm.sqharm[34] = (unsigned long )0;
               sqlstm.sqadto[34] = (unsigned short )0;
               sqlstm.sqtdso[34] = (unsigned short )0;
               sqlstm.sqhstv[35] = (unsigned char  *)&rettaxrate_2016;
               sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[35] = (         int  )0;
               sqlstm.sqindv[35] = (         short *)0;
               sqlstm.sqinds[35] = (         int  )0;
               sqlstm.sqharm[35] = (unsigned long )0;
               sqlstm.sqadto[35] = (unsigned short )0;
               sqlstm.sqtdso[35] = (unsigned short )0;
               sqlstm.sqhstv[36] = (unsigned char  *)&retavgtax_2016;
               sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[36] = (         int  )0;
               sqlstm.sqindv[36] = (         short *)0;
               sqlstm.sqinds[36] = (         int  )0;
               sqlstm.sqharm[36] = (unsigned long )0;
               sqlstm.sqadto[36] = (unsigned short )0;
               sqlstm.sqtdso[36] = (unsigned short )0;
               sqlstm.sqhstv[37] = (unsigned char  *)&retcalctax_2016;
               sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[37] = (         int  )0;
               sqlstm.sqindv[37] = (         short *)0;
               sqlstm.sqinds[37] = (         int  )0;
               sqlstm.sqharm[37] = (unsigned long )0;
               sqlstm.sqadto[37] = (unsigned short )0;
               sqlstm.sqtdso[37] = (unsigned short )0;
               sqlstm.sqhstv[38] = (unsigned char  *)&retintax_2016;
               sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[38] = (         int  )0;
               sqlstm.sqindv[38] = (         short *)0;
               sqlstm.sqinds[38] = (         int  )0;
               sqlstm.sqharm[38] = (unsigned long )0;
               sqlstm.sqadto[38] = (unsigned short )0;
               sqlstm.sqtdso[38] = (unsigned short )0;
               sqlstm.sqhstv[39] = (unsigned char  *)g_mrtodate;
               sqlstm.sqhstl[39] = (unsigned long )9;
               sqlstm.sqhsts[39] = (         int  )0;
               sqlstm.sqindv[39] = (         short *)0;
               sqlstm.sqinds[39] = (         int  )0;
               sqlstm.sqharm[39] = (unsigned long )0;
               sqlstm.sqadto[39] = (unsigned short )0;
               sqlstm.sqtdso[39] = (unsigned short )0;
               sqlstm.sqhstv[40] = (unsigned char  *)&retintax_calc;
               sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[40] = (         int  )0;
               sqlstm.sqindv[40] = (         short *)0;
               sqlstm.sqinds[40] = (         int  )0;
               sqlstm.sqharm[40] = (unsigned long )0;
               sqlstm.sqadto[40] = (unsigned short )0;
               sqlstm.sqtdso[40] = (unsigned short )0;
               sqlstm.sqhstv[41] = (unsigned char  *)empno;
               sqlstm.sqhstl[41] = (unsigned long )5;
               sqlstm.sqhsts[41] = (         int  )0;
               sqlstm.sqindv[41] = (         short *)0;
               sqlstm.sqinds[41] = (         int  )0;
               sqlstm.sqharm[41] = (unsigned long )0;
               sqlstm.sqadto[41] = (unsigned short )0;
               sqlstm.sqtdso[41] = (unsigned short )0;
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


          
               if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
               {    
                    sprintf(log_buff, "산출세액 반영 setting Error(1)");
                    Write_batlog(seqno++, log_buff); 
                    exit(1);
               }
          
     }

/*2013.02.15.hjku 산출 세액 변경 종료*/
  
 /* 퇴직소득세  
     EXEC SQL
     UPDATE PKMMRMAS 
     //SET    RealRETINTAX = FLOOR( (RETCALCTAX - RETTAXDED) /10 ) * 10   2005년이후 폐지 dsa2000  2005.01.
        SET RetIntax = FLOOR(RETCALCTAX /10 ) * 10
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직소득세(1) 계산중...\n"); 
          error_quit("퇴직소득세(1) 계산중...\n");
     }

     EXEC SQL
     UPDATE PKMMRMAS 
        SET RetIntax = 0
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND RetIntax < 0 ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직소득세(2) 계산중...\n"); 
          error_quit("퇴직소득세(2) 계산중...\n");
     }
*/
     /* 퇴직주민세  
     EXEC SQL
     UPDATE PKMMRMAS                                  
        SET RetJutax = FLOOR( (RetIntax * :jutaxrate / 100) /10) * 10
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직주민세 계산중...\n"); 
          error_quit("퇴직주민세 계산중...\n");
     }

 */    
/*==== dsa2000 추가 2004.10.12.   Start.. 동해년도의 종전 중간정산 반영한 세금 .=========== */
    /* REALRETINTAX  IS '동해년도 총소득세';  RealRetJutax
       RETREAL       IS '동해년도 총지급 중간정산금';       
       RETINTAX      IS '실소득세 = 동해년도의 총소득세 - 종전소득세';  RetJutax
       RETREALAMT    IS '실퇴직금 = 동해년도의 총소득세 - 종전소득세';                   */        
                         
     /* EXEC    SQL
     UPDATE  PKMMRMAS
        /oSET  RealRetintax = nvl(RETIntax,0) - nvl(bretintax,0);o/
        SET  RealRetintax = nvl(RETIntax,0)
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set RealRetintax=nvl(RETIntax,0) where\
 (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1430;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "12. 실퇴직소득세 setting Error"); /*dsa2000 Rexec 대체*/
          error_quit(sqlca.sqlcode,"12. 실퇴직소득세 setting Error");
     }

     /* EXEC    SQL
     UPDATE  PKMMRMAS
        /oSET     RealRetjutax = nvl(RETJutax,0) - nvl(bretjutax,0);o/
        SET     RealRetjutax = nvl(RETJutax,0)
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set RealRetjutax=nvl(RETJutax,0) where\
 (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1453;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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

;        
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          error_quit(sqlca.sqlcode,"13. 실퇴직주민세 setting Error");
     }

     /* EXEC    SQL
     UPDATE  PKMMRMAS
        SET  retreal   = retamtsum - RETIntax - RETJutax   - nvl(bretintax,0) - nvl(bretjutax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set retreal=((((retamtsum-RETIntax)-RE\
TJutax)-nvl(bretintax,0))-nvl(bretjutax,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1476;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


      /*WHERE  Bretamt <> 0;             //2013.02.19.hjku. 화면과 계산로직 맞추기 위해                   종전 중간정산 있는 사원만 Update. 데이터 구분을 위해.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "11. 동해년도 총지급 중간정산금  setting Error"); /*dsa2000 Rexec 대체*/
          error_quit(sqlca.sqlcode,"11. 동해년도 총지급 중간정산금  setting Error");
     }

     /* EXEC    SQL
     UPDATE  PKMMRMAS
        SET  RetRealAmt = retamt - RealRetIntax - RealRetJutax,
             writetime  = to_char(sysdate, 'yyyymmddhh24miss') ,
             writeman   = :g_workemp; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set RetRealAmt=((retamt-RealRetIntax)-\
RealRetJutax),writetime=to_char(sysdate,'yyyymmddhh24miss'),writeman=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1491;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_workemp;
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

 
             
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          error_quit(sqlca.sqlcode,"14. 실지급 퇴직금 setting Error");  /*중간정산 반영후 퇴직금.*/
     }
/* dsa2000 추가 2004.10.12  end................................................................ */        
        
        
/* 국민연금 전환금  변경후 :
** ===============================================================
*  1999.04 부터 국민연금에서 퇴충부담금 부분이 없어지므로
*  국민연금이력에서 퇴충부담금을 공제할 경우 퇴충필드가 따로 없으므로
*  1999.03 까지만 합계를 낸다.*   단, 중간정산 이후 금액부터
** ================================================================ *
*/
     /* EXEC SQL
     UPDATE PKMMRMAS R 
        SET
            ANUAMT =
            (SELECT SUM(NVL(ANUSELFAMT,0))
               FROM PKHNPHIS N
              WHERE R.EMPNO = N.EMPNO
                AND SUBSTR(R.MRFRDATE,1,6) <= N.ANUYYMM
                AND SUBSTR(R.MRTODATE,1,6) >= N.ANUYYMM
                AND N.ANUYYMM <= '199903'
            )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS R  set ANUAMT=(select sum(NVL(ANUSELFAM\
T,0))  from PKHNPHIS N where (((R.EMPNO=N.EMPNO and SUBSTR(R.MRFRDATE,1,6)<=N\
.ANUYYMM) and SUBSTR(R.MRTODATE,1,6)>=N.ANUYYMM) and N.ANUYYMM<='199903')) wh\
ere (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1510;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



        /* NULL 값은 실지급액 계산시 처리 */
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          error_quit("국민연금 전환금 계산중...\n");
     }

     /* 실지급액 (국민연금 전환금 포함 계산)*/
     /* EXEC SQL
     UPDATE PKMMRMAS SET
            ANUAMT  = NVL(ANUAMT,0),
            /o     DEDSUM  = NVL(ANUAMT,0) + NVL(RETINTAX,0)+ NVL(RETJUTAX,0) ,o/
            DEDSUM  = NVL(ANUAMT,0) + NVL(RealRETINTAX,0)+ NVL(RealRETJUTAX,0) ,
            REALAMT = NVL(RETREALAMT,0) - NVL(ANUAMT,0)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMRMAS  set ANUAMT=NVL(ANUAMT,0),DEDSUM=((NVL(\
ANUAMT,0)+NVL(RealRETINTAX,0))+NVL(RealRETJUTAX,0)),REALAMT=(NVL(RETREALAMT,0\
)-NVL(ANUAMT,0)) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1533;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "실지급액 계산중...\n"); /*dsa2000 Rexec 대체*/
          error_quit("실지급액 계산중...\n");
     }

}

void Calc_Retintax()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char empno[4+1] = "";
          int  retyy = 0;
          long int retamt = 0;
     /* EXEC SQL END DECLARE SECTION; */ 

 
     double rinded = 0;
 
     /* EXEC SQL DECLARE cursor_rinded CURSOR FOR
     SELECT EMPNO, RETYY, RETAMT
       FROM PKMMRMAS
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
      ORDER BY RETYY, EMPNO; */ 

 
     if  (sqlca.sqlcode != 0)
     {
          error_quit("\n");
     }
 
     /* EXEC SQL OPEN cursor_rinded; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0041;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1556;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          error_quit("\n");
     }
 
     while(1)
     {
          /* EXEC SQL FETCH cursor_rinded INTO
              :empno, :retyy, :retamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 42;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1579;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&retyy;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&retamt;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(long);
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


          
          if (sqlca.sqlcode == 1403) break;
          
          if  (retyy <= 5)
               rinded = (retamt/2) + (300000 * retyy);
          else if ((retyy > 5) && (retyy <= 10))
               rinded = (retamt/2) + 1500000 + 500000 * (retyy - 5);
          else if ((retyy > 10) && (retyy <= 20))
               rinded = (retamt/2) + 4000000 + 800000 * (retyy - 10);
          else /* if (retyy > 20) */
               rinded = (retamt/2) + 12000000 + 1200000 * (retyy - 20);
          
          /* EXEC SQL
              UPDATE PKMMRMAS 
                 SET
                     RINDED = CEIL(:rinded)
          WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 42;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMRMAS  set RINDED=CEIL(:b0) where (EMPNO\
>=:b1 and EMPNO<=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1606;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&rinded;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
          sqlstm.sqhstl[1] = (unsigned long )5;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
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
              error_quit("\n");
          }
     }

}

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1633;
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
     sqlstm.arrsiz = 42;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1674;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
/*
hinsacc pkq5040g
pkq5040g 20130131 1 0000 zzzz D029 pkq5040g 20130131
*/   