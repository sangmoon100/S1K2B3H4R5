
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
    "pkz4021g.pc"
};


static unsigned int sqlctx = 156451;


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
   unsigned char  *sqhstv[5];
   unsigned long  sqhstl[5];
            int   sqhsts[5];
            short *sqindv[5];
            int   sqinds[5];
   unsigned long  sqharm[5];
   unsigned long  *sqharc[5];
   unsigned short  sqadto[5];
   unsigned short  sqtdso[5];
} sqlstm = {12,5};

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
"select EMPNO ,RETDATE ,BLDCODE  from PKZRTMAS where Empno like :b0         \
  ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,196,0,5,129,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,2,221,0,5,144,0,0,1,1,0,1,0,1,97,0,0,
43,0,0,3,601,0,5,164,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,4,172,0,5,189,0,0,1,1,0,1,0,1,97,0,0,
81,0,0,5,87,0,5,205,0,0,1,1,0,1,0,1,97,0,0,
100,0,0,6,64,0,4,220,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
123,0,0,7,77,0,9,247,0,0,1,1,0,1,0,1,97,0,0,
142,0,0,7,0,0,13,259,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
169,0,0,7,0,0,15,264,0,0,0,0,0,1,0,
184,0,0,8,254,0,5,271,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
207,0,0,9,162,0,5,289,0,0,1,1,0,1,0,1,97,0,0,
226,0,0,10,40,0,4,307,0,0,1,0,0,1,0,2,4,0,0,
245,0,0,11,89,0,5,312,0,0,1,1,0,1,0,1,97,0,0,
264,0,0,12,87,0,5,318,0,0,3,3,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,
291,0,0,13,267,0,5,325,0,0,1,1,0,1,0,1,97,0,0,
310,0,0,14,74,0,5,338,0,0,2,2,0,1,0,1,4,0,0,1,97,0,0,
333,0,0,15,146,0,5,348,0,0,1,1,0,1,0,1,97,0,0,
352,0,0,16,98,0,5,372,0,0,1,1,0,1,0,1,97,0,0,
371,0,0,17,81,0,5,386,0,0,1,1,0,1,0,1,97,0,0,
390,0,0,18,86,0,4,415,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
413,0,0,19,75,0,4,420,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
436,0,0,20,65,0,4,428,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
459,0,0,21,57,0,4,436,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
482,0,0,22,46,0,4,475,0,0,1,0,0,1,0,2,97,0,0,
501,0,0,23,29,0,5,488,0,0,0,0,0,1,0,
516,0,0,24,205,0,5,492,0,0,1,1,0,1,0,1,97,0,0,
535,0,0,25,50,0,3,510,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
576,0,0,26,0,0,29,520,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkz4021g(임원 퇴직자 월급여 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 임원 퇴직정산
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2008.12

hinsacc pkz4021g
mv pkz4021g ~/HINSA/proc/bin/Kbin

Update Contents
 Version  date(yy.mm.dd)  programmer   description            relevant doc.no
  1.00     2008.12        강륜종      최초개발본             pkz2070g.pc 기반으로 생성.
============================================================================= */
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

  char  workyymmdd[9];
  char  ovtmyymm[7];
  char  DayOfWeek[4];
  char  tempdate[9];
  char  LastDay[3];
  char  HoliDate[9];
  char  empno[5];
  char  bldcode[3];
  char  retdate[9];
  int   mcarday;
  char  GSempno[5];
  double  mcarnotax;
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

enum  { WEEKDAY=0, WEEKEND=1 } day[33];
char  cmdline[256];
int   db;
int   id;
char  UserId[20];

char  log_rundate[16] = ""; 
char  log_progid[16]  = "";
char  log_writeman[5] = "";
char  log_buff[100]   = "";
char  calcempno[5]    = "";
int   seqno = 0; 
char  president_empno[5]= ""; /* 사장님사번           */  

void main(argc,argv)
int argc;
char *argv[];
{
     char FL_file[255];
               
     if (argc != 5) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkz4021g D006 pkz4021g M112 200812310000 */
              printf("[Usage] : pkz4021g  1.작업자사번 2.프로그램ID 3.특정사번만 계산시 사번 4.시작시간 \n");  
              exit(1);
     }
     
     memset(UserId,'\0',sizeof(UserId));
     strcpy(UserId,argv[2]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkz4021g");
     
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
         
     hinsa_log_print(0,"퇴직자 월급여 계산 시작...");                       
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[2]);
     strcpy(calcempno,    argv[3]);
     strcpy(log_rundate,  argv[4]);
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     
     sprintf(GSempno,"%4s",argv[1]);
     
     CalcPay();
     
     /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [퇴직월 급여 계산 작업이 성공] =====");
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0,"OK ====== [퇴직월 급여 계산 작업이 성공] =====");
     }  
}

