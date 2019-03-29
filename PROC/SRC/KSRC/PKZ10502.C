
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
    "pkz10502.pc"
};


static unsigned int sqlctx = 155979;


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
   unsigned char  *sqhstv[44];
   unsigned long  sqhstl[44];
            int   sqhsts[44];
            short *sqindv[44];
            int   sqinds[44];
   unsigned long  sqharm[44];
   unsigned long  *sqharc[44];
   unsigned short  sqadto[44];
   unsigned short  sqtdso[44];
} sqlstm = {12,44};

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

 static char *sq0004 = 
"rate1,0) ,nvl(taxrate2,0) ,nvl(taxra\
te3,0) ,nvl(taxrate4,0) ,nvl(taxrate5,0) ,nvl(taxrate6,0) ,nvl(taxrate7,0) ,n\
vl(taxrate8,0) ,nvl(taxrate9,0) ,nvl(mcartaxamt,0) ,nvl(fixpay,0)  from pkzmp\
mas a where ((empno>=:b0 and empno<=:b1) and payyn='Y')           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,211,0,0,0,0,0,1,0,
20,0,0,2,560,0,4,240,0,0,23,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
127,0,0,3,41,0,4,265,0,0,1,0,0,1,0,2,97,0,0,
146,0,0,4,1280,0,9,308,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
169,0,0,4,0,0,15,314,0,0,0,0,0,1,0,
184,0,0,4,0,0,13,322,0,0,44,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
375,0,0,4,0,0,15,347,0,0,0,0,0,1,0,
390,0,0,4,0,0,15,355,0,0,0,0,0,1,0,
405,0,0,4,0,0,15,371,0,0,0,0,0,1,0,
420,0,0,4,0,0,15,377,0,0,0,0,0,1,0,
435,0,0,5,162,0,4,456,0,0,7,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,
478,0,0,6,157,0,4,716,0,0,4,2,0,1,0,2,4,0,0,2,4,0,0,1,4,0,0,1,4,0,0,
509,0,0,7,370,0,5,766,0,0,24,24,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
620,0,0,8,50,0,3,814,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,0,
1,97,0,0,1,97,0,0,
661,0,0,9,0,0,29,824,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkz10502(임원 급여계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2008.05.

Update Contents
  Version   date(yy.mm.dd)   programmer   description        relevant doc.no
   1.00     2008.05.         강륜종       pkc10802.pc를 기준으로 임원용 개발
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

#define  FAIL        -2

/********* Function Prototype 정의 ************/
int   Get_TaxRate(double taxlevel, double *taxrate, double *yearded);
void  Process_TaxCalc();
void  print_errmsg(int errcode, char *errmsg);

/*********************************************
  Global Variable
**********************************************/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    empno[5]        = "";   /* 사    번      */
     char    korname[13]      = "";  /* 성    명      */
     char    juminid[13+1]    = "";  /* 주민등록번호    */
     char    paydate[9]      = "";   /* 급 여 지 급 월       */         
     char    frempno[5]         = "";
     char    toempno[5]         = "";
          
     double  totpay;                 /* 연봉              */
     double  taxpaysum;              /* 과세급여총액          */
     double  notaxpaysum;            /* 비과세급여총액       */
     double  fixpay;                 /* 월정급여    */
     double  paysum;                 /* 지급총액          */
     double  taxpay1;                /* 과세급여          */
     double  taxpay2;                /* 과세급여          */
     double  taxpay3;                /* 과세급여          */
     double  taxpay4;                /* 과세급여          */
     double  taxpay5;                /* 과세급여          */
     double  taxpay6;                /* 과세급여          */
     double  taxpay7;                /* 과세급여          */
     double  taxpay8;                /* 과세급여          */
     
     double  sbonamt;                /* 특별상여금(총액)     */
     double  aidamt3;                /* 유치수수료          */
     double  mcaramt;                /* 식대교통비           */
     double  mcartaxamt;             /* 식대교통비(과세)  */
     double  selfeduamt;             /* 학자금(복지기금)     */
     double  bokjisupamt;            /* 복지연금          */
     double  medsupamt;              /* 의료비지원금          */
     double  trainsupamt;
     
     double  labinded;               /* 근로소득공제액       */
     double  labneedded;             /* 근로소득필요경비계   */
     double  labinamt;               /* 근로소득금액         */
     double  inded;                  /* 소득공제액          */
     double  basicded;               /* 기초공제액          */
     double  mateded;                /* 배우자공제액          */
     double  famided;                /* 부양자공제액          */
     double  anuded;                 /* 국민연금보험료 공제액*/
     double  standded;               /* 표준공제액 */
     double  speded;                 /* 특별공제액 */  
     double  obsded;                 /* 장애자공제액          */
     double  silverded;              /* 경로우대장애액       */
     double  womanded;               /* 부녀자공제액         */
     double  eduded;                 /* 자녀양육비공제액     */
     double  spededamt;              /* 특별공제액           */  
     double  etcded1;                /* 기타공제액1          */
     double  etcded2;                /* 기타공제액2          */     
     double  taxinamt;               /* 과세표준금액          */
     double  calctax;                /* 산촐세액             */  
     double  labtaxded;              /* 근로소득세액공제     */
     double  intax;                  /* 소득세               */
     double  jutax;                  /* 주민세               */
     double  intax1;                 /* 소득세               */
     double  intax2;                 /* 소득세               */
     double  intax3;                 /* 소득세               */
     double  intax4;                 /* 소득세               */
     double  intax5;                 /* 소득세               */
     double  intax6;                 /* 소득세               */  
     double  intax7;                 /* 소득세               */  
     double  intax8;                 /* 소득세               */  
     double  intax9;                 /* 소득세               */  
     double  taxrate1;               /* 소득세율(기본-계산값)*/
     double  taxrate2;               /* 소득세율(상여금)     */
     double  taxrate3;               /* 소득세율(유치수수료) */
     double  taxrate4;               /* 소득세율(복리후생A)   */
     double  taxrate5;               /* 소득세율(복리후생B)  */
     double  taxrate6;               /* 소득세율(기타급여1)  */
     double  taxrate7;               /* 소득세율(기타급여2)  */
     double  taxrate8;               /* 소득세율(기타급여3)  */
     double  taxrate9;               /* 소득세율(기타급여4)  */
     double  dedsum;                 /* 공제액계             */
     double  realpay;                /* 실지급액          */
     double  taxgross;               /* 당년과세수입누계     */
     double  notaxgross;             /* 당년비과세수입누계   */
     double  intaxsum;               /* 당년소득세누계       */
     char    writeman[5]    = "";    /* 최종작업자           */  
     
     double  tmp_taxgross;
     double  tmp_notaxgross;
     double  tmp_intaxsum;
          
     /*  급여마스터  (PKMPMAS) 참조 변수               */
     double  matedcnt;                /* 배우자공제수       */
     double  famidcnt;                /* 부양자공제수       */
     double  obscnt;                  /* 장애자공제수       */
     double  silverdcnt;              /* 경로우대공제수     */
     
     /*  급여지급기준(PKCPBAS) 참조 변수               */
     double  bonusmon;                /* 상여금분할개월수   */
     char    bonusyn[2] = "";         /* 상역금지급여부     */  
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
     char    incentiveyn[2];          /* 상여만 따로 지급여부*/
     double  specialded2;             /* 특별공제액2인이하   dsa2000 2004.05.10. 추가 */
     double  specialded3;             /* 특별공제액3인이상   dsa2000 2004.05.10. 추가 */
          
     double yuedunotax         = 0;   /* 유치원학자금 비과세금액 추가 dsa2000  2006.07.*/  
     double childded           = 0;   /*dsa2000 2007.01 Add  다자녀추가공제 */     
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



int     rcount       = 0;
int     i            = 0;

double  YY_TaxPay       = 0;    /* 년간 급여소득추정치   */ 
double  YY_TaxInAmt     = 0;    /* 년과세표준금액       */

double  YY_LabInDed     = 0;    /* 년근로소득공제액      */
double  YY_LabNeedDed   = 0;    /* 년근로소득필요경비계   */
double  YY_LabInAmt     = 0;    /* 년근로소득금액   */
double  YY_InDed        = 0;    /* 년소득공제액     */
double  YY_CalcTax      = 0;    

char    log_rundate[16] = ""; 
char    log_progid[16]  = "";
char    log_writeman[5] = "";
char    log_buff[100]   = "";
int     seqno = 0; 


void  main(int argc,char *argv[] )
{
     char FL_file[255];
                  
     if (argc != 7) 
     {     /* pkz10502 200805 M000 Q018 D006 pkz10502 200805000000 */
           printf("[Usage] : pkz10502 1.급여년월 2.사번fr 3.사번to 4.작업자 5.프로그램ID 6.시작시간 \n");
           exit(1);
     }
       
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkz10502");
     
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(paydate,"%8s",argv[1]);
     sprintf(frempno,"%4s",argv[2]);
     sprintf(toempno,"%4s",argv[3]);
     sprintf(writeman,"%4s",argv[4]);
     
     /* DB Connect 실시.. */
     hinsa_log_print(0,"급여계산 프로그램 시작...[pkz10502]");
     hinsa_db_connect(); 
       
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     
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
     Write_batlog(seqno++, log_buff);       
                 
     Process_TaxCalc();
     
     /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);                     
          error_quit("ERROR ====== [작업 실패] =====");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [월급여 세금계산 성공] =====");
          Write_batlog(seqno++, log_buff);                           
          hinsa_exit(0,"OK ====== [월급여 세금계산 성공] =====");
     }     
}


