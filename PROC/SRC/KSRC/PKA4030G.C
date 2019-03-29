
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
    "pka4030g.pc"
};


static unsigned int sqlctx = 150067;


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
   unsigned char  *sqhstv[35];
   unsigned long  sqhstl[35];
            int   sqhsts[35];
            short *sqindv[35];
            int   sqinds[35];
   unsigned long  sqharm[35];
   unsigned long  *sqharc[35];
   unsigned short  sqadto[35];
   unsigned short  sqtdso[35];
} sqlstm = {12,35};

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
"select A.Empno ,A.Korname , case  when :b0=Substr(B.Empdate,1,6) then To_Nu\
mber(Substr(B.Empdate,7,2)) else 1  end  Stdd , case  when :b0=Substr(B.Retda\
te,1,6) then To_Number(Substr(B.Retdate,7,2)) else To_Number(:b2)  end  Endd \
,Nvl(DD1,'99') ,Nvl(DD2,'99') ,Nvl(DD3,'99') ,Nvl(DD4,'99') ,Nvl(DD5,'99') ,N\
vl(DD6,'99') ,Nvl(DD7,'99') ,Nvl(DD8,'99') ,Nvl(DD9,'99') ,Nvl(DD10,'99') ,Nv\
l(DD11,'99') ,Nvl(DD12,'99') ,Nvl(DD13,'99') ,Nvl(DD14,'99') ,Nvl(DD15,'99') \
,Nvl(DD16,'99') ,Nvl(DD17,'99') ,Nvl(DD18,'99') ,Nvl(DD19,'99') ,Nvl(DD20,'99\
') ,Nvl(DD21,'99') ,Nvl(DD22,'99') ,Nvl(DD23,'99') ,Nvl(DD24,'99') ,Nvl(DD25,\
'99') ,Nvl(DD26,'99') ,Nvl(DD27,'99') ,Nvl(DD28,'99') ,Nvl(DD29,'99') ,Nvl(DD\
30,'99') ,Nvl(DD31,'99')  from Pkhduty A ,Pimpmas B where ((Duyymm=:b0 and A.\
Empno=B.Empno) and A.Empno between :b4 and :b5)           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,244,0,4,130,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
40,0,0,2,326,0,3,153,0,0,0,0,0,1,0,
55,0,0,3,152,0,2,170,0,0,0,0,0,1,0,
70,0,0,4,115,0,5,183,0,0,1,1,0,1,0,1,97,0,0,
89,0,0,5,1331,0,3,195,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
124,0,0,6,826,0,9,266,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
163,0,0,6,0,0,13,278,0,0,35,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,
97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
318,0,0,6,0,0,15,290,0,0,0,0,0,1,0,
333,0,0,7,95,0,4,308,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
356,0,0,8,265,0,4,315,0,0,6,5,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
395,0,0,9,0,0,24,345,0,0,1,1,0,1,0,1,97,0,0,
414,0,0,10,124,0,4,359,0,0,4,3,0,1,0,1,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,
445,0,0,11,0,0,24,373,0,0,1,1,0,1,0,1,97,0,0,
464,0,0,12,0,0,24,394,0,0,1,1,0,1,0,1,97,0,0,
483,0,0,13,50,0,3,420,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
524,0,0,14,0,0,29,430,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* -------------------------------------------------------------------------------
 PROGRAM-NAME   : pka4030g.pc(당월근태Data생성)
 SYSTEM-NAME    : 인사
 SUBSYSTEM-NAME : 근태
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2016.10.

Update Contents
  버전    수정일      수정자   관련근거       수정내용
   1.00   2016.10.    강륜종   최초개발본
------------------------------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#define  MAXPERSON   4000

