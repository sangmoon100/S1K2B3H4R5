
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
    "pkw1100g.pc"
};


static unsigned int sqlctx = 155283;


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
   unsigned char  *sqhstv[7];
   unsigned long  sqhstl[7];
            int   sqhsts[7];
            short *sqindv[7];
            int   sqinds[7];
   unsigned long  sqharm[7];
   unsigned long  *sqharc[7];
   unsigned short  sqadto[7];
   unsigned short  sqtdso[7];
} sqlstm = {12,7};

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
"select dukind ,duname ,dufldnm ,maxkind ,maxcnt1 ,maxcnt2 ,yemonyn  from PK\
HILDUCOD            ";

 static char *sq0008 = 
"select empno ,korname ,ducode ,count(*)   from pkhilduty where (dufrdate li\
ke (:b0||'%') and upper(conyn)='Y') group by empno,korname,ducode           ";

 static char *sq0011 = 
"select a.empno ,a.korname ,count(*)   from pkhilduty a ,pkhilducod b ,pkhil\
his c where ((((((dufrdate like (:b0||'%') and upper(a.conyn)='Y') and a.duco\
de=b.dukind) and a.empno=c.empno) and b.YEMONYN='N') and c.confrdate<=(:b0||'\
01')) and c.contodate>=to_char(last_day(to_date(:b0,'YYYYMM')),'YYYYMMDD')) g\
roup by a.empno,a.korname           ";

 static char *sq0018 = 
"select EMPNO  from PKHILDUSUM where DUYYMM=:b0           ";

 static char *sq0020 = 
"select EMPNO ,DUFRDATE ,DUCODE ,WEEKYN ,TO_CHAR(TO_DATE(DUFRDATE,'YYYYMMDD'\
),'iw')  from PKHILDUTY A ,PKHILDUCOD B where (((dufrdate between :b0 and :b1\
 and upper(conyn)='Y') and DUCODE=DUKIND) and EMPNO=:b2) order by DUFRDATE   \
         ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,79,0,4,132,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
28,0,0,2,110,0,5,146,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
51,0,0,3,210,0,5,162,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
78,0,0,4,32,0,5,196,0,0,1,1,0,1,0,1,97,0,0,
97,0,0,5,41,0,2,210,0,0,1,1,0,1,0,1,97,0,0,
116,0,0,6,258,0,3,220,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
139,0,0,7,95,0,9,263,0,0,0,0,0,1,0,
154,0,0,7,0,0,13,273,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,0,
2,3,0,0,2,97,0,0,
197,0,0,7,0,0,15,282,0,0,0,0,0,1,0,
212,0,0,8,151,0,9,319,0,0,1,1,0,1,0,1,97,0,0,
231,0,0,8,0,0,13,329,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,0,
262,0,0,8,0,0,15,344,0,0,0,0,0,1,0,
277,0,0,9,0,0,24,363,0,0,1,1,0,1,0,1,97,0,0,
296,0,0,10,0,0,24,385,0,0,1,1,0,1,0,1,97,0,0,
315,0,0,11,342,0,9,436,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
342,0,0,11,0,0,13,447,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,
369,0,0,11,0,0,15,452,0,0,0,0,0,1,0,
384,0,0,12,74,0,5,457,0,0,4,4,0,1,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
415,0,0,13,49,0,5,480,0,0,1,1,0,1,0,1,97,0,0,
434,0,0,14,83,0,4,492,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
457,0,0,15,73,0,4,505,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
480,0,0,16,65,0,4,521,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
503,0,0,17,75,0,4,534,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
526,0,0,18,57,0,9,553,0,0,1,1,0,1,0,1,97,0,0,
545,0,0,18,0,0,13,566,0,0,1,0,0,1,0,2,97,0,0,
564,0,0,18,0,0,15,571,0,0,0,0,0,1,0,
579,0,0,19,67,0,5,577,0,0,3,3,0,1,0,1,3,0,0,1,97,0,0,1,97,0,0,
606,0,0,20,238,0,9,617,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
633,0,0,20,0,0,13,630,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,
668,0,0,20,0,0,15,635,0,0,0,0,0,1,0,
683,0,0,21,50,0,3,682,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
724,0,0,22,0,0,29,692,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* -------------------------------------------------------------------------------
 PROGRAM-NAME   : 단기계약직 근태집계(pkw1100g)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 단기계약직 근태집계
 Programmer     : 
 Version        : 
 Date           : 