/*****************************************************************************
    세금계산을 하는 Function.
*****************************************************************************/
void Process_TaxCalc()
{
     /* EXEC SQL 
     SELECT  NVL(BONUSYN,' '),     BONUSMON,            NVL(PROPRATE,0),      NVL(JUTAXRATE,0),    NVL(STDDED,0),
             NVL(INDEDBASIC,0),    NVL(INDEDBRATE,0),   NVL(INDEDORATE,0),    NVL(INDEDLIMIT,0),
             NVL(INDEDORATE2,0),   NVL(INDEDLIMIT2,0),  
             NVL(TAXDEDBASIC,0),   NVL(TAXDEDBRATE,0),  NVL(TAXDEDORATE,0),   NVL(TAXDEDLIMIT,0),
             NVL(AVGODAMT,0),                           
             NVL(INDEDLIMIT3,0),   NVL(INDEDORATE3,0),  NVL(INDEDLIMIT4,0),   NVL(INDEDORATE4,0),
             NVL(CHILDNOTAX,0),    NVL(SPECIALDED2,0),  NVL(SPECIALDED3,0)
       into :bonusyn,             :bonusmon,           :proprate,           :jutaxrate,         :stdded, 
            :indedbasic,          :indedbrate,         :indedorate,         :indedlimit,
            :indedorate2,         :indedlimit2,                            
            :taxdedbasic,         :taxdedbrate,        :taxdedorate,        :taxdedlimit,
            :avgodamt,                                                     
            :indedlimit3,         :indedorate3,        :indedlimit4,        :indedorate4,
            :yuedunotax,          :specialded2,        :specialded3
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 23;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(BONUSYN,' ') ,BONUSMON ,NVL(PROPRATE,0) ,NVL\
(JUTAXRATE,0) ,NVL(STDDED,0) ,NVL(INDEDBASIC,0) ,NVL(INDEDBRATE,0) ,NVL(INDED\
ORATE,0) ,NVL(INDEDLIMIT,0) ,NVL(INDEDORATE2,0) ,NVL(INDEDLIMIT2,0) ,NVL(TAXD\
EDBASIC,0) ,NVL(TAXDEDBRATE,0) ,NVL(TAXDEDORATE,0) ,NVL(TAXDEDLIMIT,0) ,NVL(A\
VGODAMT,0) ,NVL(INDEDLIMIT3,0) ,NVL(INDEDORATE3,0) ,NVL(INDEDLIMIT4,0) ,NVL(I\
NDEDORATE4,0) ,NVL(CHILDNOTAX,0) ,NVL(SPECIALDED2,0) ,NVL(SPECIALDED3,0) into\
 :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:\
b17,:b18,:b19,:b20,:b21,:b22  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
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
     sqlstm.sqhstv[21] = (unsigned char  *)&specialded2;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&specialded3;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          print_errmsg(sqlca.sqlcode,"급여지급기준 읽기오류1...");
          sprintf(log_buff, "급여지급기준 읽기오류1..");
          Write_batlog(seqno++, log_buff);              
          error_quit("작업실패...");
     }
     
     /* Exec SQL
     Select  incentive
       Into :incentiveyn
       From  Pkzcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 23;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select incentive into :b0  from Pkzcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )127;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)incentiveyn;
     sqlstm.sqhstl[0] = (unsigned long )2;
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


       
     bonusyn[1] = '\0';
     
     /* EXEC SQL DECLARE cursor1 CURSOR FOR 
     select  nvl(empno,     '*'), replace(nvl(juminid,'####'),' ',''), 
             nvl(matedcnt    ,0), nvl(famidcnt   ,0),            
             nvl(sbonamt     ,0), nvl(aidamt3    ,0),  
             nvl(bokjisupamt ,0), nvl(medsupamt  ,0),  
             nvl(selfeduamt  ,0), nvl(trainsupamt,0),  
             nvl(taxpay1     ,0), nvl(taxpay2    ,0),  
             nvl(taxpay3     ,0), nvl(taxpay4    ,0),  
             nvl(taxpay5     ,0), nvl(taxpay6    ,0),
             nvl(taxpay7     ,0), nvl(taxpay8    ,0),                                                    
             nvl(paysum      ,0), nvl(totpay     ,0),
             nvl(taxpaysum   ,0), nvl(notaxpaysum,0), 
             nvl(basicded    ,0), nvl(mateded    ,0),  nvl(famided,    0), 
             nvl(obsded      ,0), nvl(silverded  ,0),  nvl(womanded,   0), 
             nvl(eduded      ,0), nvl(childded   ,0),  nvl(speded,     0),
             nvl(anuded      ,0),                 
            (nvl(anudamt     ,0) + nvl(meddamt,   0) + nvl(longmtamt,0) + nvl(empamt,    0) +   /o longmtamt 추가 o/
             nvl(hsorgamt    ,0) + nvl(hsintamt,  0) +  
             nvl(sacorpcp    ,0) + nvl(sacorpamt, 0) + nvl(sabankcp ,0) + nvl(sabankamt, 0) +   /o sacorpcp,sabankcp 추가 o/
             nvl(sangamt     ,0) + nvl(nbamt,     0) +
             nvl(saveamt3    ,0) + nvl(ticketamt, 0) + 
             nvl(sauamt      ,0) + nvl(igamt,     0) + 
             nvl(meddedamt   ,0) +                                  /o 2015.01 jissi 의료비대출 공제항목 추가. 손필영M 한정미 요청o/
             nvl(dedamt0     ,0) +                                   /o 기타공제0(차량대여료)항목추가 o/
             nvl(dedamt1     ,0) + nvl(dedamt2,   0) + 
             nvl(dedamt3     ,0) + nvl(dedamt4,   0) +
             nvl(dedamt5     ,0) + nvl(dedamt6,   0) +
             nvl(dedamt7     ,0) + nvl(dedamt8,   0)   ) dedsum,
             nvl(taxrate1    ,0),  nvl(taxrate2  ,0),   nvl(taxrate3,0),    
             nvl(taxrate4    ,0),  nvl(taxrate5  ,0),   nvl(taxrate6,0),
             nvl(taxrate7    ,0),  nvl(taxrate8  ,0),   nvl(taxrate9,0),
             nvl(mcartaxamt  ,0),  nvl(fixpay    ,0)
       from  pkzmpmas a
      where  empno >= :frempno and empno <= :toempno
        and  payyn = 'Y'; */ 
   
     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 23;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select nvl(empno,'*') ,replace(nvl(juminid,'####'),' ','') ,nvl(mate\
dcnt,0) ,nvl(famidcnt,0) ,nvl(sbonamt,0) ,nvl(aidamt3,0) ,nvl(bokjisupamt,0)\
 ,nvl(medsupamt,0) ,nvl(selfeduamt,0) ,nvl(trainsupamt,0) ,nvl(taxpay1,0) ,n\
vl(taxpay2,0) ,nvl(taxpay3,0) ,nvl(taxpay4,0) ,nvl(taxpay5,0) ,nvl(taxpay6,0\
) ,nvl(taxpay7,0) ,nvl(taxpay8,0) ,nvl(paysum,0) ,nvl(totpay,0) ,nvl(taxpays\
um,0) ,nvl(notaxpaysum,0) ,nvl(basicded,0) ,nvl(mateded,0) ,nvl(famided,0) ,\
nvl(obsded,0) ,nvl(silverded,0) ,nvl(womanded,0) ,nvl(eduded,0) ,nvl(childde\
d,0) ,nvl(speded,0) ,nvl(anuded,0) ,(((((((((((((((((((((((((nvl(anudamt,0)+\
nvl(meddamt,0))+nvl(longmtamt,0))+nvl(empamt,0))+nvl(hsorgamt,0))+nvl(hsinta\
mt,0))+nvl(sacorpcp,0))+nvl(sacorpamt,0))+nvl(sabankcp,0))+nvl(sabankamt,0))\
+nvl(sangamt,0))+nvl(nbamt,0))+nvl(saveamt3,0))+nvl(ticketamt,0))+nvl(sauamt\
,0))+nvl(igamt,0))+nvl(meddedamt,0))+nvl(dedamt0,0))+nvl(dedamt1,0))+nvl(ded\
amt2,0))+nvl(dedamt3,0))+nvl(dedamt4,0))+nvl(dedamt5,0))+nvl(dedamt6,0))+nvl\
(dedamt7,0))+nvl(dedamt8,0)) dedsum ,nvl(tax");
     sqlstm.stmt = sq0004;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )146;
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
          print_errmsg(sqlca.sqlcode,"Cursor cursor1 Open Error...");
          sprintf(log_buff, "Cursor cursor1 Open Error 2.....");
          Write_batlog(seqno++, log_buff);                       
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 23;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )169;
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
                :empno,       :juminid,     
                :matedcnt,    :famidcnt,
                :sbonamt,     :aidamt3,
                :bokjisupamt, :medsupamt,
                :selfeduamt,  :trainsupamt,
                :taxpay1,     :taxpay2,
                :taxpay3,     :taxpay4,     
                :taxpay5,     :taxpay6,
                :taxpay7,     :taxpay8,
                :paysum,      :totpay,
                :taxpaysum,   :notaxpaysum,
                :basicded,    :mateded,    
                :famided,     :obsded,    
                :silverded,   :womanded,   
                :eduded,      :childded,   
                :speded,      :anuded,      
                :dedsum,
                :taxrate1,    :taxrate2,   :taxrate3, 
                :taxrate4,    :taxrate5,   :taxrate6,
                :taxrate7,    :taxrate8,   :taxrate9,
                :mcartaxamt,  :fixpay; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 44;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )184;
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
           sqlstm.sqhstv[2] = (unsigned char  *)&matedcnt;
           sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)&famidcnt;
           sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[3] = (         int  )0;
           sqlstm.sqindv[3] = (         short *)0;
           sqlstm.sqinds[3] = (         int  )0;
           sqlstm.sqharm[3] = (unsigned long )0;
           sqlstm.sqadto[3] = (unsigned short )0;
           sqlstm.sqtdso[3] = (unsigned short )0;
           sqlstm.sqhstv[4] = (unsigned char  *)&sbonamt;
           sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[4] = (         int  )0;
           sqlstm.sqindv[4] = (         short *)0;
           sqlstm.sqinds[4] = (         int  )0;
           sqlstm.sqharm[4] = (unsigned long )0;
           sqlstm.sqadto[4] = (unsigned short )0;
           sqlstm.sqtdso[4] = (unsigned short )0;
           sqlstm.sqhstv[5] = (unsigned char  *)&aidamt3;
           sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[5] = (         int  )0;
           sqlstm.sqindv[5] = (         short *)0;
           sqlstm.sqinds[5] = (         int  )0;
           sqlstm.sqharm[5] = (unsigned long )0;
           sqlstm.sqadto[5] = (unsigned short )0;
           sqlstm.sqtdso[5] = (unsigned short )0;
           sqlstm.sqhstv[6] = (unsigned char  *)&bokjisupamt;
           sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[6] = (         int  )0;
           sqlstm.sqindv[6] = (         short *)0;
           sqlstm.sqinds[6] = (         int  )0;
           sqlstm.sqharm[6] = (unsigned long )0;
           sqlstm.sqadto[6] = (unsigned short )0;
           sqlstm.sqtdso[6] = (unsigned short )0;
           sqlstm.sqhstv[7] = (unsigned char  *)&medsupamt;
           sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[7] = (         int  )0;
           sqlstm.sqindv[7] = (         short *)0;
           sqlstm.sqinds[7] = (         int  )0;
           sqlstm.sqharm[7] = (unsigned long )0;
           sqlstm.sqadto[7] = (unsigned short )0;
           sqlstm.sqtdso[7] = (unsigned short )0;
           sqlstm.sqhstv[8] = (unsigned char  *)&selfeduamt;
           sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[8] = (         int  )0;
           sqlstm.sqindv[8] = (         short *)0;
           sqlstm.sqinds[8] = (         int  )0;
           sqlstm.sqharm[8] = (unsigned long )0;
           sqlstm.sqadto[8] = (unsigned short )0;
           sqlstm.sqtdso[8] = (unsigned short )0;
           sqlstm.sqhstv[9] = (unsigned char  *)&trainsupamt;
           sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[9] = (         int  )0;
           sqlstm.sqindv[9] = (         short *)0;
           sqlstm.sqinds[9] = (         int  )0;
           sqlstm.sqharm[9] = (unsigned long )0;
           sqlstm.sqadto[9] = (unsigned short )0;
           sqlstm.sqtdso[9] = (unsigned short )0;
           sqlstm.sqhstv[10] = (unsigned char  *)&taxpay1;
           sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[10] = (         int  )0;
           sqlstm.sqindv[10] = (         short *)0;
           sqlstm.sqinds[10] = (         int  )0;
           sqlstm.sqharm[10] = (unsigned long )0;
           sqlstm.sqadto[10] = (unsigned short )0;
           sqlstm.sqtdso[10] = (unsigned short )0;
           sqlstm.sqhstv[11] = (unsigned char  *)&taxpay2;
           sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[11] = (         int  )0;
           sqlstm.sqindv[11] = (         short *)0;
           sqlstm.sqinds[11] = (         int  )0;
           sqlstm.sqharm[11] = (unsigned long )0;
           sqlstm.sqadto[11] = (unsigned short )0;
           sqlstm.sqtdso[11] = (unsigned short )0;
           sqlstm.sqhstv[12] = (unsigned char  *)&taxpay3;
           sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[12] = (         int  )0;
           sqlstm.sqindv[12] = (         short *)0;
           sqlstm.sqinds[12] = (         int  )0;
           sqlstm.sqharm[12] = (unsigned long )0;
           sqlstm.sqadto[12] = (unsigned short )0;
           sqlstm.sqtdso[12] = (unsigned short )0;
           sqlstm.sqhstv[13] = (unsigned char  *)&taxpay4;
           sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[13] = (         int  )0;
           sqlstm.sqindv[13] = (         short *)0;
           sqlstm.sqinds[13] = (         int  )0;
           sqlstm.sqharm[13] = (unsigned long )0;
           sqlstm.sqadto[13] = (unsigned short )0;
           sqlstm.sqtdso[13] = (unsigned short )0;
           sqlstm.sqhstv[14] = (unsigned char  *)&taxpay5;
           sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[14] = (         int  )0;
           sqlstm.sqindv[14] = (         short *)0;
           sqlstm.sqinds[14] = (         int  )0;
           sqlstm.sqharm[14] = (unsigned long )0;
           sqlstm.sqadto[14] = (unsigned short )0;
           sqlstm.sqtdso[14] = (unsigned short )0;
           sqlstm.sqhstv[15] = (unsigned char  *)&taxpay6;
           sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[15] = (         int  )0;
           sqlstm.sqindv[15] = (         short *)0;
           sqlstm.sqinds[15] = (         int  )0;
           sqlstm.sqharm[15] = (unsigned long )0;
           sqlstm.sqadto[15] = (unsigned short )0;
           sqlstm.sqtdso[15] = (unsigned short )0;
           sqlstm.sqhstv[16] = (unsigned char  *)&taxpay7;
           sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[16] = (         int  )0;
           sqlstm.sqindv[16] = (         short *)0;
           sqlstm.sqinds[16] = (         int  )0;
           sqlstm.sqharm[16] = (unsigned long )0;
           sqlstm.sqadto[16] = (unsigned short )0;
           sqlstm.sqtdso[16] = (unsigned short )0;
           sqlstm.sqhstv[17] = (unsigned char  *)&taxpay8;
           sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[17] = (         int  )0;
           sqlstm.sqindv[17] = (         short *)0;
           sqlstm.sqinds[17] = (         int  )0;
           sqlstm.sqharm[17] = (unsigned long )0;
           sqlstm.sqadto[17] = (unsigned short )0;
           sqlstm.sqtdso[17] = (unsigned short )0;
           sqlstm.sqhstv[18] = (unsigned char  *)&paysum;
           sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[18] = (         int  )0;
           sqlstm.sqindv[18] = (         short *)0;
           sqlstm.sqinds[18] = (         int  )0;
           sqlstm.sqharm[18] = (unsigned long )0;
           sqlstm.sqadto[18] = (unsigned short )0;
           sqlstm.sqtdso[18] = (unsigned short )0;
           sqlstm.sqhstv[19] = (unsigned char  *)&totpay;
           sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[19] = (         int  )0;
           sqlstm.sqindv[19] = (         short *)0;
           sqlstm.sqinds[19] = (         int  )0;
           sqlstm.sqharm[19] = (unsigned long )0;
           sqlstm.sqadto[19] = (unsigned short )0;
           sqlstm.sqtdso[19] = (unsigned short )0;
           sqlstm.sqhstv[20] = (unsigned char  *)&taxpaysum;
           sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[20] = (         int  )0;
           sqlstm.sqindv[20] = (         short *)0;
           sqlstm.sqinds[20] = (         int  )0;
           sqlstm.sqharm[20] = (unsigned long )0;
           sqlstm.sqadto[20] = (unsigned short )0;
           sqlstm.sqtdso[20] = (unsigned short )0;
           sqlstm.sqhstv[21] = (unsigned char  *)&notaxpaysum;
           sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[21] = (         int  )0;
           sqlstm.sqindv[21] = (         short *)0;
           sqlstm.sqinds[21] = (         int  )0;
           sqlstm.sqharm[21] = (unsigned long )0;
           sqlstm.sqadto[21] = (unsigned short )0;
           sqlstm.sqtdso[21] = (unsigned short )0;
           sqlstm.sqhstv[22] = (unsigned char  *)&basicded;
           sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[22] = (         int  )0;
           sqlstm.sqindv[22] = (         short *)0;
           sqlstm.sqinds[22] = (         int  )0;
           sqlstm.sqharm[22] = (unsigned long )0;
           sqlstm.sqadto[22] = (unsigned short )0;
           sqlstm.sqtdso[22] = (unsigned short )0;
           sqlstm.sqhstv[23] = (unsigned char  *)&mateded;
           sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[23] = (         int  )0;
           sqlstm.sqindv[23] = (         short *)0;
           sqlstm.sqinds[23] = (         int  )0;
           sqlstm.sqharm[23] = (unsigned long )0;
           sqlstm.sqadto[23] = (unsigned short )0;
           sqlstm.sqtdso[23] = (unsigned short )0;
           sqlstm.sqhstv[24] = (unsigned char  *)&famided;
           sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[24] = (         int  )0;
           sqlstm.sqindv[24] = (         short *)0;
           sqlstm.sqinds[24] = (         int  )0;
           sqlstm.sqharm[24] = (unsigned long )0;
           sqlstm.sqadto[24] = (unsigned short )0;
           sqlstm.sqtdso[24] = (unsigned short )0;
           sqlstm.sqhstv[25] = (unsigned char  *)&obsded;
           sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[25] = (         int  )0;
           sqlstm.sqindv[25] = (         short *)0;
           sqlstm.sqinds[25] = (         int  )0;
           sqlstm.sqharm[25] = (unsigned long )0;
           sqlstm.sqadto[25] = (unsigned short )0;
           sqlstm.sqtdso[25] = (unsigned short )0;
           sqlstm.sqhstv[26] = (unsigned char  *)&silverded;
           sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[26] = (         int  )0;
           sqlstm.sqindv[26] = (         short *)0;
           sqlstm.sqinds[26] = (         int  )0;
           sqlstm.sqharm[26] = (unsigned long )0;
           sqlstm.sqadto[26] = (unsigned short )0;
           sqlstm.sqtdso[26] = (unsigned short )0;
           sqlstm.sqhstv[27] = (unsigned char  *)&womanded;
           sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[27] = (         int  )0;
           sqlstm.sqindv[27] = (         short *)0;
           sqlstm.sqinds[27] = (         int  )0;
           sqlstm.sqharm[27] = (unsigned long )0;
           sqlstm.sqadto[27] = (unsigned short )0;
           sqlstm.sqtdso[27] = (unsigned short )0;
           sqlstm.sqhstv[28] = (unsigned char  *)&eduded;
           sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[28] = (         int  )0;
           sqlstm.sqindv[28] = (         short *)0;
           sqlstm.sqinds[28] = (         int  )0;
           sqlstm.sqharm[28] = (unsigned long )0;
           sqlstm.sqadto[28] = (unsigned short )0;
           sqlstm.sqtdso[28] = (unsigned short )0;
           sqlstm.sqhstv[29] = (unsigned char  *)&childded;
           sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[29] = (         int  )0;
           sqlstm.sqindv[29] = (         short *)0;
           sqlstm.sqinds[29] = (         int  )0;
           sqlstm.sqharm[29] = (unsigned long )0;
           sqlstm.sqadto[29] = (unsigned short )0;
           sqlstm.sqtdso[29] = (unsigned short )0;
           sqlstm.sqhstv[30] = (unsigned char  *)&speded;
           sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[30] = (         int  )0;
           sqlstm.sqindv[30] = (         short *)0;
           sqlstm.sqinds[30] = (         int  )0;
           sqlstm.sqharm[30] = (unsigned long )0;
           sqlstm.sqadto[30] = (unsigned short )0;
           sqlstm.sqtdso[30] = (unsigned short )0;
           sqlstm.sqhstv[31] = (unsigned char  *)&anuded;
           sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[31] = (         int  )0;
           sqlstm.sqindv[31] = (         short *)0;
           sqlstm.sqinds[31] = (         int  )0;
           sqlstm.sqharm[31] = (unsigned long )0;
           sqlstm.sqadto[31] = (unsigned short )0;
           sqlstm.sqtdso[31] = (unsigned short )0;
           sqlstm.sqhstv[32] = (unsigned char  *)&dedsum;
           sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[32] = (         int  )0;
           sqlstm.sqindv[32] = (         short *)0;
           sqlstm.sqinds[32] = (         int  )0;
           sqlstm.sqharm[32] = (unsigned long )0;
           sqlstm.sqadto[32] = (unsigned short )0;
           sqlstm.sqtdso[32] = (unsigned short )0;
           sqlstm.sqhstv[33] = (unsigned char  *)&taxrate1;
           sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[33] = (         int  )0;
           sqlstm.sqindv[33] = (         short *)0;
           sqlstm.sqinds[33] = (         int  )0;
           sqlstm.sqharm[33] = (unsigned long )0;
           sqlstm.sqadto[33] = (unsigned short )0;
           sqlstm.sqtdso[33] = (unsigned short )0;
           sqlstm.sqhstv[34] = (unsigned char  *)&taxrate2;
           sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[34] = (         int  )0;
           sqlstm.sqindv[34] = (         short *)0;
           sqlstm.sqinds[34] = (         int  )0;
           sqlstm.sqharm[34] = (unsigned long )0;
           sqlstm.sqadto[34] = (unsigned short )0;
           sqlstm.sqtdso[34] = (unsigned short )0;
           sqlstm.sqhstv[35] = (unsigned char  *)&taxrate3;
           sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[35] = (         int  )0;
           sqlstm.sqindv[35] = (         short *)0;
           sqlstm.sqinds[35] = (         int  )0;
           sqlstm.sqharm[35] = (unsigned long )0;
           sqlstm.sqadto[35] = (unsigned short )0;
           sqlstm.sqtdso[35] = (unsigned short )0;
           sqlstm.sqhstv[36] = (unsigned char  *)&taxrate4;
           sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[36] = (         int  )0;
           sqlstm.sqindv[36] = (         short *)0;
           sqlstm.sqinds[36] = (         int  )0;
           sqlstm.sqharm[36] = (unsigned long )0;
           sqlstm.sqadto[36] = (unsigned short )0;
           sqlstm.sqtdso[36] = (unsigned short )0;
           sqlstm.sqhstv[37] = (unsigned char  *)&taxrate5;
           sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[37] = (         int  )0;
           sqlstm.sqindv[37] = (         short *)0;
           sqlstm.sqinds[37] = (         int  )0;
           sqlstm.sqharm[37] = (unsigned long )0;
           sqlstm.sqadto[37] = (unsigned short )0;
           sqlstm.sqtdso[37] = (unsigned short )0;
           sqlstm.sqhstv[38] = (unsigned char  *)&taxrate6;
           sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[38] = (         int  )0;
           sqlstm.sqindv[38] = (         short *)0;
           sqlstm.sqinds[38] = (         int  )0;
           sqlstm.sqharm[38] = (unsigned long )0;
           sqlstm.sqadto[38] = (unsigned short )0;
           sqlstm.sqtdso[38] = (unsigned short )0;
           sqlstm.sqhstv[39] = (unsigned char  *)&taxrate7;
           sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[39] = (         int  )0;
           sqlstm.sqindv[39] = (         short *)0;
           sqlstm.sqinds[39] = (         int  )0;
           sqlstm.sqharm[39] = (unsigned long )0;
           sqlstm.sqadto[39] = (unsigned short )0;
           sqlstm.sqtdso[39] = (unsigned short )0;
           sqlstm.sqhstv[40] = (unsigned char  *)&taxrate8;
           sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[40] = (         int  )0;
           sqlstm.sqindv[40] = (         short *)0;
           sqlstm.sqinds[40] = (         int  )0;
           sqlstm.sqharm[40] = (unsigned long )0;
           sqlstm.sqadto[40] = (unsigned short )0;
           sqlstm.sqtdso[40] = (unsigned short )0;
           sqlstm.sqhstv[41] = (unsigned char  *)&taxrate9;
           sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[41] = (         int  )0;
           sqlstm.sqindv[41] = (         short *)0;
           sqlstm.sqinds[41] = (         int  )0;
           sqlstm.sqharm[41] = (unsigned long )0;
           sqlstm.sqadto[41] = (unsigned short )0;
           sqlstm.sqtdso[41] = (unsigned short )0;
           sqlstm.sqhstv[42] = (unsigned char  *)&mcartaxamt;
           sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[42] = (         int  )0;
           sqlstm.sqindv[42] = (         short *)0;
           sqlstm.sqinds[42] = (         int  )0;
           sqlstm.sqharm[42] = (unsigned long )0;
           sqlstm.sqadto[42] = (unsigned short )0;
           sqlstm.sqtdso[42] = (unsigned short )0;
           sqlstm.sqhstv[43] = (unsigned char  *)&fixpay;
           sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[43] = (         int  )0;
           sqlstm.sqindv[43] = (         short *)0;
           sqlstm.sqinds[43] = (         int  )0;
           sqlstm.sqharm[43] = (unsigned long )0;
           sqlstm.sqadto[43] = (unsigned short )0;
           sqlstm.sqtdso[43] = (unsigned short )0;
           sqlstm.sqphsv = sqlstm.sqhstv;
           sqlstm.sqphsl = sqlstm.sqhstl;
           sqlstm.sqphss = sqlstm.sqhsts;
           sqlstm.sqpind = sqlstm.sqindv;
           sqlstm.sqpins = sqlstm.sqinds;
           sqlstm.sqparm = sqlstm.sqharm;
           sqlstm.sqparc = sqlstm.sqharc;
           sqlstm.sqpadto = sqlstm.sqadto;
           sqlstm.sqptdso = sqlstm.sqtdso;
           sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


           
           if (sqlca.sqlcode == 1403)
           {
                /* EXEC SQL CLOSE cursor1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 44;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )375;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                printf("처리된 작업대상자 : [%d] 명 \n",rcount);
                return;
           }       
           
           if (sqlca.sqlcode != 0)
           {
                print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error 1...");
                /* EXEC SQL CLOSE cursor1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 44;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )390;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                error_quit("작업실패...");
           }
           
           if ((Calc_TaxStep1() == SUCCESS) && 
               (Calc_TaxStep_new() == SUCCESS) && 
/*
               (Calc_TaxStep2() == SUCCESS) && 
               (Calc_TaxStep3() == SUCCESS) && 
*/
               (Get_RealPay()   == SUCCESS))
           {
                if (Update_Record() == SUCCESS) 
                    rcount++;
                else
                {
                    /* EXEC SQL CLOSE cursor1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 44;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )405;
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
                sqlstm.arrsiz = 44;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )420;
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
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

       char  year[5]   = "";
     /* EXEC SQL END DECLARE SECTION; */ 

       
     char emp2[2] = "";
     
     if (Get_AccuSums() == FAIL)      /* 전월누계읽기  */
        return(FAIL);
   
     /*if      (strcmp(empno,"M912" )==0) YY_TaxPay = totpay;                
     else if (strcmp(empno,"M913" )==0) YY_TaxPay = totpay;                고문은 연봉 그대로*/
     
     YY_TaxPay = totpay + (totpay * 0.1);  /*연과세액추정치 = 연봉+연봉10%, 사외이사,고문포함 */
     
     /*2013.03.22 박찬일 손필영 매니저 요청 총과세액 추정치를 높여서 세금을 많이 떼어놓게 함

     M151 안승윤 374,400,000원  M152 이인찬 342,000,000원  M154 이종봉 312,000,000원  M157 이방렬 218,400,000원
     이상 연봉의 20% 가산되는 분들(4분)

     다음은 연봉의 15% 가산되는 분들(3분)
     M932 이승석 184,000,000  M933 방찬점 178,480,000  M931 홍성균 133,407,360
     */
     
     /* 2014.01.23 손필영 매니저 요청으로 삭제 
     if ((strcmp(empno,"M151")==0) || (strcmp(empno,"M152")==0) || (strcmp(empno,"M154")==0) || (strcmp(empno,"M157")==0)) 
         YY_TaxPay = totpay + (totpay * 0.2);  //총년봉 + 20%추가.
     if ((strcmp(empno,"M932")==0) || (strcmp(empno,"M933")==0) || (strcmp(empno,"M931")==0))      
         YY_TaxPay = totpay + (totpay * 0.15); //총년봉 + 15%추가.
     */
     
     /*dsa2000  2018.03. 항상 세금공제토록 주석처리
     if (strcmp(incentiveyn, "Y") == 0 ) 상여만 지급시에는 기본세금 나오지 않도록. 
     {
         YY_TaxPay = 0;
     }*/
     
   /*YY_TaxPay = totpay + (totpay * 0.1);         2010년 (모든 임원)
     YY_TaxPay = totpay + (totpay * 0.1);         2009년 (M9 사번은 연봉 그대로.)
     YY_TaxPay = totpay + mcartaxamt*12 -3000000; 2008년 연봉에 포함된 중식비 300만원 제외.*/
   /*sprintf(emp2,"%.2s",empno);  if  (strcmp(emp2 ,"M9" )==0) YY_TaxPay = totpay; */

     /*비과세급여만 있을 경우에는 세금 나오지 않도록 하기 위하여 추가 2012.02.22*/
     if ((paysum - notaxpaysum) == 0 )
         YY_TaxPay = 0;
      
     return(SUCCESS);
}


Get_AccuSums()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

       char  year[5]     = "";
       char  basedate[9] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char buf[3] = "";
     
     sprintf(year,"%.4s",paydate);
     sprintf(buf ,"%.2s",paydate+4);
     if (strcmp(buf,"01") == 0)
     {
         tmp_taxgross   = 0;
         tmp_notaxgross = 0; 
         tmp_intaxsum   = 0;
         return(SUCCESS);
     }
     
     /* EXEC SQL 
     select  sum(taxpaysum),  sum(notaxpaysum),  
             sum(intax),      nvl(max(paydate),'#') 
       into :tmp_taxgross,  :tmp_notaxgross, 
            :tmp_intaxsum,  :basedate
       from  pkzhphis
      where  empno   = :empno
        and  paydate > :year
        and  paydate < :paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 44;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(taxpaysum) ,sum(notaxpaysum) ,sum(intax) ,nv\
l(max(paydate),'#') into :b0,:b1,:b2,:b3  from pkzhphis where ((empno=:b4 and\
 paydate>:b5) and paydate<:b6)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )435;
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
     sqlstm.sqhstv[3] = (unsigned char  *)basedate;
     sqlstm.sqhstl[3] = (unsigned long )9;
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
     sqlstm.sqhstv[5] = (unsigned char  *)year;
     sqlstm.sqhstl[5] = (unsigned long )5;
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
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          printf("basedate : [%s], empno : [%s] \n",basedate, empno);
          print_errmsg(sqlca.sqlcode,"급여이력화일 읽기오류2...");
          sprintf(log_buff, "급여이력화일 읽기오류2..."); 
          Write_batlog(seqno++, log_buff);               
          return(FAIL);
     }
     
     if (basedate[0] == '#') 
     {  
          printf("basedate : [%s], empno : [%s] \n",basedate, empno);
          tmp_taxgross   = 0;
          tmp_notaxgross = 0; 
          tmp_intaxsum   = 0;
          return(SUCCESS);
     }
         
     return(SUCCESS);
}

/*****************************************************************************
    연간근로소득금액을 구하는 루틴.
*****************************************************************************/
Calc_TaxStep2()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

       char  year[5]   = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     double  t1, t2, t3, t4, t5 ;
     t1 = t2 = t3 = t4 = t5 = 0;
     
     t1 = indedbasic * indedbrate / 100; 
     
     if ((YY_TaxPay > indedbasic) && (YY_TaxPay <= indedlimit2))
     {
         t2 = (YY_TaxPay   - indedbasic)  * indedorate  / 100;
     }  
     else if ((YY_TaxPay > indedlimit2) && (YY_TaxPay <= indedlimit3))
     {
         t2 = (indedlimit2 - indedbasic)  * indedorate  / 100;
         t3 = (YY_TaxPay   - indedlimit2) * indedorate2 / 100;
     }  
     else if ((YY_TaxPay > indedlimit3) && (YY_TaxPay <= indedlimit4))
     {
         t2 = (indedlimit2 - indedbasic)  * indedorate  / 100;
         t3 = (indedlimit3 - indedlimit2) * indedorate2 / 100;
         t4 = (YY_TaxPay   - indedlimit3) * indedorate3 / 100;
     }  
     else if (YY_TaxPay > indedlimit4)
     {
         t2 = (indedlimit2 - indedbasic)  * indedorate  / 100;
         t3 = (indedlimit3 - indedlimit2) * indedorate2 / 100;
         t4 = (indedlimit4 - indedlimit3) * indedorate3 / 100;  
         t5 = (YY_TaxPay   - indedlimit4) * indedorate4 / 100;  
     }   
     
     YY_LabInDed = t1+t2+t3+t4+t5 ;
       
     YY_LabInDed = floor(YY_LabInDed);
     
     YY_LabNeedDed = YY_LabInDed;
     
     YY_LabInAmt   = YY_TaxPay - YY_LabNeedDed;
     
     if (YY_LabInAmt < 0)  YY_LabInAmt = 0;

     /* ===== 특별공제액 변경에 따른 추가                     ====================
       ○ 부양가족 2인 이하  120만원 → 120만원 +연간 총급여액의 2.5% 공제 → 110만원 +연간 총급여액의 2.5% 공제(2009년세법)
       ○ 부양가족 3인 이상  240만원 → 240만원 +연간 총급여액의 5.0% 공제 → 250만원 +연간 총급여액의 5.0% 공제(2009년세법)
                                                                                   +연간 총급여액중 4천만원 초과분의 5%(미반영)
       ○ 부양가족 2인 이하 → 210만원 +연간 총급여액의 4.0% 공제(2012년세법)
       ○ 부양가족 3인 이상 → 350만원 +연간 총급여액의 7.0% 공제(2012년세법)
                                     +연간 총급여액중 4천만원 초과분의 5%(미반영)
     ============================================================================= */    
     if ( (matedcnt + famidcnt + 1) <= 2 )  /*본인포함+1*/
           speded = specialded2 + (YY_TaxPay * 4.0 / 100);
     else  speded = specialded3 + (YY_TaxPay * 7.0 / 100);  
     /*============================================================================= */              
     
     YY_InDed = basicded + mateded + famided + obsded   + silverded + 
                womanded + eduded  + speded  + childded + anuded;
     
     return(SUCCESS);  
}

