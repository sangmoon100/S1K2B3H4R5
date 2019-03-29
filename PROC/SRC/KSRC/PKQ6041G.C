
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
    "pkq6041g.pc"
};


static unsigned int sqlctx = 154467;


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
   unsigned char  *sqhstv[2];
   unsigned long  sqhstl[2];
            int   sqhsts[2];
            short *sqindv[2];
            int   sqinds[2];
   unsigned long  sqharm[2];
   unsigned long  *sqharc[2];
   unsigned short  sqadto[2];
   unsigned short  sqtdso[2];
} sqlstm = {12,2};

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
5,0,0,1,0,0,29,54,0,0,0,0,0,1,0,
20,0,0,2,0,0,31,56,0,0,0,0,0,1,0,
35,0,0,3,60,0,4,68,0,0,1,0,0,1,0,2,97,0,0,
54,0,0,4,683,0,3,79,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
77,0,0,5,246,0,5,118,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
};


/*------------------------------------------------------------------------------
    PROGRAM-NAME    : 퇴직연금 대상자 자동 확정 처리(pkq6041g)
    SYSTEM-NAME     : 급여
    SUBSYSTEM-NAME  : 퇴직연금
    Programmer      : 
    Version         : 1.0
    Date            : 2018.08.20
    Update Contents
    버전    수정일    수정자   관련근거                 수정내용
 -------------------------------------------------------------------------------
    1.00  2018.08.20   이성규            퇴직연금 대상자 등록 후 14일 경과된 자료를 자동 확정 처리
 -------------------------------------------------------------------------------*/

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

#define   DEBUG       0

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


int  Save_Pkhrapp();   /* PKHRAPP테이블에 자동확정처리 입력 */

