
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
    "pky1110g.pc"
};


static unsigned int sqlctx = 155827;


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
   unsigned char  *sqhstv[11];
   unsigned long  sqhstl[11];
            int   sqhsts[11];
            short *sqindv[11];
            int   sqinds[11];
   unsigned long  sqharm[11];
   unsigned long  *sqharc[11];
   unsigned short  sqadto[11];
   unsigned short  sqtdso[11];
} sqlstm = {12,11};

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
"select nvl(b.empno,'*') ,replace(nvl(a.juminid,'####'),' ','')  from pkmpma\
s a ,pkmpycalc b where ((b.empno>=:b0 and b.empno<=:b1) and a.empno=b.empno) \
          ";

 static char *sq0020 = 
"select A.EMPNO ,NVL(A.PAYCALCKIND,' ') ,NVL(A.DUCALCKIND,' ') ,NVL(A.BPAYCA\
LCKIND,' ') ,NVL(A.BDUCALCKIND,' ') ,NVL(CBASICSUM,0) ,NVL(SOBASICAMT,0)  fro\
m PKHPDAY A ,pkmpycalc B where ((A.PAYDATE=:b0 and A.EMPNO=B.EMPNO) and (A.EM\
PNO>=:b1 and B.EMPNO<=:b2))           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,45,0,1,204,0,0,0,0,0,1,0,
20,0,0,2,101,0,4,272,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,
55,0,0,3,93,0,4,306,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
86,0,0,4,40,0,4,330,0,0,1,0,0,1,0,2,97,0,0,
105,0,0,5,132,0,4,375,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,97,0,0,
132,0,0,6,1281,0,4,402,0,0,3,1,0,1,0,2,4,0,0,2,97,0,0,1,97,0,0,
159,0,0,7,309,0,5,470,0,0,11,11,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
218,0,0,8,162,0,9,492,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
241,0,0,8,0,0,15,499,0,0,0,0,0,1,0,
256,0,0,8,0,0,13,506,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
279,0,0,8,0,0,15,511,0,0,0,0,0,1,0,
294,0,0,8,0,0,15,519,0,0,0,0,0,1,0,
309,0,0,8,0,0,15,527,0,0,0,0,0,1,0,
324,0,0,9,879,0,5,543,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
347,0,0,10,82,0,4,585,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
370,0,0,11,58,0,4,598,0,0,1,0,0,1,0,2,4,0,0,
389,0,0,12,167,0,5,612,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
1,97,0,0,
428,0,0,13,120,0,4,658,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
459,0,0,14,40,0,4,671,0,0,1,1,0,1,0,1,97,0,0,
478,0,0,15,68,0,5,689,0,0,0,0,0,1,0,
493,0,0,16,57,0,2,711,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
516,0,0,17,67,0,5,764,0,0,0,0,0,1,0,
531,0,0,18,1379,0,3,783,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
558,0,0,19,75,0,4,838,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
585,0,0,20,267,0,9,879,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
612,0,0,20,0,0,15,886,0,0,0,0,0,1,0,
627,0,0,20,0,0,13,894,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,4,0,0,2,4,0,0,
670,0,0,20,0,0,15,900,0,0,0,0,0,1,0,
685,0,0,20,0,0,15,910,0,0,0,0,0,1,0,
700,0,0,20,0,0,15,916,0,0,0,0,0,1,0,
715,0,0,21,114,0,5,928,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,4,0,
0,1,97,0,0,
754,0,0,22,73,0,4,962,0,0,2,1,0,1,0,1,97,0,0,2,3,0,0,
777,0,0,23,84,0,4,968,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
800,0,0,24,701,0,5,1090,0,0,8,8,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,
847,0,0,25,962,0,5,1131,0,0,7,7,0,1,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
890,0,0,26,55,0,5,1177,0,0,0,0,0,1,0,
905,0,0,27,669,0,5,1202,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
928,0,0,28,128,0,5,1230,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
951,0,0,29,372,0,5,1250,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
974,0,0,30,118,0,5,1286,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
997,0,0,31,102,0,5,1305,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1020,0,0,32,50,0,3,1334,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1061,0,0,33,0,0,29,1344,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pky1110g(파견직 급여생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 파견용역비
 Programmer     : 지순미
 Version        : 1.00
 Date           : 2017.02.22
PKMPYCALC
Update Contents
Version  date(yy.mm.dd) programmer      description     relevant doc.no
   1.00     2017.02.22    지순미        pkc10805.pc(파견직 급여생성) 프로그램명 변경
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
void  Gen_EmpRecord();
void  Extract_DayPayEmp();
void  Calc_BasicGongje();
void  CalMidEnt_DayPay();
void  Process_Calc();
void  Get_Pays();
void  Get_DedSum();
void  print_errmsg(int errcode, char *errmsg);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     /* 당월급여내역  (pkmpycalc) 참조 변수                           */
     char    empno[5]        = "";   /* 사   번      */
     char    korname[13]     = "";   /* 성   명      */
     char    juminid[13+1]   = "";   /* 주민등록번호   */  
     char    paydate[9]      = "";   /* 급 여 지 급 월       */
     char    predate[9]      = "";   /* 급 여 지 급 월   -1    */
     char    paynum[3]       = "";   /* 급  호  차  수       */
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
     char    paybank[4]      = "";   /* 급여지급은행*        2017.09.18 jissi 2->3자리 코드로 변경*/
     char    payacnt[21]     = "";   /* 급여통장번호*        */
     double  basicamt;               /* 당월  기본급         */     
     double  bbasicamt;              /* 전월기본급소급액     */
     double  bonusamt;               /* 정기상여금           */  
     double  devidemon;              /* 상여금분할월수       */ 
     double  tmp_anudamt;            /* 국민연금 누계액      */ 
    
     double  ovtmamt;                /* 초과근무수당          */
     double  sptmamt;                /* 특별근무수당          */
     double  aidamt1;                /* 기타수당1          */
     double  aidamt2;                /* 기타수당2          */
     double  aidamt3;                /* 기타수당3          */
     double  mcaramt;                /* 식대교통비           */
     double  mcartaxamt;              /* 식대교통비(과세)  */
     double  taxpay;                 /* 과세급여          */
     double  notaxpay;               /* 비과세급여           */
     double  paysum;                 /* 지급총액          */
     double  taxpaysum;              /* 과세급여총액          */
     double  notaxpaysum;            /* 비과세급여총액       */
     double  empldamt;               /* 고용보험료          */
     double  anudamt;                /* 국민연금본인각출료   */
     double  dedamt1;                /* 기타공제1          */
     double  dedamt2;                /* 기타공제2          */
     double  dedamt3;                /* 기타공제3          */
     double  dedamt4;                /* 기타공제4          */
     double  dedsum;                 /* 공제액계             */
     double  realpay;                /* 실지급액          */
     double  sopay;                  /* 소급급여             */
     double  sobon;                  /* 소급상여             */
     double  sopaysum;               /* 소급급여합   */
     char    cretime[16]  = "";      /* 급여생성일시         */
     char    writetime[16]  = "";    /* 최종작업일시         */
     char    writeman[5]  = "";      /* 최종작업자           */  
     char    president_empno[5]  = "";  /* 사장님사번           */  
     
     /* ===========================================================
      연봉제 관련 추가항목
        ===========================================================  */
     double  fixpay;      /* 월정급여   */
     double  bfixpay;     /* 전월월정급여   */
     
     /*  급여지급기준(PKCPBAS) 참조 변수               */
     
     char    cpaynum[3];    /* 현급호차수          */
     char    bonusyn[2];
    

     char    MaxPayDate[9];       /* 월급여최종지급월   */
     char    MaxHisPayDate[9];     
     char    PrevPayMontt[9];     /* 전월               */
     char    frempno[5];
     char    toempno[5];
     int     rcount;
     /*  9801 item add *****************/
/*     double  childeduamt;          자녀학자금   */
/*     double  medpayamt ;           의료비가불금 */
     double  ovmcamt;             /* 야근식대 */
     /*  9801 item add *****************/
     /*  01/21/2000 1:42오후 item add 사우회비 공제 제외자 *****************/

     /* 2008.03.05 고용/산재 계산 이전에 따른 추가 */  
     double  empldrate      = 0;  /* 고용보험료율     */  
     double  y_empldrate    = 0;  /* 일반직 고용보험료율   */   
     double  y_wacirate     = 0;  /* 일반직 산재보험료율   */   
     double  y_drwacirate   = 0;  /* 일반직 산재보험료율   */   
     
     double  y_empldamt     = 0;  /* 일반직 고용보험료   */  
     double  y_medirate     = 0;  /* 건강 보험료율   */  
     double  y_longmtrate   = 0;  /* 장기 보험료율   */   
     double  nprate         = 0;  /* 국민연금 보험료율   */   
     
     double  y_waciamt      = 0;  /* 일반직 산재보험료 일반사원   */
     double  y_drwaciamt    = 0;  /* 일반직 산재보험료 일반사원   */
     char    exfryymm[6+1]  = ""; /* 만60세이상 시작년월  */  
     double  basemm;        

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
                       
     if  (argc != 7) {  /* pky1110g 201508 Y000 Yzzz P718 pky1110g 20150916140000 */
          printf("[Usage] : pky1110g 1.급여년월 2.사번fr 3.사번to 4.작업자  5.프로그램ID 6.시작시간 \n");
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pky1110g");
     
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
     hinsa_log_print(0,"급여생성 프로그램 시작...[pky1110g]");        
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
     lock table pkmpycalc in exclusive mode nowait; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock table pkmpycalc in exclusive mode nowait";
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
       from  pkmpycalc
      where  (empno >= :frempno and empno <= :toempno ) 
        and   paydate = :paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpycalc where ((empno\
>=:b1 and empno<=:b2) and paydate=:b3)";
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
          char    temp_dutykindcd[2+1];
     /* EXEC SQL END DECLARE SECTION; */ 

     
     char    str[4+1];
     double  mm = 0;
     
     empldamt    = 0;
     y_empldamt  = 0;
     y_waciamt   = 0;
     y_drwaciamt   = 0;
     temp_totamt = 0;
     
     memset(temp_dutykindcd,'\0',sizeof(temp_dutykindcd));
     
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
               select nvl(
                 (    nvl(homesupamt,0) +
                      decode(upper(nvl(basicamtyn,' ')),'Y',nvl(basicamt+bbasicamt,0),0) +                      
                      decode(upper(nvl(bonusamtyn,' ')),'Y',nvl(bonusamt,0),0) +                                            
                      decode(upper(nvl(homesupamtyn,' ')),'Y',nvl(homesupamt,0),0) +
                      decode(upper(nvl(fixpayyn,' ')),'Y',nvl(fixpay,0)+nvl(bfixpay,0),0)   +                
                      decode(upper(nvl(ybonamtyn,' ')),'Y',nvl(ybonamt,0),0)   + 
                      decode(upper(nvl(sbonamtyn,' ')),'Y',nvl(sbonamt,0),0)   +                                         
                      decode(upper(nvl(ovtmamtyn,' ')),'Y',nvl(ovtmamt,0),0)   +                       
                      decode(upper(nvl(aidamt1yn,' ')),'Y',nvl(aidamt1,0),0)   + 
                      decode(upper(nvl(aidamt2yn,' ')),'Y',nvl(aidamt2,0),0)   + 
                      decode(upper(nvl(aidamt3yn,' ')),'Y',nvl(aidamt3,0),0)   +                       
                      decode(upper(nvl(mcaramtyn,' ')),'Y',nvl(mcaramt,0),0)   +                       
                      decode(upper(nvl(lectsupamtyn,' ')),'Y',nvl(lectsupamt,0),0)   +                                                                                       
                      decode(upper(nvl(ovmcamtyn,' ')),'Y',nvl(ovmcamt,0),0)   +                      
                      decode(upper(nvl(taxpayyn,' ')),'Y',nvl(taxpay,0),0)    + 
                      decode(upper(nvl(notaxpayyn,' ')),'Y',nvl(notaxpay,0),0)   +                                   
                      decode(upper(nvl(sopayyn,' ')),'Y',nvl(sopaysum,0),0) +  
                      nvl(ovmcamt    ,0) +  nvl(taxpay1  ,0)+ nvl(taxpay2  ,0) + 
                      nvl(taxpay3   ,0)+ nvl(taxpay4  ,0) + nvl(aidamt11,0) + nvl(aidamt12,0)
                      )
                      ,0), c.dutykindcd
                into  :temp_totamt, :temp_dutykindcd
                from  pkmpycalc a, pkcemtbl b, (select empno, max(dutykindcd) dutykindcd from pkhdyphis group by empno ) c 
               where  a.empno = :empno
                 and  a.empno = c.empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlbuft((void **)0,
                 "select nvl((((((((((((((((((((((((nvl(homesupamt,0)+decode\
(upper(nvl(basicamtyn,' ')),'Y',nvl((basicamt+bbasicamt),0),0))+decode(upper\
(nvl(bonusamtyn,' ')),'Y',nvl(bonusamt,0),0))+decode(upper(nvl(homesupamtyn,\
' ')),'Y',nvl(homesupamt,0),0))+decode(upper(nvl(fixpayyn,' ')),'Y',(nvl(fix\
pay,0)+nvl(bfixpay,0)),0))+decode(upper(nvl(ybonamtyn,' ')),'Y',nvl(ybonamt,\
0),0))+decode(upper(nvl(sbonamtyn,' ')),'Y',nvl(sbonamt,0),0))+decode(upper(\
nvl(ovtmamtyn,' ')),'Y',nvl(ovtmamt,0),0))+decode(upper(nvl(aidamt1yn,' ')),\
'Y',nvl(aidamt1,0),0))+decode(upper(nvl(aidamt2yn,' ')),'Y',nvl(aidamt2,0),0\
))+decode(upper(nvl(aidamt3yn,' ')),'Y',nvl(aidamt3,0),0))+decode(upper(nvl(\
mcaramtyn,' ')),'Y',nvl(mcaramt,0),0))+decode(upper(nvl(lectsupamtyn,' ')),'\
Y',nvl(lectsupamt,0),0))+decode(upper(nvl(ovmcamtyn,' ')),'Y',nvl(ovmcamt,0)\
,0))+decode(upper(nvl(taxpayyn,' ')),'Y',nvl(taxpay,0),0))+decode(upper(nvl(\
notaxpayyn,' ')),'Y',nvl(notaxpay,0),0))+decode(upper(nvl(sopayyn,' ')),'Y',\
nvl(sopaysum,0),0))+nvl(ovmcamt,0))+nvl(taxpay1,0))+nv");
               sqlstm.stmt = "l(taxpay2,0))+nvl(taxpay3,0))+nvl(taxpay4,0))\
+nvl(aidamt11,0))+nvl(aidamt12,0)),0) ,c.dutykindcd into :b0,:b1  from pkmpyc\
alc a ,pkcemtbl b ,(select empno ,max(dutykindcd) dutykindcd  from pkhdyphis \
 group by empno) c where (a.empno=:b2 and a.empno=c.empno)";
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
               sqlstm.sqhstv[1] = (unsigned char  *)temp_dutykindcd;
               sqlstm.sqhstl[1] = (unsigned long )3;
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


               /*=====03/23/2000 1:52오전 독립비상임이사는 고용보험 적용안됨====
                 and paycl <> '10' ;
                 ===============================================================*/
               /*2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  */
               /*   and paycl <> '0Z' ;           */
                 
                 /* if (sqlca.sqlcode != 0)  */
               if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
               {
                    printf("[사번] : %s 의  고용보험료 구하기 에러... \n",empno);
                    print_errmsg(sqlca.sqlcode,"고용보험료 계산오류...");
                    sprintf(log_buff, "고용보험료 계산오류..."); 
                    Write_batlog(seqno++, log_buff);            /*dsa2000 Rexec 대체*/
                    return(FAIL);
               }     
               

                    y_empldamt = temp_totamt * y_empldrate;
                    /*printf("[사번] : %s ,%f ,%f,%f \n",empno,y_empldamt,y_empldrate,temp_totamt); */
                    y_waciamt  = temp_totamt * y_wacirate;                    

                    
               /*     
                    EXEC SQL
                    UPDATE  pkmpycalc a
                       SET  EMPLDAMT = FLOOR((:temp_totamt * :y_empldrate)/10)*10,  /2008.03.18 원단위 절삭 / 
                            DEDAMT1  = FLOOR((:temp_totamt * y_wacirate)/10)*10   /2008.03.18 원단위 절삭 /   
                    WHERE  empno=:empno 
                      and  empno in ( select empno from pimpmas where tjobduty <> '15');               
                      
                   temp_totamt = temp_totamt - 100000;
                      
                   EXEC SQL
                    UPDATE  pkmpycalc a
                       SET  EMPLDAMT = FLOOR((:temp_totamt * :y_empldrate)/10)*10, /2008.03.18 원단위 절삭 /
                             DEDAMT1  = FLOOR(:temp_totamt * :y_drwacirate /10)*10  / 2008.03.18 원단위 절삭 운전직 산재 /   
                    WHERE  empno=:empno 
                      and  empno in ( select empno from pimpmas where tjobduty = '15');                  
                */      
                      
                /* 이상용 직무구분에 따른 요율적용 */
                   /* EXEC SQL
                    UPDATE  pkmpycalc a
                       SET  EMPLDAMT =  nvl(case when :temp_dutykindcd in ('01','02','03') then  FLOOR((:temp_totamt * :y_empldrate)/10)*10
                                        else FLOOR(((:temp_totamt - 100000)  * :y_empldrate)/10)*10 end,0) , 
                            DEDAMT1  =  nvl(case when :temp_dutykindcd in ('01','02','03') then  FLOOR((:temp_totamt * :y_wacirate)/10)*10 
                                        else FLOOR((:temp_totamt - 100000)* :y_drwacirate /10)*10 end,0)   
                    WHERE  empno=:empno; */ 

{
                   struct sqlexd sqlstm;
                   sqlstm.sqlvsn = 12;
                   sqlstm.arrsiz = 11;
                   sqlstm.sqladtp = &sqladt;
                   sqlstm.sqltdsp = &sqltds;
                   sqlstm.stmt = "update pkmpycalc a  set EMPLDAMT=nvl( cas\
e  when :b0 in ('01','02','03') then (FLOOR(((:b1* :b2)/10))* 10) else (FLOOR\
((((:b1-100000)* :b2)/10))* 10)  end ,0),DEDAMT1=nvl( case  when :b0 in ('01'\
,'02','03') then (FLOOR(((:b1* :b7)/10))* 10) else (FLOOR((((:b1-100000)* :b9\
)/10))* 10)  end ,0) where empno=:b10";
                   sqlstm.iters = (unsigned int  )1;
                   sqlstm.offset = (unsigned int  )159;
                   sqlstm.cud = sqlcud0;
                   sqlstm.sqlest = (unsigned char  *)&sqlca;
                   sqlstm.sqlety = (unsigned short)4352;
                   sqlstm.occurs = (unsigned int  )0;
                   sqlstm.sqhstv[0] = (unsigned char  *)temp_dutykindcd;
                   sqlstm.sqhstl[0] = (unsigned long )3;
                   sqlstm.sqhsts[0] = (         int  )0;
                   sqlstm.sqindv[0] = (         short *)0;
                   sqlstm.sqinds[0] = (         int  )0;
                   sqlstm.sqharm[0] = (unsigned long )0;
                   sqlstm.sqadto[0] = (unsigned short )0;
                   sqlstm.sqtdso[0] = (unsigned short )0;
                   sqlstm.sqhstv[1] = (unsigned char  *)&temp_totamt;
                   sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[1] = (         int  )0;
                   sqlstm.sqindv[1] = (         short *)0;
                   sqlstm.sqinds[1] = (         int  )0;
                   sqlstm.sqharm[1] = (unsigned long )0;
                   sqlstm.sqadto[1] = (unsigned short )0;
                   sqlstm.sqtdso[1] = (unsigned short )0;
                   sqlstm.sqhstv[2] = (unsigned char  *)&y_empldrate;
                   sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[2] = (         int  )0;
                   sqlstm.sqindv[2] = (         short *)0;
                   sqlstm.sqinds[2] = (         int  )0;
                   sqlstm.sqharm[2] = (unsigned long )0;
                   sqlstm.sqadto[2] = (unsigned short )0;
                   sqlstm.sqtdso[2] = (unsigned short )0;
                   sqlstm.sqhstv[3] = (unsigned char  *)&temp_totamt;
                   sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[3] = (         int  )0;
                   sqlstm.sqindv[3] = (         short *)0;
                   sqlstm.sqinds[3] = (         int  )0;
                   sqlstm.sqharm[3] = (unsigned long )0;
                   sqlstm.sqadto[3] = (unsigned short )0;
                   sqlstm.sqtdso[3] = (unsigned short )0;
                   sqlstm.sqhstv[4] = (unsigned char  *)&y_empldrate;
                   sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[4] = (         int  )0;
                   sqlstm.sqindv[4] = (         short *)0;
                   sqlstm.sqinds[4] = (         int  )0;
                   sqlstm.sqharm[4] = (unsigned long )0;
                   sqlstm.sqadto[4] = (unsigned short )0;
                   sqlstm.sqtdso[4] = (unsigned short )0;
                   sqlstm.sqhstv[5] = (unsigned char  *)temp_dutykindcd;
                   sqlstm.sqhstl[5] = (unsigned long )3;
                   sqlstm.sqhsts[5] = (         int  )0;
                   sqlstm.sqindv[5] = (         short *)0;
                   sqlstm.sqinds[5] = (         int  )0;
                   sqlstm.sqharm[5] = (unsigned long )0;
                   sqlstm.sqadto[5] = (unsigned short )0;
                   sqlstm.sqtdso[5] = (unsigned short )0;
                   sqlstm.sqhstv[6] = (unsigned char  *)&temp_totamt;
                   sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[6] = (         int  )0;
                   sqlstm.sqindv[6] = (         short *)0;
                   sqlstm.sqinds[6] = (         int  )0;
                   sqlstm.sqharm[6] = (unsigned long )0;
                   sqlstm.sqadto[6] = (unsigned short )0;
                   sqlstm.sqtdso[6] = (unsigned short )0;
                   sqlstm.sqhstv[7] = (unsigned char  *)&y_wacirate;
                   sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[7] = (         int  )0;
                   sqlstm.sqindv[7] = (         short *)0;
                   sqlstm.sqinds[7] = (         int  )0;
                   sqlstm.sqharm[7] = (unsigned long )0;
                   sqlstm.sqadto[7] = (unsigned short )0;
                   sqlstm.sqtdso[7] = (unsigned short )0;
                   sqlstm.sqhstv[8] = (unsigned char  *)&temp_totamt;
                   sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
                   sqlstm.sqhsts[8] = (         int  )0;
                   sqlstm.sqindv[8] = (         short *)0;
                   sqlstm.sqinds[8] = (         int  )0;
                   sqlstm.sqharm[8] = (unsigned long )0;
                   sqlstm.sqadto[8] = (unsigned short )0;
                   sqlstm.sqtdso[8] = (unsigned short )0;
                   sqlstm.sqhstv[9] = (unsigned char  *)&y_drwacirate;
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

                       
                      
          }
     }
     return(SUCCESS);
}


