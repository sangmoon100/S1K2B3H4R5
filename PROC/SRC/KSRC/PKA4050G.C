
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
    "pka4050g.pc"
};


static unsigned int sqlctx = 150131;


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
   unsigned char  *sqhstv[34];
   unsigned long  sqhstl[34];
            int   sqhsts[34];
            short *sqindv[34];
            int   sqinds[34];
   unsigned long  sqharm[34];
   unsigned long  *sqharc[34];
   unsigned short  sqadto[34];
   unsigned short  sqtdso[34];
} sqlstm = {12,34};

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
"select NVL(EMPNO,' ') ,NVL(trim(KORNAME),' ') ,NVL(GROUPEMPDATE,EMPDATE)  f\
rom PIMPMAS where ((((PSTATE<'80' and EMPCODE<>'75') and :b0 between NVL(GROU\
PEMPDATE,EMPDATE) and to_char((to_date(NVL(GROUPEMPDATE,EMPDATE),'YYYYMMDD')+\
364),'YYYYMMDD')) and EMPNO not like 'M%') and EMPNO not like 'I%') order by \
EMPNO            ";

 static char *sq0026 = 
"select EMPNO ,EMPDATE  from PKNWYRDET where (EMPNO not  in (select NVL(EMPN\
O,' ')  from PIMPMAS where ((((PSTATE<'80' and EMPCODE<>'75') and :b0 between\
 NVL(GROUPEMPDATE,EMPDATE) and to_char((to_date(NVL(GROUPEMPDATE,EMPDATE),'YY\
YYMMDD')+364),'YYYYMMDD')) and EMPNO not like 'M%') and EMPNO not like 'I%'))\
 and to_char(SYSDATE,'YYYY')=to_char((to_date(EMPDATE,'YYYYMMDD')+365),'YYYY'\
)) order by EMPNO            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,55,0,4,124,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,44,0,1,138,0,0,0,0,0,1,0,
39,0,0,3,63,0,4,163,0,0,1,0,0,1,0,2,97,0,0,
58,0,0,4,323,0,9,214,0,0,1,1,0,1,0,1,97,0,0,
77,0,0,4,0,0,15,222,0,0,0,0,0,1,0,
92,0,0,4,0,0,13,229,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
119,0,0,4,0,0,15,233,0,0,0,0,0,1,0,
134,0,0,5,113,0,4,239,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,
161,0,0,6,65,0,4,278,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
184,0,0,7,182,0,4,292,0,0,5,3,0,1,0,1,3,0,0,1,3,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
219,0,0,8,71,0,4,306,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
242,0,0,9,877,0,4,314,0,0,34,33,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,2,97,0,0,1,97,0,0,1,97,0,0,
393,0,0,10,75,0,4,373,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
416,0,0,11,43,0,4,389,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
439,0,0,12,76,0,4,441,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
466,0,0,13,156,0,4,449,0,0,4,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,2,4,0,0,
497,0,0,14,160,0,3,459,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,
0,1,3,0,0,
536,0,0,15,141,0,5,497,0,0,5,5,0,1,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,0,
0,
571,0,0,16,76,0,4,524,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
598,0,0,17,157,0,4,532,0,0,4,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,2,4,0,0,
629,0,0,18,160,0,3,541,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,
0,1,3,0,0,
668,0,0,19,141,0,5,579,0,0,5,5,0,1,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,0,
0,
703,0,0,20,0,0,29,600,0,0,0,0,0,1,0,
718,0,0,21,144,0,4,619,0,0,8,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,
765,0,0,22,71,0,4,629,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,3,0,0,
792,0,0,23,109,0,3,644,0,0,8,8,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,
839,0,0,24,163,0,5,669,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,3,0,0,
882,0,0,25,171,0,5,703,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
905,0,0,26,412,0,9,752,0,0,1,1,0,1,0,1,97,0,0,
924,0,0,4,0,0,15,760,0,0,0,0,0,1,0,
939,0,0,26,0,0,13,767,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
962,0,0,26,0,0,15,771,0,0,0,0,0,1,0,
977,0,0,27,157,0,4,777,0,0,4,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,2,4,0,0,
1008,0,0,28,117,0,4,805,0,0,3,2,0,1,0,1,97,0,0,1,4,0,0,2,97,0,0,
1035,0,0,29,77,0,4,854,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
1062,0,0,30,50,0,3,868,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
1103,0,0,31,0,0,29,878,0,0,0,0,0,2,6,76,79,71,95,68,66,
1124,0,0,32,63,0,4,889,0,0,1,0,0,1,0,2,97,0,0,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKA4050G(1년 미만 입사자 연차 생성 프로그램)
 SYSTEM-NAME    : 인사
 SUBSYSTEM-NAME : 근태
 Programmer     : 이상문
 Version        : 1.00
 Date           : 2018.06.27

Update Contents
 Version  date(yy.mm.dd)  programmer       description                        relevant doc.no
 1.00     2018.06.27      이상문             최초개발본                       
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


/*** 함수 Prototype 선언  ***/
void    add_days(char* indate,int m, char* rdate);
double  calc_term(char *frdate,char *todate);
void    trail_spaces(char *dest);
void   check_duty(char* p_empno, int mon);

/****** log File 관련 ******/
void    CreateLog();
void    WriteLog(char *message);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 


     /***  연차 테이블(PKYEARLT) 참조변수  ***/
     char    yearly_yy[5]     = "";  /* 연차발생년도   */
     char    empno[5]         = "";  /* 사번     */
     char    korname[13]      = "";  /* 성명     */
     double  yearly_cnt       = 0;   /* 연차사용가능일수  */
     double  longwork_cnt     = 0;   /*   */
     double  limit_cnt        = 0;   /* 제한일수  */
     double  yearlyplan_cnt   = 0;   /* 연차사용목표  */
     char    notice_yn[2]     = "";  /* 고지완료여부  */
     char    noticeempno[5]   = "";  /* 고지완료등록사번  */
     char    noticetime[15]   = "";  /* 고지완료일   */
     char    assign_yn[2]     = "";  /* 사용시기지정완료여부  */
     char    assignempno[5]   = "";  /* 사용시기지정완료등록사번  */
     char    assigntime[15]   = "";  /* 사용시기지정완료일   */
     char    mod_yn[2]        = "";  /* 목표조정대상여부  */
     char    close_yn[2]      = "";  /* 닫기확인여부  */
     char    closeempno[5]    = "";  /* 닫기확인등록사번  */
     char    closetime[15]    = "";  /* 닫기확인일   */
     double  tot_yearly_cnt   = 0;   /* 연차발생일수  */
     double  pre_used_cnt     = 0;   /* 전년도사용일수  */
     double  next_yearly_cnt  = 0;   /* 익년도선사용일수  */
     
     char    empdate[9]       = "";   /* 최초입사일 */
     char    rundate[9]       = "";   /* 실행년월일 */

     typedef struct PKYEARLT
     {
          char    yearly_yy[5];
          char    empno[5];
          int     tot_yearly_cnt;
     };

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


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
char  logfile[40];
char  logfile_fullname[140];
char  mm[3] = "";
int   id;

/***** Log Filspeciale Pointer *****/
FILE *fp;

struct PKYEARLT pkyearlt1;
struct PKYEARLT pkyearlt2;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = "";
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0;

