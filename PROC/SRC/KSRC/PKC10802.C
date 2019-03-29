
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
    "pkc10802.pc"
};


static unsigned int sqlctx = 150187;


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
   unsigned char  *sqhstv[25];
   unsigned long  sqhstl[25];
            int   sqhsts[25];
            short *sqindv[25];
            int   sqinds[25];
   unsigned long  sqharm[25];
   unsigned long  *sqharc[25];
   unsigned short  sqadto[25];
   unsigned short  sqtdso[25];
} sqlstm = {12,25};

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

 static char *sq0006 = 
",0) ,NVL(D.YEARTAX,0) ,NVL(D.TAXRATE\
,0) ,NVL(D.TAXAMT,0) ,NVL(B.CHILDDED,0) ,NVL(A.MATEDCNT,0) ,NVL(A.FAMIDCNT,0)\
  from PKMPMAS A ,PKMPCALC B ,PKCPBAS C ,PKYEARTAX D where (((((b.empno>=:b0 \
and b.empno<=:b1) and a.empno=b.empno) and a.empno=d.empno) and b.paydate=d.p\
aydate) and d.paytype=:b2)           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,244,0,0,0,0,0,1,0,
20,0,0,2,68,0,5,276,0,0,0,0,0,1,0,
35,0,0,3,92,0,4,295,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
66,0,0,4,40,0,4,318,0,0,1,0,0,1,0,2,97,0,0,
85,0,0,5,521,0,4,336,0,0,21,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
184,0,0,6,1328,0,9,387,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
211,0,0,6,0,0,15,393,0,0,0,0,0,1,0,
226,0,0,6,0,0,13,402,0,0,25,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,
341,0,0,6,0,0,15,416,0,0,0,0,0,1,0,
356,0,0,6,0,0,15,424,0,0,0,0,0,1,0,
371,0,0,6,0,0,15,437,0,0,0,0,0,1,0,
386,0,0,6,0,0,15,443,0,0,0,0,0,1,0,
401,0,0,7,115,0,4,492,0,0,4,3,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
432,0,0,8,249,0,4,516,0,0,7,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,
475,0,0,9,157,0,4,802,0,0,4,2,0,1,0,2,4,0,0,2,4,0,0,1,4,0,0,1,4,0,0,
506,0,0,10,334,0,5,857,0,0,20,20,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
601,0,0,11,83,0,4,907,0,0,3,2,0,1,0,1,97,0,0,1,3,0,0,2,97,0,0,
628,0,0,12,50,0,3,926,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
669,0,0,13,0,0,29,936,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKC10802(급여 세금계산_2015년 7월 이후부터 사용)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : eyha
 Version        : 1.00
 Date           : 2015.07.15