void Process_InsCalc()
{
     /* EXEC SQL DECLARE cursor4 CURSOR FOR 
     select  nvl(b.empno,'*'),    replace(nvl(a.juminid,'####'),' ','')
       from  pkmpmas a, pkmpycalc b
      where  (b.empno >= :frempno and b.empno <= :toempno)
        and  a.empno = b.empno; */ 
     
     
     /* EXEC SQL OPEN cursor4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )218;
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
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )241;
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
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )256;
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
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )279;
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
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )294;
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
             의료보험,국민연금 계산 로직 추가 
        =============================================================================== */
     /* EXEC SQL    
     update pkmpycalc
        set   
            kita1       = (
                          nvl(basicamt,0) + nvl(bbasicamt,0)   + 
                          nvl(bonusamt,0) +                        
                          nvl(ovtmamt,0) +  
                          nvl(aidamt1,0) + nvl(aidamt2,0) + nvl(aidamt3,0) + nvl(aidamt11,0) + nvl(aidamt12,0) +
                          nvl(mcartaxamt,0) +  
                          nvl(lectsupamt,0) + nvl(sbontaxamt,0) + 
                          nvl(taxpay1,0) + nvl(taxpay2,0) +nvl(taxpay3,0) + nvl(taxpay4  ,0) + /o2013.02.22.hjku. 문경란씨 요청으로 제외함. nvl(taxpay4,0) +  o//o +  nvl(taxpay3   ,0)+ nvl(taxpay4  ,0))+ o/
                          nvl(sopaysum,0)+ nvl(ovmcamt,0) +
                          nvl(fixpay,0)  + nvl(bfixpay ,0) +
/o                          nvl(aidamt1,0) +  o/
                          nvl(ticketamt,0) -                                  
                          nvl(dedamt2,0) - nvl(dedamt3,0)              
                          ),                                        /o  homesupamt +  2010.07.28건강보험 국민연금 계산 로직 추가  kita1 급여 해당 항목 합계 nvl(taxpay2  ,0) + o/ 
              kita2       = (
                          nvl(basicamt,0) + nvl(bbasicamt,0)   + 
                          nvl(bonusamt,0) +                        
                          nvl(ovtmamt,0) +  
                          nvl(aidamt1,0) + nvl(aidamt2,0) + nvl(aidamt3,0) + nvl(aidamt11,0) + nvl(aidamt12,0) +
                          nvl(mcartaxamt,0) +  
                          nvl(lectsupamt,0) + nvl(sbontaxamt,0) + 
                          nvl(taxpay1,0) + nvl(taxpay2,0) +nvl(taxpay3,0) + nvl(taxpay4  ,0) + /o2013.02.22.hjku. 문경란씨 요청으로 제외함. nvl(taxpay4,0) +  o//o +  nvl(taxpay3   ,0)+ nvl(taxpay4  ,0))+ o/
                          nvl(sopaysum,0)+ nvl(ovmcamt,0) +
                          nvl(fixpay,0)  + nvl(bfixpay ,0) +
/o                          nvl(aidamt1,0) +  o/
                          nvl(ticketamt,0) -                                  
                          nvl(dedamt2,0) - nvl(dedamt3,0)              
                          )                                        /o 2010.07.28건강보험 국민연금 계산 로직 추가  kita1 급여 해당 항목 합계 nvl(taxpay2  ,0) + o/                           
      where  empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set kita1=((((((((((((((((((((((nvl(b\
asicamt,0)+nvl(bbasicamt,0))+nvl(bonusamt,0))+nvl(ovtmamt,0))+nvl(aidamt1,0))\
+nvl(aidamt2,0))+nvl(aidamt3,0))+nvl(aidamt11,0))+nvl(aidamt12,0))+nvl(mcarta\
xamt,0))+nvl(lectsupamt,0))+nvl(sbontaxamt,0))+nvl(taxpay1,0))+nvl(taxpay2,0)\
)+nvl(taxpay3,0))+nvl(taxpay4,0))+nvl(sopaysum,0))+nvl(ovmcamt,0))+nvl(fixpay\
,0))+nvl(bfixpay,0))+nvl(ticketamt,0))-nvl(dedamt2,0))-nvl(dedamt3,0)),kita2=\
((((((((((((((((((((((nvl(basicamt,0)+nvl(bbasicamt,0))+nvl(bonusamt,0))+nvl(\
ovtmamt,0))+nvl(aidamt1,0))+nvl(aidamt2,0))+nvl(aidamt3,0))+nvl(aidamt11,0))+\
nvl(aidamt12,0))+nvl(mcartaxamt,0))+nvl(lectsupamt,0))+nvl(sbontaxamt,0))+nvl\
(taxpay1,0))+nvl(taxpay2,0))+nvl(taxpay3,0))+nvl(taxpay4,0))+nvl(sopaysum,0))\
+nvl(ovmcamt,0))+nvl(fixpay,0))+nvl(bfixpay,0))+nvl(ticketamt,0))-nvl(dedamt2\
,0))-nvl(dedamt3,0)) where (empno>=:b0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )324;
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
          print_errmsg(sqlca.sqlcode,"건강보험료 계산 오류1...");
          sprintf(log_buff,"건강보험료 계산 오류1...");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
     
     
	   /* EXEC SQL	  /o 건강보험 요율 넣는 로직 추가 KTH 2012.06.01	o/   
  	 select nvl(medirate,0)/100 ,nvl(longmtrate,0)/100
       into :y_medirate, :y_longmtrate
       from pkcmdbas; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 11;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select (nvl(medirate,0)/100) ,(nvl(longmtrate,0)/100) in\
to :b0,:b1  from pkcmdbas ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )347;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&y_medirate;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&y_longmtrate;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
          print_errmsg(sqlca.sqlcode,"건강보험료 계산기준 읽기오류...");
          sprintf(log_buff, "건강보험료 계산기준 읽기오류...");
          Write_batlog(seqno++, log_buff);                
          error_quit("작업실패...");
     }       
       
     /* EXEC SQL	 /o  국민연금 요율 넣는 로직 추가 KTH 2012.06.01 	 o/   
     SELECT NVL(NPRATE,0)/100 NPRATE
       INTO :nprate  
     FROM PKCNPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (NVL(NPRATE,0)/100) NPRATE into :b0  from PKCNPB\
AS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )370;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&nprate;
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
          print_errmsg(sqlca.sqlcode,"국민연금 계산기준 읽기오류...");
          sprintf(log_buff, "국민연금 계산기준 읽기오류...");
          Write_batlog(seqno++, log_buff);           
          error_quit("작업실패...");
     }              

                 
     /* EXEC SQL    
     update pkmpycalc
        set meddamt =  trunc((kita2) *:y_medirate,-1)+trunc(trunc((kita2) *:y_medirate,-1)*:y_longmtrate,-1) ,
            anudamt =  trunc((kita1) *:nprate,-1)   /o 건강보험 국민연금 계산 로직 추가 o/ 
      where  empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set meddamt=(trunc((kita2* :b0),(-1))\
+trunc((trunc((kita2* :b0),(-1))* :b2),(-1))),anudamt=trunc((kita1* :b3),(-1)\
) where (empno>=:b4 and empno<=:b5)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )389;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&y_medirate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&y_medirate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&y_longmtrate;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&nprate;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
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

                     
      
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"건강보험료 계산 오류1...");
          sprintf(log_buff,"건강보험료 계산 오류1...");
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }       
     
/*     
     EXEC SQL    
     update pkmpycalc c set anudamt = (select ANUSELFAMT from pkmnpymas m where m.empno=c.empno) 
      where empno in (select empno from pkmnpymas m )  
      and  empno >= :frempno and empno <= :toempno;                          
     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"국민연금  계산 고정급  오류1...");
          sprintf(log_buff,"국민연금 계산 오류1...");
          Write_batlog(seqno++, log_buff);                dsa2000 Rexec 대체
          error_quit("작업실패...");
     }       

     
     EXEC SQL
     select   nvl(empldrate,0),nvl(y_empldrate,0),nvl(y_wacirate,0),nvl(y_drwacirate,0)
       into  :empldrate, :y_empldrate, :y_wacirate , :y_drwacirate
       from  pkcemtbl;
     
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"고용보험료 계산기준 읽기오류...");
          sprintf(log_buff, "고용보험료 계산기준 읽기오류...");
          Write_batlog(seqno++, log_buff);                    
          error_quit("작업실패...");
     }
             
*/     
     
     /* ===============================================================================
             급여지급 항목변경 : => 급여지급항목변경에 따른 고용보험료 산정대상항목을 추가
        =============================================================================== */
     /* EXEC SQL
     select   nvl(empldrate,0),nvl(y_empldrate,0),nvl(y_wacirate,0),nvl(y_drwacirate,0)
       into  :empldrate, :y_empldrate, :y_wacirate , :y_drwacirate
       from  pkcemtbl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(empldrate,0) ,nvl(y_empldrate,0) ,nvl(y_waci\
rate,0) ,nvl(y_drwacirate,0) into :b0,:b1,:b2,:b3  from pkcemtbl ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )428;
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
     sqlstm.sqhstv[3] = (unsigned char  *)&y_drwacirate;
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_date(:b0,'YYYYMM')  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )459;
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycalctime=to_char(sysdate,'YYYYMM\
DDHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )478;
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
     delete from pkmpycalc
      where empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pkmpycalc  where (empno>=:b0 and empno<=:b\
1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )493;
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
          print_errmsg(sqlca.sqlcode,"월급여 기존자료 삭제실패...");
          sprintf(log_buff, "월급여 기존자료 삭제실패...");
          Write_batlog(seqno++, log_buff);                 /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     CheckYManager();
     printf("일반직 관리자 확인\n");
     
     
     Gen_EmpRecord();  
     /* ===============================================================================
              Version  date(yy.mm.dd)  programmer  description             relevant doc.no
           30.00     1998.12.29     김승회     급여지급 항목변경        하나로인사재개발
     => 일할계산부분은 차후에 반영
        =============================================================================== */
     /*
     Extract_DayPayEmp();
     */
                 
                         
     /*CalMidEnt_DayPay();  일할계산 */
          
     /*2013.03.22.hjku. 문경란씨 요청으로 4대보험 업로드된 파일로 반영

     Process_Calc(); 건강,국민연금, 고용보험/산재 보험 계산 */
     
     Process_Calc(); /* 건강,국민연금, 고용보험/산재 보험 계산 */
     
     Get_Pays();
     
     Get_DedSum();
     
     
     
     printf("과세 비과세 Sum 계산 완료\n");
     

     
     printf("공제금 합 계산 완료\n");
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkcpbas  set paycretime=to_char(sysdate,'YYYYMMD\
DHH24MISSD')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )516;
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
     insert into pkmpycalc 
      (
           paydate, empno, korname, paycl, pstate, 
           orgnum, deptcode, boncode, bldcode, jobdept, 
           payyn, paybank, payacnt, paybank1, payacnt1,
           basicamt,  bonusamt,   homesupamt,
           ybonamt,   sbonamt, 
           ovtmamt,  aidamt1, aidamt2, aidamt3, 
           mcaramt,mcartaxamt, lectsupamt,          
           dedamt1, dedamt2, dedamt3, 
           dedamt4, dedamt5,anudamt, meddamt,empldamt,/o2013.03.22.hjku. 문경란씨 요청,고용보험도 마스터에서 가져오도록 수정o/ 
           taxpay, notaxpay, cretime, payra, sopaysum,  
           ovmcamt,   ovmcded, 
           fixpay, bfixpay,
           aidamt11, aidamt12, aidamt13, aidamt14,
           taxpay1, taxpay2, taxpay3, taxpay4, 
           notaxpay1, notaxpay2, notaxpay3, notaxpay4, 
           sopaysum1,
           lectsupamt1,lectsupamt2,lectsupamt3,lectsupamt4
           )
     select
           substr(:paydate,1,8), a.empno, korname, paycl, pstate,
           orgnum, deptcode, boncode, bldcode, jobdept, 
           payyn, paybank, payacnt, paybank1, payacnt1,
           basicamt,  bonusamt,   homesupamt, 
           ybonamt, sbonamt,  
           ovtmamt,  aidamt1, aidamt2, aidamt3, 
           mcaramt, case when mcaramt - 100000 < 0 then 0 else  mcaramt - 100000 end  mcartaxamt, lectsupamt,
           dedamt1, dedamt2, dedamt3, 
           dedamt4, dedamt5,anudamt,meddamt,empldamt,/o2013.03.22.hjku. 문경란씨 요청,고용보험도 마스터에서 가져오도록 수정o/ 
           taxpay, notaxpay, 
           to_char(sysdate,'YYYYMMDDHH24MISSD'), payra, soguppay, 
           ovmcamt,  ovmcded, 
           fixpay, bfixpay,
           aidamt11, aidamt12, aidamt13, aidamt14, 
           taxpay1, taxpay2, taxpay3, taxpay4, 
           notaxpay1, notaxpay2, notaxpay3, notaxpay4, 
           soguppay1,
           lectsupamt1,lectsupamt2, lectsupamt3,lectsupamt4                         
      from pkmpmas a 
     where upper(a.payyn) = 'Y'
       and substr(a.empno,1,1) like 'Y%'
       and (a.empno >= substr(:frempno,1,4) and a.empno <= substr(:toempno,1,4))
       ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into pkmpycalc (paydate,empno,korname,paycl,pstate,orgnum,dep\
tcode,boncode,bldcode,jobdept,payyn,paybank,payacnt,paybank1,payacnt1,basica\
mt,bonusamt,homesupamt,ybonamt,sbonamt,ovtmamt,aidamt1,aidamt2,aidamt3,mcara\
mt,mcartaxamt,lectsupamt,dedamt1,dedamt2,dedamt3,dedamt4,dedamt5,anudamt,med\
damt,empldamt,taxpay,notaxpay,cretime,payra,sopaysum,ovmcamt,ovmcded,fixpay,\
bfixpay,aidamt11,aidamt12,aidamt13,aidamt14,taxpay1,taxpay2,taxpay3,taxpay4,\
notaxpay1,notaxpay2,notaxpay3,notaxpay4,sopaysum1,lectsupamt1,lectsupamt2,le\
ctsupamt3,lectsupamt4)select substr(:b0,1,8) ,a.empno ,korname ,paycl ,pstat\
e ,orgnum ,deptcode ,boncode ,bldcode ,jobdept ,payyn ,paybank ,payacnt ,pay\
bank1 ,payacnt1 ,basicamt ,bonusamt ,homesupamt ,ybonamt ,sbonamt ,ovtmamt ,\
aidamt1 ,aidamt2 ,aidamt3 ,mcaramt , case  when (mcaramt-100000)<0 then 0 el\
se (mcaramt-100000)  end  mcartaxamt ,lectsupamt ,dedamt1 ,dedamt2 ,dedamt3 \
,dedamt4 ,dedamt5 ,anudamt ,meddamt ,empldamt ,taxpay ,notaxpay ,to_char(sys\
date,'YYYYMMDDHH24MISSD') ,payra ,soguppay ,");
     sqlstm.stmt = "ovmcamt ,ovmcded ,fixpay ,bfixpay ,aidamt11 ,aidamt12 ,\
aidamt13 ,aidamt14 ,taxpay1 ,taxpay2 ,taxpay3 ,taxpay4 ,notaxpay1 ,notaxpay2 \
,notaxpay3 ,notaxpay4 ,soguppay1 ,lectsupamt1 ,lectsupamt2 ,lectsupamt3 ,lect\
supamt4  from pkmpmas a where ((upper(a.payyn)='Y' and substr(a.empno,1,1) li\
ke 'Y%') and (a.empno>=substr(:b1,1,4) and a.empno<=substr(:b2,1,4)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )531;
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


       
     
     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"월급여화일 생성오류...");
          sprintf(log_buff, " 월급여화일 생성오류....");
          Write_batlog(seqno++, log_buff);              /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     select  count(*)
       into  :rcount
       from  pkmpycalc
      where  (empno >= :frempno and empno <= :toempno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pkmpycalc where (empno>\
=:b1 and empno<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )558;
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
  from  pkhpday a, pkmpycalc b */
   
     /* EXEC SQL DECLARE cursor1 CURSOR FOR 
     SELECT  A.EMPNO,    NVL(A.PAYCALCKIND,' '), NVL(A.DUCALCKIND,' '), 
             NVL(A.BPAYCALCKIND,' '),NVL(A.BDUCALCKIND,' '),
             NVL(CBASICSUM,0),   
             NVL(SOBASICAMT,0)
       FROM  PKHPDAY A, pkmpycalc B   
      WHERE  A.PAYDATE = :paydate AND A.EMPNO = B.EMPNO 
        AND (A.EMPNO >= :frempno AND B.EMPNO <= :toempno); */ 

     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )585;
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
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )612;
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
                  :basicamt, :bbasicamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )627;
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
          sqlstm.sqhstv[6] = (unsigned char  *)&bbasicamt;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )670;
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
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )685;
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
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )700;
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
     UPDATE   pkmpycalc
        SET  
            PAYCALCKIND   = :paycalckind, 
            DUCALCKIND   = :ducalckind,
            BPAYCALCKINd   = :bpaycalckind, 
            BDUCALCKIND   = :bducalckind, 
            BASICAMT   = :basicamt
      WHERE EMPNO = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set PAYCALCKIND=:b0,DUCALCKIND=:b1,BP\
