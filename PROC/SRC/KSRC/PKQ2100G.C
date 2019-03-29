
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
    "pkq2100g.pc"
};


static unsigned int sqlctx = 153875;


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
   unsigned char  *sqhstv[64];
   unsigned long  sqhstl[64];
            int   sqhsts[64];
            short *sqindv[64];
            int   sqinds[64];
   unsigned long  sqharm[64];
   unsigned long  *sqharc[64];
   unsigned short  sqadto[64];
   unsigned short  sqtdso[64];
} sqlstm = {12,64};

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

 static char *sq0001 = 
"select NVL(TAXPAYFR,0) ,NVL(TAXPAYTO,0) ,NVL(TAXRATE,0) ,NVL(YEARDED,0)  fr\
om PKCPTAX where TAXNUM=:b0           ";

 static char *sq0022 = 
"_char(sysdate,'YYYY'))-to_number((de\
code(substr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||substr(ju\
minid,1,2)))) SelfAge  from PKMRYMAS where retdate like (:b0||'%')           ";

 static char *sq0041 = 
"date,'YYYY'))-to_number((decode(subs\
tr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||substr(juminid,1,2\
)))) SelfAge  from PKMRYMAS where retdate like (:b0||'%')           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,113,0,9,393,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,1,0,0,13,404,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
55,0,0,1,0,0,15,418,0,0,0,0,0,1,0,
70,0,0,2,1057,0,4,447,0,0,61,1,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
329,0,0,3,41,0,4,489,0,0,1,0,0,1,0,2,4,0,0,
348,0,0,4,163,0,5,547,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
375,0,0,5,69,0,5,562,0,0,1,1,0,1,0,1,97,0,0,
394,0,0,6,878,0,5,574,0,0,1,1,0,1,0,1,97,0,0,
413,0,0,7,899,0,5,607,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
436,0,0,8,250,0,5,645,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
459,0,0,9,295,0,5,665,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
486,0,0,10,161,0,5,682,0,0,1,1,0,1,0,1,97,0,0,
505,0,0,11,257,0,5,697,0,0,1,1,0,1,0,1,97,0,0,
524,0,0,12,532,0,5,720,0,0,1,1,0,1,0,1,97,0,0,
543,0,0,13,195,0,5,744,0,0,1,1,0,1,0,1,97,0,0,
562,0,0,14,271,0,5,763,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
589,0,0,15,283,0,5,782,0,0,1,1,0,1,0,1,97,0,0,
608,0,0,16,111,0,5,793,0,0,1,1,0,1,0,1,97,0,0,
627,0,0,17,264,0,5,836,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
654,0,0,18,138,0,5,854,0,0,1,1,0,1,0,1,97,0,0,
673,0,0,19,140,0,5,868,0,0,1,1,0,1,0,1,97,0,0,
692,0,0,20,143,0,5,882,0,0,1,1,0,1,0,1,97,0,0,
711,0,0,21,115,0,5,933,0,0,1,1,0,1,0,1,97,0,0,
730,0,0,22,1214,0,9,974,0,0,1,1,0,1,0,1,97,0,0,
749,0,0,22,0,0,13,987,0,0,63,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,3,0,0,
1016,0,0,22,0,0,15,1015,0,0,0,0,0,1,0,
1031,0,0,23,163,0,5,1563,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1058,0,0,24,69,0,5,1578,0,0,1,1,0,1,0,1,97,0,0,
1077,0,0,25,878,0,5,1590,0,0,1,1,0,1,0,1,97,0,0,
1096,0,0,26,899,0,5,1623,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1119,0,0,27,250,0,5,1661,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1142,0,0,28,295,0,5,1681,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
1169,0,0,29,161,0,5,1698,0,0,1,1,0,1,0,1,97,0,0,
1188,0,0,30,257,0,5,1713,0,0,1,1,0,1,0,1,97,0,0,
1207,0,0,31,532,0,5,1736,0,0,1,1,0,1,0,1,97,0,0,
1226,0,0,32,195,0,5,1760,0,0,1,1,0,1,0,1,97,0,0,
1245,0,0,33,271,0,5,1779,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1272,0,0,34,283,0,5,1798,0,0,1,1,0,1,0,1,97,0,0,
1291,0,0,35,111,0,5,1822,0,0,1,1,0,1,0,1,97,0,0,
1310,0,0,36,233,0,5,1865,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1333,0,0,37,138,0,5,1881,0,0,1,1,0,1,0,1,97,0,0,
1352,0,0,38,140,0,5,1895,0,0,1,1,0,1,0,1,97,0,0,
1371,0,0,39,143,0,5,1909,0,0,1,1,0,1,0,1,97,0,0,
1390,0,0,40,115,0,5,1960,0,0,1,1,0,1,0,1,97,0,0,
1409,0,0,41,1205,0,9,2001,0,0,1,1,0,1,0,1,97,0,0,
1428,0,0,41,0,0,13,2014,0,0,62,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,3,0,0,
1691,0,0,41,0,0,15,2042,0,0,0,0,0,1,0,
1706,0,0,42,924,0,5,2526,0,0,64,64,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,
1977,0,0,43,50,0,3,2612,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
2018,0,0,44,0,0,29,2622,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ2100G(퇴직자 연말정산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 이랑교
 Version        : 2.00
 Date           : 1999.03.04

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.02.16         이인환          최초개발본      설계명세서
   2.00       1999.03.04         이랑교
   3.00       2001.1.27.         유효성          인정상여추가
   4.00       2001.12.14         유효성          소득세법 개정에따른 수정  
   5.00       2002.12.23         박수향          소득세법 개정에따른 수정 
              2003.12.           강륜종(dsa2000) 신용카드 공제에 직불카드와 지로납부 추가
                                                 외국인 추가공제 추가(자녀교육비& 월세)   
              2004.01.08.        강륜종(dsa2000) 분기연봉과 명절연봉 항목이 상여총액에 더해지던것을 급여총액으로 옮김
   10.41      2004.02.19         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.          
   11.00      2004.12            dsa2000         2004년 귀속 연말정산 작업.
   12.00      2005.01.12         DSA2000         월차폐지 및 정보통신수당(ITAMT) 추가에 다른 수정. 
                                                 유아보육비 비과세 루틴 추가.   
============================================================================= */
/*============================================================================= 
★ PKMYSMAS 와 PKHYSHIS 테이블에서는 아래와 같이 사용.
NPENAMT IS '연금저축_개인'  NPENAMT2 IS '연금저축_회사
PENAMT1 IS '개인연금_개인'  PENAMT2 IS '개인연금_회사'
        
★ PKHRYHIS에서는 개인과 회사에 해당하는 칼럼을 반대로 사용하고 있다.
NPENAMT IS '연금저축_회사'; NPENAMT2 IS '연금저축_개인';
PENAMT1 IS '개인연금_회사'; PENAMT2 IS '개인연금_개인'; 
============================================================================= */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/* EXEC SQL INCLUDE sqlca;
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

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char      TAXNUM[3];                /*  세율차수                 */
     double    INDEDBASIC ;              /*  근로소득공제기본액       */
     double    INDEDBRATE ;              /*  근로소득공제율 2009.09.29 KTH 추가     */     
     double    INDEDORATE ;              /*  근로소득공제초과율       */
     double    INDEDLIMIT ;              /*  근로소득공제한계액       */
     double    INDEDORATE2 ;             /*  근로소득공제초과율2       */
     double    INDEDLIMIT2 ;             /*  근로소득공제한계액2       */
     double    BASDED     ;              /*  기본공제액               */
     double    APPDED     ;              /*  추가공제액               */
     double    FEWDED1    ;              /*  소수공제자추가공제1      */
     double    FEWDED2    ;              /*  소수공제자추가공제2      */
     double    STDDED     ;              /*  표준공제                 */
     double    INSDEDLIMIT;              /*  보장성보험공제한도       */
     double    MEDDEDLIMIT;              /*  의료비공제한도           */
     double    MEDORATE   ;              /*  의료비공제초과율         */
     double    KINEDULIMIT;              /*  유치원교육비인당한도액   */
     double    CJKEDULIMIT;              /*  초중고교육비 인당한도액  */
     double    UNIEDULIMIT;              /*  대학교육비인당한도액     */
     double    BROEDUNO   ;              /*  형제교육비한도인원       */
     double    HSRATE     ;              /*  주택자금공제율           */
     double    HSDEDLIMIT ;              /*  주택자금한도액           */
     double    HSDEDLIMIT2 ;             /*  주택자금한도액2  dsa2000 */
     double    GIVDEDRATE ;              /*  기부금공제한도율         */
     double    PENRATE    ;              /*  개인연금공제율           */
     double    PENDEDLIMIT;              /*  개인연금한도액           */
     double    INVESTRATE;               /*  투자조합공제율           */
     double    INVESTDEDRATE;            /*  투자조합공제한도율       */
     double    INVESTLIMIT;              /*  투자조합공제한도액       */ /* 계산치 */
     double    TAXDEDBASIC;              /*  근로소득세액공제기본액   */
     double    TAXDEDBRATE;              /*  근로소득세액공제기본율   */
     double    TAXDEDORATE;              /*  근로소득세액공제초과율   */
     double    TAXDEDLIMIT;              /*  근로소득세액공제한계액   */
     double    PRODEDRATE ;              /*  재형저축공제율           */
     double    HSINTRATE  ;              /*  주택자금세액공제율       */
     /* double    STKDEDRATE ;                주식저축세액공제율      parksh */ 
     /* double    STKDEDLIMIT;                주식저축세액한도액       parksh*/
     double    FORILIMIT;                /*  국외근로소득세액공제 한도 */
     
     double    CREDEDLIMIT;              /* 신용카드한도액 */
     double    CREDEDRATE ;              /* 신용카드한도율 */
     double    CREORATE   ;              /* 신용카드초과율 */
     double    CREDEDLRATE;              /* 신용카드지급율 */
      
      /* add 2003.12.  Dsa2000*/
     double  DEBITDEDRATE;               /* 직불카드 공제율  dsa2000   2003.12. */ 
     double  GIRODEDRATE;                /* 지로납부 공제율  dsa2000   2003.12.  */ 
   
     double  totcreditamt;               /*  신용카드 공제가능 총금액  */
     /*    double  FOREDEDRATE;              외국인 추가공제율 (자녀교육비&월세)   dsa2000   2003.12. */        
     /*  double  FOREIGNAMT;                 외국인 추가공제(자녀교육비&월세) 지출금액 */
     /*  double  FOREIGNDED;                 외국인 추가공제금액 */
   
     double    JUTAXRATE  ;              /*  주민세율                 */
     double    NONGRATE   ;              /*  농특세율                 */           
     double    INDEDLIMIT3;              /*  근로소득공제한계액3       */  
     double    INDEDORATE3;              /*  근로소득공제초과율3       */  
     double    OBSDEDLIMIT;              /*  장애인보험 한계액*/
     double    OBSDEDADD;                /*장애인 추가공제 dsa2000 2005.12. 추가..*/
     double    NPENDEDLIMIT;             /*  연금저축 한계액*/
     double    INDEDLIMIT4;              /*  근로소득공제한계액4       */  
     double    INDEDORATE4;              /*  근로소득공제초과율4       */ 

     double    TAXDEDSECT1    ;          /* 근로소득세액공제 총급여한계액1     */
     double    TAXDEDSLIMIT1  ;          /* 근로소득세액공제한계액1            */
     double    TAXDEDSECT2    ;          /* 근로소득세액공제 총급여한계액2     */
     double    TAXDEDSLIMIT2  ;          /* 근로소득세액공제한계액2            */
     
     double    OBSEDULIMIT;              /*  장애인특수교육비  PARKSH 20021213 추가 */
     double    SPGIVDEDRATE;             /* 특례지정기부금공제한도율 PARKSH 20021213 추가 */
     double    OINVESTRATE;              /* 전투자조합공제율  parksh 20021213 추가 */
     double    OINVESTDEDRATE;           /* 전투자조합한도율  parksh 20021213 추가 */
     double    OINVESTLIMIT;             /* 전투자조합한도액   parksh 20021213 추가 */
     double    APPOLDDED;                /* 경로우대,장애인 PARKSH 20021213 */
     double    chagamamt     ;           /* 차감소득금액 2014.03.         */     
     double    laborlimit    ;           /* 근로소득공제한계_단계별         */
     double    incomtdedlimit;           /* 근로소득세액공제 한도           */
     /*        double    LSTKDEDRATE;                장기증권저축 공제율*/
     /*        double    OLSTKDEDRATE;            전년도장기증권저축세액공제율 PARKSH 20021213 */
     /*        double    OLSTKDEDRATE;            전년도 장기주식저축세율 PARKSH 20021213 */  
           
     char    workyy[5];
     char    tempdate[9];
     char    empno[5];      /*  사번   */
     char    korname[13];   /*  사번   */
     char    retdate[9];      /*  사번   */     
     double  lastmonpay;    /*  최종월정급여  */
     double  mpaysum;       /*  (주) 급여총액  */
     double  mbonsum;       /*  (주) 급여총액  */
     double  mnotax;        /*  (주) 비과세   */
     double  bpaysum;       /*  (종) 급여총액  */
     double  bbonsum;       /*  (종) 상여총액  */
     double  bnotax;        /*  (종) 비과세   */
     double  taxgross;      /*  과세급여총액  */
     double  foritaxgross;
     double  notax;         /*  비과세급여총액  */
     double  laborded;      /*  근로소득공제  */
     double  laboramt;      /*  근로소득금액  */
     double  mate;          /*  배우자유뮤   */
     double  fami16no;      /*  6세이하 가족수  */ 
     double  fami720no;     /*  7~20세 가족수  */
     double  fami6064no;    /*  60~64세 가족수  */
     /* double  fami65no;     65세 이상 가족수   kth 20090318 65세 경로우대 폐지 */
     double  familyno;      /*  총 가족수   */
     double  selfded  ;     /*  본인공제   */
     double  mateded  ;     /*  배우자 공제   */
     double  famided  ;     /*  부양가족공제  */
     double  basicded;      /*  기본공제   */
     double  obstacleno;    /*  장애자수   */
     double  childno;       /*  자녀 양육수   */
     double  woman;         /*  부녀자 여부   */
     double  oldded;        /*  경로우대공제  */
     double  obsded;        /*  장애자 공제   */
     double  womanded;      /*  부녀자 공제   */
     double  childded;      /*  자녀양육공제  */
     double  appendded;     /*  추가공제   */
     double  fewno;         /*  소수추가공제  */
     double  fewded;        /*  소수추가공제  */
     double  medamt;        /*  의료 보험료   */  
     double  bmedamt;       /*  (종) 의료 보험료  */
     double  medded;        /*  의료 보험료공제  */
     double  hireamt;       /*  고용 보험료   */ 
     double  bhireamt;      /*  (종) 고용 보험료  */
     double  hireded;       /*  고용보험료 공제  */
     double  guaramt;       /*  보장성 보험료  */
     double  guarded;       /*  보장성보험료 공제  */
     double  obsguaramt;    /*  장애인전용 보험료   */
     double  obsguarded;    /*  장애인전용 보험료공제*/
     double  insded;        /*  보험료 공제   */  
     double  ghosamt;       /*  일반 의료비   */
     double  ohosamt;       /*  경로의료비   */
     double  nhosamt;       /*  장애자의료비  */
     double  hosamt;        /*  의료비   */
     double  hosded;        /*  의료비공제   */
     double  seduamt;       /*  본인학자금   */   
     double  seduded;       /*  본인학자금공제  */  
     double  keduno;        /*  유치원수   */   
     double  keduamt;       /*  유치원학자금  */   
     double  keduded;       /*  유치원학자금공제  */  
   
   /*  double  keduno1;   parksh20021224  영유아수  */   
   /*  double  keduamt1;   parksh20021224  영유아교육비  */   
   /*  double  keduded1;   parksh20021224  영유아교육비공제*/  
     
     double  ceduno;        /*  초중고수   */   
     double  ceduamt;       /*  초중고학자금  */   
     double  ceduded;       /*  초중고학자금공제  */  
     double  ueduno;        /*  대학생수   */   
     double  ueduamt;       /*  대학생학자금  */   
     double  ueduded;       /*  대학생학자금공제  */  
     double  eduded;        /*  학자금공제   */  
     double  houseamt;      /*  주택자금   */
     double  houseintamt;   /*  주택자금차입이자  */
     double  houseded;      /*  주택자금공제  */
     double  agiveamt;      /*  전액기부금   */
     double  agiveded;      /*  전액기부금   */
     double  pgiveamt;      /*  일반기부금   */
     double  pgiveded;      /*  일반기부금   */
     double  giveded;       /*  기부금공제   */
     double  specialded;    /*  특별공제   */
     double  standded ;     /*  표준공제            */
     double  anuamt;        /*  연금보험료          */
     double  banuamt;       /*  (종)연금보험료      */
     double  anuded;        /*   연금보험료 공제    */
     double  penamt1;       /*  개인연금(회사)  */
     double  penamt2;       /*  개인연금(개인)  */
     double  bpenamt;       /*  (종)개인연금  */
     double  pended;        /*  개인연금공제  */
     double  npenamt;       /*  연금저축_회사   */
     double  npenamt2;      /*  연금저축_개인       */
     double  npended;       /*  연금저축공제*/
     double  incomeded;     /*  종합소득공제계   */ 
     double  taxlevel;      /*  과세표준   */
     double  calctax;       /*  산출세액   */
     double  icalctax;      /*  농특세계산을위한 임시 산출세액   */
     double  incomtded;     /*  근로소득세액공제  */ 
     double  propamt;       /*  재형저축   */
     double  bpropamt;      /*  (종) 재형저축  */
     double  propded;       /*  재형저축공제  */
     double  hloanamt;      /*  주택차입금 공제  */ 
     double  hloanded;      /*  주택차입금 공제  */ 
     /*double  stkamt;       주식저축    parksh   */
     /*double  stkded;       주식저축공제  parksh*/
     /*  double  lstkamt;                  장기증권저축        */
     /*  double  lstkded;                  장기증권저축공제    */
     /*        double  olstkamt ;       전년도장기증권저축       20021224 parksh */
     /*    double  olstkded ;         전년도장기증권저축 공제  20021224 parksh */
     /*    double  tlstkded ;         장기증권저축 공제  20021224 parksh */
     double  foriamt;       /*  외국납부공제  */
     double  forided;       /*  외국납부공제  */
     double  etctamt;       /*  기타세액감면  */
     double  etctded;       /*  기타세액감면  */
     double  tdedsum;       /*  세액감면 총액  */
     double  dintax;        /*  결정소득세   */
     double  djutax;        /*  결정주민세   */
     double  dnongtax;      
     double  mintax;        /*  (주) 소득세   */
     double  mjutax;        /*  (주) 주민세   */
     double  mnongtax;      
     double  bintax;        /*  (종) 소득세   */
     double  bjutax;        /*  (종) 주민세   */
     double  bnongtax;      
     double  intax;         /*  (주+종) 소득세  */
     double  jutax;         /*  (주+종) 주민세  */
     double  nongtax;       
     double  yintax;        /*  차감소득세   */
     double  yjutax;        /*  차감주민세   */
     double   ynongtax;
     double  ycalctax;      /*  차감정산액   */
     double  mcogbonsum ;   /*  인정상여            */
     double  creditded;     /*  신용카드공제  */
     double  creditamt;  
     double  investded;     /*  투자조합공제  */
     double  investamt;
     
     double  obseduno ;     /*  장애인수         parksh 20021224 */
     double  obseduamt;     /*  장애인특수교육금액     parksh 20021224 */
     double  obseduded;     /*  장애인특수교육비공제 parksh 20021224 */
     double  spgivamt ;     /*  특례지정기부금   parksh 20021224 */
     double  spgivded ;     /*  특레지정기부금공제   parksh 20021224 */   
     double  oinvestamt;    /*  투자조합공제      parksh 20021224 */
     double  oinvestded;    /*  투자조합공제      parksh 20021224 */
     double  tinvestded;    /* 투자조합공제액 합 PARKSH 20021224 추가 */
   
     double  APPOLDDED2;    /* 경로우대70세이상 공제액  Dsa2000 추가  2004.12. Start*/
     double  fami70no;      /* 경로우대 70세이상 수*/
     double  shosamt;       /*  본인 의료비        */
     double  specaddno;     /* 특별공제(결혼.장례.이사소득공제 건수)*/
     double  SPECADDLIMIT;  /* 특별공제(결혼.장례.이사소득공제 한도액)*/
     double  specaddded;    /* 특별공제(결혼.장례.이사소득공제 개인별 공제액)*/
     double  poliamt;       /* 정치기부금 */
   
     double  costocktax;    /*우리사주 인출과세액  dsa2000  2007.01.*/  
     
     double  polided;       /* 정치자금 세액공제액 */
     double  POLILIMIT;     /* 정치자금 세액공제 한도   Dsa2000 추가  2004.12. End..*/
     
     double  debitamt;      /*  직불카드 사용금액  */
     double  giroamt;       /*  지로납부금액       */
     double  cashamt;       /*  현금영수증 사용액  2005.11 추가 */ 
     char    juminid[15];   /*  주민번호 */
     double  yuedunotax;    /* 유치원학자금 비과세 추가 dsa2000  2005.01.*/
     int     SelfAge;       /* Dsa2000  근로자본인 경로자 체크 */
     double  calctaxlimit;  /* 2015.03.16 eyha 산출세액 비교 변수        */
     
      
     struct
           {      double taxfr   ;
                  double taxto   ;
                  double taxrate ;
                  double yearded ;
           } taxtbl[10];
           
     char  jobempno[4+1]  = "";  /* 작업자사번   */                     
           
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;
int     i=0;
int     id;
int     taxtblcnt=0;

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 

void main(argc,argv)
int     argc;
char    *argv[];

{
     char FL_file[255];
     
     /*dsa2000 Rexec 대체 파라미터 추가...*/
     if  (argc != 5) {  /* /hper8/HINSA/proc/bin/Kbin/pkq2100g 2014 D029 pkq2100g 2004110100000 */
          printf("[Usage] : pkq2100g 1.정산년도 2.작업사번 3.프로그램ID 4.시작시간  \n");
          exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2100g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
                                         
     sprintf(workyy,"%s",  argv[1]);                                            
     sprintf(jobempno,"%s",  argv[2]);   
     
     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"퇴직자 연말정산 계산 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[2]);
     strcpy(log_progid,   argv[3]);
     strcpy(log_rundate,  argv[4]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
      
     if  (strcmp(workyy, "2014") >= 0 )   {
         Calc_Yearend_2014();
     } else {
         Calc_Yearend();     
     }
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "ERROR ====== [작업 실패] =====\n");  /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          Write_batlog(seqno++, "OK ====== [퇴직자 연말정산 작업성공] =====\n");  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [퇴직자 연말정산 작업성공] =====\n");        
     }
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()
{
     int i=0;

     /* EXEC SQL DECLARE ctax CURSOR FOR
     SELECT  NVL(TAXPAYFR,0),NVL(TAXPAYTO,0),NVL(TAXRATE,0),
             NVL(YEARDED,0)
     FROM    PKCPTAX
     WHERE   TAXNUM = :TAXNUM; */ 


     /* EXEC    SQL OPEN ctax; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0001;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)TAXNUM;
     sqlstm.sqhstl[0] = (unsigned long )3;
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
          Write_batlog(seqno++, "연세율표  fetch Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"연세율표  fetch Error");
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
          sqlstm.offset = (unsigned int  )24;
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
            Write_batlog(seqno++, "연말정산 기초자료 read Error");  /*dsa2000 Rexec 대체*/
            err_print(sqlca.sqlcode,"연말정산 기초자료 read Error");
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
                  sqlstm.offset = (unsigned int  )55;
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
     
     res = 0;

     for (i=0 ;i <taxtblcnt ; ++i)
     {
          if ((taxtbl[i].taxfr < taxlevel) && (taxtbl[i].taxto >= taxlevel))
          {
               res = taxlevel * taxtbl[i].taxrate / 100;
               res = floor(res - taxtbl[i].yearded);
               return res;
          }

     }
}

ReadPkcysbas()
{
     /* EXEC    SQL
     SELECT  TAXNUM,      INDEDBASIC,    INDEDBRATE,   INDEDORATE,   INDEDLIMIT,
             BASDED,      APPDED,        FEWDED1,      FEWDED2,      STDDED,       INSDEDLIMIT,
             MEDDEDLIMIT, MEDORATE,      KINEDULIMIT,  CJKEDULIMIT,  UNIEDULIMIT,
             BROEDUNO,    HSRATE,        HSDEDLIMIT,   GIVDEDRATE,   PENRATE,      PENDEDLIMIT,
             TAXDEDBASIC, TAXDEDBRATE,   TAXDEDORATE,  TAXDEDLIMIT,  PRODEDRATE,
             HSINTRATE,   /oSTKDEDRATE,  STKDEDLIMIT,   parksh 20021224o/
             JUTAXRATE,   NONGRATE,      INVESTRATE,   INVESTDEDRATE,
             INDEDORATE2, INDEDLIMIT2,   CREDEDLIMIT,  CREDEDRATE ,   CREORATE   ,  CREDEDLRATE,
             INDEDLIMIT3, INDEDORATE3,   OBSDEDLIMIT , NPENDEDLIMIT,   /oLSTKDEDRATE,OLSTKDEDRATE, o/
             INDEDLIMIT4, INDEDORATE4,   APPOLDDED,    /o parksh 20021224 추가 o/
             OBSEDULIMIT, OINVESTRATE,   OINVESTDEDRATE, SPGIVDEDRATE,  /o parksh 20021224 추가 o/
             DEBITDEDRATE, GIRODEDRATE,                             /o Dsa2000 추가  2003.12.     2004.12.FOREDEDRATE  삭제o/
             APPOLDDED2,  SPECADDLIMIT,  POLILIMIT,    HSDEDLIMIT2, /o Dsa2000 추가  2004.12.o/
             OBSDEDADD,                                             /o Dsa2000 추가  2005.12.o/
             TAXDEDSECT1    ,TAXDEDSLIMIT1  ,TAXDEDSECT2    ,TAXDEDSLIMIT2
       INTO  :TAXNUM,     :INDEDBASIC,   :INDEDBRATE,   :INDEDORATE,  :INDEDLIMIT,
             :BASDED,     :APPDED,       :FEWDED1,     :FEWDED2,      :STDDED,      :INSDEDLIMIT,
             :MEDDEDLIMIT,:MEDORATE,     :KINEDULIMIT, :CJKEDULIMIT,  :UNIEDULIMIT,
             :BROEDUNO,   :HSRATE,       :HSDEDLIMIT,  :GIVDEDRATE,   :PENRATE,     :PENDEDLIMIT,
             :TAXDEDBASIC,:TAXDEDBRATE,  :TAXDEDORATE, :TAXDEDLIMIT,  :PRODEDRATE,
             :HSINTRATE,   /o:STKDEDRATE, :STKDEDLIMIT,  parksh 20021224o/
             :JUTAXRATE,   :NONGRATE,    :INVESTRATE,  :INVESTDEDRATE  /oADD ITEM 1998.12.15 LEERK o/,
             :INDEDORATE2, :INDEDLIMIT2, :CREDEDLIMIT, :CREDEDRATE ,   :CREORATE   , :CREDEDLRATE,
             :INDEDLIMIT3, :INDEDORATE3, :OBSDEDLIMIT, :NPENDEDLIMIT, /o  :LSTKDEDRATE ,:OLSTKDEDRATE,o/
             :INDEDLIMIT4, :INDEDORATE4, :APPOLDDED,     /o parksh 20021224 추가 o/
             :OBSEDULIMIT, :OINVESTRATE, :OINVESTDEDRATE, :SPGIVDEDRATE,
             :DEBITDEDRATE,:GIRODEDRATE,               /o Dsa2000 추가  2003.12.      2004.12.삭제 :FOREDEDRATE o/
             :APPOLDDED2,  :SPECADDLIMIT, :POLILIMIT,   :HSDEDLIMIT2,         /o Dsa2000 추가  2004.12.o/
             :OBSDEDADD,                                                       /o Dsa2000 추가  2005.12.  o/
             :TAXDEDSECT1    ,:TAXDEDSLIMIT1  ,:TAXDEDSECT2    ,:TAXDEDSLIMIT2
       FROM  PKCYSBAS
/o      WHERE  WORKYY = (SELECT WORKYY FROM PKCPBAS) ;o/
      WHERE  WORKYY = :workyy ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select TAXNUM ,INDEDBASIC ,INDEDBRATE ,INDEDORATE ,INDEDLIMIT ,BASDE\
D ,APPDED ,FEWDED1 ,FEWDED2 ,STDDED ,INSDEDLIMIT ,MEDDEDLIMIT ,MEDORATE ,KIN\
EDULIMIT ,CJKEDULIMIT ,UNIEDULIMIT ,BROEDUNO ,HSRATE ,HSDEDLIMIT ,GIVDEDRATE\
 ,PENRATE ,PENDEDLIMIT ,TAXDEDBASIC ,TAXDEDBRATE ,TAXDEDORATE ,TAXDEDLIMIT ,\
PRODEDRATE ,HSINTRATE ,JUTAXRATE ,NONGRATE ,INVESTRATE ,INVESTDEDRATE ,INDED\
ORATE2 ,INDEDLIMIT2 ,CREDEDLIMIT ,CREDEDRATE ,CREORATE ,CREDEDLRATE ,INDEDLI\
MIT3 ,INDEDORATE3 ,OBSDEDLIMIT ,NPENDEDLIMIT ,INDEDLIMIT4 ,INDEDORATE4 ,APPO\
LDDED ,OBSEDULIMIT ,OINVESTRATE ,OINVESTDEDRATE ,SPGIVDEDRATE ,DEBITDEDRATE \
,GIRODEDRATE ,APPOLDDED2 ,SPECADDLIMIT ,POLILIMIT ,HSDEDLIMIT2 ,OBSDEDADD ,T\
AXDEDSECT1 ,TAXDEDSLIMIT1 ,TAXDEDSECT2 ,TAXDEDSLIMIT2 into :b0,:b1,:b2,:b3,:\
b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b2\
0,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,:b34,:b35\
,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44,:b45,:b46,:b47,:b48,:b49,:b50,\
:b51,:b52,:b53,:b54,:b55,:b56,:b57,:b58,:b59");
     sqlstm.stmt = "  from PKCYSBAS where WORKYY=:b60";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)TAXNUM;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&INDEDBASIC;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&INDEDBRATE;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&INDEDORATE;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&INDEDLIMIT;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&BASDED;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&APPDED;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&FEWDED1;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&FEWDED2;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&STDDED;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&INSDEDLIMIT;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&MEDDEDLIMIT;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&MEDORATE;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&KINEDULIMIT;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&CJKEDULIMIT;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&UNIEDULIMIT;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&BROEDUNO;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&HSRATE;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&HSDEDLIMIT;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&GIVDEDRATE;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&PENRATE;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&PENDEDLIMIT;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&TAXDEDBASIC;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&TAXDEDBRATE;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&TAXDEDORATE;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&TAXDEDLIMIT;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&PRODEDRATE;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&HSINTRATE;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&JUTAXRATE;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&NONGRATE;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&INVESTRATE;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&INVESTDEDRATE;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&INDEDORATE2;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&INDEDLIMIT2;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&CREDEDLIMIT;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&CREDEDRATE;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)&CREORATE;
     sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)&CREDEDLRATE;
     sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)&INDEDLIMIT3;
     sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&INDEDORATE3;
     sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)&OBSDEDLIMIT;
     sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)&NPENDEDLIMIT;
     sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)&INDEDLIMIT4;
     sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)&INDEDORATE4;
     sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)&APPOLDDED;
     sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqhstv[45] = (unsigned char  *)&OBSEDULIMIT;
     sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[45] = (         int  )0;
     sqlstm.sqindv[45] = (         short *)0;
     sqlstm.sqinds[45] = (         int  )0;
     sqlstm.sqharm[45] = (unsigned long )0;
     sqlstm.sqadto[45] = (unsigned short )0;
     sqlstm.sqtdso[45] = (unsigned short )0;
     sqlstm.sqhstv[46] = (unsigned char  *)&OINVESTRATE;
     sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[46] = (         int  )0;
     sqlstm.sqindv[46] = (         short *)0;
     sqlstm.sqinds[46] = (         int  )0;
     sqlstm.sqharm[46] = (unsigned long )0;
     sqlstm.sqadto[46] = (unsigned short )0;
     sqlstm.sqtdso[46] = (unsigned short )0;
     sqlstm.sqhstv[47] = (unsigned char  *)&OINVESTDEDRATE;
     sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[47] = (         int  )0;
     sqlstm.sqindv[47] = (         short *)0;
     sqlstm.sqinds[47] = (         int  )0;
     sqlstm.sqharm[47] = (unsigned long )0;
     sqlstm.sqadto[47] = (unsigned short )0;
     sqlstm.sqtdso[47] = (unsigned short )0;
     sqlstm.sqhstv[48] = (unsigned char  *)&SPGIVDEDRATE;
     sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[48] = (         int  )0;
     sqlstm.sqindv[48] = (         short *)0;
     sqlstm.sqinds[48] = (         int  )0;
     sqlstm.sqharm[48] = (unsigned long )0;
     sqlstm.sqadto[48] = (unsigned short )0;
     sqlstm.sqtdso[48] = (unsigned short )0;
     sqlstm.sqhstv[49] = (unsigned char  *)&DEBITDEDRATE;
     sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[49] = (         int  )0;
     sqlstm.sqindv[49] = (         short *)0;
     sqlstm.sqinds[49] = (         int  )0;
     sqlstm.sqharm[49] = (unsigned long )0;
     sqlstm.sqadto[49] = (unsigned short )0;
     sqlstm.sqtdso[49] = (unsigned short )0;
     sqlstm.sqhstv[50] = (unsigned char  *)&GIRODEDRATE;
     sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[50] = (         int  )0;
     sqlstm.sqindv[50] = (         short *)0;
     sqlstm.sqinds[50] = (         int  )0;
     sqlstm.sqharm[50] = (unsigned long )0;
     sqlstm.sqadto[50] = (unsigned short )0;
     sqlstm.sqtdso[50] = (unsigned short )0;
     sqlstm.sqhstv[51] = (unsigned char  *)&APPOLDDED2;
     sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[51] = (         int  )0;
     sqlstm.sqindv[51] = (         short *)0;
     sqlstm.sqinds[51] = (         int  )0;
     sqlstm.sqharm[51] = (unsigned long )0;
     sqlstm.sqadto[51] = (unsigned short )0;
     sqlstm.sqtdso[51] = (unsigned short )0;
     sqlstm.sqhstv[52] = (unsigned char  *)&SPECADDLIMIT;
     sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[52] = (         int  )0;
     sqlstm.sqindv[52] = (         short *)0;
     sqlstm.sqinds[52] = (         int  )0;
     sqlstm.sqharm[52] = (unsigned long )0;
     sqlstm.sqadto[52] = (unsigned short )0;
     sqlstm.sqtdso[52] = (unsigned short )0;
     sqlstm.sqhstv[53] = (unsigned char  *)&POLILIMIT;
     sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[53] = (         int  )0;
     sqlstm.sqindv[53] = (         short *)0;
     sqlstm.sqinds[53] = (         int  )0;
     sqlstm.sqharm[53] = (unsigned long )0;
     sqlstm.sqadto[53] = (unsigned short )0;
     sqlstm.sqtdso[53] = (unsigned short )0;
     sqlstm.sqhstv[54] = (unsigned char  *)&HSDEDLIMIT2;
     sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[54] = (         int  )0;
     sqlstm.sqindv[54] = (         short *)0;
     sqlstm.sqinds[54] = (         int  )0;
     sqlstm.sqharm[54] = (unsigned long )0;
     sqlstm.sqadto[54] = (unsigned short )0;
     sqlstm.sqtdso[54] = (unsigned short )0;
     sqlstm.sqhstv[55] = (unsigned char  *)&OBSDEDADD;
     sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[55] = (         int  )0;
     sqlstm.sqindv[55] = (         short *)0;
     sqlstm.sqinds[55] = (         int  )0;
     sqlstm.sqharm[55] = (unsigned long )0;
     sqlstm.sqadto[55] = (unsigned short )0;
     sqlstm.sqtdso[55] = (unsigned short )0;
     sqlstm.sqhstv[56] = (unsigned char  *)&TAXDEDSECT1;
     sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[56] = (         int  )0;
     sqlstm.sqindv[56] = (         short *)0;
     sqlstm.sqinds[56] = (         int  )0;
     sqlstm.sqharm[56] = (unsigned long )0;
     sqlstm.sqadto[56] = (unsigned short )0;
     sqlstm.sqtdso[56] = (unsigned short )0;
     sqlstm.sqhstv[57] = (unsigned char  *)&TAXDEDSLIMIT1;
     sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[57] = (         int  )0;
     sqlstm.sqindv[57] = (         short *)0;
     sqlstm.sqinds[57] = (         int  )0;
     sqlstm.sqharm[57] = (unsigned long )0;
     sqlstm.sqadto[57] = (unsigned short )0;
     sqlstm.sqtdso[57] = (unsigned short )0;
     sqlstm.sqhstv[58] = (unsigned char  *)&TAXDEDSECT2;
     sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[58] = (         int  )0;
     sqlstm.sqindv[58] = (         short *)0;
     sqlstm.sqinds[58] = (         int  )0;
     sqlstm.sqharm[58] = (unsigned long )0;
     sqlstm.sqadto[58] = (unsigned short )0;
     sqlstm.sqtdso[58] = (unsigned short )0;
     sqlstm.sqhstv[59] = (unsigned char  *)&TAXDEDSLIMIT2;
     sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[59] = (         int  )0;
     sqlstm.sqindv[59] = (         short *)0;
     sqlstm.sqinds[59] = (         int  )0;
     sqlstm.sqharm[59] = (unsigned long )0;
     sqlstm.sqadto[59] = (unsigned short )0;
     sqlstm.sqtdso[59] = (unsigned short )0;
     sqlstm.sqhstv[60] = (unsigned char  *)workyy;
     sqlstm.sqhstl[60] = (unsigned long )5;
     sqlstm.sqhsts[60] = (         int  )0;
     sqlstm.sqindv[60] = (         short *)0;
     sqlstm.sqinds[60] = (         int  )0;
     sqlstm.sqharm[60] = (unsigned long )0;
     sqlstm.sqadto[60] = (unsigned short )0;
     sqlstm.sqtdso[60] = (unsigned short )0;
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
          Write_batlog(seqno++, "연말정산기준 read Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"연말정산기준 read ERROR");
          exit(1);
     }
     
     /* EXEC   SQL
     SELECT CHILDNOTAX
       INTO :yuedunotax
       FROM PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CHILDNOTAX into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )329;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yuedunotax;
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


     if  (sqlca.sqlcode != 0)
     {       
          Write_batlog(seqno++, "급여 기준 read Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"급여 기준 read ERROR");
          exit(1);
     }
}

ClearVar()
{
     memset(empno,'\0',sizeof(empno));
     memset(retdate,'\0',sizeof(retdate));     
     taxgross  =foritaxgross =mate      =familyno   =0; /* =fami65no kth 20090318 65세 경로우대 폐지*/
     mcogbonsum=0;
     obstacleno=childno      =woman     =0;
     medamt    =bmedamt      =0;
     hireamt   =bhireamt     =0;
     guaramt   =obsguaramt = 0;
     ghosamt   =ohosamt      =nhosamt   =hosamt     =0;
     keduno    =ueduno       = 0;
     /*  keduno1   =keduamt1     = 0 ; */
     seduamt   =keduamt      =ceduno    =ceduamt   = ueduamt  =0;
     houseamt  =houseintamt  =agiveamt     =pgiveamt  = 0;
     anuamt    =banuamt      =0;
     penamt1   =penamt2      =bpenamt   = 0;
     npenamt   =npenamt2     =0;
     hloanamt  =foriamt      =etctamt   =0;
     creditamt =  0;      
     mintax    =mjutax       =bintax    = bjutax   =0;
     mnongtax  =bnongtax     =0;
     investamt = 0;      
     /* new_calctax = 0; */
     obseduno = obseduamt=spgivamt=oinvestamt=0;  /*parksh 20021224 추가*/
     debitamt = giroamt = totcreditamt = 0;       /* dsa2000 ????  2003.12.*/
     memset(juminid,'\0',sizeof(juminid));                           /* Dsa2000 추가  2003.12.*/
     fami70no   = specaddno  = specaddded   = polided = SelfAge = 0; /* Dsa2000 추가  2004.12.*/
     cashamt    = 0;                                                 /* Dsa2000 추가  2005.11.*/
     costocktax = 0;                                                 /* Dsa2000 추가  2007.01.*/
}


Calc_Yearend_2014()
{
     double  medappded_A;  
     double  medappded_B;
     double  crededlimit2;
     double  creamt1;
     
     medappded_A = medappded_B = crededlimit2 = creamt1 = 0;
     
     ReadPkcysbas();      /*  PKCYSBAS 연말정산기준 테이블 읽어오기 */ 
     ReadTax();           /*  연세율표를 읽어 배열에 저장한다 */
     
     /* 귀속일 */
     /* EXEC     SQL
     UPDATE   PKMRYMAS a
     SET  YSFRDATE = (select GREATEST(NVL(ORGEMPDATE,:workyy||'0101'),:workyy||'0101')
                        from pkmrtmas b
                       where a.empno = b.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set YSFRDATE=(select GREATEST(NVL(OR\
GEMPDATE,(:b0||'0101')),(:b0||'0101'))  from pkmrtmas b where a.empno=b.empno\
) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )348;
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
          Write_batlog(seqno++, "귀속일1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"귀속일1 setting Error");
          exit(1);
     }
                          
                         
     /* EXEC    SQL
     UPDATE  PKMRYMAS a
        SET  YSTODATE = RETDATE
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set YSTODATE=RETDATE where retdate l\
ike (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )375;
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
          Write_batlog(seqno++, "귀속일2 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"귀속일2 setting Error");
          exit(1);
     }   
     
     /* EXEC   SQL
     UPDATE  PKMRYMAS P
        SET  LASTMONPAY = 
      ( SELECT SUM( NVL(BASICAMT,0)    + NVL(INFOAMT,0)  + NVL(DUTYAMT,0)    +
                    NVL(BBASICAMT,0)   + NVL(BINFOAMT,0) + NVL(BDUTYAMT,0)   +
                    NVL(MATEAMT,0)     + NVL(PARTAMT,0)  + NVL(CHILDAMT,0)   +
                    NVL(OVTMAMT,0)     + NVL(SPTMAMT,0)  + NVL(MCARTAXAMT,0) +
                    NVL(BOKJISUPAMT,0) + NVL(AIDAMT1,0)  + NVL(AIDAMT2,0)    + 
                    NVL(AIDAMT3,0)     + NVL(LICEAMT,0)  + NVL(MBONAMT,0)    + 
                    NVL(ODTAXAMT,0)    + NVL(SOPAY,0)    + NVL(LONGSUPAMT,0) +
                    NVL(CHILDEDUAMT,0) + NVL(MEDPAYAMT,0)+ NVL(TRAINSUPAMT,0)+ 
                    NVL(OVMCAMT,0)     + NVL(TAXPAY,0)   + NVL(FIXPAY,0)     +
                    NVL(QUATERPAY,0)   + NVL(HOLIPAY,0)  + NVL(ROLEAMT,0)    +
                    NVL(R.ITAMT,0)   /oDSA2000 ADD  2005.01.12 o/
                  )
         FROM  PKHPHIS R, (SELECT EMPNO MEMPNO, CALYN 
                             FROM PKMRTMAS) 
         WHERE  SUBSTR(PAYDATE,1,6) = DECODE(NVL(CALYN,'N'),'Y',SUBSTR(RETDATE,1,6),  /o PAYDATE 6 자리에서 8 자리 변경으로 인한 수정 [2018-09-18 이상용] o/  
                         TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM'),-1),'YYYYMM')) 
           AND  P.EMPNO = R.EMPNO
           AND  MEMPNO  = R.EMPNO
      )
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set LASTMONPAY=(select sum((((((((((\
(((((((((((((((((((((NVL(BASICAMT,0)+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+NVL(BBAS\
ICAMT,0))+NVL(BINFOAMT,0))+NVL(BDUTYAMT,0))+NVL(MATEAMT,0))+NVL(PARTAMT,0))+N\
VL(CHILDAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(MCARTAXAMT,0))+NVL(BOKJIS\
UPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAMT2,0))+NVL(AIDAMT3,0))+NVL(LICEAMT,0))+NVL\
(MBONAMT,0))+NVL(ODTAXAMT,0))+NVL(SOPAY,0))+NVL(LONGSUPAMT,0))+NVL(CHILDEDUAM\
T,0))+NVL(MEDPAYAMT,0))+NVL(TRAINSUPAMT,0))+NVL(OVMCAMT,0))+NVL(TAXPAY,0))+NV\
L(FIXPAY,0))+NVL(QUATERPAY,0))+NVL(HOLIPAY,0))+NVL(ROLEAMT,0))+NVL(R.ITAMT,0)\
))  from PKHPHIS R ,(select EMPNO MEMPNO ,CALYN  from PKMRTMAS ) where ((SUBS\
TR(PAYDATE,1,6)=DECODE(NVL(CALYN,'N'),'Y',SUBSTR(RETDATE,1,6),TO_CHAR(ADD_MON\
THS(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM'),(-1)),'YYYYMM')) and P.EMPNO=R.EMPN\
O) and MEMPNO=R.EMPNO)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )394;
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
          Write_batlog(seqno++, "3.1 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.1 주급여 setting Error");
          exit(1);
     }
     
     
     /*급여총액 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL
     UPDATE PKMRYMAS P
     SET    MPAYSUM = 
      ( SELECT SUM(
                   NVL(BASICAMT   ,0) +NVL(INFOAMT  ,0)+NVL(DUTYAMT   ,0)+
                   NVL(BBASICAMT  ,0) +NVL(BINFOAMT  ,0)+NVL(BDUTYAMT  ,0)+
                   NVL(MATEAMT  ,0) +NVL(PARTAMT  ,0)+NVL(CHILDAMT  ,0)+
                   NVL(OVTMAMT  ,0) +NVL(SPTMAMT  ,0)+NVL(MCARTAXAMT  ,0)+
                   NVL(BOKJISUPAMT  ,0) +NVL(AIDAMT1  ,0)+NVL(AIDAMT2   ,0)+ 
                   NVL(AIDAMT3  ,0) +NVL(LICEAMT  ,0)+NVL(MBONAMT   ,0)+ 
                   NVL(ODTAXAMT  ,0) +NVL(SOPAYSUM  ,0)+NVL(LONGSUPAMT  ,0)+
                   /oNVL(YUEDUAMT  ,0) +o/
                   nvl(YUEDUTAX,0)     + /odsa2000  2005.01. 비과세처리 yueduamt o/
                   NVL(SELFEDUAMT  ,0) +
                   NVL(DRVLICEAMT  ,0) +NVL(LECTSUPAMT  ,0)+
                   NVL(EDUSUPAMT  ,0) +NVL(MEDSUPAMT  ,0)+NVL(SUPAMT1   ,0)+
                   NVL(SUPAMT2  ,0) +NVL(SUPAMT3  ,0)+  
                   NVL(CHILDEDUAMT  ,0) +NVL(MEDPAYAMT,0) + 
                   NVL(TRAINSUPAMT  ,0) +NVL(OVMCAMT  ,0) +NVL(TAXPAY,0)    +
                   NVL(FIXPAY  ,0) +NVL(ROLEAMT,0)   +
                   NVL(QUATERPAY  ,0) +NVL(HOLIPAY,0)   +/odsa2000 2004.01. 분기/명절연봉이 상여총액에 더해지던것을 급여총액으로o/ 
                   NVL(ITAMT         ,0) + /oDSA2000 ADD  2005.01.12 o/
                   NVL(WINTERAMT     ,0) + /oDSA2000 ADD  2006.04.19. 요청서 월동보조비로 쓰던 칼럼을 영업인세티브 항목으로 사용 o/
                   NVL(HOMESUPAMT    ,0)   /oDSA2000 ADD  2006.06. 귀향지원금 => 선택적복리후생비로 변경 사용.o/
            )
          FROM   PKHPHIS R
         WHERE   substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set MPAYSUM=(select sum(((((((((((((\
(((((((((((((((((((((((((((((NVL(BASICAMT,0)+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+\
NVL(BBASICAMT,0))+NVL(BINFOAMT,0))+NVL(BDUTYAMT,0))+NVL(MATEAMT,0))+NVL(PARTA\
MT,0))+NVL(CHILDAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(MCARTAXAMT,0))+NV\
L(BOKJISUPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAMT2,0))+NVL(AIDAMT3,0))+NVL(LICEAMT\
,0))+NVL(MBONAMT,0))+NVL(ODTAXAMT,0))+NVL(SOPAYSUM,0))+NVL(LONGSUPAMT,0))+nvl\
(YUEDUTAX,0))+NVL(SELFEDUAMT,0))+NVL(DRVLICEAMT,0))+NVL(LECTSUPAMT,0))+NVL(ED\
USUPAMT,0))+NVL(MEDSUPAMT,0))+NVL(SUPAMT1,0))+NVL(SUPAMT2,0))+NVL(SUPAMT3,0))\
+NVL(CHILDEDUAMT,0))+NVL(MEDPAYAMT,0))+NVL(TRAINSUPAMT,0))+NVL(OVMCAMT,0))+NV\
L(TAXPAY,0))+NVL(FIXPAY,0))+NVL(ROLEAMT,0))+NVL(QUATERPAY,0))+NVL(HOLIPAY,0))\
+NVL(ITAMT,0))+NVL(WINTERAMT,0))+NVL(HOMESUPAMT,0)))  from PKHPHIS R where (s\
ubstr(paydate,1,4)=:b0 and p.empno=r.empno)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )413;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "3.2 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.2 주급여 setting Error");
          exit(1);
     }

/* printf(" mpaysum~~~~~~~~~ \n"); */
  /*상여총액 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL
     UPDATE  PKMRYMAS P
        SET  MBONSUM = 
             (SELECT SUM(NVL(BONUSAMT ,0)+NVL(INCENTAMT,0)+NVL(TRAINAMT,0)+
                         /oNVL(WINTERAMT,0)+NVL(HOMESUPAMT,0)+NVL(YBONAMT,0)+ dsa2000  2006.04.19. 요청서 o/
                          NVL(YBONAMT,0)+ NVL(SBONTAXAMT,0) + NVL(SOBONSUM,0)  /oNVL(SBONAMT  ,0)  dsa2000  2005.12.o/             
                        )
                FROM  PKHPHIS R
               WHERE  substr(paydate,1,4) = :workyy 
                 and  p.empno = r.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set MBONSUM=(select sum((((((NVL(BON\
USAMT,0)+NVL(INCENTAMT,0))+NVL(TRAINAMT,0))+NVL(YBONAMT,0))+NVL(SBONTAXAMT,0)\
)+NVL(SOBONSUM,0)))  from PKHPHIS R where (substr(paydate,1,4)=:b0 and p.empn\
o=r.empno)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )436;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "3.3 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.3 주급여 setting Error");
          exit(1);
     }
     
     /*비과세 급여 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL 
     UPDATE  PKMRYMAS p
        SET  (MNOTAX,NOTAXEXCEPT) = /o(SELECT SUM(NVL(NOTAXPAYSUM,0)) 2001-02-06 비과세급여는 식교비와 자가운전지원금의 비과세만 적용o/
                    (select sum(LEAST(NVL(r.YUEDUAMT,0)-nvl(YUEDUTAX,0), TO_NUMBER(:yuedunotax))), /o유아보육비 비과세 추가 2005.01. DSA2000o/                                
                            sum(NVL(r.ODAMT ,0)   - NVL(r.ODTAXAMT,0)  +         /o kth 2010.04.27 유치원 학자금을 제외한 비과세를 넣어 줌. 원천징수영수증에 표기 맞게o/
                                NVL(r.MCARAMT,0)  - NVL(r.MCARTAXAMT,0))
                       FROM PKHPHIS r
                      WHERE substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set (MNOTAX,NOTAXEXCEPT)=(select sum\
(LEAST((NVL(r.YUEDUAMT,0)-nvl(YUEDUTAX,0)),TO_NUMBER(:b0))) ,sum((((NVL(r.ODA\
MT,0)-NVL(r.ODTAXAMT,0))+NVL(r.MCARAMT,0))-NVL(r.MCARTAXAMT,0)))  from PKHPHI\
S r where (substr(paydate,1,4)=:b1 and p.empno=r.empno)) where retdate like (\
:b1||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )459;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
          Write_batlog(seqno++, "3.4 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.4 주급여 setting Error");
          exit(1);
     }
     
     /*상여총액 : 퇴직월 데이터 업데이트 */
     /* EXEC  SQL
     UPDATE  PKMRYMAS a
        SET  MBONSUM = (select NVL(a.MBONSUM,0)+NVL(b.YENAMT,0)+NVL(b.MONAMT,0) 
                          from pkmrtmas b       
                         where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set MBONSUM=(select ((NVL(a.MBONSUM,\
0)+NVL(b.YENAMT,0))+NVL(b.MONAMT,0))  from pkmrtmas b where a.empno=b.empno) \
where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )486;
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
          Write_batlog(seqno++, "3.5 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.5 주급여 setting Error");
          exit(1);
     }
     
     /*비과세 총액 : 퇴직월 데이터 업데이트 */
     /*2010.04.27 kth 비과세 총액(유치원학자금 제외 ) : 퇴직월 데이터 업데이트 원천징수 영수증 표기 방법에 따라 수정*/
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  (MNOTAX,NOTAXEXCEPT) = (SELECT NVL(A.MNOTAX ,0) , /o 기타비과세급여 추가 + 
                                            NVL(B.ODAMT ,0)  - NVL(B.ODTAXAMT,0)   +
                                            NVL(B.MCARAMT,0) - NVL(B.MCARTAXAMT,0) +
                                            NVL(B.NOTAXPAY,0) o/
                                            NVL(A.NOTAXEXCEPT ,0) + 
                                            NVL(B.ODAMT ,0)  - NVL(B.ODTAXAMT,0)   +
                                            NVL(B.MCARAMT,0) - NVL(B.MCARTAXAMT,0) +
                                            NVL(B.NOTAXPAY,0) /o 기타비과세급여 추가 o/
                                       from PKMRTMAS B       
                                      where A.EMPNO = B.EMPNO) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set (MNOTAX,NOTAXEXCEPT)=(select NVL\
(A.MNOTAX,0) ,(((((NVL(A.NOTAXEXCEPT,0)+NVL(B.ODAMT,0))-NVL(B.ODTAXAMT,0))+NV\
L(B.MCARAMT,0))-NVL(B.MCARTAXAMT,0))+NVL(B.NOTAXPAY,0))  from PKMRTMAS B wher\
e A.EMPNO=B.EMPNO) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )505;
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
          Write_batlog(seqno++, "3.6 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.6 주급여 setting Error");
          exit(1);
     }
     
        
     
     /*급여총액 : 퇴직월 데이터 업데이트 */
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  MPAYSUM = (SELECT NVL(MPAYSUM,0)   + NVL(BASICAMT,0) + NVL(INFOAMT,0) +
                               NVL(DUTYAMT,0)   + NVL(PROMAMT ,0) + NVL(FAMIAMT,0) + 
                               NVL(LICEAMT,0)   + NVL(ODTAXAMT,0) + NVL(MCARTAXAMT,0) +
                               NVL(OVTMAMT,0)   + NVL(SPTMAMT ,0) + NVL(BOKJISPAMT,0) +
                               NVL(AIDAMT1,0)   + NVL(AIDAMT2 ,0) + NVL(MBONAMT,0)+
                               NVL(TAXPAY,0)    + NVL(FIXPAY,0)   + NVL(ROLEAMT,0)+
                               NVL(QUATERPAY,0) + NVL(HOLIPAY,0)  + /odsa2000 2004.01. 분기/명절연봉이 상여총액에 더해지던것을 급여총액으로o/ 
                               NVL(ITAMT,0)     +      /oDSA2000 ADD  2005.01.12 o/
                               NVL(WINTERAMT,0) +      /oDSA2000 ADD  2006.04.19. 영업인센티브로 변경 사용 o/
                               NVL(HOMESUPAMT,0)+      /oDSA2000 ADD  2006.06.    선택적복리후생비로 변경사용o/
                               NVL(WELFARECARDAMT,0)   /ohjku    ADD  2013.05.    선복비카드과세 추가o/
                              FROM PKMRTMAS B
                             WHERE A.EMPNO = B.EMPNO) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set MPAYSUM=(select ((((((((((((((((\
(((((((NVL(MPAYSUM,0)+NVL(BASICAMT,0))+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+NVL(PR\
OMAMT,0))+NVL(FAMIAMT,0))+NVL(LICEAMT,0))+NVL(ODTAXAMT,0))+NVL(MCARTAXAMT,0))\
+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(BOKJISPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAM\
T2,0))+NVL(MBONAMT,0))+NVL(TAXPAY,0))+NVL(FIXPAY,0))+NVL(ROLEAMT,0))+NVL(QUAT\
ERPAY,0))+NVL(HOLIPAY,0))+NVL(ITAMT,0))+NVL(WINTERAMT,0))+NVL(HOMESUPAMT,0))+\
NVL(WELFARECARDAMT,0))  from PKMRTMAS B where A.EMPNO=B.EMPNO) where retdate \
like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )524;
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
          Write_batlog(seqno++, "3.7 주급여1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.7 주급여1 setting Error");
          exit(1);
     }
   
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  MBONSUM = (SELECT NVL(MBONSUM,0)  +NVL(BONUSAMT,0) +NVL(INCENTAMT,0) +
                               /oNVL(TRAINAMT,0) +NVL(WINTERAMT,0) +NVL(SBONAMT,0) + NVL(HOMESUPAMT,0) dsa2000  2006.04.19. (상여총액에서 제외)o/
                               NVL(TRAINAMT,0) +NVL(SBONAMT,0)
                               /oNVL(QUATERPAY  ,0)+NVL(HOLIPAY  ,0)o/
                          FROM PKMRTMAS B
                         WHERE A.EMPNO = B.EMPNO)      
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set MBONSUM=(select ((((NVL(MBONSUM,\
0)+NVL(BONUSAMT,0))+NVL(INCENTAMT,0))+NVL(TRAINAMT,0))+NVL(SBONAMT,0))  from \
PKMRTMAS B where A.EMPNO=B.EMPNO) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )543;
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
          Write_batlog(seqno++, "3.7 주급여2 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.7 주급여2 setting Error");
          exit(1);
     }
     
     /*dsa2000  2007.01. 우리사주 인출시 과세액 반영 추가...*/
     /*우리사주인출이력(PSDOHIS)의 WDSTAMT1 칼럼에 우리사주 시스템에서 과세금액 계산되어짐 (계산 시점 체크해야함)*/
     /* EXEC SQL 
     update PKMRYMAS M  
        Set COSTOCKTAX = (Select sum(nvl(WDSTAMT1,0)) from PSDOHIS
                           Where Substr(reqdate,1,4) = :workyy 
                            And M.empno = empno             
                          Group by empno )
      Where Empno in (Select empno from PSDOHIS 
                       Where Substr(reqdate,1,4) = :workyy  
                         AND nvl(WDSTAMT1,0) <> 0   ) 
      and retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS M  set COSTOCKTAX=(select sum(nvl(WDSTA\
MT1,0))  from PSDOHIS where (Substr(reqdate,1,4)=:b0 and M.empno=empno) group\
 by empno) where (Empno in (select empno  from PSDOHIS where (Substr(reqdate,\
1,4)=:b0 and nvl(WDSTAMT1,0)<>0)) and retdate like (:b0||'%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )562;
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
          Write_batlog(seqno++, "3.8 우리사주 인출시 과세액 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.8 우리사주 인출시 과세액 setting Error");
          exit(1);
     }                              
           /*******************************************************/
           
     /* EXEC SQL 
     UPDATE  PKMRYMAS 
        SET  familyno = nvl(fami16no,0)  + nvl(fami720no,0) + nvl(fami6064no,0) 
                      + nvl(fami70no,0),                                              /o + nvl(fami65no,0) kth 2009.03.18 65세 경로우대 공제 페지o/
             taxgross = nvl(mpaysum,0)   + nvl(mbonsum,0)   + nvl(bpaysum,0)     /o 총과세액 o/
                      + nvl(bbonsum,0)   + nvl(mcogbonsum,0) 
                      + nvl(COSTOCKTAX,0)               ,                        /o우리사주인출 과세액 합산 2007.01.o/
             notax    = nvl(mnotax,0)    + nvl(bnotax,0)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS  set familyno=(((nvl(fami16no,0)+nvl(fa\
mi720no,0))+nvl(fami6064no,0))+nvl(fami70no,0)),taxgross=(((((nvl(mpaysum,0)+\
nvl(mbonsum,0))+nvl(bpaysum,0))+nvl(bbonsum,0))+nvl(mcogbonsum,0))+nvl(COSTOC\
KTAX,0)),notax=(nvl(mnotax,0)+nvl(bnotax,0)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )589;
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


      
     /* 주민번호 체크 위하여 추가함.  2004.01.05.  Dsa2000  강륜종  */
     /* EXEC SQL 
     UPDATE  PKMRYMAS p
        SET  juminid = (Select juminid from pimpmas where p.empno=empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set juminid=(select juminid  from pi\
mpmas where p.empno=empno) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )608;
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
          Write_batlog(seqno++, " 주민번호setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode," 주민번호 Setting Error");
          exit(1);
     }  
     /********************************************************************************/  
     /*dsa2000   2004.12  외국인 과세특례 신설에 따른 사항  */
           /*          총근로소득의 30%를 추가로 비과세 처리한다. 
     EXEC SQL
     UPDATE PKMRYMAS
     SET    MPAYSUM    = (MPAYSUM+NOTAX)    - floor((MPAYSUM+NOTAX)    * 30 / 100),
            MBONSUM    = MBONSUM    - floor(MBONSUM    * 30 / 100),
            MCOGBONSUM = MCOGBONSUM - floor(MCOGBONSUM * 30 / 100),
            BPAYSUM    = (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100),
            BBONSUM    = BBONSUM    - floor(BBONSUM    * 30 / 100),
            TAXGROSS   = (MPAYSUM+NOTAX)    - floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         MBONSUM    - floor(MBONSUM    * 30 / 100) +
                         MCOGBONSUM - floor(MCOGBONSUM * 30 / 100) +
                         (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         BBONSUM    - floor(BBONSUM    * 30 / 100) ,
            NOTAX      = floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         floor(MBONSUM    * 30 / 100) +
                         floor(MCOGBONSUM * 30 / 100) +
                         floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         floor(BBONSUM    * 30 / 100) +
                         NVL(MNOTAX,0)
     WHERE  SUBSTR(JUMINID,8,1) in ('5','6');
     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {  
      Write_batlog(seqno++, " 외국인 과세금액 setting Error"); 
      err_print(sqlca.sqlcode," 외국인 과세금액 Setting Error");
      exit(1);
     }  
     -------------------------------------------------------------*/
     
   
     /* EXEC SQL 
     UPDATE  PKMRYMAS p     
        SET  (medamt, hireamt,  mintax, mjutax, anuamt) = 
    /o 2014.05.23 하은영 퇴직자 연말정산 건강보험료 계산시 건강보험 정산분도 반영되도록 수정                        
             (SELECT sum(meddamt), sum(empldamt),  o/
             (SELECT payutil.get_ys_meddamt(:workyy,p.empno) meddamt , sum(empldamt), 
                     sum(intax), sum(jutax), sum(anudamt)
                FROM  PKHPHIS r
               WHERE  substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set (medamt,hireamt,mintax,mjutax,an\
uamt)=(select payutil.get_ys_meddamt(:b0,p.empno) meddamt ,sum(empldamt) ,sum\
(intax) ,sum(jutax) ,sum(anudamt)  from PKHPHIS r where (substr(paydate,1,4)=\
:b0 and p.empno=r.empno)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )627;
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
          Write_batlog(seqno++, "12. 의보,고보등 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 의보,고보등 setting Error");
          exit(1);
     }
   
     /*퇴직월 의보,고보 포함 */
     /* EXEC SQL 
     UPDATE   PKMRYMAS a
        SET   medamt = (select nvl(medamt,0)+nvl(medamt1,0)
                          from pkmrtmas b
                         where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set medamt=(select (nvl(medamt,0)+nv\
l(medamt1,0))  from pkmrtmas b where a.empno=b.empno) where retdate like (:b0\
||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )654;
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
          Write_batlog(seqno++, "12. 의보 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 의보 setting Error");
          exit(1);
     }                   
                        
     /* EXEC SQL 
     UPDATE  PKMRYMAS a
        SET  hireamt=(select nvl(hireamt,0)+nvl(emplamt,0)
                        from pkmrtmas b
                       where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set hireamt=(select (nvl(hireamt,0)+\
nvl(emplamt,0))  from pkmrtmas b where a.empno=b.empno) where retdate like (:\
b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )673;
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
          Write_batlog(seqno++, "12. 고보 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 고보 setting Error");
          exit(1);
     }
     
     /* EXEC SQL 
     UPDATE   PKMRYMAS a
        SET   anuamt=(select  nvl(a.anuamt,0)+nvl(anuselfamt,0)
                        from  pkmrtmas b
                       where  a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set anuamt=(select (nvl(a.anuamt,0)+\
nvl(anuselfamt,0))  from pkmrtmas b where a.empno=b.empno) where retdate like\
 (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )692;
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
          Write_batlog(seqno++, "12. 국민연금 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 국민연금 setting Error");
          exit(1);
     }
     
   /******2001년이후입사자는 연금저축으로******/  
       /*EXEC SQL
       UPDATE PKMRYMAS a  2011.12.13 kth 주석처리
             SET NPENAMT =  PENAMT1, PENAMT1 = 0
             WHERE EMPNO IN (SELECT EMPNO FROM PKMRTMAS  WHERE empdate > '2001')
              AND  EMPNO NOT IN (SELECT  NEWEMPNO FROM  PZNEWEMPNO) ; */
              
            /* Dsa2000  2004.01.14.  입사일자 기준테이블을 급여마스터 테이블로 변경 
     EXEC SQL
     UPDATE PKMRYMAS a
        SET NPENAMT = PENAMT1, 
            PENAMT1 = 0
      WHERE EMPNO IN (SELECT EMPNO FROM PKMPMAS WHERE empdate > '2001')
        AND EMPNO NOT IN (SELECT NEWEMPNO FROM PZNEWEMPNO) ;
           
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          Write_batlog(seqno++, "13. 연금저축setting Error");  dsa2000 Rexec 대체
          err_print(sqlca.sqlcode,"13. 연금저축 setting Error");
          exit(1);
     }                       */
  
  /* Dsa2000  2005.12.26. 노동조합비 일반기부금으로 공제토록 하기위하여 추가.  * 반영여부 미결정.  
  EXEC SQL 
  UPDATE   PKMRYMAS p
  SET   pgiveamt = (SELECT sum(nojoamt)
                 FROM PKHPHIS r
                WHERE substr(paydate,1,4) = :workyy 
                  AND p.empno = r.empno);
  if ( sqlca.sqlcode != 0)
  {  
   Write_batlog(seqno++, "14. 일반기부금(노동조합비) setting Error");
   err_print(sqlca.sqlcode,"14. 일반기부금(노동조합비) setting Error");
   exit(1);
  }   
********************************************/  

     /* EXEC SQL 
     UPDATE  PKMRYMAS p
        SET  mintax=nvl(mintax,0),
             mjutax=nvl(mjutax,0),
             anuamt=nvl(anuamt,0) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set mintax=nvl(mintax,0),mjutax=nvl(\
mjutax,0),anuamt=nvl(anuamt,0) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )711;
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
          Write_batlog(seqno++, "14. 소득세 ,주민세등 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"14. 소득세 ,주민세등 setting Error");
          exit(1);
     }
     
      
     /* EXEC SQL DECLARE c2 CURSOR FOR
     select empno,retdate,nvl(taxgross,0),nvl(mate,0),nvl(familyno,0), /o nvl(fami65no,0), 20090318 65세 경로우대 폐지o/
            nvl(obstacleno,0),nvl(childno,0),nvl(woman,0),nvl(medamt,0),
            nvl(bmedamt,0),nvl(hireamt,0),nvl(bhireamt,0),nvl(guaramt,0),
            nvl(obsguaramt,0),nvl(ghosamt,0),nvl(ohosamt,0),nvl(nhosamt,0),
            nvl(keduno,0),nvl(ueduno,0),  nvl(ceduno,0),
            /onvl(keduno1,0), nvl(keduamt1,0), parksh 20021224 취학전아동교육비로 통합o/
            nvl(seduamt,0),nvl(keduamt,0),nvl(ceduamt,0),nvl(ueduamt,0),
            nvl(houseamt,0),nvl(houseintamt,0),nvl(agiveamt,0),nvl(pgiveamt,0),
            nvl(anuamt,0), nvl(banuamt,0), nvl(penamt1,0),nvl(penamt2,0),nvl(bpenamt,0),
            nvl(npenamt,0), nvl(npenamt2,0),nvl(propamt,0),nvl(bpropamt,0),nvl(hloanamt,0),
            nvl(foriamt,0),nvl(etctamt,0),  /o nvl(stkamt,0),parksh nvl(lstkamt,0),o/
            nvl(mintax,0),nvl(mjutax,0),nvl(bintax,0),nvl(bjutax,0), 
            nvl(mnongtax,0),nvl(bnongtax,0), nvl(mcogbonsum,0),   
            nvl(creditamt,0), nvl(investamt,0),
            nvl(obseduno,0),/o parksh 20021224 추가 nvl(olstkamt,0),o/
            nvl(obseduamt,0), nvl(oinvestamt,0), nvl(spgivamt,0), /o parksh 20021224 추가 o/
            nvl(DEBITAMT,0), nvl(GIROAMT,0), nvl(JUMINID,0),  /o dsa2000 추가 2003.12.
            /onvl(FOREIGNAMT,0), nvl(FOREIGNDED,0)              dsa2000 2004.12  삭제 o/
            nvl(poliamt,0),nvl(fami70no,0),nvl(specaddno,0),nvl(specaddded,0),nvl(shosamt,0),/o2004.12.  dsa2000o/
            nvl(cashamt,0),                                     /o Dsa2000 추가  2005.11.o/
            (to_number(to_char(sysdate,'YYYY')) -    
            to_number(decode(substr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||substr(juminid,1,2)) ) SelfAge /o Dsa2000 추가  2006.06.o/
       from PKMRYMAS
      WHERE retdate like :workyy||'%'; */ 

     
     /* EXEC   SQL open c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select empno ,retdate ,nvl(taxgross,0) ,nvl(mate,0) ,nvl(familyno,0)\
 ,nvl(obstacleno,0) ,nvl(childno,0) ,nvl(woman,0) ,nvl(medamt,0) ,nvl(bmedam\
t,0) ,nvl(hireamt,0) ,nvl(bhireamt,0) ,nvl(guaramt,0) ,nvl(obsguaramt,0) ,nv\
l(ghosamt,0) ,nvl(ohosamt,0) ,nvl(nhosamt,0) ,nvl(keduno,0) ,nvl(ueduno,0) ,\
nvl(ceduno,0) ,nvl(seduamt,0) ,nvl(keduamt,0) ,nvl(ceduamt,0) ,nvl(ueduamt,0\
) ,nvl(houseamt,0) ,nvl(houseintamt,0) ,nvl(agiveamt,0) ,nvl(pgiveamt,0) ,nv\
l(anuamt,0) ,nvl(banuamt,0) ,nvl(penamt1,0) ,nvl(penamt2,0) ,nvl(bpenamt,0) \
,nvl(npenamt,0) ,nvl(npenamt2,0) ,nvl(propamt,0) ,nvl(bpropamt,0) ,nvl(hloan\
amt,0) ,nvl(foriamt,0) ,nvl(etctamt,0) ,nvl(mintax,0) ,nvl(mjutax,0) ,nvl(bi\
ntax,0) ,nvl(bjutax,0) ,nvl(mnongtax,0) ,nvl(bnongtax,0) ,nvl(mcogbonsum,0) \
,nvl(creditamt,0) ,nvl(investamt,0) ,nvl(obseduno,0) ,nvl(obseduamt,0) ,nvl(\
oinvestamt,0) ,nvl(spgivamt,0) ,nvl(DEBITAMT,0) ,nvl(GIROAMT,0) ,nvl(JUMINID\
,0) ,nvl(poliamt,0) ,nvl(fami70no,0) ,nvl(specaddno,0) ,nvl(specaddded,0) ,n\
vl(shosamt,0) ,nvl(cashamt,0) ,(to_number(to");
     sqlstm.stmt = sq0022;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )730;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "6. 근로소득공제1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"6. 근로소득공제1 setting Error");
          exit(1);
     }
     
     while(1)
     {
          ClearVar();
          
          /* EXEC SQL FETCH c2 INTO
          :empno,     :retdate,  :taxgross,  :mate,     :familyno,  /o:fami65no, 20090318 65세 경로우대 폐지o/
          :obstacleno,:childno,  :woman,     :medamt,
          :bmedamt,   :hireamt,  :bhireamt,  :guaramt,
          :obsguaramt,:ghosamt,  :ohosamt,   :nhosamt,
          :keduno,    :ueduno,   :ceduno,    /o:keduno1,   :keduamt1, parksh 20021224 o/
          :seduamt,   :keduamt,  :ceduamt,   :ueduamt,
          :houseamt,  :houseintamt, :agiveamt, :pgiveamt,
          :anuamt,    :banuamt,  :penamt1,   :penamt2,  :bpenamt,
          :npenamt,   :npenamt2, :propamt,   :bpropamt, :hloanamt,
          :foriamt,   :etctamt,  /o:stkamt, parksh :lstkamt, o/
          :mintax,    :mjutax,   :bintax,   :bjutax,
          :mnongtax,  :bnongtax, :mcogbonsum,   
          :creditamt, :investamt, 
          :obseduno,  :obseduamt,:oinvestamt, :spgivamt, /o parksh 20021224 추가 :olstkamt,  o/
          :debitamt,  :giroamt,  :juminid,   /o:foreignamt, :foreignded,o/ /o Dsa2000 추가  2003.12.o/
          :poliamt,   :fami70no, :specaddno, :specaddded, :shosamt,        /o Dsa2000 추가  2004.12.o/
          :cashamt,   :SelfAge; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 63;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )749;
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
          sqlstm.sqhstv[1] = (unsigned char  *)retdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&taxgross;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&mate;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&familyno;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&obstacleno;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&childno;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&woman;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&medamt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&bmedamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&hireamt;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&bhireamt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&guaramt;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&obsguaramt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&ghosamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&ohosamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&nhosamt;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&keduno;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&ueduno;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&ceduno;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&seduamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&keduamt;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&ceduamt;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&ueduamt;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&houseamt;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&houseintamt;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&agiveamt;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&pgiveamt;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&anuamt;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&banuamt;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&penamt1;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&penamt2;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&bpenamt;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&npenamt;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&npenamt2;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&propamt;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&bpropamt;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&hloanamt;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&foriamt;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&etctamt;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&mintax;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&mjutax;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&bintax;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&bjutax;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&mnongtax;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&bnongtax;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&mcogbonsum;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&creditamt;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&investamt;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&obseduno;
          sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)&obseduamt;
          sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)&oinvestamt;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&spgivamt;
          sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[52] = (         int  )0;
          sqlstm.sqindv[52] = (         short *)0;
          sqlstm.sqinds[52] = (         int  )0;
          sqlstm.sqharm[52] = (unsigned long )0;
          sqlstm.sqadto[52] = (unsigned short )0;
          sqlstm.sqtdso[52] = (unsigned short )0;
          sqlstm.sqhstv[53] = (unsigned char  *)&debitamt;
          sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[53] = (         int  )0;
          sqlstm.sqindv[53] = (         short *)0;
          sqlstm.sqinds[53] = (         int  )0;
          sqlstm.sqharm[53] = (unsigned long )0;
          sqlstm.sqadto[53] = (unsigned short )0;
          sqlstm.sqtdso[53] = (unsigned short )0;
          sqlstm.sqhstv[54] = (unsigned char  *)&giroamt;
          sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[54] = (         int  )0;
          sqlstm.sqindv[54] = (         short *)0;
          sqlstm.sqinds[54] = (         int  )0;
          sqlstm.sqharm[54] = (unsigned long )0;
          sqlstm.sqadto[54] = (unsigned short )0;
          sqlstm.sqtdso[54] = (unsigned short )0;
          sqlstm.sqhstv[55] = (unsigned char  *)juminid;
          sqlstm.sqhstl[55] = (unsigned long )15;
          sqlstm.sqhsts[55] = (         int  )0;
          sqlstm.sqindv[55] = (         short *)0;
          sqlstm.sqinds[55] = (         int  )0;
          sqlstm.sqharm[55] = (unsigned long )0;
          sqlstm.sqadto[55] = (unsigned short )0;
          sqlstm.sqtdso[55] = (unsigned short )0;
          sqlstm.sqhstv[56] = (unsigned char  *)&poliamt;
          sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[56] = (         int  )0;
          sqlstm.sqindv[56] = (         short *)0;
          sqlstm.sqinds[56] = (         int  )0;
          sqlstm.sqharm[56] = (unsigned long )0;
          sqlstm.sqadto[56] = (unsigned short )0;
          sqlstm.sqtdso[56] = (unsigned short )0;
          sqlstm.sqhstv[57] = (unsigned char  *)&fami70no;
          sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[57] = (         int  )0;
          sqlstm.sqindv[57] = (         short *)0;
          sqlstm.sqinds[57] = (         int  )0;
          sqlstm.sqharm[57] = (unsigned long )0;
          sqlstm.sqadto[57] = (unsigned short )0;
          sqlstm.sqtdso[57] = (unsigned short )0;
          sqlstm.sqhstv[58] = (unsigned char  *)&specaddno;
          sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[58] = (         int  )0;
          sqlstm.sqindv[58] = (         short *)0;
          sqlstm.sqinds[58] = (         int  )0;
          sqlstm.sqharm[58] = (unsigned long )0;
          sqlstm.sqadto[58] = (unsigned short )0;
          sqlstm.sqtdso[58] = (unsigned short )0;
          sqlstm.sqhstv[59] = (unsigned char  *)&specaddded;
          sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[59] = (         int  )0;
          sqlstm.sqindv[59] = (         short *)0;
          sqlstm.sqinds[59] = (         int  )0;
          sqlstm.sqharm[59] = (unsigned long )0;
          sqlstm.sqadto[59] = (unsigned short )0;
          sqlstm.sqtdso[59] = (unsigned short )0;
          sqlstm.sqhstv[60] = (unsigned char  *)&shosamt;
          sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[60] = (         int  )0;
          sqlstm.sqindv[60] = (         short *)0;
          sqlstm.sqinds[60] = (         int  )0;
          sqlstm.sqharm[60] = (unsigned long )0;
          sqlstm.sqadto[60] = (unsigned short )0;
          sqlstm.sqtdso[60] = (unsigned short )0;
          sqlstm.sqhstv[61] = (unsigned char  *)&cashamt;
          sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[61] = (         int  )0;
          sqlstm.sqindv[61] = (         short *)0;
          sqlstm.sqinds[61] = (         int  )0;
          sqlstm.sqharm[61] = (unsigned long )0;
          sqlstm.sqadto[61] = (unsigned short )0;
          sqlstm.sqtdso[61] = (unsigned short )0;
          sqlstm.sqhstv[62] = (unsigned char  *)&SelfAge;
          sqlstm.sqhstl[62] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[62] = (         int  )0;
          sqlstm.sqindv[62] = (         short *)0;
          sqlstm.sqinds[62] = (         int  )0;
          sqlstm.sqharm[62] = (unsigned long )0;
          sqlstm.sqadto[62] = (unsigned short )0;
          sqlstm.sqtdso[62] = (unsigned short )0;
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

                                            /* Dsa2000 추가  2005.11.*/
                      
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               Write_batlog(seqno++, "6. 근로소득공제2 setting Error");  /*dsa2000 Rexec 대체*/
               err_print(sqlca.sqlcode,"6. 근로소득공제2 setting Error");
               exit(1);
          }
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 63;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1016;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
taxgross = fmax(taxgross,0); 

          if  (taxgross  <= INDEDBASIC)                               /* 2010.01.18 근로 소득금액 400만원 체크 추가 */
          {    
               laborded = trunc(taxgross   * INDEDBRATE /100) ;               
          }     
          else if ((taxgross > INDEDBASIC) && (taxgross <= INDEDLIMIT2))
               laborded = trunc( INDEDBASIC  * INDEDBRATE /100  +
                               ( taxgross - INDEDBASIC )*INDEDORATE / 100 );
          else if ((taxgross > INDEDLIMIT2) && (taxgross <= INDEDLIMIT3))
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +                        
                               (taxgross -  INDEDLIMIT2)*INDEDORATE2 / 100);
                              
          else if (taxgross > INDEDLIMIT3 && (taxgross <= INDEDLIMIT4))  /*parksh 20021213수정 */
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2-INDEDBASIC) * INDEDORATE /100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (taxgross - INDEDLIMIT3) * INDEDORATE3/100 );
                         
          else if (taxgross > INDEDLIMIT4)                              /*parksh 20021213 추가 근로소득공제4*/ 
               laborded = trunc(INDEDBASIC * INDEDBRATE /100 +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (INDEDLIMIT4-INDEDLIMIT3) * INDEDORATE3 /100 +
                               (taxgross - INDEDLIMIT4) * INDEDORATE4/100 );
   
          laboramt  = trunc(taxgross - laborded);     

