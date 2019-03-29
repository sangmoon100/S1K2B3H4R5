
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
    "pic3030g.pc"
};


static unsigned int sqlctx = 149427;


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
5,0,0,1,379,0,3,55,0,0,0,0,0,1,0,
20,0,0,2,129,0,5,104,0,0,0,0,0,1,0,
35,0,0,3,0,0,31,114,0,0,0,0,0,1,0,
50,0,0,4,0,0,29,120,0,0,0,0,0,1,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 종합인사정보 장기근속대상자 안내메일 발송 pic3030g.pc
     PROGRM-Decription : 발송일자(예약일)에 메일을 발송하고자 하는 각 프로그램별 메일을 해당 일자에 
			             임시테이블(PZHRMAIL)에서 메일발송 테이블(PZHMAIL)로 입력해주는 프로그램
     Programmer        : 이성규
     Version           : 1.00
     Date              : 2018.07.16
       
     Update Contents
     Version  date(yy.mm.dd)  programmer  description  Comments
       1.00   2018.07.16      이성규      최초작성	PIC3030A:장기근속대상자 안내메일 반영
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

#define   DEBUG       1

/* EXEC SQL INCLUDE sqlca.h;
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
/*  */ 
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


void main(void)
{
    char strMsg[255];
    char FL_file[255];
    int  iRet = 0;
    
    STRINIT(&FL_file);
    strcpy(FL_file,"pic3030g");
    
    hinsa_get_filename(1, FL_file);
    if  (hinsa_log_open(FL_file) == FAILURE)
    {
      hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
      return;
    }
    
    hinsa_log_print(0,"예약 메일 발송(pic3030g.pc) 프로그램 시작...");

    hinsa_db_connect();  
    
    /*======================================================================================
    PZHMAIL INSERT : 메일 발송 예약일자에 해당하는 내용을 메일전송 테이블에 입력.
    ======================================================================================*/   
    hinsa_log_print(0, "장기근속대상자 안내 메일. 전송 Table에 입력 시작.");

    /* EXEC SQL	
        INSERT INTO PZHMAIL
            (SENDTIME,   /o 메일발송 작업시간					  o/
             SENDPROG,   /o 발송프로그램 ID					      o/
             SEND_PER,   /o 발신자 사번						      o/
             RCVR_PER,   /o 수신자 사번(장기근속대상자)			  o/
             REFR_PER,   /o 불필요(종합인사)					  o/
             SUBJECT,    /o 메일제목						      o/
             HEADER1,    /o 불필요(종합인사)					  o/
             BODY1,      /o 메일내용						      o/
             TAIL1,      /o 불필요(종합인사)					  o/
             RECEIVEYN,  /o 'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기 o/ 
             EAI_FLAG,   
             EAI_DATE)   
        SELECT 
             SENDTIME, 
             SENDPROG,
             SEND_PER,
             RCVR_PER, 
             REFR_PER,
             SUBJECT,
             ''         HEADER1,
             CONTENTS   BODY1,
             ''         TAIL1,
             'N'        RECEIVEYN,
             'N'        EAI_FLAG, 
             ''         EAI_DATE
          FROM PZHRMAIL
         WHERE SENDTIME LIKE TO_CHAR(SYSDATE, 'YYYYMMDD')||'%' 
           AND SENDPROG = 'PIC3030A'
           AND PROCYN   = 'N'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 0;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PER\
,REFR_PER,SUBJECT,HEADER1,BODY1,TAIL1,RECEIVEYN,EAI_FLAG,EAI_DATE)select SEND\
TIME ,SENDPROG ,SEND_PER ,RCVR_PER ,REFR_PER ,SUBJECT ,'' HEADER1 ,CONTENTS B\
ODY1 ,'' TAIL1 ,'N' RECEIVEYN ,'N' EAI_FLAG ,'' EAI_DATE  from PZHRMAIL where\
 ((SENDTIME like (TO_CHAR(SYSDATE,'YYYYMMDD')||'%') and SENDPROG='PIC3030A') \
and PROCYN='N')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )5;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



/* TEST	   	  WHERE SENDTIME LIKE TO_CHAR(to_date('20180801', 'yyyymmdd'), 'YYYYMMDD')||'%' */
    if (SQLCODE != SQL_OK)
    {
        STRINIT(&strMsg);
        sprintf(strMsg, "Fail Insert into PZHMAIL!! : %s", SQLERRM);
        hinsa_log_print(0, strMsg);
    }                

    STRINIT(&strMsg);
    sprintf(strMsg, "입력 건수 : %d", SQL_PROCESS_COUNT);
    hinsa_log_print(0, strMsg);

    /*======================================================================================
     PZHRMAIL UPDATE : 전송테이블에 입력 완료된 메일의 처리여부 'Y'로 UPDATE.
    ======================================================================================*/
    if (SQL_PROCESS_COUNT > 0)
    {
        /* EXEC SQL	
            UPDATE PZHRMAIL
               SET PROCYN = 'Y'
             WHERE SENDTIME LIKE TO_CHAR(SYSDATE, 'YYYYMMDD')||'%' 
               AND SENDPROG = 'PIC3030A'
               AND PROCYN  = 'N'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 0;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PZHRMAIL  set PROCYN='Y' where ((SENDTIME lik\
e (TO_CHAR(SYSDATE,'YYYYMMDD')||'%') and SENDPROG='PIC3030A') and PROCYN='N')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )20;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 /* 장기근속대상자 안내메일 발송 프로그램 : pic30303g.pc */
    
    /* TEST      WHERE SENDTIME LIKE TO_CHAR(to_date('20180801', 'yyyymmdd'), 'YYYYMMDD')||'%' */
        if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL ROLLBACK WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 0;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )35;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&strMsg);
            sprintf(strMsg, "Fail Update PZHRMAIL!! : %s", SQLERRM);
            hinsa_log_print(0, strMsg);
        }
        else
            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 0;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )50;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    }
    
    hinsa_exit(0,"예약 메일 발송(pic30303g) 프로그램 종료...");
}  
