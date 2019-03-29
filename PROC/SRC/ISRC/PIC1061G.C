
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
    "pic1061g.pc"
};


static unsigned int sqlctx = 149283;


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
   unsigned char  *sqhstv[18];
   unsigned long  sqhstl[18];
            int   sqhsts[18];
            short *sqindv[18];
            int   sqinds[18];
   unsigned long  sqharm[18];
   unsigned long  *sqharc[18];
   unsigned short  sqadto[18];
   unsigned short  sqtdso[18];
} sqlstm = {12,18};

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
5,0,0,1,55,0,4,103,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,63,0,4,148,0,0,1,0,0,1,0,2,97,0,0,
43,0,0,3,0,0,17,279,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,3,0,0,45,281,0,0,0,0,0,1,0,
77,0,0,3,0,0,15,285,0,0,0,0,0,1,0,
92,0,0,4,18,0,1,297,0,0,0,0,0,1,0,
107,0,0,3,0,0,13,301,0,0,14,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,
178,0,0,3,0,0,15,310,0,0,0,0,0,1,0,
193,0,0,3,0,0,15,321,0,0,0,0,0,1,0,
208,0,0,5,21,0,43,372,0,0,0,0,0,1,0,
223,0,0,6,0,0,29,377,0,0,0,0,0,1,0,
238,0,0,7,72,0,5,387,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
261,0,0,8,0,0,29,399,0,0,0,0,0,1,0,
276,0,0,9,192,0,4,431,0,0,6,1,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,1,
9,0,0,
315,0,0,10,638,0,3,477,0,0,18,18,0,1,0,1,9,0,0,1,9,0,0,1,97,0,0,1,97,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,9,0,0,
402,0,0,11,176,0,4,549,0,0,1,0,0,1,0,2,97,0,0,
421,0,0,12,247,0,3,561,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
448,0,0,13,95,0,3,591,0,0,4,4,0,1,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
479,0,0,14,0,0,29,597,0,0,0,0,0,1,0,
};


/*------------------------------------------------------------------------------
    PROGRAM-NAME    : PIC1061G(인사발령 복귀/복직 자동등록)
    SYSTEM-NAME     : 종합인사정보 
    SUBSYSTEM-NAME  : 인사
    Programmer      : 
    Version         : 1.0
    Date            : 2018.08.08
    Update Contents
    버전    수정일    수정자   관련근거                 수정내용
 -------------------------------------------------------------------------------
    1.00  2018.08.08   이성규                      신규프로그램 개발
    1.01  2018.09.27   신범주                      자동복직처리(PIC1061G)와 알림(PIC1062G)을 분리함
    1.02  2019.01.00   발령종료일에 자동등록(08시경,pic1061g)으로 HR팀 반영전 조회가능하고, 
                       발령예약일을 익일로 저장하여 자동반영(01시경,pic1065g)토록 함
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

        /* varchar fwriteemp   [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } fwriteemp;
 //2019.02.11 Add
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


/* 복귀 발령 관련 변수 */
char   newAnnono[8+1];
char   newAnseqno[4+1];
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
int  AppointAnno;           /* 발령 건수 */
int  ErrorAnno;             /* Error 건수 */
int  SeqnoCount;            /* 발령번호의 순번 저장 */
void init_variable(int);    /* 변수 초기화 */
void Proc_anno(int);        /* 발령사항 처리 */
int  InsertAnno(int);       /* 복귀발령 입력 */
int  InsertHanba(int);      /* 신규 발령근거 입력 */
void logWrite(char *);      /* 프로그램 실행 로그 저장 */
int  iKindCount1 = 0;
int  iKindCount2 = 0;