laboramt   = fmax(laboramt,0);        
laborlimit = laboramt;                                  
          
          
          /*전산처리요청 2006.06.02.: 퇴직사원본인 관련외의 부양가족공제 안하도록 초기화 */
          mate     = 0;
          familyno = 0;
          /*  fami65no = 0; 20090318 65세 경로우대 폐지*/
          fami70no = 0;
          childno  = 0;
           

           /*  본인공제  */
          selfded = BASDED;

selfded    = fmin( laborlimit,  selfded);
laborlimit = fmax((laborlimit - selfded),0);          
          
          /* 2008.02.25********************************************************************/
          /* 퇴직자들의 기본.추가공제사항들 적용 안시킴
            -연말정산제도 변경시 지급조서 제출시 어려움 때문.  신영섭 대리 요청*/
          /*  배우자 공제  
           mateded = mate * BASDED;
          
               부양가족공제  
                       famided = familyno * BASDED; */
          famided = 0;
          
          /*기본공제 본인공제는 공제 허용 2008.02.25
          basicded= selfded + mateded + famided; */
          basicded= selfded;

          if  (SelfAge >= 70)   /* 근로자본인 경로자 체크..*/
               fami70no = 1;
          /*else if (SelfAge >= 65 )  20090318 65세 경로우대 폐지
            fami65no = 1;                */
          /********************************************************************/
                    
          oldded  = fami70no * APPOLDDED2;
          