void main(void)
{
    char FL_file[255];
    int  iRet = 0;
    
    STRINIT(&FL_file);
    strcpy(FL_file,"pkq6041g");
    
    hinsa_get_filename(1, FL_file);
    if  (hinsa_log_open(FL_file) == FAILURE)
    {
      hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
      return;
    }
    
    hinsa_log_print(0,"퇴직연금 대상자 자동 확정 처리(pkq6041g.pc) 프로그램 시작...");

    hinsa_db_connect();

    iRet = Save_Pkhrapp();
    if (iRet)
        /* EXEC SQL COMMIT WORK; */ 

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


    else
        /* EXEC SQL ROLLBACK WORK; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 0;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )20;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    
    hinsa_exit(0,"퇴직연금 대상자 자동 확정 처리(pkq6041g) 프로그램 종료...");
}  

int  Save_Pkhrapp(void)
{
    char strMsg[255];
    char sDate[8+1];

    STRINIT(&sDate);

    /* EXEC SQL
        SELECT BASEDATE INTO :sDate FROM PKHRPBASE WHERE BASEGUBUN = 'A'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select BASEDATE into :b0  from PKHRPBASE where BASEGUBUN\
='A'";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )35;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)sDate;
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



    if (SQLCODE != SQL_OK)
    {
        STRINIT(&strMsg);
        sprintf(strMsg, "Fail Select from PKHRPBASE!! : %s", SQLERRM);
        hinsa_log_print(0, strMsg);
        return 0;
    }        
    /* 차후 Insert 대상만 업데이트를 수행하기 위해 CONYN = 'A'를 입력 */
    /* EXEC SQL
        INSERT INTO PKHRPAPP 
               (SDATE, EMPNO, EMPDATE, AVGGROSS, RETRATE, RETAMT, RPTYPE, RPCOMP, 
                RPGOOD, CONYN, CONTIME, APPDATE, APPREMARK, WRITETIME, WRITEMAN, BASEGUBUN)
        SELECT /o+ INDEX (A I1_PKHRPAPP_LIST) o/
               :sDate, 
               EMPNO, 
               EMPDATE, 
               0 AS AVGGROSS,
               0 AS RETRATE,
               0 AS RETAMT,
               1 AS RPTYPE,
               '' AS RPCOMP,
               '' AS RPGOOD,
               'A' AS CONYN,
               TO_CHAR(SYSDATE, 'YYYYMMDD') AS CONTIME,
               TO_CHAR(SYSDATE, 'YYYYMMDD') AS APPDATE,
               '퇴직연금 제도 미선택에 따른 DB제도 자동 적용' AS APPREMARK,
               TO_CHAR(SYSDATE, 'YYYYMMDDHH24miss') AS WRITETIME,
               WRITEMAN, 
               'A' AS BASEGUBUN
          FROM PKHRPAPP_LIST A
         WHERE A.WORKYM = SUBSTR(:sDate, 1, 6)
           AND A.BASEGUBUN = 'A'
           AND A.EMPNO NOT IN (SELECT EMPNO FROM PKHRPAPP)
           AND A.WRITETIME <= TO_CHAR(SYSDATE - 14, 'YYYYMMDD')||'999999'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PKHRPAPP (SDATE,EMPNO,EMPDATE,AVGGROSS,RETRA\
TE,RETAMT,RPTYPE,RPCOMP,RPGOOD,CONYN,CONTIME,APPDATE,APPREMARK,WRITETIME,WRIT\
EMAN,BASEGUBUN)select  /*+  INDEX (A I1_PKHRPAPP_LIST)  */ :b0 ,EMPNO ,EMPDAT\
E ,0 AVGGROSS ,0 RETRATE ,0 RETAMT ,1 RPTYPE ,'' RPCOMP ,'' RPGOOD ,'A' CONYN\
 ,TO_CHAR(SYSDATE,'YYYYMMDD') CONTIME ,TO_CHAR(SYSDATE,'YYYYMMDD') APPDATE ,'\
퇴직연금 제도 미선택에 따른 DB제도 자동 적용' APPREMARK ,TO_CHAR(SYSDATE,'YYY\
YMMDDHH24miss') WRITETIME ,WRITEMAN ,'A' BASEGUBUN  from PKHRPAPP_LIST A wher\
e (((A.WORKYM=SUBSTR(:b0,1,6) and A.BASEGUBUN='A') and A.EMPNO not  in (selec\
t EMPNO  from PKHRPAPP )) and A.WRITETIME<=(TO_CHAR((SYSDATE-14),'YYYYMMDD')|\
|'999999'))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )54;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)sDate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)sDate;
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



    if (SQLCODE != SQL_OK)
    {
        STRINIT(&strMsg);
        sprintf(strMsg, "Fail Insert into PKHRPAPP!! : %s", SQLERRM);
        hinsa_log_print(0, strMsg);
        return 0;
    }
    else if (SQL_PROCESS_COUNT < 1)     // 확정 대상 자료 없음
    {
        hinsa_log_print(0, "No Data Found!!");
        return 0;
    }
    /* EXEC SQL
        UPDATE PKHRPAPP P                                                                                       
           SET CONYN = 'Y',
               (P.AVGGROSS, P.RETRATE, P.RETAMT) = (SELECT NVL(B.BASEAMT, 0), NVL(B.RETRATE, 0), NVL(B.RETAMT, 0)
                                                      FROM PKHMRESH B                                                  
                                                     WHERE P.EMPNO     = B.EMPNO(+)                                     
                                                       AND B.MRTODATE  = :sDate)                                       
         WHERE P.SDATE = :sDate
           AND P.BASEGUBUN = 'A'
           AND P.CONYN = 'A'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PKHRPAPP P  set CONYN='Y',(P.AVGGROSS,P.RETRATE,P\
.RETAMT)=(select NVL(B.BASEAMT,0) ,NVL(B.RETRATE,0) ,NVL(B.RETAMT,0)  from PK\
HMRESH B where (P.EMPNO=B.EMPNO(+) and B.MRTODATE=:b0)) where ((P.SDATE=:b0 a\
nd P.BASEGUBUN='A') and P.CONYN='A')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )77;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)sDate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)sDate;
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


           
    if (SQLCODE != SQL_OK)
    {
        STRINIT(&strMsg);
        sprintf(strMsg, "Fail Update PKHRPAPP!! : %s", SQLERRM);
        hinsa_log_print(0, strMsg);
        return 0;
    }
    STRINIT(&strMsg);
    sprintf(strMsg, "퇴직연금 신청 관리(PKHRPAPP)테이블 입력 건수 : %d", SQL_PROCESS_COUNT);
    hinsa_log_print(0, strMsg);
    
    return 1;
}