Update Contents
  Version   date(yy.mm.dd)   programmer   description        relevant doc.no
 ~                                      2015년 7월 이전 세액계산 프로그램은 pkc10803.pc에 있음
 1.00			2015.07.15			 eyha	        2015년 세금계산 프로세스 개선 
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
/*     char    paydate[7]       = "";  급 여 지 급 월       */
     char    paydate[9]       = "";   /* 급 여 지 급 일 자    */
     char    paynum[3]        = "";   /* 급  호  차  수       */
     char    paycl[4]         = "";   /* 직   급      */
     float   paygr;                   /* 호   봉      */  
     char    pstate[3]        = "";   /* 인  사  상  태       */
     char    orgnum[4]        = "";   /* 조  직  차  수       */  
     char    deptcode[7]      = "";   /* 부  서  코  드       */
     char    bldcode[3]       = "";   /* 근 무 지 코 드       */
     char    payyn[2]         = "";   /* 급여지급여부         */

     double  basicded;                /* 기초공제액          */
     double  mateded;                 /* 배우자공제액          */
     double  famided;                 /* 부양자공제액          */
     double  anuded;                  /* 국민연금보험료 공제액*/
     double  standded;                /* 표준공제액 */
     double  speded;                  /* 특별공제액 */  
     double  obsded;                  /* 장애자공제액          */
     double  silverded;               /* 경로우대장애액       */
     double  womanded;                /* 부녀자공제액         */
     double  eduded;                  /* 자녀양육비공제액     */
     double  spededamt;               /* 특별공제액           */  

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

     char    cretime[16]      = "";   /* 급여생성일시         */
     char    writetime[16]    = "";   /* 최종작업일시         */
     char    writeman[5]      = "";   /* 최종작업자           */  
     char    president_empno[5] = ""; /* 사장님 사번   */
          
     double  tmp_taxgross;
     double  tmp_notaxgross;
     double  tmp_intaxsum;
     double  tmp_calctaxsum;
     
     /*  월급여이력화일(pkhphis)      */
     double  qcalctax;                /* 산출세액           */
     
     /*  급여마스터  (PKMPMAS) 참조 변수                    */
     double  matecnt;                 /* 가족수(배우자)     */
     double  parentcnt;               /* 가족수(존속)       */
     double  childcnt;                /* 가족수(비속)       */
     double  matedcnt;                /* 배우자공제수       */
     double  famidcnt;                /* 부양자공제수       */
     double  obscnt;                  /* 장애자공제수       */
     double  silverdcnt;              /* 경로우대공제수     */
     double  womancnt;                /* 부녀자공제수       */
     
     /*  급여지급기준(PKCPBAS) 참조 변수                    */
     double  stdded;                  /* 표준공제액         */
     double  proprate;                /* 재형저축기금율     */
     double  jutaxrate;               /* 주민세율           */
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
     double  specialded1;             /* 특별공제액1인이하 추가 2015.07.22 eyha 추가*/
     double  specialded2;             /* 특별공제액2인이하 추가 */
     double  specialded3;             /* 특별공제액3인이상 추가 */
     double  cstdded;                 /* 특별공제액             */     
     double  childded          = 0;   /* 다자녀추가공제         */
                  
     char    month[7]          = "";  /* 월급여최종지급월   */
     char    frempno[5]        = "";
     char    toempno[5]        = "";
     char    paytype[1+1]      = "";  /* 급여구분   */
     
     double  yy_taxsum         = 0;   /* 2015.07.15 eyha 1년 과세급여총액 추정치       */
     double  yy_taxrate        = 0;   /* 2015.07.21 eyha 세율                          */
     double  yy_taxamt         = 0;   /* 2015.07.22 eyha 세액                          */
     
     
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
double  YY_TaxPay_Org   = 0;
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
                                          
     if  (argc != 8) {  /* pkc10802 200607 0000 zzzz 0 D006 pkc10802 20060719152849 */
          printf("[Usage] : pkc10802 1.급여년월 2.사번fr 3.사번to 4.급여구분 5.작업자 6.프로그램ID 7.시작시간 \n");
          exit(1);
     }
      
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkc10802");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(paydate,"%8s",argv[1]);
     sprintf(frempno,"%4s",argv[2]);
     sprintf(toempno,"%4s",argv[3]);
     sprintf(paytype,"%1s",argv[4]);     
     sprintf(writeman,"%4s",argv[5]);
     
     hinsa_log_print(0,"급여계산 프로그램 시작...[pkq10802]");
     hinsa_db_connect();  
     
     strcpy(log_writeman, argv[5]);
     strcpy(log_progid,   argv[6]);
     strcpy(log_rundate,  argv[7]);
      
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
     Write_batlog(seqno++, log_buff);        
     Process_Calc();
                
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);                     
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [월급여계산 작업성공] =====");
          Write_batlog(seqno++, log_buff);                          
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
              
     /* EXEC SQL
     update  pkcpbas
     set  paycalctime = to_char(sysdate,'YYYYMMDDHH24MISSD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycalctime=to_char(sysdate,'YYYYMM\
DDHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
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
          Write_batlog(seqno++, log_buff);               
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
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpcalc where ((empno>\
=:b1 and empno<=:b2) and paydate=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
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
          Write_batlog(seqno++, log_buff);              
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
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select presempno into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )66;
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
          Write_batlog(seqno++, log_buff);                        
          error_quit("작업실패...");
     }
}

/*****************************************************************************
   세금계산을 하는 Function.
*****************************************************************************/
void Process_TaxCalc()
{
     /* EXEC SQL 
     SELECT   NVL(PROPRATE,0),      NVL(JUTAXRATE,0),  NVL(STDDED,0),
              NVL(INDEDBASIC,0),    NVL(INDEDBRATE,0),    NVL(INDEDORATE,0),    NVL(INDEDLIMIT,0),
              NVL(INDEDORATE2,0),   NVL(INDEDLIMIT2,0),
              NVL(TAXDEDBASIC,0),   NVL(TAXDEDBRATE,0),   NVL(TAXDEDORATE,0),   NVL(TAXDEDLIMIT,0),
              NVL(INDEDLIMIT3,0),   NVL(INDEDORATE3,0),   NVL(INDEDLIMIT4,0),   NVL(INDEDORATE4,0),
              NVL(STDDED,0),        NVL(SPECIALDED1,0),   NVL(SPECIALDED2,0),   NVL(SPECIALDED3,0)   
       into   :proprate,            :jutaxrate,           :stdded, 
              :indedbasic,          :indedbrate,          :indedorate,          :indedlimit,
              :indedorate2,         :indedlimit2,                               
              :taxdedbasic,         :taxdedbrate,         :taxdedorate,         :taxdedlimit,
              :indedlimit3,         :indedorate3,         :indedlimit4,         :indedorate4,
              :cstdded,             :specialded1,         :specialded2,         :specialded3
     from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(PROPRATE,0) ,NVL(JUTAXRATE,0) ,NVL(STDDED,0)\
 ,NVL(INDEDBASIC,0) ,NVL(INDEDBRATE,0) ,NVL(INDEDORATE,0) ,NVL(INDEDLIMIT,0) \
,NVL(INDEDORATE2,0) ,NVL(INDEDLIMIT2,0) ,NVL(TAXDEDBASIC,0) ,NVL(TAXDEDBRATE,\
0) ,NVL(TAXDEDORATE,0) ,NVL(TAXDEDLIMIT,0) ,NVL(INDEDLIMIT3,0) ,NVL(INDEDORAT\
E3,0) ,NVL(INDEDLIMIT4,0) ,NVL(INDEDORATE4,0) ,NVL(STDDED,0) ,NVL(SPECIALDED1\
,0) ,NVL(SPECIALDED2,0) ,NVL(SPECIALDED3,0) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,\
:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b20  from pkcp\
bas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )85;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&proprate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&jutaxrate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&stdded;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&indedbasic;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&indedbrate;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&indedorate;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&indedlimit;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&indedorate2;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&indedlimit2;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&taxdedbasic;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&taxdedbrate;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&taxdedorate;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&taxdedlimit;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&indedlimit3;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&indedorate3;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&indedlimit4;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&indedorate4;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&cstdded;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&specialded1;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&specialded2;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&specialded3;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          Write_batlog(seqno++, log_buff);              
          error_quit("작업실패...");
     }
        
     /* EXEC SQL DECLARE cursor1 CURSOR FOR 
     SELECT NVL(B.EMPNO,      '*'),   NVL(B.Paycl,       '*'),   REPLACE(NVL(A.JUMINID,'####'),' ',''), 
            NVL(B.PAYSUM  , 0),   NVL(B.TAXPAYSUM, 0), NVL(B.NOTAXPAYSUM,0),   NVL(B.MEDDAMT,   0),
            NVL(B.BASICDED, 0),   NVL(B.MATEDED,   0), NVL(B.FAMIDED,    0),   NVL(B.OBSDED,    0), 
            NVL(B.SILVERDED,0),   NVL(B.WOMANDED,  0), NVL(B.SAVEAMT1,   0), 
            NVL(B.SAVEAMT3,  0),                          
           (
            NVL(B.TICKETAMT,0) + NVL(B.NOJOAMT,   0) + NVL(B.SAUAMT,     0) + NVL(B.IGAMT,    0)  + 
            NVL(B.SOBIAMT,  0) + NVL(B.PARKAMT,   0) + NVL(B.EMPLDAMT,   0) +  
            NVL(B.CHOLLAMT, 0) + NVL(B.MEDDEDAMT, 0) + NVL(B.EDUDEDAMT,  0) + 
            NVL(B.DEDAMT1,  0) + NVL(B.DEDAMT2,   0) + NVL(B.DEDAMT3,    0) + NVL(B.DEDAMT4,  0) + NVL(B.DEDAMT5,  0) + 
            NVL(B.BONDEDAMT,0) + NVL(B.SAVEAMT1,  0) + NVL(B.SAVEAMT2,   0) + NVL(B.SAVEAMT3, 0) + 
            NVL(B.HSAMT,    0) + NVL(B.FBAMT,     0) + NVL(B.NBAMT,      0) + NVL(B.SACORPAMT,0) + NVL(B.SABANKAMT,0) + 
            NVL(B.SANGAMT,  0) + NVL(B.LOANAMT1,  0) + NVL(B.LOANAMT2,   0) + NVL(B.LOANAMT3,0)+ 
            NVL(B.MEDDAMT,  0) + NVL(B.ANUDAMT,   0) + NVL(B.PAYHOLDAMT, 0) +
            NVL(B.OVMCDED,  0) + NVL(B.SACORPCP,  0) + NVL(B.SABANKCP,   0) 
            ) DEDSUM,
            NVL(B.STANDDED, 0),  NVL(B.SPEDED,    0), NVL(B.ANUDED,     0),            
            NVL(D.YEARTAX,0),    NVL(D.TAXRATE,   0), NVL(D.TAXAMT,     0),  /o 2015.07.15 하은영 급여세금관리자료에서 년간추정치 항목으로 대체 - 세금계산 프로세스 개선o/ 
            NVL(B.CHILDDED,     0),                                                   
            NVL(A.MATEDCNT,     0), NVL(A.FAMIDCNT,0)                                 
      FROM  PKMPMAS A, PKMPCALC B, PKCPBAS C, PKYEARTAX D 
     WHERE  (b.empno >= :frempno AND b.empno <= :toempno)  
       AND   a.empno = b.empno
       AND   a.empno = d.empno
       AND   b.paydate = d.paydate
       AND   d.paytype = :paytype; */ 
   
     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select NVL(B.EMPNO,'*') ,NVL(B.Paycl,'*') ,REPLACE(NVL(A.JUMINID,'##\
##'),' ','') ,NVL(B.PAYSUM,0) ,NVL(B.TAXPAYSUM,0) ,NVL(B.NOTAXPAYSUM,0) ,NVL\
(B.MEDDAMT,0) ,NVL(B.BASICDED,0) ,NVL(B.MATEDED,0) ,NVL(B.FAMIDED,0) ,NVL(B.\
OBSDED,0) ,NVL(B.SILVERDED,0) ,NVL(B.WOMANDED,0) ,NVL(B.SAVEAMT1,0) ,NVL(B.S\
AVEAMT3,0) ,(((((((((((((((((((((((((((((((((NVL(B.TICKETAMT,0)+NVL(B.NOJOAM\
T,0))+NVL(B.SAUAMT,0))+NVL(B.IGAMT,0))+NVL(B.SOBIAMT,0))+NVL(B.PARKAMT,0))+N\
VL(B.EMPLDAMT,0))+NVL(B.CHOLLAMT,0))+NVL(B.MEDDEDAMT,0))+NVL(B.EDUDEDAMT,0))\
+NVL(B.DEDAMT1,0))+NVL(B.DEDAMT2,0))+NVL(B.DEDAMT3,0))+NVL(B.DEDAMT4,0))+NVL\
(B.DEDAMT5,0))+NVL(B.BONDEDAMT,0))+NVL(B.SAVEAMT1,0))+NVL(B.SAVEAMT2,0))+NVL\
(B.SAVEAMT3,0))+NVL(B.HSAMT,0))+NVL(B.FBAMT,0))+NVL(B.NBAMT,0))+NVL(B.SACORP\
AMT,0))+NVL(B.SABANKAMT,0))+NVL(B.SANGAMT,0))+NVL(B.LOANAMT1,0))+NVL(B.LOANA\
MT2,0))+NVL(B.LOANAMT3,0))+NVL(B.MEDDAMT,0))+NVL(B.ANUDAMT,0))+NVL(B.PAYHOLD\
AMT,0))+NVL(B.OVMCDED,0))+NVL(B.SACORPCP,0))+NVL(B.SABANKCP,0)) DEDSUM ,NVL(\
B.STANDDED,0) ,NVL(B.SPEDED,0) ,NVL(B.ANUDED");
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )184;
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
     sqlstm.sqhstv[2] = (unsigned char  *)paytype;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != 1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor cursor1 Open Error...");
          sprintf(log_buff, "Cursor cursor1 Open Error 2.....");
          Write_batlog(seqno++, log_buff);                       
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 21;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )211;
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
          :saveamt3,    
          :dedsum,      
          :standded,    :speded,      :anuded, 
          :yy_taxsum,   :yy_taxrate,  :yy_taxamt,  /o 2015.07.15 하은영 급여세금관리자료에서 년간추정치 항목으로 대체 - 세금계산 프로세스 개선o/ 
          :childded,    :matedcnt,    :famidcnt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 25;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )226;
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
          sqlstm.sqhstv[14] = (unsigned char  *)&saveamt3;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&dedsum;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&standded;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[18] = (unsigned char  *)&anuded;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&yy_taxsum;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&yy_taxrate;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&yy_taxamt;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&childded;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&matedcnt;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&famidcnt;
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


          	
          	
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 25;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )341;
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
               sqlstm.arrsiz = 25;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )356;
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
                sqlstm.arrsiz = 25;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )371;
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
               sqlstm.arrsiz = 25;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )386;
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
     
     if  (Get_AccuSums() == FAIL)     /* 전월누계읽기  */
          return(FAIL);
     
     sprintf(emp,"%.1s",empno);
     sprintf(buf,"%.2s",paydate+4);
                   
     YY_TaxPay = yy_taxsum;  /* 2015.07.15 eyha 세금계산 자료에서 생성된 년간 추계액으로 세금계산   */ 
          
     return(SUCCESS);
}