Update Contents
  버전    수정일      수정자          관련근거       수정내용
  10.01  2004.02.24  강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.    
  20.00  2004.12.29  강륜종(dsa2000)    Rexec 대체서비스를 위한 수정작업.  
------------------------------------------------------------------------------- */
#include <stdio.h>
/* Dsa2000  추가.. 2004.02.24.*/
#include <stdlib.h>
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"
#include "hinsa_macro.h"

#define  FAIL        -2
#define   MAXPERSON  9000

/*** 함수 Prototype 선언  ***/
void   print_errmsg(int errcode, char *errmsg);

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
          char   duyymm[7];    /* 기준년월   */
          char   empno[5];   /* 사번     */ 
          char   korname[10];
          char   ducode[32];   /* 일일근태   */
          int    ymdedcnt;   /* 연월차 공제일수   */ 
          int    count;
     } knte[MAXPERSON];
     
     struct 
     {
          char   dukind[3];
          char   duname[13];
          char   dufldnm[13];
          char   yemonyn[2]; 
          char   maxkind[2];
          int   maxcnt1;
          int   maxcnt2;
     } kntecode[100];
     
     char  sqlstr[1024];  
     char  tempdate[8+1];
     char  workyymmdd[8+1];
     char  workyymm[6+1];   
      
     int   hidukind  ;     
     char  hdukind[3] ;     
     char  hduname[13] ;     
     char  hdufldnm[13];     
     char  hmaxkind[2];     
     int   hmaxcnt1;     
     int   hmaxcnt2;     
     char  hyemonyn[2];     
     
     char  jobempno[5];
     char  mondate1[8+1] ;
     
     char  hempno[5] ;
     char  duempno[5] ;
     char  wweek1[3] ;
     char  siw[3] ;
     char  enddd[3] ;

