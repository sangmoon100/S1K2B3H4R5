
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
    "pko4040g.pc"
};


static unsigned int sqlctx = 153683;


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
   unsigned char  *sqhstv[6];
   unsigned long  sqhstl[6];
            int   sqhsts[6];
            short *sqindv[6];
            int   sqinds[6];
   unsigned long  sqharm[6];
   unsigned long  *sqharc[6];
   unsigned short  sqadto[6];
   unsigned short  sqtdso[6];
} sqlstm = {12,6};

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

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,115,0,0,0,0,0,1,0,
20,0,0,2,81,0,4,161,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
47,0,0,3,351,0,5,179,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
74,0,0,4,60,0,2,205,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
97,0,0,5,557,0,3,235,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
132,0,0,6,22,0,2,270,0,0,0,0,0,1,0,
147,0,0,7,331,0,3,273,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
178,0,0,8,255,0,5,293,0,0,1,1,0,1,0,1,97,0,0,
197,0,0,9,136,0,4,329,0,0,6,2,0,1,0,2,97,0,0,2,3,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
1,97,0,0,
236,0,0,10,136,0,4,345,0,0,6,2,0,1,0,2,97,0,0,2,3,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
1,97,0,0,
275,0,0,11,50,0,3,367,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
316,0,0,12,0,0,29,377,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKO4040G(저축공제금계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 저축
 Programmer     : 이랑교
 Version        : 10.01
 Date           : 1998.05.29
 
Select : PKHSVHIS, PKMSVMAS, PKMPMAS, PKHSVSPE, PKMSVMON
Insert : PKHSVHIS, PKMSVMON
Update : PKMSVMAS, 
Delete : PKHSVHIS, PKMSVMON
 
Update Contents
  버전    수정일       수정자   관련근거       수정내용
  1.00    1997.12.01   김영대   설계명세서     최초개발본
  10.01   1998.04.20   이랑교   전1998.04.11    지급액도 계산   
  10.02   1998.05.29   이랑교   전1998.05.25    개별납부이력관리추가로
                                                당월공제금생성시 납부이력에 있는
                                                자료를 제외하고 생성한다.
  10.03   2004.02.24   강륜종                  Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.                                                 
  11.00   2004.11.     강륜종(dsa2000)         Rexec대체 서비스를 위한 수정작업.    
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

/* ** 함수 Prototype 선언  ***
void  process_delete();
void  process_record1();
void  process_record2();
void  process_sum();
*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char     saveyymm[8+1]   ="";
     char     savekind[1+1]   ="";
     char     bokjisupYN[1+1] ="";
     char     jobempno[4+1]   ="";
     char     h_saveyymm[8+1]   ="";
     int      h_cnt      =0;
     double   h_totalamt =0;
     double   h_totgiveamt =0;
     char     m_saveyymm[8+1]   ="";
     int      m_cnt      =0;
     double   m_totalamt =0;
     double   m_totgiveamt =0;
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


int   id;
char  dir[80];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

void main(int argc,char *argv[])
{
     int flag,i;
     char FL_file[255];
     
     if  (argc != 7) {  /*/hper8/HINSA/proc/bin/Kbin/pko4040g 200411 1 Y D006 pko4040g 2004110100000 */
          printf("[Usage] : pko4040g 1.공제년월 2.저축구분=>1,2,3  3.지급금계산여부Y/N ");
          printf("[Usage] :          4.작업자 5.프로그램ID 6.시작시간 \n");
          exit(1);
     }
     
     strcpy(saveyymm,  argv[1]);
     strcpy(savekind  ,argv[2]);
     strcpy(bokjisupYN,argv[3]);
     strcpy(jobempno,  argv[4]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pko4040g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
      
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"저축 공제금 계산 시작..."); 
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     /* EXEC SQL LOCK TABLE PKMSVMAS
       in EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKMSVMAS in EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
     
     process_delete();
     
     if ((process_record1() == SUCCESS )&&
         (process_record2() == SUCCESS ))
     {
          process_sum();
     
          printf("   \n");
          printf("               공제건수      공제금     지급금 \n");
          printf(" 저 축  이 력 :     %d건    %10.0f  %10.0f \n", h_cnt,h_totalamt,h_totgiveamt);
          printf(" 저축당월공제 :     %d건    %10.0f  %10.0f \n", m_cnt,m_totalamt,m_totgiveamt);
          
          sprintf(log_buff, "                  공제건수       공제금      지급금 \n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          sprintf(log_buff, " 저 축  이 력 :     %d건    %10.0f  %10.0f \n", h_cnt,h_totalamt,h_totgiveamt);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          sprintf(log_buff, " 저축당월공제 :     %d건    %10.0f  %10.0f \n", m_cnt,m_totalamt,m_totgiveamt); 
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          
          sprintf(log_buff, "OK 작업이 성공적으로 완료되었습니다.\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK 작업이 성공적으로 완료되었습니다.\n");
     }
     else
     {
          sprintf(log_buff, " 작업이 실패했습니다.\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit(" 작업이 실패했습니다.\n");
     }
      
}


/*****************************************************************************
  재계산일경우  자료를 원상태로
        이력의 횟수와 불입액으로 마스터를 수정하고 이력을 지우자
 *****************************************************************************/