void main(int argc,char *argv[])
{
     int  flag;
     char FL_file[255];
     char  curdatetime[20+1]="";

     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pka4050g");

     hinsa_get_filename(1, FL_file);
     /*if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }*/

     /* Dsa2000  2004.02.24.  **********************************/
     hinsa_log_print(0,"1년 미만 입사자 연차 생성 시작...[pka4050g]");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/

     /* EXEC SQL
     SELECT  to_char(sysdate, 'YYYYMMDD')
       INTO  :rundate
       FROM  DUAL ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)rundate;
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


          
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_rundate,  rundate);
     strcpy(log_progid,   "pka4050g");
     strcpy(log_writeman, "CRON");

     /* EXEC SQL DECLARE log_db DATABASE; */ 

     hinsa_log_db_connect();
     /*========================================================*/

     /* EXEC SQL LOCK TABLE PKYEARLT
       IN   EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKYEARLT IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )24;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /*printf("rundate=%s \n", rundate);
     sprintf(log_buff, "rundate=%s \n",rundate);
     Write_batlog(seqno++, log_buff);*/
     
     CreateLog();


     /* 1년 미만 입사자 연차 생성 */
     flag = process_records();
     
     printf("\n 1년 미만 입사자 연차 생성 ====================\n");
     sprintf(log_buff, "\n 1년 미만 입사자 연차 생성 ====================\n"); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);
     
     /* 재직자중 1년 이상 입사자 연차 사용 관리 */
     flag = process_records_over();
     
     printf("\n 재직자중 1년 이상 입사자 연차 사용 관리 =====\n=");
     sprintf(log_buff, "\n 재직자중 1년 이상 입사자 연차 사용 관리 ======\n"); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

     /*** 종료시간 Print dsa2000 Add ***************************/
     /* EXEC SQL  
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO :curdatetime
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )39;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdatetime;
     sqlstm.sqhstl[0] = (unsigned long )21;
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


     
     sprintf(log_buff, "종료시간 : %.14s \n ",curdatetime);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); 
     /*********************************************************/

     if  (flag != SUCCESS)
     {
          sprintf(log_buff,"작업이 실패했습니다.\n");
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업이 실패했습니다.\n");
     }
     else
     {
          sprintf(log_buff,"작업이 성공적으로 완료되었습니다.\n");
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK 작업이 성공적으로 완료되었습니다.\n");
     }
     
     fclose(fp);
}


/*****************************************************************************
  대상자료를 추출하는 함수.== 재직자중 1년 미만 입사자 
 *****************************************************************************/
process_records()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          int  mon = 0;
     /* EXEC SQL END   DECLARE SECTION; */ 


     /* 대상자 조회 */
     /* EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT NVL(EMPNO,' '), NVL(TRIM(KORNAME),' '), NVL(GROUPEMPDATE,EMPDATE)
       FROM PIMPMAS
      WHERE PSTATE < '80'
        AND EMPCODE <> '75' // 그룹 전적
        //AND :rundate BETWEEN EMPDATE AND to_char(to_date(EMPDATE,'YYYYMMDD') + 365,'YYYYMMDD')
        AND :rundate BETWEEN NVL(GROUPEMPDATE,EMPDATE) AND to_char(to_date(NVL(GROUPEMPDATE,EMPDATE),'YYYYMMDD') + 364,'YYYYMMDD') // 1년 미만
        //AND EMPNO NOT LIKE 'P%'
        AND EMPNO NOT LIKE 'M%'
        AND EMPNO NOT LIKE 'I%'
      ORDER BY EMPNO; */ 


     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0004;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )58;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)rundate;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, cursor1 Open Error\n",  sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, cursor1 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 1;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )77;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     

     while(1)
     {
          /* EXEC SQL FETCH cursor1
             INTO :empno, :korname, :empdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )92;
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
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             
          if (sqlca.sqlcode == 1403) {
              /* EXEC SQL CLOSE cursor1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 3;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )119;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              return(SUCCESS);
          }
          mon = 0;

          /* 개월수 체크 */
          /* EXEC SQL
          SELECT to_number(trunc(months_between(to_date(:rundate,'YYYYMMDD'),to_date(:empdate,'YYYYMMDD')))) mon
            INTO :mon
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_number(trunc(months_between(to_date(:b0,\
'YYYYMMDD'),to_date(:b1,'YYYYMMDD')))) mon into :b2  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )134;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)rundate;
          sqlstm.sqhstl[0] = (unsigned long )9;
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
          sqlstm.sqhstv[2] = (unsigned char  *)&mon;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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



          if (mon >= 1)
          {
               /* 근태 체크 */
               check_duty(empno, mon);
               
               /* PKYEARLT 테이블 반영 */
               update_pkyearlt();
               
          }

     }
     
     return(SUCCESS);
}