/****************************************************************************
  Get_AccuSums()  Function.
*****************************************************************************/
Get_AccuSums()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  year[5]   = "";
/*          char  basedate[7]   = ""; */
          char  basedate[9]   = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char buf[3] = "";
     
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
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(max(paydate),'#') into :b0  from pkhphis whe\
re ((empno=:b1 and substr(paydate,1,4)=:b2) and paydate<:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )401;
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
          print_errmsg(sqlca.sqlcode,"급여이력화일 읽기오류1...");
          sprintf(log_buff, "급여이력화일 읽기오류1..."); 
          Write_batlog(seqno++, log_buff);               
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
     from     pkhphis a, pkmaddtax b
     where   a.empno     = b.empno(+)
        and  a.empno     = :empno  
        and  a.paydate    = :basedate
        and  b.paydate(+) = :paydate 
		and  b.gubun(+)  = 'T'  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (nvl(taxgross,0)-nvl(b.amt,0)) ,nvl(notaxgross,0\
) ,nvl(intaxsum,0) ,nvl(calctaxsum,0) into :b0,:b1,:b2,:b3  from pkhphis a ,p\
kmaddtax b where ((((a.empno=b.empno(+) and a.empno=:b4) and a.paydate=:b5) a\
nd b.paydate(+)=:b6) and b.gubun(+)='T')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )432;
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
     sqlstm.sqhstl[5] = (unsigned long )9;
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



          
     if  (sqlca.sqlcode != 0)
     {
          printf("basedate : [%s], empno : [%s] \n",basedate, empno);
          print_errmsg(sqlca.sqlcode,"급여이력화일 읽기오류2...");
          sprintf(log_buff, "급여이력화일 읽기오류2..."); 
          Write_batlog(seqno++, log_buff);               /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
      
        
     return(SUCCESS);
}