CalcPay()
{
     char *HOMEDIR;
     
     HOMEDIR = hinsa_home();  /* "/hper/insa/HINSA" 읽어오기...*/
     strcat(HOMEDIR,"/proc");
     
     printf("\n 1. 기본사항 갱신 중 ....");
     sprintf(log_buff, "\n 1. 기본사항 갱신 중 ....");
     Write_batlog(seqno++, log_buff); 
     
     /* Clear */
     /* EXEC   SQL
     UPDATE PKZRTMAS
        set FIXPAY     = 0,   SBONAMT    = 0,   BOKJISUPAMT= 0, 
            AIDAMT3    = 0,   MCARAMT    = 0,   MCARTAXAMT = 0, 
            TAXPAY     = 0,   NOTAXPAY   = 0,   TICKETAMT  = 0, 
            ANUDAMT    = 0,   MEDDAMT    = 0,   EMPAMT     = 0, 
            PAYSUM     = 0,   DEDTOT     = 0,   REALPAY    = 0
      Where Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS  set FIXPAY=0,SBONAMT=0,BOKJISUPAMT=0,A\
IDAMT3=0,MCARAMT=0,MCARTAXAMT=0,TAXPAY=0,NOTAXPAY=0,TICKETAMT=0,ANUDAMT=0,MED\
DAMT=0,EMPAMT=0,PAYSUM=0,DEDTOT=0,REALPAY=0 where Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


      
     
     /*급여마스터로부터 월정연봉,가족수당을 셋팅한다.  */
     printf("\n 2. 지급금 갱신 중 ....");
     sprintf(log_buff, "\n 2. 지급금 갱신 중 ....");
     Write_batlog(seqno++, log_buff); 
     
     /* EXEC SQL
     UPDATE PKZRTMAS p
        SET FIXPAY
          = (SELECT CEIL(NVL(FIXPAY ,0) /
                         TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') *
                         TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')   )
               FROM PKZMPMAS R
              WHERE P.EMPNO=R.EMPNO)
      WHERE  Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set FIXPAY=(select CEIL(((NVL(FIXPAY\
,0)/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))* TO_CHAR(TO_DATE(P\
.RETDATE,'YYYYMMDD'),'DD')))  from PKZMPMAS R where P.EMPNO=R.EMPNO) where Em\
pno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )24;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {  err_print(sqlca.sqlcode,"2. 인사자료 갱신 ERROR");
       sprintf(log_buff, "2. 인사자료 갱신 ERROR");
        Write_batlog(seqno++, log_buff); 
       exit(1);
     }

     /* =========================================================================
        FIXPAY, FAMIAMT 일할계산 추가.   퇴직일이 말일이 아닌 경우만 급여환수를 한다.
     ============================================================================= */
     /* EXEC SQL
     UPDATE PKZRTMAS p
        set (FIXPAY, MCARAMT)
          = (SELECT CEIL(NVL(FIXPAY ,0) /
                         TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')*
                        (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )
                         ) * -1,
                    CEIL(NVL(MCARAMT ,0) /
                         TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')*
                        (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )
                         ) * -1
               FROM PKZHPHIS R
              WHERE P.EMPNO = R.EMPNO
                AND PAYDATE = SUBSTR(RETDATE,1,6))
     WHERE  RETDATE <> TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM')),'YYYYMMDD')
       AND Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set (FIXPAY,MCARAMT)=(select (CEIL((\
(NVL(FIXPAY,0)/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))* (TO_CH\
AR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'Y\
YYYMMDD'),'DD'))))* (-1)) ,(CEIL(((NVL(MCARAMT,0)/TO_CHAR(LAST_DAY(TO_DATE(P.\
RETDATE,'YYYYMMDD')),'DD'))* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD'))\
,'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))))* (-1))  from PKZHPHIS R\
 where (P.EMPNO=R.EMPNO and PAYDATE=SUBSTR(RETDATE,1,6))) where (RETDATE<>TO_\
CHAR(LAST_DAY(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM')),'YYYYMMDD') and Empno li\
ke :b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )43;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


       
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {  
         err_print(sqlca.sqlcode,"2.2 인사자료 갱신 ERROR 지급한 급여환수 ");
         sprintf(log_buff, "2.2 인사자료 갱신 ERROR 지급한 급여환수 ");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     /* EXEC SQL
     UPDATE  PKZRTMAS p
        SET (MEDDAMT,  ANUDAMT , BOKJISUPAMT)
          = (SELECT NVL(MEDDAMT,0), NVL(ANUDAMT,0), NVL(BOKJISUPAMT,0)
               FROM PKZMPMAS R
              WHERE P.EMPNO=R.EMPNO)
      WHERE  Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set (MEDDAMT,ANUDAMT,BOKJISUPAMT)=(s\
elect NVL(MEDDAMT,0) ,NVL(ANUDAMT,0) ,NVL(BOKJISUPAMT,0)  from PKZMPMAS R whe\
re P.EMPNO=R.EMPNO) where Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )62;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

 
      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {  err_print(sqlca.sqlcode,"3. 인사자료 갱신 ERROR");
       sprintf(log_buff, "3. 인사자료 갱신 ERROR");
        Write_batlog(seqno++, log_buff); 
       exit(1);
     }
     
     /*  퇴사일이 14일 이전이면 복지연금지원금을 0으로 한다*/
     /* EXEC SQL
     UPDATE PKZRTMAS
        SET BOKJISUPAMT = 0
      WHERE SUBSTR(RETDATE,7,2) <= '14'
        AND Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS  set BOKJISUPAMT=0 where (SUBSTR(RETDAT\
E,7,2)<='14' and Empno like :b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )81;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


        
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
         err_print(sqlca.sqlcode,"3.0 복지연금 setting Error");
         sprintf(log_buff, "3.0 복지연금 setting Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     
     /* EXEC SQL
     SELECT  MAX(RETDATE) 
       INTO :workyymmdd
       FROM  PKZRTMAS
      Where  Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(RETDATE) into :b0  from PKZRTMAS where Empno\
 like :b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )100;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymmdd;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)calcempno;
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

  
      
     if ( sqlca.sqlcode != 0 )
     {  
         err_print(sqlca.sqlcode,"4. 퇴직월 추출 Error");
         sprintf(log_buff, "4. 퇴직월 추출 Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     SetCalendar(workyymmdd);
     
     printf("\n 3. 지급금(수당) 갱신 중 ....");
     sprintf(log_buff, "\n 3. 지급금(수당) 갱신 중 ....");
     Write_batlog(seqno++, log_buff); 
     
     /*  식대교통비를 계산한다. 식대교통비는 퇴직월 1일 부터 퇴직일까지의 일수를 구하고
         이에서 공휴일과일요일을 제외한 날수에 식대교통비 기준금액에 곱하여 구한다.*/
     /* EXEC SQL DECLARE  c1 CURSOR FOR
     SELECT EMPNO, RETDATE, BLDCODE
       FROM PKZRTMAS
      WHERE Empno like :calcempno; */ 

     
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )123;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
         err_print(sqlca.sqlcode,"5. 퇴직일 Read Error");
         sprintf(log_buff, "5. 퇴직일 Read Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     while(1)
     {
          /* EXEC SQL FETCH c1 into
          :empno, :retdate, :bldcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )142;
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
          sqlstm.sqhstv[2] = (unsigned char  *)bldcode;
          sqlstm.sqhstl[2] = (unsigned long )3;
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


          
          if (sqlca.sqlcode == 1403)
          {  
              /* EXEC SQL close c1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 3;
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


              break;
          }
          
          /* =========================================================================
           식대교통비 계산로직
          ============================================================================= */
          /* EXEC SQL
          UPDATE PKZRTMAS p
             SET MCARAMT 
               = (SELECT CEIL((LUNCHAMT+TRAFAMT+LUNCHADD+TRAFADD+TICKETAMT) 
                             / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') *
                               TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') * 25 )
                    FROM PKCPBLD
                   WHERE BLDCODE = :bldcode)
           WHERE EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKZRTMAS p  set MCARAMT=(select CEIL(((((((\
(LUNCHAMT+TRAFAMT)+LUNCHADD)+TRAFADD)+TICKETAMT)/TO_CHAR(LAST_DAY(TO_DATE(P.R\
ETDATE,'YYYYMMDD')),'DD'))* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))* 25)\
)  from PKCPBLD where BLDCODE=:b0) where EMPNO=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )184;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bldcode;
          sqlstm.sqhstl[0] = (unsigned long )3;
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


           
          if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
              err_print(sqlca.sqlcode,"6. 식교비 setting Error");
              sprintf(log_buff, "6. 식교비 setting Error");
              Write_batlog(seqno++, log_buff); 
              exit(1);
          }
          
          /* EXEC SQL
          UPDATE PKZRTMAS p
             SET MCARAMT = CEIL(250000
                              / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') *
                                TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')  )
           WHERE EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKZRTMAS p  set MCARAMT=CEIL(((250000/TO_CH\
AR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))* TO_CHAR(TO_DATE(P.RETDATE,\
'YYYYMMDD'),'DD'))) where EMPNO=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )207;
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
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
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
              err_print(sqlca.sqlcode,"6. 식교비 setting Error");
              sprintf(log_buff, "6. 식교비 setting Error");
              Write_batlog(seqno++, log_buff); 
              exit(1);
          }
     
     }  /* END OF */
     
       
     /* EXEC SQL
     SELECT  MCARNOTAX
       INTO  :mcarnotax
       FROM  PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select MCARNOTAX into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )226;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
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
     UPDATE PKZRTMAS p
        SET MCARAMT = NVL(MCARAMT,0),        
            MBONAMT = NVL(MBONAMT,0)
      WHERE Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set MCARAMT=NVL(MCARAMT,0),MBONAMT=N\
VL(MBONAMT,0) where Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )245;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


     
     /* EXEC SQL
     UPDATE PKZRTMAS p
        SET MCARTAXAMT = MCARAMT - :mcarnotax
      WHERE MCARAMT >= :mcarnotax
        AND Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set MCARTAXAMT=(MCARAMT-:b0) where (\
MCARAMT>=:b0 and Empno like :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )264;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)calcempno;
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


     
     /*식당소재지역  100%과세 */
     /* EXEC SQL
     UPDATE PKZRTMAS P
        SET MCARTAXAMT 
          = (SELECT MCARAMT
               FROM PKZRTMAS A, PKCPBLD B
              WHERE A.BLDCODE = B.BLDCODE
                AND A.EMPNO   = P.EMPNO
                AND RESTYN    = 'Y' )
      WHERE EMPNO IN (SELECT A.EMPNO FROM   PKZRTMAS A, PKCPBLD B
                       WHERE A.BLDCODE = B.BLDCODE
                         AND RESTYN ='Y' )
        AND Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS P  set MCARTAXAMT=(select MCARAMT  from\
 PKZRTMAS A ,PKCPBLD B where ((A.BLDCODE=B.BLDCODE and A.EMPNO=P.EMPNO) and R\
ESTYN='Y')) where (EMPNO in (select A.EMPNO  from PKZRTMAS A ,PKCPBLD B where\
 (A.BLDCODE=B.BLDCODE and RESTYN='Y')) and Empno like :b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )291;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


     
     /* EXEC SQL
     UPDATE PKZRTMAS P
        SET MCARTAXAMT = 0
      WHERE MCARAMT < :mcarnotax
        AND Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS P  set MCARTAXAMT=0 where (MCARAMT<:b0 \
and Empno like :b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )310;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)calcempno;
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


     

     /* =========================================================================
        계산항목clear추가   
     ============================================================================= */
     /* EXEC   SQL
     UPDATE PKZRTMAS
        SET PAYSUM = NVL(FIXPAY,0)    + NVL(MCARAMT,0)   + NVL(SBONAMT,0)   + NVL(BOKJISUPAMT,0) + 
                     NVL(AIDAMT3,0)   + 0                + 0                + 0                 
      Where Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS  set PAYSUM=(((((((NVL(FIXPAY,0)+NVL(MC\
ARAMT,0))+NVL(SBONAMT,0))+NVL(BOKJISUPAMT,0))+NVL(AIDAMT3,0))+0)+0)+0) where \
Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )333;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


                            
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
         err_print(sqlca.sqlcode,"7. 급여총액 setting Error");
         sprintf(log_buff, "7. 급여총액 setting Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     printf("\n 4. 공제금  갱신 중 ....");
     sprintf(log_buff, "\n 4. 공제금  갱신 중 ....");
     Write_batlog(seqno++, log_buff); 
     

     /* 고용보험료 계산  ***************************************************  */
     set_empamt();
      
     
     /*  공제총액 계산  ****************************************************  */
     /* EXEC  SQL
     UPDATE PKZRTMAS p
        SET DEDTOT = NVL(MEDDAMT,0) + NVL(EMPAMT,0) + NVL(ANUDAMT,0)
      Where Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set DEDTOT=((NVL(MEDDAMT,0)+NVL(EMPA\
MT,0))+NVL(ANUDAMT,0)) where Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )352;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

     
     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
         err_print(sqlca.sqlcode,"11. 공제총액 setting Error");
         sprintf(log_buff, "11. 공제총액 setting Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }
     
     /*  실지급액 계산  **************************************************** */
     /* EXEC  SQL
     UPDATE PKZRTMAS p
        SET REALPAY = NVL(PAYSUM,0) - NVL(DEDTOT,0)
      Where Empno like :calcempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS p  set REALPAY=(NVL(PAYSUM,0)-NVL(DEDTO\
T,0)) where Empno like :b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )371;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

     
     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
         err_print(sqlca.sqlcode,"12. 실지급액 setting Error");
         sprintf(log_buff, "12. 실지급액 setting Error");
         Write_batlog(seqno++, log_buff); 
         exit(1);
     }

}

SetCalendar(workdate)
char *workdate;
{
     int i;
     
     for(i=0 ; i< 33 ; ++i)
         day[i] = WEEKDAY;
     
     memset(tempdate,'\0',sizeof(tempdate));
     memset(DayOfWeek,'\0',sizeof(DayOfWeek));
     memset(LastDay,'\0',sizeof(LastDay));
     memset(ovtmyymm,'\0',sizeof(ovtmyymm));
     sprintf(tempdate,"%.6s%02d",workdate,1);
     
     /* EXEC  SQL
     SELECT  to_char(add_months(to_date(:tempdate,'YYYYMMDD'),-1),'YYYYMM')
       INTO :ovtmyymm
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(add_months(to_date(:b0,'YYYYMMDD'),(-1))\
,'YYYYMM') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )390;
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
     sqlstm.sqhstv[1] = (unsigned char  *)ovtmyymm;
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


     
     /* EXEC   SQL
     SELECT  to_char(last_day(to_date(:tempdate,'YYYYMMDD')),'DD')
       INTO :LastDay
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(last_day(to_date(:b0,'YYYYMMDD')),'DD') \
into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )413;
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
     sqlstm.sqhstv[1] = (unsigned char  *)LastDay;
     sqlstm.sqhstl[1] = (unsigned long )3;
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


     
     for( i = 1 ; i <= atoi(LastDay) ; ++i)
     {
          sprintf(tempdate,"%.6s%02d",workdate,i);
          /* EXEC SQL
          SELECT  to_char(to_date(:tempdate,'YYYYMMDD'),'DY')
            INTO :DayOfWeek
            FROM  DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_char(to_date(:b0,'YYYYMMDD'),'DY') into \
:b1  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )436;
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
          sqlstm.sqhstv[1] = (unsigned char  *)DayOfWeek;
          sqlstm.sqhstl[1] = (unsigned long )4;
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


            
          if (strcmp(DayOfWeek,"SUN")==0)
              day[i] = WEEKEND;
          
          /* EXEC   SQL
          SELECT  HOLIDATE
            INTO :HoliDate
            FROM  PKCHOLI
           WHERE  HOLIDATE = :tempdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select HOLIDATE into :b0  from PKCHOLI where HOLID\
ATE=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )459;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)HoliDate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)tempdate;
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


          
          if (sqlca.sqlcode == 0)
              day[i] = WEEKEND;
     }
}

/*  퇴직일까지 식교비 일수 계산  ***************************** */
CalMcarday(workdate)
char *workdate;
{
     char tempday[3];
     int  carday;
     int  i;
     
     memset(tempday,'\0',sizeof(tempday));
     sprintf(tempday,"%.2s",workdate+6);
     
     carday = atoi(tempday);
     
     for(i = 1; i <= atoi(tempday); ++i)
     {
          if (day[i] == WEEKEND)
              carday --;
     }
     
     return carday;
}


/* ===============================================================================
    고용보험료 
================================================================================= */
set_empamt()
{
     /* EXEC SQL 
     select  trim(presempno)
       into  :president_empno
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select trim(presempno) into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )482;
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


       
     if (sqlca.sqlcode != 0)
     {
        print_errmsg(sqlca.sqlcode,"사장님사번을 구하는 과정에서 Error...");
        sprintf(log_buff, "사장님사번을 구하는 과정에서 Error."); 
        Write_batlog(seqno++, log_buff);                        
        error_quit("작업실패...");
     }
     	
     /* EXEC SQL
     UPDATE PKZRTMAS
        SET empamt = 0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS  set empamt=0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )501;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        
     /* EXEC SQL  /o 과세총액 기준으로 계산로직 변경 2011.01. o/
     UPDATE PKZRTMAS A
        SET EMPAMT = (SELECT nvl( FLOOR( A.PAYSUM * B.emprate / 100 / 10 ) * 10 , 0 )
                        FROM pkzcpbas B )              
      Where '19'||substr(juminid,1,4) > to_char(add_months(sysdate,-720),'yyyymm') /o60세초과 고용보험료 납부안함o/
        AND Empno <> :president_empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS A  set EMPAMT=(select nvl((FLOOR((((A.P\
AYSUM* B.emprate)/100)/10))* 10),0)  from pkzcpbas B ) where (('19'||substr(j\
uminid,1,4))>to_char(add_months(sysdate,(-720)),'yyyymm') and Empno<>:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )516;
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

                                             /*사장님   고용보험료 납부안함*/
      
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
        err_print(sqlca.sqlcode,"8. 고용 보험료 setting Error");
        sprintf(log_buff, "8. 고용 보험료 setting Error");
        Write_batlog(seqno++, log_buff); 
        exit(1);
     }
}

int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )535;
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )576;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}


err_print(errcode,str)
int  errcode;
char *str;
{
    fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}