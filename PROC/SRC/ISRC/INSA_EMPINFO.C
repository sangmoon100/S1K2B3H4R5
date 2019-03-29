
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
           char  filnam[16];
};
static struct sqlcxp sqlfpn =
{
    15,
    "insa_empinfo.pc"
};


static unsigned int sqlctx = 2479987;


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
   unsigned char  *sqhstv[1];
   unsigned long  sqhstl[1];
            int   sqhsts[1];
            short *sqindv[1];
            int   sqinds[1];
   unsigned long  sqharm[1];
   unsigned long  *sqharc[1];
   unsigned short  sqadto[1];
   unsigned short  sqtdso[1];
} sqlstm = {12,1};

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
5,0,0,1,0,0,32,66,0,0,0,0,0,1,0,
20,0,0,2,235,0,5,85,0,0,0,0,0,1,0,
35,0,0,3,239,0,5,108,0,0,0,0,0,1,0,
50,0,0,4,0,0,24,144,0,0,1,1,0,1,0,1,97,0,0,
69,0,0,5,206,0,5,158,0,0,0,0,0,1,0,
84,0,0,6,209,0,5,180,0,0,0,0,0,1,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : insa_empinfo.pc
     PROGRM-Decription : 사원 전화번호 정보 인사마스터Update 작업 
     USAGE             :
     SYSTEM-NAME       :
     SUBSYSTEM-NAME    :
     Programmer        : 지순미
     Version           : 1.00
     Date              : 2010.06.09
  
    Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2010.06.09         지순미          최초작성   
       1.01       2010.08.31         지순미          E_Mail  정보 제외
       1.02       2011.04.06         이희용          OFFITEL 추가
==================================================================================================*/
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

#define   EMPNO        4
#define   KORNAME     12
#define   PHONE       40
#define   EMAIL       60
#define   MJOB        256

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    v_empno      [05] = {0};    /* 사번 */
     int     cnt;
     char    v_mjob[MJOB+1];
     char    sql_stmt[5000+1];     
/* EXEC SQL END DECLARE SECTION; */ 


int PL_pompinfo2pimpmas(void);

void main(void)
{
     char FL_Line[255];
     char FL_file[255];
   
     STRINIT(FL_file);
     STRINIT(FL_Line);
     strcpy(FL_file,"insa_empinfo");
   
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
   
     hinsa_log_print(0,"사원 핸드폰, 사내전화 정보 인사마스터Update(insa_empinfo) 프로그램 시작...");
   
     hinsa_db_connect();
       
     if (PL_pompinfo2pimpmas() == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 0;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )5;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_pompinfo2pimpmas 에러로 종료...");
          return;
     }
   
     hinsa_exit(0,"사원 핸드폰, 사내전화 정보 인사마스터Update(insa_empinfo) 정상 처리...");
     return;
}

