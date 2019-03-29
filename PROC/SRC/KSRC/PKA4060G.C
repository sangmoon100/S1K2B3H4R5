
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
    "pka4060g.pc"
};


static unsigned int sqlctx = 150163;


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

 static char *sq0014 = 
"select dukind ,duname ,dufldnm ,maxkind ,maxcnt1 ,maxcnt2 ,yemonyn ,mcaryn \
,conmcaryn  from PKCDUCOD            ";

 static char *sq0015 = 
"select A.empno ,A.korname ,b.paycl ,dd1 ,dd2 ,dd3 ,dd4 ,dd5 ,dd6 ,dd7 ,dd8 \
,dd9 ,dd10 ,dd11 ,dd12 ,dd13 ,dd14 ,dd15 ,dd16 ,dd17 ,dd18 ,dd19 ,dd20 ,dd21 \
,dd22 ,dd23 ,dd24 ,dd25 ,dd26 ,dd27 ,dd28 ,dd29 ,dd30 ,dd31  from PKHDUTY a ,\
PIMPMAS b where (((duyymm=:b0 and a.empno=b.empno) and A.EMPNO between :b1 an\
d :b2) and ((A.conyn='Y' and A.duyymm>'200209') or A.duyymm<='200209'))      \
     ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,160,0,5,172,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
32,0,0,2,34,0,5,220,0,0,1,1,0,1,0,1,97,0,0,
51,0,0,3,32,0,5,230,0,0,1,1,0,1,0,1,97,0,0,
70,0,0,4,69,0,2,246,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
97,0,0,5,1442,0,3,256,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
132,0,0,6,167,0,5,311,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
159,0,0,7,101,0,4,387,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,
194,0,0,8,55,0,4,420,0,0,1,0,0,1,0,2,97,0,0,
213,0,0,9,53,0,4,427,0,0,1,0,0,1,0,2,97,0,0,
232,0,0,10,81,0,4,442,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
255,0,0,11,75,0,4,472,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
278,0,0,12,65,0,4,480,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
301,0,0,13,57,0,4,489,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
324,0,0,14,112,0,9,508,0,0,0,0,0,1,0,
339,0,0,14,0,0,13,518,0,0,9,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,
0,2,3,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
390,0,0,14,0,0,15,528,0,0,0,0,0,1,0,
405,0,0,15,388,0,9,550,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
432,0,0,15,0,0,13,561,0,0,34,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,
97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,
583,0,0,15,0,0,15,587,0,0,0,0,0,1,0,
598,0,0,16,80,0,5,662,0,0,4,4,0,1,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
629,0,0,17,0,0,24,687,0,0,1,1,0,1,0,1,97,0,0,
648,0,0,18,185,0,5,706,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
675,0,0,19,139,0,5,717,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
702,0,0,20,156,0,5,725,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
729,0,0,21,0,0,17,756,0,0,1,1,0,1,0,1,97,0,0,
748,0,0,21,0,0,45,759,0,0,0,0,0,1,0,
763,0,0,21,0,0,13,771,0,0,1,0,0,1,0,2,3,0,0,
782,0,0,22,136,0,4,802,0,0,3,2,0,1,0,1,97,0,0,2,3,0,0,1,97,0,0,
809,0,0,23,50,0,3,818,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
850,0,0,24,0,0,29,828,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* -------------------------------------------------------------------------------
 PROGRAM-NAME   : PKA4060G(근태집계) - 사원범위 지정
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여공통기준
 Programmer     : 이인환
 Version        : 10.01
 Date           : 1998.05.16

Update Contents
  버전    수정일      수정자   관련근거       수정내용
   1.00   1997.02.16  이인환   설계명세서     최초개발본  
  10.01   1998.05.19  이랑교   전1998.05.13   반연차항목추가
  10.02   1999.07.06  이랑교   전1999.06.25   1년 계약직 사원 식교비 공제 근태 항목 추가
  10.03   2001.11.15  유효성                  반연차 평일사용시 식교비공제 안함  
  20.00   2004.02.24  강륜종(dsa2000)         Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.  
  21.00   2004.11.    강륜종(dsa2000)         Rexec대체 서비스를 위한 수정작업.  
------------------------------------------------------------------------------- */
#include <stdio.h>

/*dsa2000  추가.. 2004.02.03.*/
#include <stdlib.h>
/*#include <sqlca.h>
#include <sqlda.h>
#include <sqlcpr.h> */
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
/*dsa2000  추가..End.......*/

#define  MAXPERSON   4000

/*** 함수 Prototype 선언  ***/
/*int Get_mcYN(char *workyymm,int dd);*/

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

     struct 
     {
          char  duyymm[7];     /* 기준년월               */
          char  empno[5];      /* 사번                   */ 
          char  paycl[4];      /* BAND INFRA             */
          char  korname[10];                             
          char  dd[32][3];     /* 일일근태               */
          int   gubun[100];                              
          int   gubun2[100];   /* 반월차 사용시          */ 
          int   ymdedcnt;      /* 연월차 공제일수        */
          int   mcardedcnt;    /* 식교비 공제일수        */
          int   conmcardedcnt; /* 계약직 식교비 공제일수 */ 
     } knte[MAXPERSON];
     
     struct 
     {
          char   dukind[3];
          char   duname[13];
          char   dufldnm[13];
          char   yemonyn[2];
          char   mcaryn[2];
          char   conmcaryn[2];
          char   maxkind[2];
          int    maxcnt1;
          int    maxcnt2;
     } kntecode[100];
     
     char  sqlstr[1024];
     char  sqlstr1[1024];
     char  DayOfWeek[10];
     char  tempdate[9];
     char  knteyymm[7];
     char  workyymm[7];
     char  LastDay[3];
     char  HoliDate[9];
     char  duyy[5];
     int   checksum;
     char  sstime[15];
     char  empno[5];
     char  frempno[5];
     char  toempno[5];
     char  pname[20];
     /*int  pid; */
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