AYCALCKINd=:b2,BDUCALCKIND=:b3,BASICAMT=:b4 where EMPNO=:b5";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )715;
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
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기 오류1...");
          sprintf(log_buff, " 월급여화일 쓰기 오류1...."); 
          Write_batlog(seqno++, log_buff);                /*dsa2000 Rexec 대체*/   
          return(FAIL);
     }
     else
          return(SUCCESS);
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMM')),'DD') in\
to :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )754;
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


       
       
     /* EXEC SQL  
     SELECT  TO_CHAR(ADD_MONTHS(TO_DATE(:paydate,'yyyymm'),-1),'yyyymm') 
       INTO  :predate
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'yyyymm'),(-1)),'\
yyyymm') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )777;
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
     sqlstm.sqhstv[1] = (unsigned char  *)predate;
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

       
     
/* 2013.05.10.hjku BM 전적자 급여로 임시적으로 삭제
// 식교비 계산 2010.04.10 kth  전사원 식교비 수식          
     EXEC SQL 
     UPDATE  PKMPYCALC B
     SET  (
      MCARAMT,
      MCARTAXAMT
      )=
      (
       SELECT CEIL(400000 -(16000 * SUM((NVL(D.HEALTH,0) + NVL(D.HALF*0.5,0)+NVL(D.BIRTH,0)+
                                     NVL(D.CELEB,0) +  NVL(D.YEAR,0)+NVL(D.SICK,0) +
                                     NVL(D.ABSENCE,0))))),
              CEIL(400000 -(16000 * SUM((NVL(D.HEALTH,0) + NVL(D.HALF*0.5,0)+NVL(D.BIRTH,0)+
                                     NVL(D.CELEB,0) +  NVL(D.YEAR,0)+NVL(D.SICK,0) +
                                     NVL(D.ABSENCE,0))))) - MIN(E.MCARNOTAX )                                                                         
         FROM PKHDUTY D ,(SELECT MCARNOTAX FROM PKCPBAS) E  
        WHERE D.DUYYMM  = :predate
          AND D.EMPNO = B.EMPNO) 
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
        AND  A.EMPNO LIKE 'Y%'         
        AND  A.EMPNO = B.EMPNO )
        and (empno >= :frempno and empno <= :toempno);
*/  

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 연봉대상자...  ");
      error_quit("작업실패...");
     }     
     
     
