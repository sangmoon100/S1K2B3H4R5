
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
    "pic1062g.pc"
};


static unsigned int sqlctx = 149299;


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
   unsigned char  *sqhstv[13];
   unsigned long  sqhstl[13];
            int   sqhsts[13];
            short *sqindv[13];
            int   sqinds[13];
   unsigned long  sqharm[13];
   unsigned long  *sqharc[13];
   unsigned short  sqadto[13];
   unsigned short  sqtdso[13];
} sqlstm = {12,13};

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
5,0,0,1,55,0,4,97,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,63,0,4,141,0,0,1,0,0,1,0,2,97,0,0,
43,0,0,3,96,0,4,145,0,0,1,0,0,1,0,2,9,0,0,
62,0,0,4,0,0,17,282,0,0,1,1,0,1,0,1,97,0,0,
81,0,0,4,0,0,45,284,0,0,0,0,0,1,0,
96,0,0,4,0,0,15,288,0,0,0,0,0,1,0,
111,0,0,5,18,0,1,300,0,0,0,0,0,1,0,
126,0,0,4,0,0,13,304,0,0,13,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,
193,0,0,4,0,0,15,313,0,0,0,0,0,1,0,
208,0,0,4,0,0,15,326,0,0,0,0,0,1,0,
223,0,0,6,21,0,43,372,0,0,0,0,0,1,0,
238,0,0,7,0,0,29,377,0,0,0,0,0,1,0,
253,0,0,8,0,0,17,476,0,0,1,1,0,1,0,1,97,0,0,
272,0,0,8,0,0,45,478,0,0,0,0,0,1,0,
287,0,0,8,0,0,15,482,0,0,0,0,0,1,0,
302,0,0,8,0,0,13,492,0,0,2,0,0,1,0,2,9,0,0,2,9,0,0,
325,0,0,8,0,0,15,496,0,0,0,0,0,1,0,
340,0,0,8,0,0,15,506,0,0,0,0,0,1,0,
355,0,0,9,170,0,3,512,0,0,4,4,0,1,0,1,97,0,0,1,9,0,0,1,97,0,0,1,9,0,0,
386,0,0,8,0,0,15,533,0,0,0,0,0,1,0,
401,0,0,10,0,0,24,543,0,0,1,1,0,1,0,1,97,0,0,
420,0,0,8,0,0,15,547,0,0,0,0,0,1,0,
435,0,0,11,77,0,4,559,0,0,2,1,0,1,0,2,9,0,0,1,9,0,0,
458,0,0,12,0,0,24,567,0,0,1,1,0,1,0,1,97,0,0,
477,0,0,8,0,0,15,571,0,0,0,0,0,1,0,
492,0,0,13,95,0,3,585,0,0,4,4,0,1,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
523,0,0,14,0,0,29,591,0,0,0,0,0,1,0,
};


/*------------------------------------------------------------------------------
    PROGRAM-NAME    : PIC1062G(인사발령 알람처리)
    SYSTEM-NAME     : 종합인사정보
    SUBSYSTEM-NAME  : 인사
    Programmer      : 
    Version         : 1.0
    Date            : 2018.08.08
    Update Contents
    버전    수정일    수정자   관련근거                 수정내용
 -------------------------------------------------------------------------------
//    1.00  2018.08.08   이성규                      신규프로그램 개발
//    1.01  2018.09.27   신범주                      자동복직처리(PIC1061G)와 알람(PIC1062G)을 분리함
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

#define  DEBUG      0

/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

    /* varchar retTel[20+1]; */ 
