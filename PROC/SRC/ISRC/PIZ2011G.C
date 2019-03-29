
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
    "piz2011g.pc"
};


static unsigned int sqlctx = 155139;


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
   unsigned char  *sqhstv[21];
   unsigned long  sqhstl[21];
            int   sqhsts[21];
            short *sqindv[21];
            int   sqinds[21];
   unsigned long  sqharm[21];
   unsigned long  *sqharc[21];
   unsigned short  sqadto[21];
   unsigned short  sqtdso[21];
} sqlstm = {12,21};

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
"select empno ,korname ,paycl ,payra ,upper(nvl(payrayn,' ')) ,orgnum ,deptc\
ode ,nvl(juminid,'              ') ,empdate ,orgempdate ,nvl(retdate,'       \
 ') ,nvl(paycldate,'99999999') ,nvl(lsetodate,'99999999') ,nvl(edutodate,'999\
99999') ,pstate ,upper(nvl(pstateyn,' ')) ,upper(nvl(nogubun,'  ')) ,jobdept \
,jobplace ,nvl(cardate,'99999999') ,realtrdate  from pihpmas where (workyymm=\
:b0 and (substr(nvl(retdate,'99999999'),1,6)>=to_char(add_months(to_date(work\
yymm,'YYYYMM'),(-5)),'YYYYMM') or substr(writetime,1,6)=workyymm)) order by e\
mpno            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,43,0,1,146,0,0,0,0,0,1,0,
20,0,0,2,145,0,4,155,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
43,0,0,3,57,0,4,169,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
66,0,0,4,53,0,3,184,0,0,1,1,0,1,0,1,97,0,0,
85,0,0,5,109,0,4,308,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
108,0,0,6,553,0,9,345,0,0,1,1,0,1,0,1,97,0,0,
127,0,0,6,0,0,13,352,0,0,21,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
226,0,0,6,0,0,15,362,0,0,0,0,0,1,0,
241,0,0,6,0,0,15,367,0,0,0,0,0,1,0,
256,0,0,7,77,0,4,516,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
283,0,0,8,77,0,4,585,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
310,0,0,9,121,0,4,707,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
333,0,0,10,160,0,4,725,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
356,0,0,11,132,0,4,763,0,0,5,4,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
391,0,0,12,113,0,4,785,0,0,3,2,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,
418,0,0,13,222,0,5,803,0,0,15,15,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,
0,0,
493,0,0,6,0,0,15,830,0,0,0,0,0,1,0,
508,0,0,14,67,0,5,839,0,0,1,1,0,1,0,1,97,0,0,
};


/*******************************************************************************
     PROGRAM-NAME    : piz2011g(인사마스터 이력(pihpmas) 자동경신)
     SYSTEM-NAME     : 종합인사정보
     SUBSYSTEM-NAME  : 인사
     Programmer      : 윤형식
     Version         : 1.00
     Date            : 2001.03.20
     
     Update Contents
      Version date(yy.mm.dd) programmer  relevant doc.no    description
       1.00   2001.03.20     윤형식      전2001-02-13       전월 말일자 기준으로 인사마스터 이력보관
       1.01   2003.10.21     이민용      자체개선           노조코드 변경으로 인한 노조원구분 함수 막음
                                                            크론에 실행화일 변경부분 미반영
     *) HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개))
*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <sqlca.h>
#include <sqlda.h>
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"

#define   YYMMDD       8
#define   YYMMDDHH    16

#define   SUCCESS      0
#define   FAIL        -1

/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char   empno[5];                       /* 사원번호 */
     char   korname[13];                    /* 성    명 */
     char   paycl[4];                       /* BAND */
     char   payra[4];                       /* 직    책 */
     char   payrayn[2];                     /* 보임여부 */
     char   orgnum[4];                      /* 조직차수 */
     char   deptcode[7];                    /* 부서코드 */
     char   juminid[15];                    /* 주민번호 */
     char   empdate[9];                     /* 입 사 일 */
     char   orgempdate[9];                  /* 하나로입사일 31.05 */
     char   retdate[9];                     /* 퇴 사 일 */
     char   paycldate[9];                   /* BAND조정일 */
     char   cardate[9];                     /* 경 력 일 */
     char   realtrdate[9];                  /* 실제전보일 */
     char   lsetodate[9];                   /* 파견기간TO */
     char   edutodate[9];                   /* 교육기간TO */
     char   pstate[3];                      /* 인사상태 */
     char   pstateyn[2];                    /* 현원포함여부 */
     char   nogubun[3];                     /* 노조원구분 */
     char   no_payra[4];                    /* 비노조원직위 */
     char   no_payrayn[4];                  /* 보임자비노조원직위 */
     char   lhutodate[9];                   /* 휴가발령일TO */
     char   ljetodate[9];                   /* 정직발령일TO */
     char   jobdept[7];                     /* 근무부서 */
     char   jobplace[3];                    /* 근무지 */
           
     char   tmp_paycldate[9];
           
     char   v_curorgnum[4];
     char   v_workym[7];
     
     double korage;                         /* 연령(한) */
     double usaage;                         /* 연령(미) */
     double comduyy;                        /* 근속기간(년) */
     double comdumm;                        /* 근속기간(월) */
     double comdudd;                        /* 근속기간(일) */
     double totcomdudd;                     /* 총재직기간일 */
     double payclyy;                        /* 재급기간(년) */
     double payclmm;                        /* 재급기간(월) */
     double paycldd;                        /* 재급기간(일) */
     double hanaduyy;                       /* 하나로 근속기간(년) */
     double hanadumm;                       /* 하나로 근속기간(월) */
     double hanadudd;                       /* 하나로 근속기간(일) */
     double totpaycldd;                     /* 총재급기간일 */
     double no_count;                       
                                            
     char   workyymm[7];                    /* 시스템일자 */
     char   today[9];
     char   start_date[16], end_date[16];
     char   base_date[9];
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