/*** 함수 Prototype 선언  ***/
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
          char  duyymm[7];     /* 기준년월     */
          char  empno[5];      /* 사번         */
          char  korname[13];   /* 성명         */
          int   stdd;          /* 월근태시작일 */
          int   endd;          /* 월근태종료일 */
          char  dd[32][3];     /* 일일근태     */
     } knte[MAXPERSON];

     char  sqlstr1[1024];
     char  tempdate[9];
     char  preyymm[7];
     char  prelastday[3];
     char  workyymm[7];
     char  lastday[3];
     char  frempno[5];
     char  toempno[5];
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

int   cnt= 0;
char  dir[80];
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 


void main(argc,argv)
int  argc;
char *argv[];
{
     char FL_file[255];
       
     if  (argc != 5) {  /* /hper/insa/HINSA/proc/bin/Kbin/pka4030g 0000 ZZZZ CRON pka4030g */
          printf("[Usage] : pka4030g 1.사번fr 2.사번to 3.CRON 4.progid\n");
          exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업*/
     STRINIT(FL_file);
     strcpy(FL_file,"pka4030g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          sprintf(log_buff, " 로그파일 생성에러로 인한 프로그램 종료..."); 
          Write_batlog(seqno++, log_buff);                                 
          error_quit("로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }

     memset(dir,'\0',sizeof(dir));
     hinsa_log_print(0,"당월 근태 생성 프로그램 시작...");
     hinsa_db_connect();  /*DB Connect 실시..*/
          
     strcpy(frempno,      argv[1]);
     strcpy(toempno,      argv[2]);
     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);

     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();

     printf("CheckDate...\n");
     CheckDate();

     printf("DutyInsert...\n");
     DutyInsert();              /*** 당월 근태 생성 ***/
        
     /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, " 근태 생성 Error "); 
          Write_batlog(seqno++, log_buff);
          error_quit(" 근태 생성 Error ");
     }
     else  
     {
          sprintf(log_buff, "OK!! 작업성공.");
          Write_batlog(seqno++, log_buff);     
          hinsa_exit(0,"OK 작업이 완료되었습니다.");
     }
}


err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

