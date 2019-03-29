
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
    "pkz1040g.pc"
};


static unsigned int sqlctx = 156115;


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

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,0,0,24,113,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,2,0,0,24,147,0,0,1,1,0,1,0,1,97,0,0,
43,0,0,3,0,0,24,159,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,4,50,0,3,170,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,0,
1,97,0,0,1,97,0,0,
103,0,0,5,0,0,29,182,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkz1040g.pc  (maketemp)(임원 월 변동자료 추출)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 
 Version        : 
 Date           : 2008.03.26

Update Contents
   Version    date(yy.mm.dd)     programmer  description     relevant doc.no
   1.00       1997.02.16         이인환      최초개발본      설계명세서
 
============================================================================= */

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

#define  FAIL        -2

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char  empno[5];
     char  tvalue[13];  
     char  tvalue_yn[2];      /*2017.03.29 jissi 안쓰는 NOJOYN-> PAYYN으로 변경 tvalue_nojo => tvalue_yn*/
     char  sqlstr[1024];
/* EXEC SQL END DECLARE SECTION; */ 

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


int  id;
char log_rundate[16]     = ""; 
char log_progid[16]      = "";
char log_writeman[5]     = "";
char log_buff[100]       = "";
int  seqno = 0; 

main(argc,argv)
  int   argc;
  char *argv[];
{
     char FL_file[255];
     
     if (argc != 6) {  /* pkz1040g /hper/insa/HINSA/data/Kdata/T_SPTMAMT SPTMAMT D006 pkz1040g 2004110100000 */
         printf("[Usage] : pkz1040g 1.경로+Tname 2.datafld 3.writeman 4.progid 5.rundate \n");
         exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업*/
     STRINIT(FL_file);
     strcpy(FL_file,"pkz1040g");
     
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     hinsa_log_print(0,"월 변동자료 추출 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
            
     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);
     strcpy(log_rundate,  argv[5]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
                    
     Read_InsertData(argv[1],argv[2]);
     
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, " 작업 ERROR "); /*dsa2000 Rexec 대체 추가*/
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체 추가*/
          error_quit(" 작업 ERROR ");
     }
     else  
     {
          sprintf(log_buff, "OK!! 자료추출 성공."); /*dsa2000 Rexec 대체 추가*/
          Write_batlog(seqno++, log_buff);          /*dsa2000 Rexec 대체 추가*/
          hinsa_exit(0,"OK 작업이 완료되었습니다.");
     }           
}

Read_InsertData(fname,datafld)
char *fname;
char *datafld;
{
     FILE *fp;  
     char buf[256];
     
     fp = fopen(fname,"r");
     if (fp == NULL)
     {
         printf("[ERR] %s 화일이 없습니다",fname);        
         sprintf(log_buff, "[ERR] %s 화일이 없습니다",fname); /*dsa2000 Rexec 대체 추가*/
         Write_batlog(seqno++, log_buff);                     /*dsa2000 Rexec 대체 추가*/    
         
         /*2015.05. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
         sprintf(sqlstr,"drop table %s ", tname);
         EXEC SQL EXECUTE IMMEDIATE :sqlstr;     */
         exit(0);   
     }
     
     /*2015.05. 계정권한 분리작업 : Delete구문 Add */
     sprintf(sqlstr,"Delete PKZ1040G_Program Where Workemp='%s' And Datafld='%s'", log_writeman,datafld);
     /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
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


          
     while (fgets(buf,256,fp))
     {
          sprintf(empno,"%4.4s",buf);    
          
          /*2017.03.29 jissi 안쓰는 NOJOYN-> 사용할 PAYYN으로 변경 tvalue_nojo => tvalue_yn
          if (strncmp(datafld, "NOJOYN",6) == 0 )  *dsa2000  2005.10 문자값 처리토록 추가.*
          {
              sprintf(tvalue_nojo, "%1.1s",buf+5);
              *2015.05. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
              sprintf(sqlstr,"insert into %s (empno,tvalue) values ('%s','%s')",tname,empno,tvalue_nojo);*
              sprintf(sqlstr,"insert into PKZ1040G_Program (Workemp,Datafld,Empno,Charvalue) Values ('%s','%s','%s','%s')"
                             ,log_writeman,datafld,empno,tvalue_nojo);
          }
          */   
          if (strncmp(datafld, "PAYYN", 5) == 0 )       
          {
              sprintf(tvalue_yn, "%1.1s",buf+5);
              /*2015.05. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
              sprintf(sqlstr,"insert into %s (empno,tvalue) values ('%s','%s')",tname,empno,tvalue_yn);*/
              sprintf(sqlstr,"insert into PKZ1040G_Program (Workemp,Datafld,Empno,Charvalue) Values ('%s','%s','%s','%s')"
                             ,log_writeman,datafld,empno,tvalue_yn);
          }
          else
          {
              sprintf(tvalue,"%12s",buf+5);
              /*2015.05. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
              sprintf(sqlstr,"insert into %s (empno,tvalue) values ('%s',%s)",tname,empno,tvalue);*/
              sprintf(sqlstr,"insert into PKZ1040G_Program (Workemp,Datafld,Empno,Numvalue) Values ('%s','%s','%s',%s)"
                             ,log_writeman,datafld,empno,tvalue);
          }
          
          /*printf("%s\n", sqlstr);*/
          /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 1;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )24;
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

 
          
          if (sqlca.sqlcode != 0)
          {
              printf("[ERRCODE : %d] %s번 임시 테이블 삽입 ERROR",sqlca.sqlcode,empno);
              sprintf(log_buff, "[ERRCODE : %d] %s번 임시 테이블 삽입 ERROR",sqlca.sqlcode,empno); /*dsa2000 Rexec 대체 추가*/
              Write_batlog(seqno++, log_buff);                                                     /*dsa2000 Rexec 대체 추가*/     
              fclose(fp);
              
              /*2015.05. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
              sprintf(sqlstr,"drop table %s ", tname);*/
              sprintf(sqlstr,"Delete PKZ1040G_Program Where Workemp='%s' And Datafld='%s'", log_writeman,datafld);
              /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 1;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )43;
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

 
              exit(0);
          }
     }
     
     fclose(fp);
}

/*=== dsa2000 2004.10. Rexec대체 서비스를 위한 =====================================*/
int   Write_batlog(int seqno, char *message)
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
      sqlstm.offset = (unsigned int  )62;
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
           sprintf(log_buff, "ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체 추가*/
           Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체 추가*/   
           return(-1);          
      }                        
                        
      /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 5;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )103;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}