/*****************************************************************************
    연과세표준을 구하는 함수.
*****************************************************************************/
Calc_TaxStep3()
{
     double  taxrate;
     double  yearded;
     double  YY_Intax;
     double  YY_Jutax;
     char    emp2[2] = "";
     char    buf[3]  = "";
     
     YY_TaxInAmt = YY_TaxPay - YY_LabNeedDed - YY_InDed ;    
     
     /* 사외이사 과세표준금액 고정.(실지급액을 특정금액으로 하기위해 .) 2008.07.14 김미진 요청. */
     if  (strcmp(empno,"M904") == 0)  YY_TaxInAmt = 70500000;
     
     if (YY_TaxInAmt < 0)  YY_TaxInAmt = 0;
     
     /* 연세율 구하기.. */
     if (Get_TaxRate(YY_TaxInAmt,&taxrate,&yearded) == FAIL)
         return(FAIL);   
     
     /* 사외이사 최고세율로 고정. 정미정 요청   2011.02.23*/
     if   (strcmp(empno,"M905") == 0)
     {
       taxrate = 35;
       yearded = 0;
     }
          
     taxrate1    = taxrate;
     
     /* 산출세액 */
     YY_CalcTax  = (YY_TaxInAmt * taxrate / 100) - yearded; 
     
     YY_CalcTax  = floor(YY_CalcTax); 
     
     if (YY_CalcTax < taxdedbasic)
     {
         labtaxded = YY_CalcTax * taxdedbrate / 100;
     }  
     else
     {
         labtaxded = (taxdedbasic * taxdedbrate / 100) + ((YY_CalcTax - taxdedbasic) * taxdedorate / 100); 
               
         if (labtaxded > taxdedlimit)  labtaxded = taxdedlimit;
     }
     
     labtaxded = floor(labtaxded);
       
     YY_Intax  = YY_CalcTax - labtaxded;
     
     intax1    = floor(YY_Intax / 12 / 10) * 10;  
     
     if (YY_Intax < 0) YY_Intax = 0;
         
     /*SK Networks 전임자 : 당월급여의 기본급+중식비에 대해서만 단일세율 지정.
     if (strcmp(empno,"M138") == 0)   intax1 = floor( (fixpay + mcartaxamt) * 16 / 100 / 10 ) * 10;
     if (strcmp(empno,"M139") == 0)   intax1 = floor( (fixpay + mcartaxamt) * 18 / 100 / 10 ) * 10;
     if (strcmp(empno,"M140") == 0)   intax1 = floor( (fixpay + mcartaxamt) * 10 / 100 / 10 ) * 10;     */
       
     intax2 = floor( taxrate2 / 100 *  sbonamt     / 10) * 10;
     intax3 = floor( taxrate3 / 100 *  aidamt3     / 10) * 10;
     intax4 = floor( taxrate4 / 100 *  bokjisupamt / 10) * 10;
     intax5 = floor( taxrate5 / 100 * (medsupamt +
                                       selfeduamt )/ 10) * 10;                 /*trainsupamt 2008.09 폐지*/       
     intax6 = floor( taxrate6 / 100 *  taxpay1     / 10) * 10;
     intax7 = floor( taxrate7 / 100 *  taxpay2     / 10) * 10;
     intax8 = floor( taxrate8 / 100 *  taxpay3     / 10) * 10;
     intax9 = floor( taxrate9 / 100 *  taxpay4     / 10) * 10;
             
     intax  = intax1 + intax2 + intax3 + intax4 + intax5 + intax6 + intax7 + intax8 + intax9;  
     
     /* intax  = floor(intax / 10) * 10;
     
     if (strcmp(empno,"M035") == 0)
     { printf("%f\n",intax);
       printf("%f\n",intax1);
       printf("%f\n",intax2);
       printf("%f\n",intax3);
       printf("%f\n",intax4);
       printf("%f\n",intax5);
       printf("%f\n",intax6);
       printf("%f\n",intax7);
       printf("%f\n",intax8);
       printf("%f\n",intax9);
     }     */
       
     if (intax < 0) intax = 0;
     
     /* 주민세 */
     jutax  = floor( intax * jutaxrate / 100 / 10 ) * 10;
     
     return(SUCCESS);
}