main(argc,argv)
int argc; 
char *argv[];
{ 
    int iJob = 0;
    
    /* 서버 상의 Log File을 생성 및 기록하기 위한 함수. 삭제 시 컴파일 에러 발생 */
    hinsa_log_print(0,"PIC1061G(인사발령 자동 복직처리) 프로그램 시작...");
    
    hinsa_db_connect();

    /* 전역변수 초기화 */
    init_variable(0);
    
    // 프로그램 호출방법 정리 : Cron에서 호출, 예)pic1061g 20180801[일자]
    strcpy(jobEmpno, "CRON");
    strcpy(workAntodate, argv[1]);
    
    if (strlen(workAntodate) <= 0)
        /* EXEC SQL 
        SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') INTO :workAntodate FROM DUAL; */ 

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

  //작업기준일(발령종료일)

    logWrite("인사발령 자동 복직처리 프로그램 시작...");

    /* 휴직/계약/파견/겸직/겸무에 대한 순차 처리 */
    for (iJob = 0; iJob < 5; iJob++)
    {
        STRINIT(&newAnnono);     /* 신규 발령번호 */
        SeqnoCount = 1;          /* 발령번호 순번 : 발령이 필요한 경우 각 상태마다 별도 발령번호로 발령을 내기 위함 */
        Proc_anno(iJob);
        printf("Proc_anno Start : 발령기준일[%s],발령종류[%d],대상건수[%d],Insert건수[%d]\n", workAntodate, iJob, iKindCount1, iKindCount2);
        sprintf(logText, "Proc_anno Start : 발령기준일[%s],발령종류[%d],대상건수[%d],Insert건수[%d]\n", workAntodate, iJob, iKindCount1, iKindCount2);
        logWrite(logText);
    }

    STRINIT(&logText);
    sprintf(logText, "작업종료 : 조회[%d]인사발령[%d]Error[%d]", ReadAnno, AppointAnno, ErrorAnno);
    logWrite(logText);

    logWrite("인사발령 자동 복직처리 프로그램 종료..");
    
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

    ReadAnno = 0;            /* 읽은 건수 */
    AppointAnno = 0;         /* 발령 건수 */
    ErrorAnno = 0;           /* Error 건수 */
    
    STRINIT(&newAnseqno);    /* 신규 발령번호 순번 */
    STRINIT(&jobEmpno);      /* 작업자사번 */
    STRINIT(&workAntodate);  /* 작업기준일 */

    /* 로그기록시간 저장 */
    /* EXEC SQL SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') INTO :jobTime FROM DUAL; */ 

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



}