enum  { WEEKDAY=0, SAT=1, SUN=2 } day[33];

int   cnt=0;
int   codecnt=0;
int   id;
char  dir[80];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

/* 일반직 관리자 확인 필드 */
char  YManager[2]             = "N";    

void main(argc,argv)
int  argc;
char *argv[];
{
     char time[50];
     char FL_file[255];
       
     if  (argc != 9) {  /* /hper/insa/HINSA/proc/bin/Kbin/pka4060g 200801 Y N 2141 pka4060g 2004110100000 0000 Z999*/
          printf("[Usage] : pka4060g 1.작업월 2.월마감여부[Y/N] 3.연간집계여부[Y/N] \n");
          printf("[Usage] :          4.작업자 5.progid 6.시작시간[YYYYMMDDHHMISS]  \n");
          exit(1);
     }
  
     /*로그 디렉토리 생성 및 로그작업*/
     STRINIT(FL_file);
     strcpy(FL_file,"pka4060g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          sprintf(log_buff, " 로그파일 생성에러로 인한 프로그램 종료..."); 
          Write_batlog(seqno++, log_buff);                                 
          error_quit("로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }

     memset(dir,'\0',sizeof(dir));
     hinsa_log_print(0,"근태집계 프로그램 시작...");
     hinsa_db_connect();  /*DB Connect 실시..*/
          
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
  
     sprintf(empno  , "%s",argv[4]);
     sprintf(pname  , "%s",argv[5]);
     sprintf(sstime , "%s",argv[6]);
     sprintf(frempno, "%s",argv[7]);
     sprintf(toempno, "%s",argv[8]);
     
     /*pid = getpid();*/ 
     /*EXEC SQL
     SELECT pid
     INTO   :pid
     FROM   pkcproc
     WHERE  pname=:pname and stime=:sstime and empno=:empno;
     if (sqlca.sqlcode == 0)
     {   error_quit("다른사용자가 이미 작업을 수행하고 있습니다."); 
           }
     
     EXEC SQL
     INSERT INTO PKCPROC (pname,stime,empno,pid)
     values (:pname,:sstime,:empno,:pid);  
     if (sqlca.sqlcode != 0)   
     {   error_quit("PID 정보 삽입 ERROR");
     } */

     
     DPsys_date(time,0);
     sprintf(workyymm,"%6s",argv[1]);

     /* 2016.09.26 eyha 근태 결재 Y처리 */     
     /* EXEC SQL
     UPDATE PKHDUTY
        SET conyn   = 'Y',
            contime = to_char(sysdate,'yyyymmddhh24mi'),
            conman = 'admi'
     WHERE duyymm = :workyymm 
     	AND  EMPNO between :frempno and :toempno 
      AND  nvl(conyn,'N') <>'Y'		
      ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHDUTY  set conyn='Y',contime=to_char(sysdate,'\
yyyymmddhh24mi'),conman='admi' where ((duyymm=:b0 and EMPNO between :b1 and :\
b2) and nvl(conyn,'N')<>'Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
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


     	
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {   error_quit("근태 자동 결재처리 ERROR."); 
     }
                    
     KnteJibge();                    /***    근태집계     ***/
     
     /* 2016.10.17 eyha 델파이에서 처리로 주석 처리  */
     /* if  (strcmp(argv[2],"Y")==0)   월마감 여부가 Y이면 */
     /*     MonthEnd();   */
           
     if  (strcmp(argv[3],"Y")==0)  /* 년간집계여부가 Y이면 */
          KnteYearSum();
     
     /* Dsa2000   2003.07.10. 막음
     EXEC SQL DELETE FROM pkcproc    
     WHERE  pname=:pname and stime=:sstime and empno=:empno;
     EXEC SQL commit;
     sys_date(time,0);*/
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, " 집계 ERROR "); 
          Write_batlog(seqno++, log_buff);   
          error_quit(" 집계 ERROR ");
     }
     else  
     {
          sprintf(log_buff, "OK!! 작업성공.");
          Write_batlog(seqno++, log_buff);     
          hinsa_exit(0,"OK 작업이 완료되었습니다.");
     }
}