oldded     = fmin( laborlimit,  oldded);
laborlimit = fmax((laborlimit - oldded),0);    

          /* 장애자 공제 */
          obsded  = obstacleno * OBSDEDADD;    

obsded     = fmin( laborlimit,  obsded);
laborlimit = fmax((laborlimit - obsded),0);                   
               
          /* 부녀자 공제 */
          womanded = woman * APPDED;           

womanded   = fmin( laborlimit,  womanded);
laborlimit = fmax((laborlimit - womanded),0);                   


                       /* 경로우대공제 
                       ---oldded  = fami65no * APPOLDDED;            
                       oldded  = oldded + fami70no * APPOLDDED2;  2004.12. dsa2000  경로우대70이상 추가공제
          
            장애자 공제
                       obsded  = obstacleno * OBSDEDADD;     2005년 100 => 200만원으로 인상
          
            부녀자 공제 
                       womanded = woman * APPDED;
          
            자녀양육비 공제      100만원으로 인상(2004.12.DSA2000)
                       childded= childno * APPOLDDED;
          
              추가공제 
                       appendded = oldded + obsded + womanded + childded;
                       
                       다자녀 추가공제
                       if (fami16no + fami720no == 2)
                       {
                         fewded = FEWDED1;
                       }
                       else if (fami16no + fami720no > 2)
                       {
                         fewded = FEWDED1 + ( ((fami16no+fami720no)-2)*FEWDED2 );
                       } */                
                       
                       /*  소수추가공제 폐지
                       {if (mate+familyno == 0)
                       {       fewno=1;
                               fewded= FEWDED1;
                       }
                       else if (mate+familyno == 1)
                       {       fewno=2;
                               fewded=FEWDED2;
                       }
                       else
                       {       fewno=0;
                               fewded=0;
                       }*/
                       /* 2008.02.25********************************************************************/