struct { unsigned short len; unsigned char arr[21]; } retTel;

    
    typedef struct HINSA_Qanno {
        /* varchar empno       [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } empno;

        /* varchar korname     [12+1]; */ 
struct { unsigned short len; unsigned char arr[13]; } korname;

        /* varchar fanfrdate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } fanfrdate;

        /* varchar fantodate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } fantodate;

        /* varchar fancode     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } fancode;

        /* varchar fandetcode  [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } fandetcode;

        /* varchar fdeptcode   [6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } fdeptcode;

        /* varchar faddeptcode [6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } faddeptcode;

        /* varchar fadpayra    [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } fadpayra;

        /* varchar lancode     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } lancode;

        /* varchar lanfrdate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lanfrdate;

        /* varchar lantodate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lantodate;

        int     restday          ;
    } ts_Qanno;

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


char   jobTime[14+1];      /* log기록을 위한 작업시간 저장 */
char   jobEmpno[4+1];      /* 작업자사번 */
char   workAntodate[8+1];  /* 작업기준일 */

/* 발령사항 CURSOR 저장 Record */
static ts_Qanno G_anno;
static ts_Qanno *GP_anno;

/* Error Message */
char logText[300];
int  logCount = 0;

int  ReadAnno;              /* 읽은 건수 */
int  ErrorAnno;             /* Error 건수 */
int  SmsCount;              /* SMS 발송건수 CHECK */
int  MailCount;             /* MAIL 발송건수 CHECK */

void init_variable(int);    /* 변수 초기화 */
void Proc_anno(int);        /* 발령사항 처리 */
int SendAlarm(int);         /* 안내 메일/SMS 발송 처리 */
void logWrite(char *);      /* 프로그램 실행 로그 저장 */

main(argc,argv)
int argc; 
char *argv[];
{ 
    int iJob = 0;
    
    /* 서버 상의 Log File을 생성 및 기록하기 위한 함수. 삭제 시 컴파일 에러 발생 */
    hinsa_log_print(0,"PIC1062G(인사발령 자동 알람처리) 프로그램 시작...");
    
    hinsa_db_connect();

    /* 전역변수 초기화 */
    init_variable(0);
   
    // 프로그램 호출방법 정리 : Cron에서 호출, 예)pic1062g 20180801[일자]
    strcpy(jobEmpno, "CRON");
    strcpy(workAntodate, argv[1]);
    
    if (strlen(workAntodate) <= 0)
        /* EXEC SQL SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') INTO :workAntodate FROM DUAL; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDD') into :b0  from DU\
AL ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )5;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)workAntodate;
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

  // 작업일자 저장(당일)

    logWrite("인사발령 자동 알람처리 프로그램 시작...");

    STRINIT(&logText);
    sprintf(logText, "작업기준일[%s]", workAntodate);
    logWrite(logText);

    /* 휴직0/계약1/파견2/겸직3/겸무4  순차 처리 */
    for (iJob = 0; iJob < 5; iJob++)
    {
        Proc_anno(iJob);
    }

    STRINIT(&logText);
    sprintf(logText, "작업종료 : 조회[%d]SMS발송[%d]Mail발송[%d]Error[%d]", ReadAnno, SmsCount, MailCount, ErrorAnno);
    logWrite(logText);

    logWrite("인사발령 자동 알람처리 프로그램 종료..");
    
    hinsa_exit(0,"=====[작업종료]====="); 
}

/* 변수 초기화 */
void init_variable(int iKind)
{ 
    /* 발령사항 CURSOR Record 초기화 */
    memset(&G_anno,0x00,sizeof(G_anno));
    GP_anno = &G_anno;

    STRINIT(&logText);

    if (iKind == 1) return;

    SmsCount  = 0;           /* SMS 발송건수 CLEAR */
    MailCount = 0;           /* MAIL 발송건수 CLEAR */
    ReadAnno  = 0;           /* 읽은 건수  */
    ErrorAnno = 0;           /* Error 건수 */
    
    STRINIT(&jobEmpno);      /* 작업자사번 */
    STRINIT(&workAntodate);  /* 작업일From */
    STRINIT(&retTel);        /* 발신전화번호 */

    /* 로그기록시간 저장 */
    /* EXEC SQL 
    SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') INTO :jobTime FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fro\
m DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )24;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)jobTime;
    sqlstm.sqhstl[0] = (unsigned long )15;
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


        
    /* 발신전화번호 저장 */
    /* EXEC SQL 
    SELECT REPLACE(VALUE3,'-','') VALUE3 INTO :retTel FROM PIMVARI WHERE GUBUN = 'R0' AND SGUBUN = '0001'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select REPLACE(VALUE3,'-','') VALUE3 into :b0  from PIMV\
ARI where (GUBUN='R0' and SGUBUN='0001')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )43;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&retTel;
    sqlstm.sqhstl[0] = (unsigned long )23;
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

/* 발령사항 처리 */
void Proc_anno(int iKind)
{
    char strSql[4096];
    char sSql1[30];
    char sSql2[30];
    char sSql3[30];
    char sSql4[30];
    int  iKindCount = 0;
    
    STRINIT(&strSql);
    STRINIT(&sSql1);
    STRINIT(&sSql2);
    STRINIT(&sSql3);
    STRINIT(&sSql4);

if (DEBUG) printf("start Proc [%d]\n", iKind);
    
    /* 발령코드별 조회를 위한 조건 설정 */
    switch (iKind) {
        case 0:
            /* 휴직자 */
            strcpy( sSql1, "'511','512'");              //발령
            strcpy( sSql2, "'511','512','514'");        //발령 & 최종발령
            strcpy( sSql3, "'512','514'");              //최종발령
            strcpy( sSql4, "30,15,7");                  //알림 주기        
            break;
        case 1:
            /* 계약직 */
            strcpy( sSql1, "'131','132','134'");        //발령
            strcpy( sSql2, "'131','132','134','839'");  //발령 & 최종발령
            strcpy( sSql3, "'132','134','839'");        //최종발령
            strcpy( sSql4, "45,30,7");                  //알림 주기        
            break;
        case 2:
            /* 파견자 */
            strcpy( sSql1, "'411','412'");              //발령
            strcpy( sSql2, "'411','412','414'");        //발령 & 최종발령
            strcpy( sSql3, "'412','414'");              //최종발령
            strcpy( sSql4, "45,30,7");                  //알림 주기        
            break;
        case 3:
            /* 겸직자 */
            strcpy( sSql1, "'233'");                    //발령
            strcpy( sSql2, "'233','238'");              //발령 & 최종발령
            strcpy( sSql3, "'238'");                    //최종발령
            strcpy( sSql4, "45,30,7");                  //알림 주기        
            break;
        case 4:
            /* 겸무자 */
            strcpy( sSql1, "'234'");                    //발령
            strcpy( sSql2, "'234','235'");              //발령 & 최종발령
            strcpy( sSql3, "'235'");                    //최종발령
            strcpy( sSql4, "45,30,7");                  //알림 주기        
            break;
    }
    sprintf(strSql,"With Tab_Anno As \n"
                   "(Select Empno, Korname, Annono, Count(*) Over(Partition By Empno) As Tot,                        \n"
                   "        Row_Number() Over(Partition By Empno Order By Anfrdate, Annono, Ancode) As Rank,         \n"//Anfrdate, Annono 2개 필드 Order By  순서 변경 2019.02.11.
                   "        Ancode, Anfrdate, Antodate, Andetcode, Deptcode, Addeptcode, Adpayra, Writeemp,          \n"//Writeemp 최초작업자를 자동발령등록자로 2019.02.11                   
                   "        Case When Trim(Antodate) Is Null Then 99                                                 \n"
                   "        Else      To_Date(Antodate, 'YYYYMMDD') - To_Date('%s', 'YYYYMMDD') End As Restday       \n"
                   "   From Pihanno                                                                                  \n"
                   "  Where Empno In (Select Empno From Pihanno                                                      \n"
                   "                   Where Ancode In (%s) And Anfrdate<'%s' And Antodate>='%s' And Anupdyn='Y' )   \n"//Antodate가 기준일 이후 데이터
                   "    And Ancode In (%s)                                                                           \n"
                   "    And Empno In (Select Empno From Pimpmas Where Pstate<'80') )                                 \n"//2019.01.재직자만 처리토록 추가 
                   "Select * From                                                                                    \n"
                   "(Select Empno, Korname,                                                                          \n"
                   "        Max(Fanfrdate)  Fanfrdate,   Max(Fantodate)  Fantodate,   Max(Fancode)     Fancode,      \n"
                   "        Max(Fandetcode) Fandetcode,  Max(Fdeptcode)  Fdeptcode,   Max(Faddeptcode) Faddeptcode,  \n"
                   "        Max(Fadpayra)   Fadpayra,    Max(Fwriteemp)  Fwriteemp,   Max(Lancode)     Lancode,      \n"//Fwriteemp 추가
                   "        Max(Lanfrdate)  Lanfrdate,   Max(Lantodate)  Lantodate,   Max(Restday)     Restday       \n"
                   "  From (Select S.Empno, Korname, Annono,                                                         \n"
                   "               Case When  S.Rank=A.Rank Then Ancode     Else '' End Fancode,                     \n"
                   "               Case When  S.Rank=A.Rank Then Anfrdate   Else '' End Fanfrdate,                   \n"
                   "               Case When  S.Rank=A.Rank Then Antodate   Else '' End Fantodate,                   \n"
                   "               Case When  S.Rank=A.Rank Then Andetcode  Else '' End Fandetcode,                  \n"
                   "               Case When  S.Rank=A.Rank Then Deptcode   Else '' End Fdeptcode,                   \n"
                   "               Case When  S.Rank=A.Rank Then Addeptcode Else '' End Faddeptcode,                 \n"
                   "               Case When  S.Rank=A.Rank Then Adpayra    Else '' End Fadpayra,                    \n"
                   "               Case When  S.Rank=A.Rank Then Writeemp   Else '' End Fwriteemp,                   \n"//Fwriteemp 추가
                   "               Case When  S.Rank=A.Rank Then Restday    Else 0  End Restday,                     \n"
                   "               Case When (S.Rank=B.Rank) And (S.Rank=S.Tot) Then Ancode   Else '' End Lancode,   \n"
                   "               Case When (S.Rank=B.Rank) And (S.Rank=S.Tot) Then Anfrdate Else '' End Lanfrdate, \n"
                   "               Case When (S.Rank=B.Rank) And (S.Rank=S.Tot) Then Antodate Else '' End Lantodate  \n"
                   "          From Tab_Anno S,                                                                       \n"
                   "              (Select Empno, Max(Rank) Rank From Tab_Anno Where Ancode In (%s) Group By Empno) A,\n"
                   "              (Select Empno, Max(Rank) Rank From Tab_Anno Where Ancode In (%s) Group By Empno) B \n"
                   "         Where S.Empno = A.Empno And A.Empno = B.Empno(+) )                                      \n"
                   "  Group By Empno, Korname )                                                                      \n"
                   " Where Restday In (%s) ", workAntodate, sSql1, workAntodate, workAntodate, sSql2, sSql1, sSql3, sSql4);
    /*sprintf(strSql,"WITH TAB_ANNO AS                                                                              \n"
                   "(SELECT EMPNO, KORNAME, ANNONO, ROW_NUMBER() OVER(PARTITION BY EMPNO ORDER BY ANNONO) AS RANK,  \n"
                   "        COUNT(*) OVER(PARTITION BY EMPNO) AS TOT, ANCODE, ANFRDATE, ANTODATE, ANDETCODE, ADDEPTCODE, ADPAYRA, \n"
                   "        CASE WHEN TRIM(ANTODATE) IS NULL THEN 99                                                \n"
                   "        ELSE TO_DATE(ANTODATE, 'YYYYMMDD') - TO_DATE('%s', 'YYYYMMDD')  END AS RESTDAY          \n"
                   "   FROM PIHANNO                               \n"
                   "  WHERE EMPNO IN (SELECT EMPNO                \n"
                   "                    FROM PIHANNO              \n"
                   "                   WHERE ANCODE IN (%s)       \n"
                   "                     AND ANFRDATE < '%s'      \n"
                   "                     AND ANTODATE >= '%s'     \n"
                   "                     AND ANUPDYN = 'Y')       \n"
                   "    AND ANCODE IN (%s))                       \n"
                   "SELECT * FROM (                               \n"
                   "SELECT EMPNO, KORNAME, MAX(FANCODE) AS FANCODE, MAX(FANFRDATE) AS FANFRDATE, MAX(FANTODATE) AS FANTODATE,   \n"
                   "       MAX(FANDETCODE) AS FANDETCODE, MAX(FADDEPTCODE) AS FADDEPTCODE, MAX(FADPAYRA) AS FADPAYRA,           \n"
                   "       MAX(LANCODE) AS LANCODE, MAX(LANFRDATE) AS LANFRDATE,                         \n"
                   "       MAX(LANTODATE) AS LANTODATE, MAX(RESTDAY) AS RESTDAY                          \n"
                   "  FROM (SELECT S.EMPNO, KORNAME, ANNONO,                                             \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANCODE   ELSE '' END AS FANCODE,       \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANFRDATE ELSE '' END AS FANFRDATE,     \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANTODATE ELSE '' END AS FANTODATE,     \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANDETCODE ELSE '' END AS FANDETCODE,   \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ADDEPTCODE ELSE '' END AS FADDEPTCODE, \n"                     
                   "               CASE WHEN S.RANK = A.RANK THEN ADPAYRA ELSE '' END AS FADPAYRA,       \n"               
                   "               CASE WHEN S.RANK = A.RANK THEN RESTDAY  ELSE 0  END AS RESTDAY,       \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANCODE   ELSE '' END AS LANCODE,   \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANFRDATE ELSE '' END AS LANFRDATE, \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANTODATE ELSE '' END AS LANTODATE  \n"
                   "          FROM TAB_ANNO S,                                                                              \n"
                   "               (SELECT EMPNO, MAX(RANK) AS RANK FROM TAB_ANNO WHERE ANCODE IN (%s) GROUP BY EMPNO) A,   \n"
                   "               (SELECT EMPNO, MAX(RANK) AS RANK FROM TAB_ANNO WHERE ANCODE IN (%s) GROUP BY EMPNO) B    \n"
                   "        WHERE S.EMPNO = A.EMPNO       \n"
                   "          AND A.EMPNO = B.EMPNO(+))   \n"
                   " GROUP BY EMPNO, KORNAME              \n"
                   " ORDER BY EMPNO)                      \n"
                   " WHERE RESTDAY IN (%s) ", workAntodate, sSql1, workAntodate, workAntodate, sSql2, sSql1, sSql3, sSql4);*/

    if (iKind ==4) printf("SQL => [%s],[%d]\n", strSql, strlen(strSql)) ;

    /* EXEC SQL PREPARE S FROM :strSql; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )62;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strSql;
    sqlstm.sqhstl[0] = (unsigned long )4096;
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


    /* EXEC SQL DECLARE cur_anno CURSOR FOR S; */ 

    /* EXEC SQL OPEN cur_anno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )81;
    sqlstm.selerr = (unsigned short)1;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqcmod = (unsigned int )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    if(SQLCODE != SQL_OK)
    {
        /* EXEC SQL CLOSE cur_anno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )96;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        STRINIT(&logText);
        sprintf(logText, "Cursor(cur_anno,%d) Open Fail : %s", iKind, SQLERRM);
        logWrite(logText);
        return;
    }
    
if (DEBUG)  printf("START WHILE\n");
    
    while(TRUE)
    {
        //사원번호별 Transaction 시작
        /* EXEC SQL SAVEPOINT emp_anno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "savepoint emp_anno";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )111;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        init_variable(1);   // 발령사항 FETCH 레코드를 Clear 한다..

        /* EXEC SQL FETCH cur_anno INTO
                :GP_anno->empno,     :GP_anno->korname,
                :GP_anno->fanfrdate, :GP_anno->fantodate,   :GP_anno->fancode,    :GP_anno->fandetcode, 
                :GP_anno->fdeptcode, :GP_anno->faddeptcode, :GP_anno->fadpayra,
                :GP_anno->lancode,   :GP_anno->lanfrdate,   :GP_anno->lantodate,  :GP_anno->restday; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )126;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqfoff = (         int )0;
        sqlstm.sqfmod = (unsigned int )2;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->empno);
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->korname);
        sqlstm.sqhstl[1] = (unsigned long )15;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->fanfrdate);
        sqlstm.sqhstl[2] = (unsigned long )11;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_anno->fantodate);
        sqlstm.sqhstl[3] = (unsigned long )11;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&(GP_anno->fancode);
        sqlstm.sqhstl[4] = (unsigned long )6;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->fandetcode);
        sqlstm.sqhstl[5] = (unsigned long )5;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         short *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned long )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->fdeptcode);
        sqlstm.sqhstl[6] = (unsigned long )9;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         short *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned long )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->faddeptcode);
        sqlstm.sqhstl[7] = (unsigned long )9;
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         short *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned long )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->fadpayra);
        sqlstm.sqhstl[8] = (unsigned long )6;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         short *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned long )0;
        sqlstm.sqadto[8] = (unsigned short )0;
        sqlstm.sqtdso[8] = (unsigned short )0;
        sqlstm.sqhstv[9] = (unsigned char  *)&(GP_anno->lancode);
        sqlstm.sqhstl[9] = (unsigned long )6;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         short *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned long )0;
        sqlstm.sqadto[9] = (unsigned short )0;
        sqlstm.sqtdso[9] = (unsigned short )0;
        sqlstm.sqhstv[10] = (unsigned char  *)&(GP_anno->lanfrdate);
        sqlstm.sqhstl[10] = (unsigned long )11;
        sqlstm.sqhsts[10] = (         int  )0;
        sqlstm.sqindv[10] = (         short *)0;
        sqlstm.sqinds[10] = (         int  )0;
        sqlstm.sqharm[10] = (unsigned long )0;
        sqlstm.sqadto[10] = (unsigned short )0;
        sqlstm.sqtdso[10] = (unsigned short )0;
        sqlstm.sqhstv[11] = (unsigned char  *)&(GP_anno->lantodate);
        sqlstm.sqhstl[11] = (unsigned long )11;
        sqlstm.sqhsts[11] = (         int  )0;
        sqlstm.sqindv[11] = (         short *)0;
        sqlstm.sqinds[11] = (         int  )0;
        sqlstm.sqharm[11] = (unsigned long )0;
        sqlstm.sqadto[11] = (unsigned short )0;
        sqlstm.sqtdso[11] = (unsigned short )0;
        sqlstm.sqhstv[12] = (unsigned char  *)&(GP_anno->restday);
        sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[12] = (         int  )0;
        sqlstm.sqindv[12] = (         short *)0;
        sqlstm.sqinds[12] = (         int  )0;
        sqlstm.sqharm[12] = (unsigned long )0;
        sqlstm.sqadto[12] = (unsigned short )0;
        sqlstm.sqtdso[12] = (unsigned short )0;
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


                
        if (DEBUG)  printf("Debug 1 code[%d]\n", SQLCODE);
        if (SQLCODE == SQL_NO_DATA)
        {
            /* EXEC SQL CLOSE cur_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )193;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            if (iKindCount == 0)
            {
                STRINIT(&logText);
                sprintf(logText, "Data not found(cur_anno,%d)!!", iKind);
                logWrite(logText);
            }
            else
                ReadAnno += iKindCount;     //  전체 조회건수 + 발령코드별 조회건수
            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )208;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "Cursor(cur_anno,%d) Fetch Error : %s", iKind, SQLERRM);
            logWrite(logText);
            return;
        }
        iKindCount ++;  // 조회 숫자 +1

        switch (iKind) {
            case 0:     // 휴직자 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우
if(DEBUG) printf("휴직자 처리 1,lancode[%s],fancode[%s],fantodate[%s]\n", GP_anno->lancode.arr, GP_anno->fancode.arr, GP_anno->fantodate.arr);
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "514") != 0)))
                { 
                    SendAlarm(iKind); //안내 발송
                }
                break;
            case 1:     // 계약직 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "839") != 0)))
                {
                    SendAlarm(iKind); //안내 발송
                }
                break;
            case 2:     // 파견자 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "414") != 0)))
                {
                    SendAlarm(iKind); //안내 발송
                }
                break;
            case 3:     // 겸직자 : 겸직해제 발령이 없는 경우
                if (strcmp(GP_anno->lancode.arr, "") == 0) 
                {   
                    SendAlarm(iKind); //안내 발송
                }
                break;
            case 4:     // 겸무자 : 겸무해제 발령이 없는 경우
                if (strcmp(GP_anno->lancode.arr, "") == 0) 
                {
                    SendAlarm(iKind); //안내 발송
                }
                break;
        }
        if (strcmp(logText, "") != 0) 
        {
            /* EXEC SQL ROLLBACK TO SAVEPOINT emp_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "rollback  to emp_anno";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )223;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   // 1건 취소
            logWrite(logText);
            ErrorAnno ++;
        }
        else
            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )238;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

       // 1건 저장
    } /* End While */
    
    if (DEBUG)  printf("END WHILE\n\n");
    return;
}

int SendAlarm(int iSel)
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

        /* varchar     retcont[40]; */ 
struct { unsigned short len; unsigned char arr[40]; } retcont;

        /* varchar     rcvr_empno[4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } rcvr_empno;

        /* varchar     emptext[1024]; */ 
struct { unsigned short len; unsigned char arr[1024]; } emptext;

        /* varchar     sendtext[1024]; */ 
struct { unsigned short len; unsigned char arr[1024]; } sendtext;

    /* EXEC SQL END DECLARE SECTION; */ 

    char strSql[4096];
    char strSql1[4096];
    char strHeader[50];
    int  cntHRteam = 0;

    STRINIT(&emptext);
    STRINIT(&sendtext);
    STRINIT(&strHeader);

if (DEBUG)  printf("Start SendAlarm\n");
    
    /* 전송 Message 설정 */
    switch (iSel) {
        case 0:   //휴직자
            if (GP_anno->restday == 30) 
            {
               strcpy(strHeader, "휴직 종료일 안내");
               // 휴직구성원
               sprintf((char *)emptext.arr, "%s 매니저님의 휴직 종료일은 %4.4s년%2.2s월%2s일로 오늘이 휴직 종료 %d일 전입니다. 휴직 종료 15일 전까지 복직원을 제출해주시고, 변경 사항이 있다면 HR 담당자에게 문의 바랍니다.", 
                       GP_anno->korname.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);		 
                                  
               // HR팀        
                     sprintf((char *)sendtext.arr, "휴직자 [%s:%s]님의 휴직 종료일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                        GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);

               emptext.len  = strlen(emptext.arr);
               sendtext.len = strlen(sendtext.arr);
            
               break;
            }
            else
            {

               strcpy(strHeader, "휴직 종료일 안내");
               // 휴직구성원
               sprintf((char *)emptext.arr, "%s 매니저님의 휴직 종료일은 %4.4s년%2.2s월%2s일로 오늘이 휴직 종료 %d일 전입니다. 복직원 제출 여부를 확인해주시고, 변경 사항이 있다면 HR 담당자에게 문의 바랍니다.", 
                        GP_anno->korname.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);			
                            
               // HR팀        
                     sprintf((char *)sendtext.arr, "휴직자 [%s:%s]님의 휴직 종료일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                        GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);
               
               emptext.len  = strlen(emptext.arr);
               sendtext.len = strlen(sendtext.arr);

               break;               
            }
        case 1:   //계약직
            strcpy(strHeader, "계약 종료일 안내");
            sprintf((char *)sendtext.arr, "계약직 [%s:%s]님의 계약 종료일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                    GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);
            sendtext.len = strlen(sendtext.arr);
            break;
        case 2:   //파견자
            strcpy(strHeader, "파견 종료일 안내");
            sprintf((char *)sendtext.arr, "파견자 [%s:%s]님의 파견 종료일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                    GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);
            sendtext.len = strlen(sendtext.arr);
            break;
        case 3:   //겸직자
            strcpy(strHeader, "겸직 해제일 안내");
            sprintf((char *)sendtext.arr, "겸직자 [%s:%s]님의 겸직 해제일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                    GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);
            sendtext.len = strlen(sendtext.arr);
            break;
        case 4:   //겸무자
            strcpy(strHeader, "겸무 해제일 안내");
            sprintf((char *)sendtext.arr, "겸무자 [%s:%s]님의 겸무 해제일은 [%4.4s년%2.2s월%2s일], %d일 전입니다.",
                    GP_anno->korname.arr, GP_anno->empno.arr, (char *)GP_anno->fantodate.arr, (char *)GP_anno->fantodate.arr+4, (char *)GP_anno->fantodate.arr+6, GP_anno->restday);
            sendtext.len = strlen(sendtext.arr);
            break;
    }

    /* 전송대상 HR팀원 커서로 조회 */
    STRINIT(&strSql);
    strcpy(strSql, "SELECT B.EMPNO, replace(B.RETCONT,'-','')   "
                   "  FROM PYMENUUSER A, PIMPMAS B              "
                   " WHERE A.EMPNO   = B.EMPNO                  "
                   "   AND A.GROUPID = 'G011'                   "
                   "   AND B.PSTATE <= '21'                     "
                   "   AND B.PAYRA   > 'C11'                    "
                   "   AND A.EMPNO   < '9999'                   "
                   "Union Select 'Z113', '01053655222' From Dual");
    
    /* EXEC SQL PREPARE SS FROM :strSql; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 13;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )253;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strSql;
    sqlstm.sqhstl[0] = (unsigned long )4096;
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


    /* EXEC SQL DECLARE cur_hrteam CURSOR FOR SS; */ 

    /* EXEC SQL OPEN cur_hrteam; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 13;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )272;
    sqlstm.selerr = (unsigned short)1;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqcmod = (unsigned int )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    if(SQLCODE != SQL_OK)
    {
        /* EXEC SQL CLOSE cur_hrteam; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )287;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        STRINIT(&logText);
        sprintf(logText, "Cursor(cur_hrteam) Open Fail : %s", SQLERRM);
        return 0;
    }
    while(TRUE)
    {
        STRINIT(&rcvr_empno);
        STRINIT(&retcont);
        
        /* EXEC SQL FETCH cur_hrteam INTO :rcvr_empno, :retcont; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )302;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqfoff = (         int )0;
        sqlstm.sqfmod = (unsigned int )2;
        sqlstm.sqhstv[0] = (unsigned char  *)&rcvr_empno;
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&retcont;
        sqlstm.sqhstl[1] = (unsigned long )42;
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



        if (SQLCODE == SQL_NO_DATA)
        {
            /* EXEC SQL CLOSE cur_hrteam; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )325;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            if (cntHRteam == 0)
            {
                STRINIT(&logText);
                strcpy(logText, "Data not found(cur_hrteam)!!");
            }
            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_hrteam; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )340;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "Cursor(cur_hrteam) Fetch Error : %s", SQLERRM);
            return 0;
        }
        /* 메일 발송 테이블에 Insert */
        /* EXEC SQL
        INSERT INTO PZHMAIL
               (SENDTIME,   /o 메일발송 작업시간o/
                SENDPROG,   /o 발송프로그램 ID	 o/
                SEND_PER,   /o 발신자 사번			 o/
                RCVR_PER,   /o 수신자 사번      o/
                SUBJECT,    /o 메일제목				 o/
                BODY1,      /o 메일내용		     o/
                RECEIVEYN,  /o 'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기 o/ 
                EAI_FLAG)   
        VALUES (TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'),
                'pic1062g', 
                :jobEmpno, 
                :rcvr_empno,
                :strHeader,
                :sendtext,
                'N',
                'N'); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR\
_PER,SUBJECT,BODY1,RECEIVEYN,EAI_FLAG) values (TO_CHAR(SYSDATE,'YYYYMMDDHH24M\
ISS'),'pic1062g',:b0,:b1,:b2,:b3,'N','N')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )355;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)jobEmpno;
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&rcvr_empno;
        sqlstm.sqhstl[1] = (unsigned long )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)strHeader;
        sqlstm.sqhstl[2] = (unsigned long )50;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&sendtext;
        sqlstm.sqhstl[3] = (unsigned long )1026;
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



        if(SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_hrteam; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )386;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "메일 발송 실패(HR팀)!!사원번호[%s]:%s", rcvr_empno.arr, SQLERRM);
            return 0;
        }
        MailCount ++;
        
        /* SMS 발송 Stored Procudere 실행    printf("test1 sql[%s]\n", strSql1);  */
        STRINIT(&strSql1);
        sprintf(strSql1, "Call SENDSMS(trim('%s'), trim('%s'), '%s', '%s')", (char *)retcont.arr, (char *)retTel.arr, (char *)sendtext.arr, strHeader);
        /* EXEC SQL EXECUTE IMMEDIATE :strSql1; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )401;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql1;
        sqlstm.sqhstl[0] = (unsigned long )4096;
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



        if(SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_hrteam; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )420;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "SMS 발송 실패 : %s", SQLERRM);
            return 0;
        }
        SmsCount ++;
             
        cntHRteam ++;
    }
    
    if (iSel == 0)
    {
        /* EXEC SQL SELECT REPLACE(RETCONT,'-','') RETCONT 
                   INTO :retcont
                   FROM PIMPMAS 
                  WHERE EMPNO = :GP_anno->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select REPLACE(RETCONT,'-','') RETCONT into :b0  fro\
m PIMPMAS where EMPNO=:b1";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )435;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&retcont;
        sqlstm.sqhstl[0] = (unsigned long )42;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


    	
        /* SMS 발송 Stored Procudere 실행, 휴직자에게 자동 복직일 안내   printf("test2 sql[%s]\n", strSql1);  */
        STRINIT(&strSql1);
        sprintf(strSql1, "Call SENDSMS(trim('%s'), trim('%s'), '%s', '%s')", (char *)retcont.arr, (char *)retTel.arr, (char *)emptext.arr, strHeader);
        /* EXEC SQL EXECUTE IMMEDIATE :strSql1; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )458;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql1;
        sqlstm.sqhstl[0] = (unsigned long )4096;
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



        if(SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_hrteam; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 13;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )477;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "SMS 발송 실패(HR팀)!!사원번호[%s]:%s", rcvr_empno.arr, SQLERRM);
            return 0;
        }
        SmsCount ++;    
 
    }
    return 1;
}

/* TABLE에 프로그램 실행 로그를 저장 */
void logWrite(char *strMessage)
{
    /* EXEC SQL INSERT INTO PYBATLOG (RUNDATE, PROGID, SEQNO, WRITEMAN, RESULT)
             VALUES (:jobTime, 'pic1062g', :logCount, :jobEmpno, :strMessage); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 13;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PYBATLOG (RUNDATE,PROGID,SEQNO,WRITEMAN,RESU\
LT) values (:b0,'pic1062g',:b1,:b2,:b3)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )492;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)jobTime;
    sqlstm.sqhstl[0] = (unsigned long )15;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&logCount;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)jobEmpno;
    sqlstm.sqhstl[2] = (unsigned long )5;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)strMessage;
    sqlstm.sqhstl[3] = (unsigned long )0;
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



    if (SQLCODE != SQL_OK) 
        printf("Log Write Fail!![%s]\n", SQLERRM);
    else
        /* EXEC SQL COMMIT WORK; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 13;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )523;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    logCount ++;
}
