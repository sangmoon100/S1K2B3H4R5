
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
    "pkz4041g.pc"
};


static unsigned int sqlctx = 156515;


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
   unsigned char  *sqhstv[133];
   unsigned long  sqhstl[133];
            int   sqhsts[133];
            short *sqindv[133];
            int   sqinds[133];
   unsigned long  sqharm[133];
   unsigned long  *sqharc[133];
   unsigned short  sqadto[133];
   unsigned short  sqtdso[133];
} sqlstm = {12,133};

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

 static char *sq0016 = 
"DAMT,0) ,NVL(CREDITADDAMT1,0) ,NVL(C\
REDITADDAMT2,0) ,NVL(CREDITADDAMT3,0) ,NVL(CREDITADDAMT4,0) ,NVL(NPGIVEAMT2_2\
010,0) ,NVL(NPGIVEAMT2_ELSE,0) ,NVL(INFANTTAXDED,0) ,NVL(ADDBABYTAXDED,0) ,NV\
L(OBSGUARTAXDED,0) ,NVL(NAGIVEAMT_2014,0) ,NVL(NPGIVEAMT_2014,0) ,NVL(NPGIVEA\
MT2_2014,0) ,NVL(NAGIVEDED_2014,0) ,NVL(NPGIVEDED_2014,0) ,NVL(NPGIVEDED2_201\
4,0) ,NVL(HOUSEINTAMT6,0) ,NVL(HOUSEINTAMT7,0) ,NVL(HOUSEINTAMT8,0) ,NVL(HOUS\
EINTAMT9,0) ,NVL(HOUSEINTDED6,0) ,NVL(HOUSEINTDED7,0) ,NVL(HOUSEINTDED8,0) ,N\
VL(HOUSEINTDED9,0) ,NVL(INVESTAMT8,0) ,NVL(INVESTAMT9,0) ,NVL(INVESTAMT10,0) \
,NVL(INVESTAMT11,0) ,NVL(INVESTDED4,0) ,NVL(CREDITADDAMT5,0) ,NVL(CREDITADDAM\
T6,0) ,NVL(CREDITADDAMT7,0) ,NVL(IHOSAMT,0) ,NVL(RPENAMT,0) ,NVL(RPENDED,0) ,\
NVL(RPENTAXDED,0)  from PKZRYMAS            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,113,0,9,581,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,1,0,0,13,592,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
55,0,0,1,0,0,15,606,0,0,0,0,0,1,0,
70,0,0,2,2293,0,4,633,0,0,127,1,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
593,0,0,3,44,0,4,717,0,0,1,0,0,1,0,2,97,0,0,
612,0,0,4,130,0,5,745,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
635,0,0,5,39,0,5,759,0,0,0,0,0,1,0,
650,0,0,6,452,0,5,775,0,0,1,1,0,1,0,1,97,0,0,
669,0,0,7,154,0,5,796,0,0,1,1,0,1,0,1,97,0,0,
688,0,0,8,232,0,5,812,0,0,0,0,0,1,0,
703,0,0,9,241,0,5,848,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
726,0,0,10,104,0,5,866,0,0,0,0,0,1,0,
741,0,0,11,314,0,5,882,0,0,0,0,0,1,0,
756,0,0,12,245,0,5,899,0,0,1,1,0,1,0,1,97,0,0,
775,0,0,13,195,0,5,919,0,0,0,0,0,1,0,
790,0,0,14,164,0,5,936,0,0,0,0,0,1,0,
805,0,0,15,108,0,5,951,0,0,0,0,0,1,0,
820,0,0,16,2821,0,9,1010,0,0,0,0,0,1,0,
835,0,0,16,0,0,13,1023,0,0,130,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
1370,0,0,16,0,0,15,1071,0,0,0,0,0,1,0,
1385,0,0,17,2092,0,5,1451,0,0,133,133,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,97,0,0,1,97,0,0,
1932,0,0,18,50,0,3,1599,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1973,0,0,19,0,0,29,1609,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : 임원 퇴직자 연말정산(pkz4041g)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 지순미
 Version        : 1.00
 Date           : 2009.03.

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       2014.01.10         지순미           pkz4041g.pc를 기반으로 2014년이후 임원용 퇴직자 연말정산 만듬.
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

#define  FAIL        -2

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

         char    TAXNUM[3];               /*  세율차수                 */
         double  INDEDBASIC ;             /*  근로소득공제기본액       */
         double  INDEDBRATE ;             /*  근로소득공제 기초공제액  */
         double  INDEDORATE ;             /*  근로소득공제초과율       */
         double  INDEDLIMIT ;             /*  근로소득공제한계액       */
         double  INDEDORATE2 ;            /*  근로소득공제초과율2       */
         double  INDEDLIMIT2 ;            /*  근로소득공제한계액2       */
         double  BASDED     ;             /*  기본공제액               */
         double  APPDED     ;             /*  추가공제액               */
         double  APPOLDDED;               /*  추가공제액(경로우대,장애인) 2002  */
         double  APPOLDDED2;              /*  추가공제액(경로우대70세이상) 2004 */
         double  APPBABYDED;              /*  추가공제액(출산.입양 공제) 2008 */
         double  FEWDED1    ;             /*  소수공제자추가공제1 -> 다자녀추가공제 2인         */
         double  FEWDED2    ;             /*  소수공제자추가공제2 -> 다자녀추가공제 2인이상     */
         double  STDDED     ;             /*  표준공제                 */
         double  INSDEDLIMIT;             /*  보장성보험공제한도       */
         double  MEDDEDLIMIT;             /*  의료비공제한도           */
         double  MEDORATE   ;             /*  의료비공제초과율         */
         double  KINEDULIMIT;             /*  유치원교육비인당한도액   */
         double  CJKEDULIMIT;             /*  초중고교육비 인당한도액  */
         double  UNIEDULIMIT;             /*  대학교육비인당한도액     */
         double  BROEDUNO   ;             /*  형제교육비한도인원       */
         double  HSRATE     ;             /*  주택자금공제율           */
         double  HSDEDLIMIT ;             /*  주택자금한도액           */
         double  HSDEDLIMIT2;             /*  주택자금한도액2  dsa2000 */
         double  HSDEDLIMIT3;             /*  주택자금한도액3  dsa2000 */
         double  HSDEDLIMIT4;             /*  주택자금한도액4  dsa2000 2009.12.*/
         double  GIVDEDRATE ;             /*  지정기부금 공제한도율(종교단체기부금)          */
         double  GIVDEDRATE2;             /*  지정기부금 공제한도율(종교단체기부금있는 경우) 2008*/ 
         double  GIVDEDRATE3;             /*  지정기부금 공제한도율(종교단체기부금 이외) 2011*/       
         double  SPGIVDEDRATE;            /*  특례지정기부금공제한도율 PARKSH 20021213 추가 */
         double  PENRATE    ;             /*  개인연금공제율           */
         double  PENDEDLIMIT;             /*  개인연금한도액           */
         double  OINVESTRATE;             /*  (전)투자조합공제율           */
         double  OINVESTDEDRATE;          /*  (전)투자조합공제한도율       */
         double  OINVESTLIMIT;            /*  (전)투자조합공제한도액       */ /* 계산치 */
         double  INVESTRATE;              /*  투자조합공제율           */
         double  INVESTDEDRATE;           /*  투자조합공제한도율       */
         double  TAXDEDBASIC;             /*  근로소득세액공제기본액   */
         double  TAXDEDBRATE;             /*  근로소득세액공제기본율   */
         double  TAXDEDORATE;             /*  근로소득세액공제초과율   */
         double  TAXDEDLIMIT;             /*  근로소득세액공제한계액   */
         double  PRODEDRATE ;             /*  재형저축공제율           */
         double  HSINTRATE  ;             /*  주택자금세액공제율       */
         double  FORILIMIT;               /*  국외근로소득세액공제 한도 */
         double  CREDEDLIMIT;             /*  신용카드한도액 */
         double  CREDEDRATE ;             /*  신용카드한도율 */
         double  CREORATE   ;             /*  신용카드초과율 */
         double  CREDEDLRATE;             /*  신용카드지급율 */        
         double  INDEDLIMIT3;
         double  INDEDORATE3;
         double  OBSDEDLIMIT;             /*  장애인전용보험료*/
         double  OBSDEDADD;               /*  장애인 추가공제 dsa2000 2005.12. 추가..*/
         double  NPENDEDLIMIT;
         double  JUTAXRATE  ;             /*  주민세율                 */
         double  NONGRATE   ;             /*  농특세율                 */        
         double  OBSEDULIMIT;             /*  장애인특수교육비  PARKSH 20021213 추가 */        
         double  INDEDLIMIT4;             /*  근로소득공제한도액4      PARKSH 20021213 */
         double  INDEDORATE4;             /*  근로소득공제초과율4      PARKSH 20021213 */      
                                          
         double  FUNDRATE1;               /*  펀드 공제율 1년차  2009.01.*/
         double  FUNDRATE2;               /*  펀드 공제율 2년차  2009.01.*/
         double  FUNDRATE3;               /*  펀드 공제율 3년차  2009.01.*/
         double  LONGMTRATE;              /*  노인장기요양보험 공제율  2009.01.*/
     
         /*********************************************************************/                      
         char    workyy[5];
         char    writeman[5];             
         char    tempdate[9];             
         char    empno[5];                /*  사번                */
         double  mpaysum;                 /*  (주) 급여총액       */
         double  mbonsum;                 /*  (주) 급여총액       */
         double  mnotax;                  /*  (주) 비과세         */
         double  mcogbonsum;              /*  (주) 인정상여       */
         double  bcogbonsum;              /*  (종) 인정상여       */
         double  foritaxgross;            /*  국외근로과세총액    */
         double  foritaxgross1;           /*  국외근로소득        */
         double  taxgross;                /*  과세급여총액        */
         double  notax;                   /*  비과세급여총액      */
         double  laborded;                /*  근로소득공제        */
         double  laboramt;                /*  근로소득금액        */
         double  mate;                    /*  배우자유뮤          */
         double  fami16no;                /*  6세이하 가족수      */
         double  fami720no;               /*  7~20세 가족수       */
         double  fami6064no;              /*  60~64세 가족수      */
         double  fami65no;                /*  65세 이상 가족수    */
         double  familyno;                /*  부양가족 수         */
         double  selfded ;                /*  본인공제            */
         double  mateded ;                /*  배우자 공제         */
         double  famided ;                /*  부양가족공제        */
         double  basicded;                /*  기본공제            */
         double  obstacleno;              /*  장애자수            */
         double  childno;                 /*  자녀 양육수         */
         double  woman;                   /*  부녀자 여부         */
         double  oldded;                  /*  경로우대공제        */
         double  obsded;                  /*  장애자 공제         */
         double  womanded;                /*  부녀자 공제         */
         double  childded;                /*  자녀양육공제        */
         double  babyded;                 /*  출생입양공제 2008   */
         double  appendded;               /*  추가공제            */
         double  fewno;                   /*  다자녀추가공제로 변경 사용 2007.12 */
         double  fewded;                  /*  다자녀추가공제로 변경 사용 2007.12 */
         double  medamt;                  /*  의료 보험료         */
         double  bmedamt;                 /*  (종) 의료 보험료   */
         double  medded;                  /*  의료 보험료공제     */
         double  hireamt;                 /*  고용 보험료         */
         double  bhireamt;                /*  (종) 고용 보험료   */
         double  hireded;                 /*  고용보험료 공제     */
         double  guaramt;                 /*  보장성 보험료       */
         double  guarded;                 /*  보장성보험료 공제   */
         double  insded;                  /*  보험료 공제         */
         double  ghosamt;                 /*  일반 의료비         */
         double  ohosamt;                 /*  경로의료비          */
         double  nhosamt;                 /*  장애자의료비        */
         double  hosamt;                  /*  의료비              */
         double  hosded;                  /*  의료비공제          */
         double  seduamt;                 /*  본인학자금          */
         double  seduded;                 /*  본인학자금공제      */
         double  keduno;                  /*  유치원수            */
         double  keduamt;                 /*  유치원학자금        */
         double  keduded;                 /*  유치원학자금공제    */
         double  keduno1;                 /*  영유아수            */
         double  keduamt1;                /*  영유아학자금        */
         double  keduded1;                /*  영유아학자금공제    */
         double  ceduno;                  /*  초중고학생수        */
         double  ceduamt;                 /*  초중고학자금        */
         double  ceduded;                 /*  초중고학자금공제    */
         double  ueduno;                  /*  대학생수            */
         double  ueduamt;                 /*  대학생학자금        */
         double  ueduded;                 /*  대학생학자금공제    */
         double  eduded;                  /*  학자금공제          */
         double  houseamt;                /*  주택자금(대출기관)  */
         double  houseamt3;               /*  주택자금(거주자)    */
         double  houseamt2;               /*  주택자금    (주택마련저축액)                       */        
         double  houseintamt;             /*  주택자금    (장기주택저당 차입이자상환액) 10년이상 */
         double  houseintamt2;            /*  주택자금    (장기주택저당 차입이자상환액) 15년 이상*/        
         double  houseintamt3;            /*  주택자금    (장기주택저당 차입이자상환액) 30년 이상*/        
         double  houseded;                /*  주택자금공제(대출기관)                             */
         double  houseded3;               /*  주택자금공제(거주자)                               */
         double  houseded2;               /*  주택자금공제(주택마련저축         소득공제액)      */
         double  houseintded;             /*  주택 임차 차입금 원리금 상환공제액 15미만 2008.12 KTH */
         double  houseintded2;            /*  주택 임차 차입금 원리금 상환공제액 15-29 미만 2012.02 KTH */
         double  houseintded3;            /*  주택 임차 차입금 원리금 상환공제액 30년 이상  2012.02 KTH */
         double  houserentamt;            /*  주택자금 */
         double  houserentded;            /*  주택자금 */
         double  housvsubamt;             /*  주택자금 */
         double  housvsubded;             /*  주택자금 */
         double  housvcomamt;             /*  주택자금 */
         double  housvcomded;             /*  주택자금 */
         double  housvempamt;             /*  주택자금 */
         double  housvempded;             /*  주택자금 */
         double  houseded4;               /*  청약,주택청약,장마,근로자 주택마련 합계  2011.01 KTH */
         double  agiveamt;                /*  전액기부금          */
         double  agiveded;                /*  전액기부금          */
         double  politaxded;              /*  정치자금 기부금     */
         double  pgiveamt;                /*  지정기부금(종교단체기부금) */
         double  pgiveamt2;               /*  지정기부금공제(종교단체기부금 이외)  */
         double  sgiveamt;                /*  사립학교기부금      */
         double  pgiveded;                /*  지정기부금공제      */        
         double  pgiveded2;               /*  일반기부금공제      */   
         double  nagiveamt;  
         double  nspgivamt;                                                     
         double  npgiveamt;               /* kth 2012.02.13 이월지정기부금 종교단체*/          
         double  npgiveamt2;              /* kth 2012.02.13 이월지정기부금 종교단체외(전체)*/    
         double  giveded;                 /*  기부금공제          */
         double  specialded;              /*  특별공제            */
         double  standded;                /*  표준공제 */
         double  penamt1;                 /*  개인연금(회사)      */
         double  penamt2;                 /*  개인연금(개인)      */
         double  pended;                  /*  개인연금공제        */
         double  investamt;               /*  투자조합출자소득    */
         double  investded;               /*  투자조합공제        */
                                          
         double  DEBITDEDRATE;            /*  직불카드 공제율            */ 
         double  GIRODEDRATE;             /*  지로납부 공제율            */ 
         double  credittotamt;            /*  신용카드 총신청금    */
         double  creditdedamt;            /*  신용카드 법인사용분  */         
         double  creditamt;               /*  신용카드신청금             */         
         double  debitamt;                /*  직불카드 사용금액          */
         double  giroamt;                 /*  지로납부금액               */
         double  cashamt;                 /*  현금영수증 사용액          */ 
         double  creditded;               /*  신용카드공제               */         
                                          
         double  FOREDEDRATE;             /*  외국인 추가공제율 (자녀교육비&월세)   dsa2000   2003.12. */        
         char    juminid[15];             /*  주민번호            */        
         int     SelfAge;                 /* Dsa2000  근로자본인 경로자 체크 */
         double  incomeded;               /*  종합소득공제계      */
         double  taxlevel;                /*  과세표준            */
         double  calctax;                 /*  산출세액            */
         double  incomtded;               /*  근로소득세액공제    */
         double  hloanamt;                /*  주택차입금 공제     */
         double  hloanded;                /*  주택차입금 공제     */
         double  foriamt;                 /*  외국납부공제        */
         double  forided;                 /*  외국납부공제        */
         double  etctamt;                 /*  기타세액감면        */
         double  etctded;                 /*  기타세액감면        */
         double  tdedsum;                 /*  세액감면 총액       */
         double  dintax;                  /*  결정소득세          */
         double  djutax;                  /*  결정주민세          */
         double  dnongtax;                /*  결정농특세          */
         double  mintax;                  /*  (주) 소득세         */
         double  mjutax;                  /*  (주) 주민세         */
         double  mnongtax;                /*  (주) 농특세         */
         double  bintax;                  /*  (종) 소득세         */
         double  bjutax;                  /*  (종) 주민세         */
         double  bnongtax;                /*  (종) 농특세         */
         double  intax;                   /*  (주+종) 소득세      */
         double  jutax;                   /*  (주+종) 주민세      */
         double  nongtax;                 /*  (주+종) 농특세      */
         double  yintax;                  /*  차감소득세          */
         double  yjutax;                  /*  차감주민세          */
         double  ynongtax;                /*  차감농특세          */
         double  ycalctax;                /*  차감정산액          */   
                
         double  obsguaramt;
         double  obsguarded;
         double  anuamt;
         double  banuamt;   
         double  anuded;            
         double  npenamt;
         double  npenamt2 ;
         double  npended;
         
         double  obseduno ;               /*  장애인수                 parksh 20021213 */
         double  obseduamt;               /*  장애인특수교육금액       parksh 20021213 */
         double  obseduded;               /*  장애인특수교육비공제     parksh 20021213 */
         double  spgivamt ;               /*  특례지정기부금           parksh 20021213 */
         double  spgivded ;               /*  특레지정기부금공제       parksh 20021213 */   
         double  oinvestamt;              /*  투자조합공제             parksh 20021213 */
         double  oinvestded;              /*  투자조합공제             parksh 20021213 */
         double  tinvestded;              /*  투자조합공제액 합 PARKSH 20021213 추가 */        
         double  fami70no;                /*  경로우대 70세이상 수*/
         double  shosamt;                 /*  본인 의료비        */
         double  specaddno;               /*  특별공제(결혼.장례.이사소득공제 건수)*/
         double  SPECADDLIMIT;            /*  특별공제(결혼.장례.이사소득공제 한도액)*/
         double  specaddded;              /*  특별공제(결혼.장례.이사소득공제 개인별 공제액)*/
         double  poliamt;                 /*  정치기부금 */
         double  polided;                 /*  정치자금 세액공제액 */
         double  POLILIMIT;               /*  정치자금 세액공제 한도   Dsa2000 추가  2004.12. End..*/    
         double  costockamt;              /*  우리사주출연금 공제 출연금  dsa2000  2006.12.*/  
         double  costockded;              /*  우리사주출연금 공제금       dsa2000  2006.12.*/  
         double  COSTOCKLIMIT;            /*  우리사주출연금 공제한도     dsa2000  2006.12.*/  
         double  costocktax;              /*  우리사주 인출과세액         dsa2000  2007.01.*/          
         
         double  babyno;
         double  fundamt1;
         double  fundamt2;
         double  fundamt3;                /*  DSA2000 추가  2008.12.*/
         double  fundded;                     
         double  longmtamt;               /*  노인 장기요양 보험금            2008.12 KTH */
         double  longmtded;               /*  노인 장기요양 보험공제금        2008.12 KTH */
         double  CreditAll;               /*  총 신용카드사용액(신용+지로+현금영수증+직불) */        
         double  CreditOver;              /*  총신용카드 급여액 25% 초과액 => 총공제가능액 */              
                      
         double  TMARKETDEDRATE     = 0;  /*  전통시장공제한도율     						    2012.12  */
         double  TMARKETEXLIMIT     = 0;  /*  전통시장공제초과한도금액     			    2012.12  */
         double  INVESTRATE2        = 0;  /*  투자조합출자소득공제율(2012년이후)    2012.12  */
         double  INVESTDEDRATE2     = 0;  /*  투자조합출자소득공제한도율     		    2012.12  */               
         double  HSDEDLIMIT5        = 0;  /*  고정비거치식 한도금액     					  2012.12  */
         double  HSDEDLIMIT6        = 0;  /*  기타대출한도금액     							    2012.12  */
         double  tmarketamt         = 0;  /*  전통시장공제금액     						      2012.12  */
         double  houseintamt4       = 0;  /*  고정비거치식공제금액     					    2012.12  */
         double  houseintamt5       = 0;  /*  기타대출공제금액     						      2012.12  */
         double  houseintded4       = 0;  /*  고정비거치식공제금       					    2012.12  */
         double  houseintded5       = 0;  /*  기타대출공제금       						      2012.12  */
         double  housededsum        = 0;  /*  주택자금공제합계                      2012.12  */     
         double  investamt2         = 0;  /*  투자조합출자소득공제금액(2012년이후)  2012.12  */  
         
         double  SPARENTDEDADD      = 0;  /*  한부모 소득공제금액                   2013.11  */ 
         double  HSRATE2            = 0;  /*  주택자금 월세액 공제율                2013.11  */ 
         double  TRAFFICDEDRATE     = 0;  /*  대중교통공제한도율                    2013.11  */ 
         double  TRAFFICEXLIMIT     = 0;  /*  대중교통공제 초과 한도금액            2013.11  */
         double  SPDEDLIMIT         = 0;  /*  특별공제 종합한도금액                 2013.11  */
         double  INVESTRATE3        = 0;  /*  투자조합출자소득공제율(2013년이후)    2013.11  */ 
         double  HSRENTINTRATE      = 0;  /*  목돈 안드는 전세 이자상환액 공제율    2013.11  */ 
         double  HSRENTINTLIMIT     = 0;  /*  목돈 안드는 전세 이자상환액 한도금액  2013.11  */
         double  NOTICERATE         = 0;  /*  인정상여고시이율                      2013.11  */               
         
         double  sparent            = 0;  /*  한부모 공제                           2013.11  */ 
         double  sparentded         = 0;  /*  한부모 공제금액                       2013.11  */  
         double  obshosded          = 0;  /*  의료비공제_장애인                     2013.11  */  
         double  trafficamt         = 0;  /*  대중교통사용분                        2013.11  */  
         double  splimitovded       = 0;  /*  소득공제 종합한도 초과금액            2013.11  */ 
         double  investamt3         = 0;  /*  투자조합출자(2013년이후)_10%          2013.11  */
         double  investamt4         = 0;  /*  투자조합출자(2013년이후)_30%          2013.11  */
         double  investded2         = 0;  /*  투자조합출자소득공제금액(2013년이후)  2013.11  */ 
         double  hsrentinamt        = 0;  /*  목돈 안드는 전세 이자상환액           2013.11  */  
         double  hsrentinded        = 0;  /*  목돈 안드는 전세 이자상환액 공제금액  2013.11  */  
         double  nepgiveded         = 0;  /*  지정기부공제(종교단체_기부금명세)     2013.11  */  
         double  nepgiveded2        = 0;  /*  지정기부공제(종교단체외_기부금명세)   2013.11  */ 
         double  chagamamt          = 0;  /*  차감소득금액                          2013.12  */ 
         
         double  yseq               = 0;  /*  거주자간 순번                         2013.11  */ 
         double  yloansum           = 0;  /*  거주자간 원리금상환액계               2013.11  */ 
         double  yloanded           = 0;  /*  거주자간 공제금액                     2013.11  */ 
         
         double  mseq               = 0;  /*  월세액 순번                           2013.11  */ 
         double  mrentcost          = 0;  /*  월세액                                2013.11  */ 
         double  mrentcostded       = 0;  /*  월세액 공제금액                       2013.11  */

         double  laborlimit         = 0;

         double  TAXDEDSECT1        = 0;  /*  근로소득세액공제 총급여한계액1        2014.12  */
         double  TAXDEDSLIMIT1      = 0;  /*  근로소득세액공제한계액1               2014.12  */
         double  TAXDEDSECT2        = 0;  /*  근로소득세액공제 총급여한계액2        2014.12  */
         double  TAXDEDSLIMIT2      = 0;  /*  근로소득세액공제한계액2               2014.12  */
         double  APPDEDLIMIT        = 0;  /*  부녀자조건-총급여기준액               2014.12  */
         double  NPENRATE           = 0;  /*  연금세액공제율                        2014.12  */
         double  SPECIALRATE1       = 0;  /*  특별세액공제율1(보장성보험)           2014.12  */
         double  SPECIALRATE2       = 0;  /*  특별세액공제율2(의료비,교육비,기부금) 2014.12  */
         double  GIVESLIMIT         = 0;  /*  기부금세액공제초과분                  2014.12  */
         double  GIVESRATE          = 0;  /*  기부한도초과분공제율                  2014.12  */
         double  HOUSERENTLIMIT1    = 0;  /*  월세세액공제대상자총급여기준          2014.12  */
         double  HOUSERENTLIMIT2    = 0;  /*  월세세액공제한도액                    2014.12  */
         double  HOUSERENTRATE      = 0;  /*  월세세액공제율                        2014.12  */
         double  INVESTRATE4        = 0;  /*  투자조합출자분(2014년이후)_10%공제    2014.12  */
         double  INVESTRATE5        = 0;  /*  투자조합출자분(2014년이후)_50%공제    2014.12  */
         double  INVESTRATE6        = 0;  /*  투자조합출자분(2014년이후)_30%공제    2014.12  */
         double  INVESTDEDRATE3     = 0;  /*  투자조합출자분(2014년이후)공제한도    2014.12  */
         double  LONGFUNDLIMIT1     = 0;  /*  장기집합투자증권저축공제한도          2014.12  */
         double  LONGFUNDLIMIT2     = 0;  /*  장기집합투자증권저축공제총급여한도    2014.12  */
         double  LONGFUNDRATE       = 0;  /*  장기집합투자증권저축공제율            2014.12  */
         double  CARDUPRATE1        = 0;  /*  신용카드 외 사용증가분 추가공제대상률 2014.12  */
         double  CARDUPRATE2        = 0;  /*  신용카드 외 사용증가분 추가공제율     2014.12  */
         double  YLOANBASLIMIT      = 0;  /*  개인간차입금공제대상자총급여기준      2014.12  */
    
         double  nagiveded          = 0;  /*  이월 법정기부금(특별소득공제)         2014.12  */
         double  npgiveded          = 0;  /*  이월 지정기부금(특별소득공제)종교     2014.12  */
         double  npgiveded2         = 0;  /*  이월 지정기부금(특별소득공제)비종교   2014.12  */
         double  ngiveded           = 0;  /*  기부금(이월분) 특별소득공제           2014.12  */
         double  investamt5         = 0;  /*  투자조합출자분(2014년이후)_10%공제    2014.12  */
         double  investamt6         = 0;  /*  투자조합출자분(2014년이후)_50%공제    2014.12  */
         double  investamt7         = 0;  /*  투자조합출자분(2014년이후)_30%공제    2014.12  */
         double  investded3         = 0;  /*  투자조합출자공제금(2014년)            2014.12  */
         double  longfundamt        = 0;  /*  장기집합투자증권저축 납입액           2014.12  */
         double  longfundded        = 0;  /*  장기집합투자증권저축 공제금           2014.12  */
         double  childtaxded        = 0;  /*  자녀세액공제                          2014.12  */
         double  npendtaxded        = 0;  /*  연금계좌_연금저축_세액공제            2014.12  */
         double  guartaxded         = 0;  /*  특별세액공제_보장성보험               2014.12  */
         double  hostaxded          = 0;  /*  특별세액공제_의료비                   2014.12  */
         double  edutaxded          = 0;  /*  특별세액공제_교육비                   2014.12  */
         double  polided1           = 0;  /*  정치자금10만원이이하                  2014.12  */
         double  polided2           = 0;  /*  정치자금10만원이초과                  2014.12  */
         double  politaxded1        = 0;  /*  특별세액공제_정치자금10만원이하       2014.12  */
         double  politaxded2        = 0;  /*  특별세액공제_정치자금10만원이상       2014.12  */
         double  agivetaxded        = 0;  /*  특별세액공제_법정기부금               2014.12  */
         double  pgivetaxded        = 0;  /*  특별세액공제_지정기부금               2014.12  */
         double  taxdedsum          = 0;  /*  특별세액공제_계                       2014.12  */ 
         double  houserenttaxded    = 0;  /*  세액공제_월세                         2014.12  */ 
         double  creditaddamt1      = 0;  /*  전년도 본인신용카드 사용액            2014.12  */ 
         double  creditaddamt2      = 0;  /*  당해년도 본인신용카드 사용액          2014.12  */ 
         double  creditaddamt3      = 0;  /*  전년도 추가공제율 사용분              2014.12  */ 
         double  creditaddamt4      = 0;  /*  당해년도 추가공제율 사용분            2014.12  */
         double  npgiveamt2_2010    = 0;  /*  2010년분   이월 지정기부금 비종교     2014.12  */
         double  npgiveamt2_else    = 0;  /*  2010년이후 이월 지정기부금 비종교     2014.12  */    
         
         double  INFANTDED;                /* 2015.04.24 jissi 6세이하 2자녀이상 세액공제                */
         double  ADDBABYDED;               /* 2015.04.24 jissi 출산.입양 세액공제                        */
         double  NPENRATE2;                /* 2015.04.24 jissi 연금저축 세액공제율2                      */
         double  NPENLIMIT;                /* 2015.04.24 jissi 연금저축 총급여한도                       */  
         
         double  infanttaxded            = 0;  /* 2015.04.24 jissi 6세이하 2자녀이상 세액공제              */   
         double  addbabytaxded           = 0;  /* 2015.04.24 jissi 출산입양 세액공제                       */   
         double  obsguartaxded           = 0;  /* 2015.04.24 jissi 장애인전용보장성보험 세액공제           */   

         double  HOUSVLIMIT1        = 0;  /* 2015.12 jissi 주택마련저축 총급여한도*/
         double  HOUSVLIMIT2        = 0;  /* 2015.12 jissi 주택마련저축 기존 공제한도*/
         double  HOUSVLIMIT3        = 0;  /* 2015.12 jissi 주택마련저축 2015년이후 공제한도*/
         double  HOUSVLIMIT4        = 0;  /* 2015.12 jissi 주택마련저축 근로자 주택마련저축 공제한도*/
         double  HSDEDLIMIT7        = 0;  /* 2015.12 jissi 장기주택저당차입금:만기 15년 이상_고정금리and비거치식 분할상환*/
         double  HSDEDLIMIT8        = 0;  /* 2015.12 jissi 장기주택저당차입금:만기 15년 이상_고정금리or비거치식 분할상환*/
         double  HSDEDLIMIT9        = 0;  /* 2015.12 jissi 장기주택저당차입금:만기 15년 이상_이외 기타대출*/
         double  HSDEDLIMIT10       = 0;  /* 2015.12 jissi 장기주택저당차입금:만기 10년 이상_고정금리or비거치식분할상환*/
         double  INVESTRATE7        = 0;  /* 2015.12 jissi 투자조합출자:15년일반_10%공제*/
         double  INVESTRATE8        = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 1500만원이하_100%공제*/
         double  INVESTRATE9        = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 1500~5000만원_50%공제*/
         double  INVESTRATE10       = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 5000만원초과_30%공제*/
         double  CARDUPRATE3        = 0;  /* 2015.12 jissi 신용카드 증가분 공제율_20%*/  
         double  RPENDEDLIMIT       = 0;  /* 2015.12 jissi 퇴직연금계좌공제한도*/

         double  nagiveamt_2014     = 0;  /* 2015.12 jissi 2014년 이후 이월 법정기부금*/
         double  npgiveamt_2014     = 0;  /* 2015.12 jissi 2014년 이후 이월 지정기부금(종교단체)*/ 
         double  npgiveamt2_2014    = 0;  /* 2015.12 jissi 2014년 이후 이월 지정기부금(종교단체외)*/
         double  nagiveded_2014     = 0;  /* 2015.12 jissi 2014년 이후 이월 법정기부금_공제대상금액*/
         double  npgiveded_2014     = 0;  /* 2015.12 jissi 2014년 이후 이월 지정기부금(종교단체)_공제대상금액*/ 
         double  npgiveded2_2014    = 0;  /* 2015.12 jissi 2014년 이후 이월 지정기부금(종교단체외)_공제대상금액*/
         double  houseintamt6       = 0;  /* 2015.12 jissi 2015년이후_15년이상_고정금리and비거치상환*/
         double  houseintamt7       = 0;  /* 2015.12 jissi 2015년이후_15년이상_고정금리or비거치상환*/
         double  houseintamt8       = 0;  /* 2015.12 jissi 2015년이후_15년이상_그밖의대출*/
         double  houseintamt9       = 0;  /* 2015.12 jissi 2015년이후_10년이상_고정금리or비거치상환*/
         double  houseintded6       = 0;  /* 2015.12 jissi 장기주택저당차입금_2015년이후_15년이상_고정금리and비거치상환 공제*/
         double  houseintded7       = 0;  /* 2015.12 jissi 장기주택저당차입금_2015년이후_15년이상_고정금리or비거치상환 공제*/
         double  houseintded8       = 0;  /* 2015.12 jissi 장기주택저당차입금_2015년이후_15년이상_그밖의대출 공제*/
         double  houseintded9       = 0;  /* 2015.12 jissi 장기주택저당차입금_2015년이후_10년이상_고정금리or비거치상환 공제*/
         double  investamt8         = 0;  /* 2015.12 jissi 투자조합출자(2015년이후)_10%*/
         double  investamt9         = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 1500만원이하_100%공제*/
         double  investamt10        = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 1500~5000만원_50%공제*/
         double  investamt11        = 0;  /* 2015.12 jissi 투자조합출자:15년벤처 5000만원초과_30%공제*/
         double  investded4         = 0;  /* 2015.12 jissi 투자조합출자공제금(2015년)*/
         double  creditaddamt5      = 0;  /* 2015.12 jissi 2015년 신용카드 본인사용분*/
         double  creditaddamt6      = 0;  /* 2015.12 jissi 2015년 상반기 추가공제율사용분*/
         double  creditaddamt7      = 0;  /* 2015.12 jissi 2015년 하반기 추가공제율사용분*/
         double  ihosamt            = 0;  /* 2015.12 jissi 의료비:난임시술비*/
         double  rpenamt            = 0;  /* 2015.12 jissi 퇴직연금불입액*/
         double  rpended            = 0;  /* 2015.12 jissi 퇴직연금_공제대상금액*/
         double  rpentaxded         = 0;  /* 2015.12 jissi 퇴직연금_세액공제액*/
              
     struct
     {      double taxfr   ;
            double taxto   ;
            double taxrate ;
            double yearded ;
     } taxtbl[10];
     
     char  jobempno[4+1]  = "";  /* 작업자사번    */                     
        