/* 근태 체크 */
void check_duty(char* p_empno, int mon)
{
     int  i         = 0;
     char giveyn[2] = ""; /* 해당월 Y : 연차생성, N : 연차미생성 */
     char t_yy[5]   = ""; /* 입사년도 */
     char t_yy2[5]  = ""; /* 입사년도 다음년 */
     char w_yy[5]   = ""; /* 현재년도 */
     char flag[2]   = ""; /* C:입사년도, N:다음년도 */
     
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

         char wkdate[9] = "";
         char frdate[9] = "";
         char todate[9] = "";
         char col[30]   = "";
         char duty[3]   = "";
         char tmp[3]    = "";
     /* EXEC SQL END   DECLARE SECTION; */ 


     /* EXEC SQL
     SELECT substr(EMPDATE,1,4)
       INTO :t_yy
       FROM PIMPMAS
      WHERE EMPNO = :p_empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select substr(EMPDATE,1,4) into :b0  from PIMPMAS where\
 EMPNO=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )161;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_yy;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)p_empno;
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


     
     strcpy(pkyearlt1.yearly_yy, t_yy);
     pkyearlt1.tot_yearly_cnt = 0;
     pkyearlt2.tot_yearly_cnt = 0;
     strcpy(flag, "C");

     
     for(i = 1;i <= mon;i++)
     {
          /* EXEC SQL
          SELECT to_char(add_months(to_date(EMPDATE,'YYYYMMDD'), (:i-1)),'YYYYMMDD')
                ,to_char(add_months(to_date(EMPDATE,'YYYYMMDD'), :i),'YYYYMMDD')
            INTO :frdate, :todate
            FROM PIMPMAS
           WHERE EMPNO = :p_empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_char(add_months(to_date(EMPDATE,'YYYYMMD\
D'),(:b0-1)),'YYYYMMDD') ,to_char(add_months(to_date(EMPDATE,'YYYYMMDD'),:b0)\
,'YYYYMMDD') into :b2,:b3  from PIMPMAS where EMPNO=:b4";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )184;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&i;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)frdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)todate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)p_empno;
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


          
          strcpy(wkdate, frdate);
          
          strcpy(giveyn, "Y");
          //giveyn = "Y";
          
          while(1)
          {
               /* EXEC SQL
               SELECT 'DD'||to_char(to_number(substr(:wkdate,7,2)))
                 INTO :col
                 FROM DUAL; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select ('DD'||to_char(to_number(substr(:b0,7,\
2)))) into :b1  from DUAL ";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )219;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)wkdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)col;
               sqlstm.sqhstl[1] = (unsigned long )30;
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


               
               trail_spaces(col);
          
               /* 해당일자 근태 조회 */
               /* EXEC SQL
               SELECT 
                      CASE 
                           WHEN (:col = 'DD1' ) THEN DD1
                           WHEN (:col = 'DD2' ) THEN DD2
                           WHEN (:col = 'DD3' ) THEN DD3
                           WHEN (:col = 'DD4' ) THEN DD4
                           WHEN (:col = 'DD5' ) THEN DD5
                           WHEN (:col = 'DD6' ) THEN DD6
                           WHEN (:col = 'DD7' ) THEN DD7
                           WHEN (:col = 'DD8' ) THEN DD8
                           WHEN (:col = 'DD9' ) THEN DD9
                           WHEN (:col = 'DD10') THEN DD10
                           WHEN (:col = 'DD11') THEN DD11
                           WHEN (:col = 'DD12') THEN DD12
                           WHEN (:col = 'DD13') THEN DD13
                           WHEN (:col = 'DD14') THEN DD14
                           WHEN (:col = 'DD15') THEN DD15
                           WHEN (:col = 'DD16') THEN DD16
                           WHEN (:col = 'DD17') THEN DD17
                           WHEN (:col = 'DD18') THEN DD18
                           WHEN (:col = 'DD19') THEN DD19
                           WHEN (:col = 'DD20') THEN DD20
                           WHEN (:col = 'DD21') THEN DD21
                           WHEN (:col = 'DD22') THEN DD22
                           WHEN (:col = 'DD23') THEN DD23
                           WHEN (:col = 'DD24') THEN DD24
                           WHEN (:col = 'DD25') THEN DD25
                           WHEN (:col = 'DD26') THEN DD26
                           WHEN (:col = 'DD27') THEN DD27
                           WHEN (:col = 'DD28') THEN DD28
                           WHEN (:col = 'DD29') THEN DD29
                           WHEN (:col = 'DD30') THEN DD30
                           WHEN (:col = 'DD31') THEN DD31
                       END
                 INTO :duty
                 FROM PKHDUTY
                WHERE EMPNO = :p_empno
                  AND DUYYMM = substr(:wkdate,1,6); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 34;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select  case  when :b0='DD1' then DD1 when :b\
0='DD2' then DD2 when :b0='DD3' then DD3 when :b0='DD4' then DD4 when :b0='DD\
5' then DD5 when :b0='DD6' then DD6 when :b0='DD7' then DD7 when :b0='DD8' th\
en DD8 when :b0='DD9' then DD9 when :b0='DD10' then DD10 when :b0='DD11' then\
 DD11 when :b0='DD12' then DD12 when :b0='DD13' then DD13 when :b0='DD14' the\
n DD14 when :b0='DD15' then DD15 when :b0='DD16' then DD16 when :b0='DD17' th\
en DD17 when :b0='DD18' then DD18 when :b0='DD19' then DD19 when :b0='DD20' t\
hen DD20 when :b0='DD21' then DD21 when :b0='DD22' then DD22 when :b0='DD23' \
then DD23 when :b0='DD24' then DD24 when :b0='DD25' then DD25 when :b0='DD26'\
 then DD26 when :b0='DD27' then DD27 when :b0='DD28' then DD28 when :b0='DD29\
' then DD29 when :b0='DD30' then DD30 when :b0='DD31' then DD31 end  into :b3\
1  from PKHDUTY where (EMPNO=:b32 and DUYYMM=substr(:b33,1,6))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )242;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)col;
               sqlstm.sqhstl[0] = (unsigned long )30;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)col;
               sqlstm.sqhstl[1] = (unsigned long )30;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)col;
               sqlstm.sqhstl[2] = (unsigned long )30;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)col;
               sqlstm.sqhstl[3] = (unsigned long )30;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)col;
               sqlstm.sqhstl[4] = (unsigned long )30;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)col;
               sqlstm.sqhstl[5] = (unsigned long )30;
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)col;
               sqlstm.sqhstl[6] = (unsigned long )30;
               sqlstm.sqhsts[6] = (         int  )0;
               sqlstm.sqindv[6] = (         short *)0;
               sqlstm.sqinds[6] = (         int  )0;
               sqlstm.sqharm[6] = (unsigned long )0;
               sqlstm.sqadto[6] = (unsigned short )0;
               sqlstm.sqtdso[6] = (unsigned short )0;
               sqlstm.sqhstv[7] = (unsigned char  *)col;
               sqlstm.sqhstl[7] = (unsigned long )30;
               sqlstm.sqhsts[7] = (         int  )0;
               sqlstm.sqindv[7] = (         short *)0;
               sqlstm.sqinds[7] = (         int  )0;
               sqlstm.sqharm[7] = (unsigned long )0;
               sqlstm.sqadto[7] = (unsigned short )0;
               sqlstm.sqtdso[7] = (unsigned short )0;
               sqlstm.sqhstv[8] = (unsigned char  *)col;
               sqlstm.sqhstl[8] = (unsigned long )30;
               sqlstm.sqhsts[8] = (         int  )0;
               sqlstm.sqindv[8] = (         short *)0;
               sqlstm.sqinds[8] = (         int  )0;
               sqlstm.sqharm[8] = (unsigned long )0;
               sqlstm.sqadto[8] = (unsigned short )0;
               sqlstm.sqtdso[8] = (unsigned short )0;
               sqlstm.sqhstv[9] = (unsigned char  *)col;
               sqlstm.sqhstl[9] = (unsigned long )30;
               sqlstm.sqhsts[9] = (         int  )0;
               sqlstm.sqindv[9] = (         short *)0;
               sqlstm.sqinds[9] = (         int  )0;
               sqlstm.sqharm[9] = (unsigned long )0;
               sqlstm.sqadto[9] = (unsigned short )0;
               sqlstm.sqtdso[9] = (unsigned short )0;
               sqlstm.sqhstv[10] = (unsigned char  *)col;
               sqlstm.sqhstl[10] = (unsigned long )30;
               sqlstm.sqhsts[10] = (         int  )0;
               sqlstm.sqindv[10] = (         short *)0;
               sqlstm.sqinds[10] = (         int  )0;
               sqlstm.sqharm[10] = (unsigned long )0;
               sqlstm.sqadto[10] = (unsigned short )0;
               sqlstm.sqtdso[10] = (unsigned short )0;
               sqlstm.sqhstv[11] = (unsigned char  *)col;
               sqlstm.sqhstl[11] = (unsigned long )30;
               sqlstm.sqhsts[11] = (         int  )0;
               sqlstm.sqindv[11] = (         short *)0;
               sqlstm.sqinds[11] = (         int  )0;
               sqlstm.sqharm[11] = (unsigned long )0;
               sqlstm.sqadto[11] = (unsigned short )0;
               sqlstm.sqtdso[11] = (unsigned short )0;
               sqlstm.sqhstv[12] = (unsigned char  *)col;
               sqlstm.sqhstl[12] = (unsigned long )30;
               sqlstm.sqhsts[12] = (         int  )0;
               sqlstm.sqindv[12] = (         short *)0;
               sqlstm.sqinds[12] = (         int  )0;
               sqlstm.sqharm[12] = (unsigned long )0;
               sqlstm.sqadto[12] = (unsigned short )0;
               sqlstm.sqtdso[12] = (unsigned short )0;
               sqlstm.sqhstv[13] = (unsigned char  *)col;
               sqlstm.sqhstl[13] = (unsigned long )30;
               sqlstm.sqhsts[13] = (         int  )0;
               sqlstm.sqindv[13] = (         short *)0;
               sqlstm.sqinds[13] = (         int  )0;
               sqlstm.sqharm[13] = (unsigned long )0;
               sqlstm.sqadto[13] = (unsigned short )0;
               sqlstm.sqtdso[13] = (unsigned short )0;
               sqlstm.sqhstv[14] = (unsigned char  *)col;
               sqlstm.sqhstl[14] = (unsigned long )30;
               sqlstm.sqhsts[14] = (         int  )0;
               sqlstm.sqindv[14] = (         short *)0;
               sqlstm.sqinds[14] = (         int  )0;
               sqlstm.sqharm[14] = (unsigned long )0;
               sqlstm.sqadto[14] = (unsigned short )0;
               sqlstm.sqtdso[14] = (unsigned short )0;
               sqlstm.sqhstv[15] = (unsigned char  *)col;
               sqlstm.sqhstl[15] = (unsigned long )30;
               sqlstm.sqhsts[15] = (         int  )0;
               sqlstm.sqindv[15] = (         short *)0;
               sqlstm.sqinds[15] = (         int  )0;
               sqlstm.sqharm[15] = (unsigned long )0;
               sqlstm.sqadto[15] = (unsigned short )0;
               sqlstm.sqtdso[15] = (unsigned short )0;
               sqlstm.sqhstv[16] = (unsigned char  *)col;
               sqlstm.sqhstl[16] = (unsigned long )30;
               sqlstm.sqhsts[16] = (         int  )0;
               sqlstm.sqindv[16] = (         short *)0;
               sqlstm.sqinds[16] = (         int  )0;
               sqlstm.sqharm[16] = (unsigned long )0;
               sqlstm.sqadto[16] = (unsigned short )0;
               sqlstm.sqtdso[16] = (unsigned short )0;
               sqlstm.sqhstv[17] = (unsigned char  *)col;
               sqlstm.sqhstl[17] = (unsigned long )30;
               sqlstm.sqhsts[17] = (         int  )0;
               sqlstm.sqindv[17] = (         short *)0;
               sqlstm.sqinds[17] = (         int  )0;
               sqlstm.sqharm[17] = (unsigned long )0;
               sqlstm.sqadto[17] = (unsigned short )0;
               sqlstm.sqtdso[17] = (unsigned short )0;
               sqlstm.sqhstv[18] = (unsigned char  *)col;
               sqlstm.sqhstl[18] = (unsigned long )30;
               sqlstm.sqhsts[18] = (         int  )0;
               sqlstm.sqindv[18] = (         short *)0;
               sqlstm.sqinds[18] = (         int  )0;
               sqlstm.sqharm[18] = (unsigned long )0;
               sqlstm.sqadto[18] = (unsigned short )0;
               sqlstm.sqtdso[18] = (unsigned short )0;
               sqlstm.sqhstv[19] = (unsigned char  *)col;
               sqlstm.sqhstl[19] = (unsigned long )30;
               sqlstm.sqhsts[19] = (         int  )0;
               sqlstm.sqindv[19] = (         short *)0;
               sqlstm.sqinds[19] = (         int  )0;
               sqlstm.sqharm[19] = (unsigned long )0;
               sqlstm.sqadto[19] = (unsigned short )0;
               sqlstm.sqtdso[19] = (unsigned short )0;
               sqlstm.sqhstv[20] = (unsigned char  *)col;
               sqlstm.sqhstl[20] = (unsigned long )30;
               sqlstm.sqhsts[20] = (         int  )0;
               sqlstm.sqindv[20] = (         short *)0;
               sqlstm.sqinds[20] = (         int  )0;
               sqlstm.sqharm[20] = (unsigned long )0;
               sqlstm.sqadto[20] = (unsigned short )0;
               sqlstm.sqtdso[20] = (unsigned short )0;
               sqlstm.sqhstv[21] = (unsigned char  *)col;
               sqlstm.sqhstl[21] = (unsigned long )30;
               sqlstm.sqhsts[21] = (         int  )0;
               sqlstm.sqindv[21] = (         short *)0;
               sqlstm.sqinds[21] = (         int  )0;
               sqlstm.sqharm[21] = (unsigned long )0;
               sqlstm.sqadto[21] = (unsigned short )0;
               sqlstm.sqtdso[21] = (unsigned short )0;
               sqlstm.sqhstv[22] = (unsigned char  *)col;
               sqlstm.sqhstl[22] = (unsigned long )30;
               sqlstm.sqhsts[22] = (         int  )0;
               sqlstm.sqindv[22] = (         short *)0;
               sqlstm.sqinds[22] = (         int  )0;
               sqlstm.sqharm[22] = (unsigned long )0;
               sqlstm.sqadto[22] = (unsigned short )0;
               sqlstm.sqtdso[22] = (unsigned short )0;
               sqlstm.sqhstv[23] = (unsigned char  *)col;
               sqlstm.sqhstl[23] = (unsigned long )30;
               sqlstm.sqhsts[23] = (         int  )0;
               sqlstm.sqindv[23] = (         short *)0;
               sqlstm.sqinds[23] = (         int  )0;
               sqlstm.sqharm[23] = (unsigned long )0;
               sqlstm.sqadto[23] = (unsigned short )0;
               sqlstm.sqtdso[23] = (unsigned short )0;
               sqlstm.sqhstv[24] = (unsigned char  *)col;
               sqlstm.sqhstl[24] = (unsigned long )30;
               sqlstm.sqhsts[24] = (         int  )0;
               sqlstm.sqindv[24] = (         short *)0;
               sqlstm.sqinds[24] = (         int  )0;
               sqlstm.sqharm[24] = (unsigned long )0;
               sqlstm.sqadto[24] = (unsigned short )0;
               sqlstm.sqtdso[24] = (unsigned short )0;
               sqlstm.sqhstv[25] = (unsigned char  *)col;
               sqlstm.sqhstl[25] = (unsigned long )30;
               sqlstm.sqhsts[25] = (         int  )0;
               sqlstm.sqindv[25] = (         short *)0;
               sqlstm.sqinds[25] = (         int  )0;
               sqlstm.sqharm[25] = (unsigned long )0;
               sqlstm.sqadto[25] = (unsigned short )0;
               sqlstm.sqtdso[25] = (unsigned short )0;
               sqlstm.sqhstv[26] = (unsigned char  *)col;
               sqlstm.sqhstl[26] = (unsigned long )30;
               sqlstm.sqhsts[26] = (         int  )0;
               sqlstm.sqindv[26] = (         short *)0;
               sqlstm.sqinds[26] = (         int  )0;
               sqlstm.sqharm[26] = (unsigned long )0;
               sqlstm.sqadto[26] = (unsigned short )0;
               sqlstm.sqtdso[26] = (unsigned short )0;
               sqlstm.sqhstv[27] = (unsigned char  *)col;
               sqlstm.sqhstl[27] = (unsigned long )30;
               sqlstm.sqhsts[27] = (         int  )0;
               sqlstm.sqindv[27] = (         short *)0;
               sqlstm.sqinds[27] = (         int  )0;
               sqlstm.sqharm[27] = (unsigned long )0;
               sqlstm.sqadto[27] = (unsigned short )0;
               sqlstm.sqtdso[27] = (unsigned short )0;
               sqlstm.sqhstv[28] = (unsigned char  *)col;
               sqlstm.sqhstl[28] = (unsigned long )30;
               sqlstm.sqhsts[28] = (         int  )0;
               sqlstm.sqindv[28] = (         short *)0;
               sqlstm.sqinds[28] = (         int  )0;
               sqlstm.sqharm[28] = (unsigned long )0;
               sqlstm.sqadto[28] = (unsigned short )0;
               sqlstm.sqtdso[28] = (unsigned short )0;
               sqlstm.sqhstv[29] = (unsigned char  *)col;
               sqlstm.sqhstl[29] = (unsigned long )30;
               sqlstm.sqhsts[29] = (         int  )0;
               sqlstm.sqindv[29] = (         short *)0;
               sqlstm.sqinds[29] = (         int  )0;
               sqlstm.sqharm[29] = (unsigned long )0;
               sqlstm.sqadto[29] = (unsigned short )0;
               sqlstm.sqtdso[29] = (unsigned short )0;
               sqlstm.sqhstv[30] = (unsigned char  *)col;
               sqlstm.sqhstl[30] = (unsigned long )30;
               sqlstm.sqhsts[30] = (         int  )0;
               sqlstm.sqindv[30] = (         short *)0;
               sqlstm.sqinds[30] = (         int  )0;
               sqlstm.sqharm[30] = (unsigned long )0;
               sqlstm.sqadto[30] = (unsigned short )0;
               sqlstm.sqtdso[30] = (unsigned short )0;
               sqlstm.sqhstv[31] = (unsigned char  *)duty;
               sqlstm.sqhstl[31] = (unsigned long )3;
               sqlstm.sqhsts[31] = (         int  )0;
               sqlstm.sqindv[31] = (         short *)0;
               sqlstm.sqinds[31] = (         int  )0;
               sqlstm.sqharm[31] = (unsigned long )0;
               sqlstm.sqadto[31] = (unsigned short )0;
               sqlstm.sqtdso[31] = (unsigned short )0;
               sqlstm.sqhstv[32] = (unsigned char  *)p_empno;
               sqlstm.sqhstl[32] = (unsigned long )0;
               sqlstm.sqhsts[32] = (         int  )0;
               sqlstm.sqindv[32] = (         short *)0;
               sqlstm.sqinds[32] = (         int  )0;
               sqlstm.sqharm[32] = (unsigned long )0;
               sqlstm.sqadto[32] = (unsigned short )0;
               sqlstm.sqtdso[32] = (unsigned short )0;
               sqlstm.sqhstv[33] = (unsigned char  *)wkdate;
               sqlstm.sqhstl[33] = (unsigned long )9;
               sqlstm.sqhsts[33] = (         int  )0;
               sqlstm.sqindv[33] = (         short *)0;
               sqlstm.sqinds[33] = (         int  )0;
               sqlstm.sqharm[33] = (unsigned long )0;
               sqlstm.sqadto[33] = (unsigned short )0;
               sqlstm.sqtdso[33] = (unsigned short )0;
               sqlstm.sqphsv = sqlstm.sqhstv;
               sqlstm.sqphsl = sqlstm.sqhstl;
               sqlstm.sqphss = sqlstm.sqhsts;
               sqlstm.sqpind = sqlstm.sqindv;
               sqlstm.sqpins = sqlstm.sqinds;
               sqlstm.sqparm = sqlstm.sqharm;
               sqlstm.sqparc = sqlstm.sqharc;
               sqlstm.sqpadto = sqlstm.sqadto;
               sqlstm.sqptdso = sqlstm.sqtdso;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               
                    /*printf("empno=%s, mon=%d, duty=%s, DD=%s \n", empno, i, duty, col);
                    sprintf(log_buff, "empno=%s, mon=%d, duty=%s, DD=%s \n", empno, i, duty, col); 
                    Write_batlog(seqno++, log_buff);*/
                    
               /* 연차생성 제외대상 근태 */
               if (
                   (strcmp(duty,"71") == 0) ||  /* 병가       */
                   (strcmp(duty,"72") == 0) ||  /* 결근       */
                   (strcmp(duty,"73") == 0) ||  /* 무단결근   */
                   (strcmp(duty,"82") == 0) ||  /* 병상       */
                   (strcmp(duty,"85") == 0) ||  /* 기소       */
                   (strcmp(duty,"88") == 0) ||  /* 병상(난임) */
                   (strcmp(duty,"89") == 0) ||  /* 기타       */
                   (strcmp(duty,"91") == 0)     /* 정직       */
                  )
               {
                    strcpy(giveyn, "N");
                    
               }
               /* EXEC SQL
               SELECT to_char(to_date(:wkdate,'YYYYMMDD') + 1,'YYYYMMDD')
                 INTO :wkdate
                 FROM DUAL; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 34;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select to_char((to_date(:b0,'YYYYMMDD')+1),'Y\
YYYMMDD') into :b0  from DUAL ";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )393;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)wkdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)wkdate;
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



               /*hinsa_exit(0," 개발자 종료. !!!\n");*/
               if (strcmp(wkdate, todate) == 0)
               {
                   /*printf("break! mon=%d \n",i);
                   sprintf(log_buff, "break! mon=%d \n",i); 
                   Write_batlog(seqno++, log_buff);*/
                   break;
               }
          }
          
          
          /* EXEC SQL
          SELECT substr(:wkdate,1,4)
            INTO :w_yy
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select substr(:b0,1,4) into :b1  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )416;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)wkdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)w_yy;
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


          
          if ((strcmp(pkyearlt1.yearly_yy, w_yy) != 0) && (strcmp(flag,"C") == 0))
          {
                strcpy(pkyearlt2.yearly_yy, w_yy);
                //pkyearlt2.yearly_yy = t_yy;
                pkyearlt2.tot_yearly_cnt = 0;
                strcpy(t_yy2, w_yy);
                //t_yy2 = t_yy;
                strcpy(flag, "N");
          }
          
          if (strcmp(giveyn,"Y") == 0)
          {

               if (strcmp(pkyearlt1.yearly_yy, w_yy) == 0)
               {
                    pkyearlt1.tot_yearly_cnt = pkyearlt1.tot_yearly_cnt + 1;

               }
               else
               {
                    pkyearlt2.tot_yearly_cnt = pkyearlt2.tot_yearly_cnt + 1;
               }

          }
          
          
          /* PKNWYRDET 테이블 반영 */
          update_pknwyrdet(giveyn, i);
     } 

}