/*==================================================================================================
   인사마스터에서 핸드폰, 사내전화 자료를 Update한다...
==================================================================================================*/
int PL_pompinfo2pimpmas(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     hinsa_log_print(0, "인사마스터 핸드폰 정보 Update 작업 시작...");
     /* EXEC SQL 
     Update Pimpmas A
        Set Retcont                     --//, E_Mail
          = (Select Trim(Phone)         --//, Trim(Email)
               From Pompinfo
              Where Empno = A.Empno)
      Where Empno In (Select Empno From Pompinfo Where Trim(Phone) Is Not Null And Empno not like 'U%')
        And Pstate < '80' 
        And Empno not in ('M146'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pimpmas A  set Retcont=(select trim(Phone)  from\
 Pompinfo where Empno=A.Empno) where ((Empno in (select Empno  from Pompinfo \
where (trim(Phone) is  not null  and Empno not like 'U%')) and Pstate<'80') a\
nd Empno not  in ('M146'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "핸드폰 정보 Update Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }     
     
     sprintf(FL_Line, "인사마스터 핸드폰 정보 Update 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
      
     
       
     hinsa_log_print(0, "인사마스터 사내전화 정보 Update 작업 시작...");   
     /* EXEC SQL 
     Update Pimpmas A
        Set Offitel                     --//, E_Mail
          = (Select Trim(Offitel)       --//, Trim(Email)
               From Pompinfo
              Where Empno = A.Empno)
      Where Empno In (Select Empno From Pompinfo Where Trim(Offitel) Is Not Null And Empno not like 'U%')
        And Pstate < '80' 
        And Empno not in ('M146'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pimpmas A  set Offitel=(select trim(Offitel)  fr\
om Pompinfo where Empno=A.Empno) where ((Empno in (select Empno  from Pompinf\
o where (trim(Offitel) is  not null  and Empno not like 'U%')) and Pstate<'80\
') and Empno not  in ('M146'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "사내전화 정보 Update Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     sprintf(FL_Line, "인사마스터 사내전화 정보 Update 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
     /*====================================================================*/
     //2017.10.19.hjku.. 구성원 정보중 책임업무 추가.. 
     hinsa_log_print(0, "책임업무 Update 작업 시작...");   
     
     sprintf(sql_stmt,"MERGE INTO PIMPMJOB P                                                                     "
                      "USING (SELECT EMPNO, MJOB, TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') WRITETIME                  "
                      "         FROM POMPINFO A                                                                  "
                      "        WHERE EXISTS(SELECT 1 FROM pimpmas b WHERE A.empno = b.empno AND pstate < '80')   "
                      "        ) V1                                                                              "
                      "    ON (P.EMPNO = V1.EMPNO)                                                               "
                      "WHEN MATCHED THEN UPDATE SET                                                              "
                      "                        P.MJOB         = V1.MJOB,                                         "
                      "                        P.WRITEEMP     = '0000',                                          "
                      "                        P.WRITETIME    = V1.WRITETIME                                     "
                      "WHEN NOT MATCHED THEN INSERT(P.EMPNO,  P.MJOB, P.WRITEEMP, P.WRITETIME)                   "
                      "                      VALUES(V1.EMPNO,V1.MJOB,     '0000',V1.WRITETIME)                   ");

     /* EXEC SQL EXECUTE IMMEDIATE :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )50;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sql_stmt;
     sqlstm.sqhstl[0] = (unsigned long )5001;
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

                           
     
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "책임업무 Update Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     sprintf(FL_Line, "책임업무 Update 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);     
     
     /*====== 도급인력 연락처 업데이트 추가 ===============================*/   
     hinsa_log_print(0, "도급인력 마스터 핸드폰 정보 Update 작업 시작...");
     /* EXEC SQL 
     Update Pzsubmas A
        Set HANDP           
          = (Select Trim(Phone)
               From Pompinfo
              Where Empno = A.Empno)
      Where Empno In (Select Empno From Pompinfo Where Trim(Phone) Is Not Null And Empno like 'U%')
        And Retdate is null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pzsubmas A  set HANDP=(select trim(Phone)  from \
Pompinfo where Empno=A.Empno) where (Empno in (select Empno  from Pompinfo wh\
ere (trim(Phone) is  not null  and Empno like 'U%')) and Retdate is null )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )69;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "도급인력 핸드폰 정보 Update Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }     
     
     sprintf(FL_Line, "도급인력 마스터 핸드폰 정보 Update 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
      
     
     /*=========*/
     hinsa_log_print(0, "도급인력 마스터 사내전화 정보 Update 작업 시작...");   
     /* EXEC SQL 
     Update Pzsubmas A
        Set OTEL            
          = (Select Trim(Offitel)
               From Pompinfo
              Where Empno = A.Empno)
      Where Empno In (Select Empno From Pompinfo Where Trim(Offitel) Is Not Null And Empno like 'U%')
        And Retdate is null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pzsubmas A  set OTEL=(select trim(Offitel)  from\
 Pompinfo where Empno=A.Empno) where (Empno in (select Empno  from Pompinfo w\
here (trim(Offitel) is  not null  and Empno like 'U%')) and Retdate is null )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )84;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "도급인력 사내전화 정보 Update Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     sprintf(FL_Line, "도급인력 마스터 사내전화 정보 Update 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
     
     
     return (SUCCESS);
}