/* EXEC SQL END   DECLARE SECTION; */ 



FILE *fp = stdout;
int  i=0;
int  id;
int     taxtblcnt=0;

/*=== Rexec대체 서비스를 위한 =============*/
char log_rundate[16]     = ""; 
char log_progid[16]      = "";
char log_writeman[5]     = "";
char log_buff[100]       = "";
int  seqno = 0; 

void main(argc,argv)
int  argc;
char *argv[];

{
    char FL_file[255];
    
    if (argc != 5) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkz4041g D006  pkz4041g 2004110100000 2012*/
        printf("[Usage] :  pkz4041g 1.작업사번 2.프로그램ID 3.시작시간 4.귀속년도 \n");
        exit(1);
    }
    
    /*로그 디렉토리 생성 및 로그작업 */
    STRINIT(FL_file);
    strcpy(FL_file,"pkz4041g");
    
    hinsa_get_filename(1, FL_file);
    if (hinsa_log_open(FL_file) == FAILURE)
    {
        hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
        return;
    }
        
    sprintf(jobempno,"%s",  argv[1]);   
    
    hinsa_log_print(0,"임원 퇴직자 연말정산 계산 시작...");        
    hinsa_db_connect();  /*DB Connect 실시..*/
    
    strcpy(log_writeman, argv[1]);
    strcpy(log_progid,   argv[2]);
    strcpy(log_rundate,  argv[3]);  
    strcpy(workyy,       argv[4]);
      
    /* EXEC SQL DECLARE log_db DATABASE; */ 
    
    hinsa_log_db_connect();
        
    Calc_Yearend();
    
    /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
         Write_batlog(seqno++, "ERROR ====== [작업 실패] =====");  
         error_quit("ERROR ====== [작업 실패] =====\n");
    }
    else  
    {
         Write_batlog(seqno++, "OK === [퇴직자 연말정산 작업성공] ===");
         hinsa_exit(0,"OK === [퇴직자 연말정산 작업성공] ===");
    }
}

