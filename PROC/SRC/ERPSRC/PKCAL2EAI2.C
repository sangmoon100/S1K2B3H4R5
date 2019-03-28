
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
           char  filnam[14];
};
static struct sqlcxp sqlfpn =
{
    13,
    "pkcal2eai2.pc"
};


static unsigned int sqlctx = 617499;


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
   unsigned char  *sqhstv[11];
   unsigned long  sqhstl[11];
            int   sqhsts[11];
            short *sqindv[11];
            int   sqinds[11];
   unsigned long  sqharm[11];
   unsigned long  *sqharc[11];
   unsigned short  sqadto[11];
   unsigned short  sqtdso[11];
} sqlstm = {12,11};

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
5,0,0,1,73,0,4,172,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,116,0,4,184,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
51,0,0,3,701,0,3,271,0,0,11,11,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
110,0,0,4,147,0,4,345,0,0,5,3,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,3,0,0,
145,0,0,5,50,0,3,360,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,0,
1,97,0,0,1,97,0,0,
186,0,0,6,0,0,29,370,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : pkcal2eai2(INSA->EAI Interface Program)
 PROGRM-Decription : 중간정산 내역 계정별로 전표를 생성(EAI_HRPAY)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 중간정산
 Programmer     : 김태호 
 Version        : 1.00
 Date           : 2010.04.

급    여(EAI_HRPAY)     : /var/mte/adapter/conf/script/PIM/PIM.PIMFI1010B.SND.sh

Update Contents
   Version    date(yy.mm.dd)     programmer      description
   1.00       2005.07.           dsa2000         SAP도입에 따른 신규개발(pcalc2erp.pc를 토대로)
============================================================================= */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

#define   TRUE_RET 25600

void CreateLog(void);
void InitVariables(void);
void Initialize(void);
void WriteLog(char *message);

int WriteControl(int gubun);
int WritePkmpcalc(void);

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

     char  v_dt_create[15];      /* 생성일자 */
     char  v_cd_data[4] = "C13"; /* 인건비 Data Code */
     int   v_no_crt_srl = 0;     /* 생성 일련번호 */
     char  v_ym_acct[7];         /* 회계년월 */
     int   v_cnt_line = 0;       /* Line건수 */ 
     char  v_ph_proc[2] = "A";   /* 처리단계 */
     char  v_st_proc[2] = "P";   /* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
     char  v_rst_validation[2] = "A";
     
     /****************************************************************************** 
       CONST Variables
     ******************************************************************************/ 
     char    v_currency[4]  = "KRW";  /*화폐명*/
     char    v_corpcode[3]  = "10";   /*회사코드 하나로통신(주)*/
     char    v_activity[6]  = "00000";/*기능(활동)*/
     double  v_amt_tot  = 0;          /* 대변total 금액*/
     double  v_amt_tot_cr  = 0;       /* 차변total 금액*/ 
/* EXEC SQL END   DECLARE SECTION; */ 


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
char  *HOMEDIR;
char  logfile[40];
char  logfile_fullname[140];
int   id;
char  buff[1000];
char  paydate[9];

char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[300]       = "";
int   seqno = 0; 

/***** Log File Pointer *****/
FILE *fp;  