/* EXEC SQL END   DECLARE SECTION; */ 

 
int  cnt=0;
int  id;
int  wwcnt   = 0 ;
int  hducode = 0 ;
int  hcount  = 0 ; 

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
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
     
     if (argc != 6) { /*  /hper8/HINSA/proc/bin/Kbin/pkw1100g 200401 Y D006 pkw1100g 2004110100000 */
              printf("[Usage] : pkw1100g 1.작업월[YYYYMM] 2.월마감여부[Y/N] 3.작업자 4.프로그램ID  5.시작시간  \n");
              exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkw1100g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/  
     /*DB_connect(id,0); */
     hinsa_log_print(0,"단기계약직 근태집계 시작...[pkw1100g]");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정 End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);
     strcpy(log_rundate,  argv[5]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     sprintf(workyymm,"%6s",argv[1]);
     sprintf(jobempno, "%s",argv[3]);   
      
     /* EXEC SQL
     SELECT  TO_CHAR(last_day(TO_DATE(:workyymm,'YYYYMM')) ,'YYYYMMDD')
       INTO  :workyymmdd
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(last_day(TO_DATE(:b0,'YYYYMM')),'YYYYMMD\
D') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyymmdd;
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


     
     if (strcmp(argv[2],"Y")==0)  /* 월마감 여부가 Y이면 */
     
     MonthEnd();                
           
     KnteInsert();
     
     KnteJibge();  
     
          /*  일단 당월 모든 자료를 만근여부를 'N' */
     /* EXEC SQL
     UPDATE  PKHILDUSUM
        SET  fullyn    = 'N',
             writetime = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),
             writeman  = :jobempno
      WHERE  duyymm   = :workyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUSUM  set fullyn='N',writetime=TO_CHAR(SYS\
DATE,'YYYYMMDDHH24MISSD'),writeman=:b0 where duyymm=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"만근여부 UPDATE ERROR 1");
          Write_batlog(seqno++, "만근여부 UPDATE ERROR 1");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
      
     
     /*  연월제외근태사용=0 이면 당월 자료를 만근여부를 'Y' */
     /* EXEC SQL
     UPDATE  PKHILDUSUM
        SET  fullyn = 'Y'
      WHERE  ymdedcnt = 0 and duyymm = :workyymm
        and  empno in ( select  empno 
                          from  pkhilhis 
                         where  confrdate <= :workyymm||'01'
                           and  contodate >= to_char(last_day(to_date(:workyymm, 'YYYYMM')), 'YYYYMMDD' )) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUSUM  set fullyn='Y' where ((ymdedcnt=0 an\
d duyymm=:b0) and empno in (select empno  from pkhilhis where (confrdate<=(:b\
0||'01') and contodate>=to_char(last_day(to_date(:b0,'YYYYMM')),'YYYYMMDD')))\
)";
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
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"만근여부 UPDATE ERROR 2");
          Write_batlog(seqno++, "만근여부 UPDATE ERROR 2");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
           
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [단기계약직 근태집계 작업성공] =====\n");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [단기계약직 근태집계 작업성공] =====\n");   
     }
  
}

MonthEnd()
{
     /* EXEC SQL
     UPDATE  PKCPBAS
        SET  ilfixmon = :workyymmdd; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKCPBAS  set ilfixmon=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )78;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"월 마감 작업 ERROR");
          error_quit("작업실패...");  
     } 
}


KnteInsert()
{
  
     /* EXEC SQL
     DELETE FROM PKHILDUSUM
      WHERE  duyymm=:workyymm ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHILDUSUM  where duyymm=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )97;
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
          print_errmsg(sqlca.sqlcode,"PKHILDUSUM 삭제 ERROR");
          Write_batlog(seqno++, "PKHILDUSUM 삭제 ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }   
     
     /* EXEC SQL
     INSERT INTO PKHILDUSUM
     (  DUYYMM     ,             /o기준년도            o/
        EMPNO      ,             /o사번                o/
        KORNAME    ,             /o성명                o/
        ORGNUM     ,             /o조직차수            o/
        DEPTCODE  )              /o부서코드            o/   
     SELECT   :workyymm, A.empno,A.korname  , orgnum, deptcode  
      FROM   PKHILHIS  A
     WHERE   upper(a.batchpayyn) = 'Y'
       and   a.empno in (select empno from pkhilduty where substr(dufrdate,1,6) = :workyymm and upper(conyn) ='Y') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHILDUSUM (DUYYMM,EMPNO,KORNAME,ORGNUM,DEP\
TCODE)select :b0 ,A.empno ,A.korname ,orgnum ,deptcode  from PKHILHIS A where\
 (upper(a.batchpayyn)='Y' and a.empno in (select empno  from pkhilduty where \
(substr(dufrdate,1,6)=:b0 and upper(conyn)='Y')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )116;
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

  
                        
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"INSERT INTO PKHILDUSUM ERROR");
          Write_batlog(seqno++, "INSERT INTO PKHILDUSUM ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
}


KnteJibge()
{

     ReadKnteCode();  
     
     ReadKnteData();  
     
     KnteGongje();
     
     GetStartDate(); 
     
     GetWeekcnt(); 
}


ReadKnteCode()
{
     /* EXEC  SQL
     DECLARE c0 CURSOR  FOR
     SELECT  dukind, duname, dufldnm, maxkind, maxcnt1, maxcnt2, yemonyn
       FROM  PKHILDUCOD; */ 

     
     /* EXEC  SQL open C0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )139;
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
          print_errmsg(sqlca.sqlcode,"PKHILDUCOD READ ERROR");
          Write_batlog(seqno++, "PKHILDUCOD READ ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
     
     while(1)
     {
          /* EXEC SQL FETCH C0 INTO
          :hdukind,  :hduname,
          :hdufldnm, 
          :hmaxkind, :hmaxcnt1, 
          :hmaxcnt2, :hyemonyn; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )154;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)hdukind;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)hduname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)hdufldnm;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)hmaxkind;
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&hmaxcnt1;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&hmaxcnt2;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)hyemonyn;
          sqlstm.sqhstl[6] = (unsigned long )2;
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


          
             
          if(sqlca.sqlcode == 1403)
          {
            /* EXEC SQL close C0; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 7;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )197;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
            break;
          }
          
          hidukind = atoi(hdukind) ;
          
          sprintf(kntecode[hidukind].dukind,"%s", hdukind ) ;       
          sprintf(kntecode[hidukind].duname,  "%s" , hduname ) ; 
          sprintf(kntecode[hidukind].dufldnm, "%s" , hdufldnm) ; 
          sprintf(kntecode[hidukind].maxkind, "%s" , hmaxkind) ;
          sprintf(kntecode[hidukind].yemonyn, "%s" , hyemonyn);
          
          kntecode[hidukind].maxcnt1 =  hmaxcnt1 ; 
          kntecode[hidukind].maxcnt2 =  hmaxcnt2 ; 
      
     }     
}

ReadKnteData()
{                       
     char  tmpstr[512];
     char  maxstr[512];
     int     checksum = 0 ;
     
     memset(hempno,'\0',sizeof(hempno));
     memset(sqlstr,'\0',sizeof(sqlstr));
     memset(tmpstr,'\0',sizeof(tmpstr));   
     memset(maxstr,'\0',sizeof(maxstr));   
                
        
     /* EXEC   SQL
     DECLARE c1 CURSOR  FOR
     select  empno, korname, ducode, count(*) from pkhilduty 
      where  dufrdate like :workyymm||'%'  
        and  upper(conyn) ='Y'
      group  by empno, korname, ducode; */ 

           
     /* EXEC  SQL  open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )212;
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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  print_errmsg(sqlca.sqlcode,"PKHILDUTY READ ERROR");
      /*Write_batlog(seqno++, "PKHILDUTY READ ERROR");   dsa2000 Rexec 대체*/
      error_quit("작업실패...");  
     }
     
     while(1)
     {
          /* EXEC SQL FETCH c1 INTO
          :knte[cnt].empno,  :knte[cnt].korname,
          :knte[cnt].ducode, :knte[cnt].count ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )231;
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
          sqlstm.sqhstv[2] = (unsigned char  *)(knte[cnt].ducode);
          sqlstm.sqhstl[2] = (unsigned long )32;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(knte[cnt].count);
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
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


                       
          
          if  (cnt > MAXPERSON)
          {
               printf("작업건이 %d건을 초과합니다. \n",MAXPERSON);
               sprintf(log_buff, "작업건이 %d건을 초과합니다. \n",MAXPERSON);
               /*Write_batlog(seqno++, log_buff);   dsa2000 Rexec 대체*/
               exit(0);
          }
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )262;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               cnt--;
               break;     
          } 
          
          hducode = atoi(knte[cnt].ducode) ;  
          hcount  = knte[cnt].count;   
                                    
          sprintf (hempno,"%s", knte[cnt].empno ) ;
             
          sprintf(sqlstr,"%s","update pkhildusum set ");
          sprintf(tmpstr,"%s=%d",kntecode[hducode].dufldnm, hcount ) ;         
          strcat(sqlstr,tmpstr);
          
          sprintf(tmpstr," where empno = '%s' and duyymm = '%s'",
                  hempno, workyymm);
          strcat(sqlstr,tmpstr);
                       
                       
          /* EXEC  SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )277;
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
               print_errmsg(sqlca.sqlcode,"UPDATE PKHILDUSUM ERROR");
               /*Write_batlog(seqno++, "UPDATE PKHILDUSUM ERROR");   dsa2000 Rexec 대체*/
               error_quit("작업실패...");  
          }
             
          /*max 값 check start */
          if  (kntecode[hducode].maxkind[0] == 'M')              
          {    if  (kntecode[hducode].maxcnt1< hcount)
                    printf("%-12s 오류 : %s %s   사용 개수 -> %d\n",
                            kntecode[hducode].duname, knte[cnt].empno, knte[cnt].korname, hcount);
          }   
             
             
          if  (kntecode[hducode].maxkind[0] == 'Y')                 
          {      
               sprintf(maxstr, "select sum(%s) into :checksum from pkhildusum where empno='%s' and duyymm like '%.4s%c'",
                                kntecode[hducode].dufldnm, knte[cnt].empno,workyymm,'%');
               
               /* EXEC  SQL EXECUTE IMMEDIATE :maxstr; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )296;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)maxstr;
               sqlstm.sqhstl[0] = (unsigned long )512;
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

                
                            
               if  (checksum > kntecode[hducode].maxcnt1)
                    printf("%-12s 오류 : %s %s   사용 개수 -> %d\n",
                            kntecode[hducode].duname, knte[cnt].empno, knte[cnt].korname, checksum);
          }
                 /*max 값 check end */             
          cnt++;     
     }
}