MonthEnd()
{
     if  (strcmp(YManager,"Y",1)==0) {
          /* EXEC SQL
          UPDATE  PKCPBAS
             SET  Y_KNTEYYMM = :workyymm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKCPBAS  set Y_KNTEYYMM=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )32;
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


          if ( sqlca.sqlcode != 0)
          {    err_print(sqlca.sqlcode,"월 마감 작업 ERROR");
               exit(1);
          }  
     }
     else 
     {
          /* EXEC SQL
          UPDATE  PKCPBAS
             SET  knteyymm = :workyymm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKCPBAS  set knteyymm=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )51;
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


          if ( sqlca.sqlcode != 0)
          {    err_print(sqlca.sqlcode,"월 마감 작업 ERROR");
               exit(1);
          }
     }
}


KnteYearSum()
{
     memset(duyy,'\0',sizeof(duyy));	
     sprintf(duyy,"%.4s",workyymm);

     /* EXEC SQL
     DELETE FROM PKHDUSUM
      WHERE  duyy=:duyy
        and EMPNO between :frempno and :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHDUSUM  where (duyy=:b0 and EMPNO betwee\
n :b1 and :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)duyy;
     sqlstm.sqhstl[0] = (unsigned long )5;
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

 /*2013.06.24.hjku. 누락분 추가*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"근태연간집계 삭제 ERROR");
          Write_batlog(seqno++, "근태연간집계 삭제  ERROR");   
          exit(1);
     }
     
     /* EXEC SQL
     INSERT INTO PKHDUSUM
            (duyy,empno,korname,
             normal,late,earleave,repoff,
             speoff,satoff,domtour,seatour,
             corpdisp,domdisp,seadisp,
             edu,lodge,special,longwork,
             pubvac,pubsick,childbirth,unpaid,
             bear,celeb,birth,health,
             half,month,year,sick,absence,
             /o 10.01       1998.05.16         이랑교          수정            전(1998.05.14) o/
             yearhalf,                             
             pubrest,sickrest,babyrest,milrest,
             stayrest,studyrest,genrest,etcrest,
             etc1,etc2,etc3,etc4,etc5,
             holiday,noinput,edupat,
             /o 2007.03.14 근태코드추가 by JSo/
             workstop, before, temporary,
             ymdedcnt,mcardedcnt,nopaycnt,realdd,
             monthcnt,lsummm,
             writetime, writeman )
     SELECT  :duyy, A.empno,max(A.korname) korname,     /o 2016.09.27 eyha 사번만 체크 A.korname -> max(A.korname) o/
             sum(normal),sum(late),sum(earleave),sum(repoff),
             sum(speoff),sum(satoff),sum(domtour),sum(seatour),
             sum(corpdisp),sum(domdisp),sum(seadisp),
             sum(edu),sum(lodge),sum(special),sum(longwork),
             sum(pubvac),sum(pubsick),sum(childbirth),sum(unpaid),
             sum(bear),sum(celeb),sum(birth),sum(health),
             sum(half),sum(month),sum(year),sum(sick),sum(absence),
             /o 10.01       1998.05.16         이랑교          수정            전(1998.05.14) o/
             sum(yearhalf),
             sum(pubrest),sum(sickrest),sum(babyrest),sum(milrest),
             sum(stayrest),sum(studyrest),sum(genrest),sum(etcrest),
             sum(etc1),sum(etc2),sum(etc3),sum(etc4),sum(etc5),
             sum(holiday),sum(noinput),sum(edupat),    /o edupat 교육파견 생성 2009,02 ktho/
             /o 2007.03.14 근태코드추가 by JSo/
             sum(workstop),sum(before),sum(temporary),
             sum(ymdedcnt),sum(mcardedcnt),sum(nopaycnt),sum(realdd),
             count(A.empno),substr(max(duyymm),5,2),
             to_char(sysdate,'yyyymmddhh24mi'), :empno 
       FROM  PKHDUTY A
      WHERE  A.duyymm like :duyy||'%' 
      	AND  EMPNO between :frempno and :toempno /o2013.06.24.hjku. 누락분 추가o/
        AND  (A.conyn ='Y' AND A.duyymm > '200209' or A.duyymm <= '200209' )                /oparksh 2002. 11. 21. 2002.10월부터 결재한 근태자료만 집계에 포함시킨다. o/
      /o 2016.09.27 eyha 사번만 체크  o/
      /o GROUP  BY A.empno,A.korname;  o/
      GROUP  BY A.empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into PKHDUSUM (duyy,empno,korname,normal,late,earleave,repoff\
,speoff,satoff,domtour,seatour,corpdisp,domdisp,seadisp,edu,lodge,special,lo\
ngwork,pubvac,pubsick,childbirth,unpaid,bear,celeb,birth,health,half,month,y\
ear,sick,absence,yearhalf,pubrest,sickrest,babyrest,milrest,stayrest,studyre\
st,genrest,etcrest,etc1,etc2,etc3,etc4,etc5,holiday,noinput,edupat,workstop,\
before,temporary,ymdedcnt,mcardedcnt,nopaycnt,realdd,monthcnt,lsummm,writeti\
me,writeman)select :b0 ,A.empno ,max(A.korname) korname ,sum(normal) ,sum(la\
te) ,sum(earleave) ,sum(repoff) ,sum(speoff) ,sum(satoff) ,sum(domtour) ,sum\
(seatour) ,sum(corpdisp) ,sum(domdisp) ,sum(seadisp) ,sum(edu) ,sum(lodge) ,\
sum(special) ,sum(longwork) ,sum(pubvac) ,sum(pubsick) ,sum(childbirth) ,sum\
(unpaid) ,sum(bear) ,sum(celeb) ,sum(birth) ,sum(health) ,sum(half) ,sum(mon\
th) ,sum(year) ,sum(sick) ,sum(absence) ,sum(yearhalf) ,sum(pubrest) ,sum(si\
ckrest) ,sum(babyrest) ,sum(milrest) ,sum(stayrest) ,sum(studyrest) ,sum(gen\
rest) ,sum(etcrest) ,sum(etc1) ,sum(etc2) ,s");
     sqlstm.stmt = "um(etc3) ,sum(etc4) ,sum(etc5) ,sum(holiday) ,sum(noinp\
ut) ,sum(edupat) ,sum(workstop) ,sum(before) ,sum(temporary) ,sum(ymdedcnt) ,\
sum(mcardedcnt) ,sum(nopaycnt) ,sum(realdd) ,count(A.empno) ,substr(max(duyym\
m),5,2) ,to_char(sysdate,'yyyymmddhh24mi') ,:b1  from PKHDUTY A where ((A.duy\
ymm like (:b0||'%') and EMPNO between :b3 and :b4) and ((A.conyn='Y' and A.du\
yymm>'200209') or A.duyymm<='200209')) group by A.empno";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )97;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)duyy;
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
     sqlstm.sqhstv[2] = (unsigned char  *)duyy;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)toempno;
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
     {    err_print(sqlca.sqlcode,"근태연간집계  ERROR");
          Write_batlog(seqno++, "근태연간집계  ERROR");   
          exit(1);
     }
     
     /* EXEC SQL
     UPDATE  PKHDUSUM a
        SET   (korname, deptcode, orgnum) 
             =(select korname, jobdept,  orgnum
                 from pimpmas b
                where a.empno=b.empno)
      WHERE  duyy = :duyy
      	AND  EMPNO between :frempno and :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHDUSUM a  set (korname,deptcode,orgnum)=(selec\
t korname ,jobdept ,orgnum  from pimpmas b where a.empno=b.empno) where (duyy\
=:b0 and EMPNO between :b1 and :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )132;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)duyy;
     sqlstm.sqhstl[0] = (unsigned long )5;
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

 /*2013.06.24.hjku. 누락분 추가*/
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

/* 근태집계... */
KnteJibge()
{    
	   /* 2017.04.04 eyha 무조건 정규직
     printf("CheckYManager\n");
     CheckYManager();   */
     
     printf("CheckDate\n");
     CheckDate();
     
     printf("SetCalendar\n");
     SetCalendar();
     
     printf("ReadKnteCode\n");
     ReadKnteCode();
     
     printf("ReadKnteData\n");
     ReadKnteData();
     
     printf("KnteSumAndCheck\n");
     KnteSumAndCheck();  /* 4분정도 소요.*/
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
     sqlstm.offset = (unsigned int  )159;
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


CheckDate()
{
     char  tmpstr[512];
     char  tempyymm[7];
     
     memset(tmpstr,'\0',sizeof(tmpstr));
     memset(tempyymm,'\0',sizeof(tempyymm));
     
     /* YManager 인경우 Y_KNTEYYMM의 날짜를 기준으로 한다 */
     if  (strcmp(YManager,"Y",1)==0) 
     {
          /* EXEC SQL
          SELECT  nvl(Y_KNTEYYMM,'000000')
            INTO  :knteyymm
            FROM  PKCPBAS; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select nvl(Y_KNTEYYMM,'000000') into :b0  from PKC\
PBAS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )194;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)knteyymm;
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


     }
     else 
     {
          /* EXEC SQL
          SELECT  nvl(knteyymm,'000000')
            INTO  :knteyymm
            FROM  PKCPBAS; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select nvl(knteyymm,'000000') into :b0  from PKCPB\
AS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )213;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)knteyymm;
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


     }
     
     if  (sqlca.sqlcode != 0)
     {    
          err_print(sqlca.sqlcode,"1. 최종근태마감월 read ERROR");
          Write_batlog(seqno++, "1. 최종근태마감월 read ERROR");   
          exit(1);
     }
     
     strcpy(tempyymm,knteyymm);
     
     /* EXEC SQL
     SELECT  TO_CHAR(ADD_MONTHS(TO_DATE(:knteyymm,'YYYYMM'),1),'YYYYMM')
       INTO  :knteyymm
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'YYYYMM'),1),'YYY\
YMM') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )232;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)knteyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)knteyymm;
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




     
     if  (strcmp(knteyymm,workyymm) < 0 )
     {  
       /* printf("[debug] : workyymm=%s  \n",workyymm);  */

          sprintf(tmpstr,"아직 마감하지 않은 년월이 존재합니다.\n최종근태 마감월 : -%4s-%.2s",tempyymm,tempyymm+4);   
          err_print(sqlca.sqlcode,tmpstr);
          Write_batlog(seqno++, tmpstr);   
          exit(1);  
     }  
}

SetCalendar()
{
     int i;
     
     for( i=0 ; i< 33 ; ++i)
          day[i] = WEEKDAY;

     memset(tempdate,'\0',sizeof(tempdate));
     memset(DayOfWeek,'\0',sizeof(DayOfWeek));
     memset(LastDay,'\0',sizeof(LastDay));
     sprintf(tempdate,"%.6s%02d",workyymm,1);
     
     /* EXEC   SQL
     SELECT   to_char(last_day(to_date(:tempdate,'YYYYMMDD')),'DD') 
     INTO   :LastDay
     FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(last_day(to_date(:b0,'YYYYMMDD')),'DD') \
into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )255;
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
          sprintf(tempdate,"%.6s%02d",knteyymm,i);
          /* EXEC   SQL
          SELECT   to_char(to_date(:tempdate,'YYYYMMDD'),'DY')
            INTO   :DayOfWeek
            FROM  DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_char(to_date(:b0,'YYYYMMDD'),'DY') into \
:b1  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )278;
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
          sqlstm.sqhstl[1] = (unsigned long )10;
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
            day[i] = SUN;
          else if(strcmp(DayOfWeek,"SAT")==0)
            day[i] = SAT;
          
          /* EXEC   SQL
          SELECT  holidate
            INTO  :HoliDate
            FROM  PKCHOLI
           WHERE  holidate = :tempdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select holidate into :b0  from PKCHOLI where holid\
ate=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )301;
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


          
          if  (sqlca.sqlcode == 0)
               day[i] = SUN;   
     } 
}

ReadKnteCode()
{
     /* EXEC  SQL
     DECLARE c0 CURSOR  FOR
     SELECT   dukind, duname, dufldnm, maxkind, maxcnt1, maxcnt2, yemonyn,
              mcaryn, conmcaryn 
     FROM  PKCDUCOD; */ 

     
     /* EXEC  SQL open C0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0014;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )324;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  
          err_print(sqlca.sqlcode," 근태구분 코드 read ERROR");
          Write_batlog(seqno++, " 근태구분 코드 read ERROR");   
          exit(1);     
     }
     
     while(1)
     {
          /* EXEC SQL FETCH C0 INTO
          :kntecode[codecnt].dukind, :kntecode[codecnt].duname, 
          :kntecode[codecnt].dufldnm, 
          :kntecode[codecnt].maxkind, :kntecode[codecnt].maxcnt1, 
          :kntecode[codecnt].maxcnt2, :kntecode[codecnt].yemonyn,
          :kntecode[codecnt].mcaryn,  :kntecode[codecnt].conmcaryn; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )339;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)(kntecode[codecnt].dukind);
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)(kntecode[codecnt].duname);
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)(kntecode[codecnt].dufldnm);
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)(kntecode[codecnt].maxkind);
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(kntecode[codecnt].maxcnt1);
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(kntecode[codecnt].maxcnt2);
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)(kntecode[codecnt].yemonyn);
          sqlstm.sqhstl[6] = (unsigned long )2;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)(kntecode[codecnt].mcaryn);
          sqlstm.sqhstl[7] = (unsigned long )2;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)(kntecode[codecnt].conmcaryn);
          sqlstm.sqhstl[8] = (unsigned long )2;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
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


          codecnt++;
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close C0; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
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


               codecnt--;
               break;
          }
     }     
}

ReadKnteData()
{
     /* EXEC   SQL
     DECLARE c1 CURSOR  FOR
     SELECT  A.empno,A.korname,b.paycl,
             dd1 ,dd2 ,dd3 ,dd4,dd5,dd6,dd7,dd8,dd9,dd10,
             dd11,dd12,dd13,dd14,dd15,dd16,dd17,dd18,dd19,dd20,
             dd21,dd22,dd23,dd24,dd25,dd26,dd27,dd28,dd29,dd30,dd31
       FROM  PKHDUTY a, PIMPMAS b
      WHERE  duyymm = :workyymm  
        and  a.empno = b.empno 
        AND  A.EMPNO between :frempno and :toempno 
        AND  ((A.conyn ='Y' AND A.duyymm > '200209') or A.duyymm <= '200209' ); */ 
 /* parksh 2002.10월부터는 결재된 근태만 인정 */
                  
     
     /* EXEC SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0015;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )405;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  
          err_print(sqlca.sqlcode," 개인근태자료 read ERROR");
          Write_batlog(seqno++, " 개인근태자료 read ERROR");   
          exit(1);
     }
     
     while(1)
     {
          /* EXEC SQL FETCH c1 INTO
          :knte[cnt].empno, :knte[cnt].korname,:knte[cnt].paycl,
          :knte[cnt].dd[1], :knte[cnt].dd[2],
          :knte[cnt].dd[3], :knte[cnt].dd[4], :knte[cnt].dd[5],
          :knte[cnt].dd[6], :knte[cnt].dd[7], :knte[cnt].dd[8],
          :knte[cnt].dd[9], :knte[cnt].dd[10],:knte[cnt].dd[11],
          :knte[cnt].dd[12],:knte[cnt].dd[13],:knte[cnt].dd[14],
          :knte[cnt].dd[15],:knte[cnt].dd[16],:knte[cnt].dd[17],
          :knte[cnt].dd[18],:knte[cnt].dd[19],:knte[cnt].dd[20],
          :knte[cnt].dd[21],:knte[cnt].dd[22],:knte[cnt].dd[23],
          :knte[cnt].dd[24],:knte[cnt].dd[25],:knte[cnt].dd[26],
          :knte[cnt].dd[27],:knte[cnt].dd[28],:knte[cnt].dd[29],
          :knte[cnt].dd[30],:knte[cnt].dd[31]; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )432;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)(knte[cnt].empno);
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)(knte[cnt].korname);
          sqlstm.sqhstl[1] = (unsigned long )10;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)(knte[cnt].paycl);
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)(knte[cnt].dd)[1];
          sqlstm.sqhstl[3] = (unsigned long )3;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)(knte[cnt].dd)[2];
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)(knte[cnt].dd)[3];
          sqlstm.sqhstl[5] = (unsigned long )3;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)(knte[cnt].dd)[4];
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)(knte[cnt].dd)[5];
          sqlstm.sqhstl[7] = (unsigned long )3;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)(knte[cnt].dd)[6];
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)(knte[cnt].dd)[7];
          sqlstm.sqhstl[9] = (unsigned long )3;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)(knte[cnt].dd)[8];
          sqlstm.sqhstl[10] = (unsigned long )3;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)(knte[cnt].dd)[9];
          sqlstm.sqhstl[11] = (unsigned long )3;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)(knte[cnt].dd)[10];
          sqlstm.sqhstl[12] = (unsigned long )3;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)(knte[cnt].dd)[11];
          sqlstm.sqhstl[13] = (unsigned long )3;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)(knte[cnt].dd)[12];
          sqlstm.sqhstl[14] = (unsigned long )3;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)(knte[cnt].dd)[13];
          sqlstm.sqhstl[15] = (unsigned long )3;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)(knte[cnt].dd)[14];
          sqlstm.sqhstl[16] = (unsigned long )3;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)(knte[cnt].dd)[15];
          sqlstm.sqhstl[17] = (unsigned long )3;
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)(knte[cnt].dd)[16];
          sqlstm.sqhstl[18] = (unsigned long )3;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)(knte[cnt].dd)[17];
          sqlstm.sqhstl[19] = (unsigned long )3;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)(knte[cnt].dd)[18];
          sqlstm.sqhstl[20] = (unsigned long )3;
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)(knte[cnt].dd)[19];
          sqlstm.sqhstl[21] = (unsigned long )3;
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)(knte[cnt].dd)[20];
          sqlstm.sqhstl[22] = (unsigned long )3;
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)(knte[cnt].dd)[21];
          sqlstm.sqhstl[23] = (unsigned long )3;
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)(knte[cnt].dd)[22];
          sqlstm.sqhstl[24] = (unsigned long )3;
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)(knte[cnt].dd)[23];
          sqlstm.sqhstl[25] = (unsigned long )3;
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)(knte[cnt].dd)[24];
          sqlstm.sqhstl[26] = (unsigned long )3;
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)(knte[cnt].dd)[25];
          sqlstm.sqhstl[27] = (unsigned long )3;
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)(knte[cnt].dd)[26];
          sqlstm.sqhstl[28] = (unsigned long )3;
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)(knte[cnt].dd)[27];
          sqlstm.sqhstl[29] = (unsigned long )3;
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)(knte[cnt].dd)[28];
          sqlstm.sqhstl[30] = (unsigned long )3;
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)(knte[cnt].dd)[29];
          sqlstm.sqhstl[31] = (unsigned long )3;
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)(knte[cnt].dd)[30];
          sqlstm.sqhstl[32] = (unsigned long )3;
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)(knte[cnt].dd)[31];
          sqlstm.sqhstl[33] = (unsigned long )3;
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


          
          cnt++;
          
          if  (cnt > MAXPERSON)
          {
               printf("작업인원이 %d명을 초과합니다. \n",MAXPERSON);
               sprintf(log_buff, "작업인원이 %d명을 초과합니다. \n",MAXPERSON); 
               Write_batlog(seqno++, log_buff);                                
               exit(0);  
          }
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 34;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )583;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               cnt--;
               break;     
          }
     }
}

KnteSumAndCheck()
{
     char  tmpstr[512];
     int  i, j, k, k2,m;
     
     /*** 개인별 근태 집계 ***/
     
     for (i=0 ; i< cnt ; ++i)
     {
          k2 =0;
     
          for (j=1 ; j<= atoi(LastDay); ++j)
          {     
               k = atoi(knte[i].dd[j]);              /* 한달치 사용근태 집계 */
               knte[i].gubun[k]++;  
     
               /* ***********************************************************************  
                 1998.05.16  이랑교 수정            전(1998.05.14)
                         평일       : 식교비공제안함    1
                         토요일,휴일: 식교비공제함      0
               * *********************************************************************** */
               m = Get_mcYN(workyymm,j);  
               

               if ((k == 61) && ( m == 1 )) k2++;  /*식교 공제안함 반월차*/                   

               /* ***********************************************************************  
                 2001.11.15  유효성                  반연차 평일사용시 식교비공제 안함
               * *********************************************************************** */                   
               if ((k == 64) && ( m == 1 )) k2++;  /*식교 공제안함 반연차*/
	
          }  /* end of month loop */


          for ( j=0 ; j< codecnt ; ++j)
          {
                k = atoi(kntecode[j].dukind);
                
                if ( kntecode[j].yemonyn[0] == 'Y') /* 연월차 공제일수 */
                     knte[i].ymdedcnt += knte[i].gubun[k];
          
                /*  식교비 공제일수  */
                if  (kntecode[j].mcaryn[0] == 'Y' )
                     knte[i].mcardedcnt += knte[i].gubun[k];
          
                /*  계약직 식교비 공제일수  */       
                if  (kntecode[j].conmcaryn[0] == 'Y' )
                     knte[i].conmcardedcnt += knte[i].gubun[k];

           }  /* end of code loop */

           /* **************************************************************************
              10.02       1999.07.06         이랑교          수정            전(1999.06.25)
                          1년 계약직 사원 식교비 공제 근태 항목 추가
           * *************************************************************************** */
           /* infra           if (knte[i].paycl == "Z1")
                              knte[i].mcardedcnt = knte[i].conmcardedcnt; */
           
           /* **************************************************************************
              10.01       1998.05.16         이랑교          수정            전(1998.05.14)
                          총식교비 공제일 - 식교비공제 안하는 일수
           * *************************************************************************** */
                      
           knte[i].mcardedcnt = knte[i].mcardedcnt - k2;
           
           /*printf("[debug in before2] : empno=%s,mcardedcnt=%f,k2=%d  \n",knte[i].empno,knte[i].mcardedcnt,k2);  */           
           
           
           /* EXEC SQL
           UPDATE PKHDUTY
              SET ymdedcnt   = :knte[i].ymdedcnt,
                  mcardedcnt = :knte[i].mcardedcnt
            WHERE duyymm = :workyymm and empno = :knte[i].empno; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 34;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "update PKHDUTY  set ymdedcnt=:b0,mcardedcnt=:b1 w\
here (duyymm=:b2 and empno=:b3)";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )598;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)&(knte[i].ymdedcnt);
           sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)&(knte[i].mcardedcnt);
           sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[1] = (         int  )0;
           sqlstm.sqindv[1] = (         short *)0;
           sqlstm.sqinds[1] = (         int  )0;
           sqlstm.sqharm[1] = (unsigned long )0;
           sqlstm.sqadto[1] = (unsigned short )0;
           sqlstm.sqtdso[1] = (unsigned short )0;
           sqlstm.sqhstv[2] = (unsigned char  *)workyymm;
           sqlstm.sqhstl[2] = (unsigned long )7;
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)(knte[i].empno);
           sqlstm.sqhstl[3] = (unsigned long )5;
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


           
           memset(sqlstr,'\0',sizeof(sqlstr));
           memset(tmpstr,'\0',sizeof(tmpstr));
           sprintf(sqlstr,"%s","update pkhduty set ");
           
           for (j=0 ; j< codecnt-1 ; ++j)
           {
                k = atoi(kntecode[j].dukind);
                sprintf(tmpstr,"%s=%d,",kntecode[j].dufldnm,knte[i].gubun[k]);
                strcat(sqlstr,tmpstr);
           }
           
           k = atoi(kntecode[j].dukind);
           sprintf(tmpstr,"%s=%d",kntecode[j].dufldnm,knte[i].gubun[k]);
           strcat(sqlstr,tmpstr);
           
           sprintf(tmpstr," where empno = '%s' and duyymm = '%s'",
           knte[i].empno,workyymm);
           strcat(sqlstr,tmpstr);
           
           /* EXEC  SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 34;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )629;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)sqlstr;
           sqlstm.sqhstl[0] = (unsigned long )1024;
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


           
           if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
           {  
                err_print(sqlca.sqlcode," 개인근태자료 갱신 ERROR");
                Write_batlog(seqno++, " 개인근태자료 갱신 ERROR");   
                exit(1);
           }
     }

     for (i = 0 ; i < cnt ; ++i)
          for (j=0 ; j< codecnt ; ++j)
          {    k = atoi(kntecode[j].dukind);
               if  (kntecode[j].maxkind[0] == 'M')
                    MonthlyCheck(i,j,k);
               if  (kntecode[j].maxkind[0] == 'Y')
                    YearlyCheck(i,j,k);
          }
     
     /* EXEC SQL
     UPDATE PKHDUTY p
        SET        (korname, orgnum, deptcode, boncode) = 
            (SELECT korname, orgnum, jobdept,  boncode
               FROM PIMPMAS r
              WHERE p.empno=r.empno)
      WHERE duyymm = :workyymm
        and empno between :frempno and :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHDUTY p  set (korname,orgnum,deptcode,boncode)\
=(select korname ,orgnum ,jobdept ,boncode  from PIMPMAS r where p.empno=r.em\
pno) where (duyymm=:b0 and empno between :b1 and :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )648;
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


     
     
     /*  당월 모든 자료를 만근여부를 'N' */
     /* EXEC SQL
     UPDATE  PKHDUTY
        SET  fullyn = 'N'
      WHERE  duyymm = :workyymm
        AND  (conyn ='Y' AND duyymm > '200209' or duyymm <= '200209' )  /o parksh 2002.10월부터 결재한 근태만 인정  o/
        and  empno between :frempno and :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHDUTY  set fullyn='N' where ((duyymm=:b0 and (\
(conyn='Y' and duyymm>'200209') or duyymm<='200209')) and empno between :b1 a\
nd :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )675;
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


     
     /*  연월제외근태사용=0 이면 당월 자료를 만근여부를 'Y' */
     /* EXEC SQL
     UPDATE  PKHDUTY
        SET  fullyn = 'Y'
      WHERE  ymdedcnt = 0 and duyymm = :workyymm
        AND  (conyn ='Y' AND duyymm > '200209' or duyymm <= '200209' )  /o parksh 2002.10월부터 결재한 근태만 인정  o/
        and  empno between :frempno and :toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHDUTY  set fullyn='Y' where (((ymdedcnt=0 and \
duyymm=:b0) and ((conyn='Y' and duyymm>'200209') or duyymm<='200209')) and em\
pno between :b1 and :b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )702;
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



}

MonthlyCheck(i,j,k)
int  i; int  j; int  k;
{
     if  (kntecode[j].maxcnt1<knte[i].gubun[k])
     {
          printf("%-12s 오류 : %s %s   사용 개수 -> %d\n",
          kntecode[j].duname, knte[i].empno, knte[i].korname, knte[i].gubun[k]);
            
          sprintf(log_buff, "%-12s 오류 : %s %s   사용 개수 -> %d\n",
                            kntecode[j].duname, knte[i].empno, knte[i].korname, knte[i].gubun[k]);  
                            Write_batlog(seqno++, log_buff);                                        
     }
}

YearlyCheck(i,j,k)
int  i; int  j; int  k;
{
  
     if  (knte[i].gubun[k] > 0)
     {
          sprintf(sqlstr1,"select sum(%s) from pkhduty where empno='%s' and duyymm like '%.4s%c'",
          kntecode[j].dufldnm, knte[i].empno,workyymm,'%');
          /* EXEC SQL PREPARE s1 FROM :sqlstr1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )729;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)sqlstr1;
          sqlstm.sqhstl[0] = (unsigned long )1024;
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


          /* EXEC SQL DECLARE c2 CURSOR for s1; */ 

          
          /* EXEC SQL OPEN c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )748;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqcmod = (unsigned int )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          
          if  (sqlca.sqlcode == 1403)
               checksum = 0;
          else if (sqlca.sqlcode != 0)
          {  
               printf(" 개인별 연제한횟수 check ERROR \n" );  
               sprintf(log_buff, " 개인별 연제한횟수 check ERROR "); 
               Write_batlog(seqno++, log_buff);                      
               exit(0);
          }
          
          /* EXEC SQL FETCH c2 INTO :checksum; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )763;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&checksum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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


               
          if  (checksum>kntecode[j].maxcnt1)
          {
               printf("%-12s 오류 : %s %s   사용 개수 -> %d\n",
               kntecode[j].duname, knte[i].empno, knte[i].korname, knte[i].gubun[k]);
               sprintf(log_buff,"%-12s 오류 : %s %s   사용 개수 -> %d\n",  
               kntecode[j].duname, knte[i].empno, knte[i].korname, knte[i].gubun[k]); 
               Write_batlog(seqno++, log_buff);          
          }
     } 
}

/* ****************************************************************************  
  function name : Get_mcYN
  parameter     : 작업월,일자
  result        : int 식교비공제여부

   10.01       1998.05.16         이랑교          수정            전(1998.05.14)
                    평일       : 식교비공제안함    1
                    토요일,휴일: 식교비공제함      0
* *************************************************************************** */
int Get_mcYN(workyymm,dd)
char *workyymm;
int dd; 
{  
     char  t_date[8+1];
     int   mcarpayyn = 0;
      
     sprintf(t_date,"%s%.02d",workyymm,dd);
     
     /* EXEC SQL
     SELECT  DECODE ( NVL(COUNT(*),0), 1,0,
                      DECODE (TO_CHAR(TO_DATE(:t_date, 'YYYYMMDD'),'d'),
                              '1',0,'7',0,
                              1)
                      )
       INTO  :mcarpayyn
       FROM  PKCHOLI
      WHERE  HOLIDATE =:t_date ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select DECODE(NVL(count(*) ,0),1,0,DECODE(TO_CHAR(TO_DA\
TE(:b0,'YYYYMMDD'),'d'),'1',0,'7',0,1)) into :b1  from PKCHOLI where HOLIDATE\
=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )782;
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
     sqlstm.sqhstv[1] = (unsigned char  *)&mcarpayyn;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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


     
     return(mcarpayyn);
}

/*=== dsa2000 2004.10. Rexec대체 서비스를 위한 Write_batlog()  ===================*/
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
     sqlstm.offset = (unsigned int  )809;
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
          return(-1);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 34;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )850;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
/*=================================================================================*/


/* ******************************************************************
 * 참고사항 : 식교비 공제 코드입니다.
 * ******************************************************************
U DUNAME       DUFLDNM      M
-- ------------ ------------ -
55 산휴         bear         Y
56 경휴         celeb        Y
57 생일         birth        Y
58 보건         health       Y
61 반차         half         Y
62 월차         month        Y
63 연차         year         Y
64 반연차       yearhalf    Y
71 병가         sick         Y
72 결근         absence      Y

82 병상         sickrest     Y
83 육아         babyrest     Y
84 병역         milrest      Y
85 기소         stayrest     Y
86 유학         studyrest    Y
87 일반         genrest      Y
89 기타         etcrest      Y
select bear+celeb+birth+health+half+month+year+yearhalf+sick+absence+
       sickrest+babyrest+milrest+stayrest+studyrest+genrest+
       etcrest mcarded,mcardedcnt
from   pkhduty
where  duyymm ='199804'
* ***************************************************************** */
