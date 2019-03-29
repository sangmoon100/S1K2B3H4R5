
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
    "pkz4040g.pc"
};


static unsigned int sqlctx = 156499;


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
   unsigned char  *sqhstv[70];
   unsigned long  sqhstl[70];
            int   sqhsts[70];
            short *sqindv[70];
            int   sqinds[70];
   unsigned long  sqharm[70];
   unsigned long  *sqharc[70];
   unsigned short  sqadto[70];
   unsigned short  sqtdso[70];
} sqlstm = {12,70};

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

 static char *sq0015 = 
"(COSTOCKAMT,0) ,NVL(FEWNO,0) ,NVL(BA\
BYNO,0) ,NVL(FUNDAMT1,0) ,NVL(FUNDAMT2,0) ,NVL(FUNDAMT3,0) ,NVL(LONGMTAMT,0) \
,(to_number(to_char(sysdate,'YYYY'))-to_number((decode(Substr(juminid,8,1),'1\
','19','2','19','5','19','6','19','20')||Substr(juminid,1,2)))) SelfAge  from\
 PKZRYMAS            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,113,0,9,387,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,1,0,0,13,398,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
55,0,0,1,0,0,15,412,0,0,0,0,0,1,0,
70,0,0,2,1057,0,4,439,0,0,61,1,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
329,0,0,3,44,0,4,494,0,0,1,0,0,1,0,2,97,0,0,
348,0,0,4,133,0,5,517,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
371,0,0,5,39,0,5,531,0,0,0,0,0,1,0,
386,0,0,6,452,0,5,547,0,0,1,1,0,1,0,1,97,0,0,
405,0,0,7,154,0,5,568,0,0,1,1,0,1,0,1,97,0,0,
424,0,0,8,232,0,5,584,0,0,0,0,0,1,0,
439,0,0,9,241,0,5,620,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
462,0,0,10,291,0,5,640,0,0,0,0,0,1,0,
477,0,0,11,245,0,5,656,0,0,1,1,0,1,0,1,97,0,0,
496,0,0,12,195,0,5,676,0,0,0,0,0,1,0,
511,0,0,13,164,0,5,693,0,0,0,0,0,1,0,
526,0,0,14,108,0,5,708,0,0,0,0,0,1,0,
541,0,0,15,1312,0,9,752,0,0,0,0,0,1,0,
556,0,0,15,0,0,13,765,0,0,70,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,3,0,0,
851,0,0,15,0,0,15,797,0,0,0,0,0,1,0,
866,0,0,16,977,0,5,1005,0,0,64,64,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,
97,0,0,
1137,0,0,17,50,0,3,1090,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1178,0,0,18,0,0,29,1100,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : 임원 퇴직자 연말정산(pkz4040g)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2009.03.

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       2009.03.20         강륜종          pkq2100g.pc를 기반으로 임원용 퇴직자 연말정산 만듬.
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

     char     TAXNUM[3];                /*  세율차수                 */
     double   INDEDBASIC ;              /*  근로소득공제기본액       */
     double   INDEDBRATE ;              /*  근로소득공제 기초공제액  */
     double   INDEDORATE ;              /*  근로소득공제초과율       */
     double   INDEDLIMIT ;              /*  근로소득공제한계액       */
     double   INDEDORATE2 ;             /*  근로소득공제초과율2       */
     double   INDEDLIMIT2 ;             /*  근로소득공제한계액2       */
     double   BASDED     ;              /*  기본공제액               */
     double   APPDED     ;              /*  추가공제액               */
     double   FEWDED1    ;              /*  소수공제자추가공제1      */
     double   FEWDED2    ;              /*  소수공제자추가공제2      */
     double   STDDED     ;              /*  표준공제                 */
     double   INSDEDLIMIT;              /*  보장성보험공제한도       */
     double   MEDDEDLIMIT;              /*  의료비공제한도           */
     double   MEDORATE   ;              /*  의료비공제초과율         */
     double   KINEDULIMIT;              /*  유치원교육비인당한도액   */
     double   CJKEDULIMIT;              /*  초중고교육비 인당한도액  */
     double   UNIEDULIMIT;              /*  대학교육비인당한도액     */
     double   BROEDUNO   ;              /*  형제교육비한도인원       */
     double   HSRATE     ;              /*  주택자금공제율           */
     double   HSDEDLIMIT ;              /*  주택자금한도액           */
     double   HSDEDLIMIT2 ;             /*  주택자금한도액2  dsa2000 */
     double   GIVDEDRATE ;              /*  기부금공제한도율         */
     double   PENRATE    ;              /*  개인연금공제율           */
     double   PENDEDLIMIT;              /*  개인연금한도액           */
     double   INVESTRATE;               /*  투자조합공제율           */
     double   INVESTDEDRATE;            /*  투자조합공제한도율       */
     double   INVESTLIMIT;              /*  투자조합공제한도액       */ /* 계산치 */
     double   TAXDEDBASIC;              /*  근로소득세액공제기본액   */
     double   TAXDEDBRATE;              /*  근로소득세액공제기본율   */
     double   TAXDEDORATE;              /*  근로소득세액공제초과율   */
     double   TAXDEDLIMIT;              /*  근로소득세액공제한계액   */
     double   PRODEDRATE ;              /*  재형저축공제율           */
     double   HSINTRATE  ;              /*  주택자금세액공제율       */
     double   FORILIMIT;                /*  국외근로소득세액공제 한도 */
     double   CREDEDLIMIT;              /* 신용카드한도액 */
     double   CREDEDRATE ;              /* 신용카드한도율 */
     double   CREORATE   ;              /* 신용카드초과율 */
     double   CREDEDLRATE;              /* 신용카드지급율 */
     double   DEBITDEDRATE;             /* 직불카드 공제율  dsa2000   2003.12. */ 
     double   GIRODEDRATE;              /* 지로납부 공제율  dsa2000   2003.12.  */ 
     double   totcreditamt;             /*  신용카드 공제가능 총금액  */
     double   JUTAXRATE  ;              /*  주민세율                 */
     double   NONGRATE   ;              /*  농특세율                 */           
     double   INDEDLIMIT3;               /*  근로소득공제한계액3       */  
     double   INDEDORATE3;              /*  근로소득공제초과율3       */  
     double   OBSDEDLIMIT;              /*  장애인보험 한계액*/
     double   OBSDEDADD;                /*장애인 추가공제 dsa2000 2005.12. 추가..*/
     double   NPENDEDLIMIT;             /*  연금저축 한계액*/
     double   INDEDLIMIT4;               /*  근로소득공제한계액4       */  
     double   INDEDORATE4;              /*  근로소득공제초과율4       */ 
     
     double   OBSEDULIMIT;               /*  장애인특수교육비  PARKSH 20021213 추가 */
     double   SPGIVDEDRATE;             /* 특례지정기부금공제한도율 PARKSH 20021213 추가 */
     double   OINVESTRATE;              /* 전투자조합공제율  parksh 20021213 추가 */
     double   OINVESTDEDRATE;           /* 전투자조합한도율  parksh 20021213 추가 */
     double   OINVESTLIMIT;             /* 전투자조합한도액   parksh 20021213 추가 */
     double   APPOLDDED;                /* 경로우대,장애인 PARKSH 20021213 */
     
     double   TAXDEDSECT1;              /* 근로소득세액공제 총급여한계액1 jissi 2014 */
     double   TAXDEDSLIMIT1;            /* 근로소득세액공제한계액1        jissi 2014 */ 
     double   TAXDEDSECT2;              /* 근로소득세액공제 총급여한계액2 jissi 2014 */
     double   TAXDEDSLIMIT2;            /* 근로소득세액공제한계액2        jissi 2014 */ 

     char      workyy[5];
     char      tempdate[9];
     char      empno[5];      /*  사번    */
     double    lastmonpay;    /*  최종월정급여  */
     double    mpaysum;       /*  (주) 급여총액  */
     double    mbonsum;       /*  (주) 급여총액  */
     double    mnotax;        /*  (주) 비과세    */
     double    bpaysum;       /*  (종) 급여총액  */
     double    bbonsum;       /*  (종) 상여총액  */
     double    bnotax;        /*  (종) 비과세    */
     double    taxgross;      /*  과세급여총액  */
     double    foritaxgross;
     double    notax;         /*  비과세급여총액  */
     double    laborded;      /*  근로소득공제  */
     double    laboramt;      /*  근로소득금액  */
     double    mate;          /*  배우자유뮤    */
     double    fami16no;      /*  6세이하 가족수  */ 
     double    fami720no;     /*  7~20세 가족수  */
     double    fami6064no;    /*  60~64세 가족수  */
     double    fami65no;      /*  65세 이상 가족수  */
     double    familyno;      /*  총 가족수    */
     double    selfded  ;     /*  본인공제    */
     double    mateded  ;     /*  배우자 공제    */
     double    famided  ;     /*  부양가족공제  */
     double    basicded;      /*  기본공제    */
     double    obstacleno;    /*  장애자수    */
     double    childno;       /*  자녀 양육수    */
     double    woman;         /*  부녀자 여부    */
     double    oldded;        /*  경로우대공제  */
     double    obsded;        /*  장애자 공제    */
     double    womanded;      /*  부녀자 공제    */
     double    childded;      /*  자녀양육공제  */
     double    appendded;     /*  추가공제    */
     double    fewno;         /*  소수추가공제  */
     double    fewded;        /*  소수추가공제  */
     double    medamt;        /*  의료 보험료    */  
     double    bmedamt;       /*  (종) 의료 보험료  */
     double    medded;        /*  의료 보험료공제  */
     double    hireamt;       /*  고용 보험료    */ 
     double    bhireamt;      /*  (종) 고용 보험료  */
     double    hireded;       /*  고용보험료 공제  */
     double    guaramt;       /*  보장성 보험료  */
     double    guarded;       /*  보장성보험료 공제  */
     double    obsguaramt;    /*  장애인전용 보험료   */
     double    obsguarded;    /*  장애인전용 보험료공제*/
     double    insded;        /*  보험료 공제    */  
     double    ghosamt;       /*  일반 의료비    */
     double    ohosamt;       /*  경로의료비    */
     double    nhosamt;       /*  장애자의료비  */
     double    hosamt;        /*  의료비    */
     double    hosded;        /*  의료비공제    */
     double    seduamt;       /*  본인학자금    */   
     double    seduded;       /*  본인학자금공제  */  
     double    keduno;        /*  유치원수    */   
     double    keduamt;       /*  유치원학자금  */   
     double    keduded;       /*  유치원학자금공제  */  
     double    ceduno;        /*  초중고수    */   
     double    ceduamt;       /*  초중고학자금  */   
     double    ceduded;       /*  초중고학자금공제  */  
     double    ueduno;        /*  대학생수    */   
     double    ueduamt;       /*  대학생학자금  */   
     double    ueduded;       /*  대학생학자금공제  */  
     double    eduded;        /*  학자금공제    */  
     double    houseamt;      /*  주택자금    */
     double    houseamt2;     /*  주택자금    */
     double    houseintamt;   /*  주택자금차입이자  */
     double    houseintamt2;  /*  주택자금차입이자  */
     double    houseded;      /*  주택자금공제  */
     double    houseded2;     /*  주택자금공제  */
     double    agiveamt;      /*  전액기부금    */
     double    agiveded;      /*  전액기부금    */
     double    sgiveamt;      /*  기부금    */
     double    pgiveamt;      /*  일반기부금    */
     double    pgiveamt2;     /*  일반기부금    */
     double    pgiveded;      /*  일반기부금    */
     double    giveded;       /*  기부금공제    */
     double    specialded;    /*  특별공제    */
     double    standded ;     /*  표준공제            */
     double    anuamt;        /*  연금보험료          */
     double    banuamt;       /*  (종)연금보험료      */
     double    anuded;        /*   연금보험료 공제    */
     double    penamt1;       /*  개인연금(회사)  */
     double    penamt2;       /*  개인연금(개인)  */
     double    pended;        /*  개인연금공제  */
     double    npenamt;       /*  연금저축_회사   */
     double    npenamt2;      /*  연금저축_개인       */
     double    npended;       /*  연금저축공제*/
     double    incomeded;     /*  종합소득공제계  */ 
     double    taxlevel;      /*  과세표준    */
     double    calctax;       /*  산출세액    */
     double    icalctax;      /*  농특세계산을위한 임시 산출세액    */
     double    incomtded;     /*  근로소득세액공제  */ 
     double    hloanamt;      /*  주택차입금 공제  */ 
     double    hloanded;      /*  주택차입금 공제  */ 
     double    foriamt;       /*  외국납부공제  */
     double    forided;       /*  외국납부공제  */
     double    etctamt;       /*  기타세액감면  */
     double    etctded;       /*  기타세액감면  */
     double    tdedsum;       /*  세액감면 총액  */
     double    dintax;        /*  결정소득세    */
     double    djutax;        /*  결정주민세    */
     double    dnongtax;
     double    mintax;        /*  (주) 소득세    */
     double    mjutax;        /*  (주) 주민세    */
     double    mnongtax;
     double    bintax;        /*  (종) 소득세    */
     double    bjutax;        /*  (종) 주민세    */
     double    bnongtax;
     double    intax;         /*  (주+종) 소득세  */
     double    jutax;         /*  (주+종) 주민세  */
     double    nongtax;
     double    yintax;        /*  차감소득세    */
     double    yjutax;        /*  차감주민세    */
     double    ynongtax;      
     double    ycalctax;      /*  차감정산액    */
     double    mcogbonsum ;   /*  인정상여            */
     double    creditded;     /*  신용카드공제  */
     double    creditamt;  
     double    investded;     /*  투자조합공제  */
     double    investamt;
     double    obseduno ;      /*  장애인수         parksh 20021224 */
     double    obseduamt;      /*  장애인특수교육금액     parksh 20021224 */
     double    obseduded;      /*  장애인특수교육비공제 parksh 20021224 */
     double    spgivamt ;      /*  특례지정기부금   parksh 20021224 */
     double    spgivded ;      /*  특레지정기부금공제   parksh 20021224 */   
     double    oinvestamt;     /*  투자조합공제      parksh 20021224 */
     double    oinvestded;     /*  투자조합공제      parksh 20021224 */
     double    tinvestded;     /* 투자조합공제액 합 PARKSH 20021224 추가 */
               
     double    APPOLDDED2;     /* 경로우대70세이상 공제액  Dsa2000 추가  2004.12. Start*/
     double    fami70no;       /* 경로우대 70세이상 수*/
     double    shosamt;        /*  본인 의료비        */
     double    specaddno;      /* 특별공제(결혼.장례.이사소득공제 건수)*/
     double    SPECADDLIMIT;   /* 특별공제(결혼.장례.이사소득공제 한도액)*/
     double    specaddded;     /* 특별공제(결혼.장례.이사소득공제 개인별 공제액)*/
     double    poliamt;        /* 정치기부금 */
     double    polided;        /* 정치자금 세액공제액 */
     double    POLILIMIT;      /* 정치자금 세액공제 한도   Dsa2000 추가  2004.12. End..*/
                               
     double    debitamt;       /*  직불카드 사용금액  */
     double    giroamt;        /*  지로납부금액       */
     double    cashamt;        /*  현금영수증 사용액  2005.11 추가 */ 
     char      juminid[15];    /*  주민번호 */
     int       SelfAge;        /* Dsa2000  근로자본인 경로자 체크 */
               
     double    costockamt;     /*우리사주*/  
     double    costockded;     /* 우리사주출연금 공제금       dsa2000  2006.12.*/  
     double    COSTOCKLIMIT;   /* 우리사주출연금 공제한도     dsa2000  2006.12.*/  
     double    costocktax;     /* 우리사주 인출과세액         dsa2000  2007.01.*/          
               
     double    babyno;
     double    fundamt1;
     double    fundamt2;
     double    fundamt3;                      /* DSA2000 추가  2008.12.*/
     double    fundded;
     double    longmtamt;
     double    longmtded;
     
     double    chagamamt;     /*  차감소득금액   jissi 2014*/ 
     double    housvsubded;             /*  주택자금 */
     double    housvcomded;             /*  주택자금 */
     double    housvempded;             /*  주택자금 */
     double    splimitovded       = 0;  /*  소득공제 종합한도 초과금액            2013.11  */        
     double    investded2         = 0;  /*  투자조합출자소득공제금액(2013년이후)  2013.11  */
     double    hsrentinded        = 0;  /*  목돈 안드는 전세 이자상환액 공제금액  2013.11  */
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
    
    if (argc != 5) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkz4040g D006 pkz4040g 2004110100000 2012*/
        printf("[Usage] : pkz4040g 1.작업사번 2.프로그램ID 3.시작시간 4.귀속년도 \n");
        exit(1);
    }
    
    /*로그 디렉토리 생성 및 로그작업 */
    STRINIT(FL_file);
    strcpy(FL_file,"pkz4040g");
    
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
      taxgross  = foritaxgross = mate      =familyno  =fami65no =0;
      mcogbonsum= 0;
      obstacleno= childno     = woman     =0;
      medamt    = bmedamt     = 0;
      hireamt   = bhireamt    = 0;
      guaramt   = obsguaramt  = 0;
      ghosamt   = ohosamt     = nhosamt   =hosamt     =0;
      keduno    = ueduno      = 0;
      seduamt   = keduamt     = ceduno    =ceduamt   = ueduamt  =0;
      houseamt  = houseintamt = houseintamt2 = agiveamt     =pgiveamt  = pgiveamt2 = 0;
      anuamt    = banuamt     = 0;
      penamt1   = penamt2     = 0;
      npenamt   = npenamt2    = 0;
      hloanamt  = foriamt     = etctamt   = 0;
      creditamt = 0;      
      mintax    = mjutax      = bintax    = bjutax   =0;
      mnongtax  = bnongtax    = 0;
      investamt = 0;      
      obseduno  = obseduamt   = spgivamt     = oinvestamt=0;
      debitamt  = giroamt     = totcreditamt = 0;     
      memset(juminid,'\0',sizeof(juminid));      
      fami70no   = specaddno  = specaddded   = polided = SelfAge = 0;
      cashamt    = 0;                                                
      costockded = costocktax = 0;   
      chagamamt   = 0;   /* 2014.01 */
      housvsubded = 0;
      housvcomded = 0;
      housvempded = 0;
      splimitovded= 0;
      investded2  = 0;
      hsrentinded = 0;
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
      Select  TAXNUM,       INDEDBASIC,  INDEDBRATE,
              INDEDORATE,   INDEDLIMIT,
              BASDED,       APPDED,       FEWDED1,      FEWDED2,      STDDED,       INSDEDLIMIT,
              MEDDEDLIMIT,  MEDORATE,     KINEDULIMIT,  CJKEDULIMIT,  UNIEDULIMIT,
              BROEDUNO,     HSRATE,       HSDEDLIMIT,   GIVDEDRATE,   PENRATE,      PENDEDLIMIT,
              TAXDEDBASIC,  TAXDEDBRATE,  TAXDEDORATE,  TAXDEDLIMIT,  PRODEDRATE,
              HSINTRATE,    
              JUTAXRATE,    NONGRATE,     INVESTRATE,   INVESTDEDRATE,
              INDEDORATE2,  INDEDLIMIT2,  CREDEDLIMIT,  CREDEDRATE ,   CREORATE   ,  CREDEDLRATE,
              INDEDLIMIT3,  INDEDORATE3,  OBSDEDLIMIT , NPENDEDLIMIT,
              INDEDLIMIT4,  INDEDORATE4,  APPOLDDED, 
              OBSEDULIMIT,  OINVESTRATE,  OINVESTDEDRATE, SPGIVDEDRATE,
              DEBITDEDRATE, GIRODEDRATE,              
              APPOLDDED2,   SPECADDLIMIT, POLILIMIT,    HSDEDLIMIT2,  OBSDEDADD,
              TAXDEDSECT1,  TAXDEDSLIMIT1,TAXDEDSECT2,  TAXDEDSLIMIT2                                             
      INTO    :TAXNUM,      :INDEDBASIC,  :INDEDBRATE,  
              :INDEDORATE,  :INDEDLIMIT,
              :BASDED,      :APPDED,      :FEWDED1,     :FEWDED2,      :STDDED,      :INSDEDLIMIT,
              :MEDDEDLIMIT, :MEDORATE,    :KINEDULIMIT, :CJKEDULIMIT,  :UNIEDULIMIT,
              :BROEDUNO,    :HSRATE,      :HSDEDLIMIT,  :GIVDEDRATE,   :PENRATE,     :PENDEDLIMIT,
              :TAXDEDBASIC, :TAXDEDBRATE, :TAXDEDORATE, :TAXDEDLIMIT,  :PRODEDRATE,
              :HSINTRATE,   
              :JUTAXRATE,   :NONGRATE,    :INVESTRATE,  :INVESTDEDRATE,
              :INDEDORATE2, :INDEDLIMIT2, :CREDEDLIMIT, :CREDEDRATE ,   :CREORATE   , :CREDEDLRATE,
              :INDEDLIMIT3, :INDEDORATE3, :OBSDEDLIMIT, :NPENDEDLIMIT,
              :INDEDLIMIT4, :INDEDORATE4, :APPOLDDED,
              :OBSEDULIMIT, :OINVESTRATE, :OINVESTDEDRATE, :SPGIVDEDRATE,
              :DEBITDEDRATE,:GIRODEDRATE,            
              :APPOLDDED2,  :SPECADDLIMIT, :POLILIMIT,   :HSDEDLIMIT2,  :OBSDEDADD,
              :TAXDEDSECT1, :TAXDEDSLIMIT1,:TAXDEDSECT2, :TAXDEDSLIMIT2
       From   PKCYSBAS
      Where   WORKYY = :workyy; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 61;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlbuft((void **)0,
        "select TAXNUM ,INDEDBASIC ,INDEDBRATE ,INDEDORATE ,INDEDLIMIT ,BASD\
ED ,APPDED ,FEWDED1 ,FEWDED2 ,STDDED ,INSDEDLIMIT ,MEDDEDLIMIT ,MEDORATE ,KI\
NEDULIMIT ,CJKEDULIMIT ,UNIEDULIMIT ,BROEDUNO ,HSRATE ,HSDEDLIMIT ,GIVDEDRAT\
E ,PENRATE ,PENDEDLIMIT ,TAXDEDBASIC ,TAXDEDBRATE ,TAXDEDORATE ,TAXDEDLIMIT \
,PRODEDRATE ,HSINTRATE ,JUTAXRATE ,NONGRATE ,INVESTRATE ,INVESTDEDRATE ,INDE\
DORATE2 ,INDEDLIMIT2 ,CREDEDLIMIT ,CREDEDRATE ,CREORATE ,CREDEDLRATE ,INDEDL\
IMIT3 ,INDEDORATE3 ,OBSDEDLIMIT ,NPENDEDLIMIT ,INDEDLIMIT4 ,INDEDORATE4 ,APP\
OLDDED ,OBSEDULIMIT ,OINVESTRATE ,OINVESTDEDRATE ,SPGIVDEDRATE ,DEBITDEDRATE\
 ,GIRODEDRATE ,APPOLDDED2 ,SPECADDLIMIT ,POLILIMIT ,HSDEDLIMIT2 ,OBSDEDADD ,\
TAXDEDSECT1 ,TAXDEDSLIMIT1 ,TAXDEDSECT2 ,TAXDEDSLIMIT2 into :b0,:b1,:b2,:b3,\
:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b\
20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,:b34,:b3\
5,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44,:b45,:b46,:b47,:b48,:b49,:b50\
,:b51,:b52,:b53,:b54,:b55,:b56,:b57,:b58,:b59");
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
     double  calctaxlevel      = 0;     /* 투자조합공제에 따른 농특세 계산    2014.02 */  
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(retdate) into :b0  from PKZRYMAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )329;
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
     
     /* 귀속일 */
     /* EXEC SQL
     UPDATE PKZRYMAS a
        SET YSFRDATE = (Select GREATEST(NVL(ORGEMPDATE,:workyy||'0101'),:workyy||'0101')
                          From PKZRTMAS b
                         Where a.empno = b.empno) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set YSFRDATE=(select GREATEST(NVL(OR\
GEMPDATE,(:b0||'0101')),(:b0||'0101'))  from PKZRTMAS b where a.empno=b.empno\
)";
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
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set YSTODATE=RETDATE";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )371;
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
     sqlstm.arrsiz = 61;
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
     sqlstm.offset = (unsigned int  )386;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set MNOTAX=(select sum((NVL(r.selfed\
uamt,0)-NVL(r.selfedutax,0)))  from PKZHPHIS r where (Substr(Paydate,1,4)=:b0\
 and p.empno=r.empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )405;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS A  set (MPAYSUM,MBONSUM)=(select (((((N\
VL(a.MPAYSUM,0)+NVL(FIXPAY,0))+NVL(MCARTAXAMT,0))+NVL(BOKJISUPAMT,0))+NVL(AID\
AMT3,0))+NVL(TAXPAY,0)) ,(NVL(a.MBONSUM,0)+NVL(b.SBONAMT,0))  from PKZRTMAS B\
 where A.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )424;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS M  set COSTOCKTAX=(select sum(nvl(WDSTA\
MT1,0))  from PSDOHIS where (Substr(reqdate,1,4)=:b0 and M.empno=empno) group\
 by empno) where Empno in (select empno  from PSDOHIS where (Substr(reqdate,1\
,4)=:b0 and nvl(WDSTAMT1,0)<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )439;
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
     /* ============================================================================== */
     
     
     /* ============================================================================== */
     /* EXEC SQL 
     UPDATE PKZRYMAS 
        SET familyno = nvl(fami16no,0)  + nvl(fami720no,0) + nvl(fami6064no,0) + nvl(fami65no,0)  + nvl(fami70no,0),
            taxgross = nvl(mpaysum,0)   + nvl(mbonsum,0)   + nvl(mcogbonsum,0) 
                     + nvl(bpaysum,0)   + nvl(bbonsum,0)   + nvl(bcogbonsum,0) 
                     + nvl(COSTOCKTAX,0)               ,                        /o우리사주인출 과세액 합산 2007.01.o/
            notax    = nvl(mnotax,0)    + nvl(bnotax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS  set familyno=((((nvl(fami16no,0)+nvl(f\
ami720no,0))+nvl(fami6064no,0))+nvl(fami65no,0))+nvl(fami70no,0)),taxgross=((\
((((nvl(mpaysum,0)+nvl(mbonsum,0))+nvl(mcogbonsum,0))+nvl(bpaysum,0))+nvl(bbo\
nsum,0))+nvl(bcogbonsum,0))+nvl(COSTOCKTAX,0)),notax=(nvl(mnotax,0)+nvl(bnota\
x,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )462;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set (anuamt,medamt,hireamt,penamt1,m\
intax,mjutax)=(select sum(anudamt) ,sum(((meddamt+longmtamt)+dedamt8)) ,sum((\
empamt+dedamt7)) ,0 ,sum(intax) ,sum(jutax)  from PKZHPHIS r where (Substr(Pa\
ydate,1,4)=:b0 and p.empno=r.empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )477;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set (anuamt,medamt,hireamt)=(select \
(nvl(a.anuamt,0)+nvl(anudamt,0)) ,(nvl(A.medamt,0)+nvl(meddamt,0)) ,(nvl(A.hi\
reamt,0)+nvl(empamt,0))  from PKZRTMAS b where a.empno=b.empno)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )496;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS a  set NPENAMT=0,PENAMT1=0 where (EMPNO\
 in (select EMPNO  from PKZMPMAS where empdate>'2001') and EMPNO not  in (sel\
ect NEWEMPNO  from PZNEWEMPNO ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )511;
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
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRYMAS p  set mintax=nvl(mintax,0),mjutax=nvl(\
mjutax,0),anuamt=nvl(anuamt,0),penamt1=nvl(penamt1,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )526;
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
     SELECT  EMPNO, NVL(TAXGROSS,0),
             NVL(FORITAXGROSS,0),  /o 국외근로소득 o/
             NVL(MCOGBONSUM,0),  NVL(MATE,0),         NVL(FAMILYNO,0),
             NVL(FAMI65NO,0),    NVL(OBSTACLENO,0),   NVL(CHILDNO,0),      NVL(WOMAN,0),
             NVL(MEDAMT,0),      NVL(BMEDAMT,0),     
             NVL(HIREAMT,0),     NVL(BHIREAMT,0),     
             NVL(GUARAMT,0),     NVL(GHOSAMT,0),      NVL(OHOSAMT,0),      NVL(NHOSAMT,0),
             NVL(KEDUNO,0),      NVL(UEDUNO,0),
             NVL(SEDUAMT,0),     NVL(KEDUAMT,0),      NVL(CEDUNO,0),       NVL(CEDUAMT,0),    NVL(UEDUAMT,0),
             NVL(HOUSEAMT,0),    NVL(HOUSEAMT2,0),    NVL(AGIVEAMT,0),     NVL(PGIVEAMT,0),   NVL(PGIVEAMT2,0),  NVL(SGIVEAMT,0),
             NVL(PENAMT1,0),     NVL(PENAMT2,0),   
             NVL(HLOANAMT,0),    NVL(FORIAMT,0),      NVL(ETCTAMT,0),      
             NVL(MINTAX,0),      NVL(MJUTAX,0),       NVL(BINTAX,0),       NVL(BJUTAX,0),
             NVL(MNONGTAX,0),    NVL(BNONGTAX,0),     
             NVL(INVESTAMT,0),   
             NVL(HOUSEINTAMT,0), NVL(HOUSEINTAMT2,0),                                                    
             NVL(OBSGUARAMT,0),  NVL(ANUAMT,0),       NVL(BANUAMT,0),
             NVL(NPENAMT,0),     NVL(NPENAMT2,0),   
             NVL(OBSEDUAMT, 0),  NVL(SPGIVAMT, 0),    NVL(OBSEDUNO, 0),   /o2000~2001투자조합출자소득,특레지정기부금)o/
             NVL(DEBITAMT,0),    NVL(GIROAMT,0),      JUMINID,  
             NVL(POLIAMT,0),     NVL(FAMI70NO,0),     NVL(SPECADDNO,0),    NVL(SPECADDDED,0),            
             NVL(SHOSAMT,0),     
             NVL(CASHAMT,0),     NVL(COSTOCKAMT,0),   NVL(FEWNO,0),        NVL(BABYNO,0),      
             NVL(FUNDAMT1,0),    NVL(FUNDAMT2,0),     NVL(FUNDAMT3,0),     NVL(LONGMTAMT,0),     
            (to_number(to_char(sysdate,'YYYY')) -     
             to_number(decode(Substr(juminid,8,1),'1','19','2','19','5','19','6','19','20')||Substr(juminid,1,2)) ) SelfAge
       FROM  PKZRYMAS ; */ 
     
     
     /* EXEC   SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 61;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select EMPNO ,NVL(TAXGROSS,0) ,NVL(FORITAXGROSS,0) ,NVL(MCOGBONSUM,0\
) ,NVL(MATE,0) ,NVL(FAMILYNO,0) ,NVL(FAMI65NO,0) ,NVL(OBSTACLENO,0) ,NVL(CHI\
LDNO,0) ,NVL(WOMAN,0) ,NVL(MEDAMT,0) ,NVL(BMEDAMT,0) ,NVL(HIREAMT,0) ,NVL(BH\
IREAMT,0) ,NVL(GUARAMT,0) ,NVL(GHOSAMT,0) ,NVL(OHOSAMT,0) ,NVL(NHOSAMT,0) ,N\
VL(KEDUNO,0) ,NVL(UEDUNO,0) ,NVL(SEDUAMT,0) ,NVL(KEDUAMT,0) ,NVL(CEDUNO,0) ,\
NVL(CEDUAMT,0) ,NVL(UEDUAMT,0) ,NVL(HOUSEAMT,0) ,NVL(HOUSEAMT2,0) ,NVL(AGIVE\
AMT,0) ,NVL(PGIVEAMT,0) ,NVL(PGIVEAMT2,0) ,NVL(SGIVEAMT,0) ,NVL(PENAMT1,0) ,\
NVL(PENAMT2,0) ,NVL(HLOANAMT,0) ,NVL(FORIAMT,0) ,NVL(ETCTAMT,0) ,NVL(MINTAX,\
0) ,NVL(MJUTAX,0) ,NVL(BINTAX,0) ,NVL(BJUTAX,0) ,NVL(MNONGTAX,0) ,NVL(BNONGT\
AX,0) ,NVL(INVESTAMT,0) ,NVL(HOUSEINTAMT,0) ,NVL(HOUSEINTAMT2,0) ,NVL(OBSGUA\
RAMT,0) ,NVL(ANUAMT,0) ,NVL(BANUAMT,0) ,NVL(NPENAMT,0) ,NVL(NPENAMT2,0) ,NVL\
(OBSEDUAMT,0) ,NVL(SPGIVAMT,0) ,NVL(OBSEDUNO,0) ,NVL(DEBITAMT,0) ,NVL(GIROAM\
T,0) ,JUMINID ,NVL(POLIAMT,0) ,NVL(FAMI70NO,0) ,NVL(SPECADDNO,0) ,NVL(SPECAD\
DDED,0) ,NVL(SHOSAMT,0) ,NVL(CASHAMT,0) ,NVL");
     sqlstm.stmt = sq0015;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )541;
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
     
     ClearVar();
     
     while(1)
     {
          /* EXEC SQL FETCH c1 INTO
               :empno,       :taxgross,     :foritaxgross,  /o 국외근로소득 o/
               :mcogbonsum,  :mate,         :familyno,    :fami65no,
               :obstacleno,  :childno,      :woman,        :medamt,    :bmedamt,
               :hireamt,     :bhireamt,     :guaramt,
               :ghosamt,     :ohosamt,      :nhosamt,     :keduno,    :ueduno,
               :seduamt,     :keduamt,      :ceduno,      :ceduamt,   :ueduamt,
               :houseamt,    :houseamt2,    :agiveamt,    :pgiveamt,  :pgiveamt2, :sgiveamt,
               :penamt1,     :penamt2,           
               :hloanamt,    :foriamt,      :etctamt,
               :mintax,      :mjutax,       :bintax,      :bjutax,    :mnongtax,  :bnongtax,
               :investamt,
               :houseintamt, :houseintamt2,
               :obsguaramt,  :anuamt,       :banuamt,
               :npenamt,     :npenamt2,     
               :obseduamt,   :spgivamt,     :obseduno,                 
               :debitamt,    :giroamt,      :juminid,               
               :poliamt,     :fami70no,     :specaddno,   :specaddded, :shosamt,  
               :cashamt,     :costockamt,
               :fewno,       :babyno,
               :fundamt1,    :fundamt2,     :fundamt3,    :longmtamt,  
               :SelfAge; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 70;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )556;
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
          sqlstm.sqhstv[2] = (unsigned char  *)&foritaxgross;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&mcogbonsum;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&mate;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&familyno;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&fami65no;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&obstacleno;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&childno;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&woman;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&medamt;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&bmedamt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&hireamt;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&bhireamt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&guaramt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&ghosamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&ohosamt;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&nhosamt;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&keduno;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&ueduno;
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
          sqlstm.sqhstv[22] = (unsigned char  *)&ceduno;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&ceduamt;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&ueduamt;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&houseamt;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&houseamt2;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&agiveamt;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&pgiveamt;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&pgiveamt2;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&sgiveamt;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&penamt1;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&penamt2;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&hloanamt;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&foriamt;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&etctamt;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&mintax;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&mjutax;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&bintax;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&bjutax;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&mnongtax;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&bnongtax;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&investamt;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&houseintamt;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&houseintamt2;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&obsguaramt;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&anuamt;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&banuamt;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&npenamt;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&npenamt2;
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
          sqlstm.sqhstv[51] = (unsigned char  *)&spgivamt;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&obseduno;
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
          sqlstm.sqhstv[62] = (unsigned char  *)&costockamt;
          sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[62] = (         int  )0;
          sqlstm.sqindv[62] = (         short *)0;
          sqlstm.sqinds[62] = (         int  )0;
          sqlstm.sqharm[62] = (unsigned long )0;
          sqlstm.sqadto[62] = (unsigned short )0;
          sqlstm.sqtdso[62] = (unsigned short )0;
          sqlstm.sqhstv[63] = (unsigned char  *)&fewno;
          sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[63] = (         int  )0;
          sqlstm.sqindv[63] = (         short *)0;
          sqlstm.sqinds[63] = (         int  )0;
          sqlstm.sqharm[63] = (unsigned long )0;
          sqlstm.sqadto[63] = (unsigned short )0;
          sqlstm.sqtdso[63] = (unsigned short )0;
          sqlstm.sqhstv[64] = (unsigned char  *)&babyno;
          sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[64] = (         int  )0;
          sqlstm.sqindv[64] = (         short *)0;
          sqlstm.sqinds[64] = (         int  )0;
          sqlstm.sqharm[64] = (unsigned long )0;
          sqlstm.sqadto[64] = (unsigned short )0;
          sqlstm.sqtdso[64] = (unsigned short )0;
          sqlstm.sqhstv[65] = (unsigned char  *)&fundamt1;
          sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[65] = (         int  )0;
          sqlstm.sqindv[65] = (         short *)0;
          sqlstm.sqinds[65] = (         int  )0;
          sqlstm.sqharm[65] = (unsigned long )0;
          sqlstm.sqadto[65] = (unsigned short )0;
          sqlstm.sqtdso[65] = (unsigned short )0;
          sqlstm.sqhstv[66] = (unsigned char  *)&fundamt2;
          sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[66] = (         int  )0;
          sqlstm.sqindv[66] = (         short *)0;
          sqlstm.sqinds[66] = (         int  )0;
          sqlstm.sqharm[66] = (unsigned long )0;
          sqlstm.sqadto[66] = (unsigned short )0;
          sqlstm.sqtdso[66] = (unsigned short )0;
          sqlstm.sqhstv[67] = (unsigned char  *)&fundamt3;
          sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[67] = (         int  )0;
          sqlstm.sqindv[67] = (         short *)0;
          sqlstm.sqinds[67] = (         int  )0;
          sqlstm.sqharm[67] = (unsigned long )0;
          sqlstm.sqadto[67] = (unsigned short )0;
          sqlstm.sqtdso[67] = (unsigned short )0;
          sqlstm.sqhstv[68] = (unsigned char  *)&longmtamt;
          sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[68] = (         int  )0;
          sqlstm.sqindv[68] = (         short *)0;
          sqlstm.sqinds[68] = (         int  )0;
          sqlstm.sqharm[68] = (unsigned long )0;
          sqlstm.sqadto[68] = (unsigned short )0;
          sqlstm.sqtdso[68] = (unsigned short )0;
          sqlstm.sqhstv[69] = (unsigned char  *)&SelfAge;
          sqlstm.sqhstl[69] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[69] = (         int  )0;
          sqlstm.sqindv[69] = (         short *)0;
          sqlstm.sqinds[69] = (         int  )0;
          sqlstm.sqharm[69] = (unsigned long )0;
          sqlstm.sqadto[69] = (unsigned short )0;
          sqlstm.sqtdso[69] = (unsigned short )0;
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
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
              sqlstm.arrsiz = 70;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )851;
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
          
          t1 = INDEDBASIC * INDEDBRATE / 100;     /*INDEDBASIC; 80% 요율적용. 2009년.*/
          if (taxgross < INDEDBASIC ) t1 = taxgross * INDEDBRATE / 100; 
          
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
          
          laborded = floor(t1 + t2 + t3 + t4 + t5);
                                                             
          laboramt = taxgross - laborded;
          
          /********************************************************************/
          
          /* 퇴직사원 본인 관련외의 부양가족공제 안하도록 초기화 */
          mate     = 0;
          familyno = 0;
          fami65no = 0;
          fami70no = 0;
          childno  = 0;
          babyno   = 0;
                      
          /* 근로자본인 경로자 체크..*/
          if (SelfAge >= 70)   fami70no = 1;
          /********************************************************************/
          
          /*  본인공제  */
          selfded = BASDED;
          selfded =  fmax(fmin(laboramt, selfded),0); /*jissi 2014*/
          
          mateded = mate * BASDED;
          mateded =  fmax(fmin(laboramt - selfded, mateded),0); /*jissi 2014*/
          
          famided = familyno * BASDED; 
          famided = fmax(fmin(laboramt - selfded - mateded, famided),0); /*jissi 2014*/
          basicded= selfded + mateded + famided;
                          
          /* 경로우대공제 ---oldded  = fami65no * APPOLDDED;            */
          oldded  = fami70no * APPOLDDED2; /* 경로우대70이상 추가공제 : 본인만 */
          oldded = fmax(fmin(laboramt - basicded, oldded),0); /*jissi 2014*/
          /* 장애자 공제 */
          obsded  = obstacleno * OBSDEDADD;
          obsded = fmax(fmin(laboramt - basicded - oldded, obsded),0); /*jissi 2014*/
          /* 부녀자 공제 */
          womanded = woman * APPDED;
          womanded = fmax(fmin(laboramt - basicded - oldded - obsded, womanded),0); /*jissi 2014*/
          /*자녀양육비 공제 childded= childno * APPOLDDED; */
          
          /*추가공제  */
          appendded = oldded + obsded + womanded;
          
          /* 다자녀 추가공제 FEWNO */
          if      (fami16no + fami720no == 2)  fewded = FEWDED1;
          else if (fami16no + fami720no  > 2)  fewded = FEWDED1 + ( (fami16no+fami720no-2) * FEWDED2 );
          else                                 fewded = 0; 
          fewded = fmax(fmin(laboramt - basicded - appendded, fewded),0); /*jissi 2014*/   
                            
          anuded  = anuamt  + banuamt;   /*  연금보험료 공제 */
          anuded  = fmax(fmin(laboramt - basicded - appendded - fewded, anuded),0); /*jissi 2014*/   
          medded  = medamt  + bmedamt;   /*  의료보험료   */
          medded  = fmax(fmin(laboramt - basicded - appendded - fewded - anuded, medded),0); /*jissi 2014*/  
          hireded = hireamt + bhireamt;  /*  고용보험료  */
          hireded = fmax(fmin(laboramt - basicded - appendded - fewded - anuded - medded, hireded),0); /*jissi 2014*/  
          insded  = medded  + hireded;   /*  보험료공제   */
           
                     
          /* 특별공제 = 보험료공제 + 의료비공제 + 교육비공제 + 주택자금공제 +  기부금공제 +  결혼.장례.이사비용공제  */
          hosded = eduded = houseded = giveded = specaddded = 0;
          
          specialded = insded + hosded + eduded + houseded + giveded + specaddded;
          standded   = 0;
                      
          /* 표준공제 */
          if (specialded < STDDED)
          {
                  insded    = hosded    = eduded   = houseded   = giveded   = 0;
                  guarded   = hireded   = medded   = obsguarded = obseduded = 0;
                  seduded   = keduded   = ceduded  = ueduded    = 0;
                  agiveded  = pgiveded  = spgivded = specialded = specaddded= 0 ;
                  standded  = STDDED ;  
                  standded  = fmax(fmin(laboramt - basicded - appendded - fewded - anuded - medded - hireded, standded),0);   
          }

          /*  차감소득금액  2014*/ 
          chagamamt = laboramt 
                    - basicded - appendded - fewded      
                    - anuded     - npended
                    - specialded - standded;
               
          /* 그밖의 소득공제 합계 */
          pended    = npended = tinvestded = creditded = costockded = houseded2 = fundded = 0;
          incomeded = pended + tinvestded + creditded + costockded + houseded2 + fundded;
                    
                    
          /* 과세표준  START=====================================================================*/              
          taxlevel = laboramt 
                   - basicded   - appendded - fewded      
                   - anuded     - npended
                   - specialded - standded 
                   - incomeded;
               
          if   (taxlevel <  0) taxlevel = 0;
             
          if   (taxlevel == 0) calctax = 0;
          else                 calctax = GetTax(taxlevel);
                          
          
          /* 세액 공제  START=====================================================================*/
          /* 근로소득 세액 공제 */ 
          if   ( calctax < TAXDEDBASIC)
                incomtded = floor(calctax * TAXDEDBRATE / 100);
          else  incomtded = floor((TAXDEDBASIC * TAXDEDBRATE /100)
                          + (calctax - TAXDEDBASIC) * TAXDEDORATE / 100);
                          
          incomtded = fmax(incomtded, 0); 
                     
          if (strcmp(workyy, "2013") == 0)
          {
               incomtded = fmin(TAXDEDLIMIT, incomtded);
          }
          else
          {
          	   if       (taxgross  <= TAXDEDSECT1)
                    incomtded = fmin(TAXDEDSLIMIT1,incomtded);
               else if  (taxgross  <= TAXDEDSECT2)
                    incomtded = fmin(fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*1/2),TAXDEDSLIMIT2), incomtded);
               else if  (taxgross  >  TAXDEDSECT2)
                    incomtded = fmin(fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*1/2),TAXDEDLIMIT  ), incomtded);
          }
          /*  주택차입금이자세액 공제  */
          hloanded = 0;
          
          /*  외국납부세액공제   */
          forided = foriamt;
          
          /*세액공제 합계*/
          tdedsum = incomtded + hloanded + forided + polided;
              
              
          /* 갑근세 /주민세 / 농특세 START=====================================================================*/               
          dintax   = 0 ;
          djutax   = 0 ;  
          dnongtax = 0 ;                  
          if (calctax - tdedsum > 0) 
          {
              dintax = floor(calctax - tdedsum);
              djutax = floor(dintax * 0.1);              
          }                
           
          if (hloanded > 0 || tinvestded > 0)
          {
              /*dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100) ; 계산방식 변경 2014.01*/  
               /* 계산방식 변경 2014.02*/   
               calctaxlevel = 0;
               calctaxlevel = chagamamt - ( pended                
                                          + housvsubded + housvcomded + housvempded   
                                          + tinvestded  + creditded   + costockded  
                                          + hsrentinded 
                                          ) 
                                        + fmax(splimitovded-investded2,0);
               
               dnongtax = floor(( hloanded + (GetTax(calctaxlevel) - calctax)) * NONGRATE / 100) ; 
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
         set mate        = 0,  /o 퇴직사원 본인 관련외의 부양가족공제 안하도록 초기화 o/
             familyno    = 0,
             fami65no    = 0,
             fami70no    = :fami70no,  
             childno     = 0,
             babyno      = 0,           
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
             babyded     = 0,
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
             chagamamt   = :chagamamt,    /ojissi    2014.01.o/
             polided     = :polided,      /odsa2000  2004.12.o/
             creditded   = :creditded,
             incomeded   = :incomeded,
             taxlevel    = :taxlevel,
             calctax     = :calctax,
             incomtded   = :incomtded,
             hloanded    = :hloanded,
             forided     = :forided,
             obseduded   = :obseduded,
             oinvestded  = :oinvestded,
             investded   = :investded,
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
       Where empno = :empno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 70;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRYMAS  set mate=0,familyno=0,fami65no=0,fami\
70no=:b0,childno=0,babyno=0,taxgross=:b1,laborded=:b2,laboramt=:b3,selfded=:b\
4,mateded=:b5,famided=:b6,basicded=:b7,oldded=:b8,obsded=:b9,womanded=:b10,ch\
ildded=:b11,babyded=0,appendded=:b12,fewno=:b13,fewded=:b14,medded=:b15,hired\
ed=:b16,guarded=:b17,obsguarded=:b18,insded=:b19,hosamt=:b20,hosded=:b21,sedu\
ded=:b22,keduded=:b23,ceduded=:b24,ueduded=:b25,eduded=:b26,houseded=:b27,agi\
veded=:b28,pgiveded=:b29,giveded=:b30,specialded=:b31,standded=:b32,anuded=:b\
33,pended=:b34,npended=:b35,specaddded=:b36,chagamamt=:b37,polided=:b38,credi\
tded=:b39,incomeded=:b40,taxlevel=:b41,calctax=:b42,incomtded=:b43,hloanded=:\
b44,forided=:b45,obseduded=:b46,oinvestded=:b47,investded=:b48,tinvestded=:b4\
9,spgivded=:b50,tdedsum=:b51,dintax=:b52,djutax=:b53,dnongtax=:b54,intax=:b55\
,jutax=:b56,nongtax=:b57,yintax=:b58,yjutax=:b59,ynongtax=:b60,ycalctax=:b61,\
writetime=to_char(sysdate,'yyyymmddhh24miss'),writeman=:b62 where empno=:b63";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )866;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)&fami70no;
      sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
      sqlstm.sqhstv[2] = (unsigned char  *)&laborded;
      sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqhstv[3] = (unsigned char  *)&laboramt;
      sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[3] = (         int  )0;
      sqlstm.sqindv[3] = (         short *)0;
      sqlstm.sqinds[3] = (         int  )0;
      sqlstm.sqharm[3] = (unsigned long )0;
      sqlstm.sqadto[3] = (unsigned short )0;
      sqlstm.sqtdso[3] = (unsigned short )0;
      sqlstm.sqhstv[4] = (unsigned char  *)&selfded;
      sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&mateded;
      sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[5] = (         int  )0;
      sqlstm.sqindv[5] = (         short *)0;
      sqlstm.sqinds[5] = (         int  )0;
      sqlstm.sqharm[5] = (unsigned long )0;
      sqlstm.sqadto[5] = (unsigned short )0;
      sqlstm.sqtdso[5] = (unsigned short )0;
      sqlstm.sqhstv[6] = (unsigned char  *)&famided;
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
      sqlstm.sqhstv[8] = (unsigned char  *)&oldded;
      sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[8] = (         int  )0;
      sqlstm.sqindv[8] = (         short *)0;
      sqlstm.sqinds[8] = (         int  )0;
      sqlstm.sqharm[8] = (unsigned long )0;
      sqlstm.sqadto[8] = (unsigned short )0;
      sqlstm.sqtdso[8] = (unsigned short )0;
      sqlstm.sqhstv[9] = (unsigned char  *)&obsded;
      sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[9] = (         int  )0;
      sqlstm.sqindv[9] = (         short *)0;
      sqlstm.sqinds[9] = (         int  )0;
      sqlstm.sqharm[9] = (unsigned long )0;
      sqlstm.sqadto[9] = (unsigned short )0;
      sqlstm.sqtdso[9] = (unsigned short )0;
      sqlstm.sqhstv[10] = (unsigned char  *)&womanded;
      sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[10] = (         int  )0;
      sqlstm.sqindv[10] = (         short *)0;
      sqlstm.sqinds[10] = (         int  )0;
      sqlstm.sqharm[10] = (unsigned long )0;
      sqlstm.sqadto[10] = (unsigned short )0;
      sqlstm.sqtdso[10] = (unsigned short )0;
      sqlstm.sqhstv[11] = (unsigned char  *)&childded;
      sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[11] = (         int  )0;
      sqlstm.sqindv[11] = (         short *)0;
      sqlstm.sqinds[11] = (         int  )0;
      sqlstm.sqharm[11] = (unsigned long )0;
      sqlstm.sqadto[11] = (unsigned short )0;
      sqlstm.sqtdso[11] = (unsigned short )0;
      sqlstm.sqhstv[12] = (unsigned char  *)&appendded;
      sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[12] = (         int  )0;
      sqlstm.sqindv[12] = (         short *)0;
      sqlstm.sqinds[12] = (         int  )0;
      sqlstm.sqharm[12] = (unsigned long )0;
      sqlstm.sqadto[12] = (unsigned short )0;
      sqlstm.sqtdso[12] = (unsigned short )0;
      sqlstm.sqhstv[13] = (unsigned char  *)&fewno;
      sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[13] = (         int  )0;
      sqlstm.sqindv[13] = (         short *)0;
      sqlstm.sqinds[13] = (         int  )0;
      sqlstm.sqharm[13] = (unsigned long )0;
      sqlstm.sqadto[13] = (unsigned short )0;
      sqlstm.sqtdso[13] = (unsigned short )0;
      sqlstm.sqhstv[14] = (unsigned char  *)&fewded;
      sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[14] = (         int  )0;
      sqlstm.sqindv[14] = (         short *)0;
      sqlstm.sqinds[14] = (         int  )0;
      sqlstm.sqharm[14] = (unsigned long )0;
      sqlstm.sqadto[14] = (unsigned short )0;
      sqlstm.sqtdso[14] = (unsigned short )0;
      sqlstm.sqhstv[15] = (unsigned char  *)&medded;
      sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[15] = (         int  )0;
      sqlstm.sqindv[15] = (         short *)0;
      sqlstm.sqinds[15] = (         int  )0;
      sqlstm.sqharm[15] = (unsigned long )0;
      sqlstm.sqadto[15] = (unsigned short )0;
      sqlstm.sqtdso[15] = (unsigned short )0;
      sqlstm.sqhstv[16] = (unsigned char  *)&hireded;
      sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[16] = (         int  )0;
      sqlstm.sqindv[16] = (         short *)0;
      sqlstm.sqinds[16] = (         int  )0;
      sqlstm.sqharm[16] = (unsigned long )0;
      sqlstm.sqadto[16] = (unsigned short )0;
      sqlstm.sqtdso[16] = (unsigned short )0;
      sqlstm.sqhstv[17] = (unsigned char  *)&guarded;
      sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[17] = (         int  )0;
      sqlstm.sqindv[17] = (         short *)0;
      sqlstm.sqinds[17] = (         int  )0;
      sqlstm.sqharm[17] = (unsigned long )0;
      sqlstm.sqadto[17] = (unsigned short )0;
      sqlstm.sqtdso[17] = (unsigned short )0;
      sqlstm.sqhstv[18] = (unsigned char  *)&obsguarded;
      sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[18] = (         int  )0;
      sqlstm.sqindv[18] = (         short *)0;
      sqlstm.sqinds[18] = (         int  )0;
      sqlstm.sqharm[18] = (unsigned long )0;
      sqlstm.sqadto[18] = (unsigned short )0;
      sqlstm.sqtdso[18] = (unsigned short )0;
      sqlstm.sqhstv[19] = (unsigned char  *)&insded;
      sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[19] = (         int  )0;
      sqlstm.sqindv[19] = (         short *)0;
      sqlstm.sqinds[19] = (         int  )0;
      sqlstm.sqharm[19] = (unsigned long )0;
      sqlstm.sqadto[19] = (unsigned short )0;
      sqlstm.sqtdso[19] = (unsigned short )0;
      sqlstm.sqhstv[20] = (unsigned char  *)&hosamt;
      sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[20] = (         int  )0;
      sqlstm.sqindv[20] = (         short *)0;
      sqlstm.sqinds[20] = (         int  )0;
      sqlstm.sqharm[20] = (unsigned long )0;
      sqlstm.sqadto[20] = (unsigned short )0;
      sqlstm.sqtdso[20] = (unsigned short )0;
      sqlstm.sqhstv[21] = (unsigned char  *)&hosded;
      sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[21] = (         int  )0;
      sqlstm.sqindv[21] = (         short *)0;
      sqlstm.sqinds[21] = (         int  )0;
      sqlstm.sqharm[21] = (unsigned long )0;
      sqlstm.sqadto[21] = (unsigned short )0;
      sqlstm.sqtdso[21] = (unsigned short )0;
      sqlstm.sqhstv[22] = (unsigned char  *)&seduded;
      sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[22] = (         int  )0;
      sqlstm.sqindv[22] = (         short *)0;
      sqlstm.sqinds[22] = (         int  )0;
      sqlstm.sqharm[22] = (unsigned long )0;
      sqlstm.sqadto[22] = (unsigned short )0;
      sqlstm.sqtdso[22] = (unsigned short )0;
      sqlstm.sqhstv[23] = (unsigned char  *)&keduded;
      sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[23] = (         int  )0;
      sqlstm.sqindv[23] = (         short *)0;
      sqlstm.sqinds[23] = (         int  )0;
      sqlstm.sqharm[23] = (unsigned long )0;
      sqlstm.sqadto[23] = (unsigned short )0;
      sqlstm.sqtdso[23] = (unsigned short )0;
      sqlstm.sqhstv[24] = (unsigned char  *)&ceduded;
      sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[24] = (         int  )0;
      sqlstm.sqindv[24] = (         short *)0;
      sqlstm.sqinds[24] = (         int  )0;
      sqlstm.sqharm[24] = (unsigned long )0;
      sqlstm.sqadto[24] = (unsigned short )0;
      sqlstm.sqtdso[24] = (unsigned short )0;
      sqlstm.sqhstv[25] = (unsigned char  *)&ueduded;
      sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[25] = (         int  )0;
      sqlstm.sqindv[25] = (         short *)0;
      sqlstm.sqinds[25] = (         int  )0;
      sqlstm.sqharm[25] = (unsigned long )0;
      sqlstm.sqadto[25] = (unsigned short )0;
      sqlstm.sqtdso[25] = (unsigned short )0;
      sqlstm.sqhstv[26] = (unsigned char  *)&eduded;
      sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[26] = (         int  )0;
      sqlstm.sqindv[26] = (         short *)0;
      sqlstm.sqinds[26] = (         int  )0;
      sqlstm.sqharm[26] = (unsigned long )0;
      sqlstm.sqadto[26] = (unsigned short )0;
      sqlstm.sqtdso[26] = (unsigned short )0;
      sqlstm.sqhstv[27] = (unsigned char  *)&houseded;
      sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[27] = (         int  )0;
      sqlstm.sqindv[27] = (         short *)0;
      sqlstm.sqinds[27] = (         int  )0;
      sqlstm.sqharm[27] = (unsigned long )0;
      sqlstm.sqadto[27] = (unsigned short )0;
      sqlstm.sqtdso[27] = (unsigned short )0;
      sqlstm.sqhstv[28] = (unsigned char  *)&agiveded;
      sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[28] = (         int  )0;
      sqlstm.sqindv[28] = (         short *)0;
      sqlstm.sqinds[28] = (         int  )0;
      sqlstm.sqharm[28] = (unsigned long )0;
      sqlstm.sqadto[28] = (unsigned short )0;
      sqlstm.sqtdso[28] = (unsigned short )0;
      sqlstm.sqhstv[29] = (unsigned char  *)&pgiveded;
      sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[29] = (         int  )0;
      sqlstm.sqindv[29] = (         short *)0;
      sqlstm.sqinds[29] = (         int  )0;
      sqlstm.sqharm[29] = (unsigned long )0;
      sqlstm.sqadto[29] = (unsigned short )0;
      sqlstm.sqtdso[29] = (unsigned short )0;
      sqlstm.sqhstv[30] = (unsigned char  *)&giveded;
      sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[30] = (         int  )0;
      sqlstm.sqindv[30] = (         short *)0;
      sqlstm.sqinds[30] = (         int  )0;
      sqlstm.sqharm[30] = (unsigned long )0;
      sqlstm.sqadto[30] = (unsigned short )0;
      sqlstm.sqtdso[30] = (unsigned short )0;
      sqlstm.sqhstv[31] = (unsigned char  *)&specialded;
      sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[31] = (         int  )0;
      sqlstm.sqindv[31] = (         short *)0;
      sqlstm.sqinds[31] = (         int  )0;
      sqlstm.sqharm[31] = (unsigned long )0;
      sqlstm.sqadto[31] = (unsigned short )0;
      sqlstm.sqtdso[31] = (unsigned short )0;
      sqlstm.sqhstv[32] = (unsigned char  *)&standded;
      sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[32] = (         int  )0;
      sqlstm.sqindv[32] = (         short *)0;
      sqlstm.sqinds[32] = (         int  )0;
      sqlstm.sqharm[32] = (unsigned long )0;
      sqlstm.sqadto[32] = (unsigned short )0;
      sqlstm.sqtdso[32] = (unsigned short )0;
      sqlstm.sqhstv[33] = (unsigned char  *)&anuded;
      sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[33] = (         int  )0;
      sqlstm.sqindv[33] = (         short *)0;
      sqlstm.sqinds[33] = (         int  )0;
      sqlstm.sqharm[33] = (unsigned long )0;
      sqlstm.sqadto[33] = (unsigned short )0;
      sqlstm.sqtdso[33] = (unsigned short )0;
      sqlstm.sqhstv[34] = (unsigned char  *)&pended;
      sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[34] = (         int  )0;
      sqlstm.sqindv[34] = (         short *)0;
      sqlstm.sqinds[34] = (         int  )0;
      sqlstm.sqharm[34] = (unsigned long )0;
      sqlstm.sqadto[34] = (unsigned short )0;
      sqlstm.sqtdso[34] = (unsigned short )0;
      sqlstm.sqhstv[35] = (unsigned char  *)&npended;
      sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[35] = (         int  )0;
      sqlstm.sqindv[35] = (         short *)0;
      sqlstm.sqinds[35] = (         int  )0;
      sqlstm.sqharm[35] = (unsigned long )0;
      sqlstm.sqadto[35] = (unsigned short )0;
      sqlstm.sqtdso[35] = (unsigned short )0;
      sqlstm.sqhstv[36] = (unsigned char  *)&specaddded;
      sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[36] = (         int  )0;
      sqlstm.sqindv[36] = (         short *)0;
      sqlstm.sqinds[36] = (         int  )0;
      sqlstm.sqharm[36] = (unsigned long )0;
      sqlstm.sqadto[36] = (unsigned short )0;
      sqlstm.sqtdso[36] = (unsigned short )0;
      sqlstm.sqhstv[37] = (unsigned char  *)&chagamamt;
      sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[37] = (         int  )0;
      sqlstm.sqindv[37] = (         short *)0;
      sqlstm.sqinds[37] = (         int  )0;
      sqlstm.sqharm[37] = (unsigned long )0;
      sqlstm.sqadto[37] = (unsigned short )0;
      sqlstm.sqtdso[37] = (unsigned short )0;
      sqlstm.sqhstv[38] = (unsigned char  *)&polided;
      sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[38] = (         int  )0;
      sqlstm.sqindv[38] = (         short *)0;
      sqlstm.sqinds[38] = (         int  )0;
      sqlstm.sqharm[38] = (unsigned long )0;
      sqlstm.sqadto[38] = (unsigned short )0;
      sqlstm.sqtdso[38] = (unsigned short )0;
      sqlstm.sqhstv[39] = (unsigned char  *)&creditded;
      sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[39] = (         int  )0;
      sqlstm.sqindv[39] = (         short *)0;
      sqlstm.sqinds[39] = (         int  )0;
      sqlstm.sqharm[39] = (unsigned long )0;
      sqlstm.sqadto[39] = (unsigned short )0;
      sqlstm.sqtdso[39] = (unsigned short )0;
      sqlstm.sqhstv[40] = (unsigned char  *)&incomeded;
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
      sqlstm.sqhstv[48] = (unsigned char  *)&investded;
      sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[48] = (         int  )0;
      sqlstm.sqindv[48] = (         short *)0;
      sqlstm.sqinds[48] = (         int  )0;
      sqlstm.sqharm[48] = (unsigned long )0;
      sqlstm.sqadto[48] = (unsigned short )0;
      sqlstm.sqtdso[48] = (unsigned short )0;
      sqlstm.sqhstv[49] = (unsigned char  *)&tinvestded;
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
      sqlstm.sqhstv[51] = (unsigned char  *)&tdedsum;
      sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[51] = (         int  )0;
      sqlstm.sqindv[51] = (         short *)0;
      sqlstm.sqinds[51] = (         int  )0;
      sqlstm.sqharm[51] = (unsigned long )0;
      sqlstm.sqadto[51] = (unsigned short )0;
      sqlstm.sqtdso[51] = (unsigned short )0;
      sqlstm.sqhstv[52] = (unsigned char  *)&dintax;
      sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[52] = (         int  )0;
      sqlstm.sqindv[52] = (         short *)0;
      sqlstm.sqinds[52] = (         int  )0;
      sqlstm.sqharm[52] = (unsigned long )0;
      sqlstm.sqadto[52] = (unsigned short )0;
      sqlstm.sqtdso[52] = (unsigned short )0;
      sqlstm.sqhstv[53] = (unsigned char  *)&djutax;
      sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[53] = (         int  )0;
      sqlstm.sqindv[53] = (         short *)0;
      sqlstm.sqinds[53] = (         int  )0;
      sqlstm.sqharm[53] = (unsigned long )0;
      sqlstm.sqadto[53] = (unsigned short )0;
      sqlstm.sqtdso[53] = (unsigned short )0;
      sqlstm.sqhstv[54] = (unsigned char  *)&dnongtax;
      sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[54] = (         int  )0;
      sqlstm.sqindv[54] = (         short *)0;
      sqlstm.sqinds[54] = (         int  )0;
      sqlstm.sqharm[54] = (unsigned long )0;
      sqlstm.sqadto[54] = (unsigned short )0;
      sqlstm.sqtdso[54] = (unsigned short )0;
      sqlstm.sqhstv[55] = (unsigned char  *)&intax;
      sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[55] = (         int  )0;
      sqlstm.sqindv[55] = (         short *)0;
      sqlstm.sqinds[55] = (         int  )0;
      sqlstm.sqharm[55] = (unsigned long )0;
      sqlstm.sqadto[55] = (unsigned short )0;
      sqlstm.sqtdso[55] = (unsigned short )0;
      sqlstm.sqhstv[56] = (unsigned char  *)&jutax;
      sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[56] = (         int  )0;
      sqlstm.sqindv[56] = (         short *)0;
      sqlstm.sqinds[56] = (         int  )0;
      sqlstm.sqharm[56] = (unsigned long )0;
      sqlstm.sqadto[56] = (unsigned short )0;
      sqlstm.sqtdso[56] = (unsigned short )0;
      sqlstm.sqhstv[57] = (unsigned char  *)&nongtax;
      sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[57] = (         int  )0;
      sqlstm.sqindv[57] = (         short *)0;
      sqlstm.sqinds[57] = (         int  )0;
      sqlstm.sqharm[57] = (unsigned long )0;
      sqlstm.sqadto[57] = (unsigned short )0;
      sqlstm.sqtdso[57] = (unsigned short )0;
      sqlstm.sqhstv[58] = (unsigned char  *)&yintax;
      sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[58] = (         int  )0;
      sqlstm.sqindv[58] = (         short *)0;
      sqlstm.sqinds[58] = (         int  )0;
      sqlstm.sqharm[58] = (unsigned long )0;
      sqlstm.sqadto[58] = (unsigned short )0;
      sqlstm.sqtdso[58] = (unsigned short )0;
      sqlstm.sqhstv[59] = (unsigned char  *)&yjutax;
      sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[59] = (         int  )0;
      sqlstm.sqindv[59] = (         short *)0;
      sqlstm.sqinds[59] = (         int  )0;
      sqlstm.sqharm[59] = (unsigned long )0;
      sqlstm.sqadto[59] = (unsigned short )0;
      sqlstm.sqtdso[59] = (unsigned short )0;
      sqlstm.sqhstv[60] = (unsigned char  *)&ynongtax;
      sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[60] = (         int  )0;
      sqlstm.sqindv[60] = (         short *)0;
      sqlstm.sqinds[60] = (         int  )0;
      sqlstm.sqharm[60] = (unsigned long )0;
      sqlstm.sqadto[60] = (unsigned short )0;
      sqlstm.sqtdso[60] = (unsigned short )0;
      sqlstm.sqhstv[61] = (unsigned char  *)&ycalctax;
      sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
      sqlstm.sqhsts[61] = (         int  )0;
      sqlstm.sqindv[61] = (         short *)0;
      sqlstm.sqinds[61] = (         int  )0;
      sqlstm.sqharm[61] = (unsigned long )0;
      sqlstm.sqadto[61] = (unsigned short )0;
      sqlstm.sqtdso[61] = (unsigned short )0;
      sqlstm.sqhstv[62] = (unsigned char  *)jobempno;
      sqlstm.sqhstl[62] = (unsigned long )5;
      sqlstm.sqhsts[62] = (         int  )0;
      sqlstm.sqindv[62] = (         short *)0;
      sqlstm.sqinds[62] = (         int  )0;
      sqlstm.sqharm[62] = (unsigned long )0;
      sqlstm.sqadto[62] = (unsigned short )0;
      sqlstm.sqtdso[62] = (unsigned short )0;
      sqlstm.sqhstv[63] = (unsigned char  *)empno;
      sqlstm.sqhstl[63] = (unsigned long )5;
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
     sqlstm.arrsiz = 70;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1137;
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
     sqlstm.arrsiz = 70;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1178;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}

/*
hinsacc pkz4040g
mv pkz4040g ~/HINSA/proc/bin/Kbin
*/