/* 발령사항 처리 */
void Proc_anno(int iKind)
{
    char strSql[4096];
    char sSql1[30];
    char sSql2[30];
    char sSql3[30];
    char sSql4[30];
    
    STRINIT(&strSql);
    STRINIT(&sSql1);
    STRINIT(&sSql2);
    STRINIT(&sSql3);
    STRINIT(&sSql4);
    iKindCount1 = 0;
    iKindCount2 = 0;
    
    /* 발령코드별 조회를 위한 조건 설정 */
    switch (iKind) {
        case 0:   /* 휴직자(익일)*/
            strcpy( sSql1, "'511','512'");              //발령(휴직/휴직연장)
            strcpy( sSql2, "'511','512','514'");        //발령 & 최종발령(휴직/휴직연장/복직)
            strcpy( sSql3, "'512','514'");              //최종발령
            strcpy( sSql4, "0");                        //알림 주기(남은일수)
            break;
        case 1:   /* 계약직 */
            strcpy( sSql1, "'131','132','134'");        //발령(계약/계약연장/재계약)
            strcpy( sSql2, "'131','132','134','839'");  //발령 & 최종발령(계약/계약연장/재계약/계약해지)
            strcpy( sSql3, "'132','134','839'");        //최종발령
            strcpy( sSql4, "0");                        //알림 주기(남은일수)
            break;
        case 2:   /* 파견자(익일) */
            strcpy( sSql1, "'411','412'");              //발령(파견/파견연장)
            strcpy( sSql2, "'411','412','414'");        //발령 & 최종발령(파견/파견연장/파견복귀)
            strcpy( sSql3, "'412','414'");              //최종발령
            strcpy( sSql4, "0");                        //알림 주기(남은일수)
            break;
        case 3:   /* 겸직자 */
            strcpy( sSql1, "'233'");                    //발령(겸직)
            strcpy( sSql2, "'233','238'");              //발령 & 최종발령(겸직/겸직해제)
            strcpy( sSql3, "'238'");                    //최종발령
            strcpy( sSql4, "0");                        //알림 주기(남은일수)
            break;
        case 4:   /* 겸무자 */
            strcpy( sSql1, "'234'");                    //발령(겸무)
            strcpy( sSql2, "'234','235'");              //발령 & 최종발령(겸무/겸무해제)
            strcpy( sSql3, "'235'");                    //최종발령
            strcpy( sSql4, "0");                        //알림 주기(남은일수)
            break;
    }
    /*2019.01. 부서 등록 오류로 인하여 수정작업 */
    sprintf(strSql,"With Tab_Anno As \n"
                   "(Select Empno, Korname, Annono, Count(*) Over(Partition By Empno) As Tot,                        \n"
                   "        Row_Number() Over(Partition By Empno Order By Anfrdate, Annono, Ancode) As Rank,         \n"//Anfrdate, Annono 2개 필드 Order By  순서 변경 2019.02.11.
                   "        Ancode, Anfrdate, Antodate, Andetcode, Deptcode, Addeptcode, Adpayra, Writeemp,          \n"//Writeemp 최초작업자를 자동발령등록자로 2019.02.11
                   "        Case When Trim(Antodate) Is Null Then 99                                                 \n"
                   "        Else      To_Date(Antodate, 'YYYYMMDD') - To_Date('%s', 'YYYYMMDD') End As Restday       \n"
                   "   From Pihanno                                                                                  \n"
                   "  Where Empno In (Select Empno From Pihanno                                                      \n"
                   "                   Where Ancode In (%s) And Anfrdate<'%s' And Antodate='%s' And Anupdyn='Y')     \n"//Antodate가 기준일 당일 데이터
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
                   "        ELSE TO_DATE(ANTODATE,'YYYYMMDD')+1 - TO_DATE('%s', 'YYYYMMDD') END AS RESTDAY          \n"
                   "   FROM PIHANNO                               \n"
                   "  WHERE EMPNO IN (SELECT EMPNO                \n"
                   "                    FROM PIHANNO              \n"
                   "                   WHERE ANCODE IN (%s)       \n"
                   "                     AND ANFRDATE < '%s'      \n"
                   "                     AND ANTODATE >= '%s'     \n"
                   "                     AND ANUPDYN = 'Y')       \n"
                   "    AND ANCODE IN (%s))                       \n"
                   "SELECT * FROM (                               \n"
                   "SELECT EMPNO, KORNAME, MAX(FANCODE) AS FANCODE, MAX(FANFRDATE) AS FANFRDATE, MAX(FANTODATE) AS FANTODATE,\n"
                   "       MAX(FANDETCODE) AS FANDETCODE, MAX(FADDEPTCODE) AS FADDEPTCODE, MAX(FADPAYRA) AS FADPAYRA,        \n"
                   "       MAX(LANCODE) AS LANCODE, MAX(LANFRDATE) AS LANFRDATE,                                             \n"
                   "       MAX(LANTODATE) AS LANTODATE, MAX(RESTDAY) AS RESTDAY                                              \n"
                   "  FROM (SELECT S.EMPNO, KORNAME, ANNONO,                                                                 \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANCODE   ELSE '' END AS FANCODE,                           \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANFRDATE ELSE '' END AS FANFRDATE,                         \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANTODATE ELSE '' END AS FANTODATE,                         \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ANDETCODE ELSE '' END AS FANDETCODE,                       \n"
                   "               CASE WHEN S.RANK = A.RANK THEN ADDEPTCODE ELSE '' END AS FADDEPTCODE,                     \n"                     
                   "               CASE WHEN S.RANK = A.RANK THEN ADPAYRA ELSE '' END AS FADPAYRA,                           \n"               
                   "               CASE WHEN S.RANK = A.RANK THEN RESTDAY  ELSE 0  END AS RESTDAY,                           \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANCODE   ELSE '' END AS LANCODE,    \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANFRDATE ELSE '' END AS LANFRDATE,  \n"
                   "               CASE WHEN (S.RANK = B.RANK) AND (S.RANK = S.TOT) THEN ANTODATE ELSE '' END AS LANTODATE   \n"
                   "          FROM TAB_ANNO S,                                                                               \n"
                   "               (SELECT EMPNO, MAX(RANK) AS RANK FROM TAB_ANNO WHERE ANCODE IN (%s) GROUP BY EMPNO) A,    \n"
                   "               (SELECT EMPNO, MAX(RANK) AS RANK FROM TAB_ANNO WHERE ANCODE IN (%s) GROUP BY EMPNO) B     \n"
                   "        WHERE S.EMPNO = A.EMPNO       \n"
                   "          AND A.EMPNO = B.EMPNO(+))   \n"
                   " GROUP BY EMPNO, KORNAME              \n"
                   " ORDER BY EMPNO)                      \n"
                   " WHERE RESTDAY IN (%s) ", workAntodate, sSql1, workAntodate, workAntodate, sSql2, sSql1, sSql3, sSql4);*/

    if (iKind == 0) printf("SQL => [%s],[%d]\n", strSql, strlen(strSql)) ;

    /* EXEC SQL PREPARE S FROM :strSql; */ 

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
    sqlstm.offset = (unsigned int  )62;
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
        sqlstm.offset = (unsigned int  )77;
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
        sqlstm.offset = (unsigned int  )92;
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
                :GP_anno->fdeptcode, :GP_anno->faddeptcode, :GP_anno->fadpayra,   :GP_anno->fwriteemp,
                :GP_anno->lancode,   :GP_anno->lanfrdate,   :GP_anno->lantodate,  :GP_anno->restday; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 14;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )107;
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
        sqlstm.sqhstv[9] = (unsigned char  *)&(GP_anno->fwriteemp);
        sqlstm.sqhstl[9] = (unsigned long )7;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         short *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned long )0;
        sqlstm.sqadto[9] = (unsigned short )0;
        sqlstm.sqtdso[9] = (unsigned short )0;
        sqlstm.sqhstv[10] = (unsigned char  *)&(GP_anno->lancode);
        sqlstm.sqhstl[10] = (unsigned long )6;
        sqlstm.sqhsts[10] = (         int  )0;
        sqlstm.sqindv[10] = (         short *)0;
        sqlstm.sqinds[10] = (         int  )0;
        sqlstm.sqharm[10] = (unsigned long )0;
        sqlstm.sqadto[10] = (unsigned short )0;
        sqlstm.sqtdso[10] = (unsigned short )0;
        sqlstm.sqhstv[11] = (unsigned char  *)&(GP_anno->lanfrdate);
        sqlstm.sqhstl[11] = (unsigned long )11;
        sqlstm.sqhsts[11] = (         int  )0;
        sqlstm.sqindv[11] = (         short *)0;
        sqlstm.sqinds[11] = (         int  )0;
        sqlstm.sqharm[11] = (unsigned long )0;
        sqlstm.sqadto[11] = (unsigned short )0;
        sqlstm.sqtdso[11] = (unsigned short )0;
        sqlstm.sqhstv[12] = (unsigned char  *)&(GP_anno->lantodate);
        sqlstm.sqhstl[12] = (unsigned long )11;
        sqlstm.sqhsts[12] = (         int  )0;
        sqlstm.sqindv[12] = (         short *)0;
        sqlstm.sqinds[12] = (         int  )0;
        sqlstm.sqharm[12] = (unsigned long )0;
        sqlstm.sqadto[12] = (unsigned short )0;
        sqlstm.sqtdso[12] = (unsigned short )0;
        sqlstm.sqhstv[13] = (unsigned char  *)&(GP_anno->restday);
        sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[13] = (         int  )0;
        sqlstm.sqindv[13] = (         short *)0;
        sqlstm.sqinds[13] = (         int  )0;
        sqlstm.sqharm[13] = (unsigned long )0;
        sqlstm.sqadto[13] = (unsigned short )0;
        sqlstm.sqtdso[13] = (unsigned short )0;
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
            sqlstm.arrsiz = 14;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )178;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            if (iKindCount1 == 0)
            {
                //printf("Data not found(cur_anno,%d)!!\n", iKind);
            }
            else
                ReadAnno += iKindCount1;     //  전체 조회건수 + 발령코드별 조회건수
            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 14;
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


            STRINIT(&logText);
            sprintf(logText, "Cursor(cur_anno,%d) Fetch Error : %s", iKind, SQLERRM);
            logWrite(logText);
            return;
        }
        iKindCount1 ++;    //조회 숫자 +1

        switch (iKind) {
            case 0:     // 휴직자 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우 InsertAnno
if(DEBUG) printf("휴직자 처리 1,lancode[%s],fancode[%s],fantodate[%s]\n", GP_anno->lancode.arr, GP_anno->fancode.arr, GP_anno->fantodate.arr);
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "514") != 0)))
                {
                    if (GP_anno->restday == 0)   //인사 발령
                        InsertAnno(iKind);
                }
                break;
            case 1:     // 계약직 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우 InsertAnno
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "839") != 0)))
                {
                    if (GP_anno->restday == 0)   //인사 발령
                        InsertAnno(iKind);
                }
                break;
            case 2:     // 파견자 : 복귀 발령이 없거나, 최종발령이 연장 발령인 경우 InsertAnno
                if ((strcmp(GP_anno->lancode.arr, "") == 0) ||
                    ((strcmp(GP_anno->fancode.arr, GP_anno->lancode.arr) == 0) && (strcmp(GP_anno->lancode.arr, "414") != 0)))
                {
                    if (GP_anno->restday == 0)   //인사 발령
                        InsertAnno(iKind);
                }
                break;
            case 3:     // 겸직자 : 겸직해제 발령이 없는 경우 InsertAnno
                if (strcmp(GP_anno->lancode.arr, "") == 0) 
                {
                    if (GP_anno->restday == 0)   //인사 발령
                        InsertAnno(iKind);
                }
                break;
            case 4:     // 겸무자 : 겸무해제 발령이 없는 경우 InsertAnno
                if (strcmp(GP_anno->lancode.arr, "") == 0) 
                {
                    if (GP_anno->restday == 0)   //인사 발령
                        InsertAnno(iKind);
                }
                break;
        }
        if (strcmp(logText, "") != 0) 
        {
            /* EXEC SQL ROLLBACK TO SAVEPOINT emp_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 14;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "rollback  to emp_anno";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )208;
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
            sqlstm.arrsiz = 14;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )223;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

       // 1건 저장
    } /* End While */
       
if (DEBUG)  printf("debug50 seqno=[%d]\n", SeqnoCount);
    if (SeqnoCount > 1)
    {
        AppointAnno += SeqnoCount - 1;
        STRINIT(&newAnseqno);
        sprintf(newAnseqno, "%04d", SeqnoCount - 1);
        
        /* EXEC SQL
        UPDATE PIHANBA
           SET ANLASTNO = LTRIM(TO_CHAR(:newAnseqno,'0009'))
         WHERE ANNONO = :newAnnono; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 14;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PIHANBA  set ANLASTNO=LTRIM(TO_CHAR(:b0,'0009\
')) where ANNONO=:b1";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )238;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)newAnseqno;
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)newAnnono;
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


        
        if(SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "신규 발령번호의 최종번호 수정 실패!!Error=%s", SQLERRM);
            logWrite(logText);
        }
        else
            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 14;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )261;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    }
if (DEBUG)  printf("END WHILE\n\n");
    return;
}

/* 인사발령에 대한 연장이나 복귀 발령이 없는 경우 자동 복귀 발령 처리 */
int InsertAnno(int iSel)
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

        /* 부서 정보 */
        /* varchar bOrgnum[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bOrgnum;

        /* varchar bDeptcode[6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } bDeptcode;

        /* varchar bPaycl[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bPaycl;

        /* varchar bJobgun[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } bJobgun;

        /* varchar bPayra[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bPayra;

        /* 신규 발령 정보 */
        /* varchar inAncode[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } inAncode;

        /* varchar inMark1[40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } inMark1;
        
    /* EXEC SQL END DECLARE SECTION; */ 


if (DEBUG)  printf("Start InsertAnno\n");

    STRINIT(&bOrgnum);
    STRINIT(&bDeptcode);
    STRINIT(&bPaycl);
    STRINIT(&bJobgun);
    STRINIT(&bPayra);
    STRINIT(&inAncode);
    STRINIT(&inMark1);

    /* 대상 사원의 가장 최근 발령된 부서 정보 조회. if (iSel == 1) */
    /* EXEC SQL
    SELECT ORGNUM, DEPTCODE, JOBGUN, PAYCL, PAYRA
      INTO :bOrgnum, :bDeptcode, :bJobgun, :bPaycl, :bPayra
      FROM (SELECT ORGNUM, DEPTCODE, JOBGUN, PAYCL, PAYRA
              FROM PIHANNO
             WHERE EMPNO = :GP_anno->empno
             ORDER BY ANNONO DESC)
     WHERE ROWNUM = 1; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 14;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select ORGNUM ,DEPTCODE ,JOBGUN ,PAYCL ,PAYRA into :b0,:\
b1,:b2,:b3,:b4  from (select ORGNUM ,DEPTCODE ,JOBGUN ,PAYCL ,PAYRA  from PIH\
ANNO where EMPNO=:b5 order by ANNONO desc  ) where ROWNUM=1";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )276;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&bOrgnum;
    sqlstm.sqhstl[0] = (unsigned long )6;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&bDeptcode;
    sqlstm.sqhstl[1] = (unsigned long )9;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&bJobgun;
    sqlstm.sqhstl[2] = (unsigned long )5;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&bPaycl;
    sqlstm.sqhstl[3] = (unsigned long )6;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&bPayra;
    sqlstm.sqhstl[4] = (unsigned long )6;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->empno);
    sqlstm.sqhstl[5] = (unsigned long )7;
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


    
    if(SQLCODE != SQL_OK)
    {
        STRINIT(&logText);
        sprintf(logText, "최근 부서정보 조회 실패!!  사번[%s],Error=[%s]", GP_anno->empno.arr, SQLERRM);
        return 0;
    }
    
    /* 저장된 발령번호가 없으면 신규 발령근거 입력 */
    if (strcmp(newAnnono, "") == 0)
        if (InsertHanba(iSel) == 0) return 0;

    /* 각 상황별 복귀 발령 처리를 위한 변수 설정 */
    STRINIT(&newAnseqno);
    sprintf(newAnseqno, "%04d", SeqnoCount++);      //발령번호 순번
    switch (iSel) {
        case 0:     //휴직자(ANFRDATE 익일)
            STR2VCCOPY(inAncode, "514");
            STR2VCCOPY(inMark1, "[자동등록]휴직 복직 발령");
            break;
        case 1:     //계약직
            STR2VCCOPY(inAncode, "839");
            STR2VCCOPY(inMark1, "[자동등록]계약 해지 발령");
            break;
        case 2:     //파견자(ANFRDATE 익일)
            STR2VCCOPY(inAncode, "414");
            STR2VCCOPY(inMark1, "[자동등록]파견 복귀 발령");
            break;
        case 3:     //겸직자
            STR2VCCOPY(inAncode, "238");
            STR2VCCOPY(inMark1, "[자동등록]겸직 해제 발령");
            break;
        case 4:     //겸무자
            STR2VCCOPY(inAncode, "235");
            STR2VCCOPY(inMark1, "[자동등록]겸무 해제 발령");
            break;
    }
    
    /* EXEC SQL
    INSERT INTO PIHANNO
           (EMPNO,           KORNAME,                ANNONO,            ANSEQNO,
            ANFRDATE,        ANTODATE,               ANCODE,            ANDETCODE,
            ORGNUM,          DEPTCODE,               JOBGUN,            PAYCL,
            PAYRA,           MARK1,                  ADDEPTCODE,        ADPAYRA,
            BANNONO,         BANFRDATE,              BANTODATE,         BANCODE,
            BORGNUM,         BDEPTCODE,              BPAYCL,            BPAYRA,        
            ANUPDYN,         WRITETIME,              WRITEEMP)
    /o2019.01. 원소속부서로 복귀토록 쿼리 수정  &&  '414','514'일때만 익일로 발령일 등록토록 함 dsa2000o/
    SELECT :GP_anno->empno, :GP_anno->korname,      :newAnnono,        :newAnseqno,  
            Case When :inAncode in ('414','514') Then TO_CHAR(TO_DATE(:GP_anno->fantodate, 'YYYYMMDD')+1, 'YYYYMMDD')
            Else                                      TO_CHAR(TO_DATE(:GP_anno->fantodate, 'YYYYMMDD'),   'YYYYMMDD') End AnFrdate,
                             '' Antodate,           :inAncode,              :GP_anno->fandetcode,    
            Orgnum,          Deptcode,               Jobgun,                 Paycl,
            Payra,          :inMark1,               :GP_anno->faddeptcode,  :GP_anno->fadpayra,
            Lannono,         Lanfrdate,              Lantodate,              Lancode,
           :bOrgnum,        :bDeptcode,             :bPaycl,                :bPayra,        
            'N',             TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'),          :GP_anno->fwriteemp //:jobEmpno 2019.02.11 최초발령자를 해제발령자로.
      FROM  PIMPMAS
     WHERE  EMPNO = :GP_anno->empno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 18;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PIHANNO (EMPNO,KORNAME,ANNONO,ANSEQNO,ANFRDA\
TE,ANTODATE,ANCODE,ANDETCODE,ORGNUM,DEPTCODE,JOBGUN,PAYCL,PAYRA,MARK1,ADDEPTC\
ODE,ADPAYRA,BANNONO,BANFRDATE,BANTODATE,BANCODE,BORGNUM,BDEPTCODE,BPAYCL,BPAY\
RA,ANUPDYN,WRITETIME,WRITEEMP)select :b0 ,:b1 ,:b2 ,:b3 , case  when :b4 in (\
'414','514') then TO_CHAR((TO_DATE(:b5,'YYYYMMDD')+1),'YYYYMMDD') else TO_CHA\
R(TO_DATE(:b5,'YYYYMMDD'),'YYYYMMDD')  end  AnFrdate ,'' Antodate ,:b4 ,:b8 ,\
Orgnum ,Deptcode ,Jobgun ,Paycl ,Payra ,:b9 ,:b10 ,:b11 ,Lannono ,Lanfrdate ,\
Lantodate ,Lancode ,:b12 ,:b13 ,:b14 ,:b15 ,'N' ,TO_CHAR(SYSDATE,'YYYYMMDDHH2\
4MISS') ,:b16  from PIMPMAS where EMPNO=:b0";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )315;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
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
    sqlstm.sqhstv[2] = (unsigned char  *)newAnnono;
    sqlstm.sqhstl[2] = (unsigned long )9;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)newAnseqno;
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&inAncode;
    sqlstm.sqhstl[4] = (unsigned long )6;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->fantodate);
    sqlstm.sqhstl[5] = (unsigned long )11;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->fantodate);
    sqlstm.sqhstl[6] = (unsigned long )11;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&inAncode;
    sqlstm.sqhstl[7] = (unsigned long )6;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->fandetcode);
    sqlstm.sqhstl[8] = (unsigned long )5;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&inMark1;
    sqlstm.sqhstl[9] = (unsigned long )43;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_anno->faddeptcode);
    sqlstm.sqhstl[10] = (unsigned long )9;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_anno->fadpayra);
    sqlstm.sqhstl[11] = (unsigned long )6;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&bOrgnum;
    sqlstm.sqhstl[12] = (unsigned long )6;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&bDeptcode;
    sqlstm.sqhstl[13] = (unsigned long )9;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)&bPaycl;
    sqlstm.sqhstl[14] = (unsigned long )6;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)&bPayra;
    sqlstm.sqhstl[15] = (unsigned long )6;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)&(GP_anno->fwriteemp);
    sqlstm.sqhstl[16] = (unsigned long )7;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)&(GP_anno->empno);
    sqlstm.sqhstl[17] = (unsigned long )7;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
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


/* SELECT  :GP_anno->empno,        :GP_anno->korname,      :newAnnono,             :newAnseqno,  
            TO_CHAR(TO_DATE(:GP_anno->fantodate, 'YYYYMMDD')+1, 'YYYYMMDD'),        TO_CHAR(TO_DATE(:GP_anno->fantodate, 'YYYYMMDD')+1, 'YYYYMMDD'),
           :inAncode,              :GP_anno->fandetcode,   :bOrgnum,               :bDeptcode,     :bJobgun,   :bPaycl,                
           :bPayra,                :inMark1,               :GP_anno->faddeptcode,  :GP_anno->fadpayra,
            LANNONO,                LANFRDATE,              LANTODATE,              LANCODE,
           :bOrgnum,               :bDeptcode,             :bPaycl,                :bPayra,      
            'N',                    TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'),          TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'),    :jobEmpno
      FROM  PIMPMAS
     WHERE  EMPNO = :GP_anno->empno;*/
    if(SQLCODE != SQL_OK)
    {
        STRINIT(&logText);
        sprintf(logText, "자동 발령 등록 실패!! 사원[%s],성명[%s],Error=[%s]", GP_anno->empno.arr, GP_anno->korname.arr, SQLERRM);
        return 0;
    }

if (DEBUG) printf("자동발령 발령번호[%s]emp=[%s][%d]\n", newAnnono, GP_anno->empno.arr, SQLCODE);
    
    iKindCount2 ++;
    
    return 1;
}

/* 발령근거 신규 입력   printf("Start InsertHanba\n");   */
int InsertHanba(int iSel)
{
    char strAnbas1[30+1];

    STRINIT(&strAnbas1);
    /* 발령근거 설정 */
    switch (iSel) {
        case 0:     //휴직자
            strcpy(strAnbas1, "[자동등록]휴직 복직 발령");
            break;
        case 1:     //계약직
            strcpy(strAnbas1, "[자동등록]계약 해지 발령");
            break;
        case 2:     //파견자
            strcpy(strAnbas1, "[자동등록]파견 복귀 발령");
            break;
        case 3:     //겸직자
            strcpy(strAnbas1, "[자동등록]겸직 해제 발령");
            break;
        case 4:     //겸무자
            strcpy(strAnbas1, "[자동등록]겸무 해제 발령");
            break;
    }

    /* 신규 발령번호를 발췌하고 전체 발령건수는 '0000', 현재일로 신규 예약 발령 처리.
       전체 발령건수는 신규발령건 전체 처리 후 수정 */
    STRINIT(&newAnnono);
    /* EXEC SQL 
        SELECT LTRIM(TO_CHAR(TO_NUMBER(NVL(MAX(ANNONO), TO_CHAR(SYSDATE, 'YYYY')||'0000'))+1, '00000009')) AS ANNO
          INTO :newAnnono
          FROM PIHANBA
         WHERE ANNONO LIKE TO_CHAR(SYSDATE, 'YYYY')||'%'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 18;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select LTRIM(TO_CHAR((TO_NUMBER(NVL(max(ANNONO),(TO_CHAR\
(SYSDATE,'YYYY')||'0000')))+1),'00000009')) ANNO into :b0  from PIHANBA where\
 ANNONO like (TO_CHAR(SYSDATE,'YYYY')||'%')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )402;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)newAnnono;
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


    if(SQLCODE != SQL_OK)
    {
        STRINIT(&logText);
        sprintf(logText, "신규 발령번호 발췌 실패 : %s", SQLERRM);
        return 0;
    }

    /* EXEC SQL
    INSERT INTO PIHANBA
               (ANNONO, ANUPDATEYN, ANBAS1, ANLASTNO, WRITETIME, WRITEEMP, ANRESDATE,
                ANBIGO2, NOTIYN, MAILYN)           --//2019.01. Add  ANBIGO2, NOTIYN, MAILYN
       VALUES (:newAnnono,
               'Y',
               :strAnbas1,
               '0000',
               TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
               :jobEmpno,
               TO_CHAR(SYSDATE+1, 'YYYYMMDD'),      --//2019.01 발령예약일을 익일로 저장.(08시 자동등록pic1061g => 익일01시 자동반영pic1065g)
               '발령종료일에등록(익일자동반영)',
               'Y',
               'Y' ); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 18;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PIHANBA (ANNONO,ANUPDATEYN,ANBAS1,ANLASTNO,W\
RITETIME,WRITEEMP,ANRESDATE,ANBIGO2,NOTIYN,MAILYN) values (:b0,'Y',:b1,'0000'\
,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),:b2,TO_CHAR((SYSDATE+1),'YYYYMMDD'),'발\
령종료일에등록(익일자동반영)','Y','Y')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )421;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)newAnnono;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)strAnbas1;
    sqlstm.sqhstl[1] = (unsigned long )31;
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
        STRINIT(&logText);
        sprintf(logText, "신규 발령근거 입력 실패 : %s", SQLERRM);
        return 0;
    }
if (DEBUG) printf("근거[%s] 발령번호[%s] [%d]\n", strAnbas1, newAnnono, SQLCODE);

    return 1;
}

/* TABLE에 프로그램 실행 로그를 저장 */
void logWrite(char *strMessage)
{
if (DEBUG) printf("cnt[%d],emp[%s],Log=[%s]code=[%d]\n", logCount, jobEmpno, strMessage, SQLCODE);
    
    /* EXEC SQL INSERT INTO PYBATLOG (RUNDATE, PROGID, SEQNO, WRITEMAN, RESULT)
             VALUES (:jobTime, 'pic1061g', :logCount, :jobEmpno, :strMessage); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 18;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PYBATLOG (RUNDATE,PROGID,SEQNO,WRITEMAN,RESU\
LT) values (:b0,'pic1061g',:b1,:b2,:b3)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )448;
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
        sqlstm.arrsiz = 18;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )479;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    logCount ++;
}