KnteGongje()
{
     char gempno[5]   ;
     char gkorname[11] ;
     char gducode[3]  ;
     int  gcount = 0 ;
     int  cnt_month = 0;
                     
     sprintf(enddd, "%2s", workyymmdd+6);         
     cnt_month = atoi(enddd);
        
      /*printf("%s", enddd); */
        
      /*EXEC   SQL
        DECLARE c5 CURSOR  FOR
        select a.empno, a.korname, a.ducode, count(*)  
                from pkhilduty a, pkhilducod b , pkhilhis c
               where dufrdate like :workyymm||'%'
                 and   upper(a.conyn) ='Y'
           and   a.ducode = b.dukind
           and   a.empno = c.empno
           and   b.YEMONYN ='Y'
           and   c.confrdate <= :workyymm||'01'
           and   c.contodate >= to_char(last_day(to_date(:workyymm, 'YYYYMM')), 'YYYYMMDD' )
        group by a.empno, a.korname, a.ducode;   */
        
     /* EXEC   SQL
     DECLARE c5 CURSOR  FOR        
      select  a.empno, a.korname, count(*)  
        from  pkhilduty a, pkhilducod b , pkhilhis c
       where  dufrdate like :workyymm||'%'
         and  upper(a.conyn) ='Y'
         and  a.ducode = b.dukind
         and  a.empno = c.empno
         and  b.YEMONYN ='N'
         and  c.confrdate <= :workyymm||'01'
         and  c.contodate >= to_char(last_day(to_date(:workyymm, 'YYYYMM')), 'YYYYMMDD' )
       group  by a.empno, a.korname ; */ 

   

     /* EXEC  SQL  open c5; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0011;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )315;
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
     sqlstm.sqhstv[2] = (unsigned char  *)workyymm;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  
          print_errmsg(sqlca.sqlcode,"월차공제 READ ERROR");
          Write_batlog(seqno++, "월차공제 READ ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }  
     
     while(1)
     {
          /* EXEC SQL FETCH c5 INTO
          :gempno,  :gkorname, :gcount ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )342;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)gempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)gkorname;
          sqlstm.sqhstl[1] = (unsigned long )11;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&gcount;
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


                        
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c5; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )369;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
               break;     
          } 
          
          
          /* EXEC SQL          
          update  pkhildusum                
             set  ymdedcnt  =  :cnt_month - :gcount
           where  empno     =  :gempno
             and  duyymm    =  :workyymm ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkhildusum  set ymdedcnt=(:b0-:b1) where (e\
mpno=:b2 and duyymm=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )384;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&cnt_month;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&gcount;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)gempno;
          sqlstm.sqhstl[2] = (unsigned long )5;
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
               print_errmsg(sqlca.sqlcode,"월차 공제 갱신 ERROR");
               /*Write_batlog(seqno++, "월차공제 갱신 ERROR");   dsa2000 Rexec 대체*/
               error_quit("작업실패...");  
          }
          
          
     } /*WHILE END*/
}