/*****************************************************************************
    연간근로소득금액을 구하는 루틴.
*****************************************************************************/
Calc_TaxStep_new()
{
     YY_LabInDed   = 0;
     YY_LabNeedDed = 0;
     YY_LabInAmt   = 0;
     speded        = 0;  
     YY_InDed      = 0;    
     YY_TaxInAmt   = 0;    
     YY_CalcTax    = 0; 
     
     labtaxded     = 0;   
     
     intax1        = trunc(taxpaysum * taxrate1 / 100 / 10) * 10;  
     
     if (intax1 < 0) intax1 = 0;
                
     intax2 = floor( taxrate2 / 100 *  sbonamt     / 10) * 10;
     intax3 = floor( taxrate3 / 100 *  aidamt3     / 10) * 10;
     intax4 = floor( taxrate4 / 100 *  bokjisupamt / 10) * 10;
     intax5 = floor( taxrate5 / 100 * (medsupamt +
                                       selfeduamt )/ 10) * 10;                 /*trainsupamt 2008.09 폐지*/       
     intax6 = floor( taxrate6 / 100 *  taxpay1     / 10) * 10;
     intax7 = floor( taxrate7 / 100 *  taxpay2     / 10) * 10;
     intax8 = floor( taxrate8 / 100 *  taxpay3     / 10) * 10;
     intax9 = floor( taxrate9 / 100 *  taxpay4     / 10) * 10;
             
     intax  = intax1 + intax2 + intax3 + intax4 + intax5 + intax6 + intax7 + intax8 + intax9;  
     
     /* intax  = floor(intax / 10) * 10;
     
     if (strcmp(empno,"M035") == 0)
     { printf("%f\n",intax);
       printf("%f\n",intax1);
       printf("%f\n",intax2);
       printf("%f\n",intax3);
       printf("%f\n",intax4);
       printf("%f\n",intax5);
       printf("%f\n",intax6);
       printf("%f\n",intax7);
       printf("%f\n",intax8);
       printf("%f\n",intax9);
     }     */
       
     if (intax < 0) intax = 0;
     
     /* 주민세 */
     jutax  = floor( intax * jutaxrate / 100 / 10 ) * 10;
     
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
     select  nvl(taxrate,0), nvl(yearded,0)
       into  :t_rate,       :t_yearded
       from  pkcpbas, pkcptax
      where (:t_taxlevel >= taxpayfr and :t_taxlevel < taxpayto) 
        and  taxnum = (select ctaxnum from  pkcpbas); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 44;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(taxrate,0) ,nvl(yearded,0) into :b0,:b1  fro\
m pkcpbas ,pkcptax where ((:b2>=taxpayfr and :b2<taxpayto) and taxnum=(select\
 ctaxnum  from pkcpbas ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )478;
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


     
     if (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"연세율표 읽기오류...");
          sprintf(log_buff, "연세율표 읽기오류....");
          Write_batlog(seqno++, log_buff);           
          return(FAIL);
     }
     
     *taxrate = t_rate;
     
     *yearded = t_yearded;
     
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
     dedsum     = dedsum  + intax + jutax;
     realpay    = paysum - dedsum;
     
     return(SUCCESS);
}