/*****************************************************************************
   연간근로소득금액을 구하는 루틴.
*****************************************************************************/
Calc_TaxStep2()
{
     double  t1, t2, t3, t4, t5 ;
     t1 = t2 = t3 = t4 = t5 = 0;      

        
     YY_TaxPay_Org = YY_TaxPay;   /*2014.02.24.hjku. 월1000만원 이상자 세금계산 로직 적용하기 위해 start*/    
     
     
     YY_TaxPay = fmin(YY_TaxPay,120000000);
     
     if (YY_TaxPay < indedbasic)
           t1 = (YY_TaxPay  * indedbrate) / 100;  
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
     
      
     YY_LabInDed   = floor(YY_LabInDed);
     
     YY_LabNeedDed = YY_LabInDed;
     
     YY_LabInAmt   = YY_TaxPay - YY_LabNeedDed;
     
     if  (YY_LabInAmt < 0)
          YY_LabInAmt = 0;
          

     /*2015.07.20 eyha 특별소득공제는 밴드구분별로 처리하게 되어 있으나 정직원 전체 통일  
     if ( (strcmp(paycl, "H11") == 0 ) || (strcmp(paycl, "D91") == 0 ) ) *계약직, 전문계약직 표준세액공제 1백만원만 처리 *
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
     */         

     if  (matedcnt + famidcnt + 1 == 1 ) 
          speded = specialded1 ;
     else if  (matedcnt + famidcnt + 1 <= 2 ) 
          speded = specialded2 ;
     else
          speded = specialded3 ;
        
     standded = 0 ;     

     
     /*2015.07.22.eyha. 2015년 7월이후 특별공제*/
     if ((matedcnt + famidcnt + 1) == 1 )  /*본인포함+1*/
     {
        if (YY_TaxPay <= 30000000) {
                 speded = speded + (YY_TaxPay * 4.0 / 100);
        }else if((YY_TaxPay >  30000000)&&(YY_TaxPay <=  45000000)) {
                 speded = speded + (YY_TaxPay * 4.0 / 100) - ((YY_TaxPay - 30000000) * 5.0 / 100);        
        }else if((YY_TaxPay >  45000000)&&(YY_TaxPay <=  70000000)) {
                 speded = speded + (YY_TaxPay * 1.5 / 100);
        }else if((YY_TaxPay >  70000000)&&(YY_TaxPay <= 120000000)) {
                 speded = speded + (YY_TaxPay * 0.5 / 100);        
        }
     }else if ((matedcnt + famidcnt + 1) <= 2 )  /*본인포함+1*/
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

     speded = trunc(speded);
  
     /* 2015.07.24 eyha 현재 자녀공제는 작업하지 않음에 뺌 */ 
     /*YY_InDed = basicded + mateded + famided + speded + anuded + standded + childded;   */
     YY_InDed = basicded + mateded + famided + speded + anuded + standded ;  

     
     return(SUCCESS);
}
/*****************************************************************************
   연과세표준을 구하는 함수.
*****************************************************************************/
Calc_TaxStep3()
{
     double   taxrate;
     double   yearded;
     double   YY_Intax,YY_Intax1,YY_Intax2,YY_Intax3,YY_Intax4;
     double   YY_Jutax;
     double   temp_Intax;
     double   temp_Jutax;
     char     emp[2] = "";
     char     buf[3] = "";

     
     YY_TaxInAmt = YY_TaxPay - YY_LabNeedDed - YY_InDed ;   
     
     if  (YY_TaxInAmt < 0)
          YY_TaxInAmt = 0;
     
     if  (Get_TaxRate(YY_TaxInAmt,&taxrate,&yearded) == FAIL)
          return(FAIL);
                              
     YY_CalcTax  = (YY_TaxInAmt*taxrate/100) - yearded; 
     YY_CalcTax  = floor(YY_CalcTax); 
     
     
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
     
     /*2014.02.24.hjku. 월1000만원 이상자 세금계산 로직 적용하기 위해*/
     /* 2018.04.11 eyha 2018년 세법 변경 
     if(YY_TaxPay_Org > 120000000) {
        YY_Intax1 = fmax(fmin(YY_TaxPay_Org, 168000000)-120000000,0) * 0.98 * 0.35;
        YY_Intax2 = fmax((YY_TaxPay_Org-168000000),0)  * 0.98 * 0.38;          
     } else {
        YY_Intax1 = 0;
        YY_Intax2 = 0;
     } 
     YY_Intax = YY_Intax + YY_Intax1 + YY_Intax2;  */
     
     if(YY_TaxPay_Org > 120000000) {     	  
        YY_Intax1 = fmax(fmin(YY_TaxPay_Org, 168000000)-120000000,0) * 0.98 * 0.35;
        YY_Intax2 = fmax(fmin(YY_TaxPay_Org, 336000000)-168000000,0) * 0.98 * 0.38;
        YY_Intax3 = fmax(fmin(YY_TaxPay_Org, 540000000)-336000000,0) * 0.98 * 0.4;
        YY_Intax4 = fmax((YY_TaxPay_Org-540000000),0)  * 0.98 * 0.42;                  
     } else {
        YY_Intax1 = 0;
        YY_Intax2 = 0;
        YY_Intax3 = 0;        
        YY_Intax4 = 0;        
     } 
       /* printf("[1000만원_debug] : empno=%s,YY_Intax1=%f,YY_Intax2= %f,YY_Intax3= %f,YY_Intax4= %f  \n",empno,YY_Intax1,YY_Intax2,YY_Intax3,YY_Intax4);    */
     
     
     YY_Intax = YY_Intax + YY_Intax1 + YY_Intax2 + YY_Intax3 + YY_Intax4;  


     YY_TaxPay = YY_TaxPay_Org;
          
     
     if  (YY_Intax < 0) 
          YY_Intax = 0;
     
     sprintf(emp,"%.1s",empno);
     sprintf(buf,"%.2s",paydate+4);
     
                    
     /*2015.07.20 eyha 년간간이세액에서 간이세액을 12개월로 무조건 나눔 */                         
     if(YY_Intax<=0) {
       intax = 0;          
     }else {
       /*intax = floor(YY_Intax / 12 / 10) * 10;*/
       intax = floor(YY_Intax / 12);
     }
     
     /*2015.07.21 eyha 세율 및 세액 적용*/
     if(yy_taxamt > 0) {
       intax = yy_taxamt;          
     }else if ((yy_taxrate > 0) && (intax > 0)) {
       intax = floor(intax * (yy_taxrate / 100) / 10) * 10 ;
     }
     
          
     if  (intax < 0)
          intax = 0;
     
     savetaxded   = floor(savetaxded / 12);
     jutax        = intax * jutaxrate / 100;
     jutax        = floor(jutax / 10) * 10;
     

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
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(taxrate,0) ,nvl(yearded,0) into :b0,:b1  fro\
m pkcpbas ,pkcptax where ((:b2>=taxpayfr and :b2<taxpayto) and taxnum=(select\
 ctaxnum  from pkcpbas ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )475;
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
          Write_batlog(seqno++, log_buff);          
          return(FAIL);
     }
   
     *taxrate = t_rate;   /* 2015.07.24 eyha  세법 그대로 작업되도록 계산*/
/*     *taxrate = t_rate + 1;    2011.02.23 kth 김현순 메니져 요청으로 1% 올림*/
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
     calctaxsum = 0; 
          
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
             speded       = :speded,     
             standded     = :standded     
      where  empno = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpcalc  set labinded=:b0,labneedded=:b1,labina\
mt=:b2,inded=:b3,taxinamt=:b4,calctax=:b5,labtaxded=:b6,savetaxded=:b7,intax=\
:b8,jutax=:b9,dedsum=:b10,realpay=:b11,taxgross=:b12,notaxgross=:b13,intaxsum\
=:b14,calctaxsum=:b15,writeman=:b16,writetime=to_char(sysdate,'YYYYMMDDHH24MI\
SSD'),speded=:b17,standded=:b18 where empno=:b19";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )506;
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
          Write_batlog(seqno++, log_buff);            
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
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(add_months(to_date(:b0,'YYYYMM'),:b1),'Y\
YYYMM') into :b2  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )601;
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

int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )628;
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
     sqlstm.arrsiz = 25;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )669;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}