CheckDate()
{   
     memset(preyymm,'\0',sizeof(preyymm));
     memset(prelastday,'\0',sizeof(prelastday));
     memset(workyymm,'\0',sizeof(workyymm));
     memset(lastday,'\0',sizeof(lastday));
     
     /* EXEC SQL
     Select TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'), 
            TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'DD'),
            TO_CHAR(SYSDATE,'YYYYMM'), 
            TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'DD')),
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO :preyymm, :prelastday, :workyymm, :lastday, :log_rundate 
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(SYSDATE,(-1)),'YYYYMM') ,TO_C\
HAR(LAST_DAY(ADD_MONTHS(SYSDATE,(-1))),'DD') ,TO_CHAR(SYSDATE,'YYYYMM') ,TO_N\
UMBER(TO_CHAR(LAST_DAY(SYSDATE),'DD')) ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') i\
nto :b0,:b1,:b2,:b3,:b4  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)preyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)prelastday;
     sqlstm.sqhstl[1] = (unsigned long )3;
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
     sqlstm.sqhstv[3] = (unsigned char  *)lastday;
     sqlstm.sqhstl[3] = (unsigned long )3;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)log_rundate;
     sqlstm.sqhstl[4] = (unsigned long )16;
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


     
     
     printf("     preyymm[%s] prelastday[%s] workyymm[%s] lastday[%s]\n", preyymm,prelastday,workyymm,lastday);
     if  (sqlca.sqlcode != 0)
     {    
          err_print(sqlca.sqlcode," 기준일자 Read Error");
          Write_batlog(seqno++, " 기준일자 Read Error");   
          exit(1);
     }
}


DutyInsert()
{        
     
     /* EXEC   SQL   
     Insert Into Pkhduty_Record
     Select To_Char(Sysdate,'YYYYMMDDHH'), C.Num,
            'CRON', 'CRON', '퇴직일 이후 근태데이터 삭제전 백업', A.* 
       From Pkhduty A, Pimpmas B,
           (Select Nvl(Max(Recseq),0)+1 Num From Pkhduty_Record 
             Where Recdate Like To_Char(Sysdate,'YYYYMMDD')||'%') C
      Where Duyymm > Substr(Retdate,1,6) 
        And A.Empno = B.Empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into Pkhduty_Record  select To_Char(Sysdate,'YYY\
YMMDDHH') ,C.Num ,'CRON' ,'CRON' ,'퇴직일 이후 근태데이터 삭제전 백업' ,A.*  \
from Pkhduty A ,Pimpmas B ,(select (Nvl(max(Recseq),0)+1) Num  from Pkhduty_R\
ecord where Recdate like (To_Char(Sysdate,'YYYYMMDD')||'%')) C where (Duyymm>\
Substr(Retdate,1,6) and A.Empno=B.Empno)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )40;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          err_print(sqlca.sqlcode," 퇴직일 이후 근태데이터 삭제전 백업 Error");
          Write_batlog(seqno++, " 퇴직일 이후 근태데이터 삭제전 백업 Error");   
          exit(1);
     }
     
     /* EXEC   SQL   
     Delete Pkhduty
      Where (Duyymm, Empno) In (Select Duyymm, A.Empno From Pkhduty A, Pimpmas B 
                                 Where Duyymm > Substr(Retdate,1,6) 
                                   And A.Empno = B.Empno); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from Pkhduty  where (Duyymm,Empno) in (select D\
uyymm ,A.Empno  from Pkhduty A ,Pimpmas B where (Duyymm>Substr(Retdate,1,6) a\
nd A.Empno=B.Empno))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          err_print(sqlca.sqlcode," 퇴직일 이후 근태데이터 삭제 Error");
          Write_batlog(seqno++, " 퇴직일 이후 근태데이터 삭제 Error");   
          exit(1);
     }
     
     /* EXEC   SQL
     Update Pkhduty A Set (Orgnum,Deptcode)=(Select Orgnum, Jobdept From Pimpmas Where A.Empno=Empno)
      Where Duyymm =:workyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pkhduty A  set (Orgnum,Deptcode)=(select Orgnum \
,Jobdept  from Pimpmas where A.Empno=Empno) where Duyymm=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {  
          printf("workyymm[%s] frempno[%s] toempno[%s]\n", workyymm, frempno, toempno);
          err_print(sqlca.sqlcode," 기존 자료 근무부서 Update Error");
          Write_batlog(seqno++, " 기존 자료 근무부서 Update Error");   
          exit(1);
     }
     
     /* EXEC   SQL
     Insert Into Pkhduty
           (Duyymm, Empno, Korname, Orgnum, Deptcode, 
            Dd1,  Dd2,  Dd3,  Dd4,  Dd5,  Dd6,  Dd7,  Dd8,  Dd9,  Dd10, 
            Dd11, Dd12, Dd13, Dd14, Dd15, Dd16, Dd17, Dd18, Dd19, Dd20, 
            Dd21, Dd22, Dd23, Dd24, Dd25, Dd26, Dd27, Dd28, Dd29, Dd30,  Dd31, Conyn, Endyn,
            Normal  ,  Late     ,  Earleave  ,  Repoff  ,  Speoff  ,
            Satoff  ,  Domtour  ,  Seatour   ,  Corpdisp,  Domdisp ,
            Seadisp ,  Edu      ,  Lodge     ,  Special ,  Longwork,
            Pubvac  ,  Pubsick  ,  Bear      ,  Celeb   ,  Birth   ,
            Health  ,  Half     ,  Month     ,  Year    ,  Sick    ,
            Absence ,  Pubrest  ,  Sickrest  ,  Babyrest,  Milrest ,
            Stayrest,  Studyrest,  Genrest   ,  Etcrest ,  Etc1    ,
            Etc2    ,  Etc3     ,  Etc4      ,  Etc5    ,  Holiday ,
            Noinput ,  Ymdedcnt ,  Mcardedcnt,  Nopaycnt,  Realdd  ,
            Fullyn  ,  Writetime,  Writeman  ,  Contime ,  Conman  ,
            Monthdd ,  Boncode  ,  Yearhalf  ,  
            Prize   ,  Exchange ,  Exchholi  ,  Walkout ,  Workstop,
            Before  ,  Temporary,  Edupat    ,  Absence2,  Worktype,CHILDBIRTH,UNPAID)
     Select :workyymm, A.Empno, A.Korname, A.Orgnum, A.Jobdept, 
            '', '', '', '', '', '', '', '', '', '', 
            '', '', '', '', '', '', '', '', '', '', 
            '', '', '', '', '', '', '', '', '', '', '', 'N', '',
            0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0, 0, 0, 0,
            0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   0, 0, 0, 0, 0,   
            'N', To_Char(Sysdate,'YYYYMMDDHH24MISS'), 'CRON', '',  '',
            0, A.Boncode, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '',0,0
       From Pimpmas A
      Where A.Empno Not In (Select Empno From Pkhduty Where Duyymm = :workyymm) /o당월 미생성자만o/
        And A.Pstate < '80'
        And A.Empno Between :frempno And :toempno
        And Substr(A.Empdate,1,6) <= :workyymm
        And Jobpayra >= 'C11'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into Pkhduty (Duyymm,Empno,Korname,Orgnum,Deptcode,Dd1,Dd2,Dd\
3,Dd4,Dd5,Dd6,Dd7,Dd8,Dd9,Dd10,Dd11,Dd12,Dd13,Dd14,Dd15,Dd16,Dd17,Dd18,Dd19,\
Dd20,Dd21,Dd22,Dd23,Dd24,Dd25,Dd26,Dd27,Dd28,Dd29,Dd30,Dd31,Conyn,Endyn,Norm\
al,Late,Earleave,Repoff,Speoff,Satoff,Domtour,Seatour,Corpdisp,Domdisp,Seadi\
sp,Edu,Lodge,Special,Longwork,Pubvac,Pubsick,Bear,Celeb,Birth,Health,Half,Mo\
nth,Year,Sick,Absence,Pubrest,Sickrest,Babyrest,Milrest,Stayrest,Studyrest,G\
enrest,Etcrest,Etc1,Etc2,Etc3,Etc4,Etc5,Holiday,Noinput,Ymdedcnt,Mcardedcnt,\
Nopaycnt,Realdd,Fullyn,Writetime,Writeman,Contime,Conman,Monthdd,Boncode,Yea\
rhalf,Prize,Exchange,Exchholi,Walkout,Workstop,Before,Temporary,Edupat,Absen\
ce2,Worktype,CHILDBIRTH,UNPAID)select :b0 ,A.Empno ,A.Korname ,A.Orgnum ,A.J\
obdept ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,\
'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'N' ,'' ,0 ,0 ,0 ,0 \
,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,\
0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ");
     sqlstm.stmt = ",0 ,'N' ,To_Char(Sysdate,'YYYYMMDDHH24MISS') ,'CRON' ,'\
' ,'' ,0 ,A.Boncode ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,'' ,0 ,0  from Pimpmas A w\
here ((((A.Empno not  in (select Empno  from Pkhduty where Duyymm=:b0) and A.\
Pstate<'80') and A.Empno between :b2 and :b3) and Substr(A.Empdate,1,6)<=:b0)\
 and Jobpayra>='C11')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )89;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[4] = (unsigned long )7;
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

   /* 팀장이하 직책 */
     
     if  (sqlca.sqlcode != 0)
     {  
          printf("workyymm[%s] frempno[%s] toempno[%s]\n", workyymm, frempno, toempno);
          err_print(sqlca.sqlcode," 개인근태자료 생성 Error");
          Write_batlog(seqno++, " 개인근태자료 생성 Error");   
          exit(1);
     }

     printf("DutyUpdate...\n");
     DutyUpdate();
}