/***************************************************************************
  Update_Record()  Function.
****************************************************************************/
Update_Record()
{
     labinded   = YY_LabInDed;
     labneedded = YY_LabNeedDed;
     labinamt   = YY_LabInAmt;
     inded      = YY_InDed;
     taxinamt   = YY_TaxInAmt;
     calctax    = YY_CalcTax;
     
     /* EXEC SQL 
     update  pkzmpmas
        set  yytaxpaysum = :YY_TaxPay,
             speded      = :speded,
             labinded    = :labinded, 
             labinamt    = :labinamt, 
             taxinamt    = :taxinamt, 
             calctax     = :calctax,
             labtaxded   = :labtaxded, 
             intax1      = :intax1, 
             intax2      = :intax2, 
             intax3      = :intax3, 
             intax4      = :intax4, 
             intax5      = :intax5, 
             intax6      = :intax6, 
             intax7      = :intax7, 
             intax8      = :intax8, 
             intax9      = :intax9, 
             intax       = :intax, 
             jutax       = :jutax, 
             taxrate1    = :taxrate1,
             dedsum      = :dedsum,
             realpay     = :realpay, 
             intaxsum    = :tmp_intaxsum,
             writeman    = :writeman,
             writetime   = to_char(sysdate,'YYYYMMDDHH24MISSD')
      where  empno       = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 44;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkzmpmas  set yytaxpaysum=:b0,speded=:b1,labinde\
d=:b2,labinamt=:b3,taxinamt=:b4,calctax=:b5,labtaxded=:b6,intax1=:b7,intax2=:\
b8,intax3=:b9,intax4=:b10,intax5=:b11,intax6=:b12,intax7=:b13,intax8=:b14,int\
ax9=:b15,intax=:b16,jutax=:b17,taxrate1=:b18,dedsum=:b19,realpay=:b20,intaxsu\
m=:b21,writeman=:b22,writetime=to_char(sysdate,'YYYYMMDDHH24MISSD') where emp\
no=:b23";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )509;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&YY_TaxPay;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&speded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&labinded;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&labinamt;
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
     sqlstm.sqhstv[7] = (unsigned char  *)&intax1;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&intax2;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&intax3;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&intax4;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&intax5;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&intax6;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&intax7;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&intax8;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&intax9;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&intax;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&jutax;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&taxrate1;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&dedsum;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&realpay;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&tmp_intaxsum;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)writeman;
     sqlstm.sqhstl[22] = (unsigned long )5;
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)empno;
     sqlstm.sqhstl[23] = (unsigned long )5;
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류...");
          sprintf(log_buff, "월급여화일 쓰기오류...SQLCODE[%s]\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);            
          return(FAIL);
     }
     else  return(SUCCESS);
}

/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void   print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
}

int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 44;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )620;
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
     sqlstm.arrsiz = 44;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )661;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}                     
/*hinsacc pkz10502
mv pkz10502 ~/HINSA/proc/bin/Kbin*/