/* 연금보험료 공제 START ===============================================================================*/     
   /* ==========================================================================
      4.00       2001.12.14         유효성          연금보험료 추가
   ============================================================================= */     
        /*2002년부터 전액공제   anuded = (anuamt + banuamt) * 50 /100 ;*/
     anuded = fmax((anuamt + banuamt),0)  ;
                                     
anuded      = fmin( laborlimit,  anuded);
laborlimit  = fmax((laborlimit - anuded),0);    
                                                        
          medded = fmax((medamt + bmedamt),0);     /*  의료보험료  */
          
medded     = 0;
laborlimit = fmax((laborlimit - medded),0);                             
          
          hireded= fmax((hireamt + bhireamt),0);   /*  고용보험료  */

hireded     = 0;
laborlimit  = fmax((laborlimit - hireded),0);          

     specialded = medded + hireded;
     chagamamt  = laborlimit;
     taxlevel = laborlimit;      
          
     calctaxlimit = 0;     
     if  (taxlevel < 0 )
          taxlevel = 0;
        
     if  (taxlevel == 0)
          calctax = 0;
     else
          calctax = GetTax(taxlevel);
     calctaxlimit = calctax;   /* 2015.03.16 eyha 산출세액에서 차감해야함 */
          
          
/*
printf("DEBUG1 : empno=[%s],selfded=[%f],oldded=[%f],womanded=[%f],medded=[%f],hireded=[%f],anuded=[%f]\n",&empno[0], selfded,oldded,womanded,medded,hireded, anuded);          
printf("DEBUG2 : empno=[%s],taxgross=[%f],laborded=[%f],laboramt=[%f],laborlimit=[%f],taxlevel=[%f],calctax=[%f]\n",&empno[0], taxgross,laborded,laboramt,laborlimit,taxlevel, calctax);          
*/                     
     