/*주휴 시작일 구하기*/
GetStartDate()
{
     int i = 0  ;
     
     /* EXEC SQL
     update pkhildusum
        set weekcnt = 0 
      where duyymm = :workyymm ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkhildusum  set weekcnt=0 where duyymm=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )415;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"주휴 갯수 0 SETTING ERROR");
          Write_batlog(seqno++, "주휴 갯수 0 SETTING ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
             
     /* EXEC SQL
     select TO_CHAR(TO_DATE(:workyymm||'01','YYYYMMDD') - 6, 'YYYYMMDD') 
     into :tempdate
     from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR((TO_DATE((:b0||'01'),'YYYYMMDD')-6),'YYY\
YMMDD') into :b1  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )434;
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


     
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"TEMP DATE READ ERROR");
          Write_batlog(seqno++, "TEMP DATE READ ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
     
     /* EXEC SQL
     select  TO_CHAR(TO_DATE(:workyymm||'01','YYYYMMDD'), 'iw') 
       into  :siw
       from  dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE((:b0||'01'),'YYYYMMDD'),'iw') in\
to :b1  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )457;
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
     sqlstm.sqhstv[1] = (unsigned char  *)siw;
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


     
                   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"SIW READ ERROR");
          Write_batlog(seqno++, "SIW READ ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }       
           
     
     for (i = 0 ; i < 10 ; i++ ) 
     {
          /* EXEC SQL
          select TO_CHAR(TO_DATE(:tempdate,'YYYYMMDD'), 'iw') 
            into :wweek1
            from dual; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'iw') into \
:b1  from dual ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )480;
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
          sqlstm.sqhstv[1] = (unsigned char  *)wweek1;
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


                
                    
          if  (strcmp(siw , wweek1) == 0 )
          { 
               sprintf(mondate1,"%s", tempdate) ;
               break;
          }
          
          
           /* EXEC SQL
           SELECT  TO_CHAR(TO_DATE(:tempdate,'YYYYMMDD') + 1,'YYYYMMDD')
             INTO  :tempdate
             FROM  DUAL; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 7;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "select TO_CHAR((TO_DATE(:b0,'YYYYMMDD')+1),'YYYYM\
MDD') into :b0  from DUAL ";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )503;
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


                
     }
}


GetWeekcnt()
{
       
     printf("\n 주휴 count 시작일 : %s \n", mondate1 ) ;
     /* EXEC SQL
     DECLARE c9 CURSOR  FOR
      select EMPNO
        from PKHILDUSUM
       where DUYYMM = :workyymm ; */ 
     
       
     /* EXEC  SQL  open c9; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0018;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )526;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {  
          print_errmsg(sqlca.sqlcode,"주휴 READ ERROR");
          printf("2 log_rundate:%s, log_progid:%s, seqno:%d, log_writeman:%s, message:%s",
                    log_rundate, log_progid, seqno, log_writeman);
          Write_batlog(seqno++, "주휴 READ ERROR");   /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
       
     while(1)
     {
          /* EXEC SQL FETCH c9 INTO
          :duempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )545;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)duempno;
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


                        
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c9; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )564;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
               break;     
          } 
                 
          GipgyeWeekcnt () ;   
          
          /* exec sql
          update pkhildusum
             set weekcnt  = :wwcnt
           where duyymm =:workyymm
             and empno  =:duempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkhildusum  set weekcnt=:b0 where (duyymm=:\
b1 and empno=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )579;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&wwcnt;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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
          sqlstm.sqhstv[2] = (unsigned char  *)duempno;
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


          
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               print_errmsg(sqlca.sqlcode,"주휴 갯수 SETTING ERROR");
               /*Write_batlog(seqno++, "주휴 갯수 SETTING ERROR");   dsa2000 Rexec 대체*/
               error_quit("작업실패...");  
          }
      
     }

}