void main(int argc, char *argv[])
{
     int  ret;
     
     if (argc != 6) 
     {    /* pkcal2eai 200508 20050825 D006 pkcal2eai 2005082500000 */
          printf("[Usage] : pkcal2eai 1.회계년월(YYYYMM) 2.지급일 3.작업자 4.progid 5.시작시간\n");
          fclose(fp);
          exit(1);        
     }
     
     memset(v_ym_acct, NULL, sizeof(v_ym_acct));
     sprintf(v_ym_acct, "%s", argv[1]);
     
     memset(paydate, NULL, sizeof(paydate));
     sprintf(paydate, "%s", argv[2]);
     
     hinsa_log_print(0,"계정/부서별로 전표를 생성 시작...");          
     hinsa_db_connect();  /*DB Connect 실시..*/
       
     InitVariables();   /* 변수 초기화 */
     
     Initialize();     /* 초기화 루틴 */
     
     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);
     strcpy(log_rundate,  argv[5]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     CreateLog();
     printf("작업 시작......................................... >\n");
     
     sprintf(buff, "프로그램명 : %s\n", argv[0]);
     WriteLog(buff);
     sprintf(buff, "회계년월 : %s\n", argv[1]);
     WriteLog(buff);
     
     if  (WriteControl(0) == -1) {   /* 초기값 세팅 */
          fclose(fp);
          exit(1);
     }
     
     if  (WritePkmpcalc() == -1)
     {   
          WriteControl(2);  /* 비정상종료 */
          sprintf(log_buff, " ERROR ");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [ 작업 실패 ROLLBACK ] =====\n");   /*Dsa2000*/
     }                
     else
     {
          WriteControl(1);   /* 정상종료 */  
          sprintf(log_buff, "OK ====== [ 작업 완료 COMMIT ] =====");
          Write_batlog(seqno++, log_buff);   
          hinsa_exit(0,"OK ====== [ 작업 완료 COMMIT ] =====\n");   /*Dsa2000*/   
     }    
     fclose(fp);               
}