/* 세액 공제  START=====================================================================*/
     /*근로소득 세액공제*/
     /*2015.06.02 eyha 근로소득세액공제 산식 변경*/
     /*2017.03.17 eyha yeta와 동기화
     if        (taxgross <= TAXDEDSECT1) {
        incomtdedlimit = TAXDEDSLIMIT1;
     }else if  (taxgross <= TAXDEDSECT2) {
        incomtdedlimit = fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*0.008),TAXDEDSLIMIT2);
     }else if  (taxgross >  TAXDEDSECT2) {
        incomtdedlimit = fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*0.5),TAXDEDLIMIT  );
     }}  */
     
     if        (taxgross <= TAXDEDSECT1) {
        incomtdedlimit = TAXDEDSLIMIT1;
     }else if  (taxgross <= TAXDEDSECT2) {
        incomtdedlimit = fmax(floor(TAXDEDSLIMIT1-(taxgross-TAXDEDSECT1)*0.008),TAXDEDSLIMIT2);
     }else if  (taxgross >  TAXDEDSECT2) {
        incomtdedlimit = fmax(floor(TAXDEDSLIMIT2-(taxgross-TAXDEDSECT2)*0.5),TAXDEDLIMIT  );
     }
     
     
     if (calctax < TAXDEDBASIC) {
          incomtded = calctax * TAXDEDBRATE / 100;
     }else {
          incomtded = (TAXDEDBASIC * TAXDEDBRATE / 100) +
                                      (calctax - TAXDEDBASIC) * TAXDEDORATE /100 ;
     }

     incomtded    = fmin(incomtdedlimit,incomtded);
     incomtded    = floor(incomtded);                   /* 2015.03.16 eyha 소수점 처리-세액공제계에서 오류남 */ 
     incomtded    = fmin(calctaxlimit,incomtded);       /* 2015.03.16 eyha 산출세액보다 작아야 함 */
     calctaxlimit = fmax(calctaxlimit-incomtded, 0);    /* 2015.03.16 eyha 산출세액에서 차감한 금액 비교 */
                                     
          /*  일반보험료 공제     */
          guarded = 0;
          
/* ==========================================================================
   4.00       2001.12.14         유효성          장애인전용보험료 추가
============================================================================= */  
          obsguarded = 0;
      
          insded = guarded + medded + hireded + obsguarded ;   /*  보험료공제   */
              
          /*  의료비 공제
              과세급여액*MEDORATE를 초과하는 의료비중 MEDDEDLIMIT를 한도로 공제 ,
              but 장애자,경로우대자의료비가 있는 경우 추가로 공제 
              추가공제에 본인의료비(shosamt) 포함 2004년 귀속부터.   */
          hosamt = ghosamt + ohosamt + nhosamt + shosamt;          
          hosded = hosamt - (taxgross  * MEDORATE /100);
          hosded = floor(hosded);
          if  (hosded<0)
               hosded=0;
          
          medappded_A = hosamt - (taxgross * MEDORATE / 100) - MEDDEDLIMIT;  /*한도초과분*/
          if  (medappded_A < 0 ) 
               medappded_A = 0;
          
          medappded_B = ohosamt + nhosamt + shosamt; /*한도 없는 의료비 총액*/
          if  (medappded_A >= medappded_B ) 
               hosded = hosded + medappded_B;
          else
               hosded = hosded + medappded_A;
   
   				hosded = 0;
   				
          /*본인 교육비*/
          seduded = 0;

          /*유치원 교육비*/   
          keduded = 0;
   
          /*초중고교육비*/
          ceduded = 0;              
   
          /*대학 교육비*/
          ueduded = 0;
   
    /* 장애인특수교육비 PARKSH 20021224 추가*/ 
     obseduded = 0;   /*2004.12.  dsa2000  장애인특수교육비 한도 폐지.*/
                
     eduded    = seduded + keduded + ceduded + ueduded +obseduded;    /*parksh 20021224 수정 + keduded1 */          

      /*주택자금*/
      /* --------------------------------------------------------------------------------
        40.11   2003.12.18   강륜종   장기주택저당차입 이자상환 한도액 추가..
        ①주택마련저축  ②주택임차 차입금상환 ③장기주택저당차입금
                                      주택자금 공제시 ①+② 만 공제시에는 한도가 300만원까지
                                                     ①+②+③ 공제시에는 한도가 1000만원까지
        ------------------------------------------------------------------------------- */       
     houseded = floor(houseamt * HSRATE / 100) + houseintamt ;
     
     if  (houseintamt > 0)
     {
          if ( houseded > HSDEDLIMIT2 )  houseded = HSDEDLIMIT2;
     }
     else
     {
          if ( houseded > HSDEDLIMIT )   houseded = HSDEDLIMIT;
     }
             
     houseded = floor(houseded);
     
     houseded = 0;
                                                
       
     /* 전액기부금 */
     agiveded= 0;
     
           /* 정치기부금 : 세액공제 신설 => dsa2000  2004.12. 세액공제(10만원) 이상의 금액은 전액기부금 처리.*/
     if  (poliamt > POLILIMIT)
     {  
          agiveded = agiveded + (poliamt - POLILIMIT);
          polided  = POLILIMIT;
     }
     else
     {
          polided  = poliamt;   /*polided 정치자금 세액공제*/
     }
           
      /* 특례지정기부금 parksh 20021224 추가 */
     spgivded = spgivamt;
     if  (spgivded > floor((laboramt-agiveded) * SPGIVDEDRATE / 100))
          spgivded = floor((laboramt-agiveded) * SPGIVDEDRATE / 100) ;
                    
                 /* 지정기부금 parksh 20021224 수정*/
     if  (pgiveamt > ((laboramt - agiveded - spgivded ) * GIVDEDRATE / 100))
          pgiveded = (laboramt - agiveded - spgivded) * GIVDEDRATE / 100;
     else
          pgiveded = pgiveamt;
       
                   /* 기부금공제 = 전액기부금  + 특례지정기부금 + 지정기부금 parksh 20021224 */
     giveded = agiveded + spgivded + pgiveded ;
     giveded = floor(giveded); /*dsa2000*/
     
     agiveded  = 0;
     spgivded  = 0;
     pgiveded  = 0;
     giveded   = 0;
     
     /* 특별공제 = 보험료공제 + 의료비공제 + 교육비공제 + 주택자금공제 +  기부금공제 +  결혼.장례.이사비용공제  */
     specialded = 0;
     
     standded = STDDED;
                
     if  (specialded < STDDED)
     {  
          insded    = hosded   = eduded   = houseded   = giveded   = 0;
          guarded   = obsguarded = obseduded = 0;
          seduded   = keduded  = ceduded    = ueduded   = 0;  /*keduded1 dsa2000  2004.12.*/
          agiveded  = pgiveded = spgivded = 0;
          specialded = 0 ;  /*2001.12.26. 유효성 표준공제 컬럼추가   specialded = STDDED;*/
          standded   = STDDED ;     specaddded = 0;
          
          standded   = fmin(calctaxlimit,standded);   /* 2015.03.16 eyha 산출세액보다 작아야 함 */                               

          /*printf("[debug1] : empno=%s,calctaxlimit=%f,standded=%f ,taxgross=%f \n",empno, calctaxlimit, standded, taxgross);               */

     }
   

        
/* 조세특례법에의한 소득공제 START=====================================================================*/             
   /*****개인연금*****/   
     pended  = (penamt1 + penamt2 +bpenamt ) * PENRATE / 100;
     
     if  (pended > PENDEDLIMIT)
          pended = PENDEDLIMIT;
     
     pended = 0;
   /* ==========================================================================
      4.00       2001.12.14         유효성          연금저축 추가
   ============================================================================= */     
     npended = npenamt + npenamt2 ;
     
     if  (npended > NPENDEDLIMIT) 
          npended = NPENDEDLIMIT;
     npended = 0;
       
     /*****투자조합********/      
     INVESTLIMIT    = taxgross * INVESTDEDRATE;                
     
     if  (INVESTLIMIT < 0)
          INVESTLIMIT = 0 ;
        
     investded  = investamt * INVESTRATE /100 ;     
     
     investded = 0;           
     
     if  (investded > INVESTLIMIT)
          investded = INVESTLIMIT;
     
     /*parksh 20021224 투자조합00~01 */
     OINVESTLIMIT    = taxgross * OINVESTDEDRATE;                
     
     if  (OINVESTLIMIT < 0)
          OINVESTLIMIT = 0 ;
        
     oinvestded      = oinvestamt * OINVESTRATE /100 ;                
     
     if  (oinvestded > OINVESTLIMIT)
          oinvestded = OINVESTLIMIT;
     
     oinvestded = 0;
       
     tinvestded = investded + oinvestded;      /*parksh  20021213  투자조합공제액합*/
     
      
   /*================================================================================
     2003.12. Dsa2000  추가....  => 2004.12  기명식선불카드 추가. 직불카드 요율 20%로 축소
   ① 신용카드등 사용금액 = 신용카드+기명식 선불카드+직불카드+지로납부금액
   ② 초과금액 = ①-(총급여액×10%)  : 공제대상금액
   ③ 신용카드 =(②×신용카드금액/①)×20%
   ④ 학원비   =(②×지로납부금액/①)×20%
   ⑤ 직불카드 =(②×직불카드사용금액/①)×20%
   ==> 총 공제금액 : ③+④+⑤       ☞ 한도액 :  총급여액×20%  와 500만원 중   적은 금액
   ================================================================================ */
     creditded = 0;
     /*creditamt = credittotamt - creditdedamt;  신용카드 공제 가능금액 = 총 공제신청금액 - 법인 사용분 */              
     
     if (creditamt < 0)    creditamt = 0;         /*dsa2000  2005.01.31 추가.*/
     
     totcreditamt = creditamt + debitamt + giroamt + cashamt;  /*①*/     
                
     if (totcreditamt < 0) totcreditamt = 0; 
                                               
     crededlimit2    =  floor( totcreditamt - (taxgross  * CREORATE / 100) );  /*②*/
     if  (crededlimit2 > 0)
     {       
          creditded =             floor((crededlimit2 * creditamt / totcreditamt) * CREDEDLRATE  /100) ; /*③*/                  
          creditded = creditded + floor((crededlimit2 * debitamt  / totcreditamt) * DEBITDEDRATE /100) ; /*④*/
          creditded = creditded + floor((crededlimit2 * giroamt   / totcreditamt) * GIRODEDRATE  /100) ; /*⑤*/ 
          creditded = creditded + floor((crededlimit2 * cashamt   / totcreditamt) * CREDEDLRATE  /100) ; /*⑥*/ 
     }
             
     /* 한도 체크 : 총과세급여액의 20%와 500만원중 적은금액 */
     if  (creamt1 < CREDEDLIMIT )
     { 
          if  (creditded > creamt1  )           
               creditded = creamt1;
     }
     else
     {
          if  (creditded > CREDEDLIMIT  )           
               creditded = CREDEDLIMIT;
     }                        
      /* Dsa2000  2003.12.  End..........................................................*/                       
     creditded = 0;   
               
     /*===============================================================================
      2003.12. Dsa2000  추가....
      외국인임직원 해외근무에 따른 추가비용 소득공제
      - 공제비용 : 외국인학교 자녀교육비, 월세 지출액
      - 공제한도 : (월정액급여 연간합계액-공제비용)의 40%      
      ===============================================================================*/  
     /* 2004.12. 외국인 세액개편에 따라...폐지.
     FOREIGNDED = 0;
      sprintf(JUMINID, "%.1s",JUMINID+7);
      
     if ( (strcmp(JUMINID, "5") == 0 ) || (strcmp(JUMINID, "6") == 0 ) ) 
     {
       FOREIGNDED = ( taxgross - FOREIGNAMT ) * FOREDEDRATE / 100;    
       
       if ( FOREIGNAMT < FOREIGNDED )
          FOREIGNDED = FOREIGNAMT;       
     }   
      Dsa2000  2003.12.  End..........................................................*/
     
     /*조세특례법에의한 소득공제 합계*/
       incomeded = basicded + appendded + specialded + standded + pended  +
                   fewded   + creditded + tinvestded + anuded   + npended ;
                              /*+ FOREIGNDED ;       2004.12. dsa2000 추가 외국인 추가공제...폐지*/
       incomeded = 0;                       
                
     /*  주택차입금이자세액 공제  */
     hloanded = floor(hloanamt * HSINTRATE / 100);
     hloanded = 0;
   
                /*  외국납부세액공제   */
     forided = foriamt;
     
     
     
     /*세액공제 합계*/
     tdedsum = standded + incomtded + hloanded + forided + polided; 
         
     
/* 갑근세 /주민세 / 농특세 START=====================================================================*/               
     if  (calctax - tdedsum > 0) 
     {

          /* 2007.01. 
          dintax = floor((calctax - tdedsum) / 10) * 10;
          djutax = floor(dintax / 100) * 10 ;  */
          
          /* 2017.03.17 eyha yeta 동기화 처리 */
          dintax = calctax - tdedsum;
          djutax = floor(dintax / 10);  
          
          /*dintax = calctax - tdedsum;
          djutax = dintax * 0.1;*/
     }                
     else 
     {
          dintax = 0 ;
          djutax = 0 ;    
     }              
            
      
     if  (hloanded > 0 || tinvestded > 0)  /*parksh 수정*/
     {
          /* 2007.01.*/
          dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100) ;                
          dnongtax = floor(dnongtax / 10) * 10;
          /*dnongtax = (hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100;
          dnongtax = dnongtax * 0.1;*/
     }
     else               
          dnongtax = 0 ;                  
       
     intax   = mintax + bintax ;
     jutax   = mjutax + bjutax ;
     nongtax = mnongtax + bnongtax ;
            
     /* 2007.01. 원단위 절사방법 변경 - dintax를  floor를 안하고 yintax를 trunc하게끔 변경.
     yintax   = dintax - intax,
     yjutax   = djutax - jutax;
     ynongtax = dnongtax - nongtax;   2017.02월까지 사용*/

     /* 2017.03.16 eyha yeta와 원단위 처리 동기화 */
     yintax   = trunc((dintax - intax) / 10 ) * 10,
     yjutax   = trunc((djutax - jutax) / 10 ) * 10;
     ynongtax = trunc((dnongtax - nongtax) / 10 ) * 10;   

     
     /*yintax   = trunc( (dintax   - intax  ) / 10 ) * 10;
       yjutax   = trunc( (djutax   - jutax  ) / 10 ) * 10;
       ynongtax = trunc( (dnongtax - nongtax) / 10 ) * 10;*/
              
     ycalctax = yintax + yjutax + ynongtax;
    
     UpdateResult();
     }
}