GipgyeWeekcnt()
{ 
     char  wiw[3] ;
     char  biw[3] ;
     char  wweekyn[2] ;
     char  wducode[3];
     char  wdufrdate[9];
     char  wempno[5] ; 
     int   wdcnt = 0;
     
     wwcnt = 0 ;
     
     /* EXEC SQL
     DECLARE c10 CURSOR  FOR
     select  EMPNO, DUFRDATE, DUCODE, WEEKYN, TO_CHAR(TO_DATE(DUFRDATE,'YYYYMMDD'), 'iw') 
       from  PKHILDUTY A, PKHILDUCOD B 
      where  dufrdate BETWEEN :mondate1 AND :workyymmdd
        and  upper(conyn) ='Y'
        AND  DUCODE = DUKIND               
        AND  EMPNO = :duempno
      ORDER  BY DUFRDATE ; */ 

       
                   
     /* EXEC  SQL  open c10; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )606;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)mondate1;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymmdd;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)duempno;
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
          print_errmsg(sqlca.sqlcode,"주휴 READ ERROR");
          /*Write_batlog(seqno++, "주휴 READ ERROR");   dsa2000 Rexec 대체*/
          error_quit("작업실패...");  
     }
         
     sprintf(biw, "%s", siw) ;
                  
     while(1)
     {
          /* EXEC SQL FETCH c10 INTO
          :wempno,  :wdufrdate, :wducode, :wweekyn, :wiw ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )633;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)wempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)wdufrdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)wducode;
          sqlstm.sqhstl[2] = (unsigned long )3;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)wweekyn;
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)wiw;
          sqlstm.sqhstl[4] = (unsigned long )3;
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

                
                        
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c10; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )668;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

         
               break;     
          } 
          
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               print_errmsg(sqlca.sqlcode,"FETCH c10 ERROR 1");
               /*Write_batlog(seqno++, "FETCH c10 ERROR 1");   dsa2000 Rexec 대체*/
               error_quit("작업실패...");  
          }
          
          if  (strncmp(wweekyn,"Y",1) == 0 )
          {
               if  (strcmp(biw , wiw) == 0 ) 
               {
                    wdcnt++;     
                     /*   printf("\n 1 empno[%s], wdcnt1[%d]", wempno, wdcnt);       */
                    
                    if  (wdcnt == 7) /* 일주일단위*/
                    { 
                         wwcnt ++; 
                         /*    printf("\n 3 empno[%s], wdcnt1[%d]", wempno, wdcnt);   */
                    }
               }              
               else 
               {
                   sprintf(biw, "%s", wiw) ;                  
                   wdcnt = 1 ;
               }   
          }
     } /*WHILE END*/
           
}
  


/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
}

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )683;
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
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )724;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