/*       
// 중도 입사자 일할 계산 2010.04.10 kth             
     EXEC SQL 
     UPDATE  PKMPYCALC B
     SET  (
      FIXPAY,
      -- NOTAXPAY1,
      MCARAMT,
      MCARTAXAMT
      )=
      (
      SELECT  CEIL(A.FIXPAY     * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
              -- Trunc(A.NOTAXPAY1 * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday), 
              CEIL(400000 * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
              CEIL(400000 * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday) - E.MCARNOTAX              
        FROM  PKMPMAS A,(SELECT MCARNOTAX FROM PKCPBAS) E 
       WHERE  A.PAYYN ='Y'
         AND  A.EMPNO LIKE 'Y%' 
         AND  A.EMPDATE >= :paydate||'01'
         AND  A.EMPNO = B.EMPNO)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
        AND  A.EMPNO LIKE 'Y%' 
        AND  A.EMPDATE >= :paydate||'01'
        AND  A.EMPNO = B.EMPNO )
        and (empno >= :frempno and empno <= :toempno);
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 연봉대상자...  ");
      error_quit("작업실패...");
     }
     
// 중도 퇴사자 일할 계산 2010.06.10 kth
    EXEC SQL 
     UPDATE  PKMPYCALC B
     SET  (
      FIXPAY,
      -- NOTAXPAY1, 
      MCARAMT,
      MCARTAXAMT   
      )=
      (
      SELECT  CEIL(A.FIXPAY     *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday),
              -- Trunc(A.NOTAXPAY1 *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday), 
              CEIL(C.MCARAMT    *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday), 
              CEIL(C.MCARAMT    *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday)-MCARNOTAX
        FROM  PKMPMAS A, (SELECT MCARNOTAX FROM PKCPBAS) E ,
                        (SELECT EMPNO,CEIL(400000 -(16000*
                                    (NVL(D.HEALTH,0) + NVL(D.HALF,0)*0.5+NVL(D.BIRTH,0)+
                                     NVL(D.CELEB,0) +  NVL(D.YEAR,0)+NVL(D.SICK,0) +
                                     NVL(D.ABSENCE,0)))) MCARAMT
                               FROM PKHDUTY D   
                              WHERE D.DUYYMM =:predate
                              ) C
       WHERE  A.PAYYN ='Y'
         AND  A.EMPNO LIKE 'Y%' 
         AND  SUBSTR(A.RETDATE,1,6) = SUBSTR(:paydate,1,6)
         AND  A.EMPNO = B.EMPNO
         AND  A.EMPNO = C.EMPNO)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
        AND  A.EMPNO LIKE 'Y%' 
        AND  SUBSTR(A.RETDATE ,1,6) = SUBSTR(:paydate,1,6)
        AND  A.EMPNO = B.EMPNO )
     and (empno >= :frempno and empno <= :toempno);
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
         print_errmsg(sqlca.sqlcode,"중도퇴사자 일할계산 연봉대상자...  ");
         error_quit("작업실패...");
     }  
*/      
 