process_delete()
{       

     int cnt =0;
        
 /* 재계산 여부 확인 */
     /* EXEC SQL
     SELECT COUNT(EMPNO)
     INTO   :cnt
     FROM   PKHSVHIS
     WHERE  SAVEYYMM = :saveyymm
     AND    SAVEKIND = :savekind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(EMPNO) into :b0  from PKHSVHIS where (SAVE\
YYMM=:b1 and SAVEKIND=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)savekind;
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



     if  (sqlca.sqlcode != 0) 
     {
          printf("ERROR_CODE : %d, 재계산 여부 확인\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 재계산 여부 확인\n", sqlca.sqlcode);
                     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else if (cnt < 1)
          return(SUCCESS);      
     
     /*재계산 수행 1단계 Master를 원래상태로   */        
     /* EXEC SQL
     UPDATE  PKMSVMAS C
     SET     ( SAVELYYMM ,  SAVECNT  , SAVESUM   ) =
             ( SELECT   TO_CHAR(TO_DATE(SAVELYYMM,'YYYYMM')-1,'YYYYMM') ,
                        SAVECNT - 1,
                        SAVESUM - SAVEAMT
               FROM     PKMSVMAS A
               WHERE    SAVELYYMM = :saveyymm
               AND      C.EMPNO    = A.EMPNO
               AND      C.SAVEBANK = A.SAVEBANK
               AND      C.SAVEKIND = A.SAVEKIND
               AND      C.SEQNO    = A.SEQNO   
             )
     WHERE    SAVELYYMM = :saveyymm 
     AND      SAVEKIND  = :savekind 
     AND      (CANYN  <>'Y' AND ENDYN <>'Y'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMSVMAS C  set (SAVELYYMM,SAVECNT,SAVESUM)=(sel\
ect TO_CHAR((TO_DATE(SAVELYYMM,'YYYYMM')-1),'YYYYMM') ,(SAVECNT-1) ,(SAVESUM-\
SAVEAMT)  from PKMSVMAS A where ((((SAVELYYMM=:b0 and C.EMPNO=A.EMPNO) and C.\
SAVEBANK=A.SAVEBANK) and C.SAVEKIND=A.SAVEKIND) and C.SEQNO=A.SEQNO)) where (\
(SAVELYYMM=:b0 and SAVEKIND=:b2) and (CANYN<>'Y' and ENDYN<>'Y'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )47;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)savekind;
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


     
     if  (sqlca.sqlcode != 0) 
     {
          printf("ERROR_CODE : %d, 재계산 수행 1단계Master를 원래상태로\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 재계산 수행 1단계Master를 원래상태로\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
      /* 재계산 수행 2단계 이력을 날린다. */
     /* EXEC SQL
     DELETE   PKHSVHIS
      WHERE   SAVEYYMM = :saveyymm 
        AND   SAVEKIND = :savekind ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHSVHIS  where (SAVEYYMM=:b0 and SAVEKIND\
=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )74;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)savekind;
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

  
     
     
      if  (sqlca.sqlcode != 0) 
      {
           printf("ERROR_CODE : %d, 재계산 수행 2단계이력을 지운다\n", sqlca.sqlcode);
           sprintf(log_buff, "ERROR_CODE : %d, 재계산 수행 2단계이력을 지운다\n", sqlca.sqlcode);
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           return(FAIL);
      }
      else
           return(SUCCESS);       
}


/*****************************************************************************
  당월이력생성및  계산
 *****************************************************************************/


 /**************************************************************************
  10.02   1998.05.29   이랑교   전1998.05.25    개별납부이력관리추가로
                                                당월공제금생성시 납부이력에 있는
                                                자료를 제외하고 생성한다.
 *****************************************************************************/
process_record1()
{
     /* EXEC SQL 
     INSERT INTO PKHSVHIS
            ( SAVEYYMM,  EMPNO,     KORNAME,    PAYCL,   SEQNO,  PAYYN,  SAVECNT,   
              SAVEAMT ,  SAVESUM,   SAVEKIND,   SAVEBANK,
              GIVEAMT,   WRITETIME, WRITEMAN)
        SELECT 
                :saveyymm, A.EMPNO,   A.KORNAME,  B.PAYCL, 
                A.SEQNO,B.PAYYN,A.SAVECNT+1,
                A.SAVEAMT, A.SAVESUM+A.SAVEAMT, A.SAVEKIND, A.SAVEBANK,
                decode(:bokjisupYN,'Y',A.SAVEAMT2,0),
                TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),:jobempno
         FROM  PKMSVMAS A, PKMPMAS B
        WHERE  A.EMPNO  = B.EMPNO(+) 
          AND  A.SAVEKIND = :savekind 
          AND  (A.CANYN  <>'Y' AND A.ENDYN <>'Y')
          AND  (A.EMPNO ,A.SEQNO) 
                NOT IN ( SELECT EMPNO,SEQNO FROM PKHSVSPE
                          WHERE  :saveyymm BETWEEN SPEFRYYMM AND SPETOYYMM ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHSVHIS (SAVEYYMM,EMPNO,KORNAME,PAYCL,SEQN\
O,PAYYN,SAVECNT,SAVEAMT,SAVESUM,SAVEKIND,SAVEBANK,GIVEAMT,WRITETIME,WRITEMAN)\
select :b0 ,A.EMPNO ,A.KORNAME ,B.PAYCL ,A.SEQNO ,B.PAYYN ,(A.SAVECNT+1) ,A.S\
AVEAMT ,(A.SAVESUM+A.SAVEAMT) ,A.SAVEKIND ,A.SAVEBANK ,decode(:b1,'Y',A.SAVEA\
MT2,0) ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') ,:b2  from PKMSVMAS A ,PKMPMAS B \
where (((A.EMPNO=B.EMPNO(+) and A.SAVEKIND=:b3) and (A.CANYN<>'Y' and A.ENDYN\
<>'Y')) and (A.EMPNO,A.SEQNO) not  in (select EMPNO ,SEQNO  from PKHSVSPE whe\
re :b0 between SPEFRYYMM and SPETOYYMM))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )97;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bokjisupYN;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)savekind;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[4] = (unsigned long )9;
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
           printf("ERROR_CODE : %d, 당월 자료를 이력에 입력 실패. step1 \n", sqlca.sqlcode);
           sprintf(log_buff, "ERROR_CODE : %d, 당월 자료를 이력에 입력 실패. step1 \n", sqlca.sqlcode);
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           return(FAIL);
     }
     else
           return(SUCCESS);       
}

/*****************************************************************************
  당월공제금 생성
 *****************************************************************************/
process_record2()
{
     /* EXEC SQL
     DELETE    FROM PKMSVMON; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKMSVMON ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )132;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            
     /* EXEC SQL
     INSERT  INTO  PKMSVMON                            
            ( EMPNO,   KORNAME,   SAVEYYMM, SAVEKIND, PAYCL, SAVEAMT, 
              GIVEAMT, WRITETIME, WRITEMAN )                  
      SELECT  EMPNO,   KORNAME,   SAVEYYMM, SAVEKIND, PAYCL, SUM(SAVEAMT),
              SUM(decode(:bokjisupYN,'Y',GIVEAMT,0)),
              TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') ,:jobempno
        FROM  PKHSVHIS                                     
       WHERE  SAVEKIND = :savekind
         AND  SAVEYYMM = :saveyymm
       GROUP  BY EMPNO, KORNAME,  SAVEYYMM, SAVEKIND, PAYCL  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMSVMON (EMPNO,KORNAME,SAVEYYMM,SAVEKIND,P\
AYCL,SAVEAMT,GIVEAMT,WRITETIME,WRITEMAN)select EMPNO ,KORNAME ,SAVEYYMM ,SAVE\
KIND ,PAYCL ,sum(SAVEAMT) ,sum(decode(:b0,'Y',GIVEAMT,0)) ,TO_CHAR(SYSDATE,'Y\
YYYMMDDHH24MISS') ,:b1  from PKHSVHIS where (SAVEKIND=:b2 and SAVEYYMM=:b3) g\
roup by EMPNO,KORNAME,SAVEYYMM,SAVEKIND,PAYCL";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )147;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bokjisupYN;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)savekind;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)saveyymm;
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
           printf("ERROR_CODE : %d, 당월 자료를 생성실패. step2 \n", sqlca.sqlcode);
           sprintf(log_buff, "ERROR_CODE : %d, 당월 자료를 생성실패. step2 \n", sqlca.sqlcode);
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           return(FAIL);
      };
     
      /* EXEC SQL
      UPDATE  PKMSVMAS A
         SET    ( SAVELYYMM ,  SAVESUM, SAVECNT     )
         =      ( SELECT  MAX(B.SAVEYYMM), SUM(B.SAVEAMT), COUNT(B.EMPNO)
                    FROM  PKHSVHIS B
                   WHERE  B.EMPNO    = A.EMPNO
                     AND  B.SAVEBANK = A.SAVEBANK
                     AND  B.SEQNO    = A.SEQNO    
                 )
       WHERE  A.SAVEKIND  = :savekind    
         AND (A.CANYN  <>'Y' AND A.ENDYN <>'Y'); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 5;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMSVMAS A  set (SAVELYYMM,SAVESUM,SAVECNT)=(se\
lect max(B.SAVEYYMM) ,sum(B.SAVEAMT) ,count(B.EMPNO)  from PKHSVHIS B where (\
(B.EMPNO=A.EMPNO and B.SAVEBANK=A.SAVEBANK) and B.SEQNO=A.SEQNO)) where (A.SA\
VEKIND=:b0 and (A.CANYN<>'Y' and A.ENDYN<>'Y'))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )178;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)savekind;
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

         
     
     
      if  (sqlca.sqlcode != 0) 
      {
           printf("ERROR_CODE : %d, 당월 자료를 생성한다. step2-2 \n", sqlca.sqlcode);
           sprintf(log_buff, "ERROR_CODE : %d, 당월 자료를 생성한다. step2-2 \n", sqlca.sqlcode);
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           return(FAIL);
      }
     else
           return(SUCCESS);       

}


/*****************************************************************************
  당월공제금 집계
 *****************************************************************************/
process_sum()
{
     h_cnt      =0;
     h_totalamt =0;
     m_cnt      =0;
     m_totalamt =0;

     /* EXEC SQL
     SELECT  MAX(SAVEYYMM),COUNT(EMPNO),SUM(SAVEAMT),SUM(GIVEAMT)
       INTO  :h_saveyymm  , :h_cnt        ,:h_totalamt ,:h_totgiveamt
       FROM  PKHSVHIS
      WHERE  SAVEYYMM = :saveyymm
        AND  SAVEKIND = :savekind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(SAVEYYMM) ,count(EMPNO) ,sum(SAVEAMT) ,sum(G\
IVEAMT) into :b0,:b1,:b2,:b3  from PKHSVHIS where (SAVEYYMM=:b4 and SAVEKIND=\
:b5)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )197;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)h_saveyymm;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&h_cnt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&h_totalamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&h_totgiveamt;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)savekind;
     sqlstm.sqhstl[5] = (unsigned long )2;
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
          printf("ERROR_CODE : %d, 당월이력 자료 집계.... \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 당월이력 자료 집계.... \n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     };


     /* EXEC SQL
     SELECT  MAX(SAVEYYMM),COUNT(EMPNO),SUM(SAVEAMT),SUM(GIVEAMT)
       INTO  :m_saveyymm  , :m_cnt        ,:m_totalamt,:m_totgiveamt
       FROM  PKMSVMON
      WHERE  SAVEYYMM = :saveyymm
        AND  SAVEKIND = :savekind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(SAVEYYMM) ,count(EMPNO) ,sum(SAVEAMT) ,sum(G\
IVEAMT) into :b0,:b1,:b2,:b3  from PKMSVMON where (SAVEYYMM=:b4 and SAVEKIND=\
:b5)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )236;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_saveyymm;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_cnt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_totalamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_totgiveamt;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)saveyymm;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)savekind;
     sqlstm.sqhstl[5] = (unsigned long )2;
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
          printf("ERROR_CODE : %d, 당월공제 자료 집계.... \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 당월공제 자료 집계.... \n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);       

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
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )275;
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
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )316;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