err_print(errcode,str)
int errcode;
char *str;
{
      fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

ClearVar()
{
     memset(empno,'\0',sizeof(empno));
     memset(juminid,'\0',sizeof(juminid));
     SelfAge    = taxgross     = foritaxgross = mate        = familyno  = fami65no  = 0;
     mcogbonsum = bcogbonsum   = 0;
     obstacleno = childno      = woman        = fewno=0;
     medamt     = bmedamt      = 0;
     hireamt    = bhireamt     = 0;
     guaramt    = ghosamt      = ohosamt      = nhosamt     = hosamt    = 0;
     keduno     = ueduno       = 0;
     seduamt    = keduamt      = ceduno       = ceduamt     = ueduamt   = 0;
     houseamt   = houseamt2    = houseintamt  = agiveamt    = pgiveamt  = pgiveamt2 = sgiveamt =0;
     penamt1    = penamt2      = 0;
     hloanamt   = foriamt      = etctamt      = 0;
     creditamt  = creditdedamt = credittotamt = 0;      
     mintax     = mjutax       = bintax       = bjutax      = 0;
     mnongtax   = bnongtax     = investamt    = 0;
     keduno1    = keduamt1     = 0;
     obsguaramt = anuamt       = banuamt      = 0;
     npenamt    = npenamt2     = 0;
     obseduno   = obseduamt    = spgivamt     = oinvestamt  = 0; 
     debitamt   = giroamt      = CreditOver = 0;      
     fami70no   = specaddno    = specaddded   = polided     = houseintamt2 = houseintamt3 = 0;
     cashamt    = costockamt   = costockded   = costocktax  = 0;                       
          
     babyno       = babyded      = fundamt1     = fundamt2     = fundamt3     = fundded =0 ;  /* KTH 추가  2008.12.*/
     longmtamt    = longmtded    = pgiveamt2    = houseamt2    = houseintded  = houseintamt3 = houserentamt =0 ; /* KTH 추가  2008.12.houseintamt3 KTH 2010.01 houserentamt KTH 20110125 추가*/
     houserentded = housvsubamt  = housvsubded  = housvempamt  = housvempded  = housvcomamt  = housvcomded= 0;
     tmarketamt   = houseintamt4 = houseintamt5 = houseintded4 = houseintded5 = investamt2   = 0; /*  2012.12. 추가 */    
     sparent      = sparentded   = obshosded    = trafficamt   = splimitovded = investamt3   = investamt4 = investded2 = 0;/* 2013.11. 추가 */
     hsrentinamt  = hsrentinded  = nepgiveded   = nepgiveded2  = chagamamt    = 0; /* 2013.11. 추가 */  
 
     nagiveded      = npgiveded      = npgiveded2   = ngiveded       = 0;  /* 2014.12. 추가 */
     investamt5     = investamt6     = investamt7   = investded3     = 0;  /* 2014.12. 추가 */
     longfundamt    = longfundded    = childtaxded  = npendtaxded    = 0;  /* 2014.12. 추가 */
     guartaxded     = hostaxded      = edutaxded    = 0;                   /* 2014.12. 추가 */
     polided1       = polided2       = politaxded1  = politaxded2    = 0;  /* 2014.12. 추가 */
     agivetaxded    = pgivetaxded    = taxdedsum    = houserenttaxded= 0;  /* 2014.12. 추가 */
     creditaddamt1  = creditaddamt2  = creditaddamt3= creditaddamt4  = 0;  /* 2014.12. 추가 */
     npgiveamt2_2010= npgiveamt2_else= 0;                                  /* 2014.12. 추가 */
     infanttaxded   = addbabytaxded  = obsguartaxded= 0;                   /*2015.04.24 jissi */
     
     nagiveamt_2014 = npgiveamt_2014 = npgiveamt2_2014 = 0;                /*2015.12 jissi*/
     nagiveded_2014 = npgiveded_2014 = npgiveded2_2014 = 0;                /*2015.12 jissi*/
     houseintamt6   = houseintamt7   = houseintamt8    = houseintamt9  = 0;/*2015.12 jissi*/
     houseintded6   = houseintded7   = houseintded8    = houseintded9  = 0;/*2015.12 jissi*/
     investamt8     = investamt9     = investamt10     = investamt11   = 0;/*2015.12 jissi*/
     investded4     = creditaddamt5  = creditaddamt6   = creditaddamt7 = 0;/*2015.12 jissi*/
     ihosamt        = rpenamt        = rpended         = rpentaxded    = 0;/*2015.12 jissi*/
}

/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()
{
     int i=0;
     
     /* EXEC SQL DECLARE ctax CURSOR FOR
     Select NVL(TAXPAYFR,0),NVL(TAXPAYTO,0),NVL(TAXRATE,0),
            NVL(YEARDED,0)
       From PKCPTAX
      Where TAXNUM = :TAXNUM; */ 

     
     /* EXEC SQL OPEN ctax; */ 

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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
         Write_batlog(seqno++, "연세율표  fetch Error");  
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
                Write_batlog(seqno++, "연말정산 기초자료 read Error");  
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
      SELECT  TAXNUM,          INDEDBASIC,      INDEDBRATE,
             INDEDORATE,      INDEDORATE2,     INDEDORATE3,    INDEDORATE4,   
             INDEDLIMIT,      INDEDLIMIT2,     INDEDLIMIT3,    INDEDLIMIT4,    
             BASDED,          APPDED,          FEWDED1,        FEWDED2,         STDDED,          INSDEDLIMIT,
             MEDDEDLIMIT,     MEDORATE,        KINEDULIMIT,    CJKEDULIMIT,     UNIEDULIMIT,     BROEDUNO,        HSRATE,          
             HSDEDLIMIT,      HSDEDLIMIT2,     HSDEDLIMIT3,    HSDEDLIMIT4,
             GIVDEDRATE,      GIVDEDRATE2,     GIVDEDRATE3,    PENRATE,         PENDEDLIMIT,     NPENDEDLIMIT,    
             TAXDEDBASIC,     TAXDEDBRATE,     TAXDEDORATE,    TAXDEDLIMIT,  
             PRODEDRATE,      HSINTRATE,       JUTAXRATE,      NONGRATE,      
             OINVESTRATE,     OINVESTDEDRATE,  INVESTRATE,     INVESTDEDRATE,    
             CREDEDLIMIT,     CREDEDRATE ,     CREORATE  ,     CREDEDLRATE,
             OBSDEDLIMIT,     APPOLDDED,       APPOLDDED2,     OBSEDULIMIT,     SPGIVDEDRATE,
             DEBITDEDRATE,    GIRODEDRATE,     FOREDEDRATE,    SPECADDLIMIT,    POLILIMIT ,        
             OBSDEDADD,       COSTOCKLIMIT,    APPBABYDED,
             FUNDRATE1,       FUNDRATE2,       FUNDRATE3,      LONGMTRATE,
             HSDEDLIMIT4,     INDEDBRATE,      GIVDEDRATE3,
             TMARKETDEDRATE,  TMARKETEXLIMIT,  INVESTRATE2,    INVESTDEDRATE2,  HSDEDLIMIT5,     HSDEDLIMIT6,       /o 추가 2012.12 o/
             SPARENTDEDADD,   HSRATE2,         TRAFFICDEDRATE, TRAFFICEXLIMIT,  SPDEDLIMIT,      INVESTRATE3,       /o 추가 2013.12 o/
             HSRENTINTRATE,   HSRENTINTLIMIT,  NOTICERATE,                                                          /o 추가 2013.12 o/
             TAXDEDSECT1,     TAXDEDSLIMIT1,   TAXDEDSECT2,    TAXDEDSLIMIT2,   APPDEDLIMIT,     NPENRATE,          /o 추가 2014.12 o/
             SPECIALRATE1,    SPECIALRATE2,    GIVESLIMIT,     GIVESRATE,       HOUSERENTLIMIT1, HOUSERENTLIMIT2,   /o 추가 2014.12 o/
             HOUSERENTRATE,   INVESTRATE4,     INVESTRATE5,    INVESTRATE6,     INVESTDEDRATE3,                     /o 추가 2014.12 o/
             LONGFUNDLIMIT1,  LONGFUNDLIMIT2,  LONGFUNDRATE,   CARDUPRATE1,     CARDUPRATE2,     YLOANBASLIMIT,     /o 추가 2014.12 o/
             INFANTDED,       ADDBABYDED,      NPENRATE2,      NPENLIMIT,                                           /o2015.04.24 jissi o/
             HOUSVLIMIT1,     HOUSVLIMIT2,     HOUSVLIMIT3,    HOUSVLIMIT4,                                         /o2015.12 jissio/
             HSDEDLIMIT7,     HSDEDLIMIT8,     HSDEDLIMIT9,    HSDEDLIMIT10,                                        /o2015.12 jissio/
             INVESTRATE7,     INVESTRATE8,     INVESTRATE9,    INVESTRATE10,                                        /o2015.12 jissio/
             CARDUPRATE3,     RPENDEDLIMIT                                                                          /o2015.12 jissio/
     INTO    :TAXNUM,        :INDEDBASIC,     :INDEDBRATE,
             :INDEDORATE,    :INDEDORATE2,    :INDEDORATE3,   :INDEDORATE4,  
             :INDEDLIMIT,    :INDEDLIMIT2,    :INDEDLIMIT3,   :INDEDLIMIT4,  
             :BASDED,        :APPDED,         :FEWDED1,       :FEWDED2,         :STDDED,          :INSDEDLIMIT,
             :MEDDEDLIMIT,   :MEDORATE,       :KINEDULIMIT,   :CJKEDULIMIT,     :UNIEDULIMIT,     :BROEDUNO,      :HSRATE,         
             :HSDEDLIMIT,    :HSDEDLIMIT2,    :HSDEDLIMIT3,   :HSDEDLIMIT4,     
             :GIVDEDRATE,    :GIVDEDRATE2,    :GIVDEDRATE3,   :PENRATE,         :PENDEDLIMIT,     :NPENDEDLIMIT,   
             :TAXDEDBASIC,   :TAXDEDBRATE,    :TAXDEDORATE,   :TAXDEDLIMIT,     
             :PRODEDRATE,    :HSINTRATE,      :JUTAXRATE,     :NONGRATE,        
             :OINVESTRATE,   :OINVESTDEDRATE, :INVESTRATE,    :INVESTDEDRATE,    
             :CREDEDLIMIT,   :CREDEDRATE,     :CREORATE   ,   :CREDEDLRATE,     
             :OBSDEDLIMIT,   :APPOLDDED,      :APPOLDDED2,    :OBSEDULIMIT,     :SPGIVDEDRATE, 
             :DEBITDEDRATE,  :GIRODEDRATE,    :FOREDEDRATE,   :SPECADDLIMIT,    :POLILIMIT,     
             :OBSDEDADD,     :COSTOCKLIMIT,   :APPBABYDED,
             :FUNDRATE1,     :FUNDRATE2,      :FUNDRATE3,     :LONGMTRATE,
             :HSDEDLIMIT4,   :INDEDBRATE,     :GIVDEDRATE3,
             :TMARKETDEDRATE,:TMARKETEXLIMIT, :INVESTRATE2,   :INVESTDEDRATE2,  :HSDEDLIMIT5,     :HSDEDLIMIT6,     /o 추가 2012.12 o/
             :SPARENTDEDADD, :HSRATE2,        :TRAFFICDEDRATE,:TRAFFICEXLIMIT,  :SPDEDLIMIT,      :INVESTRATE3,     /o 추가 2013.12 o/
             :HSRENTINTRATE, :HSRENTINTLIMIT, :NOTICERATE,                                                          /o 추가 2013.12 o/
             :TAXDEDSECT1,   :TAXDEDSLIMIT1,  :TAXDEDSECT2,   :TAXDEDSLIMIT2,   :APPDEDLIMIT,     :NPENRATE,        /o 추가 2014.12 o/
             :SPECIALRATE1,  :SPECIALRATE2,   :GIVESLIMIT,    :GIVESRATE,       :HOUSERENTLIMIT1, :HOUSERENTLIMIT2, /o 추가 2014.12 o/
             :HOUSERENTRATE, :INVESTRATE4,    :INVESTRATE5,   :INVESTRATE6,     :INVESTDEDRATE3,                    /o 추가 2014.12 o/
             :LONGFUNDLIMIT1,:LONGFUNDLIMIT2, :LONGFUNDRATE,  :CARDUPRATE1,     :CARDUPRATE2,     :YLOANBASLIMIT,   /o 추가 2014.12 o/
             :INFANTDED,     :ADDBABYDED,     :NPENRATE2,     :NPENLIMIT,                                           /o2015.04.24 jissi o/
             :HOUSVLIMIT1,   :HOUSVLIMIT2,    :HOUSVLIMIT3,   :HOUSVLIMIT4,                                         /o2015.12 jissio/
             :HSDEDLIMIT7,   :HSDEDLIMIT8,    :HSDEDLIMIT9,   :HSDEDLIMIT10,                                        /o2015.12 jissio/
             :INVESTRATE7,   :INVESTRATE8,    :INVESTRATE9,   :INVESTRATE10,                                        /o2015.12 jissio/
             :CARDUPRATE3,   :RPENDEDLIMIT                                                                          /o2015.12 jissio/	
       FROM  PKCYSBAS
      Where   WORKYY = :workyy; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 127;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlbuft((void **)0,
        "select TAXNUM ,INDEDBASIC ,INDEDBRATE ,INDEDORATE ,INDEDORATE2 ,IND\
EDORATE3 ,INDEDORATE4 ,INDEDLIMIT ,INDEDLIMIT2 ,INDEDLIMIT3 ,INDEDLIMIT4 ,BA\
SDED ,APPDED ,FEWDED1 ,FEWDED2 ,STDDED ,INSDEDLIMIT ,MEDDEDLIMIT ,MEDORATE ,\
KINEDULIMIT ,CJKEDULIMIT ,UNIEDULIMIT ,BROEDUNO ,HSRATE ,HSDEDLIMIT ,HSDEDLI\
MIT2 ,HSDEDLIMIT3 ,HSDEDLIMIT4 ,GIVDEDRATE ,GIVDEDRATE2 ,GIVDEDRATE3 ,PENRAT\
E ,PENDEDLIMIT ,NPENDEDLIMIT ,TAXDEDBASIC ,TAXDEDBRATE ,TAXDEDORATE ,TAXDEDL\
IMIT ,PRODEDRATE ,HSINTRATE ,JUTAXRATE ,NONGRATE ,OINVESTRATE ,OINVESTDEDRAT\
E ,INVESTRATE ,INVESTDEDRATE ,CREDEDLIMIT ,CREDEDRATE ,CREORATE ,CREDEDLRATE\
 ,OBSDEDLIMIT ,APPOLDDED ,APPOLDDED2 ,OBSEDULIMIT ,SPGIVDEDRATE ,DEBITDEDRAT\
E ,GIRODEDRATE ,FOREDEDRATE ,SPECADDLIMIT ,POLILIMIT ,OBSDEDADD ,COSTOCKLIMI\
T ,APPBABYDED ,FUNDRATE1 ,FUNDRATE2 ,FUNDRATE3 ,LONGMTRATE ,HSDEDLIMIT4 ,IND\
EDBRATE ,GIVDEDRATE3 ,TMARKETDEDRATE ,TMARKETEXLIMIT ,INVESTRATE2 ,INVESTDED\
RATE2 ,HSDEDLIMIT5 ,HSDEDLIMIT6 ,SPARENTDEDADD ,HSRATE2 ,TRAFFICDEDRATE ,TRA\
FFICEXLIMIT ,SPDEDLIMIT ,INVESTRATE3 ,HSRENTI");
      sqlbuft((void **)0,
        "NTRATE ,HSRENTINTLIMIT ,NOTICERATE ,TAXDEDSECT1 ,TAXDEDSLIMIT1 ,TAX\
DEDSECT2 ,TAXDEDSLIMIT2 ,APPDEDLIMIT ,NPENRATE ,SPECIALRATE1 ,SPECIALRATE2 ,\
GIVESLIMIT ,GIVESRATE ,HOUSERENTLIMIT1 ,HOUSERENTLIMIT2 ,HOUSERENTRATE ,INVE\
STRATE4 ,INVESTRATE5 ,INVESTRATE6 ,INVESTDEDRATE3 ,LONGFUNDLIMIT1 ,LONGFUNDL\
IMIT2 ,LONGFUNDRATE ,CARDUPRATE1 ,CARDUPRATE2 ,YLOANBASLIMIT ,INFANTDED ,ADD\
BABYDED ,NPENRATE2 ,NPENLIMIT ,HOUSVLIMIT1 ,HOUSVLIMIT2 ,HOUSVLIMIT3 ,HOUSVL\
IMIT4 ,HSDEDLIMIT7 ,HSDEDLIMIT8 ,HSDEDLIMIT9 ,HSDEDLIMIT10 ,INVESTRATE7 ,INV\
ESTRATE8 ,INVESTRATE9 ,INVESTRATE10 ,CARDUPRATE3 ,RPENDEDLIMIT into :b0,:b1,\
:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18\
,:b19,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,\
:b34,:b35,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44,:b45,:b46,:b47,:b48,:\
b49,:b50,:b51,:b52,:b53,:b54,:b55,:b56,:b57,:b58,:b59,:b60,:b61,:b62,:b63,:b\
64,:b65,:b66,:b27,:b2,:b30,:b70,:b71,:b72,:b73,:b74,:b75,:b76,:b77,:b78,:b79\
,:b80,:b81,:b82,:b83,:b84,:b85,:b86,:b87,:b88");
      sqlstm.stmt = ",:b89,:b90,:b91,:b92,:b93,:b94,:b95,:b96,:b97,:b98,:b9\
9,:b100,:b101,:b102,:b103,:b104,:b105,:b106,:b107,:b108,:b109,:b110,:b111,:b1\
12,:b113,:b114,:b115,:b116,:b117,:b118,:b119,:b120,:b121,:b122,:b123,:b124,:b\
125  from PKCYSBAS where WORKYY=:b126";
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
      sqlstm.sqhstv[4] = (unsigned char  *)&INDEDORATE2;
      sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&INDEDORATE3;
      sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[5] = (         int  )0;
      sqlstm.sqindv[5] = (         short *)0;
      sqlstm.sqinds[5] = (         int  )0;
      sqlstm.sqharm[5] = (unsigned long )0;
      sqlstm.sqadto[5] = (unsigned short )0;
      sqlstm.sqtdso[5] = (unsigned short )0;
      sqlstm.sqhstv[6] = (unsigned char  *)&INDEDORATE4;
      sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[6] = (         int  )0;
      sqlstm.sqindv[6] = (         short *)0;
      sqlstm.sqinds[6] = (         int  )0;
      sqlstm.sqharm[6] = (unsigned long )0;
      sqlstm.sqadto[6] = (unsigned short )0;
      sqlstm.sqtdso[6] = (unsigned short )0;
      sqlstm.sqhstv[7] = (unsigned char  *)&INDEDLIMIT;
      sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[7] = (         int  )0;
      sqlstm.sqindv[7] = (         short *)0;
      sqlstm.sqinds[7] = (         int  )0;
      sqlstm.sqharm[7] = (unsigned long )0;
      sqlstm.sqadto[7] = (unsigned short )0;
      sqlstm.sqtdso[7] = (unsigned short )0;
      sqlstm.sqhstv[8] = (unsigned char  *)&INDEDLIMIT2;
      sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[8] = (         int  )0;
      sqlstm.sqindv[8] = (         short *)0;
      sqlstm.sqinds[8] = (         int  )0;
      sqlstm.sqharm[8] = (unsigned long )0;
      sqlstm.sqadto[8] = (unsigned short )0;
      sqlstm.sqtdso[8] = (unsigned short )0;
      sqlstm.sqhstv[9] = (unsigned char  *)&INDEDLIMIT3;
      sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[9] = (         int  )0;
      sqlstm.sqindv[9] = (         short *)0;
      sqlstm.sqinds[9] = (         int  )0;
      sqlstm.sqharm[9] = (unsigned long )0;
      sqlstm.sqadto[9] = (unsigned short )0;
      sqlstm.sqtdso[9] = (unsigned short )0;
      sqlstm.sqhstv[10] = (unsigned char  *)&INDEDLIMIT4;
      sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[10] = (         int  )0;
      sqlstm.sqindv[10] = (         short *)0;
      sqlstm.sqinds[10] = (         int  )0;
      sqlstm.sqharm[10] = (unsigned long )0;
      sqlstm.sqadto[10] = (unsigned short )0;
      sqlstm.sqtdso[10] = (unsigned short )0;
      sqlstm.sqhstv[11] = (unsigned char  *)&BASDED;
      sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[11] = (         int  )0;
      sqlstm.sqindv[11] = (         short *)0;
      sqlstm.sqinds[11] = (         int  )0;
      sqlstm.sqharm[11] = (unsigned long )0;
      sqlstm.sqadto[11] = (unsigned short )0;
      sqlstm.sqtdso[11] = (unsigned short )0;
      sqlstm.sqhstv[12] = (unsigned char  *)&APPDED;
      sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[12] = (         int  )0;
      sqlstm.sqindv[12] = (         short *)0;
      sqlstm.sqinds[12] = (         int  )0;
      sqlstm.sqharm[12] = (unsigned long )0;
      sqlstm.sqadto[12] = (unsigned short )0;
      sqlstm.sqtdso[12] = (unsigned short )0;
      sqlstm.sqhstv[13] = (unsigned char  *)&FEWDED1;
      sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[13] = (         int  )0;
      sqlstm.sqindv[13] = (         short *)0;
      sqlstm.sqinds[13] = (         int  )0;
      sqlstm.sqharm[13] = (unsigned long )0;
      sqlstm.sqadto[13] = (unsigned short )0;
      sqlstm.sqtdso[13] = (unsigned short )0;
      sqlstm.sqhstv[14] = (unsigned char  *)&FEWDED2;
      sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[14] = (         int  )0;
      sqlstm.sqindv[14] = (         short *)0;
      sqlstm.sqinds[14] = (         int  )0;
      sqlstm.sqharm[14] = (unsigned long )0;
      sqlstm.sqadto[14] = (unsigned short )0;
      sqlstm.sqtdso[14] = (unsigned short )0;
      sqlstm.sqhstv[15] = (unsigned char  *)&STDDED;
      sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[15] = (         int  )0;
      sqlstm.sqindv[15] = (         short *)0;
      sqlstm.sqinds[15] = (         int  )0;
      sqlstm.sqharm[15] = (unsigned long )0;
      sqlstm.sqadto[15] = (unsigned short )0;
      sqlstm.sqtdso[15] = (unsigned short )0;
      sqlstm.sqhstv[16] = (unsigned char  *)&INSDEDLIMIT;
      sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[16] = (         int  )0;
      sqlstm.sqindv[16] = (         short *)0;
      sqlstm.sqinds[16] = (         int  )0;
      sqlstm.sqharm[16] = (unsigned long )0;
      sqlstm.sqadto[16] = (unsigned short )0;
      sqlstm.sqtdso[16] = (unsigned short )0;
      sqlstm.sqhstv[17] = (unsigned char  *)&MEDDEDLIMIT;
      sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[17] = (         int  )0;
      sqlstm.sqindv[17] = (         short *)0;
      sqlstm.sqinds[17] = (         int  )0;
      sqlstm.sqharm[17] = (unsigned long )0;
      sqlstm.sqadto[17] = (unsigned short )0;
      sqlstm.sqtdso[17] = (unsigned short )0;
      sqlstm.sqhstv[18] = (unsigned char  *)&MEDORATE;
      sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[18] = (         int  )0;
      sqlstm.sqindv[18] = (         short *)0;
      sqlstm.sqinds[18] = (         int  )0;
      sqlstm.sqharm[18] = (unsigned long )0;
      sqlstm.sqadto[18] = (unsigned short )0;
      sqlstm.sqtdso[18] = (unsigned short )0;
      sqlstm.sqhstv[19] = (unsigned char  *)&KINEDULIMIT;
      sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[19] = (         int  )0;
      sqlstm.sqindv[19] = (         short *)0;
      sqlstm.sqinds[19] = (         int  )0;
      sqlstm.sqharm[19] = (unsigned long )0;
      sqlstm.sqadto[19] = (unsigned short )0;
      sqlstm.sqtdso[19] = (unsigned short )0;
      sqlstm.sqhstv[20] = (unsigned char  *)&CJKEDULIMIT;
      sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[20] = (         int  )0;
      sqlstm.sqindv[20] = (         short *)0;
      sqlstm.sqinds[20] = (         int  )0;
      sqlstm.sqharm[20] = (unsigned long )0;
      sqlstm.sqadto[20] = (unsigned short )0;
      sqlstm.sqtdso[20] = (unsigned short )0;
      sqlstm.sqhstv[21] = (unsigned char  *)&UNIEDULIMIT;
      sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[21] = (         int  )0;
      sqlstm.sqindv[21] = (         short *)0;
      sqlstm.sqinds[21] = (         int  )0;
      sqlstm.sqharm[21] = (unsigned long )0;
      sqlstm.sqadto[21] = (unsigned short )0;
      sqlstm.sqtdso[21] = (unsigned short )0;
      sqlstm.sqhstv[22] = (unsigned char  *)&BROEDUNO;
      sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[22] = (         int  )0;
      sqlstm.sqindv[22] = (         short *)0;
      sqlstm.sqinds[22] = (         int  )0;
      sqlstm.sqharm[22] = (unsigned long )0;
      sqlstm.sqadto[22] = (unsigned short )0;
      sqlstm.sqtdso[22] = (unsigned short )0;
      sqlstm.sqhstv[23] = (unsigned char  *)&HSRATE;
      sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[23] = (         int  )0;
      sqlstm.sqindv[23] = (         short *)0;
      sqlstm.sqinds[23] = (         int  )0;
      sqlstm.sqharm[23] = (unsigned long )0;
      sqlstm.sqadto[23] = (unsigned short )0;
      sqlstm.sqtdso[23] = (unsigned short )0;
      sqlstm.sqhstv[24] = (unsigned char  *)&HSDEDLIMIT;
      sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[24] = (         int  )0;
      sqlstm.sqindv[24] = (         short *)0;
      sqlstm.sqinds[24] = (         int  )0;
      sqlstm.sqharm[24] = (unsigned long )0;
      sqlstm.sqadto[24] = (unsigned short )0;
      sqlstm.sqtdso[24] = (unsigned short )0;
      sqlstm.sqhstv[25] = (unsigned char  *)&HSDEDLIMIT2;
      sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[25] = (         int  )0;
      sqlstm.sqindv[25] = (         short *)0;
      sqlstm.sqinds[25] = (         int  )0;
      sqlstm.sqharm[25] = (unsigned long )0;
      sqlstm.sqadto[25] = (unsigned short )0;
      sqlstm.sqtdso[25] = (unsigned short )0;
      sqlstm.sqhstv[26] = (unsigned char  *)&HSDEDLIMIT3;
      sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[26] = (         int  )0;
      sqlstm.sqindv[26] = (         short *)0;
      sqlstm.sqinds[26] = (         int  )0;
      sqlstm.sqharm[26] = (unsigned long )0;
      sqlstm.sqadto[26] = (unsigned short )0;
      sqlstm.sqtdso[26] = (unsigned short )0;
      sqlstm.sqhstv[27] = (unsigned char  *)&HSDEDLIMIT4;
      sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[27] = (         int  )0;
      sqlstm.sqindv[27] = (         short *)0;
      sqlstm.sqinds[27] = (         int  )0;
      sqlstm.sqharm[27] = (unsigned long )0;
      sqlstm.sqadto[27] = (unsigned short )0;
      sqlstm.sqtdso[27] = (unsigned short )0;
      sqlstm.sqhstv[28] = (unsigned char  *)&GIVDEDRATE;
      sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[28] = (         int  )0;
      sqlstm.sqindv[28] = (         short *)0;
      sqlstm.sqinds[28] = (         int  )0;
      sqlstm.sqharm[28] = (unsigned long )0;
      sqlstm.sqadto[28] = (unsigned short )0;
      sqlstm.sqtdso[28] = (unsigned short )0;
      sqlstm.sqhstv[29] = (unsigned char  *)&GIVDEDRATE2;
      sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[29] = (         int  )0;
      sqlstm.sqindv[29] = (         short *)0;
      sqlstm.sqinds[29] = (         int  )0;
      sqlstm.sqharm[29] = (unsigned long )0;
      sqlstm.sqadto[29] = (unsigned short )0;
      sqlstm.sqtdso[29] = (unsigned short )0;
      sqlstm.sqhstv[30] = (unsigned char  *)&GIVDEDRATE3;
      sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[30] = (         int  )0;
      sqlstm.sqindv[30] = (         short *)0;
      sqlstm.sqinds[30] = (         int  )0;
      sqlstm.sqharm[30] = (unsigned long )0;
      sqlstm.sqadto[30] = (unsigned short )0;
      sqlstm.sqtdso[30] = (unsigned short )0;
      sqlstm.sqhstv[31] = (unsigned char  *)&PENRATE;
      sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[31] = (         int  )0;
      sqlstm.sqindv[31] = (         short *)0;
      sqlstm.sqinds[31] = (         int  )0;
      sqlstm.sqharm[31] = (unsigned long )0;
      sqlstm.sqadto[31] = (unsigned short )0;
      sqlstm.sqtdso[31] = (unsigned short )0;
      sqlstm.sqhstv[32] = (unsigned char  *)&PENDEDLIMIT;
      sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[32] = (         int  )0;
      sqlstm.sqindv[32] = (         short *)0;
      sqlstm.sqinds[32] = (         int  )0;
      sqlstm.sqharm[32] = (unsigned long )0;
      sqlstm.sqadto[32] = (unsigned short )0;
      sqlstm.sqtdso[32] = (unsigned short )0;
      sqlstm.sqhstv[33] = (unsigned char  *)&NPENDEDLIMIT;
      sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[33] = (         int  )0;
      sqlstm.sqindv[33] = (         short *)0;
      sqlstm.sqinds[33] = (         int  )0;
      sqlstm.sqharm[33] = (unsigned long )0;
      sqlstm.sqadto[33] = (unsigned short )0;
      sqlstm.sqtdso[33] = (unsigned short )0;
      sqlstm.sqhstv[34] = (unsigned char  *)&TAXDEDBASIC;
      sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[34] = (         int  )0;
      sqlstm.sqindv[34] = (         short *)0;
      sqlstm.sqinds[34] = (         int  )0;
      sqlstm.sqharm[34] = (unsigned long )0;
      sqlstm.sqadto[34] = (unsigned short )0;
      sqlstm.sqtdso[34] = (unsigned short )0;
      sqlstm.sqhstv[35] = (unsigned char  *)&TAXDEDBRATE;
      sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[35] = (         int  )0;
      sqlstm.sqindv[35] = (         short *)0;
      sqlstm.sqinds[35] = (         int  )0;
      sqlstm.sqharm[35] = (unsigned long )0;
      sqlstm.sqadto[35] = (unsigned short )0;
      sqlstm.sqtdso[35] = (unsigned short )0;
      sqlstm.sqhstv[36] = (unsigned char  *)&TAXDEDORATE;
      sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[36] = (         int  )0;
      sqlstm.sqindv[36] = (         short *)0;
      sqlstm.sqinds[36] = (         int  )0;
      sqlstm.sqharm[36] = (unsigned long )0;
      sqlstm.sqadto[36] = (unsigned short )0;
      sqlstm.sqtdso[36] = (unsigned short )0;
      sqlstm.sqhstv[37] = (unsigned char  *)&TAXDEDLIMIT;
      sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[37] = (         int  )0;
      sqlstm.sqindv[37] = (         short *)0;
      sqlstm.sqinds[37] = (         int  )0;
      sqlstm.sqharm[37] = (unsigned long )0;
      sqlstm.sqadto[37] = (unsigned short )0;
      sqlstm.sqtdso[37] = (unsigned short )0;
      sqlstm.sqhstv[38] = (unsigned char  *)&PRODEDRATE;
      sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[38] = (         int  )0;
      sqlstm.sqindv[38] = (         short *)0;
      sqlstm.sqinds[38] = (         int  )0;
      sqlstm.sqharm[38] = (unsigned long )0;
      sqlstm.sqadto[38] = (unsigned short )0;
      sqlstm.sqtdso[38] = (unsigned short )0;
      sqlstm.sqhstv[39] = (unsigned char  *)&HSINTRATE;
      sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[39] = (         int  )0;
      sqlstm.sqindv[39] = (         short *)0;
      sqlstm.sqinds[39] = (         int  )0;
      sqlstm.sqharm[39] = (unsigned long )0;
      sqlstm.sqadto[39] = (unsigned short )0;
      sqlstm.sqtdso[39] = (unsigned short )0;
      sqlstm.sqhstv[40] = (unsigned char  *)&JUTAXRATE;
      sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[40] = (         int  )0;
      sqlstm.sqindv[40] = (         short *)0;
      sqlstm.sqinds[40] = (         int  )0;
      sqlstm.sqharm[40] = (unsigned long )0;
      sqlstm.sqadto[40] = (unsigned short )0;
      sqlstm.sqtdso[40] = (unsigned short )0;
      sqlstm.sqhstv[41] = (unsigned char  *)&NONGRATE;
      sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[41] = (         int  )0;
      sqlstm.sqindv[41] = (         short *)0;
      sqlstm.sqinds[41] = (         int  )0;
      sqlstm.sqharm[41] = (unsigned long )0;
      sqlstm.sqadto[41] = (unsigned short )0;
      sqlstm.sqtdso[41] = (unsigned short )0;
      sqlstm.sqhstv[42] = (unsigned char  *)&OINVESTRATE;
      sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[42] = (         int  )0;
      sqlstm.sqindv[42] = (         short *)0;
      sqlstm.sqinds[42] = (         int  )0;
      sqlstm.sqharm[42] = (unsigned long )0;
      sqlstm.sqadto[42] = (unsigned short )0;
      sqlstm.sqtdso[42] = (unsigned short )0;
      sqlstm.sqhstv[43] = (unsigned char  *)&OINVESTDEDRATE;
      sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[43] = (         int  )0;
      sqlstm.sqindv[43] = (         short *)0;
      sqlstm.sqinds[43] = (         int  )0;
      sqlstm.sqharm[43] = (unsigned long )0;
      sqlstm.sqadto[43] = (unsigned short )0;
      sqlstm.sqtdso[43] = (unsigned short )0;
      sqlstm.sqhstv[44] = (unsigned char  *)&INVESTRATE;
      sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[44] = (         int  )0;
      sqlstm.sqindv[44] = (         short *)0;
      sqlstm.sqinds[44] = (         int  )0;
      sqlstm.sqharm[44] = (unsigned long )0;
      sqlstm.sqadto[44] = (unsigned short )0;
      sqlstm.sqtdso[44] = (unsigned short )0;
      sqlstm.sqhstv[45] = (unsigned char  *)&INVESTDEDRATE;
      sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[45] = (         int  )0;
      sqlstm.sqindv[45] = (         short *)0;
      sqlstm.sqinds[45] = (         int  )0;
      sqlstm.sqharm[45] = (unsigned long )0;
      sqlstm.sqadto[45] = (unsigned short )0;
      sqlstm.sqtdso[45] = (unsigned short )0;
      sqlstm.sqhstv[46] = (unsigned char  *)&CREDEDLIMIT;
      sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[46] = (         int  )0;
      sqlstm.sqindv[46] = (         short *)0;
      sqlstm.sqinds[46] = (         int  )0;
      sqlstm.sqharm[46] = (unsigned long )0;
      sqlstm.sqadto[46] = (unsigned short )0;
      sqlstm.sqtdso[46] = (unsigned short )0;
      sqlstm.sqhstv[47] = (unsigned char  *)&CREDEDRATE;
      sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[47] = (         int  )0;
      sqlstm.sqindv[47] = (         short *)0;
      sqlstm.sqinds[47] = (         int  )0;
      sqlstm.sqharm[47] = (unsigned long )0;
      sqlstm.sqadto[47] = (unsigned short )0;
      sqlstm.sqtdso[47] = (unsigned short )0;
      sqlstm.sqhstv[48] = (unsigned char  *)&CREORATE;
      sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[48] = (         int  )0;
      sqlstm.sqindv[48] = (         short *)0;
      sqlstm.sqinds[48] = (         int  )0;
      sqlstm.sqharm[48] = (unsigned long )0;
      sqlstm.sqadto[48] = (unsigned short )0;
      sqlstm.sqtdso[48] = (unsigned short )0;
      sqlstm.sqhstv[49] = (unsigned char  *)&CREDEDLRATE;
      sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[49] = (         int  )0;
      sqlstm.sqindv[49] = (         short *)0;
      sqlstm.sqinds[49] = (         int  )0;
      sqlstm.sqharm[49] = (unsigned long )0;
      sqlstm.sqadto[49] = (unsigned short )0;
      sqlstm.sqtdso[49] = (unsigned short )0;
      sqlstm.sqhstv[50] = (unsigned char  *)&OBSDEDLIMIT;
      sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[50] = (         int  )0;
      sqlstm.sqindv[50] = (         short *)0;
      sqlstm.sqinds[50] = (         int  )0;
      sqlstm.sqharm[50] = (unsigned long )0;
      sqlstm.sqadto[50] = (unsigned short )0;
      sqlstm.sqtdso[50] = (unsigned short )0;
      sqlstm.sqhstv[51] = (unsigned char  *)&APPOLDDED;
      sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[51] = (         int  )0;
      sqlstm.sqindv[51] = (         short *)0;
      sqlstm.sqinds[51] = (         int  )0;
      sqlstm.sqharm[51] = (unsigned long )0;
      sqlstm.sqadto[51] = (unsigned short )0;
      sqlstm.sqtdso[51] = (unsigned short )0;
      sqlstm.sqhstv[52] = (unsigned char  *)&APPOLDDED2;
      sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[52] = (         int  )0;
      sqlstm.sqindv[52] = (         short *)0;
      sqlstm.sqinds[52] = (         int  )0;
      sqlstm.sqharm[52] = (unsigned long )0;
      sqlstm.sqadto[52] = (unsigned short )0;
      sqlstm.sqtdso[52] = (unsigned short )0;
      sqlstm.sqhstv[53] = (unsigned char  *)&OBSEDULIMIT;
      sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[53] = (         int  )0;
      sqlstm.sqindv[53] = (         short *)0;
      sqlstm.sqinds[53] = (         int  )0;
      sqlstm.sqharm[53] = (unsigned long )0;
      sqlstm.sqadto[53] = (unsigned short )0;
      sqlstm.sqtdso[53] = (unsigned short )0;
      sqlstm.sqhstv[54] = (unsigned char  *)&SPGIVDEDRATE;
      sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[54] = (         int  )0;
      sqlstm.sqindv[54] = (         short *)0;
      sqlstm.sqinds[54] = (         int  )0;
      sqlstm.sqharm[54] = (unsigned long )0;
      sqlstm.sqadto[54] = (unsigned short )0;
      sqlstm.sqtdso[54] = (unsigned short )0;
      sqlstm.sqhstv[55] = (unsigned char  *)&DEBITDEDRATE;
      sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[55] = (         int  )0;
      sqlstm.sqindv[55] = (         short *)0;
      sqlstm.sqinds[55] = (         int  )0;
      sqlstm.sqharm[55] = (unsigned long )0;
      sqlstm.sqadto[55] = (unsigned short )0;
      sqlstm.sqtdso[55] = (unsigned short )0;
      sqlstm.sqhstv[56] = (unsigned char  *)&GIRODEDRATE;
      sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[56] = (         int  )0;
      sqlstm.sqindv[56] = (         short *)0;
      sqlstm.sqinds[56] = (         int  )0;
      sqlstm.sqharm[56] = (unsigned long )0;
      sqlstm.sqadto[56] = (unsigned short )0;
      sqlstm.sqtdso[56] = (unsigned short )0;
      sqlstm.sqhstv[57] = (unsigned char  *)&FOREDEDRATE;
      sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[57] = (         int  )0;
      sqlstm.sqindv[57] = (         short *)0;
      sqlstm.sqinds[57] = (         int  )0;
      sqlstm.sqharm[57] = (unsigned long )0;
      sqlstm.sqadto[57] = (unsigned short )0;
      sqlstm.sqtdso[57] = (unsigned short )0;
      sqlstm.sqhstv[58] = (unsigned char  *)&SPECADDLIMIT;
      sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[58] = (         int  )0;
      sqlstm.sqindv[58] = (         short *)0;
      sqlstm.sqinds[58] = (         int  )0;
      sqlstm.sqharm[58] = (unsigned long )0;
      sqlstm.sqadto[58] = (unsigned short )0;
      sqlstm.sqtdso[58] = (unsigned short )0;
      sqlstm.sqhstv[59] = (unsigned char  *)&POLILIMIT;
      sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[59] = (         int  )0;
      sqlstm.sqindv[59] = (         short *)0;
      sqlstm.sqinds[59] = (         int  )0;
      sqlstm.sqharm[59] = (unsigned long )0;
      sqlstm.sqadto[59] = (unsigned short )0;
      sqlstm.sqtdso[59] = (unsigned short )0;
      sqlstm.sqhstv[60] = (unsigned char  *)&OBSDEDADD;
      sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[60] = (         int  )0;
      sqlstm.sqindv[60] = (         short *)0;
      sqlstm.sqinds[60] = (         int  )0;
      sqlstm.sqharm[60] = (unsigned long )0;
      sqlstm.sqadto[60] = (unsigned short )0;
      sqlstm.sqtdso[60] = (unsigned short )0;
      sqlstm.sqhstv[61] = (unsigned char  *)&COSTOCKLIMIT;
      sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[61] = (         int  )0;
      sqlstm.sqindv[61] = (         short *)0;
      sqlstm.sqinds[61] = (         int  )0;
      sqlstm.sqharm[61] = (unsigned long )0;
      sqlstm.sqadto[61] = (unsigned short )0;
      sqlstm.sqtdso[61] = (unsigned short )0;
      sqlstm.sqhstv[62] = (unsigned char  *)&APPBABYDED;
      sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[62] = (         int  )0;
      sqlstm.sqindv[62] = (         short *)0;
      sqlstm.sqinds[62] = (         int  )0;
      sqlstm.sqharm[62] = (unsigned long )0;
      sqlstm.sqadto[62] = (unsigned short )0;
      sqlstm.sqtdso[62] = (unsigned short )0;
      sqlstm.sqhstv[63] = (unsigned char  *)&FUNDRATE1;
      sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[63] = (         int  )0;
      sqlstm.sqindv[63] = (         short *)0;
      sqlstm.sqinds[63] = (         int  )0;
      sqlstm.sqharm[63] = (unsigned long )0;
      sqlstm.sqadto[63] = (unsigned short )0;
      sqlstm.sqtdso[63] = (unsigned short )0;
      sqlstm.sqhstv[64] = (unsigned char  *)&FUNDRATE2;
      sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[64] = (         int  )0;
      sqlstm.sqindv[64] = (         short *)0;
      sqlstm.sqinds[64] = (         int  )0;
      sqlstm.sqharm[64] = (unsigned long )0;
      sqlstm.sqadto[64] = (unsigned short )0;
      sqlstm.sqtdso[64] = (unsigned short )0;
      sqlstm.sqhstv[65] = (unsigned char  *)&FUNDRATE3;
      sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[65] = (         int  )0;
      sqlstm.sqindv[65] = (         short *)0;
      sqlstm.sqinds[65] = (         int  )0;
      sqlstm.sqharm[65] = (unsigned long )0;
      sqlstm.sqadto[65] = (unsigned short )0;
      sqlstm.sqtdso[65] = (unsigned short )0;
      sqlstm.sqhstv[66] = (unsigned char  *)&LONGMTRATE;
      sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[66] = (         int  )0;
      sqlstm.sqindv[66] = (         short *)0;
      sqlstm.sqinds[66] = (         int  )0;
      sqlstm.sqharm[66] = (unsigned long )0;
      sqlstm.sqadto[66] = (unsigned short )0;
      sqlstm.sqtdso[66] = (unsigned short )0;
      sqlstm.sqhstv[67] = (unsigned char  *)&HSDEDLIMIT4;
      sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[67] = (         int  )0;
      sqlstm.sqindv[67] = (         short *)0;
      sqlstm.sqinds[67] = (         int  )0;
      sqlstm.sqharm[67] = (unsigned long )0;
      sqlstm.sqadto[67] = (unsigned short )0;
      sqlstm.sqtdso[67] = (unsigned short )0;
      sqlstm.sqhstv[68] = (unsigned char  *)&INDEDBRATE;
      sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[68] = (         int  )0;
      sqlstm.sqindv[68] = (         short *)0;
      sqlstm.sqinds[68] = (         int  )0;
      sqlstm.sqharm[68] = (unsigned long )0;
      sqlstm.sqadto[68] = (unsigned short )0;
      sqlstm.sqtdso[68] = (unsigned short )0;
      sqlstm.sqhstv[69] = (unsigned char  *)&GIVDEDRATE3;
      sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[69] = (         int  )0;
      sqlstm.sqindv[69] = (         short *)0;
      sqlstm.sqinds[69] = (         int  )0;
      sqlstm.sqharm[69] = (unsigned long )0;
      sqlstm.sqadto[69] = (unsigned short )0;
      sqlstm.sqtdso[69] = (unsigned short )0;
      sqlstm.sqhstv[70] = (unsigned char  *)&TMARKETDEDRATE;
      sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[70] = (         int  )0;
      sqlstm.sqindv[70] = (         short *)0;
      sqlstm.sqinds[70] = (         int  )0;
      sqlstm.sqharm[70] = (unsigned long )0;
      sqlstm.sqadto[70] = (unsigned short )0;
      sqlstm.sqtdso[70] = (unsigned short )0;
      sqlstm.sqhstv[71] = (unsigned char  *)&TMARKETEXLIMIT;
      sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[71] = (         int  )0;
      sqlstm.sqindv[71] = (         short *)0;
      sqlstm.sqinds[71] = (         int  )0;
      sqlstm.sqharm[71] = (unsigned long )0;
      sqlstm.sqadto[71] = (unsigned short )0;
      sqlstm.sqtdso[71] = (unsigned short )0;
      sqlstm.sqhstv[72] = (unsigned char  *)&INVESTRATE2;
      sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[72] = (         int  )0;
      sqlstm.sqindv[72] = (         short *)0;
      sqlstm.sqinds[72] = (         int  )0;
      sqlstm.sqharm[72] = (unsigned long )0;
      sqlstm.sqadto[72] = (unsigned short )0;
      sqlstm.sqtdso[72] = (unsigned short )0;
      sqlstm.sqhstv[73] = (unsigned char  *)&INVESTDEDRATE2;
      sqlstm.sqhstl[73] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[73] = (         int  )0;
      sqlstm.sqindv[73] = (         short *)0;
      sqlstm.sqinds[73] = (         int  )0;
      sqlstm.sqharm[73] = (unsigned long )0;
      sqlstm.sqadto[73] = (unsigned short )0;
      sqlstm.sqtdso[73] = (unsigned short )0;
      sqlstm.sqhstv[74] = (unsigned char  *)&HSDEDLIMIT5;
      sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[74] = (         int  )0;
      sqlstm.sqindv[74] = (         short *)0;
      sqlstm.sqinds[74] = (         int  )0;
      sqlstm.sqharm[74] = (unsigned long )0;
      sqlstm.sqadto[74] = (unsigned short )0;
      sqlstm.sqtdso[74] = (unsigned short )0;
      sqlstm.sqhstv[75] = (unsigned char  *)&HSDEDLIMIT6;
      sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[75] = (         int  )0;
      sqlstm.sqindv[75] = (         short *)0;
      sqlstm.sqinds[75] = (         int  )0;
      sqlstm.sqharm[75] = (unsigned long )0;
      sqlstm.sqadto[75] = (unsigned short )0;
      sqlstm.sqtdso[75] = (unsigned short )0;
      sqlstm.sqhstv[76] = (unsigned char  *)&SPARENTDEDADD;
      sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[76] = (         int  )0;
      sqlstm.sqindv[76] = (         short *)0;
      sqlstm.sqinds[76] = (         int  )0;
      sqlstm.sqharm[76] = (unsigned long )0;
      sqlstm.sqadto[76] = (unsigned short )0;
      sqlstm.sqtdso[76] = (unsigned short )0;
      sqlstm.sqhstv[77] = (unsigned char  *)&HSRATE2;
      sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[77] = (         int  )0;
      sqlstm.sqindv[77] = (         short *)0;
      sqlstm.sqinds[77] = (         int  )0;
      sqlstm.sqharm[77] = (unsigned long )0;
      sqlstm.sqadto[77] = (unsigned short )0;
      sqlstm.sqtdso[77] = (unsigned short )0;
      sqlstm.sqhstv[78] = (unsigned char  *)&TRAFFICDEDRATE;
      sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[78] = (         int  )0;
      sqlstm.sqindv[78] = (         short *)0;
      sqlstm.sqinds[78] = (         int  )0;
      sqlstm.sqharm[78] = (unsigned long )0;
      sqlstm.sqadto[78] = (unsigned short )0;
      sqlstm.sqtdso[78] = (unsigned short )0;
      sqlstm.sqhstv[79] = (unsigned char  *)&TRAFFICEXLIMIT;
      sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[79] = (         int  )0;
      sqlstm.sqindv[79] = (         short *)0;
      sqlstm.sqinds[79] = (         int  )0;
      sqlstm.sqharm[79] = (unsigned long )0;
      sqlstm.sqadto[79] = (unsigned short )0;
      sqlstm.sqtdso[79] = (unsigned short )0;
      sqlstm.sqhstv[80] = (unsigned char  *)&SPDEDLIMIT;
      sqlstm.sqhstl[80] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[80] = (         int  )0;
      sqlstm.sqindv[80] = (         short *)0;
      sqlstm.sqinds[80] = (         int  )0;
      sqlstm.sqharm[80] = (unsigned long )0;
      sqlstm.sqadto[80] = (unsigned short )0;
      sqlstm.sqtdso[80] = (unsigned short )0;
      sqlstm.sqhstv[81] = (unsigned char  *)&INVESTRATE3;
      sqlstm.sqhstl[81] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[81] = (         int  )0;
      sqlstm.sqindv[81] = (         short *)0;
      sqlstm.sqinds[81] = (         int  )0;
      sqlstm.sqharm[81] = (unsigned long )0;
      sqlstm.sqadto[81] = (unsigned short )0;
      sqlstm.sqtdso[81] = (unsigned short )0;
      sqlstm.sqhstv[82] = (unsigned char  *)&HSRENTINTRATE;
      sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[82] = (         int  )0;
      sqlstm.sqindv[82] = (         short *)0;
      sqlstm.sqinds[82] = (         int  )0;
      sqlstm.sqharm[82] = (unsigned long )0;
      sqlstm.sqadto[82] = (unsigned short )0;
      sqlstm.sqtdso[82] = (unsigned short )0;
      sqlstm.sqhstv[83] = (unsigned char  *)&HSRENTINTLIMIT;
      sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[83] = (         int  )0;
      sqlstm.sqindv[83] = (         short *)0;
      sqlstm.sqinds[83] = (         int  )0;
      sqlstm.sqharm[83] = (unsigned long )0;
      sqlstm.sqadto[83] = (unsigned short )0;
      sqlstm.sqtdso[83] = (unsigned short )0;
      sqlstm.sqhstv[84] = (unsigned char  *)&NOTICERATE;
      sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[84] = (         int  )0;
      sqlstm.sqindv[84] = (         short *)0;
      sqlstm.sqinds[84] = (         int  )0;
      sqlstm.sqharm[84] = (unsigned long )0;
      sqlstm.sqadto[84] = (unsigned short )0;
      sqlstm.sqtdso[84] = (unsigned short )0;
      sqlstm.sqhstv[85] = (unsigned char  *)&TAXDEDSECT1;
      sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[85] = (         int  )0;
      sqlstm.sqindv[85] = (         short *)0;
      sqlstm.sqinds[85] = (         int  )0;
      sqlstm.sqharm[85] = (unsigned long )0;
      sqlstm.sqadto[85] = (unsigned short )0;
      sqlstm.sqtdso[85] = (unsigned short )0;
      sqlstm.sqhstv[86] = (unsigned char  *)&TAXDEDSLIMIT1;
      sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[86] = (         int  )0;
      sqlstm.sqindv[86] = (         short *)0;
      sqlstm.sqinds[86] = (         int  )0;
      sqlstm.sqharm[86] = (unsigned long )0;
      sqlstm.sqadto[86] = (unsigned short )0;
      sqlstm.sqtdso[86] = (unsigned short )0;
      sqlstm.sqhstv[87] = (unsigned char  *)&TAXDEDSECT2;
      sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[87] = (         int  )0;
      sqlstm.sqindv[87] = (         short *)0;
      sqlstm.sqinds[87] = (         int  )0;
      sqlstm.sqharm[87] = (unsigned long )0;
      sqlstm.sqadto[87] = (unsigned short )0;
      sqlstm.sqtdso[87] = (unsigned short )0;
      sqlstm.sqhstv[88] = (unsigned char  *)&TAXDEDSLIMIT2;
      sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[88] = (         int  )0;
      sqlstm.sqindv[88] = (         short *)0;
      sqlstm.sqinds[88] = (         int  )0;
      sqlstm.sqharm[88] = (unsigned long )0;
      sqlstm.sqadto[88] = (unsigned short )0;
      sqlstm.sqtdso[88] = (unsigned short )0;
      sqlstm.sqhstv[89] = (unsigned char  *)&APPDEDLIMIT;
      sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[89] = (         int  )0;
      sqlstm.sqindv[89] = (         short *)0;
      sqlstm.sqinds[89] = (         int  )0;
      sqlstm.sqharm[89] = (unsigned long )0;
      sqlstm.sqadto[89] = (unsigned short )0;
      sqlstm.sqtdso[89] = (unsigned short )0;
      sqlstm.sqhstv[90] = (unsigned char  *)&NPENRATE;
      sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[90] = (         int  )0;
      sqlstm.sqindv[90] = (         short *)0;
      sqlstm.sqinds[90] = (         int  )0;
      sqlstm.sqharm[90] = (unsigned long )0;
      sqlstm.sqadto[90] = (unsigned short )0;
      sqlstm.sqtdso[90] = (unsigned short )0;
      sqlstm.sqhstv[91] = (unsigned char  *)&SPECIALRATE1;
      sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[91] = (         int  )0;
      sqlstm.sqindv[91] = (         short *)0;
      sqlstm.sqinds[91] = (         int  )0;
      sqlstm.sqharm[91] = (unsigned long )0;
      sqlstm.sqadto[91] = (unsigned short )0;
      sqlstm.sqtdso[91] = (unsigned short )0;
      sqlstm.sqhstv[92] = (unsigned char  *)&SPECIALRATE2;
      sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[92] = (         int  )0;
      sqlstm.sqindv[92] = (         short *)0;
      sqlstm.sqinds[92] = (         int  )0;
      sqlstm.sqharm[92] = (unsigned long )0;
      sqlstm.sqadto[92] = (unsigned short )0;
      sqlstm.sqtdso[92] = (unsigned short )0;
      sqlstm.sqhstv[93] = (unsigned char  *)&GIVESLIMIT;
      sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[93] = (         int  )0;
      sqlstm.sqindv[93] = (         short *)0;
      sqlstm.sqinds[93] = (         int  )0;
      sqlstm.sqharm[93] = (unsigned long )0;
      sqlstm.sqadto[93] = (unsigned short )0;
      sqlstm.sqtdso[93] = (unsigned short )0;
      sqlstm.sqhstv[94] = (unsigned char  *)&GIVESRATE;
      sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[94] = (         int  )0;
      sqlstm.sqindv[94] = (         short *)0;
      sqlstm.sqinds[94] = (         int  )0;
      sqlstm.sqharm[94] = (unsigned long )0;
      sqlstm.sqadto[94] = (unsigned short )0;
      sqlstm.sqtdso[94] = (unsigned short )0;
      sqlstm.sqhstv[95] = (unsigned char  *)&HOUSERENTLIMIT1;
      sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[95] = (         int  )0;
      sqlstm.sqindv[95] = (         short *)0;
      sqlstm.sqinds[95] = (         int  )0;
      sqlstm.sqharm[95] = (unsigned long )0;
      sqlstm.sqadto[95] = (unsigned short )0;
      sqlstm.sqtdso[95] = (unsigned short )0;
      sqlstm.sqhstv[96] = (unsigned char  *)&HOUSERENTLIMIT2;
      sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[96] = (         int  )0;
      sqlstm.sqindv[96] = (         short *)0;
      sqlstm.sqinds[96] = (         int  )0;
      sqlstm.sqharm[96] = (unsigned long )0;
      sqlstm.sqadto[96] = (unsigned short )0;
      sqlstm.sqtdso[96] = (unsigned short )0;
      sqlstm.sqhstv[97] = (unsigned char  *)&HOUSERENTRATE;
      sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[97] = (         int  )0;
      sqlstm.sqindv[97] = (         short *)0;
      sqlstm.sqinds[97] = (         int  )0;
      sqlstm.sqharm[97] = (unsigned long )0;
      sqlstm.sqadto[97] = (unsigned short )0;
      sqlstm.sqtdso[97] = (unsigned short )0;
      sqlstm.sqhstv[98] = (unsigned char  *)&INVESTRATE4;
      sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[98] = (         int  )0;
      sqlstm.sqindv[98] = (         short *)0;
      sqlstm.sqinds[98] = (         int  )0;
      sqlstm.sqharm[98] = (unsigned long )0;
      sqlstm.sqadto[98] = (unsigned short )0;
      sqlstm.sqtdso[98] = (unsigned short )0;
      sqlstm.sqhstv[99] = (unsigned char  *)&INVESTRATE5;
      sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[99] = (         int  )0;
      sqlstm.sqindv[99] = (         short *)0;
      sqlstm.sqinds[99] = (         int  )0;
      sqlstm.sqharm[99] = (unsigned long )0;
      sqlstm.sqadto[99] = (unsigned short )0;
      sqlstm.sqtdso[99] = (unsigned short )0;
      sqlstm.sqhstv[100] = (unsigned char  *)&INVESTRATE6;
      sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[100] = (         int  )0;
      sqlstm.sqindv[100] = (         short *)0;
      sqlstm.sqinds[100] = (         int  )0;
      sqlstm.sqharm[100] = (unsigned long )0;
      sqlstm.sqadto[100] = (unsigned short )0;
      sqlstm.sqtdso[100] = (unsigned short )0;
      sqlstm.sqhstv[101] = (unsigned char  *)&INVESTDEDRATE3;
      sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[101] = (         int  )0;
      sqlstm.sqindv[101] = (         short *)0;
      sqlstm.sqinds[101] = (         int  )0;
      sqlstm.sqharm[101] = (unsigned long )0;
      sqlstm.sqadto[101] = (unsigned short )0;
      sqlstm.sqtdso[101] = (unsigned short )0;
      sqlstm.sqhstv[102] = (unsigned char  *)&LONGFUNDLIMIT1;
      sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[102] = (         int  )0;
      sqlstm.sqindv[102] = (         short *)0;
      sqlstm.sqinds[102] = (         int  )0;
      sqlstm.sqharm[102] = (unsigned long )0;
      sqlstm.sqadto[102] = (unsigned short )0;
      sqlstm.sqtdso[102] = (unsigned short )0;
      sqlstm.sqhstv[103] = (unsigned char  *)&LONGFUNDLIMIT2;
      sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[103] = (         int  )0;
      sqlstm.sqindv[103] = (         short *)0;
      sqlstm.sqinds[103] = (         int  )0;
      sqlstm.sqharm[103] = (unsigned long )0;
      sqlstm.sqadto[103] = (unsigned short )0;
      sqlstm.sqtdso[103] = (unsigned short )0;
      sqlstm.sqhstv[104] = (unsigned char  *)&LONGFUNDRATE;
      sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[104] = (         int  )0;
      sqlstm.sqindv[104] = (         short *)0;
      sqlstm.sqinds[104] = (         int  )0;
      sqlstm.sqharm[104] = (unsigned long )0;
      sqlstm.sqadto[104] = (unsigned short )0;
      sqlstm.sqtdso[104] = (unsigned short )0;
      sqlstm.sqhstv[105] = (unsigned char  *)&CARDUPRATE1;
      sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[105] = (         int  )0;
      sqlstm.sqindv[105] = (         short *)0;
      sqlstm.sqinds[105] = (         int  )0;
      sqlstm.sqharm[105] = (unsigned long )0;
      sqlstm.sqadto[105] = (unsigned short )0;
      sqlstm.sqtdso[105] = (unsigned short )0;
      sqlstm.sqhstv[106] = (unsigned char  *)&CARDUPRATE2;
      sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[106] = (         int  )0;
      sqlstm.sqindv[106] = (         short *)0;
      sqlstm.sqinds[106] = (         int  )0;
      sqlstm.sqharm[106] = (unsigned long )0;
      sqlstm.sqadto[106] = (unsigned short )0;
      sqlstm.sqtdso[106] = (unsigned short )0;
      sqlstm.sqhstv[107] = (unsigned char  *)&YLOANBASLIMIT;
      sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[107] = (         int  )0;
      sqlstm.sqindv[107] = (         short *)0;
      sqlstm.sqinds[107] = (         int  )0;
      sqlstm.sqharm[107] = (unsigned long )0;
      sqlstm.sqadto[107] = (unsigned short )0;
      sqlstm.sqtdso[107] = (unsigned short )0;
      sqlstm.sqhstv[108] = (unsigned char  *)&INFANTDED;
      sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[108] = (         int  )0;
      sqlstm.sqindv[108] = (         short *)0;
      sqlstm.sqinds[108] = (         int  )0;
      sqlstm.sqharm[108] = (unsigned long )0;
      sqlstm.sqadto[108] = (unsigned short )0;
      sqlstm.sqtdso[108] = (unsigned short )0;
      sqlstm.sqhstv[109] = (unsigned char  *)&ADDBABYDED;
      sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[109] = (         int  )0;
      sqlstm.sqindv[109] = (         short *)0;
      sqlstm.sqinds[109] = (         int  )0;
      sqlstm.sqharm[109] = (unsigned long )0;
      sqlstm.sqadto[109] = (unsigned short )0;
      sqlstm.sqtdso[109] = (unsigned short )0;
      sqlstm.sqhstv[110] = (unsigned char  *)&NPENRATE2;
      sqlstm.sqhstl[110] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[110] = (         int  )0;
      sqlstm.sqindv[110] = (         short *)0;
      sqlstm.sqinds[110] = (         int  )0;
      sqlstm.sqharm[110] = (unsigned long )0;
      sqlstm.sqadto[110] = (unsigned short )0;
      sqlstm.sqtdso[110] = (unsigned short )0;
      sqlstm.sqhstv[111] = (unsigned char  *)&NPENLIMIT;
      sqlstm.sqhstl[111] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[111] = (         int  )0;
      sqlstm.sqindv[111] = (         short *)0;
      sqlstm.sqinds[111] = (         int  )0;
      sqlstm.sqharm[111] = (unsigned long )0;
      sqlstm.sqadto[111] = (unsigned short )0;
      sqlstm.sqtdso[111] = (unsigned short )0;
      sqlstm.sqhstv[112] = (unsigned char  *)&HOUSVLIMIT1;
      sqlstm.sqhstl[112] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[112] = (         int  )0;
      sqlstm.sqindv[112] = (         short *)0;
      sqlstm.sqinds[112] = (         int  )0;
      sqlstm.sqharm[112] = (unsigned long )0;
      sqlstm.sqadto[112] = (unsigned short )0;
      sqlstm.sqtdso[112] = (unsigned short )0;
      sqlstm.sqhstv[113] = (unsigned char  *)&HOUSVLIMIT2;
      sqlstm.sqhstl[113] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[113] = (         int  )0;
      sqlstm.sqindv[113] = (         short *)0;
      sqlstm.sqinds[113] = (         int  )0;
      sqlstm.sqharm[113] = (unsigned long )0;
      sqlstm.sqadto[113] = (unsigned short )0;
      sqlstm.sqtdso[113] = (unsigned short )0;
      sqlstm.sqhstv[114] = (unsigned char  *)&HOUSVLIMIT3;
      sqlstm.sqhstl[114] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[114] = (         int  )0;
      sqlstm.sqindv[114] = (         short *)0;
      sqlstm.sqinds[114] = (         int  )0;
      sqlstm.sqharm[114] = (unsigned long )0;
      sqlstm.sqadto[114] = (unsigned short )0;
      sqlstm.sqtdso[114] = (unsigned short )0;
      sqlstm.sqhstv[115] = (unsigned char  *)&HOUSVLIMIT4;
      sqlstm.sqhstl[115] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[115] = (         int  )0;
      sqlstm.sqindv[115] = (         short *)0;
      sqlstm.sqinds[115] = (         int  )0;
      sqlstm.sqharm[115] = (unsigned long )0;
      sqlstm.sqadto[115] = (unsigned short )0;
      sqlstm.sqtdso[115] = (unsigned short )0;
      sqlstm.sqhstv[116] = (unsigned char  *)&HSDEDLIMIT7;
      sqlstm.sqhstl[116] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[116] = (         int  )0;
      sqlstm.sqindv[116] = (         short *)0;
      sqlstm.sqinds[116] = (         int  )0;
      sqlstm.sqharm[116] = (unsigned long )0;
      sqlstm.sqadto[116] = (unsigned short )0;
      sqlstm.sqtdso[116] = (unsigned short )0;
      sqlstm.sqhstv[117] = (unsigned char  *)&HSDEDLIMIT8;
      sqlstm.sqhstl[117] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[117] = (         int  )0;
      sqlstm.sqindv[117] = (         short *)0;
      sqlstm.sqinds[117] = (         int  )0;
      sqlstm.sqharm[117] = (unsigned long )0;
      sqlstm.sqadto[117] = (unsigned short )0;
      sqlstm.sqtdso[117] = (unsigned short )0;
      sqlstm.sqhstv[118] = (unsigned char  *)&HSDEDLIMIT9;
      sqlstm.sqhstl[118] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[118] = (         int  )0;
      sqlstm.sqindv[118] = (         short *)0;
      sqlstm.sqinds[118] = (         int  )0;
      sqlstm.sqharm[118] = (unsigned long )0;
      sqlstm.sqadto[118] = (unsigned short )0;
      sqlstm.sqtdso[118] = (unsigned short )0;
      sqlstm.sqhstv[119] = (unsigned char  *)&HSDEDLIMIT10;
      sqlstm.sqhstl[119] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[119] = (         int  )0;
      sqlstm.sqindv[119] = (         short *)0;
      sqlstm.sqinds[119] = (         int  )0;
      sqlstm.sqharm[119] = (unsigned long )0;
      sqlstm.sqadto[119] = (unsigned short )0;
      sqlstm.sqtdso[119] = (unsigned short )0;
      sqlstm.sqhstv[120] = (unsigned char  *)&INVESTRATE7;
      sqlstm.sqhstl[120] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[120] = (         int  )0;
      sqlstm.sqindv[120] = (         short *)0;
      sqlstm.sqinds[120] = (         int  )0;
      sqlstm.sqharm[120] = (unsigned long )0;
      sqlstm.sqadto[120] = (unsigned short )0;
      sqlstm.sqtdso[120] = (unsigned short )0;
      sqlstm.sqhstv[121] = (unsigned char  *)&INVESTRATE8;
      sqlstm.sqhstl[121] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[121] = (         int  )0;
      sqlstm.sqindv[121] = (         short *)0;
      sqlstm.sqinds[121] = (         int  )0;
      sqlstm.sqharm[121] = (unsigned long )0;
      sqlstm.sqadto[121] = (unsigned short )0;
      sqlstm.sqtdso[121] = (unsigned short )0;
      sqlstm.sqhstv[122] = (unsigned char  *)&INVESTRATE9;
      sqlstm.sqhstl[122] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[122] = (         int  )0;
      sqlstm.sqindv[122] = (         short *)0;
      sqlstm.sqinds[122] = (         int  )0;
      sqlstm.sqharm[122] = (unsigned long )0;
      sqlstm.sqadto[122] = (unsigned short )0;
      sqlstm.sqtdso[122] = (unsigned short )0;
      sqlstm.sqhstv[123] = (unsigned char  *)&INVESTRATE10;
      sqlstm.sqhstl[123] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[123] = (         int  )0;
      sqlstm.sqindv[123] = (         short *)0;
      sqlstm.sqinds[123] = (         int  )0;
      sqlstm.sqharm[123] = (unsigned long )0;
      sqlstm.sqadto[123] = (unsigned short )0;
      sqlstm.sqtdso[123] = (unsigned short )0;
      sqlstm.sqhstv[124] = (unsigned char  *)&CARDUPRATE3;
      sqlstm.sqhstl[124] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[124] = (         int  )0;
      sqlstm.sqindv[124] = (         short *)0;
      sqlstm.sqinds[124] = (         int  )0;
      sqlstm.sqharm[124] = (unsigned long )0;
      sqlstm.sqadto[124] = (unsigned short )0;
      sqlstm.sqtdso[124] = (unsigned short )0;
      sqlstm.sqhstv[125] = (unsigned char  *)&RPENDEDLIMIT;
      sqlstm.sqhstl[125] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[125] = (         int  )0;
      sqlstm.sqindv[125] = (         short *)0;
      sqlstm.sqinds[125] = (         int  )0;
      sqlstm.sqharm[125] = (unsigned long )0;
      sqlstm.sqadto[125] = (unsigned short )0;
      sqlstm.sqtdso[125] = (unsigned short )0;
      sqlstm.sqhstv[126] = (unsigned char  *)workyy;
      sqlstm.sqhstl[126] = (unsigned long )5;
      sqlstm.sqhsts[126] = (         int  )0;
      sqlstm.sqindv[126] = (         short *)0;
      sqlstm.sqinds[126] = (         int  )0;
      sqlstm.sqharm[126] = (unsigned long )0;
      sqlstm.sqadto[126] = (unsigned short )0;
      sqlstm.sqtdso[126] = (unsigned short )0;
      sqlstm.sqphsv = sqlstm.sqhstv;
      sqlstm.sqphsl = sqlstm.sqhstl;
      sqlstm.sqphss = sqlstm.sqhsts;
      sqlstm.sqpind = sqlstm.sqindv;
      sqlstm.sqpins = sqlstm.sqinds;
      sqlstm.sqparm = sqlstm.sqharm;
      sqlstm.sqparc = sqlstm.sqharc;
      sqlstm.sqpadto = sqlstm.sqadto;
      sqlstm.sqptdso = sqlstm.sqtdso;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 //(Select WORKYY From PKCPBAS) ;
      	
      printf(workyy,"귀속년도 %.4s\n");

      if ( sqlca.sqlcode != 0)
      {       
          Write_batlog(seqno++, "연말정산기준 read Error");  
          err_print(sqlca.sqlcode,"연말정산기준 read ERROR");
          exit(1);
      }       
}


Calc_Yearend()
{
     double  t1, t2, t3, t4, t5 ;
     double  totlimitded       = 0;     /* 소득공제 종합한도 적용대상 항목 계 2013.11 */
     double  specialdedtax     = 0;     /* 특별공제 세액공제계 2014.01 */
     double  calctaxlevel      = 0;     /* 투자조합공제에 따른 농특세 계산    2014.02 */  
     double  calctaxlimit      = 0;     /* 산출세액 차감 계산용                2015.01 */
     t1 = t2 = t3 = t4 = t5 = 0;
     
     ReadPkcysbas();      /*  PKCYSBAS 연말정산기준 테이블 읽어오기 */ 
     
     ReadTax();           /*  연세율표를 읽어 배열에 저장한다 */
     
     /* EXEC  SQL
     Select max(retdate) 
       INTO :tempdate
       From PKZRYMAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(retdate) into :b0  from PKZRYMAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )593;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tempdate;
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

    /* 퇴직정산마스터의 퇴직일... */
     
     if ( sqlca.sqlcode == 1403 )
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
     
     //jissi 2012.02.06 workyy를 변수로 프로그램에서 받아 씀
     //sprintf(workyy,"%.4s",tempdate);
     //printf(workyy,"귀속년도 %.4s\n");
     
     /* 귀속일 : dsa2000. 2018.02.08. 퇴직마스터 입사일 기준으로 귀속시작일 Update. 김우정 요청. (1일 근무 임원위해)
     EXEC SQL
     UPDATE PKZRYMAS a
        SET YSFRDATE = (Select GREATEST(NVL(ORGEMPDATE,:workyy||'0101'),:workyy||'0101')
                          From PKZMPMAS b
                         Where a.empno = b.empno) ; */
     /* EXEC SQL
     UPDATE PKZRYMAS a
        SET YSFRDATE = (Select GREATEST(NVL(EMPDATE,:workyy||'0101'),:workyy||'0101')
                          From PKZRTMAS b
                         Where a.empno = b.empno) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set YSFRDATE=(select GREATEST(NVL(EM\
PDATE,(:b0||'0101')),(:b0||'0101'))  from PKZRTMAS b where a.empno=b.empno)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )612;
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


           
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "귀속일1 setting Error");  
         err_print(sqlca.sqlcode,"귀속일1 setting Error");
         exit(1);
     }
                           
                         
     /* EXEC SQL
     UPDATE PKZRYMAS a
        SET YSTODATE = RETDATE; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set YSTODATE=RETDATE";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )635;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
     if ( sqlca.sqlcode != 0)
     {  
          Write_batlog(seqno++, "귀속일2 setting Error");  
          err_print(sqlca.sqlcode,"귀속일2 setting Error");
          exit(1);
     }    
     /* ============================================================================== */
     
     
     
     /* ============================================================================== */
     /*급여총액 - 상여총액  : 급여이력 데이터 업데이트 */
     /* EXEC   SQL
     UPDATE PKZRYMAS P
        set (MPAYSUM, MBONSUM)
         =  (Select sum(nvl(R.fixpay,0)   +                                              
                        nvl(R.aidamt3,0)  + nvl(R.bokjisupamt,0)+ nvl(R.trainsupamt,0) + 
                        nvl(R.medsupamt,0)+ nvl(R.mcartaxamt,0) + nvl(R.selfedutax,0)  + 
                        nvl(R.taxpay1,0)  + nvl(R.taxpay2,0)    + nvl(R.taxpay3,0)     + 
                        nvl(R.taxpay4,0)  + nvl(R.taxpay5,0)    + nvl(R.taxpay6,0)     + 
                        nvl(R.taxpay7,0)  + nvl(R.taxpay8,0)                  ) mpaysum,
                    sum(nvl(R.sbonamt,0))
               From PKZHPHIS R
              Where Substr(Paydate,1,4) = :workyy And p.empno = r.empno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS P  set (MPAYSUM,MBONSUM)=(select sum(((\
((((((((((((nvl(R.fixpay,0)+nvl(R.aidamt3,0))+nvl(R.bokjisupamt,0))+nvl(R.tra\
insupamt,0))+nvl(R.medsupamt,0))+nvl(R.mcartaxamt,0))+nvl(R.selfedutax,0))+nv\
l(R.taxpay1,0))+nvl(R.taxpay2,0))+nvl(R.taxpay3,0))+nvl(R.taxpay4,0))+nvl(R.t\
axpay5,0))+nvl(R.taxpay6,0))+nvl(R.taxpay7,0))+nvl(R.taxpay8,0))) mpaysum ,su\
m(nvl(R.sbonamt,0))  from PKZHPHIS R where (Substr(Paydate,1,4)=:b0 and p.emp\
no=r.empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )650;
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


     
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "3.2 주급여 setting Error");  
         err_print(sqlca.sqlcode,"3.2 주급여 setting Error");
         exit(1);
     }
     
     /*비과세 급여 : 급여이력 데이터 업데이트 */
     /* EXEC SQL 
     UPDATE PKZRYMAS p
        SET MNOTAX = (Select Sum(NVL(r.selfeduamt,0) - NVL(r.selfedutax,0) ) /oNVL(r.mcaramt,0)-NVL(r.mcartaxamt,0) ) 2009년 귀속부터 삭제.o/ 
                        From PKZHPHIS r
                       Where Substr(Paydate,1,4) = :workyy And p.empno = r.empno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set MNOTAX=(select sum((NVL(r.selfed\
uamt,0)-NVL(r.selfedutax,0)))  from PKZHPHIS r where (Substr(Paydate,1,4)=:b0\
 and p.empno=r.empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )669;
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


              
     if ( sqlca.sqlcode != 0)
     {  
          Write_batlog(seqno++, "3.4 주급여 setting Error");  
          err_print(sqlca.sqlcode,"3.4 주급여 setting Error");
          exit(1);
     }
     
     
     
     /*급여총액, 상여총액  : 퇴직월급여  업데이트 */
     /* EXEC  SQL
     UPDATE PKZRYMAS A
        set (MPAYSUM, MBONSUM)
         =  (Select (NVL(a.MPAYSUM,0) + NVL(FIXPAY,0)     + 
                                        NVL(MCARTAXAMT,0) +
                                        NVL(BOKJISUPAMT,0)+
                                        NVL(AIDAMT3,0)    +
                                        NVL(TAXPAY,0)   ),
                    (NVL(a.MBONSUM,0) + NVL(b.SBONAMT,0) )
              From  PKZRTMAS B
             Where  A.EMPNO = B.EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS A  set (MPAYSUM,MBONSUM)=(select (((((N\
VL(a.MPAYSUM,0)+NVL(FIXPAY,0))+NVL(MCARTAXAMT,0))+NVL(BOKJISUPAMT,0))+NVL(AID\
AMT3,0))+NVL(TAXPAY,0)) ,(NVL(a.MBONSUM,0)+NVL(b.SBONAMT,0))  from PKZRTMAS B\
 where A.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )688;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ( sqlca.sqlcode != 0)
     {  
        Write_batlog(seqno++, "3.7 주급여1 setting Error");  
        err_print(sqlca.sqlcode,"3.7 주급여1 setting Error");
        exit(1);
     }
      
     /*비과세 총액 : 퇴직월 데이터 업데이트 2009년부터 삭제.
     EXEC SQL
     UPDATE PKZRYMAS A
        SET MNOTAX = (Select NVL(A.MNOTAX ,0) +  NVL(B.MCARAMT,0) - NVL(B.MCARTAXAMT,0) + 
                             NVL(B.NOTAXPAY,0)    기타비과세급여 추가 
                        From PKZRTMAS B        
                       Where A.EMPNO = B.EMPNO) ;    
     
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "3.6 주급여 setting Error");  
         err_print(sqlca.sqlcode,"3.6 주급여 setting Error");
         exit(1);
     } */
     
     /*dsa2000  2007.01. 우리사주 인출시 과세액 반영 추가...*/
     /*우리사주인출이력(PSDOHIS)의 WDSTAMT1 칼럼에 우리사주 시스템에서 과세금액 계산되어짐 (계산 시점 체크해야함)*/
     /* EXEC SQL 
     update PKZRYMAS M  
        Set COSTOCKTAX = (Select sum(nvl(WDSTAMT1,0)) From PSDOHIS
                           Where Substr(reqdate,1,4) = :workyy 
                             And M.empno = empno             
                           Group by empno )
      Where Empno in (Select empno From PSDOHIS 
                       Where Substr(reqdate,1,4) = :workyy  
                         And nvl(WDSTAMT1,0) <> 0   ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS M  set COSTOCKTAX=(select sum(nvl(WDSTA\
MT1,0))  from PSDOHIS where (Substr(reqdate,1,4)=:b0 and M.empno=empno) group\
 by empno) where Empno in (select empno  from PSDOHIS where (Substr(reqdate,1\
,4)=:b0 and nvl(WDSTAMT1,0)<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )703;
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


                               
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          Write_batlog(seqno++, "3.8 우리사주 인출시 과세액 setting Error");  
          err_print(sqlca.sqlcode,"3.8 우리사주 인출시 과세액 setting Error");
          exit(1);
     }       
     
     /*임원퇴직소득초과금액 2016.12 jissi*/
     /* EXEC SQL
     UPDATE PKZRYMAS A
        SET MLIMITOVERSUM = (Select NVL(LIMITOVERAMT,0)   
                               From PKZRTMAS B        
                              Where A.EMPNO = B.EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS A  set MLIMITOVERSUM=(select NVL(LIMITO\
VERAMT,0)  from PKZRTMAS B where A.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )726;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

    
     
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "3.7 임원퇴직소득 한도초과 근로소득간주액 setting Error");  
         err_print(sqlca.sqlcode,"3.7 임원퇴직소득 한도초과 근로소득간주액 setting Error");
         exit(1);
     }                       
     /* ============================================================================== */
     
     
     /* ============================================================================== */
     /* EXEC SQL 
     UPDATE PKZRYMAS 
        SET familyno = nvl(fami16no,0)  + nvl(fami720no,0) + nvl(fami6064no,0) + nvl(fami65no,0)  + nvl(fami70no,0),
            taxgross = nvl(mpaysum,0)   + nvl(mbonsum,0)   + nvl(mcogbonsum,0) 
                     + nvl(bpaysum,0)   + nvl(bbonsum,0)   + nvl(bcogbonsum,0) 
                     + nvl(COSTOCKTAX,0)                                       /o우리사주인출 과세액 합산 2007.01.o/
                     + NVL(MLIMITOVERSUM,0)            ,                       /o임원퇴직소득초과금액 2016.12 jissio/
            notax    = nvl(mnotax,0)    + nvl(bnotax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS  set familyno=((((nvl(fami16no,0)+nvl(f\
ami720no,0))+nvl(fami6064no,0))+nvl(fami65no,0))+nvl(fami70no,0)),taxgross=((\
(((((nvl(mpaysum,0)+nvl(mbonsum,0))+nvl(mcogbonsum,0))+nvl(bpaysum,0))+nvl(bb\
onsum,0))+nvl(bcogbonsum,0))+nvl(COSTOCKTAX,0))+NVL(MLIMITOVERSUM,0)),notax=(\
nvl(mnotax,0)+nvl(bnotax,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )741;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, " 과세총액 setting Error");  
         err_print(sqlca.sqlcode," 과세총액 Setting Error");
         exit(1);
     }
       
     
     /* EXEC SQL 
     UPDATE  PKZRYMAS p
         SET (anuamt, medamt, hireamt, penamt1, mintax, mjutax) 
           = (Select sum(anudamt)          ,  
                     sum(meddamt+longmtamt+dedamt8),   /o장기요양보험료 추가.+건강보험 연말정산 추가o/
                     sum(empamt +dedamt7)          ,   /o고용보험+고용보험소급분o/
                     0                     ,   /o sum(saveamt3), 퇴직시에는 공제 안하므로 업데이트 제외. 2011.01.o/
                     sum(intax)            , 
                     sum(jutax)   
                From PKZHPHIS r
               Where Substr(Paydate,1,4) = :workyy And p.empno = r.empno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set (anuamt,medamt,hireamt,penamt1,m\
intax,mjutax)=(select sum(anudamt) ,sum(((meddamt+longmtamt)+dedamt8)) ,sum((\
empamt+dedamt7)) ,0 ,sum(intax) ,sum(jutax)  from PKZHPHIS r where (Substr(Pa\
ydate,1,4)=:b0 and p.empno=r.empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )756;
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


     
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "12. 사회보험 등 setting Error");  
         err_print(sqlca.sqlcode,"12. 사회보험 등 setting Error");
         exit(1);
     }
     
     /*퇴직월 의보,고보 포함 */
     /* EXEC SQL 
     UPDATE PKZRYMAS a
        SET (anuamt, medamt, hireamt)
        =   (Select nvl(a.anuamt,0)  + nvl(anudamt,0),
                    nvl(A.medamt,0)  + nvl(meddamt,0) ,
                    nvl(A.hireamt,0) + nvl(empamt,0)
               From PKZRTMAS b
              Where a.empno = b.empno) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set (anuamt,medamt,hireamt)=(select \
(nvl(a.anuamt,0)+nvl(anudamt,0)) ,(nvl(A.medamt,0)+nvl(meddamt,0)) ,(nvl(A.hi\
reamt,0)+nvl(empamt,0))  from PKZRTMAS b where a.empno=b.empno)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )775;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "12. 퇴직월 사회보험 setting Error");  
         err_print(sqlca.sqlcode,"12. 퇴직월 사회보험 setting Error");
         exit(1);
     }                   
       
     /******2001년이후입사자는 연금저축으로******/             
     /* EXEC SQL
     UPDATE PKZRYMAS a
        SET NPENAMT = 0, /o PENAMT1, 퇴직자는 미공제 처리하기 위해.o/
            PENAMT1 = 0
      Where EMPNO IN (Select EMPNO From PKZMPMAS Where empdate > '2001')
        And EMPNO NOT IN (Select NEWEMPNO From PZNEWEMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set NPENAMT=0,PENAMT1=0 where (EMPNO\
 in (select EMPNO  from PKZMPMAS where empdate>'2001') and EMPNO not  in (sel\
ect NEWEMPNO  from PZNEWEMPNO ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )790;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


           
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
        Write_batlog(seqno++, "13. 연금저축setting Error");  
        err_print(sqlca.sqlcode,"13. 연금저축 setting Error");
        exit(1);
     }                      
     
     
     /* EXEC SQL 
     UPDATE PKZRYMAS p
        SET mintax  = nvl(mintax,0),
            mjutax  = nvl(mjutax,0),
            anuamt  = nvl(anuamt,0),
            penamt1 = nvl(penamt1,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set mintax=nvl(mintax,0),mjutax=nvl(\
mjutax,0),anuamt=nvl(anuamt,0),penamt1=nvl(penamt1,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )805;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         
     if ( sqlca.sqlcode != 0)
     {  
         Write_batlog(seqno++, "14. 소득세 ,주민세등 setting Error");  
         err_print(sqlca.sqlcode,"14. 소득세 ,주민세등 setting Error");
         exit(1);
     }
     
       
     /* EXEC SQL DECLARE c1 CURSOR FOR
     SELECT  EMPNO,                 REPLACE(NVL(JUMINID,''),'-',''),
            (to_number(to_char(sysdate,'YYYY')) -     
             to_number(decode(Substr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||Substr(juminid,1,2)) ) SelfAge,       
             NVL(TAXGROSS,0),       NVL(FORITAXGROSS,0),  /o 국외근로소득 o/
             NVL(MCOGBONSUM,0),     NVL(BCOGBONSUM,0),     NVL(MATE,0),            NVL(FAMILYNO,0),
             NVL(FAMI65NO,0),       NVL(OBSTACLENO,0),     NVL(CHILDNO,0),         NVL(WOMAN,0),
             NVL(ANUAMT,0),         NVL(BANUAMT,0)     +   NVL(BANUAMT1,0)    +    NVL(BANUAMT2,0)    BANUAMT,                 
             NVL(MEDAMT,0),         NVL(BMEDAMT,0)     +   NVL(BMEDAMT1,0)    +    NVL(BMEDAMT2,0)    BMEDAMT,
             NVL(HIREAMT,0),        NVL(BHIREAMT,0)    +   NVL(BHIREAMT1,0)   +    NVL(BHIREAMT2,0)   BHIREAMT,
             NVL(GUARAMT,0),        NVL(GHOSAMT,0),        NVL(OHOSAMT,0),         NVL(NHOSAMT,0),
             NVL(KEDUNO,0),         NVL(UEDUNO,0),         NVL(SEDUAMT,0),         NVL(KEDUAMT,0),    
             NVL(CEDUNO,0),         NVL(CEDUAMT,0),        NVL(UEDUAMT,0),         
             NVL(HOUSEAMT,0),       NVL(HOUSEAMT2,0),      NVL(AGIVEAMT,0),        NVL(PGIVEAMT,0),   NVL(PGIVEAMT2,0),  NVL(SGIVEAMT,0),
             NVL(PENAMT1,0),        NVL(PENAMT2,0),        NVL(HLOANAMT,0),        NVL(FORIAMT,0),    NVL(ETCTAMT,0),      
             NVL(MINTAX,0),         NVL(MJUTAX,0),         NVL(MNONGTAX,0),        
             NVL(BINTAX,0)     +    NVL(BINTAX1,0)     +   NVL(BINTAX2,0)          BINTAX,       
             NVL(BJUTAX,0)     +    NVL(BJUTAX1,0)     +   NVL(BJUTAX2,0)          BJUTAX,
             NVL(BNONGTAX,0)   +    NVL(BNONGTAX1,0)   +   NVL(BNONGTAX2,0)        BNONGTAX,     
             NVL(KEDUNO1,0),        NVL(KEDUAMT1,0),       NVL(INVESTAMT,0),   
             NVL(CREDITTOTAMT,0),   NVL(CREDITDEDAMT,0),   NVL(CREDITAMT,0),       NVL(OBSGUARAMT,0), NVL(NPENAMT,0),    NVL(NPENAMT2,0),   
             NVL(OBSEDUAMT, 0),     NVL(SPGIVAMT, 0),      NVL(OBSEDUNO, 0),       /o2000~2001투자조합출자소득,특레지정기부금)o/
             NVL(DEBITAMT,0),       NVL(GIROAMT,0),                                
             NVL(POLIAMT,0),        NVL(FAMI70NO,0),       NVL(SPECADDNO,0),       NVL(SPECADDDED,0),            
             NVL(SHOSAMT,0),        NVL(HOUSEINTAMT,0),    NVL(HOUSEINTAMT2,0),    NVL(HOUSEINTAMT3,0), 
             NVL(CASHAMT,0),        NVL(COSTOCKAMT,0),                             
             NVL(FEWNO,0),          NVL(BABYNO,0),                                 
             NVL(FUNDAMT1,0),       NVL(FUNDAMT2,0),       NVL(FUNDAMT3,0),        NVL(LONGMTAMT,0),        /o Dsa2000 추가  2008.12.o/          
             NVL(houserentamt,0),   NVL(housvsubamt,0),    NVL(housvcomamt,0),     NVL(housvempamt,0), NVL(HOUSEAMT3,0),                                                                        
             NVL(TMARKETAMT ,0),    NVL(HOUSEINTAMT4,0),   NVL(HOUSEINTAMT5,0),    NVL(INVESTAMT2  ,0),      /o 2012.12 추가o/
             NVL(SPARENT ,0),       NVL(TRAFFICAMT,0),     NVL(INVESTAMT3,0),      NVL(INVESTAMT4,0),  NVL(HSRENTINAMT  ,0),     /o 2013.11 추가o/
             NVL(INVESTAMT5,0),     NVL(INVESTAMT6,0),     NVL(INVESTAMT7,0),      NVL(LONGFUNDAMT,0),       /o 2014.12 추가o/
             NVL(CREDITADDAMT1,0),  NVL(CREDITADDAMT2,0),  NVL(CREDITADDAMT3,0),   NVL(CREDITADDAMT4,0),     /o 2014.12 추가o/
             NVL(NPGIVEAMT2_2010,0),NVL(NPGIVEAMT2_ELSE,0),                                                  /o 2014.12 추가o/
             NVL(INFANTTAXDED,0),   NVL(ADDBABYTAXDED,0),  NVL(OBSGUARTAXDED,0),                             /o2015.04.24 jissi o/
             NVL(NAGIVEAMT_2014 ,0),NVL(NPGIVEAMT_2014 ,0),NVL(NPGIVEAMT2_2014,0),                           /o2015.12 jissio/
             NVL(NAGIVEDED_2014 ,0),NVL(NPGIVEDED_2014 ,0),NVL(NPGIVEDED2_2014,0),                           /o2015.12 jissio/
             NVL(HOUSEINTAMT6   ,0),NVL(HOUSEINTAMT7   ,0),NVL(HOUSEINTAMT8   ,0), NVL(HOUSEINTAMT9   ,0),   /o2015.12 jissio/
             NVL(HOUSEINTDED6   ,0),NVL(HOUSEINTDED7   ,0),NVL(HOUSEINTDED8   ,0), NVL(HOUSEINTDED9   ,0),   /o2015.12 jissio/
             NVL(INVESTAMT8     ,0),NVL(INVESTAMT9     ,0),NVL(INVESTAMT10    ,0), NVL(INVESTAMT11    ,0),   /o2015.12 jissio/
             NVL(INVESTDED4     ,0),NVL(CREDITADDAMT5  ,0),NVL(CREDITADDAMT6  ,0), NVL(CREDITADDAMT7  ,0),   /o2015.12 jissio/
             NVL(IHOSAMT        ,0),NVL(RPENAMT        ,0),NVL(RPENDED        ,0), NVL(RPENTAXDED     ,0)    /o2015.12 jissio/   
       FROM  PKZRYMAS ; */ 
     
     
     /* EXEC   SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 127;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select EMPNO ,REPLACE(NVL(JUMINID,''),'-','') ,(to_number(to_char(sy\
sdate,'YYYY'))-to_number((decode(Substr(juminid,8,1),'1','19','2','19','5','\
19','6','19','20')||Substr(juminid,1,2)))) SelfAge ,NVL(TAXGROSS,0) ,NVL(FOR\
ITAXGROSS,0) ,NVL(MCOGBONSUM,0) ,NVL(BCOGBONSUM,0) ,NVL(MATE,0) ,NVL(FAMILYN\
O,0) ,NVL(FAMI65NO,0) ,NVL(OBSTACLENO,0) ,NVL(CHILDNO,0) ,NVL(WOMAN,0) ,NVL(\
ANUAMT,0) ,((NVL(BANUAMT,0)+NVL(BANUAMT1,0))+NVL(BANUAMT2,0)) BANUAMT ,NVL(M\
EDAMT,0) ,((NVL(BMEDAMT,0)+NVL(BMEDAMT1,0))+NVL(BMEDAMT2,0)) BMEDAMT ,NVL(HI\
REAMT,0) ,((NVL(BHIREAMT,0)+NVL(BHIREAMT1,0))+NVL(BHIREAMT2,0)) BHIREAMT ,NV\
L(GUARAMT,0) ,NVL(GHOSAMT,0) ,NVL(OHOSAMT,0) ,NVL(NHOSAMT,0) ,NVL(KEDUNO,0) \
,NVL(UEDUNO,0) ,NVL(SEDUAMT,0) ,NVL(KEDUAMT,0) ,NVL(CEDUNO,0) ,NVL(CEDUAMT,0\
) ,NVL(UEDUAMT,0) ,NVL(HOUSEAMT,0) ,NVL(HOUSEAMT2,0) ,NVL(AGIVEAMT,0) ,NVL(P\
GIVEAMT,0) ,NVL(PGIVEAMT2,0) ,NVL(SGIVEAMT,0) ,NVL(PENAMT1,0) ,NVL(PENAMT2,0\
) ,NVL(HLOANAMT,0) ,NVL(FORIAMT,0) ,NVL(ETCTAMT,0) ,NVL(MINTAX,0) ,NVL(MJUTA\
X,0) ,NVL(MNONGTAX,0) ,((NVL(BINTAX,0)+NVL(B");
     sqlbuft((void **)0,
       "INTAX1,0))+NVL(BINTAX2,0)) BINTAX ,((NVL(BJUTAX,0)+NVL(BJUTAX1,0))+N\
VL(BJUTAX2,0)) BJUTAX ,((NVL(BNONGTAX,0)+NVL(BNONGTAX1,0))+NVL(BNONGTAX2,0))\
 BNONGTAX ,NVL(KEDUNO1,0) ,NVL(KEDUAMT1,0) ,NVL(INVESTAMT,0) ,NVL(CREDITTOTA\
MT,0) ,NVL(CREDITDEDAMT,0) ,NVL(CREDITAMT,0) ,NVL(OBSGUARAMT,0) ,NVL(NPENAMT\
,0) ,NVL(NPENAMT2,0) ,NVL(OBSEDUAMT,0) ,NVL(SPGIVAMT,0) ,NVL(OBSEDUNO,0) ,NV\
L(DEBITAMT,0) ,NVL(GIROAMT,0) ,NVL(POLIAMT,0) ,NVL(FAMI70NO,0) ,NVL(SPECADDN\
O,0) ,NVL(SPECADDDED,0) ,NVL(SHOSAMT,0) ,NVL(HOUSEINTAMT,0) ,NVL(HOUSEINTAMT\
2,0) ,NVL(HOUSEINTAMT3,0) ,NVL(CASHAMT,0) ,NVL(COSTOCKAMT,0) ,NVL(FEWNO,0) ,\
NVL(BABYNO,0) ,NVL(FUNDAMT1,0) ,NVL(FUNDAMT2,0) ,NVL(FUNDAMT3,0) ,NVL(LONGMT\
AMT,0) ,NVL(houserentamt,0) ,NVL(housvsubamt,0) ,NVL(housvcomamt,0) ,NVL(hou\
svempamt,0) ,NVL(HOUSEAMT3,0) ,NVL(TMARKETAMT,0) ,NVL(HOUSEINTAMT4,0) ,NVL(H\
OUSEINTAMT5,0) ,NVL(INVESTAMT2,0) ,NVL(SPARENT,0) ,NVL(TRAFFICAMT,0) ,NVL(IN\
VESTAMT3,0) ,NVL(INVESTAMT4,0) ,NVL(HSRENTINAMT,0) ,NVL(INVESTAMT5,0) ,NVL(I\
NVESTAMT6,0) ,NVL(INVESTAMT7,0) ,NVL(LONGFUN");
     sqlstm.stmt = sq0016;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )820;
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
        Write_batlog(seqno++, "6. 근로소득공제1 setting Error");  
        err_print(sqlca.sqlcode,"6. 근로소득공제1 setting Error");
        exit(1);
     }
     
     while(1)
     {
         	ClearVar();
         	
          /* EXEC SQL FETCH c1 INTO
          :empno,          :juminid,        :SelfAge, 
          :taxgross,       :foritaxgross,  /o 국외근로소득 o/
          :mcogbonsum,     :bcogbonsum,     :mate,           :familyno,  
          :fami65no,       :obstacleno,     :childno,        :woman,       
          :anuamt,         :banuamt,                         
          :medamt,         :bmedamt,                         
          :hireamt,        :bhireamt,                        
          :guaramt,        :ghosamt,        :ohosamt,        :nhosamt,     
          :keduno,         :ueduno,         :seduamt,        :keduamt,      
          :ceduno,         :ceduamt,        :ueduamt,        
          :houseamt,       :houseamt2,      :agiveamt,       :pgiveamt,    :pgiveamt2,  :sgiveamt,
          :penamt1,        :penamt2,        :hloanamt,       :foriamt,     :etctamt,    
          :mintax,         :mjutax,         :mnongtax,                                  
          :bintax,         :bjutax,         :bnongtax,                                  
          :keduno1,        :keduamt1,       :investamt,                                 
          :credittotamt,   :creditdedamt,   :creditamt,      :obsguaramt,  :npenamt,    :npenamt2,     
          :obseduamt,      :spgivamt,       :obseduno,                    /o parksh 20021213 추가  o/
          :debitamt,       :giroamt,                                      /o Dsa2000 추가  2003.12.o/
          :poliamt,        :fami70no,       :specaddno,      :specaddded, 
          :shosamt,        :houseintamt,    :houseintamt2,   :houseintamt3,
          :cashamt,        :costockamt,                      
          :fewno,          :babyno,                          
          :fundamt1,       :fundamt2,       :fundamt3,       :longmtamt,               /o DSA2000 추가  2008.12.o/
          :houserentamt,   :housvsubamt,    :housvcomamt,    :housvempamt, :houseamt3,
          :tmarketamt,     :houseintamt4,   :houseintamt5,   :investamt2,
          :sparent,        :trafficamt,     :investamt3,     :investamt4,  :hsrentinamt,
          :investamt5,     :investamt6,     :investamt7,     :longfundamt, 
          :creditaddamt1,  :creditaddamt2,  :creditaddamt3,  :creditaddamt4,
          :npgiveamt2_2010,:npgiveamt2_else,
          :infanttaxded,   :addbabytaxded,  :obsguartaxded,                                 /o2015.04.24 jissi o/
          :nagiveamt_2014, :npgiveamt_2014, :npgiveamt2_2014,                               /o2015.12 jissio/
          :nagiveded_2014, :npgiveded_2014, :npgiveded2_2014,                               /o2015.12 jissio/
          :houseintamt6  , :houseintamt7  , :houseintamt8   ,:houseintamt9 ,                /o2015.12 jissio/
          :houseintded6  , :houseintded7  , :houseintded8   ,:houseintded9 ,                /o2015.12 jissio/
          :investamt8    , :investamt9    , :investamt10    ,:investamt11  ,                /o2015.12 jissio/
          :investded4    , :creditaddamt5 , :creditaddamt6  ,:creditaddamt7,                /o2015.12 jissio/
          :ihosamt       , :rpenamt       , :rpended        ,:rpentaxded   ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 130;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )835;
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
          sqlstm.sqhstl[1] = (unsigned long )15;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&SelfAge;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&taxgross;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&foritaxgross;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&mcogbonsum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&bcogbonsum;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&mate;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&familyno;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&fami65no;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&obstacleno;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&childno;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&woman;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&anuamt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&banuamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&medamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&bmedamt;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&hireamt;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&bhireamt;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&guaramt;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&ghosamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&ohosamt;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&nhosamt;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&keduno;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&ueduno;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&seduamt;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&keduamt;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&ceduno;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&ceduamt;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&ueduamt;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&houseamt;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&houseamt2;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&agiveamt;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&pgiveamt;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&pgiveamt2;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&sgiveamt;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&penamt1;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&penamt2;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&hloanamt;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&foriamt;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&etctamt;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&mintax;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&mjutax;
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
          sqlstm.sqhstv[44] = (unsigned char  *)&bintax;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&bjutax;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&bnongtax;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&keduno1;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&keduamt1;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&investamt;
          sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)&credittotamt;
          sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)&creditdedamt;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&creditamt;
          sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[52] = (         int  )0;
          sqlstm.sqindv[52] = (         short *)0;
          sqlstm.sqinds[52] = (         int  )0;
          sqlstm.sqharm[52] = (unsigned long )0;
          sqlstm.sqadto[52] = (unsigned short )0;
          sqlstm.sqtdso[52] = (unsigned short )0;
          sqlstm.sqhstv[53] = (unsigned char  *)&obsguaramt;
          sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[53] = (         int  )0;
          sqlstm.sqindv[53] = (         short *)0;
          sqlstm.sqinds[53] = (         int  )0;
          sqlstm.sqharm[53] = (unsigned long )0;
          sqlstm.sqadto[53] = (unsigned short )0;
          sqlstm.sqtdso[53] = (unsigned short )0;
          sqlstm.sqhstv[54] = (unsigned char  *)&npenamt;
          sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[54] = (         int  )0;
          sqlstm.sqindv[54] = (         short *)0;
          sqlstm.sqinds[54] = (         int  )0;
          sqlstm.sqharm[54] = (unsigned long )0;
          sqlstm.sqadto[54] = (unsigned short )0;
          sqlstm.sqtdso[54] = (unsigned short )0;
          sqlstm.sqhstv[55] = (unsigned char  *)&npenamt2;
          sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[55] = (         int  )0;
          sqlstm.sqindv[55] = (         short *)0;
          sqlstm.sqinds[55] = (         int  )0;
          sqlstm.sqharm[55] = (unsigned long )0;
          sqlstm.sqadto[55] = (unsigned short )0;
          sqlstm.sqtdso[55] = (unsigned short )0;
          sqlstm.sqhstv[56] = (unsigned char  *)&obseduamt;
          sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[56] = (         int  )0;
          sqlstm.sqindv[56] = (         short *)0;
          sqlstm.sqinds[56] = (         int  )0;
          sqlstm.sqharm[56] = (unsigned long )0;
          sqlstm.sqadto[56] = (unsigned short )0;
          sqlstm.sqtdso[56] = (unsigned short )0;
          sqlstm.sqhstv[57] = (unsigned char  *)&spgivamt;
          sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[57] = (         int  )0;
          sqlstm.sqindv[57] = (         short *)0;
          sqlstm.sqinds[57] = (         int  )0;
          sqlstm.sqharm[57] = (unsigned long )0;
          sqlstm.sqadto[57] = (unsigned short )0;
          sqlstm.sqtdso[57] = (unsigned short )0;
          sqlstm.sqhstv[58] = (unsigned char  *)&obseduno;
          sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[58] = (         int  )0;
          sqlstm.sqindv[58] = (         short *)0;
          sqlstm.sqinds[58] = (         int  )0;
          sqlstm.sqharm[58] = (unsigned long )0;
          sqlstm.sqadto[58] = (unsigned short )0;
          sqlstm.sqtdso[58] = (unsigned short )0;
          sqlstm.sqhstv[59] = (unsigned char  *)&debitamt;
          sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[59] = (         int  )0;
          sqlstm.sqindv[59] = (         short *)0;
          sqlstm.sqinds[59] = (         int  )0;
          sqlstm.sqharm[59] = (unsigned long )0;
          sqlstm.sqadto[59] = (unsigned short )0;
          sqlstm.sqtdso[59] = (unsigned short )0;
          sqlstm.sqhstv[60] = (unsigned char  *)&giroamt;
          sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[60] = (         int  )0;
          sqlstm.sqindv[60] = (         short *)0;
          sqlstm.sqinds[60] = (         int  )0;
          sqlstm.sqharm[60] = (unsigned long )0;
          sqlstm.sqadto[60] = (unsigned short )0;
          sqlstm.sqtdso[60] = (unsigned short )0;
          sqlstm.sqhstv[61] = (unsigned char  *)&poliamt;
          sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[61] = (         int  )0;
          sqlstm.sqindv[61] = (         short *)0;
          sqlstm.sqinds[61] = (         int  )0;
          sqlstm.sqharm[61] = (unsigned long )0;
          sqlstm.sqadto[61] = (unsigned short )0;
          sqlstm.sqtdso[61] = (unsigned short )0;
          sqlstm.sqhstv[62] = (unsigned char  *)&fami70no;
          sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[62] = (         int  )0;
          sqlstm.sqindv[62] = (         short *)0;
          sqlstm.sqinds[62] = (         int  )0;
          sqlstm.sqharm[62] = (unsigned long )0;
          sqlstm.sqadto[62] = (unsigned short )0;
          sqlstm.sqtdso[62] = (unsigned short )0;
          sqlstm.sqhstv[63] = (unsigned char  *)&specaddno;
          sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[63] = (         int  )0;
          sqlstm.sqindv[63] = (         short *)0;
          sqlstm.sqinds[63] = (         int  )0;
          sqlstm.sqharm[63] = (unsigned long )0;
          sqlstm.sqadto[63] = (unsigned short )0;
          sqlstm.sqtdso[63] = (unsigned short )0;
          sqlstm.sqhstv[64] = (unsigned char  *)&specaddded;
          sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[64] = (         int  )0;
          sqlstm.sqindv[64] = (         short *)0;
          sqlstm.sqinds[64] = (         int  )0;
          sqlstm.sqharm[64] = (unsigned long )0;
          sqlstm.sqadto[64] = (unsigned short )0;
          sqlstm.sqtdso[64] = (unsigned short )0;
          sqlstm.sqhstv[65] = (unsigned char  *)&shosamt;
          sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[65] = (         int  )0;
          sqlstm.sqindv[65] = (         short *)0;
          sqlstm.sqinds[65] = (         int  )0;
          sqlstm.sqharm[65] = (unsigned long )0;
          sqlstm.sqadto[65] = (unsigned short )0;
          sqlstm.sqtdso[65] = (unsigned short )0;
          sqlstm.sqhstv[66] = (unsigned char  *)&houseintamt;
          sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[66] = (         int  )0;
          sqlstm.sqindv[66] = (         short *)0;
          sqlstm.sqinds[66] = (         int  )0;
          sqlstm.sqharm[66] = (unsigned long )0;
          sqlstm.sqadto[66] = (unsigned short )0;
          sqlstm.sqtdso[66] = (unsigned short )0;
          sqlstm.sqhstv[67] = (unsigned char  *)&houseintamt2;
          sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[67] = (         int  )0;
          sqlstm.sqindv[67] = (         short *)0;
          sqlstm.sqinds[67] = (         int  )0;
          sqlstm.sqharm[67] = (unsigned long )0;
          sqlstm.sqadto[67] = (unsigned short )0;
          sqlstm.sqtdso[67] = (unsigned short )0;
          sqlstm.sqhstv[68] = (unsigned char  *)&houseintamt3;
          sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[68] = (         int  )0;
          sqlstm.sqindv[68] = (         short *)0;
          sqlstm.sqinds[68] = (         int  )0;
          sqlstm.sqharm[68] = (unsigned long )0;
          sqlstm.sqadto[68] = (unsigned short )0;
          sqlstm.sqtdso[68] = (unsigned short )0;
          sqlstm.sqhstv[69] = (unsigned char  *)&cashamt;
          sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[69] = (         int  )0;
          sqlstm.sqindv[69] = (         short *)0;
          sqlstm.sqinds[69] = (         int  )0;
          sqlstm.sqharm[69] = (unsigned long )0;
          sqlstm.sqadto[69] = (unsigned short )0;
          sqlstm.sqtdso[69] = (unsigned short )0;
          sqlstm.sqhstv[70] = (unsigned char  *)&costockamt;
          sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[70] = (         int  )0;
          sqlstm.sqindv[70] = (         short *)0;
          sqlstm.sqinds[70] = (         int  )0;
          sqlstm.sqharm[70] = (unsigned long )0;
          sqlstm.sqadto[70] = (unsigned short )0;
          sqlstm.sqtdso[70] = (unsigned short )0;
          sqlstm.sqhstv[71] = (unsigned char  *)&fewno;
          sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[71] = (         int  )0;
          sqlstm.sqindv[71] = (         short *)0;
          sqlstm.sqinds[71] = (         int  )0;
          sqlstm.sqharm[71] = (unsigned long )0;
          sqlstm.sqadto[71] = (unsigned short )0;
          sqlstm.sqtdso[71] = (unsigned short )0;
          sqlstm.sqhstv[72] = (unsigned char  *)&babyno;
          sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[72] = (         int  )0;
          sqlstm.sqindv[72] = (         short *)0;
          sqlstm.sqinds[72] = (         int  )0;
          sqlstm.sqharm[72] = (unsigned long )0;
          sqlstm.sqadto[72] = (unsigned short )0;
          sqlstm.sqtdso[72] = (unsigned short )0;
          sqlstm.sqhstv[73] = (unsigned char  *)&fundamt1;
          sqlstm.sqhstl[73] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[73] = (         int  )0;
          sqlstm.sqindv[73] = (         short *)0;
          sqlstm.sqinds[73] = (         int  )0;
          sqlstm.sqharm[73] = (unsigned long )0;
          sqlstm.sqadto[73] = (unsigned short )0;
          sqlstm.sqtdso[73] = (unsigned short )0;
          sqlstm.sqhstv[74] = (unsigned char  *)&fundamt2;
          sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[74] = (         int  )0;
          sqlstm.sqindv[74] = (         short *)0;
          sqlstm.sqinds[74] = (         int  )0;
          sqlstm.sqharm[74] = (unsigned long )0;
          sqlstm.sqadto[74] = (unsigned short )0;
          sqlstm.sqtdso[74] = (unsigned short )0;
          sqlstm.sqhstv[75] = (unsigned char  *)&fundamt3;
          sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[75] = (         int  )0;
          sqlstm.sqindv[75] = (         short *)0;
          sqlstm.sqinds[75] = (         int  )0;
          sqlstm.sqharm[75] = (unsigned long )0;
          sqlstm.sqadto[75] = (unsigned short )0;
          sqlstm.sqtdso[75] = (unsigned short )0;
          sqlstm.sqhstv[76] = (unsigned char  *)&longmtamt;
          sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[76] = (         int  )0;
          sqlstm.sqindv[76] = (         short *)0;
          sqlstm.sqinds[76] = (         int  )0;
          sqlstm.sqharm[76] = (unsigned long )0;
          sqlstm.sqadto[76] = (unsigned short )0;
          sqlstm.sqtdso[76] = (unsigned short )0;
          sqlstm.sqhstv[77] = (unsigned char  *)&houserentamt;
          sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[77] = (         int  )0;
          sqlstm.sqindv[77] = (         short *)0;
          sqlstm.sqinds[77] = (         int  )0;
          sqlstm.sqharm[77] = (unsigned long )0;
          sqlstm.sqadto[77] = (unsigned short )0;
          sqlstm.sqtdso[77] = (unsigned short )0;
          sqlstm.sqhstv[78] = (unsigned char  *)&housvsubamt;
          sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[78] = (         int  )0;
          sqlstm.sqindv[78] = (         short *)0;
          sqlstm.sqinds[78] = (         int  )0;
          sqlstm.sqharm[78] = (unsigned long )0;
          sqlstm.sqadto[78] = (unsigned short )0;
          sqlstm.sqtdso[78] = (unsigned short )0;
          sqlstm.sqhstv[79] = (unsigned char  *)&housvcomamt;
          sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[79] = (         int  )0;
          sqlstm.sqindv[79] = (         short *)0;
          sqlstm.sqinds[79] = (         int  )0;
          sqlstm.sqharm[79] = (unsigned long )0;
          sqlstm.sqadto[79] = (unsigned short )0;
          sqlstm.sqtdso[79] = (unsigned short )0;
          sqlstm.sqhstv[80] = (unsigned char  *)&housvempamt;
          sqlstm.sqhstl[80] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[80] = (         int  )0;
          sqlstm.sqindv[80] = (         short *)0;
          sqlstm.sqinds[80] = (         int  )0;
          sqlstm.sqharm[80] = (unsigned long )0;
          sqlstm.sqadto[80] = (unsigned short )0;
          sqlstm.sqtdso[80] = (unsigned short )0;
          sqlstm.sqhstv[81] = (unsigned char  *)&houseamt3;
          sqlstm.sqhstl[81] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[81] = (         int  )0;
          sqlstm.sqindv[81] = (         short *)0;
          sqlstm.sqinds[81] = (         int  )0;
          sqlstm.sqharm[81] = (unsigned long )0;
          sqlstm.sqadto[81] = (unsigned short )0;
          sqlstm.sqtdso[81] = (unsigned short )0;
          sqlstm.sqhstv[82] = (unsigned char  *)&tmarketamt;
          sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[82] = (         int  )0;
          sqlstm.sqindv[82] = (         short *)0;
          sqlstm.sqinds[82] = (         int  )0;
          sqlstm.sqharm[82] = (unsigned long )0;
          sqlstm.sqadto[82] = (unsigned short )0;
          sqlstm.sqtdso[82] = (unsigned short )0;
          sqlstm.sqhstv[83] = (unsigned char  *)&houseintamt4;
          sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[83] = (         int  )0;
          sqlstm.sqindv[83] = (         short *)0;
          sqlstm.sqinds[83] = (         int  )0;
          sqlstm.sqharm[83] = (unsigned long )0;
          sqlstm.sqadto[83] = (unsigned short )0;
          sqlstm.sqtdso[83] = (unsigned short )0;
          sqlstm.sqhstv[84] = (unsigned char  *)&houseintamt5;
          sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[84] = (         int  )0;
          sqlstm.sqindv[84] = (         short *)0;
          sqlstm.sqinds[84] = (         int  )0;
          sqlstm.sqharm[84] = (unsigned long )0;
          sqlstm.sqadto[84] = (unsigned short )0;
          sqlstm.sqtdso[84] = (unsigned short )0;
          sqlstm.sqhstv[85] = (unsigned char  *)&investamt2;
          sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[85] = (         int  )0;
          sqlstm.sqindv[85] = (         short *)0;
          sqlstm.sqinds[85] = (         int  )0;
          sqlstm.sqharm[85] = (unsigned long )0;
          sqlstm.sqadto[85] = (unsigned short )0;
          sqlstm.sqtdso[85] = (unsigned short )0;
          sqlstm.sqhstv[86] = (unsigned char  *)&sparent;
          sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[86] = (         int  )0;
          sqlstm.sqindv[86] = (         short *)0;
          sqlstm.sqinds[86] = (         int  )0;
          sqlstm.sqharm[86] = (unsigned long )0;
          sqlstm.sqadto[86] = (unsigned short )0;
          sqlstm.sqtdso[86] = (unsigned short )0;
          sqlstm.sqhstv[87] = (unsigned char  *)&trafficamt;
          sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[87] = (         int  )0;
          sqlstm.sqindv[87] = (         short *)0;
          sqlstm.sqinds[87] = (         int  )0;
          sqlstm.sqharm[87] = (unsigned long )0;
          sqlstm.sqadto[87] = (unsigned short )0;
          sqlstm.sqtdso[87] = (unsigned short )0;
          sqlstm.sqhstv[88] = (unsigned char  *)&investamt3;
          sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[88] = (         int  )0;
          sqlstm.sqindv[88] = (         short *)0;
          sqlstm.sqinds[88] = (         int  )0;
          sqlstm.sqharm[88] = (unsigned long )0;
          sqlstm.sqadto[88] = (unsigned short )0;
          sqlstm.sqtdso[88] = (unsigned short )0;
          sqlstm.sqhstv[89] = (unsigned char  *)&investamt4;
          sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[89] = (         int  )0;
          sqlstm.sqindv[89] = (         short *)0;
          sqlstm.sqinds[89] = (         int  )0;
          sqlstm.sqharm[89] = (unsigned long )0;
          sqlstm.sqadto[89] = (unsigned short )0;
          sqlstm.sqtdso[89] = (unsigned short )0;
          sqlstm.sqhstv[90] = (unsigned char  *)&hsrentinamt;
          sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[90] = (         int  )0;
          sqlstm.sqindv[90] = (         short *)0;
          sqlstm.sqinds[90] = (         int  )0;
          sqlstm.sqharm[90] = (unsigned long )0;
          sqlstm.sqadto[90] = (unsigned short )0;
          sqlstm.sqtdso[90] = (unsigned short )0;
          sqlstm.sqhstv[91] = (unsigned char  *)&investamt5;
          sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[91] = (         int  )0;
          sqlstm.sqindv[91] = (         short *)0;
          sqlstm.sqinds[91] = (         int  )0;
          sqlstm.sqharm[91] = (unsigned long )0;
          sqlstm.sqadto[91] = (unsigned short )0;
          sqlstm.sqtdso[91] = (unsigned short )0;
          sqlstm.sqhstv[92] = (unsigned char  *)&investamt6;
          sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[92] = (         int  )0;
          sqlstm.sqindv[92] = (         short *)0;
          sqlstm.sqinds[92] = (         int  )0;
          sqlstm.sqharm[92] = (unsigned long )0;
          sqlstm.sqadto[92] = (unsigned short )0;
          sqlstm.sqtdso[92] = (unsigned short )0;
          sqlstm.sqhstv[93] = (unsigned char  *)&investamt7;
          sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[93] = (         int  )0;
          sqlstm.sqindv[93] = (         short *)0;
          sqlstm.sqinds[93] = (         int  )0;
          sqlstm.sqharm[93] = (unsigned long )0;
          sqlstm.sqadto[93] = (unsigned short )0;
          sqlstm.sqtdso[93] = (unsigned short )0;
          sqlstm.sqhstv[94] = (unsigned char  *)&longfundamt;
          sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[94] = (         int  )0;
          sqlstm.sqindv[94] = (         short *)0;
          sqlstm.sqinds[94] = (         int  )0;
          sqlstm.sqharm[94] = (unsigned long )0;
          sqlstm.sqadto[94] = (unsigned short )0;
          sqlstm.sqtdso[94] = (unsigned short )0;
          sqlstm.sqhstv[95] = (unsigned char  *)&creditaddamt1;
          sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[95] = (         int  )0;
          sqlstm.sqindv[95] = (         short *)0;
          sqlstm.sqinds[95] = (         int  )0;
          sqlstm.sqharm[95] = (unsigned long )0;
          sqlstm.sqadto[95] = (unsigned short )0;
          sqlstm.sqtdso[95] = (unsigned short )0;
          sqlstm.sqhstv[96] = (unsigned char  *)&creditaddamt2;
          sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[96] = (         int  )0;
          sqlstm.sqindv[96] = (         short *)0;
          sqlstm.sqinds[96] = (         int  )0;
          sqlstm.sqharm[96] = (unsigned long )0;
          sqlstm.sqadto[96] = (unsigned short )0;
          sqlstm.sqtdso[96] = (unsigned short )0;
          sqlstm.sqhstv[97] = (unsigned char  *)&creditaddamt3;
          sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[97] = (         int  )0;
          sqlstm.sqindv[97] = (         short *)0;
          sqlstm.sqinds[97] = (         int  )0;
          sqlstm.sqharm[97] = (unsigned long )0;
          sqlstm.sqadto[97] = (unsigned short )0;
          sqlstm.sqtdso[97] = (unsigned short )0;
          sqlstm.sqhstv[98] = (unsigned char  *)&creditaddamt4;
          sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[98] = (         int  )0;
          sqlstm.sqindv[98] = (         short *)0;
          sqlstm.sqinds[98] = (         int  )0;
          sqlstm.sqharm[98] = (unsigned long )0;
          sqlstm.sqadto[98] = (unsigned short )0;
          sqlstm.sqtdso[98] = (unsigned short )0;
          sqlstm.sqhstv[99] = (unsigned char  *)&npgiveamt2_2010;
          sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[99] = (         int  )0;
          sqlstm.sqindv[99] = (         short *)0;
          sqlstm.sqinds[99] = (         int  )0;
          sqlstm.sqharm[99] = (unsigned long )0;
          sqlstm.sqadto[99] = (unsigned short )0;
          sqlstm.sqtdso[99] = (unsigned short )0;
          sqlstm.sqhstv[100] = (unsigned char  *)&npgiveamt2_else;
          sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[100] = (         int  )0;
          sqlstm.sqindv[100] = (         short *)0;
          sqlstm.sqinds[100] = (         int  )0;
          sqlstm.sqharm[100] = (unsigned long )0;
          sqlstm.sqadto[100] = (unsigned short )0;
          sqlstm.sqtdso[100] = (unsigned short )0;
          sqlstm.sqhstv[101] = (unsigned char  *)&infanttaxded;
          sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[101] = (         int  )0;
          sqlstm.sqindv[101] = (         short *)0;
          sqlstm.sqinds[101] = (         int  )0;
          sqlstm.sqharm[101] = (unsigned long )0;
          sqlstm.sqadto[101] = (unsigned short )0;
          sqlstm.sqtdso[101] = (unsigned short )0;
          sqlstm.sqhstv[102] = (unsigned char  *)&addbabytaxded;
          sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[102] = (         int  )0;
          sqlstm.sqindv[102] = (         short *)0;
          sqlstm.sqinds[102] = (         int  )0;
          sqlstm.sqharm[102] = (unsigned long )0;
          sqlstm.sqadto[102] = (unsigned short )0;
          sqlstm.sqtdso[102] = (unsigned short )0;
          sqlstm.sqhstv[103] = (unsigned char  *)&obsguartaxded;
          sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[103] = (         int  )0;
          sqlstm.sqindv[103] = (         short *)0;
          sqlstm.sqinds[103] = (         int  )0;
          sqlstm.sqharm[103] = (unsigned long )0;
          sqlstm.sqadto[103] = (unsigned short )0;
          sqlstm.sqtdso[103] = (unsigned short )0;
          sqlstm.sqhstv[104] = (unsigned char  *)&nagiveamt_2014;
          sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[104] = (         int  )0;
          sqlstm.sqindv[104] = (         short *)0;
          sqlstm.sqinds[104] = (         int  )0;
          sqlstm.sqharm[104] = (unsigned long )0;
          sqlstm.sqadto[104] = (unsigned short )0;
          sqlstm.sqtdso[104] = (unsigned short )0;
          sqlstm.sqhstv[105] = (unsigned char  *)&npgiveamt_2014;
          sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[105] = (         int  )0;
          sqlstm.sqindv[105] = (         short *)0;
          sqlstm.sqinds[105] = (         int  )0;
          sqlstm.sqharm[105] = (unsigned long )0;
          sqlstm.sqadto[105] = (unsigned short )0;
          sqlstm.sqtdso[105] = (unsigned short )0;
          sqlstm.sqhstv[106] = (unsigned char  *)&npgiveamt2_2014;
          sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[106] = (         int  )0;
          sqlstm.sqindv[106] = (         short *)0;
          sqlstm.sqinds[106] = (         int  )0;
          sqlstm.sqharm[106] = (unsigned long )0;
          sqlstm.sqadto[106] = (unsigned short )0;
          sqlstm.sqtdso[106] = (unsigned short )0;
          sqlstm.sqhstv[107] = (unsigned char  *)&nagiveded_2014;
          sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[107] = (         int  )0;
          sqlstm.sqindv[107] = (         short *)0;
          sqlstm.sqinds[107] = (         int  )0;
          sqlstm.sqharm[107] = (unsigned long )0;
          sqlstm.sqadto[107] = (unsigned short )0;
          sqlstm.sqtdso[107] = (unsigned short )0;
          sqlstm.sqhstv[108] = (unsigned char  *)&npgiveded_2014;
          sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[108] = (         int  )0;
          sqlstm.sqindv[108] = (         short *)0;
          sqlstm.sqinds[108] = (         int  )0;
          sqlstm.sqharm[108] = (unsigned long )0;
          sqlstm.sqadto[108] = (unsigned short )0;
          sqlstm.sqtdso[108] = (unsigned short )0;
          sqlstm.sqhstv[109] = (unsigned char  *)&npgiveded2_2014;
          sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[109] = (         int  )0;
          sqlstm.sqindv[109] = (         short *)0;
          sqlstm.sqinds[109] = (         int  )0;
          sqlstm.sqharm[109] = (unsigned long )0;
          sqlstm.sqadto[109] = (unsigned short )0;
          sqlstm.sqtdso[109] = (unsigned short )0;
          sqlstm.sqhstv[110] = (unsigned char  *)&houseintamt6;
          sqlstm.sqhstl[110] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[110] = (         int  )0;
          sqlstm.sqindv[110] = (         short *)0;
          sqlstm.sqinds[110] = (         int  )0;
          sqlstm.sqharm[110] = (unsigned long )0;
          sqlstm.sqadto[110] = (unsigned short )0;
          sqlstm.sqtdso[110] = (unsigned short )0;
          sqlstm.sqhstv[111] = (unsigned char  *)&houseintamt7;
          sqlstm.sqhstl[111] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[111] = (         int  )0;
          sqlstm.sqindv[111] = (         short *)0;
          sqlstm.sqinds[111] = (         int  )0;
          sqlstm.sqharm[111] = (unsigned long )0;
          sqlstm.sqadto[111] = (unsigned short )0;
          sqlstm.sqtdso[111] = (unsigned short )0;
          sqlstm.sqhstv[112] = (unsigned char  *)&houseintamt8;
          sqlstm.sqhstl[112] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[112] = (         int  )0;
          sqlstm.sqindv[112] = (         short *)0;
          sqlstm.sqinds[112] = (         int  )0;
          sqlstm.sqharm[112] = (unsigned long )0;
          sqlstm.sqadto[112] = (unsigned short )0;
          sqlstm.sqtdso[112] = (unsigned short )0;
          sqlstm.sqhstv[113] = (unsigned char  *)&houseintamt9;
          sqlstm.sqhstl[113] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[113] = (         int  )0;
          sqlstm.sqindv[113] = (         short *)0;
          sqlstm.sqinds[113] = (         int  )0;
          sqlstm.sqharm[113] = (unsigned long )0;
          sqlstm.sqadto[113] = (unsigned short )0;
          sqlstm.sqtdso[113] = (unsigned short )0;
          sqlstm.sqhstv[114] = (unsigned char  *)&houseintded6;
          sqlstm.sqhstl[114] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[114] = (         int  )0;
          sqlstm.sqindv[114] = (         short *)0;
          sqlstm.sqinds[114] = (         int  )0;
          sqlstm.sqharm[114] = (unsigned long )0;
          sqlstm.sqadto[114] = (unsigned short )0;
          sqlstm.sqtdso[114] = (unsigned short )0;
          sqlstm.sqhstv[115] = (unsigned char  *)&houseintded7;
          sqlstm.sqhstl[115] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[115] = (         int  )0;
          sqlstm.sqindv[115] = (         short *)0;
          sqlstm.sqinds[115] = (         int  )0;
          sqlstm.sqharm[115] = (unsigned long )0;
          sqlstm.sqadto[115] = (unsigned short )0;
          sqlstm.sqtdso[115] = (unsigned short )0;
          sqlstm.sqhstv[116] = (unsigned char  *)&houseintded8;
          sqlstm.sqhstl[116] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[116] = (         int  )0;
          sqlstm.sqindv[116] = (         short *)0;
          sqlstm.sqinds[116] = (         int  )0;
          sqlstm.sqharm[116] = (unsigned long )0;
          sqlstm.sqadto[116] = (unsigned short )0;
          sqlstm.sqtdso[116] = (unsigned short )0;
          sqlstm.sqhstv[117] = (unsigned char  *)&houseintded9;
          sqlstm.sqhstl[117] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[117] = (         int  )0;
          sqlstm.sqindv[117] = (         short *)0;
          sqlstm.sqinds[117] = (         int  )0;
          sqlstm.sqharm[117] = (unsigned long )0;
          sqlstm.sqadto[117] = (unsigned short )0;
          sqlstm.sqtdso[117] = (unsigned short )0;
          sqlstm.sqhstv[118] = (unsigned char  *)&investamt8;
          sqlstm.sqhstl[118] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[118] = (         int  )0;
          sqlstm.sqindv[118] = (         short *)0;
          sqlstm.sqinds[118] = (         int  )0;
          sqlstm.sqharm[118] = (unsigned long )0;
          sqlstm.sqadto[118] = (unsigned short )0;
          sqlstm.sqtdso[118] = (unsigned short )0;
          sqlstm.sqhstv[119] = (unsigned char  *)&investamt9;
          sqlstm.sqhstl[119] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[119] = (         int  )0;
          sqlstm.sqindv[119] = (         short *)0;
          sqlstm.sqinds[119] = (         int  )0;
          sqlstm.sqharm[119] = (unsigned long )0;
          sqlstm.sqadto[119] = (unsigned short )0;
          sqlstm.sqtdso[119] = (unsigned short )0;
          sqlstm.sqhstv[120] = (unsigned char  *)&investamt10;
          sqlstm.sqhstl[120] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[120] = (         int  )0;
          sqlstm.sqindv[120] = (         short *)0;
          sqlstm.sqinds[120] = (         int  )0;
          sqlstm.sqharm[120] = (unsigned long )0;
          sqlstm.sqadto[120] = (unsigned short )0;
          sqlstm.sqtdso[120] = (unsigned short )0;
          sqlstm.sqhstv[121] = (unsigned char  *)&investamt11;
          sqlstm.sqhstl[121] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[121] = (         int  )0;
          sqlstm.sqindv[121] = (         short *)0;
          sqlstm.sqinds[121] = (         int  )0;
          sqlstm.sqharm[121] = (unsigned long )0;
          sqlstm.sqadto[121] = (unsigned short )0;
          sqlstm.sqtdso[121] = (unsigned short )0;
          sqlstm.sqhstv[122] = (unsigned char  *)&investded4;
          sqlstm.sqhstl[122] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[122] = (         int  )0;
          sqlstm.sqindv[122] = (         short *)0;
          sqlstm.sqinds[122] = (         int  )0;
          sqlstm.sqharm[122] = (unsigned long )0;
          sqlstm.sqadto[122] = (unsigned short )0;
          sqlstm.sqtdso[122] = (unsigned short )0;
          sqlstm.sqhstv[123] = (unsigned char  *)&creditaddamt5;
          sqlstm.sqhstl[123] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[123] = (         int  )0;
          sqlstm.sqindv[123] = (         short *)0;
          sqlstm.sqinds[123] = (         int  )0;
          sqlstm.sqharm[123] = (unsigned long )0;
          sqlstm.sqadto[123] = (unsigned short )0;
          sqlstm.sqtdso[123] = (unsigned short )0;
          sqlstm.sqhstv[124] = (unsigned char  *)&creditaddamt6;
          sqlstm.sqhstl[124] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[124] = (         int  )0;
          sqlstm.sqindv[124] = (         short *)0;
          sqlstm.sqinds[124] = (         int  )0;
          sqlstm.sqharm[124] = (unsigned long )0;
          sqlstm.sqadto[124] = (unsigned short )0;
          sqlstm.sqtdso[124] = (unsigned short )0;
          sqlstm.sqhstv[125] = (unsigned char  *)&creditaddamt7;
          sqlstm.sqhstl[125] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[125] = (         int  )0;
          sqlstm.sqindv[125] = (         short *)0;
          sqlstm.sqinds[125] = (         int  )0;
          sqlstm.sqharm[125] = (unsigned long )0;
          sqlstm.sqadto[125] = (unsigned short )0;
          sqlstm.sqtdso[125] = (unsigned short )0;
          sqlstm.sqhstv[126] = (unsigned char  *)&ihosamt;
          sqlstm.sqhstl[126] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[126] = (         int  )0;
          sqlstm.sqindv[126] = (         short *)0;
          sqlstm.sqinds[126] = (         int  )0;
          sqlstm.sqharm[126] = (unsigned long )0;
          sqlstm.sqadto[126] = (unsigned short )0;
          sqlstm.sqtdso[126] = (unsigned short )0;
          sqlstm.sqhstv[127] = (unsigned char  *)&rpenamt;
          sqlstm.sqhstl[127] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[127] = (         int  )0;
          sqlstm.sqindv[127] = (         short *)0;
          sqlstm.sqinds[127] = (         int  )0;
          sqlstm.sqharm[127] = (unsigned long )0;
          sqlstm.sqadto[127] = (unsigned short )0;
          sqlstm.sqtdso[127] = (unsigned short )0;
          sqlstm.sqhstv[128] = (unsigned char  *)&rpended;
          sqlstm.sqhstl[128] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[128] = (         int  )0;
          sqlstm.sqindv[128] = (         short *)0;
          sqlstm.sqinds[128] = (         int  )0;
          sqlstm.sqharm[128] = (unsigned long )0;
          sqlstm.sqadto[128] = (unsigned short )0;
          sqlstm.sqtdso[128] = (unsigned short )0;
          sqlstm.sqhstv[129] = (unsigned char  *)&rpentaxded;
          sqlstm.sqhstl[129] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[129] = (         int  )0;
          sqlstm.sqindv[129] = (         short *)0;
          sqlstm.sqinds[129] = (         int  )0;
          sqlstm.sqharm[129] = (unsigned long )0;
          sqlstm.sqadto[129] = (unsigned short )0;
          sqlstm.sqtdso[129] = (unsigned short )0;
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

                /*2015.12 jissi*/                                          
                     
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
              Write_batlog(seqno++, "6. 근로소득공제2 setting Error");  
              err_print(sqlca.sqlcode,"6. 근로소득공제2 setting Error");
              exit(1);
          }
          
          if (sqlca.sqlcode == 1403)
          {
              /* EXEC SQL close c1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 130;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1370;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              break;
          }
                    
          /* ---------------------------------------------------------------------
            근로소득공제                           
          ------------------------------------------------------------------------*/ 
          t1 = t2 = t3 = t4 = t5 = 0;
          
          t1 = INDEDBASIC * INDEDBRATE / 100;     /*INDEDBASIC 요율적용. 2009년.*/
          if (taxgross < INDEDBASIC )  t1 = taxgross * INDEDBRATE / 100;  
  
          if ((taxgross > INDEDBASIC) && (taxgross <= INDEDLIMIT2))
          {
               t2 = (taxgross - INDEDBASIC) * INDEDORATE / 100;
          }  
          else if ((taxgross > INDEDLIMIT2) && (taxgross <= INDEDLIMIT3))
          {
               t2 = (INDEDLIMIT2 - INDEDBASIC ) * INDEDORATE  / 100;
               t3 = (taxgross    - INDEDLIMIT2) * INDEDORATE2 / 100;
          }  
          else if ((taxgross > INDEDLIMIT3) && (taxgross <= INDEDLIMIT4))
          {
               t2 = (INDEDLIMIT2 - INDEDBASIC ) * INDEDORATE  / 100;
               t3 = (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 / 100;
               t4 = (taxgross    - INDEDLIMIT3) * INDEDORATE3 / 100;
          }  
          else if (taxgross > INDEDLIMIT4)
          {
               t2 = (INDEDLIMIT2 - INDEDBASIC ) * INDEDORATE  / 100;
               t3 = (INDEDLIMIT3 - INDEDLIMIT2) * INDEDORATE2 / 100;
               t4 = (INDEDLIMIT4 - INDEDLIMIT3) * INDEDORATE3 / 100;  
               t5 = (taxgross    - INDEDLIMIT4) * INDEDORATE4 / 100;  
          }      
          
          laborded = trunc(t1 + t2 + t3 + t4 + t5);
                                                             
          laboramt = taxgross - laborded;
          
          if (laboramt < 0) 
          {
               laborded = taxgross;
               laboramt = 0;
          }
          
          /********************************************************************/
          
          /* 퇴직사원 본인 기본공제외의 부양가족공제,추가공제 안하도록 초기화 */
          mate     = 0;
          familyno = 0;
          fami65no = 0;
          fami70no = 0;
          childno  = 0;
          babyno   = 0;
          fami16no = 0;
          fami720no= 0;
          
          /* 근로자본인 경로자 체크..*/
          if (SelfAge >= 70)   fami70no = 1;
          /********************************************************************/
          
          /*  본인공제  */
          selfded = BASDED;
          selfded = fmax(fmin(laboramt, selfded),0); /*jissi 2014*/
          
          mateded = mate * BASDED;
          mateded = fmax(fmin(laboramt - selfded, mateded),0); /*jissi 2014*/
          
          famided = familyno * BASDED; 
          famided = fmax(fmin(laboramt - selfded - mateded, famided),0); /*jissi 2014*/
          basicded= selfded + mateded + famided;
                          
          /* 경로우대공제 ---oldded  = fami65no * APPOLDDED;            */
          oldded  = fami70no * APPOLDDED2; 
          oldded  = fmax(fmin(laboramt - basicded, oldded),0); /*jissi 2014*/
          /* 장애자 공제 */
          obsded  = obstacleno * OBSDEDADD;
          obsded  = fmax(fmin(laboramt - basicded - oldded, obsded),0); /*jissi 2014*/
          /* 부녀자 공제 */
          womanded = woman * APPDED;
          womanded = fmax(fmin(laboramt - basicded - oldded - obsded, womanded),0); /*jissi 2014*/
          /*자녀양육비 공제 childded= childno * APPOLDDED; */
          childded = 0;
          babyded  = 0;
          /*추가공제  */
          appendded = oldded + obsded + womanded;
          
          /* 다자녀 추가공제 FEWNO 
          if      (fami16no + fami720no == 2)  fewded = FEWDED1;
          else if (fami16no + fami720no  > 2)  fewded = FEWDED1 + ( (fami16no+fami720no-2) * FEWDED2 );
          else                                 fewded = 0; 
          fewded = fmax(fmin(laboramt - basicded - appendded, fewded),0);  jissi 2014*/   
                            
          anuded  = anuamt  + banuamt;   /*  연금보험료 공제 */
          anuded  = fmax(fmin(laboramt - basicded - appendded - fewded, anuded),0); /*jissi 2014*/   
          medded  = 0;   /* jissi 2014.03 표준세액공제 신청으로 건강보험료 0처리  medamt  + bmedamt;  */
          medded  = fmax(fmin(laboramt - basicded - appendded - fewded - anuded, medded),0); /*jissi 2014*/  
          hireded = 0;   /* jissi 2014.03 표준세액공제 신청으로 고용보험료 0처리  hireamt + bhireamt; */
          hireded = fmax(fmin(laboramt - basicded - appendded - fewded - anuded - medded, hireded),0); /*jissi 2014*/  
          insded  = medded  + hireded;   /*  보험료공제   */
           
          houseded       = 0; /* 주택임차원리금상환액_대출기관  KTH*/  
          houseded3      = 0; /* 주택임차원리금상환액_거주자  KTH*/
          
          houseintded    = 0;                                                 
          houseintded2   = 0;                                                 
          houseintded3   = 0;                                                 
          houseintded4   = 0;                                                 
          houseintded5   = 0;    
          houseintded6   = 0;                                                 
          houseintded7   = 0;                                                 
          houseintded8   = 0;                                                 
          houseintded9   = 0;                                              
          
          nagiveded      = 0;  
          npgiveded2     = 0;  
          npgiveded      = 0;  
          ngiveded       = 0;  
           
          specialded     = 0; /* 특별공제 */

          /* 차감소득금액 */
          chagamamt  = fmax((laboramt - basicded  - appendded           /*인적공제 다자녀+ fewded 삭제             2014.12*/
                                      - anuded                          /*연금보험료공제 - 연금저축 + npended 삭제 2014.12*/ 
                                      - specialded),0);                 /*특별공제 표준공제 + standded 삭제        2014.12*/  

          laborlimit = chagamamt;        
                    
               
          /* 그밖의 소득공제 합계 */
          pended     = housvsubded = housvcomded = housvempded = tinvestded = investded  =investded2 = investded3 = investded4 = creditded = costockded = hsrentinded = longfundded = 0;
          incomeded  = pended        /*그밖의 소득공제 - 연금저축(npended)  제외*/
                     + housvsubded + housvcomded + housvempded   
                     + tinvestded  + creditded   + costockded   
                     /*+ fundded    장기주식형저축 소득공제 2013 삭제*/
                     + hsrentinded   /*그밖의 소득공제 - 목돈 안드는 전세자금 이자상환액 추가 2013.11 */
                     + longfundded;  /*그밖의 소득공제 - 장기집합투자증권저축 소득공제액 추가 2014.11 */
                    
          /* 소득공제 종합한도 초과액 2013.11 jissi */
          totlimitded  = 0;
          totlimitded  = 
                       /*   guarded                                                                 소득공제 종합한도 적용대상 항목 - 1 일반보험료공제            2013.11 */        
                       /* + fmax(hosded-obshosded,0)                                                소득공제 종합한도 적용대상 항목 - 2 기타의료비공제            2013.11 */             
                       /* + fmax(eduded-obseduded,0)                                                소득공제 종합한도 적용대상 항목 - 3 기타교육비공제            2013.11 */ 
                         houseded + houseded3                                                    /* 소득공제 종합한도 적용대상 항목 - 4 주택임차차입금 공제       2013.11 */ 
                       /* + houserentded                                                            소득공제 종합한도 적용대상 항목 - 5 월세액 공제               2013.11 */  
                       + housvsubded + housvcomded + housvempded                                 /* 소득공제 종합한도 적용대상 항목 - 6 주택마련저축 공제         2013.11 */   
                       + houseintded + houseintded2 + houseintded3 + houseintded4 + houseintded5 /* 소득공제 종합한도 적용대상 항목 - 7 장기주택저당차입금 공제   2013.11 */ 
                       + houseintded6+ houseintded7 + houseintded8 + houseintded9
                       /* + pgiveded_curr + pgiveded2_curr                                          소득공제 종합한도 적용대상 항목 - 8 당해년 지정기부금   제외  2014.01 */          
                       + investded                                                               /* 소득공제 종합한도 적용대상 항목 - 9 당해년 투자조합출자 공제  2013.11 */
                       + creditded                                                               /* 소득공제 종합한도 적용대상 항목 - 10 신용카드 등 공제         2013.11 */     
                       + costockded                                                              /* 소득공제 종합한도 적용대상 항목 - 11 우리사주조합출연금 공제  2013.11 */
                       + longfundded ;                                                           /* 소득공제 종합한도 적용대상 항목 - 12 장기집합투자증권저축공제 2014.12 */

          splimitovded = fmax(totlimitded - SPDEDLIMIT,0);  
                    
          /* 과세표준  START=====================================================================*/              
          taxlevel = chagamamt
                   - incomeded
                   + splimitovded;
               
          if   (taxlevel < 0 )  taxlevel = 0;
             
          /* 산출세액 */
          if   (taxlevel == 0)  calctax  = 0;
          else                  calctax  = GetTax(taxlevel);
          calctaxlimit = calctax;    
                          
          /* 세액 공제    START=====================================================================*/          
          /* 근로소득 세액 공제 */
          if   ( calctax < TAXDEDBASIC)
                incomtded = floor(calctax * TAXDEDBRATE / 100);
          else  
                incomtded =     floor((TAXDEDBASIC  * TAXDEDBRATE / 100)
                          + (calctax - TAXDEDBASIC) * TAXDEDORATE / 100);
                          
          incomtded = fmax(incomtded, 0);
          /* 근로소득 세액공제 한도액 계산 추가 2014.12
          if       (taxgross  <= TAXDEDSECT1)
               incomtded = fmin(TAXDEDSLIMIT1,incomtded);
          else if  (taxgross  <= TAXDEDSECT2)
               incomtded = fmin(fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*1/2),TAXDEDSLIMIT2), incomtded);
          else if  (taxgross  >  TAXDEDSECT2)
               incomtded = fmin(fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*1/2),TAXDEDLIMIT  ), incomtded);
          */
          
          if       (taxgross  <= TAXDEDSECT1)
               incomtded = fmin(TAXDEDSLIMIT1,incomtded);
          else if  (taxgross  <= TAXDEDSECT2)
               incomtded = fmin(fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*0.008),TAXDEDSLIMIT2), incomtded);
          else if  (taxgross  >  TAXDEDSECT2)
               incomtded = fmin(fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*1/2  ),TAXDEDLIMIT  ), incomtded);
          
          incomtded    = fmin(calctaxlimit,incomtded);       
          calctaxlimit = fmax(calctaxlimit-incomtded, 0);    
          
          /* 자녀세액공제 : 기본공제대상자인 자녀(아들,딸)                2014.11 jissi   
             2인 이하일 경우  1인당  15만원,
             2인 이상일 경우  30만원 + 2인 초과인원당 20만원 추가공제
             ex) 기본공제 자녀 3인일 경우 30만원 + 20만원 = 50만원 공제   */ 
          if      (fewno <= 2)  childtaxded = (fewno * FEWDED1);
          else if (fewno >  2)  childtaxded = (2     * FEWDED1) + ((fewno - 2) * FEWDED2);
          
          childtaxded  = fmin(calctaxlimit,childtaxded);     
          calctaxlimit = fmax(calctaxlimit-childtaxded, 0);  
          
          /* 6세이하 2자녀이상 세액공제 2015.04.24 jissi 추가 */  
          if (childno > 1)      infanttaxded = (childno-1) * INFANTDED;
          else                  infanttaxded = 0;        

          infanttaxded  = fmin(calctaxlimit,infanttaxded);     
          calctaxlimit  = fmax(calctaxlimit-infanttaxded, 0);  
          /* 출산.입양 세액공제 2015.04.24 jissi 추가 */  
          if (babyno > 0)       addbabytaxded = babyno * ADDBABYDED;
          else                  addbabytaxded = 0;

          addbabytaxded  = fmin(calctaxlimit,addbabytaxded);   
          calctaxlimit   = fmax(calctaxlimit-addbabytaxded, 0); 
          
          /*  보장성 보험료 특별세액공제*/
          guarded      = 0; 
          obsguarded   = 0;
          guartaxded   = 0;
          obsguartaxded= 0;      /*2015.05 jissi 소급개정 */
          /* 의료비 특별세액공제 */
          hosded       = 0;
          obshosded    = 0;
          hostaxded    = 0;
          /* 교육비 특별세액공제 */
          seduded      = 0;
          keduded      = 0;
          ceduded      = 0;
          ueduded      = 0;
          obseduded    = 0;        
          eduded       = 0;
          edutaxded    = 0;  
          
          standded  = STDDED;
          standded  = fmin(calctaxlimit,standded);
          
          /* 주택차입금이자세액 공제  */
          hloanded = floor(hloanamt * HSINTRATE / 100); 
         
          hloanded     = fmin(calctaxlimit,hloanded);   
          calctaxlimit = fmax(calctaxlimit-hloanded, 0);
          
          /* 월세세액공제 */                               
          houserentded     = 0;
          houserenttaxded  = 0;

          /* 기부금 특별세액공제 */
          /* 정치자금 세액공제  */
          politaxded1  = fmin(calctaxlimit,  politaxded1);   
          calctaxlimit = fmax(calctaxlimit - politaxded1, 0);
          
          politaxded2  = fmin(calctaxlimit,  politaxded2);
          calctaxlimit = fmax(calctaxlimit - politaxded2, 0);
          
          /* 법정,지정 기부금 특별세액공제 */
          giveded         = 0;
          agiveded        = 0;
          pgiveded        = 0; 
          pgiveded2       = 0; 
          nagiveded_2014  = 0;
          npgiveded_2014  = 0; 
          npgiveded2_2014 = 0; 
          agivetaxded     = 0;  
          pgivetaxded     = 0;

          /* 2014.12 특별세액공제계  */                                                                
          taxdedsum = guartaxded + hostaxded + edutaxded + politaxded1 + politaxded2 + agivetaxded + pgivetaxded
                    + obsguartaxded;    /*2015.04.25 jissi 장애인전용보험 추가*/
          
          /*  외국납부세액공제한도:   국내근로소득금액 * 국외근로소득금액 / 근로소득금액  */
          /*   외국납부세액공제  *************************************** */
          FORILIMIT = 0;
          
          /*  국외근로소득공제 */
          if   (foriamt  > 0)
          foritaxgross1 = foritaxgross -  ( laborded * foritaxgross / taxgross ); 
          
          if   (laborded > 0)  FORILIMIT = calctax * foritaxgross1 / laborded;
          
          if   (FORILIMIT  < foriamt)  forided = FORILIMIT;
          else                         forided = foriamt;                  
          
          forided          = fmin(calctaxlimit,forided);   
          calctaxlimit     = fmax(calctaxlimit-forided, 0);  
          
          /*2015.12 jissi 연금계좌공제*/
          /*퇴직연금보험료 공제  MIN(퇴직연금불입액-MIN(연금저축불입액,400만원), 700만원) */
          if (npenamt + npenamt2 > 0)
               rpended = fmin(fmax(RPENDEDLIMIT - fmin(npenamt + npenamt2, NPENDEDLIMIT),0),rpenamt);
          else
               rpended = fmin(rpenamt, RPENDEDLIMIT);
        
          if (taxgross <= NPENLIMIT)
               rpentaxded = floor(rpended  * NPENRATE2 / 100);
          else            
               rpentaxded = floor(rpended  * NPENRATE  / 100);
        
          rpentaxded   = fmin(calctaxlimit,rpentaxded);
          calctaxlimit = fmax(calctaxlimit-rpentaxded, 0);
          
          if  (rpentaxded  <= 0)
               rpended     =  0;
         
          /* 연금저축공제  2013년 연금보험료 공제로 포함 -> 2014년 연금세액공제로 변경 2014.12*/      
          npended      = npenamt + npenamt2 ; 
          
          if  (npended > NPENDEDLIMIT) 
               npended = NPENDEDLIMIT; 
          /* 2015.04.24 jissi 연금저축 세액공제 총급여 5500만원 이하 15% 적용 */
          if (taxgross <= NPENLIMIT)
               npendtaxded  = floor(npended * NPENRATE2 / 100);
          else
               npendtaxded  = floor(npended * NPENRATE  / 100); 
          
          npendtaxded  = fmin(calctaxlimit,npendtaxded);
          calctaxlimit = fmax(calctaxlimit-npendtaxded, 0);
          /* 세액공제가 0일때 공제대상금액도 0 */
          if  (npendtaxded <= 0) 
               npended = 0;                       
          
          /*세액공제 합계*/
          tdedsum = incomtded + childtaxded 
                  + infanttaxded + addbabytaxded                /*2015.04.24 jissi  infanttaxded,addbabytaxded 추가*/       
                  + rpentaxded                     /*2015.12          jissi  퇴직연금세액공제 추가*/
                  + npendtaxded + taxdedsum + standded + hloanded + forided   
                  + etctded + houserenttaxded;  
              
          /* 갑근세 /주민세 / 농특세 START=====================================================================*/               
          dintax   = 0 ;
          djutax   = 0 ;  
          dnongtax = 0 ;                  
          if (calctax - tdedsum > 0) 
          {
              dintax = floor(calctax - tdedsum);
              djutax = floor(dintax * 0.1);              
          }                
          
          /* 농특세:주택자금공제,투자조합공제  */ 
          /* 장기집합투자저축longfundded  농특세 계산에서 삭제 2016.01.11*/
          if ((tinvestded + hsrentinded  + hloanded) > 0)  
          {  
               /*dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100) ; 계산방식 변경 2014.01*/  
               /* 계산방식 변경 2014.02*/   
               calctaxlevel = 0;
               calctaxlevel = chagamamt - ( pended                
                                          + housvsubded + housvcomded + housvempded   
                                          + creditded   + costockded  + longfundded /* 2016.01.11 jissi 장기집합투자저축 longfundded추가*/
                                          ) 
                                        + fmax(splimitovded-investded,0); /* 2016.01.11 jissi 장기집합투자저축 - longfundded삭제  // 장기집합투자저축 longfundded추가 2014.12 */
               
               dnongtax = floor(( hloanded + (GetTax(calctaxlevel) - calctax)) * NONGRATE / 100) ;               
               /*dnongtax = fmax(floor(dnongtax / 10) * 10, 0);    2014.01 손필영 요청 원단위 절사 뺌*/
          } 
          else
          {
               dnongtax = 0 ;
          }     
          
          intax    = mintax   + bintax;
          jutax    = mjutax   + bjutax;
          nongtax  = mnongtax + bnongtax;
          
          /*차감징수세액은 trunc 로 작업해야 함.dsa2000 */
          yintax   = trunc( (dintax   - intax  ) / 10 ) * 10;
          yjutax   = trunc( (djutax   - jutax  ) / 10 ) * 10;
          ynongtax = trunc( (dnongtax - nongtax) / 10 ) * 10;          
                   
          ycalctax = yintax + yjutax + ynongtax;
          
          UpdateResult();
     }
}