// 중도 입사자 일할 계산 
// 2015.09.08 jissi 이지연씨요청 400000 월식교비 고정값=>개인별 연간식교비/12=242000로 변경
     /* EXEC SQL 
     UPDATE  PKMPYCALC B
     SET  (
      FIXPAY,
      /oNOTAXPAY1,o/
      /oMCARAMT,  2015.09.16 jissi 이지연씨요청 식교비 계산값이 아닌 식교비 급여자료파일 업로드한 자료로 등록되도록 생성작업 삭제o/
      MCARTAXAMT
      )=
      (
      SELECT  CEIL(A.FIXPAY     * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),
              /oTrunc(A.NOTAXPAY1 * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),o/
              /oCEIL(NVL(Y.TONGAMT12,0)
                   * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday),o/
              GREATEST(CEIL(NVL(Y.TONGAMT12, 0)  
                            * (:totday - TO_NUMBER(SUBSTR(A.EMPDATE,7,2))+1)  / :totday) - E.MCARNOTAX,0)              
        FROM  PKMPMAS A,(SELECT MCARNOTAX FROM PKCPBAS) E ,
              (SELECT EMPNO, (TONGAMT1/12) TONGAMT12 FROM PKHYPHIS 
                WHERE yearpaynum = (SELECT yearpaynum FROM PKCPBAS) ) Y
       WHERE  A.PAYYN   =    'Y'
         AND  A.EMPNO   LIKE 'Y%' 
         AND  A.EMPDATE >=   substr(:paydate,1,6)||'01'
         AND  A.EMPNO   =    Y.EMPNO(+)
         AND  A.EMPNO   =    B.EMPNO)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
        FROM  PKMPMAS A
       WHERE  A.PAYYN   =    'Y'
         AND  A.EMPNO   LIKE 'Y%' 
         AND  A.EMPDATE >=   substr(:paydate,1,6)||'01'
         AND  A.EMPNO   =    B.EMPNO )
         and (empno     >=   :frempno  and  empno    <=   :toempno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMPYCALC B  set (FIXPAY,MCARTAXAMT)=(select CEI\
L(((A.FIXPAY* ((:b0-TO_NUMBER(SUBSTR(A.EMPDATE,7,2)))+1))/:b0)) ,GREATEST((CE\
IL(((NVL(Y.TONGAMT12,0)* ((:b0-TO_NUMBER(SUBSTR(A.EMPDATE,7,2)))+1))/:b0))-E.\
MCARNOTAX),0)  from PKMPMAS A ,(select MCARNOTAX  from PKCPBAS ) E ,(select E\
MPNO ,(TONGAMT1/12) TONGAMT12  from PKHYPHIS where yearpaynum=(select yearpay\
num  from PKCPBAS )) Y where ((((A.PAYYN='Y' and A.EMPNO like 'Y%') and A.EMP\
DATE>=(substr(:b4,1,6)||'01')) and A.EMPNO=Y.EMPNO(+)) and A.EMPNO=B.EMPNO)) \
where (EMPNO in (select EMPNO  from PKMPMAS A where (((A.PAYYN='Y' and A.EMPN\
O like 'Y%') and A.EMPDATE>=(substr(:b4,1,6)||'01')) and A.EMPNO=B.EMPNO)) an\
d (empno>=:b6 and empno<=:b7))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )800;
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
     sqlstm.sqhstv[4] = (unsigned char  *)paydate;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)paydate;
     sqlstm.sqhstl[5] = (unsigned long )9;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      print_errmsg(sqlca.sqlcode,"중도입사자 일할계산 연봉대상자...  ");
      error_quit("작업실패...");
     }
     
// 중도 퇴사자 일할 계산
// 2015.09.08 jissi 이지연씨요청 400000 월식교비, 16000일식교비 고정값=>개인별 연간식교비/12=242000, (연간식교비/12)/22=11000로 변경
    /* EXEC SQL 
     UPDATE  PKMPYCALC B
     SET  (
      FIXPAY,
      /oNOTAXPAY1,o/
      /oMCARAMT,  2015.09.16 jissi 이지연씨요청 식교비 계산값이 아닌 식교비 급여자료파일 업로드한 자료로 등록되도록 삭제o/
      MCARTAXAMT   
      )=
      (
      SELECT  CEIL(A.FIXPAY     *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday),
              /oTrunc(A.NOTAXPAY1 *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday),o/
              /oCEIL(C.MCARAMT    *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday),o/
              GREATEST(CEIL(C.MCARAMT    *  TO_NUMBER(SUBSTR(A.RETDATE,7,2))  / :totday)-MCARNOTAX,0)
        FROM  PKMPMAS A,(SELECT MCARNOTAX FROM PKCPBAS) E ,
                        (SELECT D.EMPNO,CEIL(NVL(Y.Tongamt12,0) -(NVL(Y.Tongamt22,0)*
                               (NVL(D.HEALTH,0) + NVL(D.HALF,0)*0.5+NVL(D.BIRTH,0)+
                                NVL(D.CELEB,0)  + NVL(D.YEAR,0)    +NVL(D.SICK,0) +
                                NVL(D.ABSENCE,0)))) MCARAMT
                           FROM PKHDUTY D, (SELECT empno, TONGAMT1/12 Tongamt12, (TONGAMT1/12)/22 Tongamt22 
                                              FROM PKHYPHIS WHERE yearpaynum = (SELECT yearpaynum FROM PKCPBAS)) Y 
                          WHERE D.DUYYMM =:predate
                            AND D.EMPNO  = Y.EMPNO
                        ) C
       WHERE  A.PAYYN =    'Y'
         AND  A.EMPNO LIKE 'Y%' 
         AND  SUBSTR(A.RETDATE,1,6) = substr(:paydate,1,6)
         AND  A.EMPNO =    B.EMPNO
         AND  A.EMPNO =    C.EMPNO)
     WHERE  EMPNO IN 
     (
      SELECT  EMPNO
      FROM  PKMPMAS A
      WHERE  A.PAYYN ='Y'
        AND  A.EMPNO LIKE 'Y%' 
        AND  SUBSTR(A.RETDATE ,1,6) = substr(:paydate,1,6)
        AND  A.EMPNO = B.EMPNO )
     and (empno >= :frempno and empno <= :toempno); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 11;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PKMPYCALC B  set (FIXPAY,MCARTAXAMT)=(select CEIL\
(((A.FIXPAY* TO_NUMBER(SUBSTR(A.RETDATE,7,2)))/:b0)) ,GREATEST((CEIL(((C.MCAR\
AMT* TO_NUMBER(SUBSTR(A.RETDATE,7,2)))/:b0))-MCARNOTAX),0)  from PKMPMAS A ,(\
select MCARNOTAX  from PKCPBAS ) E ,(select D.EMPNO ,CEIL((NVL(Y.Tongamt12,0)\
-(NVL(Y.Tongamt22,0)* ((((((NVL(D.HEALTH,0)+(NVL(D.HALF,0)* 0.5))+NVL(D.BIRTH\
,0))+NVL(D.CELEB,0))+NVL(D.YEAR,0))+NVL(D.SICK,0))+NVL(D.ABSENCE,0))))) MCARA\
MT  from PKHDUTY D ,(select empno ,(TONGAMT1/12) Tongamt12 ,((TONGAMT1/12)/22\
) Tongamt22  from PKHYPHIS where yearpaynum=(select yearpaynum  from PKCPBAS \
)) Y where (D.DUYYMM=:b2 and D.EMPNO=Y.EMPNO)) C where ((((A.PAYYN='Y' and A.\
EMPNO like 'Y%') and SUBSTR(A.RETDATE,1,6)=substr(:b3,1,6)) and A.EMPNO=B.EMP\
NO) and A.EMPNO=C.EMPNO)) where (EMPNO in (select EMPNO  from PKMPMAS A where\
 (((A.PAYYN='Y' and A.EMPNO like 'Y%') and SUBSTR(A.RETDATE,1,6)=substr(:b3,1\
,6)) and A.EMPNO=B.EMPNO)) and (empno>=:b5 and empno<=:b6))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )847;
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
    sqlstm.sqhstv[2] = (unsigned char  *)predate;
    sqlstm.sqhstl[2] = (unsigned long )9;
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
    sqlstm.sqhstv[4] = (unsigned char  *)paydate;
    sqlstm.sqhstl[4] = (unsigned long )9;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)frempno;
    sqlstm.sqhstl[5] = (unsigned long )5;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)toempno;
    sqlstm.sqhstl[6] = (unsigned long )5;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
         print_errmsg(sqlca.sqlcode,"중도퇴사자 일할계산 연봉대상자...  ");
         error_quit("작업실패...");
     }  
     
     
// 식교비 과세액 0 처리  2010.06.10 kth
    /* EXEC SQL 
     UPDATE  PKMPYCALC B
        SET  MCARTAXAMT =0
      WHERE  MCARTAXAMT < 0 ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 11;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PKMPYCALC B  set MCARTAXAMT=0 where MCARTAXAMT<0";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )890;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
         print_errmsg(sqlca.sqlcode,"식교비 과세액 0 처리 ...  ");
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
     update pkmpycalc
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
      where empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set lectsupamt=(((NVL(lectsupamt1,0)+\
NVL(lectsupamt2,0))+NVL(lectsupamt3,0))+NVL(lectsupamt4,0)),edusupamt=(NVL(ed\
usupamt1,0)+NVL(edusupamt2,0)),hsamt=(NVL(hsorgamt,0)+NVL(hsintamt,0)),aidamt\
1=(((NVL(aidamt11,0)+NVL(aidamt12,0))+NVL(aidamt13,0))+NVL(aidamt14,0)),aidam\
t2=(((NVL(aidamt21,0)+NVL(aidamt22,0))+NVL(aidamt23,0))+NVL(aidamt24,0)),taxp\
ay=(((NVL(taxpay1,0)+NVL(taxpay2,0))+NVL(taxpay3,0))+NVL(taxpay4,0)),notaxpay\
=(((NVL(notaxpay1,0)+NVL(notaxpay2,0))+NVL(notaxpay3,0))+NVL(notaxpay4,0)),so\
paysum=(((((NVL(sopaysum1,0)+NVL(sopaysum2,0))+NVL(sopaysum3,0))+NVL(sopaysum\
4,0))+NVL(sopaysum5,0))+NVL(sopaysum6,0)) where (empno>=:b0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )905;
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
     update  pkmpycalc
        set   
             basicamt   = 0,             
             dutyamt   = 0,
             bdutyamt  = 0,
             bonusamt  = 0,
             trainamt  = 0            
      where  (empno >= :frempno and empno <= :toempno)
        /oinfra   and  paycl >= '09';o/
        and  paycl >= 'C11'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set basicamt=0,dutyamt=0,bdutyamt=0,b\
onusamt=0,trainamt=0 where ((empno>=:b0 and empno<=:b1) and paycl>='C11')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )928;
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
     update pkmpycalc
        set   
            taxpaysum = 
                          (
                          basicamt   + bbasicamt  + 
                          bonusamt   + homesupamt +                        
                          ovtmamt    +  
                          aidamt1    + aidamt2 + aidamt3 + 
                          mcaramt    +                                   /o 2016.09.26 유훈일M요청 델파이 소스와 맞춤  mcartaxamt=> mcaramt     o/         
                          lectsupamt + sbontaxamt + 
                          taxpay     + sopaysum   + ovmcamt +
                          fixpay     + nvl(bfixpay ,0) +
                          nvl(meddamt,0) + nvl(empldamt,0) +             /o2013.05.10.hjku. 오류수정(기타수당1이 두번 합산됨)  aidamt1 +        o/
                          nvl(anudamt,0) + nvl(dedamt1,0)  +             /o 기타 공제 처리 기타 공제 1은 파견직 수수료                          o/
                          nvl(ybonamt,0)                                 /o 2016.09.26 유훈일매니저요청 연차수당 과세합에 추가                  o/
                          /o 2016.09.26 유훈일M요청 과세합계금액에서 공제합 뺌
                          - ticketamt    -                               * 2010.04.08 kth 4대보험 지급합계넣어줌 기지급식대 차감               * 
                          nvl(dedamt2,0) - nvl(dedamt3,0)- nvl(dedamt4,0)o/ 
                          ),                                             /o 4대 보험은 각 회사에서 지급 되기 때문에 계산에서 지급 금액에 넣어줌 o/
            notaxpaysum = 
                          ( 
                          sbonamt  - sbontaxamt +                       
                          /o mcaramt  - mcartaxamt +                       2016.09.26 유훈일M요청 델파이 소스와 맞춤                    o/
                          /o odamt    - odtaxamt   +                ovmcamt  + * 98 01 add 98.09.04 과세o/
                          notaxpay                                       /o2016.09.26 유훈일M요청 연차수당 과세합에 추가 + ybonamt      o/
                          )                                                                                                       
      where  empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set taxpaysum=((((((((((((((((((((bas\
icamt+bbasicamt)+bonusamt)+homesupamt)+ovtmamt)+aidamt1)+aidamt2)+aidamt3)+mc\
aramt)+lectsupamt)+sbontaxamt)+taxpay)+sopaysum)+ovmcamt)+fixpay)+nvl(bfixpay\
,0))+nvl(meddamt,0))+nvl(empldamt,0))+nvl(anudamt,0))+nvl(dedamt1,0))+nvl(ybo\
namt,0)),notaxpaysum=((sbonamt-sbontaxamt)+notaxpay) where (empno>=:b0 and em\
pno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )951;
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
     update pkmpycalc
        set paysum   = (taxpaysum+notaxpaysum),
            realpay  = (taxpaysum+notaxpaysum)    /o명절연봉만 지급시 급여생성만해도 실지급액 업데이트 되도록 항상Update.o/
      where empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set paysum=(taxpaysum+notaxpaysum),re\
alpay=(taxpaysum+notaxpaysum) where (empno>=:b0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )974;
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
     update  pkmpycalc  
        set  dedsum = 
                      ( 
                       ticketamt +dedamt2 + dedamt3 +dedamt4 
                       /o empldamt + meddamt  + anudamt + dedamt1 
                        98.09.04 석식대공제금 + dedamt1 + dedamt2 + dedamt3 +
                       dedamt4 + dedamt5 o/
                      )
      where   empno >= :frempno and empno <= :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmpycalc  set dedsum=(((ticketamt+dedamt2)+deda\
mt3)+dedamt4) where (empno>=:b0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )997;
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1020;
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1061;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