void CreateLog()
{
  HOMEDIR = hinsa_home();
  strcat(HOMEDIR,"/log/ERPlog/");
  
  /* 로그파일명을 세팅 */
  sprintf(logfile_fullname, "%spkcal2eai%.8s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl); 
  
  /* 로그파일 오픈 */
  fp = fopen(logfile_fullname, "w+");

  if (fp == NULL) 
  {
      printf("로그파일오픈(%s) 에러\n", logfile_fullname);
      sprintf(log_buff, "로그파일오픈(%s) 에러\n", logfile_fullname);
      Write_batlog(seqno++, log_buff);   
      exit(1);
  }
}


void InitVariables(void)
{
  memset(logfile, NULL, sizeof(logfile));
  memset(logfile_fullname, NULL, sizeof(logfile_fullname));
  memset(v_dt_create, NULL, sizeof(v_dt_create));
}

void Initialize(void)
{
     /* EXEC SQL 
     SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') DT_CREATE
       INTO :v_dt_create
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') DT_CREATE in\
to :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_dt_create;
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


     
     if  (sqlca.sqlcode != 0)
     {   
          printf("ORA-%05d - 현재날짜 가져오기  Error\n", sqlca.sqlcode);
          fclose(fp);
          exit(1);
     }
     
     /* EXEC SQL 
     SELECT NVL(MAX(NO_CRT_SRL)+1,1)
       INTO :v_no_crt_srl  
       FROM EAI_HRPAY
      WHERE H_YEAR||LPad(H_MONTH,2,'0') = :v_ym_acct
        AND CD_DATA = :v_cd_data; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL((max(NO_CRT_SRL)+1),1) into :b0  from EAI_HR\
PAY where ((H_YEAR||LPad(H_MONTH,2,'0'))=:b1 and CD_DATA=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )24;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_ym_acct;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[2] = (unsigned long )4;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1403) && (sqlca.sqlcode != -1405)) 
     {
          printf("ORA-%05d - MAX Serial# 가져오기  Error\n", sqlca.sqlcode);
          sprintf(log_buff, "ORA-%05d - MAX Serial# 가져오기  Error\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   
          fclose(fp);
          exit(1);
     }   
}

void WriteLog(char *message)
{
     fprintf(fp, "%s", message);
}
 
int  WriteControl(int gubun)
{    
     sprintf(buff, "< WriteControl Starting (Gubun : %d) >----------------\n", gubun);
     WriteLog(buff);
     
     printf("WriteControl - gubun : %d\n", gubun);
     
     if      (gubun == 1)  sprintf(v_st_proc, "N");
     else if (gubun == 2)  sprintf(v_st_proc, "A");
     
     if  (gubun == 1) 
     {   
          printf("OK!! < Program ended successfully........................... >\n");
          printf("\n");
          printf(" =========================================================== \n");
          printf("                           작업결과                          \n");
          printf("  작업일 :[%s] 자료구분[%s] 일련번호[%d]   \n", v_dt_create,v_cd_data,v_no_crt_srl);
          printf(" =========================================================== \n");
          printf("      건 수    대변총액   차변총액  \n");
          printf("        %-4d      %-15.0f    %-15.0f     \n", v_cnt_line,v_amt_tot,v_amt_tot_cr);
          printf(" =========================================================== \n");
          WriteLog("OK!! < Program ended successfully.......................... >\n");
          
          sprintf(log_buff, "OK!! < Program ended successfully........................... >\n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, " =========================================================== \n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "                           작업결과                          \n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "  작업일 :[%s] 자료구분[%s] 일련번호[%d]   \n", v_dt_create,v_cd_data,v_no_crt_srl);
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, " =========================================================== \n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "      건 수    대변총액   차변총액  \n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "        %-4d      %-15.0f    %-15.0f     \n", v_cnt_line,v_amt_tot,v_amt_tot_cr);
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, " =========================================================== \n");
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "OK!! < Program ended successfully.......................... >\n");
          Write_batlog(seqno++, log_buff);           
     } 
     else if (gubun == 2) 
     {
          printf("Fail!! < Program failed.4........................................ >\n");
          sprintf(log_buff, "Fail!! < Program failed......................................... >\n");
          Write_batlog(seqno++, log_buff);   
          WriteLog("Fail!! < Program failed......................................... >\n");     
     }
     return(0);
}

int  WritePkmpcalc(void)
{    
     WriteLog("< WritePkmpcalc Starting >-------------------------------\n");
     
     sprintf(buff, "v_dt_create : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data : (%s)\n", v_cd_data);
     WriteLog(buff);
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);
     sprintf(buff, "v_rst_validation : (%s)\n", v_rst_validation);
     WriteLog(buff);
     
     /* EXEC SQL 
     INSERT INTO EAI_HRPAY (  /o Write TEMP Pkmpcalc Table o/
            SEGMENT1  ,
            H_YEAR          ,
            H_MONTH          ,
            MODULE_GU  ,
            CD_DATA         ,
            NO_CRT_SRL      ,
            NO_LINE          ,
            IFSYS          ,
            DT_CREATE  ,
            HEADER_NAME     ,
            DT_ACCOUNTING   ,
            CURRENCY        ,
            SEGMENT4        ,
            SEGMENT2        ,
            DEPTCODE        ,
            SEGMENT3        ,
            ENTERED_DR      ,
            ENTERED_CR      ,
            MODE_FLAG       ,
            EAI_FLAG        ,
            EAI_DATE        )
     SELECT                                      
            :v_corpcode,                                         
            SUBSTR(:v_ym_acct,1,4),
            SUBSTR(:v_ym_acct,5,2),
            'GL' MODULE_GU,
            :v_cd_data,
            :v_no_crt_srl,
            rownum,
            'HR' IFSYS,
            :v_dt_create,
            :v_cd_data||substr(:paydate,1,6)||'중간정산급여',
            TO_DATE(:paydate, 'YYYYMMDD'), 
            :v_currency,
            accno,
            fincode,
            deptcode, /odsa2000 2005.10 부서코드 추가.o/
            :v_activity,
            decode(debityn,'0',nvl(accnosum,0),0) debit, 
            decode(debityn,'1',nvl(accnosum,0),0) credit,        
            'I'      MODE_FLAG  ,  /oEAI추출구분(I,U,D)o/
            'N'      EAI_FLAG   ,  /oEAI추출여부o/
            null     EAI_DATE      /oEAI추출시간o/   
       FROM V_ERP_ACCNO A,                                      
            (SELECT ACCNO ACCNOB, MAX(DEBITYN) DEBITYN  
               FROM ERP_ACCNOMR 
              GROUP BY ACCNO )
      WHERE A.ACCNO = ACCNOB
        AND NVL(ACCNOSUM,0) <> 0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into EAI_HRPAY (SEGMENT1,H_YEAR,H_MONTH,MODULE_G\
U,CD_DATA,NO_CRT_SRL,NO_LINE,IFSYS,DT_CREATE,HEADER_NAME,DT_ACCOUNTING,CURREN\
CY,SEGMENT4,SEGMENT2,DEPTCODE,SEGMENT3,ENTERED_DR,ENTERED_CR,MODE_FLAG,EAI_FL\
AG,EAI_DATE)select :b0 ,SUBSTR(:b1,1,4) ,SUBSTR(:b1,5,2) ,'GL' MODULE_GU ,:b3\
 ,:b4 ,rownum ,'HR' IFSYS ,:b5 ,((:b3||substr(:b7,1,6))||'중간정산급여') ,TO_\
DATE(:b7,'YYYYMMDD') ,:b9 ,accno ,fincode ,deptcode ,:b10 ,decode(debityn,'0'\
,nvl(accnosum,0),0) debit ,decode(debityn,'1',nvl(accnosum,0),0) credit ,'I' \
MODE_FLAG ,'N' EAI_FLAG ,null  EAI_DATE  from V_ERP_ACCNO A ,(select ACCNO AC\
CNOB ,max(DEBITYN) DEBITYN  from ERP_ACCNOMR  group by ACCNO) where (A.ACCNO=\
ACCNOB and NVL(ACCNOSUM,0)<>0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )51;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_corpcode;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_ym_acct;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_ym_acct;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)v_dt_create;
     sqlstm.sqhstl[5] = (unsigned long )15;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[6] = (unsigned long )4;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)paydate;
     sqlstm.sqhstl[7] = (unsigned long )9;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)paydate;
     sqlstm.sqhstl[8] = (unsigned long )9;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)v_currency;
     sqlstm.sqhstl[9] = (unsigned long )4;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)v_activity;
     sqlstm.sqhstl[10] = (unsigned long )6;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
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

  
     
       /* printf("\n ssssss ORA-%05d - Insert TEMP 인건비 --------\n", sqlca.sqlcode); */
     
     if  (sqlca.sqlcode != 0) 
     {     /* 에러이면 */
          sprintf(log_buff, "ORA-%05d - Insert TEMP 인건비 Error--------\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   
          WriteLog(log_buff);
          return(-1);
     } 
     else 
     {     /* 에러가 아니면 */
          v_cnt_line = sqlca.sqlerrd[2];
          WriteLog("Insert TEMP 인건비 Success\n");
          sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
          Write_batlog(seqno++, log_buff);   
          WriteLog(log_buff);
     }
     
     /******************************************************************************************/
     v_amt_tot = 0;
     v_amt_tot_cr = 0;
     
     /* EXEC SQL 
     SELECT SUM(ENTERED_DR), SUM(ENTERED_CR)
       INTO :v_amt_tot  ,:v_amt_tot_cr
       FROM EAI_HRPAY
      WHERE H_YEAR||LPad(H_MONTH,2,'0') = :v_ym_acct
        AND CD_DATA    = :v_cd_data
        AND NO_CRT_SRL = :v_no_crt_srl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(ENTERED_DR) ,sum(ENTERED_CR) into :b0,:b1  f\
rom EAI_HRPAY where (((H_YEAR||LPad(H_MONTH,2,'0'))=:b2 and CD_DATA=:b3) and \
NO_CRT_SRL=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )110;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_amt_tot;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_amt_tot_cr;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_ym_acct;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
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


     
     sprintf(log_buff, "< Write 인건비 Ending >-------------------------\n");
     return(0);
}

/*=== dsa2000 2004.10. Rexec대체 서비스를 위한 Write_batlog()  ===================*/
int  Write_batlog(int seqno, char *message)
{ 
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )145;
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
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )186;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}