DutyUpdate()
{
     int i = 0;
     char empno[05];
     char kntedd[03];
     
     memset(empno,'\0',sizeof(empno));
     
     /* EXEC   SQL
     DECLARE c1 CURSOR  FOR
     Select A.Empno, A.Korname, 
            Case When (:workyymm = Substr(B.Empdate,1,6)) Then To_Number(Substr(B.Empdate,7,2)) Else 1                   End Stdd,
            Case When (:workyymm = Substr(B.Retdate,1,6)) Then To_Number(Substr(B.Retdate,7,2)) Else To_Number(:lastday) End Endd,
            Nvl(DD1, '99'), Nvl(DD2, '99'), Nvl(DD3, '99'), Nvl(DD4, '99'), Nvl(DD5, '99'),
            Nvl(DD6, '99'), Nvl(DD7, '99'), Nvl(DD8, '99'), Nvl(DD9, '99'), Nvl(DD10,'99'),
            Nvl(DD11,'99'), Nvl(DD12,'99'), Nvl(DD13,'99'), Nvl(DD14,'99'), Nvl(DD15,'99'),
            Nvl(DD16,'99'), Nvl(DD17,'99'), Nvl(DD18,'99'), Nvl(DD19,'99'), Nvl(DD20,'99'),
            Nvl(DD21,'99'), Nvl(DD22,'99'), Nvl(DD23,'99'), Nvl(DD24,'99'), Nvl(DD25,'99'),
            Nvl(DD26,'99'), Nvl(DD27,'99'), Nvl(DD28,'99'), Nvl(DD29,'99'), Nvl(DD30,'99'), Nvl(DD31,'99')
       From Pkhduty A, Pimpmas B
      Where Duyymm  = :workyymm  
        And A.Empno = B.Empno 
        And A.Empno Between :frempno And :toempno; */ 

     
     /* EXEC SQL open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )124;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)lastday;
     sqlstm.sqhstl[2] = (unsigned long )3;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[3] = (unsigned long )7;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  
          err_print(sqlca.sqlcode," 개인근태자료 Read Error");
          Write_batlog(seqno++, " 개인근태자료 Read Error");   
          exit(1);
     }
     
     cnt = 1;
     while(1)
     {
          /* EXEC SQL FETCH c1 INTO
          :knte[cnt].empno,  :knte[cnt].korname,
          :knte[cnt].stdd,   :knte[cnt].endd,
          :knte[cnt].dd[1],  :knte[cnt].dd[2],  :knte[cnt].dd[3],  :knte[cnt].dd[4],  :knte[cnt].dd[5],
          :knte[cnt].dd[6],  :knte[cnt].dd[7],  :knte[cnt].dd[8],  :knte[cnt].dd[9],  :knte[cnt].dd[10],
          :knte[cnt].dd[11], :knte[cnt].dd[12], :knte[cnt].dd[13], :knte[cnt].dd[14], :knte[cnt].dd[15],
          :knte[cnt].dd[16], :knte[cnt].dd[17], :knte[cnt].dd[18], :knte[cnt].dd[19], :knte[cnt].dd[20],
          :knte[cnt].dd[21], :knte[cnt].dd[22], :knte[cnt].dd[23], :knte[cnt].dd[24], :knte[cnt].dd[25],
          :knte[cnt].dd[26], :knte[cnt].dd[27], :knte[cnt].dd[28], :knte[cnt].dd[29], :knte[cnt].dd[30], :knte[cnt].dd[31]; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )163;
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
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(knte[cnt].stdd);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(knte[cnt].endd);
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)(knte[cnt].dd)[1];
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)(knte[cnt].dd)[2];
          sqlstm.sqhstl[5] = (unsigned long )3;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)(knte[cnt].dd)[3];
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)(knte[cnt].dd)[4];
          sqlstm.sqhstl[7] = (unsigned long )3;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)(knte[cnt].dd)[5];
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)(knte[cnt].dd)[6];
          sqlstm.sqhstl[9] = (unsigned long )3;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)(knte[cnt].dd)[7];
          sqlstm.sqhstl[10] = (unsigned long )3;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)(knte[cnt].dd)[8];
          sqlstm.sqhstl[11] = (unsigned long )3;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)(knte[cnt].dd)[9];
          sqlstm.sqhstl[12] = (unsigned long )3;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)(knte[cnt].dd)[10];
          sqlstm.sqhstl[13] = (unsigned long )3;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)(knte[cnt].dd)[11];
          sqlstm.sqhstl[14] = (unsigned long )3;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)(knte[cnt].dd)[12];
          sqlstm.sqhstl[15] = (unsigned long )3;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)(knte[cnt].dd)[13];
          sqlstm.sqhstl[16] = (unsigned long )3;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)(knte[cnt].dd)[14];
          sqlstm.sqhstl[17] = (unsigned long )3;
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)(knte[cnt].dd)[15];
          sqlstm.sqhstl[18] = (unsigned long )3;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)(knte[cnt].dd)[16];
          sqlstm.sqhstl[19] = (unsigned long )3;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)(knte[cnt].dd)[17];
          sqlstm.sqhstl[20] = (unsigned long )3;
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)(knte[cnt].dd)[18];
          sqlstm.sqhstl[21] = (unsigned long )3;
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)(knte[cnt].dd)[19];
          sqlstm.sqhstl[22] = (unsigned long )3;
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)(knte[cnt].dd)[20];
          sqlstm.sqhstl[23] = (unsigned long )3;
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)(knte[cnt].dd)[21];
          sqlstm.sqhstl[24] = (unsigned long )3;
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)(knte[cnt].dd)[22];
          sqlstm.sqhstl[25] = (unsigned long )3;
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)(knte[cnt].dd)[23];
          sqlstm.sqhstl[26] = (unsigned long )3;
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)(knte[cnt].dd)[24];
          sqlstm.sqhstl[27] = (unsigned long )3;
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)(knte[cnt].dd)[25];
          sqlstm.sqhstl[28] = (unsigned long )3;
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)(knte[cnt].dd)[26];
          sqlstm.sqhstl[29] = (unsigned long )3;
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)(knte[cnt].dd)[27];
          sqlstm.sqhstl[30] = (unsigned long )3;
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)(knte[cnt].dd)[28];
          sqlstm.sqhstl[31] = (unsigned long )3;
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)(knte[cnt].dd)[29];
          sqlstm.sqhstl[32] = (unsigned long )3;
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)(knte[cnt].dd)[30];
          sqlstm.sqhstl[33] = (unsigned long )3;
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)(knte[cnt].dd)[31];
          sqlstm.sqhstl[34] = (unsigned long )3;
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
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
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )318;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               cnt--;
               break;     
          }
          
          for( i = 1 ; i <= atoi(lastday) ; ++i)
          {    
               int holicnt = 0;  
               
               memset(kntedd,  '\0',sizeof(kntedd));
               memset(tempdate,'\0',sizeof(tempdate));

               sprintf(tempdate,"%.6s%02d",workyymm,i);
               sprintf(empno,"%s",knte[cnt].empno);
               
               /*휴일 & 정상 코드 업데이트*/
               if (strcmp(knte[cnt].dd[i],"99") == 0)
               {
                    /* EXEC SQL
                    Select decode(to_char(to_date(:tempdate,'YYYYMMDD'),'D'),'1','49','7','49','00')
                      INTO :kntedd
                      From DUAL; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 35;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "select decode(to_char(to_date(:b0,'YYYYM\
MDD'),'D'),'1','49','7','49','00') into :b1  from DUAL ";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )333;
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
                    sqlstm.sqhstv[1] = (unsigned char  *)kntedd;
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


                      
                    sprintf(knte[cnt].dd[i],"%s",kntedd);  

                    /* EXEC SQL
                    Select COUNT(*) into :holicnt 
                      From
                   (Select HOLIDATE
                      From PKCHOLI
                     Where HOLIDATE = :tempdate  
                     UNION
                    Select DUTYDATE
                      From PKHOLIEMP
                     Where DUTYDATE = :tempdate
                       And EMPNO    = :empno
                       And DUKIND   = '49'      /o휴일적용o/
                     MINUS
                    Select DUTYDATE
                      From PKHOLIEMP
                     Where DUTYDATE = :tempdate
                       And EMPNO    = :empno
                       And DUKIND   = '00')     /o평일적용o/   
                    ; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 35;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "select count(*)  into :b0  from (select \
HOLIDATE  from PKCHOLI where HOLIDATE=:b1 union select DUTYDATE  from PKHOLIE\
MP where ((DUTYDATE=:b1 and EMPNO=:b3) and DUKIND='49') minus select DUTYDATE\
  from PKHOLIEMP where ((DUTYDATE=:b1 and EMPNO=:b3) and DUKIND='00')) ";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )356;
                    sqlstm.selerr = (unsigned short)0;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&holicnt;
                    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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
                    sqlstm.sqhstv[2] = (unsigned char  *)tempdate;
                    sqlstm.sqhstl[2] = (unsigned long )9;
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
                    sqlstm.sqhstv[4] = (unsigned char  *)tempdate;
                    sqlstm.sqhstl[4] = (unsigned long )9;
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


                    /*printf("holicnt[%d]\n",holicnt);*/
                    if  (holicnt != 0)
                    {
                         sprintf(kntedd,"49");  
                         sprintf(knte[cnt].dd[i],"%s",kntedd);
                    }                    
                    
                    memset(sqlstr1,'\0',sizeof(sqlstr1));
                    sprintf(sqlstr1,"UPDATE Pkhduty a SET DD%-2d='%s', Writetime=To_Char(Sysdate,'YYYYMMDDHH24MISS'), Writeman='CRON' Where duyymm='%.6s' And empno='%s' ",
                                     i, knte[cnt].dd[i], workyymm, knte[cnt].empno);
                                     
                    /* EXEC SQL EXECUTE IMMEDIATE :sqlstr1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 35;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )395;
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


                    /*printf("sqlstr1[%s] empno[%s] i[%d]\n",sqlstr1, knte[cnt].empno, i);*/
                    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
                    {  
                        err_print(sqlca.sqlcode,"휴일코드 Setting Error");
                        Write_batlog(seqno++, "사번[%s] 휴일코드 Setting Error",knte[cnt].empno);  
                        exit(1);
                    }
               }
               
               
               /*전월 말일 교대근무자 : 당월 1일 비번 Setting (단, 기등록된 Data 있을시 Update 안함) (이명노M 2016.10.17)*/
               if ( (i == 1) && ( (strcmp(knte[cnt].dd[i],"99") == 0) || (strcmp(knte[cnt].dd[i],"00") == 0) ) )
               {
                    /* EXEC SQL
                    Select Decode(decode(:prelastday,28,DD28,29,DD29,30,DD30,31,DD31),'06','07')
                      INTO :kntedd
                      From Pkhduty
                     Where Duyymm=:preyymm And Empno=:empno; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 35;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "select Decode(decode(:b0,28,DD28,29,DD29\
,30,DD30,31,DD31),'06','07') into :b1  from Pkhduty where (Duyymm=:b2 and Emp\
no=:b3)";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )414;
                    sqlstm.selerr = (unsigned short)0;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)prelastday;
                    sqlstm.sqhstl[0] = (unsigned long )3;
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)kntedd;
                    sqlstm.sqhstl[1] = (unsigned long )3;
                    sqlstm.sqhsts[1] = (         int  )0;
                    sqlstm.sqindv[1] = (         short *)0;
                    sqlstm.sqinds[1] = (         int  )0;
                    sqlstm.sqharm[1] = (unsigned long )0;
                    sqlstm.sqadto[1] = (unsigned short )0;
                    sqlstm.sqtdso[1] = (unsigned short )0;
                    sqlstm.sqhstv[2] = (unsigned char  *)preyymm;
                    sqlstm.sqhstl[2] = (unsigned long )7;
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


                      
                    sprintf(knte[cnt].dd[i],"%s",kntedd);
               
                    if (strcmp(kntedd,"07") == 0)
                    {
                        memset(sqlstr1,'\0',sizeof(sqlstr1));
                        sprintf(sqlstr1,"UPDATE Pkhduty a SET DD%-2d='%s', Writetime=To_Char(Sysdate,'YYYYMMDDHH24MISS'), Writeman='CRON' Where duyymm='%.6s' And empno='%s'",
                                         i, knte[cnt].dd[i], workyymm, knte[cnt].empno);
                                         
                        /* EXEC SQL EXECUTE IMMEDIATE :sqlstr1; */ 

{
                        struct sqlexd sqlstm;
                        sqlstm.sqlvsn = 12;
                        sqlstm.arrsiz = 35;
                        sqlstm.sqladtp = &sqladt;
                        sqlstm.sqltdsp = &sqltds;
                        sqlstm.stmt = "";
                        sqlstm.iters = (unsigned int  )1;
                        sqlstm.offset = (unsigned int  )445;
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


                        /*printf("sqlstr1[%s]empno[%s]i[%d]\n",sqlstr1,knte[cnt].empno,i);*/
                        if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
                        {  
                            err_print(sqlca.sqlcode,"비번 Setting Error");
                            Write_batlog(seqno++, "사번[%s] 비번 Setting Error",knte[cnt].empno);  
                            exit(1);
                        }
                    }
               }
               
               
               /*신규입사 & 퇴직자 : 불입처리*/
               if ( ( (i < knte[cnt].stdd) && (strcmp(knte[cnt].dd[i],"49") != 0) && (strcmp(knte[cnt].dd[i],"97") != 0) ) || 
                    ( (i > knte[cnt].endd) && (strcmp(knte[cnt].dd[i],"49") != 0) && (strcmp(knte[cnt].dd[i],"97") != 0) ) )
               {
                    sprintf(knte[cnt].dd[i],"97");   
                    memset(sqlstr1,'\0',sizeof(sqlstr1));            
                    sprintf(sqlstr1,"UPDATE Pkhduty a SET DD%-2d='%s', Writetime=To_Char(Sysdate,'YYYYMMDDHH24MISS'), Writeman='CRON' Where duyymm='%.6s' And empno='%s' ",
                                     i, knte[cnt].dd[i], workyymm, knte[cnt].empno);
                                     
                    /* EXEC SQL EXECUTE IMMEDIATE :sqlstr1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 35;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )464;
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

                         
                    /*printf("sqlstr1[%s]empno[%s]i[%d]\n",sqlstr1,knte[cnt].empno,i);*/
                    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
                    {  
                        err_print(sqlca.sqlcode," 근태코드 불입 Setting Error");
                        Write_batlog(seqno++, "사번[%s] 근태코드 불입 Setting Error",knte[cnt].empno);  
                        exit(1);
                    }
               }
          }
          
          cnt++;
          
          if  (cnt > MAXPERSON)
          {
               printf("작업인원이 %d명을 초과합니다. \n",MAXPERSON);
               sprintf(log_buff, "작업인원이 %d명을 초과합니다. \n",MAXPERSON); 
               Write_batlog(seqno++, log_buff);                                
               exit(0);  
          }
          
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
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )483;
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
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )524;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