/*****************************************************************************
  PKYEARLT 테이블 반영 함수.
 *****************************************************************************/
update_pkyearlt()
{
     int    count = 0;
     char   tmp_yearly_yy[5];
     int    tmp_yearly_cnt;
     double use_year_cnt;
     
     /* 입사년도 */
     strcpy(tmp_yearly_yy, pkyearlt1.yearly_yy);
     tmp_yearly_cnt = pkyearlt1.tot_yearly_cnt;
     
     /* EXEC SQL
     SELECT count(*)
       INTO :count
       FROM PKYEARLT
      WHERE YEARLY_YY = :tmp_yearly_yy
        AND EMPNO = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKYEARLT where (YEARLY_\
YY=:b1 and EMPNO=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )439;
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
     sqlstm.sqhstv[1] = (unsigned char  *)tmp_yearly_yy;
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
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
     sqlstm.sqphss = sqlstm.sqhsts;
     sqlstm.sqpind = sqlstm.sqindv;
     sqlstm.sqpins = sqlstm.sqinds;
     sqlstm.sqparm = sqlstm.sqharm;
     sqlstm.sqparc = sqlstm.sqharc;
     sqlstm.sqpadto = sqlstm.sqadto;
     sqlstm.sqptdso = sqlstm.sqtdso;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* 입사년도 연차 사용 일수 */
     /* EXEC SQL
     SELECT HPER.PAYUTIL.GET_DUTY_CNT(:empno,to_char(to_date(:empdate,'YYYYMMDD'),'YYYYMMDD'),to_char(to_date(:empdate,'YYYYMMDD'),'YYYY')||'1231','1')
       INTO :use_year_cnt
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select HPER.PAYUTIL.GET_DUTY_CNT(:b0,to_char(to_date(:b\
1,'YYYYMMDD'),'YYYYMMDD'),(to_char(to_date(:b1,'YYYYMMDD'),'YYYY')||'1231'),'\
1') into :b3  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )466;
     sqlstm.selerr = (unsigned short)0;
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
     sqlstm.sqhstv[1] = (unsigned char  *)empdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
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
     sqlstm.sqhstv[3] = (unsigned char  *)&use_year_cnt;
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


         
     
     /* pkyearlt1 */
     /* 없으면 생성 */
     if (count == 0)
     {
          /* EXEC SQL
          INSERT INTO PKYEARLT
          VALUES (
                  :tmp_yearly_yy
                 ,:empno
                 ,:korname
                 ,NVL(:tmp_yearly_cnt,0)/o,NVL(:tmp_yearly_cnt-:use_year_cnt,0)o/
                 ,'CRON'
                 ,NVL(:rundate,'')
                 ,NULL
                 ,NULL
                 ,10
                 ,NULL
                 ,NULL
                 ,NULL
                 ,NULL
                 ,NULL
                 ,NULL
                 ,NULL
                 ,'N'
                 ,NULL
                 ,NULL
                 ,NVL(:tmp_yearly_cnt,0)
                 ,0
                 ,0
                 ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into PKYEARLT  values (:b0,:b1,:b2,NVL(:b3,\
0),'CRON',NVL(:b4,''),null ,null ,10,null ,null ,null ,null ,null ,null ,null\
 ,'N',null ,null ,NVL(:b3,0),0,0)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )497;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tmp_yearly_yy;
          sqlstm.sqhstl[0] = (unsigned long )5;
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
          sqlstm.sqhstv[2] = (unsigned char  *)korname;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&tmp_yearly_cnt;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)rundate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&tmp_yearly_cnt;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
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
               printf("ERROR_CODE : %d, PKYEARLT INSERT ERROR\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, PKYEARLT INSERT ERROR\n", sqlca.sqlcode); 
               WriteLog(log_buff);
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
     }
     else
     {
          /* EXEC SQL
          UPDATE PKYEARLT
             SET 
                 YEARLY_CNT      = NVL(:tmp_yearly_cnt,0)/oNVL(:tmp_yearly_cnt-:use_year_cnt,0)o/
                ,WRITEID         = 'CRON'
                ,WRITETIME       = NVL(:rundate,'')
                ,TOT_YEARLY_CNT  = NVL(:tmp_yearly_cnt,0)
          WHERE  EMPNO = :empno
            AND  YEARLY_YY       = :tmp_yearly_yy; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKYEARLT  set YEARLY_CNT=NVL(:b0,0),WRITEID\
='CRON',WRITETIME=NVL(:b1,''),TOT_YEARLY_CNT=NVL(:b0,0) where (EMPNO=:b3 and \
YEARLY_YY=:b4)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )536;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&tmp_yearly_cnt;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)rundate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&tmp_yearly_cnt;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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
          sqlstm.sqhstv[4] = (unsigned char  *)tmp_yearly_yy;
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
               printf("ERROR_CODE : %d, PKYEARLT UPDATE ERROR\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, PKYEARLT UPDATE ERROR\n", sqlca.sqlcode); 
               WriteLog(log_buff);
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
     }
     
     
     /* 다음년도 - 전년도 남은 연차 이월 */
     if (strcmp(pkyearlt1.yearly_yy, pkyearlt2.yearly_yy) != 0)
     {
          strcpy(tmp_yearly_yy, pkyearlt2.yearly_yy);
          tmp_yearly_cnt = pkyearlt1.tot_yearly_cnt + pkyearlt2.tot_yearly_cnt;
          
          /* EXEC SQL
          SELECT count(*)
            INTO :count
            FROM PKYEARLT
           WHERE YEARLY_YY = :tmp_yearly_yy
             AND EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select count(*)  into :b0  from PKYEARLT where (YE\
ARLY_YY=:b1 and EMPNO=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )571;
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
          sqlstm.sqhstv[1] = (unsigned char  *)tmp_yearly_yy;
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
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          
          /* 다음년도 연차 사용 일수 */
          /* EXEC SQL
          SELECT PAYUTIL.GET_DUTY_CNT(:empno,to_char(to_date(:empdate,'YYYYMMDD'),'YYYYMMDD'),to_char(to_date(:empdate,'YYYYMMDD') + 365,'YYYY')||'1231','1')
            INTO :use_year_cnt
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select PAYUTIL.GET_DUTY_CNT(:b0,to_char(to_date(:b\
1,'YYYYMMDD'),'YYYYMMDD'),(to_char((to_date(:b1,'YYYYMMDD')+365),'YYYY')||'12\
31'),'1') into :b3  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )598;
          sqlstm.selerr = (unsigned short)0;
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
          sqlstm.sqhstv[1] = (unsigned char  *)empdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
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
          sqlstm.sqhstv[3] = (unsigned char  *)&use_year_cnt;
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


            
          /* pkyearlt2 */
          /* 없으면 생성 */
          if (count == 0)
          {
               /* EXEC SQL
               INSERT INTO PKYEARLT
               VALUES (
                       :tmp_yearly_yy
                      ,:empno
                      ,:korname
                      ,NVL(:tmp_yearly_cnt,0)/o,NVL(:tmp_yearly_cnt-:use_year_cnt,0)o/
                      ,'CRON'
                      ,NVL(:rundate,'')
                      ,NULL
                      ,NULL
                      ,10
                      ,NULL
                      ,NULL
                      ,NULL
                      ,NULL
                      ,NULL
                      ,NULL
                      ,NULL
                      ,'N'
                      ,NULL
                      ,NULL
                      ,NVL(:tmp_yearly_cnt,0)
                      ,0
                      ,0
                      ); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 34;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "insert into PKYEARLT  values (:b0,:b1,:b2,NVL\
(:b3,0),'CRON',NVL(:b4,''),null ,null ,10,null ,null ,null ,null ,null ,null \
,null ,'N',null ,null ,NVL(:b3,0),0,0)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )629;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)tmp_yearly_yy;
               sqlstm.sqhstl[0] = (unsigned long )5;
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
               sqlstm.sqhstv[2] = (unsigned char  *)korname;
               sqlstm.sqhstl[2] = (unsigned long )13;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&tmp_yearly_cnt;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)rundate;
               sqlstm.sqhstl[4] = (unsigned long )9;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&tmp_yearly_cnt;
               sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
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
                    printf("ERROR_CODE : %d, PKYEARLT2 INSERT ERROR\n", sqlca.sqlcode);
                    sprintf(log_buff, "ERROR_CODE : %d, PKYEARLT2 INSERT ERROR\n", sqlca.sqlcode);
                    WriteLog(log_buff);
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
          }
          else
          {
               /* EXEC SQL
               UPDATE PKYEARLT
                  SET 
                      YEARLY_CNT      = NVL(:tmp_yearly_cnt,0)/oNVL(:tmp_yearly_cnt-:use_year_cnt,0)o/
                     ,WRITEID         = 'CRON'
                     ,WRITETIME       = NVL(:rundate,'')
                     ,TOT_YEARLY_CNT  = NVL(:tmp_yearly_cnt,0)
               WHERE  EMPNO = :empno
                 AND  YEARLY_YY       = :tmp_yearly_yy; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 34;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKYEARLT  set YEARLY_CNT=NVL(:b0,0),WR\
ITEID='CRON',WRITETIME=NVL(:b1,''),TOT_YEARLY_CNT=NVL(:b0,0) where (EMPNO=:b3\
 and YEARLY_YY=:b4)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )668;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&tmp_yearly_cnt;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)rundate;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&tmp_yearly_cnt;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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
               sqlstm.sqhstv[4] = (unsigned char  *)tmp_yearly_yy;
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
                    printf("ERROR_CODE : %d, PKYEARLT2 UPDATE ERROR\n", sqlca.sqlcode);
                    sprintf(log_buff, "ERROR_CODE : %d, PKYEARLT2 UPDATE ERROR\n", sqlca.sqlcode); 
                    WriteLog(log_buff);
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
               }
          }
     }
     
     /* EXEC SQL COMMIT ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )703;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if (use_year_cnt > 0)
     {
          use_check_pknwyrdet(use_year_cnt);
     }
}

/*****************************************************************************
  PKNWYRDET 테이블 반영 함수.
 *****************************************************************************/
update_pknwyrdet(char* p_giveyn, int mon)
{
    int  count;
    char accyn[2];
    char accdate[9];
    char useyn[2];

    /* Y = (입사일+mon,'N'), N = (NULL,'X') */
    /* EXEC SQL
    SELECT :p_giveyn
          ,DECODE(:p_giveyn,'Y',to_char(add_months(to_date(:empdate,'YYYYMMDD'), :mon),'YYYYMMDD'),'')
          ,DECODE(:p_giveyn,'Y','N','X')
      INTO :accyn
          ,:accdate
          ,:useyn
      FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 34;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select :b0 ,DECODE(:b0,'Y',to_char(add_months(to_date(:b\
2,'YYYYMMDD'),:b3),'YYYYMMDD'),'') ,DECODE(:b0,'Y','N','X') into :b5,:b6,:b7 \
 from DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )718;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)p_giveyn;
    sqlstm.sqhstl[0] = (unsigned long )0;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)p_giveyn;
    sqlstm.sqhstl[1] = (unsigned long )0;
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
    sqlstm.sqhstv[3] = (unsigned char  *)&mon;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)p_giveyn;
    sqlstm.sqhstl[4] = (unsigned long )0;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)accyn;
    sqlstm.sqhstl[5] = (unsigned long )2;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)accdate;
    sqlstm.sqhstl[6] = (unsigned long )9;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)useyn;
    sqlstm.sqhstl[7] = (unsigned long )2;
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



    /* 존재 여부 확인 */
    /* EXEC SQL
    SELECT count(*)
      INTO :count
      FROM PKNWYRDET
     WHERE EMPNO = :empno
       AND MON   = :mon; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 34;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select count(*)  into :b0  from PKNWYRDET where (EMPNO=:\
b1 and MON=:b2)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )765;
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
    sqlstm.sqhstv[1] = (unsigned char  *)empno;
    sqlstm.sqhstl[1] = (unsigned long )5;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&mon;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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


    
    
     /* 없으면 생성 */
     if (count == 0)
     {
          /*printf("empno=%s, korname=%s, empdate=%s, mon=%d, accyn=%s, accdate=%s, useyn=%s \n", empno, korname, empdate, mon, accyn, accdate, useyn);
          sprintf(log_buff, "empno=%s, korname=%s, empdate=%s, mon=%d, accyn=%s, accdate=%s, useyn=%s \n", empno, korname, empdate, mon, accyn, accdate, useyn); 
          Write_batlog(seqno++, log_buff);*/
          
          /* EXEC SQL
          INSERT INTO PKNWYRDET
          VALUES (
                  :empno
                 ,:korname
                 ,:empdate
                 ,NVL(:mon,0)
                 ,NVL(:accyn,'')
                 ,NVL(:accdate,'')
                 ,NVL(:useyn,'')
                 ,NVL(:rundate,'')
                 ,'CRON'
                 ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into PKNWYRDET  values (:b0,:b1,:b2,NVL(:b3\
,0),NVL(:b4,''),NVL(:b5,''),NVL(:b6,''),NVL(:b7,''),'CRON')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )792;
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
          sqlstm.sqhstv[3] = (unsigned char  *)&mon;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)accyn;
          sqlstm.sqhstl[4] = (unsigned long )2;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)accdate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)useyn;
          sqlstm.sqhstl[6] = (unsigned long )2;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)rundate;
          sqlstm.sqhstl[7] = (unsigned long )9;
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
               printf("ERROR_CODE : %d, PKNWYRDET INSERT ERROR\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, PKNWYRDET INSERT ERROR\n", sqlca.sqlcode); 
               WriteLog(log_buff);
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
     }
     else
     {
          /* EXEC SQL
          UPDATE PKNWYRDET
             SET 
                 ACCYN      = NVL(:accyn,'')
                ,ACCDATE    = NVL(:accdate,'')
                ,USEYN      = NVL(:useyn,'')
                ,WRITEMAN   = 'CRON'
                ,WRITETIME  = NVL(:rundate,'')
          WHERE  EMPNO   = :empno
            AND  EMPDATE = :empdate
            AND  MON     = :mon
          ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKNWYRDET  set ACCYN=NVL(:b0,''),ACCDATE=NV\
L(:b1,''),USEYN=NVL(:b2,''),WRITEMAN='CRON',WRITETIME=NVL(:b3,'') where ((EMP\
NO=:b4 and EMPDATE=:b5) and MON=:b6)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )839;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)accyn;
          sqlstm.sqhstl[0] = (unsigned long )2;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)accdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)useyn;
          sqlstm.sqhstl[2] = (unsigned long )2;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)rundate;
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
          sqlstm.sqhstv[5] = (unsigned char  *)empdate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&mon;
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


          
          if  (sqlca.sqlcode != 0) 
          {
               printf("ERROR_CODE : %d, PKNWYRDET UPDATE ERROR\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, PKNWYRDET UPDATE ERROR\n", sqlca.sqlcode); 
               WriteLog(log_buff);
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
     }
}

/*****************************************************************************
  PKNWYRDET 테이블에 연차 사용 반영 함수.
 *****************************************************************************/
use_check_pknwyrdet(double use_year_cnt)
{
     int i = 0;
     int t = ceil(use_year_cnt);
     
     for (i = 0;i < t;i++)
     {
          /* EXEC SQL
          UPDATE PKNWYRDET
             SET USEYN = 'Y'
           WHERE EMPNO = :empno
             AND ACCYN = 'Y'
             AND USEYN = 'N'
             AND MON   = (SELECT min(MON)
                            FROM PKNWYRDET
                           WHERE EMPNO = :empno
                             AND ACCYN = 'Y'
                             AND USEYN = 'N'); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKNWYRDET  set USEYN='Y' where (((EMPNO=:b0\
 and ACCYN='Y') and USEYN='N') and MON=(select min(MON)  from PKNWYRDET where\
 ((EMPNO=:b0 and ACCYN='Y') and USEYN='N')))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )882;
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


          
          if  ( (sqlca.sqlcode) != 0 && (sqlca.sqlcode != 1403) ) 
          {
               printf("ERROR_CODE : %d, USE_CHECK_PKNWYRDET UPDATE ERROR\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, USE_CHECK_PKNWYRDET UPDATE ERROR\n", sqlca.sqlcode); 
               WriteLog(log_buff);
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
     }
}

/*****************************************************************************
  대상자료를 추출하는 함수.== 재직자중 1년 이상 입사자 연차 사용 관리
 *****************************************************************************/
process_records_over()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          double use_year_cnt;
     /* EXEC SQL END   DECLARE SECTION; */ 


     /* 대상자 조회 */
     /* EXEC SQL DECLARE cursor2 CURSOR FOR
     SELECT EMPNO, EMPDATE
       FROM PKNWYRDET
      WHERE EMPNO NOT IN (
                          SELECT NVL(EMPNO,' ')
                            FROM PIMPMAS
                           WHERE PSTATE < '80'
                             AND EMPCODE <> '75' // 그룹 전적
                             AND :rundate BETWEEN NVL(GROUPEMPDATE,EMPDATE) AND to_char(to_date(NVL(GROUPEMPDATE,EMPDATE),'YYYYMMDD') + 364,'YYYYMMDD') // 1년 미만
                             //AND EMPNO NOT LIKE 'P%'
                             AND EMPNO NOT LIKE 'M%'
                             AND EMPNO NOT LIKE 'I%'
                         )
        AND to_char(SYSDATE, 'YYYY') = to_char(to_date(EMPDATE,'YYYYMMDD') + 365,'YYYY')
      ORDER BY EMPNO; */ 


     /* EXEC SQL OPEN cursor2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0026;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )905;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)rundate;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, cursor2 Open Error\n",  sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, cursor2 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )924;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     

     while(1)
     {
          /* EXEC SQL FETCH cursor2
             INTO :empno, :empdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )939;
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
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
          sqlstm.sqphss = sqlstm.sqhsts;
          sqlstm.sqpind = sqlstm.sqindv;
          sqlstm.sqpins = sqlstm.sqinds;
          sqlstm.sqparm = sqlstm.sqharm;
          sqlstm.sqparc = sqlstm.sqharc;
          sqlstm.sqpadto = sqlstm.sqadto;
          sqlstm.sqptdso = sqlstm.sqtdso;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             
          if (sqlca.sqlcode == 1403) {
              /* EXEC SQL CLOSE cursor2; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 34;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )962;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              return(SUCCESS);
          }
          //mon = 0;

          /* 다음년도 연차 사용 일수 */
          /* EXEC SQL
          SELECT PAYUTIL.GET_DUTY_CNT(:empno,to_char(to_date(:empdate,'YYYYMMDD'),'YYYYMMDD'),to_char(to_date(:empdate,'YYYYMMDD') + 365,'YYYY')||'1231','1')
            INTO :use_year_cnt
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select PAYUTIL.GET_DUTY_CNT(:b0,to_char(to_date(:b\
1,'YYYYMMDD'),'YYYYMMDD'),(to_char((to_date(:b1,'YYYYMMDD')+365),'YYYY')||'12\
31'),'1') into :b3  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )977;
          sqlstm.selerr = (unsigned short)0;
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
          sqlstm.sqhstv[1] = (unsigned char  *)empdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
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
          sqlstm.sqhstv[3] = (unsigned char  *)&use_year_cnt;
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



          if (use_year_cnt > 0)
          {
               use_check_pknwyrdet(use_year_cnt);
          }

     }
     
     return(SUCCESS);
}

/*****************************************************************************
  기준일+M 일을 구하는 함수.
 *****************************************************************************/
void add_days(char* indate,int m, char* rdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char    t_date[8+1]  = "";
          double  t_adddays;
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
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1008;
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
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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

/****************************************************************************
  trail_spaces function.
 ****************************************************************************/
void trail_spaces(char *dest)
{
     int len,i,flag;

     len = strlen(dest);

     i    = 0;
     flag = 0;
     while (i < len)
     {
          if (*(dest+i) == ' ')
          {
               flag = 1;
               break;
          }
          else
            i++;
     }

     if  (flag)
         *(dest+i) = '\0';
     else
         *(dest+len) = '\0';
}
/****************************************************************************
  calc_term function.
 ****************************************************************************/
double  calc_term(char *frdate,char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[9] = "";
          char  t2_date[9] = "";
          double  term;
     /* EXEC SQL END   DECLARE SECTION; */ 


     strncpy(t1_date,frdate,8);
     strncpy(t2_date,todate,8);
     /* EXEC SQL
     SELECT  TO_DATE(:t2_date,'YYYYMMDD') - TO_DATE(:t1_date,'YYYYMMDD')
       INTO  :term
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD')\
) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1035;
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
     sqlstm.sqhstv[2] = (unsigned char  *)&term;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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
          return(FAIL);
     else
          return(term);
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
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1062;
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
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1103;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}

void CreateLog()
{
     char  curdatetime[20+1]="";
     char  *logdir;
     logdir = hinsa_home();
     /*printf("logdir : %s", logdir);*/
     strcat(logdir,"/log/proc/pka4050g/");        

     /* EXEC SQL
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO   :curdatetime
       FROM   DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1124;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdatetime;
     sqlstm.sqhstl[0] = (unsigned long )21;
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



  /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%spka4050g_%.12s.log", logdir, curdatetime);
     /* 로그파일 오픈 */
     fp = fopen(logfile_fullname, "w+");
     
     if  (fp == NULL) 
     {
          printf("로그파일오픈(%s) 에러\n", logfile_fullname);
          exit(1);
     }
     
     sprintf(log_buff, "1년 미만 입사자 연차 생성 cron program [pkg3075g] 을 실행합니다. \n ");
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     sprintf(log_buff, "실행시간 : %.14s \n ",curdatetime);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
}

void WriteLog(char *message)
{
     fprintf(fp, "%s", message);
}