int  error_sw, jobdept_sw;
char gubun[14];                             /* 작업구분 */
int  num;                                   /* 일련번호 */
char jobempno[5];                           /* 작업자사번 */
char FL_Line[101];
int  pa_count  , ed_count    , hu_count   , je_count;
int  read_count, update_count, error_count;


/******************************************
 *  MAIN PROCESSING START !!!!!!      *
 ******************************************/
main(argc,argv)
int argc;
char *argv[];
{
     char cp_count[8], ce_count[8], ch_count[8], cj_count[8];
     char r_count[8] , u_count[8] , e_count[8] ;
     
     char edf_count[8];
     
     char *FL_date;
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
         
     STRINIT(FL_file);
     strcpy(FL_file,"piz2011g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     hinsa_log_print(0,"인사마스터 이력보관(pihpmas) 프로그램 시작...");
             
     hinsa_db_connect();
     init_variable();
     
     /*
     ** Param:piz2011g 0000
     */
     strcpy(jobempno, argv[1]);  /* 작업자사번    0000 */
     STRINIT(FL_Line);
     sprintf(FL_Line, "PIZ2011G_%.4s", jobempno);
     hinsa_log_print(0, FL_Line);
     
     FL_date = hinsa_sys_date(0);
     STRINIT(start_date);
     strcpy(start_date, FL_date);
     
     /* EXEC SQL LOCK TABLE  pihpmas
                IN EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE pihpmas IN EXCLUSIVE MODE NOWAIT";
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
          sprintf(FL_Line, "다른 작업자가 DB수정 작업중입니다.");
          hinsa_log_print(0, FL_Line);
          return;
     }
     
     /* EXEC SQL
     SELECT  TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM') workyymm,
             TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD') today
       INTO  :workyymm,
             :today
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(SYSDATE,(-1)),'YYYYMM') worky\
ymm ,TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,(-1))),'YYYYMMDD') today into :b0,:b\
1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)today;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(FL_Line, "변수읽기중 Error");
          hinsa_log_print(0, FL_Line);
          return;
     }
     
     no_count = 0;
     /* EXEC SQL 
     SELECT  count(1)
       INTO  :no_count
       FROM  pihpmas
      WHERE  workyymm = :workyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(1) into :b0  from pihpmas where workyymm=:\
b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )43;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&no_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(FL_Line, "PIHPMAS Count 읽기중 Error");
          hinsa_log_print(0, FL_Line);
          return;
     }
     
     /* 전월 인사이력자료가 없으면 전월인사자료 입력 */
     if  (no_count < 1)
     {
          /* EXEC SQL
          INSERT  INTO  PIHPMAS
          SELECT  :workyymm,  a.*
            FROM  PIMPMAS a ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into PIHPMAS  select :b0 ,a.*  from PIMPMAS\
 a ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )66;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
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
               sprintf(FL_Line, "PIHPMAS Insert Error");
               hinsa_log_print(0, FL_Line);
               return;
          }
             
     }
     else
     {
          sprintf(FL_Line, "전월자료 있슴... 작업없이 종료");
          hinsa_log_print(0, FL_Line);
          return;
     }
     
     data_process();
     
     FL_date = hinsa_sys_date(0);
     STRINIT(end_date);
     strcpy(end_date, FL_date);
     
     STRINIT(FL_Line);
     sprintf(FL_Line, "<*> 파견 -> 재직 건수 : %7d 건", pa_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 교육 -> 재직 건수 : %7d 건", ed_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 휴가 -> 재직 건수 : %7d 건", hu_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 정직 -> 재직 건수 : %7d 건", je_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 읽은건수 : %7d 건", read_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 수정건수 : %7d 건", update_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 오류건수 : %7d 건", error_count);
     hinsa_log_print(0, FL_Line);
     
     
     sprintf(FL_Line, "<*> 작업시간 : %.4s/%.2s/%.2s %.2s.%.2s.%.2s - %.4s/%.2s/%.2s %.2s.%.2s.%.2s",
                                     start_date  , start_date+4 , start_date+6 ,
                                     start_date+8, start_date+10, start_date+12,
                                     end_date    , end_date+4   , end_date+6   ,
                                     end_date+8  , end_date+10  , end_date+12  );
     hinsa_log_print(0, FL_Line);
     
     update_pimvari();    /* 이력보관최종월 경신 */
     
     hinsa_exit(0,"OK 작업이 완료되었습니다.");
}

/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_variable()
{
     memset(empno,           0x00,   sizeof(empno)        );
     memset(korname,         0x00,   sizeof(korname)      );
     memset(paycl,           0x00,   sizeof(paycl)        );
     memset(payra,           0x00,   sizeof(payra)        );
     memset(payrayn,         0x00,   sizeof(payrayn)      );
     memset(orgnum,          0x00,   sizeof(orgnum)       );
     memset(deptcode,        0x00,   sizeof(deptcode)     );
     memset(juminid,         0x00,   sizeof(juminid)      );
     memset(empdate,         0x00,   sizeof(empdate)      );
     memset(orgempdate,      0x00,   sizeof(orgempdate)   );
     memset(retdate,         0x00,   sizeof(retdate)      );
     memset(paycldate,       0x00,   sizeof(paycldate)    );
     memset(cardate,         0x00,   sizeof(cardate)      );
     memset(lsetodate,       0x00,   sizeof(lsetodate)    );
     memset(edutodate,       0x00,   sizeof(edutodate)    );
     memset(pstate,          0x00,   sizeof(pstate)       );
     memset(pstateyn,        0x00,   sizeof(pstateyn)     );
     memset(nogubun,         0x00,   sizeof(nogubun)      );
     memset(no_payra,        0x00,   sizeof(no_payra)     );
     memset(no_payrayn,      0x00,   sizeof(no_payrayn)   );
     memset(lhutodate,       0x00,   sizeof(lhutodate)    );
     memset(ljetodate,       0x00,   sizeof(ljetodate)    );
     memset(start_date,      0x00,   sizeof(start_date)   );
     memset(end_date,        0x00,   sizeof(end_date)     );
     memset(jobdept,         0x00,   sizeof(jobdept)      );
     memset(jobplace,        0x00,   sizeof(jobplace)     );
                                                          
     memset(gubun,           0x00,   sizeof(gubun)        );
     num = 0;                                             
     memset(jobempno,        0x00,   sizeof(jobempno)     );
     pa_count   = ed_count     = hu_count    = je_count  = 0;
     read_count = update_count = error_count = 0;
     no_count   = 0;
     memset(workyymm,        0x00,   sizeof(workyymm)     );
     memset(today,           0x00,   sizeof(today)        );
     memset(tmp_paycldate,   0x00,   sizeof(tmp_paycldate));
     memset(base_date,       0x00,   sizeof(base_date)    );
     
     init_subvariable();
     read_pimvari();
}

/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_subvariable()
{
     error_sw = jobdept_sw = 0;
     korage   = usaage     = 0;
     comduyy  = comdumm    = comdudd  = totcomdudd = 0;
     payclyy  = payclmm    = paycldd  = totpaycldd = 0;
     hanaduyy = hanadumm   = hanadudd = 0;
}

/*----------------------------------------------*
 *  비노조원 직위를 읽는다          *
 *----------------------------------------------*/
read_pimvari()
{
     /* EXEC SQL 
     SELECT  substr(value1, 1, 3), substr(value2, 1, 3)
       INTO  :no_payra, :no_payrayn
       FROM  pimvari
      WHERE  (gubun = '60')
        AND  (sgubun = '0001'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select substr(value1,1,3) ,substr(value2,1,3) into :b0,\
:b1  from pimvari where (gubun='60' and sgubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )85;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)no_payra;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)no_payrayn;
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


     
     if  (sqlca.sqlcode != 0)
     {
          strcpy(no_payra, "000");  strcpy(no_payrayn, "000");
          hinsa_log_print(0,"(인사변수 비노조원직위 미존재 !");
     }
}

/****************************************
 *      Data process  routine       *
 ****************************************/
data_process()
{
     /* 전월 말일기준으로 근속일, 재급일, 하나로근속일 재계산 */
     /* EXEC SQL DECLARE c1 cursor for                      /o PIHPMAS 테이블모든 인원 검색 o/
               SELECT  empno, korname, paycl, payra,
                       upper(nvl(payrayn, ' ')), orgnum, deptcode,
                       nvl(juminid, '              '), empdate, orgempdate,
                       nvl(retdate, '        '), nvl(paycldate, '99999999'),
                       nvl(lsetodate, '99999999'), nvl(edutodate, '99999999'),
                       pstate, upper(nvl(pstateyn, ' ')),
                       upper(nvl(nogubun, '  ')), jobdept, jobplace,
                       nvl(cardate, '99999999'),realtrdate
                 FROM  pihpmas
                WHERE  workyymm = :workyymm
                	/o2014.10.01.hjku. 과거 퇴사자 계산되지 않도록 추가(최근6개월퇴사자와 작업월 수정이력 있는 대상자 포함) o/
                  and  (substr(nvl(retdate,'99999999'),1,6) >= to_char(add_months(to_date(workyymm,'YYYYMM'),-5),'YYYYMM')
                        or
                        substr(writetime,1,6)=workyymm)
                ORDER  BY  empno; */ 

     
     /* EXEC SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )108;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
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
          hinsa_exit(0,"Cursor Open c1");
     
     for ( ; ; )
     {
          /* EXEC SQL FETCH c1 INTO
                   :empno    , :korname   , :paycl     , :payra   ,
                   :payrayn  , :orgnum    , :deptcode  ,          
                   :juminid  , :empdate   , :orgempdate, :retdate , :paycldate,
                   :lsetodate, :edutodate , :pstate    , :pstateyn,
                   :nogubun  , :jobdept   , :jobplace  ,
                   :cardate  , :realtrdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 21;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )127;
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
          sqlstm.sqhstv[2] = (unsigned char  *)paycl;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)payra;
          sqlstm.sqhstl[3] = (unsigned long )4;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)payrayn;
          sqlstm.sqhstl[4] = (unsigned long )2;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[6] = (unsigned long )7;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)juminid;
          sqlstm.sqhstl[7] = (unsigned long )15;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)empdate;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)orgempdate;
          sqlstm.sqhstl[9] = (unsigned long )9;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)retdate;
          sqlstm.sqhstl[10] = (unsigned long )9;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)paycldate;
          sqlstm.sqhstl[11] = (unsigned long )9;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)lsetodate;
          sqlstm.sqhstl[12] = (unsigned long )9;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)edutodate;
          sqlstm.sqhstl[13] = (unsigned long )9;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)pstate;
          sqlstm.sqhstl[14] = (unsigned long )3;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)pstateyn;
          sqlstm.sqhstl[15] = (unsigned long )2;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)nogubun;
          sqlstm.sqhstl[16] = (unsigned long )3;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)jobdept;
          sqlstm.sqhstl[17] = (unsigned long )7;
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)jobplace;
          sqlstm.sqhstl[18] = (unsigned long )3;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)cardate;
          sqlstm.sqhstl[19] = (unsigned long )9;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)realtrdate;
          sqlstm.sqhstl[20] = (unsigned long )9;
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


     
         if  (sqlca.sqlcode == 1403)
         {
              /* EXEC SQL close c1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 21;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )226;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              return;
         }
         else if  (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
         {
              /* EXEC SQL close c1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 21;
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


              hinsa_exit(0,"Data Fetch c1");
         }
         init_subvariable();
         read_count++;
         hinsa_trim(korname);   
         hinsa_trim(juminid);
         hinsa_trim(retdate);   
         hinsa_trim(paycldate);
         hinsa_trim(lsetodate); 
         hinsa_trim(edutodate);
         hinsa_trim(deptcode);  
         hinsa_trim(jobdept);
     
         calc_age();               /* 연령계산 */
         calc_comdu();             /* 근속기간을 계산 */
         calc_paycl();             /* 재급기간을 계산 */
         calc_hana();              /* 하나로 근속기간 계산   31.05*/
         proc_pstate();            /* 인사상태, 현원포함여부 */
         
         /* 1.01   2003.10.21      이민용      자체개선       노조코드 변경으로 인한 노조원구분 함수 막음 
         proc_nogubun();           노조원구분 (97/07/15 LYJ) */
         if  (jobdept_sw != 0)     /* 근무부서 변경시 */
              proc_jobplace();     /* 근무지 */
                                   
         if  (error_sw == 0)       /* 오류가 없을때만 */
              update_pimpmas();
     }
}

calc_age()
{
     char today_yy[5];
     char birthdate_yy[5];
     char birthdate[9], yy[5], mm[3], dd[3];
     char *FL_date;  
     char *FL_yy;
     char *FL_today_yy;
     char *FL_birthdate_yy;
     char date[9];

     /*30.00  Y2k khj */
     memset(birthdate, NULL, strlen(birthdate));
     if       ((juminid[7] == '2') || (juminid[7] == '1'))  /* 주민등록번호인 경우 */
          sprintf(birthdate, "19%.6s", juminid);
     else if  ((juminid[7] == '3') || (juminid[7] == '4'))
          sprintf(birthdate, "20%.6s", juminid);
     else if  ((juminid[7] == '5') || (juminid[7] == '6'))  /* 외국인등록번호인 경우 */
          sprintf(birthdate, "19%.6s", juminid);
     else if  ((juminid[7] == '7') || (juminid[7] == '8'))
          sprintf(birthdate, "20%.6s", juminid);
     
     if  ((strncmp(juminid, "  ", 2) == 0) || (juminid[0] == '\0') ||
          (strlen(birthdate) != 8) || (hinsa_isnumber(birthdate) < 0))
     {
          /*printf("jumin_no :%s,:%s\n", juminid,empno);
          hinsa_log_print(0,"주민번호 오류 !"); */
          sprintf(FL_Line, " 사번[%s] pstate[%s] juminid[%s]  주민번호 오류 !",empno,pstate,juminid);
          hinsa_log_print(0, FL_Line);
          return;
     }
     
     /*strlcpy(today_yy, today, 4);*/
     FL_today_yy = hinsa_copy(today,1,4); 
     STRINIT(today_yy);
     strcpy(today_yy, FL_today_yy);  
     /*strlcpy(yy, birthdate, 4);*/
     FL_birthdate_yy = hinsa_copy(birthdate,1,4);
     STRINIT(birthdate_yy);
     strcpy(birthdate_yy, FL_birthdate_yy); 
     
     korage = (atoi(today_yy) - atoi(birthdate_yy));         /* 연령(한) */
     
     strcpy(base_date, today);
     
     /*DPymd_minus(base_date, 1);*/
     hinsa_day_minus(base_date, 0x00, 1);
     
     /* 개선전 
     if  (DPcalc_term(birthdate, base_date, yy, mm, dd) < 0)
     {
          hinsa_log_print(0,"생년월일 오류 !");
          return;
     }
     usaage = atoi(yy); */                                   /* 연령(미) */
     
     /* 개선후 */ 
     FL_date = hinsa_day_fromto_ymd(birthdate,base_date, 0x00);
         
     STRINIT(date);
     strcpy(date, FL_date);
     
     FL_yy = hinsa_copy(date,1,4);
     
     STRINIT(yy);
     strcpy(yy, FL_yy);  
     usaage = atoi(yy);   /* 연령(미) */
}

calc_comdu()
{
     char yy[5], mm[3], dd[3];
     int  n = 0;
     char *FL_date;  
     char *FL_yy;
     char *FL_mm;
     char *FL_dd;
     char date[9];
     
     if  (strcmp(pstate, "80") >= 0)                            /* 퇴사자면 퇴사일 기준 */
          strcpy(base_date, retdate);
     else
          strcpy(base_date, today);
     
     /* 개선전  
     if  (DPcalc_term(empdate, base_date, yy, mm, dd) < 0)
     {
          hinsa_log_print(0,"근속기간 계산오류 !");
          return;
     }
     comduyy = atoi(yy);
     comdumm = atoi(mm);
     comdudd = atoi(dd);
     */
     
     /* 개선후 */ 
     FL_date = hinsa_day_fromto_ymd(empdate,base_date, 0x00);
     
     STRINIT(date);
     strcpy(date, FL_date);
     
     FL_yy = hinsa_copy(date,1,4);
     
     STRINIT(yy);
     strcpy(yy, FL_yy); 
     comduyy = atoi(yy); 
     
     FL_mm = hinsa_copy(start_date,5,2);
     
     STRINIT(mm);
     strcpy(mm, FL_mm);
     comdumm = atoi(mm); 
     
     FL_dd = hinsa_copy(start_date,7,2);
     
     STRINIT(dd);
     strcpy(dd, FL_dd);
     comdudd = atoi(dd);      
      
     /* EXEC SQL
     select to_date(:base_date,'YYYYMMDD') - to_date(:empdate,'YYYYMMDD')
       INTO :totcomdudd
       from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (to_date(:b0,'YYYYMMDD')-to_date(:b1,'YYYYMMDD')\
) into :b2  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )256;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)base_date;
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
     sqlstm.sqhstv[2] = (unsigned char  *)&totcomdudd;
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
     {
          hinsa_log_print(0,"총재직기간일  계산오류 !");
          return;
     }
}

calc_paycl()
{
     char tpaycldate[9];
     char yy[5], mm[3], dd[3],tmp_n[5];
     int  n = 0;
     char *FL_date;  
     char *FL_yy;
     char *FL_mm;
     char *FL_dd;
     char date[9];
     
     strcpy(tpaycldate, paycldate);
     if  ((strncmp(cardate, "9999", 4) != 0) &&
          (strcmp(empdate, paycldate) == 0))    /* (경력이 있는경우) AND (입사일 == 직급일) */
          strcpy(tpaycldate, cardate);
     if  (strcmp(pstate, "80") >= 0)            /* 재직자는 todate, 퇴사자는 퇴사일         */
          strcpy(base_date, retdate);
     else
          strcpy(base_date, today);
     
     /* 개선전     
     if  (DPcalc_term(tpaycldate, base_date, yy, mm, dd) < 0)   
     {
          hinsa_log_print(0,"재급기간 계산오류 !");
          return;
     }
     payclyy = atoi(yy);
     payclmm = atoi(mm);
     paycldd = atoi(dd); */
     
     /* 개선후 */
     FL_date = hinsa_day_fromto_ymd(tpaycldate,base_date, 0x00);
     
     STRINIT(date);
     strcpy(date, FL_date);
     
     FL_yy = hinsa_copy(date,1,4);
     
     STRINIT(yy);
     strcpy(yy, FL_yy);  
     payclyy = atoi(yy); 
     
     FL_mm = hinsa_copy(start_date,5,2);
     
     STRINIT(mm);
     strcpy(mm, FL_mm);
     payclmm = atoi(mm); 
     
     FL_dd = hinsa_copy(start_date,7,2);
     
     STRINIT(dd);
     strcpy(dd, FL_dd);
     paycldd = atoi(dd);      
     
     
     strcpy(tmp_paycldate,tpaycldate);
     
     /* EXEC SQL 
     select to_date(:base_date,'YYYYMMDD') - to_date(:tmp_paycldate,'YYYYMMDD') INTO :totpaycldd  from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (to_date(:b0,'YYYYMMDD')-to_date(:b1,'YYYYMMDD')\
) into :b2  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )283;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)base_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)tmp_paycldate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&totpaycldd;
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
     {                            
          /*printf("paycldate :%s,:%s\n", tmp_paycldate,empno);      
            hinsa_log_print(0,"총재급기간일  계산오류 !");*/
          sprintf(FL_Line, " 사번[%s] pstate[%s] paycldate[%s]  총재급기간일  계산오류 !",empno,pstate,tmp_paycldate);
          hinsa_log_print(0, FL_Line);  
          return;
     }
}

calc_hana()                                      /* 31.05  하나로 근속기간 계산  */
{
     char torgempdate[9];
     char yy[5], mm[3], dd[3];
     int n = 0;
     char *FL_date;  
     char *FL_yy;
     char *FL_mm;
     char *FL_dd;
     char date[9];
     
     strcpy(torgempdate, orgempdate);
     if  (strcmp(pstate, "80") >= 0)            /* 재직자는 todate, 퇴사자는 퇴사일         */
          strcpy(base_date, retdate);
     else
          strcpy(base_date, today);
     
     /*개선전
     if  (DPcalc_term(torgempdate, base_date, yy, mm, dd) < 0)     
     {
          hinsa_log_print(0,"하나로 근속기간 계산오류 !");
          return;
     }
     hanaduyy = atoi(yy);
     hanadumm = atoi(mm);
     hanadudd = atoi(dd); */
     /* 개선후 */
     FL_date = hinsa_day_fromto_ymd(torgempdate,base_date, 0x00);
     
     STRINIT(date);
     strcpy(date, FL_date);
     
     FL_yy = hinsa_copy(date,1,4);
     
     STRINIT(yy);
     strcpy(yy, FL_yy);  
     hanaduyy = atoi(yy); 
     
     FL_mm = hinsa_copy(start_date,5,2);
     
     STRINIT(mm);
     strcpy(mm, FL_mm);
     hanadumm = atoi(mm); 
     
     FL_dd = hinsa_copy(start_date,7,2);
     
     STRINIT(dd);
     strcpy(dd, FL_dd);
     hanadudd = atoi(dd);          
}

proc_pstate()
{
     if  (strcmp(pstateyn, "N") != 0)
          strcpy(pstateyn, "Y");
     
     if  (strncmp(pstate, "2", 1) == 0)                /* 파  견 */
     {
          if  (strcmp(today, lsetodate) > 0)
          {
               pa_count++;
               strcpy(pstate, "10");
               strcpy(pstateyn, "Y");
               strcpy(jobdept, deptcode);
               jobdept_sw++;
               hinsa_log_print(0,"파견 ==> 재직");
          }
     }
     else if  (strncmp(pstate, "3", 1) == 0)           /* 교  육 */
     {
          if  (strcmp(today, edutodate) > 0)
          {
               ed_count++;
               strcpy(pstate, "10");
               strcpy(pstateyn, "Y");
               hinsa_log_print(0,"교육 ==> 재직");
          }
     }
     else if  (strcmp(pstate, "41") == 0)               /* 장기휴가 */
     {                                                 
          read_lhutodate();                             /* 휴가발령일TO를 읽자 */
          if  (strcmp(today, lhutodate) > 0)
          {   
               hu_count++;
               strcpy(pstate, "10");
               strcpy(pstateyn, "Y");
               hinsa_log_print(0,"장기휴가 ==> 재직");
          }
     }
     else if  (strncmp(pstate, "6", 1) == 0)            /* 정  직 */
     {
          read_ljetodate();   /* 정직발령일TO를 읽자 */
          if  (strcmp(today, ljetodate) > 0)
          {   
               je_count++;
               strcpy(pstate, "10");
               strcpy(pstateyn, "Y");
               hinsa_log_print(0,"정직 ==> 재직");
          }
     }
     else if  (strcmp(pstate, "80") >= 0)              /* 퇴  직 */
     {
          strcpy(pstateyn, "N");
     }
}

read_lhutodate()
{
     memset(lhutodate, 0x00, sizeof(lhutodate));
     /* EXEC SQL 
     SELECT  max(nvl(antodate, '00000000'))
       INTO  :lhutodate
       FROM  pihanno
      WHERE  (empno = :empno)
        AND  (ancode = '471')
        AND  anupdyn in ('Y', 'y'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(nvl(antodate,'00000000')) into :b0  from pih\
anno where ((empno=:b1 and ancode='471') and anupdyn in ('Y','y'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )310;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)lhutodate;
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
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          strcpy(lhutodate, "29991231");
          hinsa_log_print(0,"휴가발령 미존재 !");
     }
}

read_ljetodate()
{
     memset(ljetodate, 0x00, sizeof(ljetodate));
     /* EXEC SQL
       SELECT  max(nvl(antodate, '00000000'))
         INTO  :ljetodate
         FROM  pihanno
        WHERE  empno = :empno
          AND  ((ancode = '641') OR (ancode = '600' AND andetcode = '64'))
          AND  anupdyn in ('Y', 'y'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(nvl(antodate,'00000000')) into :b0  from pih\
anno where ((empno=:b1 and (ancode='641' or (ancode='600' and andetcode='64')\
)) and anupdyn in ('Y','y'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )333;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)ljetodate;
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
     sqlstm.sqphsv = sqlstm.sqhstv;
     sqlstm.sqphsl = sqlstm.sqhstl;
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
          strcpy(ljetodate, "29991231");
          hinsa_log_print(0,"정직발령 미존재 !");
     }
}

proc_nogubun()
{
     char orgnogubun[3];
     strcpy(orgnogubun, nogubun);                      /* 원래값을 보관하자 */
     if  (strcmp(pstate, "80") >= 0)                   /* 퇴직자는 제외하자 */
          return;                                      
     if  (strcmp(nogubun, "10") == 0)                  /* 비노조원이면 제외하자 */
          return;                                      
         
     if  ((strcmp(payra, no_payra) <= 0) ||            /* 기준직위보다 이하 OR */
          (strcmp(payra, "99") > 0))                   /* 임시직이면 비노조원 */
     {   
          strcpy(nogubun, "10");                       /* 비노조원 */
          return;
     }   
     if  ((strcmp(payra, no_payrayn) <= 0) &&          /* 3급이상 이면서 */
          (strcmp(payrayn, "Y") == 0))                 /* 보직자면 비노조원 */
     {                                                
          strcpy(nogubun, "10");                       /* 비노조원 */
          return;                            
     }                                       
     strcpy(nogubun, "20");                            /* 일단은 모두노조원으로 */
     no_count = 0;
     /* EXEC SQL 
     SELECT  count(sgubun)
       INTO  :no_count
       FROM  pimvari
      WHERE  gubun = '61'
        AND  value1 <= :deptcode 
        AND  value2 >= :deptcode
        AND  value3 <= :payra 
        AND  value4 >= :payra; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(sgubun) into :b0  from pimvari where ((((g\
ubun='61' and value1<=:b1) and value2>=:b1) and value3<=:b3) and value4>=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )356;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&no_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)deptcode;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)deptcode;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)payra;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)payra;
     sqlstm.sqhstl[4] = (unsigned long )4;
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


     if  (no_count > 0)   /* 자료가 있으면 */
          strcpy(nogubun, "10");                        /* 비노조원 */
     if  ((strcmp(orgnogubun, "20") >= 0) &&
          (strcmp(nogubun, "20") == 0))
          strcpy(nogubun, orgnogubun);                  /* 원래값을 저장 */
}

proc_jobplace()     /* 근무지 */
{
     if  (strcmp(pstate, "80") >= 0)                    /* 퇴직자는 제외하자 */
          return;
     
     memset(jobplace, 0x00, sizeof(jobplace));
     /* EXEC SQL 
     SELECT  placecode
       INTO  :jobplace
       FROM  pycdept
      WHERE  orgnum = :orgnum
        AND  deptcode = :jobdept
        AND  existon = '1' AND chanmode != '3'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 21;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select placecode into :b0  from pycdept where (((orgnum\
=:b1 and deptcode=:b2) and existon='1') and chanmode<>'3')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )391;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)jobplace;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)orgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)jobdept;
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


     
     if  (sqlca.sqlcode != 0)
     {   
          memset(jobplace, 0x00, sizeof(jobplace));
          hinsa_log_print(0,"부서코드 미존재 OR 오류 !");
     }
}

update_pimpmas()
{

    /* EXEC SQL 
    UPDATE  pihpmas
       SET  korage     = :korage,
            usaage     = :usaage,
            comduyy    = :comduyy,
            comdumm    = :comdumm,
            comdudd    = :comdudd,
            totcomdudd = :totcomdudd,
            payclyy    = :payclyy,
            payclmm    = :payclmm,
            paycldd    = :paycldd,
            totpaycldd = :totpaycldd,
            hanaduyy   = :hanaduyy,
            hanadumm   = :hanadumm,
            hanadudd   = :hanadudd
            /o 미정
            pstate     = :pstate,
            pstateyn   = :pstateyn,
            nogubun    = :nogubun,
            jobdept    = :jobdept,
            jobplace   = :jobplace
            o/
     WHERE  workyymm = :workyymm
       AND  empno = :empno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 21;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update pihpmas  set korage=:b0,usaage=:b1,comduyy=:b2,co\
mdumm=:b3,comdudd=:b4,totcomdudd=:b5,payclyy=:b6,payclmm=:b7,paycldd=:b8,totp\
aycldd=:b9,hanaduyy=:b10,hanadumm=:b11,hanadudd=:b12 where (workyymm=:b13 and\
 empno=:b14)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )418;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&korage;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&usaage;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&comduyy;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&comdumm;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&comdudd;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&totcomdudd;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&payclyy;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&payclmm;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&paycldd;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&totpaycldd;
    sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&hanaduyy;
    sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&hanadumm;
    sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&hanadudd;
    sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)workyymm;
    sqlstm.sqhstl[13] = (unsigned long )7;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)empno;
    sqlstm.sqhstl[14] = (unsigned long )5;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqphsv = sqlstm.sqhstv;
    sqlstm.sqphsl = sqlstm.sqhstl;
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
         /* EXEC SQL close c1; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 21;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )493;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         sprintf(FL_Line, "Update Pihpmas Error [%s] ", empno);
         hinsa_exit(0,FL_Line);
    }
    update_count++;
}

update_pimvari()
{
    /* EXEC SQL 
    UPDATE  pimvari
       SET  value2 = :workyymm
     WHERE  gubun = '50' AND sgubun = '0004'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 21;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update pimvari  set value2=:b0 where (gubun='50' and sgu\
bun='0004')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )508;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
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
         hinsa_exit(0,"Update Pimvari Error");
}

/*--------------------------------------*
 *  Log message routine     *
 *--------------------------------------*/
/* 민용막음
log_message(msg)
char *msg;
{
     error_sw++;
     if  (strcmp(pstate, "80") < 0)
     {  
          error_count++;
          sprintf(FL_Line,"사번[%s]성명[%s]직급[%s]인사상태[%s] ==> [%s]",
                  empno, korname, paycl, pstate, msg);
          hinsa_log_print(0, FL_Line);
     }
     return;
}*/

/*--------------------------------------*
 *  Log message routine     *
 *--------------------------------------*/
/* 민용막음
log_write(msg)
char *msg;
{
     sprintf(FL_Line,"사번[%s]성명[%s]직급[%s] ==> [%s]",
                      empno, korname, paycl, msg);
     hinsa_log_print(0, FL_Line);
     return;
}
*/

/*--------------------------------------*
 *   조직도생성 프로그램을 돌린다       *
 *--------------------------------------*/
/* 미정
update_pihorga()
{
     char command[100];
 
     memset(command, NULL, sizeof(command));
     memset(v_curorgnum, NULL, sizeof(v_curorgnum));
     memset(v_workym, NULL, sizeof(v_workym));;
 
     EXEC SQL 
     SELECT  VALUE1, TO_CHAR(SYSDATE, 'YYYYMM')
       INTO  :v_curorgnum, :v_workym
       FROM  PIMVARI
      WHERE  GUBUN = '00'
        AND  SGUBUN = '0001';
 
     if  (sqlca.sqlcode != 0)
     {
          sprintf(FL_Line, "현재조직차수 가져오기 에러");
          hinsa_exit(0,FL_Line);
     }
 
     sprintf(command, "~/bin/Ibin/pib2010g %s %s %s", jobempno, v_workym, v_curorgnum);
     system(command);
 
     return;
}
*/
/**********<< PROGRAM END >>********************************/
  