Calc_Yearend()
{
     double  medappded_A;  
     double  medappded_B;
     double  crededlimit2;
     double  creamt1;
     
     medappded_A = medappded_B = crededlimit2 = creamt1 = 0;
     
     ReadPkcysbas();      /*  PKCYSBAS 연말정산기준 테이블 읽어오기 */ 
     ReadTax();           /*  연세율표를 읽어 배열에 저장한다 */
     
/*2014.01.13.hjku. 삭제(패러미터로 받음)     
     EXEC  SQL
     SELECT  max(retdate) 
     INTO  :tempdate
     FROM  PKMRYMAS;   
     
     if  (sqlca.sqlcode == 1403 )
     {  
          Write_batlog(seqno++, "1. 정산할 자료가 없습니다"); 
          err_print(sqlca.sqlcode,"1. 정산할 자료가 없습니다");
          exit(1);
     }
     else if( sqlca.sqlcode != 0)
     {  
          Write_batlog(seqno++, "2. 퇴직일  read Error");  
          err_print(sqlca.sqlcode,"2. 퇴직일 read ERROR");
          exit(1);
     }
     
     sprintf(workyy,"%.4s",tempdate);*/
     
     /* 귀속일 */
     /* EXEC     SQL
     UPDATE   PKMRYMAS a
     SET  YSFRDATE = (select GREATEST(NVL(ORGEMPDATE,:workyy||'0101'),:workyy||'0101')
                        from pkmrtmas b
                       where a.empno = b.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set YSFRDATE=(select GREATEST(NVL(OR\
GEMPDATE,(:b0||'0101')),(:b0||'0101'))  from pkmrtmas b where a.empno=b.empno\
) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1031;
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
          Write_batlog(seqno++, "귀속일1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"귀속일1 setting Error");
          exit(1);
     }
                          
                         
     /* EXEC    SQL
     UPDATE  PKMRYMAS a
        SET  YSTODATE = RETDATE
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set YSTODATE=RETDATE where retdate l\
ike (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1058;
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
          Write_batlog(seqno++, "귀속일2 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"귀속일2 setting Error");
          exit(1);
     }   
     
     /* EXEC   SQL
     UPDATE  PKMRYMAS P
        SET  LASTMONPAY = 
      ( SELECT SUM( NVL(BASICAMT,0)    + NVL(INFOAMT,0)  + NVL(DUTYAMT,0)    +
                    NVL(BBASICAMT,0)   + NVL(BINFOAMT,0) + NVL(BDUTYAMT,0)   +
                    NVL(MATEAMT,0)     + NVL(PARTAMT,0)  + NVL(CHILDAMT,0)   +
                    NVL(OVTMAMT,0)     + NVL(SPTMAMT,0)  + NVL(MCARTAXAMT,0) +
                    NVL(BOKJISUPAMT,0) + NVL(AIDAMT1,0)  + NVL(AIDAMT2,0)    + 
                    NVL(AIDAMT3,0)     + NVL(LICEAMT,0)  + NVL(MBONAMT,0)    + 
                    NVL(ODTAXAMT,0)    + NVL(SOPAY,0)    + NVL(LONGSUPAMT,0) +
                    NVL(CHILDEDUAMT,0) + NVL(MEDPAYAMT,0)+ NVL(TRAINSUPAMT,0)+ 
                    NVL(OVMCAMT,0)     + NVL(TAXPAY,0)   + NVL(FIXPAY,0)     +
                    NVL(QUATERPAY,0)   + NVL(HOLIPAY,0)  + NVL(ROLEAMT,0)    +
                    NVL(R.ITAMT,0)   /oDSA2000 ADD  2005.01.12 o/
                  )
         FROM  PKHPHIS R, (SELECT EMPNO MEMPNO, CALYN 
                             FROM PKMRTMAS) 
         WHERE  SUBSTR(PAYDATE,1,6) = DECODE(NVL(CALYN,'N'),'Y',SUBSTR(RETDATE,1,6),   /o PAYDATE 6 자리에서 8 자리 변경으로 인한 수정 [2018-09-18 이상용] o/  
                         TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM'),-1),'YYYYMM')) 
           AND  P.EMPNO = R.EMPNO
           AND  MEMPNO  = R.EMPNO
      )
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set LASTMONPAY=(select sum((((((((((\
(((((((((((((((((((((NVL(BASICAMT,0)+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+NVL(BBAS\
ICAMT,0))+NVL(BINFOAMT,0))+NVL(BDUTYAMT,0))+NVL(MATEAMT,0))+NVL(PARTAMT,0))+N\
VL(CHILDAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(MCARTAXAMT,0))+NVL(BOKJIS\
UPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAMT2,0))+NVL(AIDAMT3,0))+NVL(LICEAMT,0))+NVL\
(MBONAMT,0))+NVL(ODTAXAMT,0))+NVL(SOPAY,0))+NVL(LONGSUPAMT,0))+NVL(CHILDEDUAM\
T,0))+NVL(MEDPAYAMT,0))+NVL(TRAINSUPAMT,0))+NVL(OVMCAMT,0))+NVL(TAXPAY,0))+NV\
L(FIXPAY,0))+NVL(QUATERPAY,0))+NVL(HOLIPAY,0))+NVL(ROLEAMT,0))+NVL(R.ITAMT,0)\
))  from PKHPHIS R ,(select EMPNO MEMPNO ,CALYN  from PKMRTMAS ) where ((SUBS\
TR(PAYDATE,1,6)=DECODE(NVL(CALYN,'N'),'Y',SUBSTR(RETDATE,1,6),TO_CHAR(ADD_MON\
THS(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM'),(-1)),'YYYYMM')) and P.EMPNO=R.EMPN\
O) and MEMPNO=R.EMPNO)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1077;
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
          Write_batlog(seqno++, "3.1 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.1 주급여 setting Error");
          exit(1);
     }
     
     
     /*급여총액 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL
     UPDATE PKMRYMAS P
     SET    MPAYSUM = 
      ( SELECT SUM(
                   NVL(BASICAMT   ,0) +NVL(INFOAMT  ,0)+NVL(DUTYAMT   ,0)+
                   NVL(BBASICAMT  ,0) +NVL(BINFOAMT  ,0)+NVL(BDUTYAMT  ,0)+
                   NVL(MATEAMT  ,0) +NVL(PARTAMT  ,0)+NVL(CHILDAMT  ,0)+
                   NVL(OVTMAMT  ,0) +NVL(SPTMAMT  ,0)+NVL(MCARTAXAMT  ,0)+
                   NVL(BOKJISUPAMT  ,0) +NVL(AIDAMT1  ,0)+NVL(AIDAMT2   ,0)+ 
                   NVL(AIDAMT3  ,0) +NVL(LICEAMT  ,0)+NVL(MBONAMT   ,0)+ 
                   NVL(ODTAXAMT  ,0) +NVL(SOPAYSUM  ,0)+NVL(LONGSUPAMT  ,0)+
                   /oNVL(YUEDUAMT  ,0) +o/
                   nvl(YUEDUTAX,0)     + /odsa2000  2005.01. 비과세처리 yueduamt o/
                   NVL(SELFEDUAMT  ,0) +
                   NVL(DRVLICEAMT  ,0) +NVL(LECTSUPAMT  ,0)+
                   NVL(EDUSUPAMT  ,0) +NVL(MEDSUPAMT  ,0)+NVL(SUPAMT1   ,0)+
                   NVL(SUPAMT2  ,0) +NVL(SUPAMT3  ,0)+  
                   NVL(CHILDEDUAMT  ,0) +NVL(MEDPAYAMT,0) + 
                   NVL(TRAINSUPAMT  ,0) +NVL(OVMCAMT  ,0) +NVL(TAXPAY,0)    +
                   NVL(FIXPAY  ,0) +NVL(ROLEAMT,0)   +
                   NVL(QUATERPAY  ,0) +NVL(HOLIPAY,0)   +/odsa2000 2004.01. 분기/명절연봉이 상여총액에 더해지던것을 급여총액으로o/ 
                   NVL(ITAMT         ,0) + /oDSA2000 ADD  2005.01.12 o/
                   NVL(WINTERAMT     ,0) + /oDSA2000 ADD  2006.04.19. 요청서 월동보조비로 쓰던 칼럼을 영업인세티브 항목으로 사용 o/
                   NVL(HOMESUPAMT    ,0)   /oDSA2000 ADD  2006.06. 귀향지원금 => 선택적복리후생비로 변경 사용.o/
            )
          FROM   PKHPHIS R
         WHERE   substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set MPAYSUM=(select sum(((((((((((((\
(((((((((((((((((((((((((((((NVL(BASICAMT,0)+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+\
NVL(BBASICAMT,0))+NVL(BINFOAMT,0))+NVL(BDUTYAMT,0))+NVL(MATEAMT,0))+NVL(PARTA\
MT,0))+NVL(CHILDAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(MCARTAXAMT,0))+NV\
L(BOKJISUPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAMT2,0))+NVL(AIDAMT3,0))+NVL(LICEAMT\
,0))+NVL(MBONAMT,0))+NVL(ODTAXAMT,0))+NVL(SOPAYSUM,0))+NVL(LONGSUPAMT,0))+nvl\
(YUEDUTAX,0))+NVL(SELFEDUAMT,0))+NVL(DRVLICEAMT,0))+NVL(LECTSUPAMT,0))+NVL(ED\
USUPAMT,0))+NVL(MEDSUPAMT,0))+NVL(SUPAMT1,0))+NVL(SUPAMT2,0))+NVL(SUPAMT3,0))\
+NVL(CHILDEDUAMT,0))+NVL(MEDPAYAMT,0))+NVL(TRAINSUPAMT,0))+NVL(OVMCAMT,0))+NV\
L(TAXPAY,0))+NVL(FIXPAY,0))+NVL(ROLEAMT,0))+NVL(QUATERPAY,0))+NVL(HOLIPAY,0))\
+NVL(ITAMT,0))+NVL(WINTERAMT,0))+NVL(HOMESUPAMT,0)))  from PKHPHIS R where (s\
ubstr(paydate,1,4)=:b0 and p.empno=r.empno)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1096;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "3.2 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.2 주급여 setting Error");
          exit(1);
     }

/* printf(" mpaysum~~~~~~~~~ \n"); */
  /*상여총액 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL
     UPDATE  PKMRYMAS P
        SET  MBONSUM = 
             (SELECT SUM(NVL(BONUSAMT ,0)+NVL(INCENTAMT,0)+NVL(TRAINAMT,0)+
                         /oNVL(WINTERAMT,0)+NVL(HOMESUPAMT,0)+NVL(YBONAMT,0)+ dsa2000  2006.04.19. 요청서 o/
                          NVL(YBONAMT,0)+ NVL(SBONTAXAMT,0) + NVL(SOBONSUM,0)  /oNVL(SBONAMT  ,0)  dsa2000  2005.12.o/             
                        )
                FROM  PKHPHIS R
               WHERE  substr(paydate,1,4) = :workyy 
                 and  p.empno = r.empno)
     WHERE retdate like :workyy||'%' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS P  set MBONSUM=(select sum((((((NVL(BON\
USAMT,0)+NVL(INCENTAMT,0))+NVL(TRAINAMT,0))+NVL(YBONAMT,0))+NVL(SBONTAXAMT,0)\
)+NVL(SOBONSUM,0)))  from PKHPHIS R where (substr(paydate,1,4)=:b0 and p.empn\
o=r.empno)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1119;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "3.3 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.3 주급여 setting Error");
          exit(1);
     }
     
     /*비과세 급여 : 급여이력 데이터 업데이트 */
     /* EXEC   SQL 
     UPDATE  PKMRYMAS p
        SET  (MNOTAX,NOTAXEXCEPT) = /o(SELECT SUM(NVL(NOTAXPAYSUM,0)) 2001-02-06 비과세급여는 식교비와 자가운전지원금의 비과세만 적용o/
                    (select sum(LEAST(NVL(r.YUEDUAMT,0)-nvl(YUEDUTAX,0), TO_NUMBER(:yuedunotax))), /o유아보육비 비과세 추가 2005.01. DSA2000o/                                
                            sum(NVL(r.ODAMT ,0)   - NVL(r.ODTAXAMT,0)  +         /o kth 2010.04.27 유치원 학자금을 제외한 비과세를 넣어 줌. 원천징수영수증에 표기 맞게o/
                                NVL(r.MCARAMT,0)  - NVL(r.MCARTAXAMT,0))
                       FROM PKHPHIS r
                      WHERE substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set (MNOTAX,NOTAXEXCEPT)=(select sum\
(LEAST((NVL(r.YUEDUAMT,0)-nvl(YUEDUTAX,0)),TO_NUMBER(:b0))) ,sum((((NVL(r.ODA\
MT,0)-NVL(r.ODTAXAMT,0))+NVL(r.MCARAMT,0))-NVL(r.MCARTAXAMT,0)))  from PKHPHI\
S r where (substr(paydate,1,4)=:b1 and p.empno=r.empno)) where retdate like (\
:b1||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1142;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
          Write_batlog(seqno++, "3.4 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.4 주급여 setting Error");
          exit(1);
     }
     
     /*상여총액 : 퇴직월 데이터 업데이트 */
     /* EXEC  SQL
     UPDATE  PKMRYMAS a
        SET  MBONSUM = (select NVL(a.MBONSUM,0)+NVL(b.YENAMT,0)+NVL(b.MONAMT,0) 
                          from pkmrtmas b       
                         where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set MBONSUM=(select ((NVL(a.MBONSUM,\
0)+NVL(b.YENAMT,0))+NVL(b.MONAMT,0))  from pkmrtmas b where a.empno=b.empno) \
where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1169;
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
          Write_batlog(seqno++, "3.5 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.5 주급여 setting Error");
          exit(1);
     }
     
     /*비과세 총액 : 퇴직월 데이터 업데이트 */
     /*2010.04.27 kth 비과세 총액(유치원학자금 제외 ) : 퇴직월 데이터 업데이트 원천징수 영수증 표기 방법에 따라 수정*/
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  (MNOTAX,NOTAXEXCEPT) = (SELECT NVL(A.MNOTAX ,0) , /o 기타비과세급여 추가 + 
                                            NVL(B.ODAMT ,0)  - NVL(B.ODTAXAMT,0)   +
                                            NVL(B.MCARAMT,0) - NVL(B.MCARTAXAMT,0) +
                                            NVL(B.NOTAXPAY,0) o/
                                            NVL(A.NOTAXEXCEPT ,0) + 
                                            NVL(B.ODAMT ,0)  - NVL(B.ODTAXAMT,0)   +
                                            NVL(B.MCARAMT,0) - NVL(B.MCARTAXAMT,0) +
                                            NVL(B.NOTAXPAY,0) /o 기타비과세급여 추가 o/
                                       from PKMRTMAS B       
                                      where A.EMPNO = B.EMPNO) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set (MNOTAX,NOTAXEXCEPT)=(select NVL\
(A.MNOTAX,0) ,(((((NVL(A.NOTAXEXCEPT,0)+NVL(B.ODAMT,0))-NVL(B.ODTAXAMT,0))+NV\
L(B.MCARAMT,0))-NVL(B.MCARTAXAMT,0))+NVL(B.NOTAXPAY,0))  from PKMRTMAS B wher\
e A.EMPNO=B.EMPNO) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1188;
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
          Write_batlog(seqno++, "3.6 주급여 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.6 주급여 setting Error");
          exit(1);
     }
     
        
     
     /*급여총액 : 퇴직월 데이터 업데이트 */
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  MPAYSUM = (SELECT NVL(MPAYSUM,0)   + NVL(BASICAMT,0) + NVL(INFOAMT,0) +
                               NVL(DUTYAMT,0)   + NVL(PROMAMT ,0) + NVL(FAMIAMT,0) + 
                               NVL(LICEAMT,0)   + NVL(ODTAXAMT,0) + NVL(MCARTAXAMT,0) +
                               NVL(OVTMAMT,0)   + NVL(SPTMAMT ,0) + NVL(BOKJISPAMT,0) +
                               NVL(AIDAMT1,0)   + NVL(AIDAMT2 ,0) + NVL(MBONAMT,0)+
                               NVL(TAXPAY,0)    + NVL(FIXPAY,0)   + NVL(ROLEAMT,0)+
                               NVL(QUATERPAY,0) + NVL(HOLIPAY,0)  + /odsa2000 2004.01. 분기/명절연봉이 상여총액에 더해지던것을 급여총액으로o/ 
                               NVL(ITAMT,0)     +      /oDSA2000 ADD  2005.01.12 o/
                               NVL(WINTERAMT,0) +      /oDSA2000 ADD  2006.04.19. 영업인센티브로 변경 사용 o/
                               NVL(HOMESUPAMT,0)+      /oDSA2000 ADD  2006.06.    선택적복리후생비로 변경사용o/
                               NVL(WELFARECARDAMT,0)   /ohjku    ADD  2013.05.    선복비카드과세 추가o/
                              FROM PKMRTMAS B
                             WHERE A.EMPNO = B.EMPNO) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set MPAYSUM=(select ((((((((((((((((\
(((((((NVL(MPAYSUM,0)+NVL(BASICAMT,0))+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+NVL(PR\
OMAMT,0))+NVL(FAMIAMT,0))+NVL(LICEAMT,0))+NVL(ODTAXAMT,0))+NVL(MCARTAXAMT,0))\
+NVL(OVTMAMT,0))+NVL(SPTMAMT,0))+NVL(BOKJISPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAM\
T2,0))+NVL(MBONAMT,0))+NVL(TAXPAY,0))+NVL(FIXPAY,0))+NVL(ROLEAMT,0))+NVL(QUAT\
ERPAY,0))+NVL(HOLIPAY,0))+NVL(ITAMT,0))+NVL(WINTERAMT,0))+NVL(HOMESUPAMT,0))+\
NVL(WELFARECARDAMT,0))  from PKMRTMAS B where A.EMPNO=B.EMPNO) where retdate \
like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1207;
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
          Write_batlog(seqno++, "3.7 주급여1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.7 주급여1 setting Error");
          exit(1);
     }
   
     /* EXEC  SQL
     UPDATE  PKMRYMAS A
        SET  MBONSUM = (SELECT NVL(MBONSUM,0)  +NVL(BONUSAMT,0) +NVL(INCENTAMT,0) +
                               /oNVL(TRAINAMT,0) +NVL(WINTERAMT,0) +NVL(SBONAMT,0) + NVL(HOMESUPAMT,0) dsa2000  2006.04.19. (상여총액에서 제외)o/
                               NVL(TRAINAMT,0) +NVL(SBONAMT,0)
                               /oNVL(QUATERPAY  ,0)+NVL(HOLIPAY  ,0)o/
                          FROM PKMRTMAS B
                         WHERE A.EMPNO = B.EMPNO)      
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS A  set MBONSUM=(select ((((NVL(MBONSUM,\
0)+NVL(BONUSAMT,0))+NVL(INCENTAMT,0))+NVL(TRAINAMT,0))+NVL(SBONAMT,0))  from \
PKMRTMAS B where A.EMPNO=B.EMPNO) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1226;
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
          Write_batlog(seqno++, "3.7 주급여2 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.7 주급여2 setting Error");
          exit(1);
     }
     
     /*dsa2000  2007.01. 우리사주 인출시 과세액 반영 추가...*/
     /*우리사주인출이력(PSDOHIS)의 WDSTAMT1 칼럼에 우리사주 시스템에서 과세금액 계산되어짐 (계산 시점 체크해야함)*/
     /* EXEC SQL 
     update PKMRYMAS M  
        Set COSTOCKTAX = (Select sum(nvl(WDSTAMT1,0)) from PSDOHIS
                           Where Substr(reqdate,1,4) = :workyy 
                            And M.empno = empno             
                          Group by empno )
      Where Empno in (Select empno from PSDOHIS 
                       Where Substr(reqdate,1,4) = :workyy  
                         AND nvl(WDSTAMT1,0) <> 0   ) 
       and retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS M  set COSTOCKTAX=(select sum(nvl(WDSTA\
MT1,0))  from PSDOHIS where (Substr(reqdate,1,4)=:b0 and M.empno=empno) group\
 by empno) where (Empno in (select empno  from PSDOHIS where (Substr(reqdate,\
1,4)=:b0 and nvl(WDSTAMT1,0)<>0)) and retdate like (:b0||'%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1245;
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
          Write_batlog(seqno++, "3.8 우리사주 인출시 과세액 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"3.8 우리사주 인출시 과세액 setting Error");
          exit(1);
     }                              
           /*******************************************************/
           
     /* EXEC SQL 
     UPDATE  PKMRYMAS 
        SET  familyno = nvl(fami16no,0)  + nvl(fami720no,0) + nvl(fami6064no,0) 
                      + nvl(fami70no,0),                                              /o + nvl(fami65no,0) kth 2009.03.18 65세 경로우대 공제 페지o/
             taxgross = nvl(mpaysum,0)   + nvl(mbonsum,0)   + nvl(bpaysum,0)     /o 총과세액 o/
                      + nvl(bbonsum,0)   + nvl(mcogbonsum,0) 
                      + nvl(COSTOCKTAX,0)               ,                        /o우리사주인출 과세액 합산 2007.01.o/
             notax    = nvl(mnotax,0)    + nvl(bnotax,0)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS  set familyno=(((nvl(fami16no,0)+nvl(fa\
mi720no,0))+nvl(fami6064no,0))+nvl(fami70no,0)),taxgross=(((((nvl(mpaysum,0)+\
nvl(mbonsum,0))+nvl(bpaysum,0))+nvl(bbonsum,0))+nvl(mcogbonsum,0))+nvl(COSTOC\
KTAX,0)),notax=(nvl(mnotax,0)+nvl(bnotax,0)) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1272;
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


      
     /* 1346(전영상) 퇴직자 환급관련 과세급여 조정(임시사용)
     EXEC SQL
     UPDATE PKMRYMAS
     SET    TAXGROSS = TAXGROSS - 39939310
     WHERE  EMPNO = '1346';           
   
     if ( sqlca.sqlcode != 0)
     {  
      Write_batlog(seqno++, "4. 급여총액 setting Error");
      err_print(sqlca.sqlcode,"4. 급여총액 setting Error");
      exit(1);
     }*/
     
     /* 주민번호 체크 위하여 추가함.  2004.01.05.  Dsa2000  강륜종  */
     /* EXEC SQL 
     UPDATE  PKMRYMAS p
        SET  juminid = (Select juminid from pimpmas where p.empno=empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set juminid=(select juminid  from pi\
mpmas where p.empno=empno) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1291;
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
          Write_batlog(seqno++, " 주민번호setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode," 주민번호 Setting Error");
          exit(1);
     }  
     /********************************************************************************/  
     /*dsa2000   2004.12  외국인 과세특례 신설에 따른 사항  */
           /*          총근로소득의 30%를 추가로 비과세 처리한다. 
     EXEC SQL
     UPDATE PKMRYMAS
     SET    MPAYSUM    = (MPAYSUM+NOTAX)    - floor((MPAYSUM+NOTAX)    * 30 / 100),
            MBONSUM    = MBONSUM    - floor(MBONSUM    * 30 / 100),
            MCOGBONSUM = MCOGBONSUM - floor(MCOGBONSUM * 30 / 100),
            BPAYSUM    = (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100),
            BBONSUM    = BBONSUM    - floor(BBONSUM    * 30 / 100),
            TAXGROSS   = (MPAYSUM+NOTAX)    - floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         MBONSUM    - floor(MBONSUM    * 30 / 100) +
                         MCOGBONSUM - floor(MCOGBONSUM * 30 / 100) +
                         (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         BBONSUM    - floor(BBONSUM    * 30 / 100) ,
            NOTAX      = floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         floor(MBONSUM    * 30 / 100) +
                         floor(MCOGBONSUM * 30 / 100) +
                         floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         floor(BBONSUM    * 30 / 100) +
                         NVL(MNOTAX,0)
     WHERE  SUBSTR(JUMINID,8,1) in ('5','6');
     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {  
      Write_batlog(seqno++, " 외국인 과세금액 setting Error"); 
      err_print(sqlca.sqlcode," 외국인 과세금액 Setting Error");
      exit(1);
     }  
     -------------------------------------------------------------*/
     
   
     /* EXEC SQL 
     UPDATE  PKMRYMAS p
        SET  (medamt, hireamt,  mintax, mjutax, anuamt) = 
             (SELECT sum(meddamt), sum(empldamt), 
                     sum(intax), sum(jutax), sum(anudamt)
                FROM  PKHPHIS r
               WHERE  substr(paydate,1,4) = :workyy and p.empno = r.empno)
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set (medamt,hireamt,mintax,mjutax,an\
uamt)=(select sum(meddamt) ,sum(empldamt) ,sum(intax) ,sum(jutax) ,sum(anudam\
t)  from PKHPHIS r where (substr(paydate,1,4)=:b0 and p.empno=r.empno)) where\
 retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1310;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "12. 의보,고보등 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 의보,고보등 setting Error");
          exit(1);
     }
   
     /*퇴직월 의보,고보 포함 */
     /* EXEC SQL 
     UPDATE   PKMRYMAS a
        SET   medamt = (select nvl(medamt,0)+nvl(medamt1,0)
                          from pkmrtmas b
                         where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set medamt=(select (nvl(medamt,0)+nv\
l(medamt1,0))  from pkmrtmas b where a.empno=b.empno) where retdate like (:b0\
||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1333;
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
          Write_batlog(seqno++, "12. 의보 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 의보 setting Error");
          exit(1);
     }                   
                        
     /* EXEC SQL 
     UPDATE  PKMRYMAS a
        SET  hireamt=(select nvl(hireamt,0)+nvl(emplamt,0)
                        from pkmrtmas b
                       where a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set hireamt=(select (nvl(hireamt,0)+\
nvl(emplamt,0))  from pkmrtmas b where a.empno=b.empno) where retdate like (:\
b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1352;
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
          Write_batlog(seqno++, "12. 고보 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 고보 setting Error");
          exit(1);
     }
     
     /* EXEC SQL 
     UPDATE   PKMRYMAS a
        SET   anuamt=(select  nvl(a.anuamt,0)+nvl(anuselfamt,0)
                        from  pkmrtmas b
                       where  a.empno = b.empno) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS a  set anuamt=(select (nvl(a.anuamt,0)+\
nvl(anuselfamt,0))  from pkmrtmas b where a.empno=b.empno) where retdate like\
 (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1371;
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
          Write_batlog(seqno++, "12. 국민연금 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"12. 국민연금 setting Error");
          exit(1);
     }
     
   /******2001년이후입사자는 연금저축으로******/  
       /*EXEC SQL
       UPDATE PKMRYMAS a  2011.12.13 kth 주석처리
             SET NPENAMT =  PENAMT1, PENAMT1 = 0
             WHERE EMPNO IN (SELECT EMPNO FROM PKMRTMAS  WHERE empdate > '2001')
              AND  EMPNO NOT IN (SELECT  NEWEMPNO FROM  PZNEWEMPNO) ; */
              
            /* Dsa2000  2004.01.14.  입사일자 기준테이블을 급여마스터 테이블로 변경 
     EXEC SQL
     UPDATE PKMRYMAS a
        SET NPENAMT = PENAMT1, 
            PENAMT1 = 0
      WHERE EMPNO IN (SELECT EMPNO FROM PKMPMAS WHERE empdate > '2001')
        AND EMPNO NOT IN (SELECT NEWEMPNO FROM PZNEWEMPNO) ;
           
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          Write_batlog(seqno++, "13. 연금저축setting Error");  dsa2000 Rexec 대체
          err_print(sqlca.sqlcode,"13. 연금저축 setting Error");
          exit(1);
     }                       */
  
  /* Dsa2000  2005.12.26. 노동조합비 일반기부금으로 공제토록 하기위하여 추가.  * 반영여부 미결정.  
  EXEC SQL 
  UPDATE   PKMRYMAS p
  SET   pgiveamt = (SELECT sum(nojoamt)
                 FROM PKHPHIS r
                WHERE substr(paydate,1,4) = :workyy 
                  AND p.empno = r.empno);
  if ( sqlca.sqlcode != 0)
  {  
   Write_batlog(seqno++, "14. 일반기부금(노동조합비) setting Error");
   err_print(sqlca.sqlcode,"14. 일반기부금(노동조합비) setting Error");
   exit(1);
  }   
********************************************/  

     /* EXEC SQL 
     UPDATE  PKMRYMAS p
        SET  mintax=nvl(mintax,0),
             mjutax=nvl(mjutax,0),
             anuamt=nvl(anuamt,0) 
     WHERE retdate like :workyy||'%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS p  set mintax=nvl(mintax,0),mjutax=nvl(\
mjutax,0),anuamt=nvl(anuamt,0) where retdate like (:b0||'%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1390;
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
          Write_batlog(seqno++, "14. 소득세 ,주민세등 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"14. 소득세 ,주민세등 setting Error");
          exit(1);
     }
     
      
     /* EXEC SQL DECLARE c1 CURSOR FOR
     select empno,nvl(taxgross,0),nvl(mate,0),nvl(familyno,0), /o nvl(fami65no,0), 20090318 65세 경로우대 폐지o/
            nvl(obstacleno,0),nvl(childno,0),nvl(woman,0),nvl(medamt,0),
            nvl(bmedamt,0),nvl(hireamt,0),nvl(bhireamt,0),nvl(guaramt,0),
            nvl(obsguaramt,0),nvl(ghosamt,0),nvl(ohosamt,0),nvl(nhosamt,0),
            nvl(keduno,0),nvl(ueduno,0),  nvl(ceduno,0),
            /onvl(keduno1,0), nvl(keduamt1,0), parksh 20021224 취학전아동교육비로 통합o/
            nvl(seduamt,0),nvl(keduamt,0),nvl(ceduamt,0),nvl(ueduamt,0),
            nvl(houseamt,0),nvl(houseintamt,0),nvl(agiveamt,0),nvl(pgiveamt,0),
            nvl(anuamt,0), nvl(banuamt,0), nvl(penamt1,0),nvl(penamt2,0),nvl(bpenamt,0),
            nvl(npenamt,0), nvl(npenamt2,0),nvl(propamt,0),nvl(bpropamt,0),nvl(hloanamt,0),
            nvl(foriamt,0),nvl(etctamt,0),  /o nvl(stkamt,0),parksh nvl(lstkamt,0),o/
            nvl(mintax,0),nvl(mjutax,0),nvl(bintax,0),nvl(bjutax,0), 
            nvl(mnongtax,0),nvl(bnongtax,0), nvl(mcogbonsum,0),   
            nvl(creditamt,0), nvl(investamt,0),
            nvl(obseduno,0),/o parksh 20021224 추가 nvl(olstkamt,0),o/
            nvl(obseduamt,0), nvl(oinvestamt,0), nvl(spgivamt,0), /o parksh 20021224 추가 o/
            nvl(DEBITAMT,0), nvl(GIROAMT,0), nvl(JUMINID,0),  /o dsa2000 추가 2003.12.
            /onvl(FOREIGNAMT,0), nvl(FOREIGNDED,0)              dsa2000 2004.12  삭제 o/
            nvl(poliamt,0),nvl(fami70no,0),nvl(specaddno,0),nvl(specaddded,0),nvl(shosamt,0),/o2004.12.  dsa2000o/
            nvl(cashamt,0),                                     /o Dsa2000 추가  2005.11.o/
            (to_number(to_char(sysdate,'YYYY')) -    
            to_number(decode(substr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||substr(juminid,1,2)) ) SelfAge /o Dsa2000 추가  2006.06.o/
       from PKMRYMAS
      WHERE retdate like :workyy||'%'; */ 

     
     /* EXEC   SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 63;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select empno ,nvl(taxgross,0) ,nvl(mate,0) ,nvl(familyno,0) ,nvl(obs\
tacleno,0) ,nvl(childno,0) ,nvl(woman,0) ,nvl(medamt,0) ,nvl(bmedamt,0) ,nvl\
(hireamt,0) ,nvl(bhireamt,0) ,nvl(guaramt,0) ,nvl(obsguaramt,0) ,nvl(ghosamt\
,0) ,nvl(ohosamt,0) ,nvl(nhosamt,0) ,nvl(keduno,0) ,nvl(ueduno,0) ,nvl(cedun\
o,0) ,nvl(seduamt,0) ,nvl(keduamt,0) ,nvl(ceduamt,0) ,nvl(ueduamt,0) ,nvl(ho\
useamt,0) ,nvl(houseintamt,0) ,nvl(agiveamt,0) ,nvl(pgiveamt,0) ,nvl(anuamt,\
0) ,nvl(banuamt,0) ,nvl(penamt1,0) ,nvl(penamt2,0) ,nvl(bpenamt,0) ,nvl(npen\
amt,0) ,nvl(npenamt2,0) ,nvl(propamt,0) ,nvl(bpropamt,0) ,nvl(hloanamt,0) ,n\
vl(foriamt,0) ,nvl(etctamt,0) ,nvl(mintax,0) ,nvl(mjutax,0) ,nvl(bintax,0) ,\
nvl(bjutax,0) ,nvl(mnongtax,0) ,nvl(bnongtax,0) ,nvl(mcogbonsum,0) ,nvl(cred\
itamt,0) ,nvl(investamt,0) ,nvl(obseduno,0) ,nvl(obseduamt,0) ,nvl(oinvestam\
t,0) ,nvl(spgivamt,0) ,nvl(DEBITAMT,0) ,nvl(GIROAMT,0) ,nvl(JUMINID,0) ,nvl(\
poliamt,0) ,nvl(fami70no,0) ,nvl(specaddno,0) ,nvl(specaddded,0) ,nvl(shosam\
t,0) ,nvl(cashamt,0) ,(to_number(to_char(sys");
     sqlstm.stmt = sq0041;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1409;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyy;
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
          Write_batlog(seqno++, "6. 근로소득공제1 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"6. 근로소득공제1 setting Error");
          exit(1);
     }
     
     ClearVar();
     
     while(1)
     {
          /* EXEC SQL FETCH c1 INTO
          :empno,     :taxgross,  :mate,     :familyno,  /o:fami65no, 20090318 65세 경로우대 폐지o/
          :obstacleno,:childno,  :woman,     :medamt,
          :bmedamt,   :hireamt,  :bhireamt,  :guaramt,
          :obsguaramt,:ghosamt,  :ohosamt,   :nhosamt,
          :keduno,    :ueduno,   :ceduno,    /o:keduno1,   :keduamt1, parksh 20021224 o/
          :seduamt,   :keduamt,  :ceduamt,   :ueduamt,
          :houseamt,  :houseintamt, :agiveamt, :pgiveamt,
          :anuamt,    :banuamt,  :penamt1,   :penamt2,  :bpenamt,
          :npenamt,   :npenamt2, :propamt,   :bpropamt, :hloanamt,
          :foriamt,   :etctamt,  /o:stkamt, parksh :lstkamt, o/
          :mintax,    :mjutax,   :bintax,   :bjutax,
          :mnongtax,  :bnongtax, :mcogbonsum,   
          :creditamt, :investamt, 
          :obseduno,  :obseduamt,:oinvestamt, :spgivamt, /o parksh 20021224 추가 :olstkamt,  o/
          :debitamt,  :giroamt,  :juminid,   /o:foreignamt, :foreignded,o/ /o Dsa2000 추가  2003.12.o/
          :poliamt,   :fami70no, :specaddno, :specaddded, :shosamt,        /o Dsa2000 추가  2004.12.o/
          :cashamt,   :SelfAge; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 63;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1428;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&taxgross;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&mate;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&familyno;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&obstacleno;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&childno;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&woman;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&medamt;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&bmedamt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&hireamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&bhireamt;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&guaramt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&obsguaramt;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&ghosamt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&ohosamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&nhosamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&keduno;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&ueduno;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&ceduno;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&seduamt;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&keduamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&ceduamt;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&ueduamt;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&houseamt;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&houseintamt;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&agiveamt;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&pgiveamt;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&anuamt;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&banuamt;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&penamt1;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&penamt2;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&bpenamt;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&npenamt;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&npenamt2;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&propamt;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&bpropamt;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&hloanamt;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&foriamt;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&etctamt;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&mintax;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&mjutax;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&bintax;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&bjutax;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&mnongtax;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&bnongtax;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&mcogbonsum;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&creditamt;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&investamt;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&obseduno;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&obseduamt;
          sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)&oinvestamt;
          sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)&spgivamt;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&debitamt;
          sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[52] = (         int  )0;
          sqlstm.sqindv[52] = (         short *)0;
          sqlstm.sqinds[52] = (         int  )0;
          sqlstm.sqharm[52] = (unsigned long )0;
          sqlstm.sqadto[52] = (unsigned short )0;
          sqlstm.sqtdso[52] = (unsigned short )0;
          sqlstm.sqhstv[53] = (unsigned char  *)&giroamt;
          sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[53] = (         int  )0;
          sqlstm.sqindv[53] = (         short *)0;
          sqlstm.sqinds[53] = (         int  )0;
          sqlstm.sqharm[53] = (unsigned long )0;
          sqlstm.sqadto[53] = (unsigned short )0;
          sqlstm.sqtdso[53] = (unsigned short )0;
          sqlstm.sqhstv[54] = (unsigned char  *)juminid;
          sqlstm.sqhstl[54] = (unsigned long )15;
          sqlstm.sqhsts[54] = (         int  )0;
          sqlstm.sqindv[54] = (         short *)0;
          sqlstm.sqinds[54] = (         int  )0;
          sqlstm.sqharm[54] = (unsigned long )0;
          sqlstm.sqadto[54] = (unsigned short )0;
          sqlstm.sqtdso[54] = (unsigned short )0;
          sqlstm.sqhstv[55] = (unsigned char  *)&poliamt;
          sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[55] = (         int  )0;
          sqlstm.sqindv[55] = (         short *)0;
          sqlstm.sqinds[55] = (         int  )0;
          sqlstm.sqharm[55] = (unsigned long )0;
          sqlstm.sqadto[55] = (unsigned short )0;
          sqlstm.sqtdso[55] = (unsigned short )0;
          sqlstm.sqhstv[56] = (unsigned char  *)&fami70no;
          sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[56] = (         int  )0;
          sqlstm.sqindv[56] = (         short *)0;
          sqlstm.sqinds[56] = (         int  )0;
          sqlstm.sqharm[56] = (unsigned long )0;
          sqlstm.sqadto[56] = (unsigned short )0;
          sqlstm.sqtdso[56] = (unsigned short )0;
          sqlstm.sqhstv[57] = (unsigned char  *)&specaddno;
          sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[57] = (         int  )0;
          sqlstm.sqindv[57] = (         short *)0;
          sqlstm.sqinds[57] = (         int  )0;
          sqlstm.sqharm[57] = (unsigned long )0;
          sqlstm.sqadto[57] = (unsigned short )0;
          sqlstm.sqtdso[57] = (unsigned short )0;
          sqlstm.sqhstv[58] = (unsigned char  *)&specaddded;
          sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[58] = (         int  )0;
          sqlstm.sqindv[58] = (         short *)0;
          sqlstm.sqinds[58] = (         int  )0;
          sqlstm.sqharm[58] = (unsigned long )0;
          sqlstm.sqadto[58] = (unsigned short )0;
          sqlstm.sqtdso[58] = (unsigned short )0;
          sqlstm.sqhstv[59] = (unsigned char  *)&shosamt;
          sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[59] = (         int  )0;
          sqlstm.sqindv[59] = (         short *)0;
          sqlstm.sqinds[59] = (         int  )0;
          sqlstm.sqharm[59] = (unsigned long )0;
          sqlstm.sqadto[59] = (unsigned short )0;
          sqlstm.sqtdso[59] = (unsigned short )0;
          sqlstm.sqhstv[60] = (unsigned char  *)&cashamt;
          sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[60] = (         int  )0;
          sqlstm.sqindv[60] = (         short *)0;
          sqlstm.sqinds[60] = (         int  )0;
          sqlstm.sqharm[60] = (unsigned long )0;
          sqlstm.sqadto[60] = (unsigned short )0;
          sqlstm.sqtdso[60] = (unsigned short )0;
          sqlstm.sqhstv[61] = (unsigned char  *)&SelfAge;
          sqlstm.sqhstl[61] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[61] = (         int  )0;
          sqlstm.sqindv[61] = (         short *)0;
          sqlstm.sqinds[61] = (         int  )0;
          sqlstm.sqharm[61] = (unsigned long )0;
          sqlstm.sqadto[61] = (unsigned short )0;
          sqlstm.sqtdso[61] = (unsigned short )0;
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

                                            /* Dsa2000 추가  2005.11.*/
                      
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               Write_batlog(seqno++, "6. 근로소득공제2 setting Error");  /*dsa2000 Rexec 대체*/
               err_print(sqlca.sqlcode,"6. 근로소득공제2 setting Error");
               exit(1);
          }
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 63;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1691;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          
/*2013.01.08.hjku. 계산식 오류로 연말정산과 동일하게 수정          
          if  (taxgross  <= INDEDBASIC )
          {    if (taxgross < INDEDBASIC * INDEDBRATE /100 )
                   laborded = taxgross   * INDEDBRATE /100  ; 
               else 
                   laborded = INDEDBASIC * INDEDBRATE /100 ;                                         
          }    
          else if ((taxgross > INDEDBASIC) && (taxgross <= INDEDLIMIT2))
               laborded = rint( INDEDBASIC * INDEDBRATE / 100 +
                              ( taxgross - INDEDBASIC )*INDEDORATE / 100);
                             
          else if ((taxgross > INDEDLIMIT2) && (taxgross <= INDEDLIMIT3))
               laborded = rint( INDEDBASIC * INDEDBRATE / 100 +
                              (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +                        
                              (taxgross -  INDEDLIMIT2)*INDEDORATE2 / 100);
                              
          else if ((taxgross > INDEDLIMIT3) && (taxgross <= INDEDLIMIT4)) 
               laborded = rint(INDEDBASIC * INDEDBRATE / 100 +
                              (INDEDLIMIT2-INDEDBASIC) * INDEDORATE /100 +
                              (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                              (taxgross - INDEDLIMIT3) * INDEDORATE3/100 );    
          else if (taxgross > INDEDLIMIT4) 
               laborded = rint(INDEDBASIC * INDEDBRATE / 100 +
                              (INDEDLIMIT2-INDEDBASIC)  * INDEDORATE /100 +
                              (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                              (INDEDLIMIT4-INDEDLIMIT3) * INDEDORATE3 /100 +
                              (taxgross - INDEDLIMIT4)  * INDEDORATE4/100 );                  
*/

          if  (taxgross  <= INDEDBASIC)                               /* 2010.01.18 근로 소득금액 400만원 체크 추가 */
          {    
               laborded = trunc(taxgross   * INDEDBRATE /100) ;               
          }     
          else if ((taxgross > INDEDBASIC) && (taxgross <= INDEDLIMIT2))
               laborded = trunc( INDEDBASIC  * INDEDBRATE /100  +
                               ( taxgross - INDEDBASIC )*INDEDORATE / 100 );
          else if ((taxgross > INDEDLIMIT2) && (taxgross <= INDEDLIMIT3))
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +                        
                               (taxgross -  INDEDLIMIT2)*INDEDORATE2 / 100);
                              
          else if (taxgross > INDEDLIMIT3 && (taxgross <= INDEDLIMIT4))  /*parksh 20021213수정 */
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2-INDEDBASIC) * INDEDORATE /100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (taxgross - INDEDLIMIT3) * INDEDORATE3/100 );
                         
          else if (taxgross > INDEDLIMIT4)                              /*parksh 20021213 추가 근로소득공제4*/ 
               laborded = trunc(INDEDBASIC * INDEDBRATE /100 +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (INDEDLIMIT4-INDEDLIMIT3) * INDEDORATE3 /100 +
                               (taxgross - INDEDLIMIT4) * INDEDORATE4/100 );
   
          laboramt  = trunc(taxgross - laborded);                               
          
          
          /*전산처리요청 2006.06.02.: 퇴직사원본인 관련외의 부양가족공제 안하도록 초기화 */
          mate     = 0;
          familyno = 0;
          /*  fami65no = 0; 20090318 65세 경로우대 폐지*/
          fami70no = 0;
          childno  = 0;
           
          if  (SelfAge >= 70)   /* 근로자본인 경로자 체크..*/
               fami70no = 1;
          /*else if (SelfAge >= 65 )  20090318 65세 경로우대 폐지
            fami65no = 1;                */
          /********************************************************************/
          
           /*  본인공제  */
          selfded = BASDED;
          
          /* 2008.02.25********************************************************************/
          /* 퇴직자들의 기본.추가공제사항들 적용 안시킴
            -연말정산제도 변경시 지급조서 제출시 어려움 때문.  신영섭 대리 요청*/
          /*  배우자 공제  
           mateded = mate * BASDED;
          
               부양가족공제  
                       famided = familyno * BASDED; */
          
          /*기본공제 본인공제는 공제 허용 2008.02.25
          basicded= selfded + mateded + famided; */
          basicded= selfded;
               
                       /* 경로우대공제 
                       ---oldded  = fami65no * APPOLDDED;            
                       oldded  = oldded + fami70no * APPOLDDED2;  2004.12. dsa2000  경로우대70이상 추가공제
          
            장애자 공제
                       obsded  = obstacleno * OBSDEDADD;     2005년 100 => 200만원으로 인상
          
            부녀자 공제 
                       womanded = woman * APPDED;
          
            자녀양육비 공제      100만원으로 인상(2004.12.DSA2000)
                       childded= childno * APPOLDDED;
          
              추가공제 
                       appendded = oldded + obsded + womanded + childded;
                       
                       다자녀 추가공제
                       if (fami16no + fami720no == 2)
                       {
                         fewded = FEWDED1;
                       }
                       else if (fami16no + fami720no > 2)
                       {
                         fewded = FEWDED1 + ( ((fami16no+fami720no)-2)*FEWDED2 );
                       } */                
                       
                       /*  소수추가공제 폐지
                       {if (mate+familyno == 0)
                       {       fewno=1;
                               fewded= FEWDED1;
                       }
                       else if (mate+familyno == 1)
                       {       fewno=2;
                               fewded=FEWDED2;
                       }
                       else
                       {       fewno=0;
                               fewded=0;
                       }*/
                       /* 2008.02.25********************************************************************/
                                                   
          medded = medamt + bmedamt;     /*  의료보험료  */
          hireded= hireamt + bhireamt;   /*  고용보험료  */
          
           /*  일반보험료 공제     */
          guarded = guaramt;
          if  (guarded < INSDEDLIMIT)
               guarded = guaramt;
          else
               guarded = INSDEDLIMIT;   
          