UpdateResult()
{
      /* exec sql
      update PKZRYMAS
         set mate            = :mate,  
             familyno        = :familyno,
             fami65no        = :fami65no,
             fami70no        = :fami70no, 
             childno         = :childno,
             babyno          = :babyno,            
             taxgross        = :taxgross,
             laborded        = :laborded,
             laboramt        = :laboramt,
             selfded         = :selfded,
             mateded         = :mateded,
             famided         = :famided,
             basicded        = :basicded,
             oldded          = :oldded,
             obsded          = :obsded,
             womanded        = :womanded,
             childded        = :childded,
             babyded         = :babyded,
             sparentded      = :sparentded,     /o2013.11  추가o/
             appendded       = :appendded,
             fewno           = :fewno,
             fewded          = :fewded,
             medded          = :medded,
             hireded         = :hireded,
             guarded         = :guarded,
             obsguarded      = :obsguarded,
             insded          = :insded,
             hosamt          = :hosamt,
             obshosded       = :obshosded,      /o2013.11  추가o/
             hosded          = :hosded,
             seduded         = :seduded,
             keduded         = :keduded,
             ceduded         = :ceduded,
             ueduded         = :ueduded,
             obseduded       = :obseduded,
             eduded          = :eduded,
             houseded        = :houseded,
             houseded2       = :houseded2,   
             houseded3       = :houseded3, 
             houserentded    = :houserentded,
             housvsubded     = :housvsubded,
             housvcomded     = :housvcomded,
             housvempded     = :housvempded,
             houseintded     = :houseintded,
             houseintded2    = :houseintded2,           	
             houseintded3    = :houseintded3,           		
             houseintded4    = :houseintded4,   /o2012.12  추가o/           		
             houseintded5    = :houseintded5,   /o2012.12  추가o/    
             agiveded        = :agiveded,
             politaxded      = :politaxded,
             spgivded        = :spgivded,
             pgiveded        = :pgiveded,
             pgiveded2       = :pgiveded2,
             npgiveamt       = :npgiveamt, 
             npgiveamt2      = :npgiveamt2,       
             giveded         = :giveded,
             specialded      = :specialded,
             standded        = :standded, 
             chagamamt       = :chagamamt,     /o2013.12 추가o/
             anuded          = :anuded,
             pended          = :pended,
             npended         = :npended,
             creditamt       = :creditamt,
             creditded       = :creditded,
             specaddded      = :specaddded,
             polided         = :polided,
             investded       = :investded,    
             investded2      = :investded2,    /o2013.11  추가o/ 
             oinvestded      = :oinvestded,
             tinvestded      = :tinvestded,  
             incomtded       = :incomtded,
             hloanded        = :hloanded,
             fundded         = :fundded,
             costockded      = :costockded,
             forided         = :forided,
             etctded         = :etctded,
             tdedsum         = :tdedsum,
             hsrentinded     = :hsrentinded,    /o2013.11  추가o/ 
             incomeded       = :incomeded,
             splimitovded    = :splimitovded,   /o2013.11  추가o/
             nepgiveded      = :nepgiveded,     /o2013.11  추가o/ 
             nepgiveded2     = :nepgiveded2,    /o2013.11  추가o/ 
             nagiveded       = :nagiveded,      /o2014.12  추가o/   
             npgiveded       = :npgiveded,      /o2014.12  추가o/
             npgiveded2      = :npgiveded2,     /o2014.12  추가o/
             ngiveded        = :ngiveded,       /o2014.12  추가o/
             investded3      = :investded3,     /o2014.12  추가o/
             longfundded     = :longfundded,    /o2014.12  추가o/
             childtaxded     = :childtaxded,    /o2014.12  추가o/
             infanttaxded    = :infanttaxded,   /o2015.04.24 jissi 추가 o/
             addbabytaxded   = :addbabytaxded,  /o2015.04.24 jissi 추가 o/  
             npendtaxded     = :npendtaxded,    /o2014.12  추가o/
             guartaxded      = :guartaxded,     /o2014.12  추가o/
             obsguartaxded   = :obsguartaxded,  /o2015.04.24 jissi 추가 o/
             hostaxded       = :hostaxded,      /o2014.12  추가o/
             edutaxded       = :edutaxded,      /o2014.12  추가o/
             polided1        = :polided1,       /o2014.12  추가o/
             polided2        = :polided2,       /o2014.12  추가o/
             politaxded1     = :politaxded1,    /o2014.12  추가o/
             politaxded2     = :politaxded2,    /o2014.12  추가o/
             agivetaxded     = :agivetaxded,    /o2014.12  추가o/
             pgivetaxded     = :pgivetaxded,    /o2014.12  추가o/
             taxdedsum       = :taxdedsum,      /o2014.12  추가o/
             houserenttaxded = :houserenttaxded,/o2014.12  추가o/
             npgiveamt2_2010 = :npgiveamt2_2010,/o2014.12  추가o/
             npgiveamt2_else = :npgiveamt2_else,/o2014.12  추가o/
             nagiveamt_2014  = :nagiveamt_2014 ,/o2015.12  추가o/
             npgiveamt_2014  = :npgiveamt_2014 ,/o2015.12  추가o/
             npgiveamt2_2014 = :npgiveamt2_2014,/o2015.12  추가o/
             nagiveded_2014  = :nagiveded_2014 ,/o2015.12  추가o/
             npgiveded_2014  = :npgiveded_2014 ,/o2015.12  추가o/
             npgiveded2_2014 = :npgiveded2_2014,/o2015.12  추가o/
             houseintded6    = :houseintded6   ,/o2015.12  추가o/
             houseintded7    = :houseintded7   ,/o2015.12  추가o/
             houseintded8    = :houseintded8   ,/o2015.12  추가o/
             houseintded9    = :houseintded9   ,/o2015.12  추가o/
             investded4      = :investded4     ,/o2015.12  추가o/
             rpended         = :rpended        ,/o2015.12  추가o/
             rpentaxded      = :rpentaxded     ,/o2015.12  추가o/	
             taxlevel        = :taxlevel,
             calctax         = :calctax,
             dintax          = :dintax,
             djutax          = :djutax,
             dnongtax        = :dnongtax,
             intax           = :intax,
             jutax           = :jutax,
             nongtax         = :nongtax,
             yintax          = :yintax,
             yjutax          = :yjutax,
             ynongtax        = :ynongtax,
             ycalctax        = :ycalctax,
             writetime       = to_char(sysdate,'yyyymmddhh24miss'),
             writeman        = :jobempno     
       Where empno           = :empno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 133;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlbuft((void **)0,
        "update PKZRYMAS  set mate=:b0,familyno=:b1,fami65no=:b2,fami70no=:b\
3,childno=:b4,babyno=:b5,taxgross=:b6,laborded=:b7,laboramt=:b8,selfded=:b9,\
mateded=:b10,famided=:b11,basicded=:b12,oldded=:b13,obsded=:b14,womanded=:b1\
5,childded=:b16,babyded=:b17,sparentded=:b18,appendded=:b19,fewno=:b20,fewde\
d=:b21,medded=:b22,hireded=:b23,guarded=:b24,obsguarded=:b25,insded=:b26,hos\
amt=:b27,obshosded=:b28,hosded=:b29,seduded=:b30,keduded=:b31,ceduded=:b32,u\
eduded=:b33,obseduded=:b34,eduded=:b35,houseded=:b36,houseded2=:b37,houseded\
3=:b38,houserentded=:b39,housvsubded=:b40,housvcomded=:b41,housvempded=:b42,\
houseintded=:b43,houseintded2=:b44,houseintded3=:b45,houseintded4=:b46,house\
intded5=:b47,agiveded=:b48,politaxded=:b49,spgivded=:b50,pgiveded=:b51,pgive\
ded2=:b52,npgiveamt=:b53,npgiveamt2=:b54,giveded=:b55,specialded=:b56,standd\
ed=:b57,chagamamt=:b58,anuded=:b59,pended=:b60,npended=:b61,creditamt=:b62,c\
reditded=:b63,specaddded=:b64,polided=:b65,investded=:b66,investded2=:b67,oi\
nvestded=:b68,tinvestded=:b69,incomtded=:b70,");
      sqlbuft((void **)0,
        "hloanded=:b71,fundded=:b72,costockded=:b73,forided=:b74,etctded=:b7\
5,tdedsum=:b76,hsrentinded=:b77,incomeded=:b78,splimitovded=:b79,nepgiveded=\
:b80,nepgiveded2=:b81,nagiveded=:b82,npgiveded=:b83,npgiveded2=:b84,ngiveded\
=:b85,investded3=:b86,longfundded=:b87,childtaxded=:b88,infanttaxded=:b89,ad\
dbabytaxded=:b90,npendtaxded=:b91,guartaxded=:b92,obsguartaxded=:b93,hostaxd\
ed=:b94,edutaxded=:b95,polided1=:b96,polided2=:b97,politaxded1=:b98,politaxd\
ed2=:b99,agivetaxded=:b100,pgivetaxded=:b101,taxdedsum=:b102,houserenttaxded\
=:b103,npgiveamt2_2010=:b104,npgiveamt2_else=:b105,nagiveamt_2014=:b106,npgi\
veamt_2014=:b107,npgiveamt2_2014=:b108,nagiveded_2014=:b109,npgiveded_2014=:\
b110,npgiveded2_2014=:b111,houseintded6=:b112,houseintded7=:b113,houseintded\
8=:b114,houseintded9=:b115,investded4=:b116,rpended=:b117,rpentaxded=:b118,t\
axlevel=:b119,calctax=:b120,dintax=:b121,djutax=:b122,dnongtax=:b123,intax=:\
b124,jutax=:b125,nongtax=:b126,yintax=:b127,yjutax=:b128,ynongtax=:b129,ycal\
ctax=:b130,writetime=to_char(sysdate,'yyyymmd");
      sqlstm.stmt = "dhh24miss'),writeman=:b131 where empno=:b132";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1385;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&mate;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)&familyno;
      sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)&fami65no;
      sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqhstv[3] = (unsigned char  *)&fami70no;
      sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[3] = (         int  )0;
      sqlstm.sqindv[3] = (         short *)0;
      sqlstm.sqinds[3] = (         int  )0;
      sqlstm.sqharm[3] = (unsigned long )0;
      sqlstm.sqadto[3] = (unsigned short )0;
      sqlstm.sqtdso[3] = (unsigned short )0;
      sqlstm.sqhstv[4] = (unsigned char  *)&childno;
      sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&babyno;
      sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[5] = (         int  )0;
      sqlstm.sqindv[5] = (         short *)0;
      sqlstm.sqinds[5] = (         int  )0;
      sqlstm.sqharm[5] = (unsigned long )0;
      sqlstm.sqadto[5] = (unsigned short )0;
      sqlstm.sqtdso[5] = (unsigned short )0;
      sqlstm.sqhstv[6] = (unsigned char  *)&taxgross;
      sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[6] = (         int  )0;
      sqlstm.sqindv[6] = (         short *)0;
      sqlstm.sqinds[6] = (         int  )0;
      sqlstm.sqharm[6] = (unsigned long )0;
      sqlstm.sqadto[6] = (unsigned short )0;
      sqlstm.sqtdso[6] = (unsigned short )0;
      sqlstm.sqhstv[7] = (unsigned char  *)&laborded;
      sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[7] = (         int  )0;
      sqlstm.sqindv[7] = (         short *)0;
      sqlstm.sqinds[7] = (         int  )0;
      sqlstm.sqharm[7] = (unsigned long )0;
      sqlstm.sqadto[7] = (unsigned short )0;
      sqlstm.sqtdso[7] = (unsigned short )0;
      sqlstm.sqhstv[8] = (unsigned char  *)&laboramt;
      sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[8] = (         int  )0;
      sqlstm.sqindv[8] = (         short *)0;
      sqlstm.sqinds[8] = (         int  )0;
      sqlstm.sqharm[8] = (unsigned long )0;
      sqlstm.sqadto[8] = (unsigned short )0;
      sqlstm.sqtdso[8] = (unsigned short )0;
      sqlstm.sqhstv[9] = (unsigned char  *)&selfded;
      sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[9] = (         int  )0;
      sqlstm.sqindv[9] = (         short *)0;
      sqlstm.sqinds[9] = (         int  )0;
      sqlstm.sqharm[9] = (unsigned long )0;
      sqlstm.sqadto[9] = (unsigned short )0;
      sqlstm.sqtdso[9] = (unsigned short )0;
      sqlstm.sqhstv[10] = (unsigned char  *)&mateded;
      sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[10] = (         int  )0;
      sqlstm.sqindv[10] = (         short *)0;
      sqlstm.sqinds[10] = (         int  )0;
      sqlstm.sqharm[10] = (unsigned long )0;
      sqlstm.sqadto[10] = (unsigned short )0;
      sqlstm.sqtdso[10] = (unsigned short )0;
      sqlstm.sqhstv[11] = (unsigned char  *)&famided;
      sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[11] = (         int  )0;
      sqlstm.sqindv[11] = (         short *)0;
      sqlstm.sqinds[11] = (         int  )0;
      sqlstm.sqharm[11] = (unsigned long )0;
      sqlstm.sqadto[11] = (unsigned short )0;
      sqlstm.sqtdso[11] = (unsigned short )0;
      sqlstm.sqhstv[12] = (unsigned char  *)&basicded;
      sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[12] = (         int  )0;
      sqlstm.sqindv[12] = (         short *)0;
      sqlstm.sqinds[12] = (         int  )0;
      sqlstm.sqharm[12] = (unsigned long )0;
      sqlstm.sqadto[12] = (unsigned short )0;
      sqlstm.sqtdso[12] = (unsigned short )0;
      sqlstm.sqhstv[13] = (unsigned char  *)&oldded;
      sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[13] = (         int  )0;
      sqlstm.sqindv[13] = (         short *)0;
      sqlstm.sqinds[13] = (         int  )0;
      sqlstm.sqharm[13] = (unsigned long )0;
      sqlstm.sqadto[13] = (unsigned short )0;
      sqlstm.sqtdso[13] = (unsigned short )0;
      sqlstm.sqhstv[14] = (unsigned char  *)&obsded;
      sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[14] = (         int  )0;
      sqlstm.sqindv[14] = (         short *)0;
      sqlstm.sqinds[14] = (         int  )0;
      sqlstm.sqharm[14] = (unsigned long )0;
      sqlstm.sqadto[14] = (unsigned short )0;
      sqlstm.sqtdso[14] = (unsigned short )0;
      sqlstm.sqhstv[15] = (unsigned char  *)&womanded;
      sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[15] = (         int  )0;
      sqlstm.sqindv[15] = (         short *)0;
      sqlstm.sqinds[15] = (         int  )0;
      sqlstm.sqharm[15] = (unsigned long )0;
      sqlstm.sqadto[15] = (unsigned short )0;
      sqlstm.sqtdso[15] = (unsigned short )0;
      sqlstm.sqhstv[16] = (unsigned char  *)&childded;
      sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[16] = (         int  )0;
      sqlstm.sqindv[16] = (         short *)0;
      sqlstm.sqinds[16] = (         int  )0;
      sqlstm.sqharm[16] = (unsigned long )0;
      sqlstm.sqadto[16] = (unsigned short )0;
      sqlstm.sqtdso[16] = (unsigned short )0;
      sqlstm.sqhstv[17] = (unsigned char  *)&babyded;
      sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[17] = (         int  )0;
      sqlstm.sqindv[17] = (         short *)0;
      sqlstm.sqinds[17] = (         int  )0;
      sqlstm.sqharm[17] = (unsigned long )0;
      sqlstm.sqadto[17] = (unsigned short )0;
      sqlstm.sqtdso[17] = (unsigned short )0;
      sqlstm.sqhstv[18] = (unsigned char  *)&sparentded;
      sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[18] = (         int  )0;
      sqlstm.sqindv[18] = (         short *)0;
      sqlstm.sqinds[18] = (         int  )0;
      sqlstm.sqharm[18] = (unsigned long )0;
      sqlstm.sqadto[18] = (unsigned short )0;
      sqlstm.sqtdso[18] = (unsigned short )0;
      sqlstm.sqhstv[19] = (unsigned char  *)&appendded;
      sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[19] = (         int  )0;
      sqlstm.sqindv[19] = (         short *)0;
      sqlstm.sqinds[19] = (         int  )0;
      sqlstm.sqharm[19] = (unsigned long )0;
      sqlstm.sqadto[19] = (unsigned short )0;
      sqlstm.sqtdso[19] = (unsigned short )0;
      sqlstm.sqhstv[20] = (unsigned char  *)&fewno;
      sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[20] = (         int  )0;
      sqlstm.sqindv[20] = (         short *)0;
      sqlstm.sqinds[20] = (         int  )0;
      sqlstm.sqharm[20] = (unsigned long )0;
      sqlstm.sqadto[20] = (unsigned short )0;
      sqlstm.sqtdso[20] = (unsigned short )0;
      sqlstm.sqhstv[21] = (unsigned char  *)&fewded;
      sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[21] = (         int  )0;
      sqlstm.sqindv[21] = (         short *)0;
      sqlstm.sqinds[21] = (         int  )0;
      sqlstm.sqharm[21] = (unsigned long )0;
      sqlstm.sqadto[21] = (unsigned short )0;
      sqlstm.sqtdso[21] = (unsigned short )0;
      sqlstm.sqhstv[22] = (unsigned char  *)&medded;
      sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[22] = (         int  )0;
      sqlstm.sqindv[22] = (         short *)0;
      sqlstm.sqinds[22] = (         int  )0;
      sqlstm.sqharm[22] = (unsigned long )0;
      sqlstm.sqadto[22] = (unsigned short )0;
      sqlstm.sqtdso[22] = (unsigned short )0;
      sqlstm.sqhstv[23] = (unsigned char  *)&hireded;
      sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[23] = (         int  )0;
      sqlstm.sqindv[23] = (         short *)0;
      sqlstm.sqinds[23] = (         int  )0;
      sqlstm.sqharm[23] = (unsigned long )0;
      sqlstm.sqadto[23] = (unsigned short )0;
      sqlstm.sqtdso[23] = (unsigned short )0;
      sqlstm.sqhstv[24] = (unsigned char  *)&guarded;
      sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[24] = (         int  )0;
      sqlstm.sqindv[24] = (         short *)0;
      sqlstm.sqinds[24] = (         int  )0;
      sqlstm.sqharm[24] = (unsigned long )0;
      sqlstm.sqadto[24] = (unsigned short )0;
      sqlstm.sqtdso[24] = (unsigned short )0;
      sqlstm.sqhstv[25] = (unsigned char  *)&obsguarded;
      sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[25] = (         int  )0;
      sqlstm.sqindv[25] = (         short *)0;
      sqlstm.sqinds[25] = (         int  )0;
      sqlstm.sqharm[25] = (unsigned long )0;
      sqlstm.sqadto[25] = (unsigned short )0;
      sqlstm.sqtdso[25] = (unsigned short )0;
      sqlstm.sqhstv[26] = (unsigned char  *)&insded;
      sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[26] = (         int  )0;
      sqlstm.sqindv[26] = (         short *)0;
      sqlstm.sqinds[26] = (         int  )0;
      sqlstm.sqharm[26] = (unsigned long )0;
      sqlstm.sqadto[26] = (unsigned short )0;
      sqlstm.sqtdso[26] = (unsigned short )0;
      sqlstm.sqhstv[27] = (unsigned char  *)&hosamt;
      sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[27] = (         int  )0;
      sqlstm.sqindv[27] = (         short *)0;
      sqlstm.sqinds[27] = (         int  )0;
      sqlstm.sqharm[27] = (unsigned long )0;
      sqlstm.sqadto[27] = (unsigned short )0;
      sqlstm.sqtdso[27] = (unsigned short )0;
      sqlstm.sqhstv[28] = (unsigned char  *)&obshosded;
      sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[28] = (         int  )0;
      sqlstm.sqindv[28] = (         short *)0;
      sqlstm.sqinds[28] = (         int  )0;
      sqlstm.sqharm[28] = (unsigned long )0;
      sqlstm.sqadto[28] = (unsigned short )0;
      sqlstm.sqtdso[28] = (unsigned short )0;
      sqlstm.sqhstv[29] = (unsigned char  *)&hosded;
      sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[29] = (         int  )0;
      sqlstm.sqindv[29] = (         short *)0;
      sqlstm.sqinds[29] = (         int  )0;
      sqlstm.sqharm[29] = (unsigned long )0;
      sqlstm.sqadto[29] = (unsigned short )0;
      sqlstm.sqtdso[29] = (unsigned short )0;
      sqlstm.sqhstv[30] = (unsigned char  *)&seduded;
      sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[30] = (         int  )0;
      sqlstm.sqindv[30] = (         short *)0;
      sqlstm.sqinds[30] = (         int  )0;
      sqlstm.sqharm[30] = (unsigned long )0;
      sqlstm.sqadto[30] = (unsigned short )0;
      sqlstm.sqtdso[30] = (unsigned short )0;
      sqlstm.sqhstv[31] = (unsigned char  *)&keduded;
      sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[31] = (         int  )0;
      sqlstm.sqindv[31] = (         short *)0;
      sqlstm.sqinds[31] = (         int  )0;
      sqlstm.sqharm[31] = (unsigned long )0;
      sqlstm.sqadto[31] = (unsigned short )0;
      sqlstm.sqtdso[31] = (unsigned short )0;
      sqlstm.sqhstv[32] = (unsigned char  *)&ceduded;
      sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[32] = (         int  )0;
      sqlstm.sqindv[32] = (         short *)0;
      sqlstm.sqinds[32] = (         int  )0;
      sqlstm.sqharm[32] = (unsigned long )0;
      sqlstm.sqadto[32] = (unsigned short )0;
      sqlstm.sqtdso[32] = (unsigned short )0;
      sqlstm.sqhstv[33] = (unsigned char  *)&ueduded;
      sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[33] = (         int  )0;
      sqlstm.sqindv[33] = (         short *)0;
      sqlstm.sqinds[33] = (         int  )0;
      sqlstm.sqharm[33] = (unsigned long )0;
      sqlstm.sqadto[33] = (unsigned short )0;
      sqlstm.sqtdso[33] = (unsigned short )0;
      sqlstm.sqhstv[34] = (unsigned char  *)&obseduded;
      sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[34] = (         int  )0;
      sqlstm.sqindv[34] = (         short *)0;
      sqlstm.sqinds[34] = (         int  )0;
      sqlstm.sqharm[34] = (unsigned long )0;
      sqlstm.sqadto[34] = (unsigned short )0;
      sqlstm.sqtdso[34] = (unsigned short )0;
      sqlstm.sqhstv[35] = (unsigned char  *)&eduded;
      sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[35] = (         int  )0;
      sqlstm.sqindv[35] = (         short *)0;
      sqlstm.sqinds[35] = (         int  )0;
      sqlstm.sqharm[35] = (unsigned long )0;
      sqlstm.sqadto[35] = (unsigned short )0;
      sqlstm.sqtdso[35] = (unsigned short )0;
      sqlstm.sqhstv[36] = (unsigned char  *)&houseded;
      sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[36] = (         int  )0;
      sqlstm.sqindv[36] = (         short *)0;
      sqlstm.sqinds[36] = (         int  )0;
      sqlstm.sqharm[36] = (unsigned long )0;
      sqlstm.sqadto[36] = (unsigned short )0;
      sqlstm.sqtdso[36] = (unsigned short )0;
      sqlstm.sqhstv[37] = (unsigned char  *)&houseded2;
      sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[37] = (         int  )0;
      sqlstm.sqindv[37] = (         short *)0;
      sqlstm.sqinds[37] = (         int  )0;
      sqlstm.sqharm[37] = (unsigned long )0;
      sqlstm.sqadto[37] = (unsigned short )0;
      sqlstm.sqtdso[37] = (unsigned short )0;
      sqlstm.sqhstv[38] = (unsigned char  *)&houseded3;
      sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[38] = (         int  )0;
      sqlstm.sqindv[38] = (         short *)0;
      sqlstm.sqinds[38] = (         int  )0;
      sqlstm.sqharm[38] = (unsigned long )0;
      sqlstm.sqadto[38] = (unsigned short )0;
      sqlstm.sqtdso[38] = (unsigned short )0;
      sqlstm.sqhstv[39] = (unsigned char  *)&houserentded;
      sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[39] = (         int  )0;
      sqlstm.sqindv[39] = (         short *)0;
      sqlstm.sqinds[39] = (         int  )0;
      sqlstm.sqharm[39] = (unsigned long )0;
      sqlstm.sqadto[39] = (unsigned short )0;
      sqlstm.sqtdso[39] = (unsigned short )0;
      sqlstm.sqhstv[40] = (unsigned char  *)&housvsubded;
      sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[40] = (         int  )0;
      sqlstm.sqindv[40] = (         short *)0;
      sqlstm.sqinds[40] = (         int  )0;
      sqlstm.sqharm[40] = (unsigned long )0;
      sqlstm.sqadto[40] = (unsigned short )0;
      sqlstm.sqtdso[40] = (unsigned short )0;
      sqlstm.sqhstv[41] = (unsigned char  *)&housvcomded;
      sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[41] = (         int  )0;
      sqlstm.sqindv[41] = (         short *)0;
      sqlstm.sqinds[41] = (         int  )0;
      sqlstm.sqharm[41] = (unsigned long )0;
      sqlstm.sqadto[41] = (unsigned short )0;
      sqlstm.sqtdso[41] = (unsigned short )0;
      sqlstm.sqhstv[42] = (unsigned char  *)&housvempded;
      sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[42] = (         int  )0;
      sqlstm.sqindv[42] = (         short *)0;
      sqlstm.sqinds[42] = (         int  )0;
      sqlstm.sqharm[42] = (unsigned long )0;
      sqlstm.sqadto[42] = (unsigned short )0;
      sqlstm.sqtdso[42] = (unsigned short )0;
      sqlstm.sqhstv[43] = (unsigned char  *)&houseintded;
      sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[43] = (         int  )0;
      sqlstm.sqindv[43] = (         short *)0;
      sqlstm.sqinds[43] = (         int  )0;
      sqlstm.sqharm[43] = (unsigned long )0;
      sqlstm.sqadto[43] = (unsigned short )0;
      sqlstm.sqtdso[43] = (unsigned short )0;
      sqlstm.sqhstv[44] = (unsigned char  *)&houseintded2;
      sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[44] = (         int  )0;
      sqlstm.sqindv[44] = (         short *)0;
      sqlstm.sqinds[44] = (         int  )0;
      sqlstm.sqharm[44] = (unsigned long )0;
      sqlstm.sqadto[44] = (unsigned short )0;
      sqlstm.sqtdso[44] = (unsigned short )0;
      sqlstm.sqhstv[45] = (unsigned char  *)&houseintded3;
      sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[45] = (         int  )0;
      sqlstm.sqindv[45] = (         short *)0;
      sqlstm.sqinds[45] = (         int  )0;
      sqlstm.sqharm[45] = (unsigned long )0;
      sqlstm.sqadto[45] = (unsigned short )0;
      sqlstm.sqtdso[45] = (unsigned short )0;
      sqlstm.sqhstv[46] = (unsigned char  *)&houseintded4;
      sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[46] = (         int  )0;
      sqlstm.sqindv[46] = (         short *)0;
      sqlstm.sqinds[46] = (         int  )0;
      sqlstm.sqharm[46] = (unsigned long )0;
      sqlstm.sqadto[46] = (unsigned short )0;
      sqlstm.sqtdso[46] = (unsigned short )0;
      sqlstm.sqhstv[47] = (unsigned char  *)&houseintded5;
      sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[47] = (         int  )0;
      sqlstm.sqindv[47] = (         short *)0;
      sqlstm.sqinds[47] = (         int  )0;
      sqlstm.sqharm[47] = (unsigned long )0;
      sqlstm.sqadto[47] = (unsigned short )0;
      sqlstm.sqtdso[47] = (unsigned short )0;
      sqlstm.sqhstv[48] = (unsigned char  *)&agiveded;
      sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[48] = (         int  )0;
      sqlstm.sqindv[48] = (         short *)0;
      sqlstm.sqinds[48] = (         int  )0;
      sqlstm.sqharm[48] = (unsigned long )0;
      sqlstm.sqadto[48] = (unsigned short )0;
      sqlstm.sqtdso[48] = (unsigned short )0;
      sqlstm.sqhstv[49] = (unsigned char  *)&politaxded;
      sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[49] = (         int  )0;
      sqlstm.sqindv[49] = (         short *)0;
      sqlstm.sqinds[49] = (         int  )0;
      sqlstm.sqharm[49] = (unsigned long )0;
      sqlstm.sqadto[49] = (unsigned short )0;
      sqlstm.sqtdso[49] = (unsigned short )0;
      sqlstm.sqhstv[50] = (unsigned char  *)&spgivded;
      sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[50] = (         int  )0;
      sqlstm.sqindv[50] = (         short *)0;
      sqlstm.sqinds[50] = (         int  )0;
      sqlstm.sqharm[50] = (unsigned long )0;
      sqlstm.sqadto[50] = (unsigned short )0;
      sqlstm.sqtdso[50] = (unsigned short )0;
      sqlstm.sqhstv[51] = (unsigned char  *)&pgiveded;
      sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[51] = (         int  )0;
      sqlstm.sqindv[51] = (         short *)0;
      sqlstm.sqinds[51] = (         int  )0;
      sqlstm.sqharm[51] = (unsigned long )0;
      sqlstm.sqadto[51] = (unsigned short )0;
      sqlstm.sqtdso[51] = (unsigned short )0;
      sqlstm.sqhstv[52] = (unsigned char  *)&pgiveded2;
      sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[52] = (         int  )0;
      sqlstm.sqindv[52] = (         short *)0;
      sqlstm.sqinds[52] = (         int  )0;
      sqlstm.sqharm[52] = (unsigned long )0;
      sqlstm.sqadto[52] = (unsigned short )0;
      sqlstm.sqtdso[52] = (unsigned short )0;
      sqlstm.sqhstv[53] = (unsigned char  *)&npgiveamt;
      sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[53] = (         int  )0;
      sqlstm.sqindv[53] = (         short *)0;
      sqlstm.sqinds[53] = (         int  )0;
      sqlstm.sqharm[53] = (unsigned long )0;
      sqlstm.sqadto[53] = (unsigned short )0;
      sqlstm.sqtdso[53] = (unsigned short )0;
      sqlstm.sqhstv[54] = (unsigned char  *)&npgiveamt2;
      sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[54] = (         int  )0;
      sqlstm.sqindv[54] = (         short *)0;
      sqlstm.sqinds[54] = (         int  )0;
      sqlstm.sqharm[54] = (unsigned long )0;
      sqlstm.sqadto[54] = (unsigned short )0;
      sqlstm.sqtdso[54] = (unsigned short )0;
      sqlstm.sqhstv[55] = (unsigned char  *)&giveded;
      sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[55] = (         int  )0;
      sqlstm.sqindv[55] = (         short *)0;
      sqlstm.sqinds[55] = (         int  )0;
      sqlstm.sqharm[55] = (unsigned long )0;
      sqlstm.sqadto[55] = (unsigned short )0;
      sqlstm.sqtdso[55] = (unsigned short )0;
      sqlstm.sqhstv[56] = (unsigned char  *)&specialded;
      sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[56] = (         int  )0;
      sqlstm.sqindv[56] = (         short *)0;
      sqlstm.sqinds[56] = (         int  )0;
      sqlstm.sqharm[56] = (unsigned long )0;
      sqlstm.sqadto[56] = (unsigned short )0;
      sqlstm.sqtdso[56] = (unsigned short )0;
      sqlstm.sqhstv[57] = (unsigned char  *)&standded;
      sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[57] = (         int  )0;
      sqlstm.sqindv[57] = (         short *)0;
      sqlstm.sqinds[57] = (         int  )0;
      sqlstm.sqharm[57] = (unsigned long )0;
      sqlstm.sqadto[57] = (unsigned short )0;
      sqlstm.sqtdso[57] = (unsigned short )0;
      sqlstm.sqhstv[58] = (unsigned char  *)&chagamamt;
      sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[58] = (         int  )0;
      sqlstm.sqindv[58] = (         short *)0;
      sqlstm.sqinds[58] = (         int  )0;
      sqlstm.sqharm[58] = (unsigned long )0;
      sqlstm.sqadto[58] = (unsigned short )0;
      sqlstm.sqtdso[58] = (unsigned short )0;
      sqlstm.sqhstv[59] = (unsigned char  *)&anuded;
      sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[59] = (         int  )0;
      sqlstm.sqindv[59] = (         short *)0;
      sqlstm.sqinds[59] = (         int  )0;
      sqlstm.sqharm[59] = (unsigned long )0;
      sqlstm.sqadto[59] = (unsigned short )0;
      sqlstm.sqtdso[59] = (unsigned short )0;
      sqlstm.sqhstv[60] = (unsigned char  *)&pended;
      sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[60] = (         int  )0;
      sqlstm.sqindv[60] = (         short *)0;
      sqlstm.sqinds[60] = (         int  )0;
      sqlstm.sqharm[60] = (unsigned long )0;
      sqlstm.sqadto[60] = (unsigned short )0;
      sqlstm.sqtdso[60] = (unsigned short )0;
      sqlstm.sqhstv[61] = (unsigned char  *)&npended;
      sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[61] = (         int  )0;
      sqlstm.sqindv[61] = (         short *)0;
      sqlstm.sqinds[61] = (         int  )0;
      sqlstm.sqharm[61] = (unsigned long )0;
      sqlstm.sqadto[61] = (unsigned short )0;
      sqlstm.sqtdso[61] = (unsigned short )0;
      sqlstm.sqhstv[62] = (unsigned char  *)&creditamt;
      sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[62] = (         int  )0;
      sqlstm.sqindv[62] = (         short *)0;
      sqlstm.sqinds[62] = (         int  )0;
      sqlstm.sqharm[62] = (unsigned long )0;
      sqlstm.sqadto[62] = (unsigned short )0;
      sqlstm.sqtdso[62] = (unsigned short )0;
      sqlstm.sqhstv[63] = (unsigned char  *)&creditded;
      sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[63] = (         int  )0;
      sqlstm.sqindv[63] = (         short *)0;
      sqlstm.sqinds[63] = (         int  )0;
      sqlstm.sqharm[63] = (unsigned long )0;
      sqlstm.sqadto[63] = (unsigned short )0;
      sqlstm.sqtdso[63] = (unsigned short )0;
      sqlstm.sqhstv[64] = (unsigned char  *)&specaddded;
      sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[64] = (         int  )0;
      sqlstm.sqindv[64] = (         short *)0;
      sqlstm.sqinds[64] = (         int  )0;
      sqlstm.sqharm[64] = (unsigned long )0;
      sqlstm.sqadto[64] = (unsigned short )0;
      sqlstm.sqtdso[64] = (unsigned short )0;
      sqlstm.sqhstv[65] = (unsigned char  *)&polided;
      sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[65] = (         int  )0;
      sqlstm.sqindv[65] = (         short *)0;
      sqlstm.sqinds[65] = (         int  )0;
      sqlstm.sqharm[65] = (unsigned long )0;
      sqlstm.sqadto[65] = (unsigned short )0;
      sqlstm.sqtdso[65] = (unsigned short )0;
      sqlstm.sqhstv[66] = (unsigned char  *)&investded;
      sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[66] = (         int  )0;
      sqlstm.sqindv[66] = (         short *)0;
      sqlstm.sqinds[66] = (         int  )0;
      sqlstm.sqharm[66] = (unsigned long )0;
      sqlstm.sqadto[66] = (unsigned short )0;
      sqlstm.sqtdso[66] = (unsigned short )0;
      sqlstm.sqhstv[67] = (unsigned char  *)&investded2;
      sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[67] = (         int  )0;
      sqlstm.sqindv[67] = (         short *)0;
      sqlstm.sqinds[67] = (         int  )0;
      sqlstm.sqharm[67] = (unsigned long )0;
      sqlstm.sqadto[67] = (unsigned short )0;
      sqlstm.sqtdso[67] = (unsigned short )0;
      sqlstm.sqhstv[68] = (unsigned char  *)&oinvestded;
      sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[68] = (         int  )0;
      sqlstm.sqindv[68] = (         short *)0;
      sqlstm.sqinds[68] = (         int  )0;
      sqlstm.sqharm[68] = (unsigned long )0;
      sqlstm.sqadto[68] = (unsigned short )0;
      sqlstm.sqtdso[68] = (unsigned short )0;
      sqlstm.sqhstv[69] = (unsigned char  *)&tinvestded;
      sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[69] = (         int  )0;
      sqlstm.sqindv[69] = (         short *)0;
      sqlstm.sqinds[69] = (         int  )0;
      sqlstm.sqharm[69] = (unsigned long )0;
      sqlstm.sqadto[69] = (unsigned short )0;
      sqlstm.sqtdso[69] = (unsigned short )0;
      sqlstm.sqhstv[70] = (unsigned char  *)&incomtded;
      sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[70] = (         int  )0;
      sqlstm.sqindv[70] = (         short *)0;
      sqlstm.sqinds[70] = (         int  )0;
      sqlstm.sqharm[70] = (unsigned long )0;
      sqlstm.sqadto[70] = (unsigned short )0;
      sqlstm.sqtdso[70] = (unsigned short )0;
      sqlstm.sqhstv[71] = (unsigned char  *)&hloanded;
      sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[71] = (         int  )0;
      sqlstm.sqindv[71] = (         short *)0;
      sqlstm.sqinds[71] = (         int  )0;
      sqlstm.sqharm[71] = (unsigned long )0;
      sqlstm.sqadto[71] = (unsigned short )0;
      sqlstm.sqtdso[71] = (unsigned short )0;
      sqlstm.sqhstv[72] = (unsigned char  *)&fundded;
      sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[72] = (         int  )0;
      sqlstm.sqindv[72] = (         short *)0;
      sqlstm.sqinds[72] = (         int  )0;
      sqlstm.sqharm[72] = (unsigned long )0;
      sqlstm.sqadto[72] = (unsigned short )0;
      sqlstm.sqtdso[72] = (unsigned short )0;
      sqlstm.sqhstv[73] = (unsigned char  *)&costockded;
      sqlstm.sqhstl[73] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[73] = (         int  )0;
      sqlstm.sqindv[73] = (         short *)0;
      sqlstm.sqinds[73] = (         int  )0;
      sqlstm.sqharm[73] = (unsigned long )0;
      sqlstm.sqadto[73] = (unsigned short )0;
      sqlstm.sqtdso[73] = (unsigned short )0;
      sqlstm.sqhstv[74] = (unsigned char  *)&forided;
      sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[74] = (         int  )0;
      sqlstm.sqindv[74] = (         short *)0;
      sqlstm.sqinds[74] = (         int  )0;
      sqlstm.sqharm[74] = (unsigned long )0;
      sqlstm.sqadto[74] = (unsigned short )0;
      sqlstm.sqtdso[74] = (unsigned short )0;
      sqlstm.sqhstv[75] = (unsigned char  *)&etctded;
      sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[75] = (         int  )0;
      sqlstm.sqindv[75] = (         short *)0;
      sqlstm.sqinds[75] = (         int  )0;
      sqlstm.sqharm[75] = (unsigned long )0;
      sqlstm.sqadto[75] = (unsigned short )0;
      sqlstm.sqtdso[75] = (unsigned short )0;
      sqlstm.sqhstv[76] = (unsigned char  *)&tdedsum;
      sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[76] = (         int  )0;
      sqlstm.sqindv[76] = (         short *)0;
      sqlstm.sqinds[76] = (         int  )0;
      sqlstm.sqharm[76] = (unsigned long )0;
      sqlstm.sqadto[76] = (unsigned short )0;
      sqlstm.sqtdso[76] = (unsigned short )0;
      sqlstm.sqhstv[77] = (unsigned char  *)&hsrentinded;
      sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[77] = (         int  )0;
      sqlstm.sqindv[77] = (         short *)0;
      sqlstm.sqinds[77] = (         int  )0;
      sqlstm.sqharm[77] = (unsigned long )0;
      sqlstm.sqadto[77] = (unsigned short )0;
      sqlstm.sqtdso[77] = (unsigned short )0;
      sqlstm.sqhstv[78] = (unsigned char  *)&incomeded;
      sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[78] = (         int  )0;
      sqlstm.sqindv[78] = (         short *)0;
      sqlstm.sqinds[78] = (         int  )0;
      sqlstm.sqharm[78] = (unsigned long )0;
      sqlstm.sqadto[78] = (unsigned short )0;
      sqlstm.sqtdso[78] = (unsigned short )0;
      sqlstm.sqhstv[79] = (unsigned char  *)&splimitovded;
      sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[79] = (         int  )0;
      sqlstm.sqindv[79] = (         short *)0;
      sqlstm.sqinds[79] = (         int  )0;
      sqlstm.sqharm[79] = (unsigned long )0;
      sqlstm.sqadto[79] = (unsigned short )0;
      sqlstm.sqtdso[79] = (unsigned short )0;
      sqlstm.sqhstv[80] = (unsigned char  *)&nepgiveded;
      sqlstm.sqhstl[80] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[80] = (         int  )0;
      sqlstm.sqindv[80] = (         short *)0;
      sqlstm.sqinds[80] = (         int  )0;
      sqlstm.sqharm[80] = (unsigned long )0;
      sqlstm.sqadto[80] = (unsigned short )0;
      sqlstm.sqtdso[80] = (unsigned short )0;
      sqlstm.sqhstv[81] = (unsigned char  *)&nepgiveded2;
      sqlstm.sqhstl[81] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[81] = (         int  )0;
      sqlstm.sqindv[81] = (         short *)0;
      sqlstm.sqinds[81] = (         int  )0;
      sqlstm.sqharm[81] = (unsigned long )0;
      sqlstm.sqadto[81] = (unsigned short )0;
      sqlstm.sqtdso[81] = (unsigned short )0;
      sqlstm.sqhstv[82] = (unsigned char  *)&nagiveded;
      sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[82] = (         int  )0;
      sqlstm.sqindv[82] = (         short *)0;
      sqlstm.sqinds[82] = (         int  )0;
      sqlstm.sqharm[82] = (unsigned long )0;
      sqlstm.sqadto[82] = (unsigned short )0;
      sqlstm.sqtdso[82] = (unsigned short )0;
      sqlstm.sqhstv[83] = (unsigned char  *)&npgiveded;
      sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[83] = (         int  )0;
      sqlstm.sqindv[83] = (         short *)0;
      sqlstm.sqinds[83] = (         int  )0;
      sqlstm.sqharm[83] = (unsigned long )0;
      sqlstm.sqadto[83] = (unsigned short )0;
      sqlstm.sqtdso[83] = (unsigned short )0;
      sqlstm.sqhstv[84] = (unsigned char  *)&npgiveded2;
      sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[84] = (         int  )0;
      sqlstm.sqindv[84] = (         short *)0;
      sqlstm.sqinds[84] = (         int  )0;
      sqlstm.sqharm[84] = (unsigned long )0;
      sqlstm.sqadto[84] = (unsigned short )0;
      sqlstm.sqtdso[84] = (unsigned short )0;
      sqlstm.sqhstv[85] = (unsigned char  *)&ngiveded;
      sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[85] = (         int  )0;
      sqlstm.sqindv[85] = (         short *)0;
      sqlstm.sqinds[85] = (         int  )0;
      sqlstm.sqharm[85] = (unsigned long )0;
      sqlstm.sqadto[85] = (unsigned short )0;
      sqlstm.sqtdso[85] = (unsigned short )0;
      sqlstm.sqhstv[86] = (unsigned char  *)&investded3;
      sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[86] = (         int  )0;
      sqlstm.sqindv[86] = (         short *)0;
      sqlstm.sqinds[86] = (         int  )0;
      sqlstm.sqharm[86] = (unsigned long )0;
      sqlstm.sqadto[86] = (unsigned short )0;
      sqlstm.sqtdso[86] = (unsigned short )0;
      sqlstm.sqhstv[87] = (unsigned char  *)&longfundded;
      sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[87] = (         int  )0;
      sqlstm.sqindv[87] = (         short *)0;
      sqlstm.sqinds[87] = (         int  )0;
      sqlstm.sqharm[87] = (unsigned long )0;
      sqlstm.sqadto[87] = (unsigned short )0;
      sqlstm.sqtdso[87] = (unsigned short )0;
      sqlstm.sqhstv[88] = (unsigned char  *)&childtaxded;
      sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[88] = (         int  )0;
      sqlstm.sqindv[88] = (         short *)0;
      sqlstm.sqinds[88] = (         int  )0;
      sqlstm.sqharm[88] = (unsigned long )0;
      sqlstm.sqadto[88] = (unsigned short )0;
      sqlstm.sqtdso[88] = (unsigned short )0;
      sqlstm.sqhstv[89] = (unsigned char  *)&infanttaxded;
      sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[89] = (         int  )0;
      sqlstm.sqindv[89] = (         short *)0;
      sqlstm.sqinds[89] = (         int  )0;
      sqlstm.sqharm[89] = (unsigned long )0;
      sqlstm.sqadto[89] = (unsigned short )0;
      sqlstm.sqtdso[89] = (unsigned short )0;
      sqlstm.sqhstv[90] = (unsigned char  *)&addbabytaxded;
      sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[90] = (         int  )0;
      sqlstm.sqindv[90] = (         short *)0;
      sqlstm.sqinds[90] = (         int  )0;
      sqlstm.sqharm[90] = (unsigned long )0;
      sqlstm.sqadto[90] = (unsigned short )0;
      sqlstm.sqtdso[90] = (unsigned short )0;
      sqlstm.sqhstv[91] = (unsigned char  *)&npendtaxded;
      sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[91] = (         int  )0;
      sqlstm.sqindv[91] = (         short *)0;
      sqlstm.sqinds[91] = (         int  )0;
      sqlstm.sqharm[91] = (unsigned long )0;
      sqlstm.sqadto[91] = (unsigned short )0;
      sqlstm.sqtdso[91] = (unsigned short )0;
      sqlstm.sqhstv[92] = (unsigned char  *)&guartaxded;
      sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[92] = (         int  )0;
      sqlstm.sqindv[92] = (         short *)0;
      sqlstm.sqinds[92] = (         int  )0;
      sqlstm.sqharm[92] = (unsigned long )0;
      sqlstm.sqadto[92] = (unsigned short )0;
      sqlstm.sqtdso[92] = (unsigned short )0;
      sqlstm.sqhstv[93] = (unsigned char  *)&obsguartaxded;
      sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[93] = (         int  )0;
      sqlstm.sqindv[93] = (         short *)0;
      sqlstm.sqinds[93] = (         int  )0;
      sqlstm.sqharm[93] = (unsigned long )0;
      sqlstm.sqadto[93] = (unsigned short )0;
      sqlstm.sqtdso[93] = (unsigned short )0;
      sqlstm.sqhstv[94] = (unsigned char  *)&hostaxded;
      sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[94] = (         int  )0;
      sqlstm.sqindv[94] = (         short *)0;
      sqlstm.sqinds[94] = (         int  )0;
      sqlstm.sqharm[94] = (unsigned long )0;
      sqlstm.sqadto[94] = (unsigned short )0;
      sqlstm.sqtdso[94] = (unsigned short )0;
      sqlstm.sqhstv[95] = (unsigned char  *)&edutaxded;
      sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[95] = (         int  )0;
      sqlstm.sqindv[95] = (         short *)0;
      sqlstm.sqinds[95] = (         int  )0;
      sqlstm.sqharm[95] = (unsigned long )0;
      sqlstm.sqadto[95] = (unsigned short )0;
      sqlstm.sqtdso[95] = (unsigned short )0;
      sqlstm.sqhstv[96] = (unsigned char  *)&polided1;
      sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[96] = (         int  )0;
      sqlstm.sqindv[96] = (         short *)0;
      sqlstm.sqinds[96] = (         int  )0;
      sqlstm.sqharm[96] = (unsigned long )0;
      sqlstm.sqadto[96] = (unsigned short )0;
      sqlstm.sqtdso[96] = (unsigned short )0;
      sqlstm.sqhstv[97] = (unsigned char  *)&polided2;
      sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[97] = (         int  )0;
      sqlstm.sqindv[97] = (         short *)0;
      sqlstm.sqinds[97] = (         int  )0;
      sqlstm.sqharm[97] = (unsigned long )0;
      sqlstm.sqadto[97] = (unsigned short )0;
      sqlstm.sqtdso[97] = (unsigned short )0;
      sqlstm.sqhstv[98] = (unsigned char  *)&politaxded1;
      sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[98] = (         int  )0;
      sqlstm.sqindv[98] = (         short *)0;
      sqlstm.sqinds[98] = (         int  )0;
      sqlstm.sqharm[98] = (unsigned long )0;
      sqlstm.sqadto[98] = (unsigned short )0;
      sqlstm.sqtdso[98] = (unsigned short )0;
      sqlstm.sqhstv[99] = (unsigned char  *)&politaxded2;
      sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[99] = (         int  )0;
      sqlstm.sqindv[99] = (         short *)0;
      sqlstm.sqinds[99] = (         int  )0;
      sqlstm.sqharm[99] = (unsigned long )0;
      sqlstm.sqadto[99] = (unsigned short )0;
      sqlstm.sqtdso[99] = (unsigned short )0;
      sqlstm.sqhstv[100] = (unsigned char  *)&agivetaxded;
      sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[100] = (         int  )0;
      sqlstm.sqindv[100] = (         short *)0;
      sqlstm.sqinds[100] = (         int  )0;
      sqlstm.sqharm[100] = (unsigned long )0;
      sqlstm.sqadto[100] = (unsigned short )0;
      sqlstm.sqtdso[100] = (unsigned short )0;
      sqlstm.sqhstv[101] = (unsigned char  *)&pgivetaxded;
      sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[101] = (         int  )0;
      sqlstm.sqindv[101] = (         short *)0;
      sqlstm.sqinds[101] = (         int  )0;
      sqlstm.sqharm[101] = (unsigned long )0;
      sqlstm.sqadto[101] = (unsigned short )0;
      sqlstm.sqtdso[101] = (unsigned short )0;
      sqlstm.sqhstv[102] = (unsigned char  *)&taxdedsum;
      sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[102] = (         int  )0;
      sqlstm.sqindv[102] = (         short *)0;
      sqlstm.sqinds[102] = (         int  )0;
      sqlstm.sqharm[102] = (unsigned long )0;
      sqlstm.sqadto[102] = (unsigned short )0;
      sqlstm.sqtdso[102] = (unsigned short )0;
      sqlstm.sqhstv[103] = (unsigned char  *)&houserenttaxded;
      sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[103] = (         int  )0;
      sqlstm.sqindv[103] = (         short *)0;
      sqlstm.sqinds[103] = (         int  )0;
      sqlstm.sqharm[103] = (unsigned long )0;
      sqlstm.sqadto[103] = (unsigned short )0;
      sqlstm.sqtdso[103] = (unsigned short )0;
      sqlstm.sqhstv[104] = (unsigned char  *)&npgiveamt2_2010;
      sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[104] = (         int  )0;
      sqlstm.sqindv[104] = (         short *)0;
      sqlstm.sqinds[104] = (         int  )0;
      sqlstm.sqharm[104] = (unsigned long )0;
      sqlstm.sqadto[104] = (unsigned short )0;
      sqlstm.sqtdso[104] = (unsigned short )0;
      sqlstm.sqhstv[105] = (unsigned char  *)&npgiveamt2_else;
      sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[105] = (         int  )0;
      sqlstm.sqindv[105] = (         short *)0;
      sqlstm.sqinds[105] = (         int  )0;
      sqlstm.sqharm[105] = (unsigned long )0;
      sqlstm.sqadto[105] = (unsigned short )0;
      sqlstm.sqtdso[105] = (unsigned short )0;
      sqlstm.sqhstv[106] = (unsigned char  *)&nagiveamt_2014;
      sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[106] = (         int  )0;
      sqlstm.sqindv[106] = (         short *)0;
      sqlstm.sqinds[106] = (         int  )0;
      sqlstm.sqharm[106] = (unsigned long )0;
      sqlstm.sqadto[106] = (unsigned short )0;
      sqlstm.sqtdso[106] = (unsigned short )0;
      sqlstm.sqhstv[107] = (unsigned char  *)&npgiveamt_2014;
      sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[107] = (         int  )0;
      sqlstm.sqindv[107] = (         short *)0;
      sqlstm.sqinds[107] = (         int  )0;
      sqlstm.sqharm[107] = (unsigned long )0;
      sqlstm.sqadto[107] = (unsigned short )0;
      sqlstm.sqtdso[107] = (unsigned short )0;
      sqlstm.sqhstv[108] = (unsigned char  *)&npgiveamt2_2014;
      sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[108] = (         int  )0;
      sqlstm.sqindv[108] = (         short *)0;
      sqlstm.sqinds[108] = (         int  )0;
      sqlstm.sqharm[108] = (unsigned long )0;
      sqlstm.sqadto[108] = (unsigned short )0;
      sqlstm.sqtdso[108] = (unsigned short )0;
      sqlstm.sqhstv[109] = (unsigned char  *)&nagiveded_2014;
      sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[109] = (         int  )0;
      sqlstm.sqindv[109] = (         short *)0;
      sqlstm.sqinds[109] = (         int  )0;
      sqlstm.sqharm[109] = (unsigned long )0;
      sqlstm.sqadto[109] = (unsigned short )0;
      sqlstm.sqtdso[109] = (unsigned short )0;
      sqlstm.sqhstv[110] = (unsigned char  *)&npgiveded_2014;
      sqlstm.sqhstl[110] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[110] = (         int  )0;
      sqlstm.sqindv[110] = (         short *)0;
      sqlstm.sqinds[110] = (         int  )0;
      sqlstm.sqharm[110] = (unsigned long )0;
      sqlstm.sqadto[110] = (unsigned short )0;
      sqlstm.sqtdso[110] = (unsigned short )0;
      sqlstm.sqhstv[111] = (unsigned char  *)&npgiveded2_2014;
      sqlstm.sqhstl[111] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[111] = (         int  )0;
      sqlstm.sqindv[111] = (         short *)0;
      sqlstm.sqinds[111] = (         int  )0;
      sqlstm.sqharm[111] = (unsigned long )0;
      sqlstm.sqadto[111] = (unsigned short )0;
      sqlstm.sqtdso[111] = (unsigned short )0;
      sqlstm.sqhstv[112] = (unsigned char  *)&houseintded6;
      sqlstm.sqhstl[112] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[112] = (         int  )0;
      sqlstm.sqindv[112] = (         short *)0;
      sqlstm.sqinds[112] = (         int  )0;
      sqlstm.sqharm[112] = (unsigned long )0;
      sqlstm.sqadto[112] = (unsigned short )0;
      sqlstm.sqtdso[112] = (unsigned short )0;
      sqlstm.sqhstv[113] = (unsigned char  *)&houseintded7;
      sqlstm.sqhstl[113] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[113] = (         int  )0;
      sqlstm.sqindv[113] = (         short *)0;
      sqlstm.sqinds[113] = (         int  )0;
      sqlstm.sqharm[113] = (unsigned long )0;
      sqlstm.sqadto[113] = (unsigned short )0;
      sqlstm.sqtdso[113] = (unsigned short )0;
      sqlstm.sqhstv[114] = (unsigned char  *)&houseintded8;
      sqlstm.sqhstl[114] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[114] = (         int  )0;
      sqlstm.sqindv[114] = (         short *)0;
      sqlstm.sqinds[114] = (         int  )0;
      sqlstm.sqharm[114] = (unsigned long )0;
      sqlstm.sqadto[114] = (unsigned short )0;
      sqlstm.sqtdso[114] = (unsigned short )0;
      sqlstm.sqhstv[115] = (unsigned char  *)&houseintded9;
      sqlstm.sqhstl[115] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[115] = (         int  )0;
      sqlstm.sqindv[115] = (         short *)0;
      sqlstm.sqinds[115] = (         int  )0;
      sqlstm.sqharm[115] = (unsigned long )0;
      sqlstm.sqadto[115] = (unsigned short )0;
      sqlstm.sqtdso[115] = (unsigned short )0;
      sqlstm.sqhstv[116] = (unsigned char  *)&investded4;
      sqlstm.sqhstl[116] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[116] = (         int  )0;
      sqlstm.sqindv[116] = (         short *)0;
      sqlstm.sqinds[116] = (         int  )0;
      sqlstm.sqharm[116] = (unsigned long )0;
      sqlstm.sqadto[116] = (unsigned short )0;
      sqlstm.sqtdso[116] = (unsigned short )0;
      sqlstm.sqhstv[117] = (unsigned char  *)&rpended;
      sqlstm.sqhstl[117] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[117] = (         int  )0;
      sqlstm.sqindv[117] = (         short *)0;
      sqlstm.sqinds[117] = (         int  )0;
      sqlstm.sqharm[117] = (unsigned long )0;
      sqlstm.sqadto[117] = (unsigned short )0;
      sqlstm.sqtdso[117] = (unsigned short )0;
      sqlstm.sqhstv[118] = (unsigned char  *)&rpentaxded;
      sqlstm.sqhstl[118] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[118] = (         int  )0;
      sqlstm.sqindv[118] = (         short *)0;
      sqlstm.sqinds[118] = (         int  )0;
      sqlstm.sqharm[118] = (unsigned long )0;
      sqlstm.sqadto[118] = (unsigned short )0;
      sqlstm.sqtdso[118] = (unsigned short )0;
      sqlstm.sqhstv[119] = (unsigned char  *)&taxlevel;
      sqlstm.sqhstl[119] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[119] = (         int  )0;
      sqlstm.sqindv[119] = (         short *)0;
      sqlstm.sqinds[119] = (         int  )0;
      sqlstm.sqharm[119] = (unsigned long )0;
      sqlstm.sqadto[119] = (unsigned short )0;
      sqlstm.sqtdso[119] = (unsigned short )0;
      sqlstm.sqhstv[120] = (unsigned char  *)&calctax;
      sqlstm.sqhstl[120] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[120] = (         int  )0;
      sqlstm.sqindv[120] = (         short *)0;
      sqlstm.sqinds[120] = (         int  )0;
      sqlstm.sqharm[120] = (unsigned long )0;
      sqlstm.sqadto[120] = (unsigned short )0;
      sqlstm.sqtdso[120] = (unsigned short )0;
      sqlstm.sqhstv[121] = (unsigned char  *)&dintax;
      sqlstm.sqhstl[121] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[121] = (         int  )0;
      sqlstm.sqindv[121] = (         short *)0;
      sqlstm.sqinds[121] = (         int  )0;
      sqlstm.sqharm[121] = (unsigned long )0;
      sqlstm.sqadto[121] = (unsigned short )0;
      sqlstm.sqtdso[121] = (unsigned short )0;
      sqlstm.sqhstv[122] = (unsigned char  *)&djutax;
      sqlstm.sqhstl[122] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[122] = (         int  )0;
      sqlstm.sqindv[122] = (         short *)0;
      sqlstm.sqinds[122] = (         int  )0;
      sqlstm.sqharm[122] = (unsigned long )0;
      sqlstm.sqadto[122] = (unsigned short )0;
      sqlstm.sqtdso[122] = (unsigned short )0;
      sqlstm.sqhstv[123] = (unsigned char  *)&dnongtax;
      sqlstm.sqhstl[123] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[123] = (         int  )0;
      sqlstm.sqindv[123] = (         short *)0;
      sqlstm.sqinds[123] = (         int  )0;
      sqlstm.sqharm[123] = (unsigned long )0;
      sqlstm.sqadto[123] = (unsigned short )0;
      sqlstm.sqtdso[123] = (unsigned short )0;
      sqlstm.sqhstv[124] = (unsigned char  *)&intax;
      sqlstm.sqhstl[124] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[124] = (         int  )0;
      sqlstm.sqindv[124] = (         short *)0;
      sqlstm.sqinds[124] = (         int  )0;
      sqlstm.sqharm[124] = (unsigned long )0;
      sqlstm.sqadto[124] = (unsigned short )0;
      sqlstm.sqtdso[124] = (unsigned short )0;
      sqlstm.sqhstv[125] = (unsigned char  *)&jutax;
      sqlstm.sqhstl[125] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[125] = (         int  )0;
      sqlstm.sqindv[125] = (         short *)0;
      sqlstm.sqinds[125] = (         int  )0;
      sqlstm.sqharm[125] = (unsigned long )0;
      sqlstm.sqadto[125] = (unsigned short )0;
      sqlstm.sqtdso[125] = (unsigned short )0;
      sqlstm.sqhstv[126] = (unsigned char  *)&nongtax;
      sqlstm.sqhstl[126] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[126] = (         int  )0;
      sqlstm.sqindv[126] = (         short *)0;
      sqlstm.sqinds[126] = (         int  )0;
      sqlstm.sqharm[126] = (unsigned long )0;
      sqlstm.sqadto[126] = (unsigned short )0;
      sqlstm.sqtdso[126] = (unsigned short )0;
      sqlstm.sqhstv[127] = (unsigned char  *)&yintax;
      sqlstm.sqhstl[127] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[127] = (         int  )0;
      sqlstm.sqindv[127] = (         short *)0;
      sqlstm.sqinds[127] = (         int  )0;
      sqlstm.sqharm[127] = (unsigned long )0;
      sqlstm.sqadto[127] = (unsigned short )0;
      sqlstm.sqtdso[127] = (unsigned short )0;
      sqlstm.sqhstv[128] = (unsigned char  *)&yjutax;
      sqlstm.sqhstl[128] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[128] = (         int  )0;
      sqlstm.sqindv[128] = (         short *)0;
      sqlstm.sqinds[128] = (         int  )0;
      sqlstm.sqharm[128] = (unsigned long )0;
      sqlstm.sqadto[128] = (unsigned short )0;
      sqlstm.sqtdso[128] = (unsigned short )0;
      sqlstm.sqhstv[129] = (unsigned char  *)&ynongtax;
      sqlstm.sqhstl[129] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[129] = (         int  )0;
      sqlstm.sqindv[129] = (         short *)0;
      sqlstm.sqinds[129] = (         int  )0;
      sqlstm.sqharm[129] = (unsigned long )0;
      sqlstm.sqadto[129] = (unsigned short )0;
      sqlstm.sqtdso[129] = (unsigned short )0;
      sqlstm.sqhstv[130] = (unsigned char  *)&ycalctax;
      sqlstm.sqhstl[130] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[130] = (         int  )0;
      sqlstm.sqindv[130] = (         short *)0;
      sqlstm.sqinds[130] = (         int  )0;
      sqlstm.sqharm[130] = (unsigned long )0;
      sqlstm.sqadto[130] = (unsigned short )0;
      sqlstm.sqtdso[130] = (unsigned short )0;
      sqlstm.sqhstv[131] = (unsigned char  *)jobempno;
      sqlstm.sqhstl[131] = (unsigned long )5;
      sqlstm.sqhsts[131] = (         int  )0;
      sqlstm.sqindv[131] = (         short *)0;
      sqlstm.sqinds[131] = (         int  )0;
      sqlstm.sqharm[131] = (unsigned long )0;
      sqlstm.sqadto[131] = (unsigned short )0;
      sqlstm.sqtdso[131] = (unsigned short )0;
      sqlstm.sqhstv[132] = (unsigned char  *)empno;
      sqlstm.sqhstl[132] = (unsigned long )5;
      sqlstm.sqhsts[132] = (         int  )0;
      sqlstm.sqindv[132] = (         short *)0;
      sqlstm.sqinds[132] = (         int  )0;
      sqlstm.sqharm[132] = (unsigned long )0;
      sqlstm.sqadto[132] = (unsigned short )0;
      sqlstm.sqtdso[132] = (unsigned short )0;
      sqlstm.sqphsv = sqlstm.sqhstv;
      sqlstm.sqphsl = sqlstm.sqhstl;
      sqlstm.sqphss = sqlstm.sqhsts;
      sqlstm.sqpind = sqlstm.sqindv;
      sqlstm.sqpins = sqlstm.sqinds;
      sqlstm.sqparm = sqlstm.sqharm;
      sqlstm.sqparc = sqlstm.sqharc;
      sqlstm.sqpadto = sqlstm.sqadto;
      sqlstm.sqptdso = sqlstm.sqtdso;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
  
       if ( sqlca.sqlcode != 0 )
       {  
           Write_batlog(seqno++, "UpdateResult() 갱신중 ERROR");  
           err_print(sqlca.sqlcode,"UpdateResult() 갱신중 ERROR");
           exit(1);
       }
}

/*=== Rexec대체 서비스 ===*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 133;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1932;
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
     sqlstm.arrsiz = 133;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1973;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}

/*
hinsacc  pkz4041g
mv  pkz4041g ~/HINSA/proc/bin/Kbin
*/