
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
    "pkq2074g.pc"
};


static unsigned int sqlctx = 154099;


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

 static char *sq0001 = 
"select empno ,retdate  from PKMRTMAS            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,48,0,9,142,0,0,0,0,0,1,0,
20,0,0,1,0,0,13,153,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
43,0,0,1,0,0,15,158,0,0,0,0,0,1,0,
58,0,0,2,77,0,5,167,0,0,1,1,0,1,0,1,97,0,0,
77,0,0,3,93,0,4,174,0,0,4,1,0,1,0,2,3,0,0,2,3,0,0,2,97,0,0,1,97,0,0,
108,0,0,4,77,0,4,198,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,
135,0,0,5,93,0,5,217,0,0,7,7,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,97,0,0,
178,0,0,6,340,0,5,270,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
201,0,0,7,182,0,5,291,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
224,0,0,8,124,0,5,309,0,0,1,1,0,1,0,1,97,0,0,
243,0,0,9,175,0,5,324,0,0,0,0,0,1,0,
258,0,0,10,93,0,5,340,0,0,0,0,0,1,0,
273,0,0,11,50,0,3,357,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
314,0,0,12,0,0,29,367,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ2074G(퇴직자 공제금 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 이랑교
 Version        : 30.00
 Date           : 1999.03.05

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.02.16         이인환          최초개발본      설계명세서
   30.00      1999.03.04         이랑교   신인사제도관련 변경
         etcamt:기타대출을 퇴직월 기타공제로 전용
   30.01      2004.02.24         강륜종         Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.          
   31.00      2004.11.         강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.   
======================================================================================== */
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
     char  empno[5];
     char  retdate[9];
     int   remamt;
     int   hsint;
     int   days;
     int   hstot;
     int   hssrt;
     int   hslong;
     char  replyymmdd[9];
/* EXEC SQL END   DECLARE SECTION; */ 


double  rate[14];

FILE *fp=stdout;

int  id;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 

void main(argc,argv)
int argc;
char *argv[];
{   
     char FL_file[255];
     
     if  (argc != 4) {  /* /hper8/HINSA/proc/bin/Kbin/pkq2074g D006 pkq2074g 2004110100000 */
          printf("[Usage] : pkq2074g  1.작업자사번 2.프로그램ID 3.시작시간 \n");  
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2074g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     hinsa_log_print(0,"퇴직자 공제금 계산 시작...");                
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[2]);
     strcpy(log_rundate,  argv[3]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     SetRate();
     
     CalcRetAmt();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [퇴직금 공제액 작업성공] =====\n");
          Write_batlog(seqno++, log_buff); 
          hinsa_exit(0,"OK ====== [퇴직금 공제액 작업성공] =====\n");
     }
}


SetRate()
{
     rate[12] = 0.0;
     rate[11] = 1.5;
     rate[10] = 2.0;
     rate[9]  = 2.5;
     rate[8]  = 4.0;
     rate[7]  = 4.5;
     rate[6]  = 5.0;
     rate[5]  = 6.5;
     rate[4]  = 7.0;
     rate[3]  = 7.5;
     rate[2]  = 9.0;
     rate[1]  = 9.5;
     rate[0]  = 0.0;
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

CalcRetAmt()
{
     int  mm;
     char smm[3];
     
     /* EXEC  SQL DECLARE c1 CURSOR FOR
     SELECT  empno,retdate
       FROM  PKMRTMAS; */ 

     
     /* EXEC SQL open  c1 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0001;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"1. 퇴직일 Read Error");
          sprintf(log_buff, "1. 퇴직일 Read Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     
     while(1)
     {
          /* EXEC   SQL FETCH c1 
          INTO  :empno,:retdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )20;
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


          
          if  (sqlca.sqlcode == 1403 )
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 2;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )43;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          remamt = 0;
          memset(replyymmdd,'\0',sizeof(replyymmdd));
          memset(smm,'\0',sizeof(smm));
          
                       /* 설정값 초기화 */
          /* EXEC  SQL
          UPDATE  PKMRTMAS
             SET  hsrem = 0,  hsint = 0,
                  hssrt = 0,  hslong= 0,
                  hsamt = 0
           WHERE  empno = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS  set hsrem=0,hsint=0,hssrt=0,hslon\
g=0,hsamt=0 where empno=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )58;
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


          
          /* EXEC  SQL
          SELECT  sum(hsamt),sum(remsum),max(repldate)
            INTO  :hstot,:remamt,:replyymmdd
            FROM  PKMHSMAS
           WHERE  empno = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select sum(hsamt) ,sum(remsum) ,max(repldate) into\
 :b0,:b1,:b2  from PKMHSMAS where empno=:b3";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )77;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&hstot;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&remamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)replyymmdd;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 &&
               sqlca.sqlcode != -1405)
          {  
               err_print(sqlca.sqlcode,"2. 주택자금 자료 read Error");
               sprintf(log_buff, "2. 주택자금 자료 read Error");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
          
          if  (remamt > 0)
          {
               /* =================================  debug 
               printf("~~~~~~~[%10d]%s\n",remamt,empno);
                =================================  debug */
               sprintf(replyymmdd,"%8s",replyymmdd);
               memset(smm,'\0',sizeof(smm));
               sprintf(smm,"%.2s",replyymmdd+4);
               mm = atoi(smm);
               
               /* EXEC  SQL
               SELECT  to_date(:retdate,'YYYYMMDD') - 
                       to_date(:replyymmdd,'YYYYMMDD')
                 INTO  :days
                 FROM  dual; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select (to_date(:b0,'YYYYMMDD')-to_date(:b1,'\
YYYYMMDD')) into :b2  from dual ";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )108;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)retdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)replyymmdd;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&days;
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


               
               if  (days < 0)
                    days = 0;
               
               hsint = remamt * days / 365 * 0.02;
               
               hssrt = hstot * rate[mm] / 100;
               if (remamt - hssrt < 0 )
               {
                   hssrt = remamt;
               }
               
               hslong = remamt - hssrt; 
               
               /* EXEC  SQL
               UPDATE  PKMRTMAS
                 SET   hsrem = :remamt, hsint = :hsint, 
                       hssrt = :hssrt,  hslong= :hslong,
                       hsamt = :remamt + :hsint
                WHERE  empno = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMRTMAS  set hsrem=:b0,hsint=:b1,hssr\
t=:b2,hslong=:b3,hsamt=(:b0+:b1) where empno=:b6";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )135;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&remamt;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&hsint;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&hssrt;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&hslong;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&remamt;
               sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&hsint;
               sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)empno;
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


               if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
               {  
                    err_print(sqlca.sqlcode,"3. 주택자금 setting Error");
                    sprintf(log_buff, "3. 주택자금 setting Error");
                    Write_batlog(seqno++, log_buff); 
                    exit(1);
               }
          }   

          /* ===================================== 외환대출없슴 당분간은..start
          *   EXEC SQL
          *   UPDATE  PKMRTMAS p
          *   SET  fbamt = (SELECT loanamt - lrepsum
          *       FROM   PKMFBMAS r
          *       WHERE  r.empno = :empno)
          *   WHERE  empno = :empno;
          *   if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          *   {       err_print(sqlca.sqlcode,"4. 외환복지대출 seting Error");
          *     exit(1);       
          *   }                      
          *===================================================  end of 4. 외환복지대출 */
          
          
          /* =====================================================================================
            .퇴직전환금 계산시 : 
             국민연금이력에서 anuselfamt를 sum할때  '199903'까지만 포함한다.
          ========================================================================================
          *  변경전 :
          *   EXEC SQL
          *   UPDATE  PKMRTMAS p
          *   SET  ANUAMT = (SELECT SUM(ANUSELFAMT)
          *       FROM   PKHNPHIS R
          *       WHERE  r.empno = :empno)
          *   WHERE  empno = :empno;
          *   if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          *   {  err_print(sqlca.sqlcode,"5. 국민연금 setting Error");
          *     exit(1);
          *   }
          *  변경후 :
          *   * ===============================================================
          *   1999.04 부터 국민연금에서 퇴충부담금 부분이 없어지므로
          *   국민연금이력에서 퇴충부담금을 공제할 경우 퇴충필드가 따로 없으므로
          *   1999.03 까지만 합계를 낸다.
          *   단, 중간정산 이후 금액부터
          *   * ================================================================ */
          
          /*2001-01-30 중간정산이력의 기산일을 최대값을 불러온다*/   
          /* EXEC SQL
          UPDATE  PKMRTMAS p
             SET  ANUAMT = (SELECT SUM(ANUSELFAMT)
                              FROM    PKHNPHIS R,
                                        (select  empno mrempno,max(mrtodate) maxmrtodate from PKHMRHIS group by empno) 
                                          WHERE  r.empno = :empno
                                            AND  ANUYYMM <='199903'
                                            AND  ANUYYMM > SUBSTR(maxmrtodate,1,6)
                                                   AND     R.EMPNO = mrempno
                           )
           WHERE  empno = :empno
             AND  EMPNO IN ( SELECT EMPNO FROM PKHMRHIS B 
                              WHERE P.EMPNO = B.EMPNO    ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set ANUAMT=(select sum(ANUSELFA\
MT)  from PKHNPHIS R ,(select empno mrempno ,max(mrtodate) maxmrtodate  from \
PKHMRHIS  group by empno) where (((r.empno=:b0 and ANUYYMM<='199903') and ANU\
YYMM>SUBSTR(maxmrtodate,1,6)) and R.EMPNO=mrempno)) where (empno=:b0 and EMPN\
O in (select EMPNO  from PKHMRHIS B where P.EMPNO=B.EMPNO))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )178;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    
               err_print(sqlca.sqlcode,"5. 국민연금 setting Error - 중간정산 받은경우");
               sprintf(log_buff, "5. 국민연금 setting Error - 중간정산 받은경우");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
          
          /* EXEC SQL
          UPDATE  PKMRTMAS p
             SET  ANUAMT = (SELECT  SUM(ANUSELFAMT)
                              FROM  PKHNPHIS R
                             WHERE  r.empno = :empno
                               AND  ANUYYMM <='199903'
                           )
           WHERE  empno = :empno
             AND  EMPNO NOT IN ( SELECT EMPNO FROM PKHMRHIS B  ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set ANUAMT=(select sum(ANUSELFA\
MT)  from PKHNPHIS R where (r.empno=:b0 and ANUYYMM<='199903')) where (empno=\
:b0 and EMPNO not  in (select EMPNO  from PKHMRHIS B ))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )201;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               err_print(sqlca.sqlcode,"5. 국민연금 setting Error - 중간정산 안 받은 경우");
               sprintf(log_buff, "5. 국민연금 setting Error - 중간정산 안 받은경우");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
          
          /* Dsa2000  2003.11.25.   사번변경자를 위하여... 중간정산을 받은 사번변경자는 국민연금전환금을 0 으로 Setting..*/
          /* EXEC SQL
          Update PKMRTMAS A 
             Set Anuamt = 0
           Where Juminid in (Select Juminid From Pkhrthis B where A.empdate > B.retdate)
             and empno = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS A  set Anuamt=0 where (Juminid in \
(select Juminid  from Pkhrthis B where A.empdate>B.retdate) and empno=:b0)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )224;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               err_print(sqlca.sqlcode,"5. 국민연금 setting Error - 사번변경자 경우");
               sprintf(log_buff, "5. 국민연금 setting Error - 사번변경자 경우");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
     }
     
     
     /* EXEC  SQL
     UPDATE  PKMRTMAS
        SET  HSAMT     = NVL(HSAMT,0),
             FBAMT     = NVL(FBAMT,0),
             NBAMT     = NVL(NBAMT,0),
             SACORPAMT = NVL(SACORPAMT,0),
             SABANKAMT = NVL(SABANKAMT,0),
             SANGAMT   = NVL(SANGAMT,0),
             ANUAMT    = NVL(ANUAMT,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set HSAMT=NVL(HSAMT,0),FBAMT=NVL(FBAMT\
,0),NBAMT=NVL(NBAMT,0),SACORPAMT=NVL(SACORPAMT,0),SABANKAMT=NVL(SABANKAMT,0),\
SANGAMT=NVL(SANGAMT,0),ANUAMT=NVL(ANUAMT,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )243;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"6. NULL값 치환  setting Error");
          sprintf(log_buff, "6. NULL값 치환  setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     
     /* EXEC  SQL
     UPDATE  PKMRTMAS
        SET  LOANSUM = HSAMT + FBAMT + NBAMT + SACORPAMT +
             SABANKAMT + SANGAMT + ANUAMT ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LOANSUM=((((((HSAMT+FBAMT)+NBAMT)+\
SACORPAMT)+SABANKAMT)+SANGAMT)+ANUAMT)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )258;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          err_print(sqlca.sqlcode,"6. 공제금 합  setting Error");
          sprintf(log_buff, "6. 공제금 합  setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int  Write_batlog(int seqno, char *message)
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
     sqlstm.offset = (unsigned int  )273;
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
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )314;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