/* ==========================================================================
   4.00       2001.12.14         유효성          장애인전용보험료 추가
============================================================================= */  
          obsguarded = obsguaramt;
      
          if  (obsguarded > OBSDEDLIMIT)
               obsguarded = OBSDEDLIMIT;

          insded = guarded + medded + hireded + obsguarded ;   /*  보험료공제   */
              
          /*  의료비 공제
              과세급여액*MEDORATE를 초과하는 의료비중 MEDDEDLIMIT를 한도로 공제 ,
              but 장애자,경로우대자의료비가 있는 경우 추가로 공제 
              추가공제에 본인의료비(shosamt) 포함 2004년 귀속부터.   */
          hosamt = ghosamt + ohosamt + nhosamt + shosamt;          
          hosded = hosamt - (taxgross  * MEDORATE /100);
          hosded = floor(hosded);
          if  (hosded<0)
               hosded=0;
          
          medappded_A = hosamt - (taxgross * MEDORATE / 100) - MEDDEDLIMIT;  /*한도초과분*/
          if  (medappded_A < 0 ) 
               medappded_A = 0;
          
          medappded_B = ohosamt + nhosamt + shosamt; /*한도 없는 의료비 총액*/
          if  (medappded_A >= medappded_B ) 
               hosded = hosded + medappded_B;
          else
               hosded = hosded + medappded_A;
   
          /*본인 교육비*/
          seduded = seduamt;

          /*유치원 교육비*/   
          if  (keduamt > keduno * KINEDULIMIT)
               keduded = keduno*KINEDULIMIT;
          else
               keduded = keduamt;
   
          /*초중고교육비*/
          if  (ceduamt > ceduno * CJKEDULIMIT)
               ceduded = ceduno * CJKEDULIMIT;
          else
               ceduded = ceduamt;              
   
          /*대학 교육비*/
           if  (ueduamt > ueduno*UNIEDULIMIT)
                ueduded = ueduno*UNIEDULIMIT;
           else
                ueduded = ueduamt;
   
    /* 장애인특수교육비 PARKSH 20021224 추가*/ 
    /*if (obseduamt > obseduno*OBSEDULIMIT)
                  obseduded = obseduno*OBSEDULIMIT;
           else */
     obseduded = obseduamt;   /*2004.12.  dsa2000  장애인특수교육비 한도 폐지.*/
                
     eduded    = seduded + keduded + ceduded + ueduded +obseduded;    /*parksh 20021224 수정 + keduded1 */          

      /*주택자금*/
      /* --------------------------------------------------------------------------------
        40.11   2003.12.18   강륜종   장기주택저당차입 이자상환 한도액 추가..
        ①주택마련저축  ②주택임차 차입금상환 ③장기주택저당차입금
                                      주택자금 공제시 ①+② 만 공제시에는 한도가 300만원까지
                                                     ①+②+③ 공제시에는 한도가 1000만원까지
        ------------------------------------------------------------------------------- */       
     houseded = floor(houseamt * HSRATE / 100) + houseintamt ;
     
     if  (houseintamt > 0)
     {
          if ( houseded > HSDEDLIMIT2 )  houseded = HSDEDLIMIT2;
     }
     else
     {
          if ( houseded > HSDEDLIMIT )   houseded = HSDEDLIMIT;
     }
             
     houseded = floor(houseded);
                                                
       
     /* 전액기부금 */
     agiveded= agiveamt;
     
           /* 정치기부금 : 세액공제 신설 => dsa2000  2004.12. 세액공제(10만원) 이상의 금액은 전액기부금 처리.*/
     if  (poliamt > POLILIMIT)
     {  
          agiveded = agiveded + (poliamt - POLILIMIT);
          polided  = POLILIMIT;
     }
     else
     {
          polided  = poliamt;   /*polided 정치자금 세액공제*/
     }
           
      /* 특례지정기부금 parksh 20021224 추가 */
     spgivded = spgivamt;
     if  (spgivded > floor((laboramt-agiveded) * SPGIVDEDRATE / 100))
          spgivded = floor((laboramt-agiveded) * SPGIVDEDRATE / 100) ;
                    
                 /* 지정기부금 parksh 20021224 수정*/
     if  (pgiveamt > ((laboramt - agiveded - spgivded ) * GIVDEDRATE / 100))
          pgiveded = (laboramt - agiveded - spgivded) * GIVDEDRATE / 100;
     else
          pgiveded = pgiveamt;
       
                   /* 기부금공제 = 전액기부금  + 특례지정기부금 + 지정기부금 parksh 20021224 */
     giveded = agiveded + spgivded + pgiveded ;
     giveded = floor(giveded); /*dsa2000*/
     
     /* 결혼.장례.이사비용공제(신설) - 건당 100만  2004.12. dsa2000  */
     specaddded = specaddno * SPECADDLIMIT; 
                 
     /* 특별공제 = 보험료공제 + 의료비공제 + 교육비공제 + 주택자금공제 +  기부금공제 +  결혼.장례.이사비용공제  */
     specialded = insded + hosded + eduded + houseded + giveded + specaddded;
     
     standded = 0;
                
     if  (specialded < STDDED)
     {  
          insded    = hosded   = eduded   = houseded   = giveded   = 0;
          guarded   = hireded  = medded   = obsguarded = obseduded = 0;
          seduded   = keduded  = ceduded    = ueduded   = 0;  /*keduded1 dsa2000  2004.12.*/
          agiveded  = pgiveded = spgivded = 0;
          specialded = 0 ;  /*2001.12.26. 유효성 표준공제 컬럼추가   specialded = STDDED;*/
          standded   = STDDED ;     specaddded = 0;
     }
   
/* 연금보험료 공제 START ===============================================================================*/     
   /* ==========================================================================
      4.00       2001.12.14         유효성          연금보험료 추가
   ============================================================================= */     
        /*2002년부터 전액공제   anuded = (anuamt + banuamt) * 50 /100 ;*/
     anuded = (anuamt + banuamt)  ;
        
        
/* 조세특례법에의한 소득공제 START=====================================================================*/             
   /*****개인연금*****/   
     pended  = (penamt1 + penamt2 +bpenamt ) * PENRATE / 100;
     
     if  (pended > PENDEDLIMIT)
          pended = PENDEDLIMIT;
     
   /* ==========================================================================
      4.00       2001.12.14         유효성          연금저축 추가
   ============================================================================= */     
     npended = npenamt + npenamt2 ;
     
     if  (npended > NPENDEDLIMIT) 
          npended = NPENDEDLIMIT;
       
     /*****투자조합********/      
     INVESTLIMIT    = taxgross * INVESTDEDRATE;                
     
     if  (INVESTLIMIT < 0)
          INVESTLIMIT = 0 ;
        
     investded  = investamt * INVESTRATE /100 ;                
     
     if  (investded > INVESTLIMIT)
          investded = INVESTLIMIT;
     
     /*parksh 20021224 투자조합00~01 */
     OINVESTLIMIT    = taxgross * OINVESTDEDRATE;                
     
     if  (OINVESTLIMIT < 0)
          OINVESTLIMIT = 0 ;
        
     oinvestded      = oinvestamt * OINVESTRATE /100 ;                
     
     if  (oinvestded > OINVESTLIMIT)
          oinvestded = OINVESTLIMIT;
       
     tinvestded = investded + oinvestded;      /*parksh  20021213  투자조합공제액합*/
     
      
   /*================================================================================
     2003.12. Dsa2000  추가....  => 2004.12  기명식선불카드 추가. 직불카드 요율 20%로 축소
   ① 신용카드등 사용금액 = 신용카드+기명식 선불카드+직불카드+지로납부금액
   ② 초과금액 = ①-(총급여액×10%)  : 공제대상금액
   ③ 신용카드 =(②×신용카드금액/①)×20%
   ④ 학원비   =(②×지로납부금액/①)×20%
   ⑤ 직불카드 =(②×직불카드사용금액/①)×20%
   ==> 총 공제금액 : ③+④+⑤       ☞ 한도액 :  총급여액×20%  와 500만원 중   적은 금액
   ================================================================================ */
     creditded = 0;
     /*creditamt = credittotamt - creditdedamt;  신용카드 공제 가능금액 = 총 공제신청금액 - 법인 사용분 */              
     
     if (creditamt < 0)    creditamt = 0;         /*dsa2000  2005.01.31 추가.*/
     
     totcreditamt = creditamt + debitamt + giroamt + cashamt;  /*①*/     
                
     if (totcreditamt < 0) totcreditamt = 0; 
                                               
     crededlimit2    =  floor( totcreditamt - (taxgross  * CREORATE / 100) );  /*②*/
     if  (crededlimit2 > 0)
     {       
          creditded =             floor((crededlimit2 * creditamt / totcreditamt) * CREDEDLRATE  /100) ; /*③*/                  
          creditded = creditded + floor((crededlimit2 * debitamt  / totcreditamt) * DEBITDEDRATE /100) ; /*④*/
          creditded = creditded + floor((crededlimit2 * giroamt   / totcreditamt) * GIRODEDRATE  /100) ; /*⑤*/ 
          creditded = creditded + floor((crededlimit2 * cashamt   / totcreditamt) * CREDEDLRATE  /100) ; /*⑥*/ 
     }
             
     /* 한도 체크 : 총과세급여액의 20%와 500만원중 적은금액 */
     if  (creamt1 < CREDEDLIMIT )
     { 
          if  (creditded > creamt1  )           
               creditded = creamt1;
     }
     else
     {
          if  (creditded > CREDEDLIMIT  )           
               creditded = CREDEDLIMIT;
     }                        
      /* Dsa2000  2003.12.  End..........................................................*/                       
        
               
     /*===============================================================================
      2003.12. Dsa2000  추가....
      외국인임직원 해외근무에 따른 추가비용 소득공제
      - 공제비용 : 외국인학교 자녀교육비, 월세 지출액
      - 공제한도 : (월정액급여 연간합계액-공제비용)의 40%      
      ===============================================================================*/  
     /* 2004.12. 외국인 세액개편에 따라...폐지.
     FOREIGNDED = 0;
      sprintf(JUMINID, "%.1s",JUMINID+7);
      
     if ( (strcmp(JUMINID, "5") == 0 ) || (strcmp(JUMINID, "6") == 0 ) ) 
     {
       FOREIGNDED = ( taxgross - FOREIGNAMT ) * FOREDEDRATE / 100;    
       
       if ( FOREIGNAMT < FOREIGNDED )
          FOREIGNDED = FOREIGNAMT;       
     }   
      Dsa2000  2003.12.  End..........................................................*/
     
     /*조세특례법에의한 소득공제 합계*/
       incomeded = basicded + appendded + specialded + standded + pended  +
                   fewded   + creditded + tinvestded + anuded   + npended ;
                              /*+ FOREIGNDED ;       2004.12. dsa2000 추가 외국인 추가공제...폐지*/
                              
                
/* 과세표준  START=====================================================================*/              
     taxlevel = laboramt - basicded - appendded - fewded - specialded - standded -
                pended - creditded - tinvestded - anuded - npended ;
          /*- FOREIGNDED ;       2004.12. dsa2000 추가 외국인 추가공제... 페지*/
        
     if  (taxlevel < 0 )
          taxlevel = 0;
        
     if  (taxlevel == 0)
          calctax = 0;
     else
          calctax = GetTax(taxlevel);
                     
     
/* 세액 공제  START=====================================================================*/
    /*parksh 20021224  근로소득 세액 공제 */ 
     if  (calctax < TAXDEDBASIC)
          incomtded = floor(calctax * TAXDEDBRATE / 100);
     else
          incomtded = floor((TAXDEDBASIC * TAXDEDBRATE /100) +
                         + (calctax - TAXDEDBASIC) * TAXDEDORATE / 100);
     
     if  (incomtded > TAXDEDLIMIT)
          incomtded = TAXDEDLIMIT;
     
   /* 재형저축 세액공제 삭제
   propded = (propamt+bpropamt)*0.15;
   if (propded > PROP_LIMIT)
     propded = PROP_LIMIT;  */
     
     /*  주택차입금이자세액 공제  */
     hloanded = floor(hloanamt * HSINTRATE / 100);
   
    /*2002 주식저축공제 없어짐.parksh 20021224*/
    /*  주식저축공제  */
    /*stkded   = floor(stkamt * STKDEDRATE / 100); */
    /*   if (stkded > STKDEDLIMIT)
             stkded  = STKDEDLIMIT;
             lstkded = floor(lstkamt * LSTKDEDRATE / 100) ;       

         parksh 20021224 추가 전년도 장기주식저축 공제 *
               olstkded = floor(olstkamt * OLSTKDEDRATE / 100);                 
               tlstkded = lstkded + olstkded;    전년장기증권저축 + 당년 장기증권저축 */      

                /*  외국납부세액공제   */
     forided = foriamt;
     
     /*세액공제 합계*/
     tdedsum = incomtded + hloanded + forided   /* parksh 20021213수정 lstkded->tlstkded, stkded 삭제*/  
               + polided;   /*dsa2000  2004.12. 정치자금세액공제 추가.*/
               /*+ tlstkded     dsa2000  2004.12. 장기증권저축세액공제 삭제  */   
         
     
/* 갑근세 /주민세 / 농특세 START=====================================================================*/               
     if  (calctax - tdedsum > 0) 
     {
          /* 2007.01.*/ 
          dintax = floor((calctax - tdedsum) / 10) * 10;
          djutax = floor(dintax / 100) * 10 ;
          /*dintax = calctax - tdedsum;
          djutax = dintax * 0.1;*/
     }                
     else 
     {
          dintax = 0 ;
          djutax = 0 ;    
     }              
            
      
     if  (hloanded > 0 || tinvestded > 0)  /*parksh 수정*/
     {
          /* 2007.01.*/
          dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100) ;                
          dnongtax = floor(dnongtax / 10) * 10;
          /*dnongtax = (hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100;
          dnongtax = dnongtax * 0.1;*/
     }
     else               
          dnongtax = 0 ;                  
       
     intax   = mintax + bintax ;
     jutax   = mjutax + bjutax ;
     nongtax = mnongtax + bnongtax ;
            
     /* 2007.01. 원단위 절사방법 변경 - dintax를  floor를 안하고 yintax를 trunc하게끔 변경.*/
     yintax   = dintax - intax,
     yjutax   = djutax - jutax;
     ynongtax = dnongtax - nongtax; 
     /*yintax   = trunc( (dintax   - intax  ) / 10 ) * 10;
       yjutax   = trunc( (djutax   - jutax  ) / 10 ) * 10;
       ynongtax = trunc( (dnongtax - nongtax) / 10 ) * 10;*/
              
     ycalctax = yintax + yjutax + ynongtax;
    
     UpdateResult();
     }
}


UpdateResult()
{
     /* exec sql
     update PKMRYMAS
        set 
            taxgross    = :taxgross,
            laborded    = :laborded,
            laboramt    = :laboramt,
            selfded     = :selfded,
            mateded     = :mateded,
            famided     = :famided,
            basicded    = :basicded,
            oldded      = :oldded,
            obsded      = :obsded,
            womanded    = :womanded,
            childded    = :childded,
            appendded   = :appendded,
            fewno       = :fewno,
            fewded      = :fewded,
            medded      = :medded,
            hireded     = :hireded,
            guarded     = :guarded,
            obsguarded  = :obsguarded,
            insded      = :insded,
            hosamt      = :hosamt,
            hosded      = :hosded,
            seduded     = :seduded,
            keduded     = :keduded,
            /o keduded1     = :keduded1, parksh 20021224o/
            ceduded     = :ceduded,
            ueduded     = :ueduded,
            eduded      = :eduded,
            houseded    = :houseded,
            agiveded    = :agiveded,
            pgiveded    = :pgiveded,
            giveded     = :giveded,
            specialded  = :specialded,
            standded    = :standded,
            anuded      = :anuded,
            pended      = :pended,
            npended     = :npended,
            specaddded  = :specaddded,   /odsa2000  2004.12.  특별추가공제(결혼.장례.이사비 공제액), 정치자금세액공제 추가o/
            polided     = :polided,      /odsa2000  2004.12.o/
             investded  = :investded,
            creditded   = :creditded,
            incomeded   = :incomeded,
            chagamamt   = :chagamamt,            
            taxlevel    = :taxlevel,
            calctax     = :calctax,
            incomtded   = :incomtded,
            hloanded    = :hloanded,
            forided     = :forided,
            obseduded   = :obseduded,
            oinvestded  = :oinvestded,
            tinvestded  = :tinvestded,
            spgivded    = :spgivded,
            tdedsum     = :tdedsum,
            dintax      = :dintax,
            djutax      = :djutax,
            dnongtax    = :dnongtax,
            intax       = :intax,
            jutax       = :jutax,
            nongtax     = :nongtax,
            yintax      = :yintax,
            yjutax      = :yjutax,
            ynongtax    = :ynongtax,
            ycalctax    = :ycalctax,
            writetime   = to_char(sysdate,'yyyymmddhh24miss'),
            writeman    = :jobempno
            /opropded  = :propded,o/
            /o stkded  = :stkded, parksh 20021224*
            lstkded      = :lstkded,o/    
            /oolstkded  = :olstkded, *
            tlstkded     = :tlstkded,o/     
     where empno   = :empno
       and retdate = :retdate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 64;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRYMAS  set taxgross=:b0,laborded=:b1,laboramt\
=:b2,selfded=:b3,mateded=:b4,famided=:b5,basicded=:b6,oldded=:b7,obsded=:b8,w\
omanded=:b9,childded=:b10,appendded=:b11,fewno=:b12,fewded=:b13,medded=:b14,h\
ireded=:b15,guarded=:b16,obsguarded=:b17,insded=:b18,hosamt=:b19,hosded=:b20,\
seduded=:b21,keduded=:b22,ceduded=:b23,ueduded=:b24,eduded=:b25,houseded=:b26\
,agiveded=:b27,pgiveded=:b28,giveded=:b29,specialded=:b30,standded=:b31,anude\
d=:b32,pended=:b33,npended=:b34,specaddded=:b35,polided=:b36,investded=:b37,c\
reditded=:b38,incomeded=:b39,chagamamt=:b40,taxlevel=:b41,calctax=:b42,incomt\
ded=:b43,hloanded=:b44,forided=:b45,obseduded=:b46,oinvestded=:b47,tinvestded\
=:b48,spgivded=:b49,tdedsum=:b50,dintax=:b51,djutax=:b52,dnongtax=:b53,intax=\
:b54,jutax=:b55,nongtax=:b56,yintax=:b57,yjutax=:b58,ynongtax=:b59,ycalctax=:\
b60,writetime=to_char(sysdate,'yyyymmddhh24miss'),writeman=:b61 where (empno=\
:b62 and retdate=:b63)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1706;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&taxgross;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&laborded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&laboramt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&selfded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&mateded;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&famided;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&basicded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&oldded;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&obsded;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&womanded;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&childded;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&appendded;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&fewno;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&fewded;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&medded;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&hireded;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&guarded;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&obsguarded;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&insded;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&hosamt;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&hosded;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&seduded;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&keduded;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&ceduded;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&ueduded;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&eduded;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&houseded;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&agiveded;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&pgiveded;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&giveded;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&specialded;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&standded;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&anuded;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&pended;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&npended;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&specaddded;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)&polided;
     sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)&investded;
     sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)&creditded;
     sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&incomeded;
     sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)&chagamamt;
     sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)&taxlevel;
     sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)&calctax;
     sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)&incomtded;
     sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)&hloanded;
     sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqhstv[45] = (unsigned char  *)&forided;
     sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[45] = (         int  )0;
     sqlstm.sqindv[45] = (         short *)0;
     sqlstm.sqinds[45] = (         int  )0;
     sqlstm.sqharm[45] = (unsigned long )0;
     sqlstm.sqadto[45] = (unsigned short )0;
     sqlstm.sqtdso[45] = (unsigned short )0;
     sqlstm.sqhstv[46] = (unsigned char  *)&obseduded;
     sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[46] = (         int  )0;
     sqlstm.sqindv[46] = (         short *)0;
     sqlstm.sqinds[46] = (         int  )0;
     sqlstm.sqharm[46] = (unsigned long )0;
     sqlstm.sqadto[46] = (unsigned short )0;
     sqlstm.sqtdso[46] = (unsigned short )0;
     sqlstm.sqhstv[47] = (unsigned char  *)&oinvestded;
     sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[47] = (         int  )0;
     sqlstm.sqindv[47] = (         short *)0;
     sqlstm.sqinds[47] = (         int  )0;
     sqlstm.sqharm[47] = (unsigned long )0;
     sqlstm.sqadto[47] = (unsigned short )0;
     sqlstm.sqtdso[47] = (unsigned short )0;
     sqlstm.sqhstv[48] = (unsigned char  *)&tinvestded;
     sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[48] = (         int  )0;
     sqlstm.sqindv[48] = (         short *)0;
     sqlstm.sqinds[48] = (         int  )0;
     sqlstm.sqharm[48] = (unsigned long )0;
     sqlstm.sqadto[48] = (unsigned short )0;
     sqlstm.sqtdso[48] = (unsigned short )0;
     sqlstm.sqhstv[49] = (unsigned char  *)&spgivded;
     sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[49] = (         int  )0;
     sqlstm.sqindv[49] = (         short *)0;
     sqlstm.sqinds[49] = (         int  )0;
     sqlstm.sqharm[49] = (unsigned long )0;
     sqlstm.sqadto[49] = (unsigned short )0;
     sqlstm.sqtdso[49] = (unsigned short )0;
     sqlstm.sqhstv[50] = (unsigned char  *)&tdedsum;
     sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[50] = (         int  )0;
     sqlstm.sqindv[50] = (         short *)0;
     sqlstm.sqinds[50] = (         int  )0;
     sqlstm.sqharm[50] = (unsigned long )0;
     sqlstm.sqadto[50] = (unsigned short )0;
     sqlstm.sqtdso[50] = (unsigned short )0;
     sqlstm.sqhstv[51] = (unsigned char  *)&dintax;
     sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[51] = (         int  )0;
     sqlstm.sqindv[51] = (         short *)0;
     sqlstm.sqinds[51] = (         int  )0;
     sqlstm.sqharm[51] = (unsigned long )0;
     sqlstm.sqadto[51] = (unsigned short )0;
     sqlstm.sqtdso[51] = (unsigned short )0;
     sqlstm.sqhstv[52] = (unsigned char  *)&djutax;
     sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[52] = (         int  )0;
     sqlstm.sqindv[52] = (         short *)0;
     sqlstm.sqinds[52] = (         int  )0;
     sqlstm.sqharm[52] = (unsigned long )0;
     sqlstm.sqadto[52] = (unsigned short )0;
     sqlstm.sqtdso[52] = (unsigned short )0;
     sqlstm.sqhstv[53] = (unsigned char  *)&dnongtax;
     sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[53] = (         int  )0;
     sqlstm.sqindv[53] = (         short *)0;
     sqlstm.sqinds[53] = (         int  )0;
     sqlstm.sqharm[53] = (unsigned long )0;
     sqlstm.sqadto[53] = (unsigned short )0;
     sqlstm.sqtdso[53] = (unsigned short )0;
     sqlstm.sqhstv[54] = (unsigned char  *)&intax;
     sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[54] = (         int  )0;
     sqlstm.sqindv[54] = (         short *)0;
     sqlstm.sqinds[54] = (         int  )0;
     sqlstm.sqharm[54] = (unsigned long )0;
     sqlstm.sqadto[54] = (unsigned short )0;
     sqlstm.sqtdso[54] = (unsigned short )0;
     sqlstm.sqhstv[55] = (unsigned char  *)&jutax;
     sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[55] = (         int  )0;
     sqlstm.sqindv[55] = (         short *)0;
     sqlstm.sqinds[55] = (         int  )0;
     sqlstm.sqharm[55] = (unsigned long )0;
     sqlstm.sqadto[55] = (unsigned short )0;
     sqlstm.sqtdso[55] = (unsigned short )0;
     sqlstm.sqhstv[56] = (unsigned char  *)&nongtax;
     sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[56] = (         int  )0;
     sqlstm.sqindv[56] = (         short *)0;
     sqlstm.sqinds[56] = (         int  )0;
     sqlstm.sqharm[56] = (unsigned long )0;
     sqlstm.sqadto[56] = (unsigned short )0;
     sqlstm.sqtdso[56] = (unsigned short )0;
     sqlstm.sqhstv[57] = (unsigned char  *)&yintax;
     sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[57] = (         int  )0;
     sqlstm.sqindv[57] = (         short *)0;
     sqlstm.sqinds[57] = (         int  )0;
     sqlstm.sqharm[57] = (unsigned long )0;
     sqlstm.sqadto[57] = (unsigned short )0;
     sqlstm.sqtdso[57] = (unsigned short )0;
     sqlstm.sqhstv[58] = (unsigned char  *)&yjutax;
     sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[58] = (         int  )0;
     sqlstm.sqindv[58] = (         short *)0;
     sqlstm.sqinds[58] = (         int  )0;
     sqlstm.sqharm[58] = (unsigned long )0;
     sqlstm.sqadto[58] = (unsigned short )0;
     sqlstm.sqtdso[58] = (unsigned short )0;
     sqlstm.sqhstv[59] = (unsigned char  *)&ynongtax;
     sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[59] = (         int  )0;
     sqlstm.sqindv[59] = (         short *)0;
     sqlstm.sqinds[59] = (         int  )0;
     sqlstm.sqharm[59] = (unsigned long )0;
     sqlstm.sqadto[59] = (unsigned short )0;
     sqlstm.sqtdso[59] = (unsigned short )0;
     sqlstm.sqhstv[60] = (unsigned char  *)&ycalctax;
     sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[60] = (         int  )0;
     sqlstm.sqindv[60] = (         short *)0;
     sqlstm.sqinds[60] = (         int  )0;
     sqlstm.sqharm[60] = (unsigned long )0;
     sqlstm.sqadto[60] = (unsigned short )0;
     sqlstm.sqtdso[60] = (unsigned short )0;
     sqlstm.sqhstv[61] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[61] = (unsigned long )5;
     sqlstm.sqhsts[61] = (         int  )0;
     sqlstm.sqindv[61] = (         short *)0;
     sqlstm.sqinds[61] = (         int  )0;
     sqlstm.sqharm[61] = (unsigned long )0;
     sqlstm.sqadto[61] = (unsigned short )0;
     sqlstm.sqtdso[61] = (unsigned short )0;
     sqlstm.sqhstv[62] = (unsigned char  *)empno;
     sqlstm.sqhstl[62] = (unsigned long )5;
     sqlstm.sqhsts[62] = (         int  )0;
     sqlstm.sqindv[62] = (         short *)0;
     sqlstm.sqinds[62] = (         int  )0;
     sqlstm.sqharm[62] = (unsigned long )0;
     sqlstm.sqadto[62] = (unsigned short )0;
     sqlstm.sqtdso[62] = (unsigned short )0;
     sqlstm.sqhstv[63] = (unsigned char  *)retdate;
     sqlstm.sqhstl[63] = (unsigned long )9;
     sqlstm.sqhsts[63] = (         int  )0;
     sqlstm.sqindv[63] = (         short *)0;
     sqlstm.sqinds[63] = (         int  )0;
     sqlstm.sqharm[63] = (unsigned long )0;
     sqlstm.sqadto[63] = (unsigned short )0;
     sqlstm.sqtdso[63] = (unsigned short )0;
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


       
     if  (sqlca.sqlcode != 0 )
     {  
          Write_batlog(seqno++, "UpdateResult() 갱신중 ERROR");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"UpdateResult() 갱신중 ERROR");
          exit(1);
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
     sqlstm.arrsiz = 64;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1977;
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
     sqlstm.arrsiz = 64;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2018;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
} 