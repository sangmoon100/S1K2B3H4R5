
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
           char  filnam[13];
};
static struct sqlcxp sqlfpn =
{
    12,
    "pkmp2eai1.pc"
};


static unsigned int sqlctx = 315411;


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
   unsigned char  *sqhstv[26];
   unsigned long  sqhstl[26];
            int   sqhsts[26];
            short *sqindv[26];
            int   sqinds[26];
   unsigned long  sqharm[26];
   unsigned long  *sqharc[26];
   unsigned short  sqadto[26];
   unsigned short  sqtdso[26];
} sqlstm = {12,26};

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
5,0,0,1,96,0,4,199,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,118,0,4,213,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
55,0,0,3,129,0,4,228,0,0,5,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
90,0,0,4,73,0,4,241,0,0,3,2,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,
117,0,0,5,2776,1,3,347,0,0,26,26,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,
236,0,0,6,0,0,31,985,0,0,0,0,0,1,0,
251,0,0,7,0,0,29,996,0,0,0,0,0,1,0,
266,0,0,8,139,0,4,1001,0,0,4,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
297,0,0,9,170,0,4,1008,0,0,4,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
328,0,0,10,0,0,31,1022,0,0,0,0,0,1,0,
343,0,0,11,146,0,4,1035,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
374,0,0,12,50,0,3,1057,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
415,0,0,13,0,0,29,1067,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : PKMP2EAI1(INSA->EAI Interface Program)
 PROGRM-Decription : 급여테이블을 읽어서 EAI쪽 Interface 테이블에 Insert (EAI_WORKTAX)
 USAGE          : pkmp2eai1 DBUserID 작업자사번 지급년월
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 재직자 근로소득(급여)
 Programmer     : 강륜종
 Version        : 1.00 
 Date           : 2005.07.                                    

근로소득(EAI_WORKTAX)   : /var/mte/adapter/conf/script/PIM/PIM.PIMFI1060B.SND.sh

Update Contents
   Version    date(yy.mm.dd)     programmer      description
   1.00       2005.07.           dsa2000         SAP도입에 따른 신규개발(pkmp2erp1.pc를 토대로)
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
int  WriteControl(int gubun);
int  WriteEmployee(void);
int  Check_date(void);


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

     char     v_dt_create[9];         /* 생성일자 */
     char     v_dt_createhms[15];     /* 생성일시 */
     char     v_cd_data[4] = "D51";   /* Employee Data Code */
     int      v_no_crt_srl = 0;       /* 생성 일련번호 */
     char     v_sscode[3+1] = "A10";  /* 소득관리코드(급여) */
     char     v_sscodeil[3+1] = "A40";/* 사원급여/계약직급여구분:3개월미만 */
     char     v_ym_acct[7];           /* 회계년월 */
     int      v_cnt_line = 0;         /* Line건수 */ 
     char     v_ph_proc[2] = "A";     /* 처리단계 */
     char     v_st_proc[2] = "P";     /* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
     char     v_cl_data_use[2] = "A"; /* Data 활용구분 */
     char     v_id_crt_user[5];       /* 생성 UserID */
     char     v_paydate[7];           /* 지급년월 */         
     char     v_orgnum[4];            /* 휴직조직차수 */
     char     v_deptcode[6];          /* 휴직부서코드 */         
     char     v_fincode[6];           /* 휴직재무부서코드 20181224 JHG */         
     char     v_yyyymm[7];            /* 지급년월 */
     char     v_yyyy[5];              /* 지급년 */
     char     v_mm[3];                /* 지급월 */
     double   v_amttot = 0;           /* 과세표준금액총액   */
     double   v_amtin  = 0;           /* 결정소득세총액   */
     double   v_amtju  = 0;           /* 결정주민세총액   */
     double   v_amttot1 = 0;          /* 과세표준금액총액   */
     double   v_amtin1  = 0;          /* 결정소득세총액   */
     double   v_amtju1  = 0;          /* 결정주민세총액   */
     double   v_amttot2 = 0;          /* 과세표준금액총액   */
     double   v_amtin2  = 0;          /* 결정소득세총액   */
     double   v_amtju2  = 0;          /* 결정주민세총액   */
     char     v_rst_validation[2] = "A";
     
     /* pkcpbas내의 공제금 필드 */
     double  v_famided   = 0;         /* 부양자공제액     */
     double  v_silverded = 0;         /* 경로우대공제액   */
     double  v_obsded    = 0;         /* 장애자공제액     */
     double  v_eduded    = 0;         /* 자녀양육비공제액 */
     double  yuedunotax  = 0;         /* 유치원 학자금 비과세 처리 */
/* EXEC SQL END   DECLARE SECTION; */ 


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
char  *HOMEDIR;
char  logfile[40];
char  logfile_fullname[140];
int   id;
char  buff[1000];

char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

/***** Log File Pointer *****/
FILE *fp;  

void main(int argc, char *argv[])
{
     int  ret;
     
     if  (argc != 7) 
     {       /* pkmp2eai1 200507 H09 EK140 D006 pkmp2eai1 2005073100000*/
          printf("[Usage] : pkmpyserp 1.지급년월(YYYYMM) 2.휴직자orgnum 3.휴직자deptcode \n");
          printf("[Usage] :           4.작업자 5.progid 6.시작시간\n");
          fclose(fp);
          exit(1);
     }
     
     sprintf(v_paydate,     argv[1]);        /* 지급년월   */     
     sprintf(v_orgnum,      argv[2]);        /* 휴직자 조직차수   */     
     sprintf(v_deptcode,    argv[3]);        /* 휴직자 부서코드   */               
     sprintf(v_id_crt_user, argv[4]);        /* 작업자사번 */
         
     hinsa_log_print(0,"ERP 인터페이스 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     InitVariables();   /* 변수 초기화 */
     
     Initialize();     /* 초기화 루틴 */
     
     CreateLog();
     
     printf("기준년월 : %s \n", v_paydate);
     
     if (Check_date() != 0) 
     { 
          sprintf(buff, "지급년월에 해당하는 자료가 없습니다. %s\n", v_paydate);
          WriteLog(buff);
          fclose(fp);
          printf("지급년월에 해당하는 자료가 없습니다.\n");
          exit(1);
     }     
     
     if (WriteControl(0) == -1) 
     {   /* 초기값 세팅 */
          fclose(fp);
          exit(1);
     }          
     
     /*=========================================================================*/
     if  (WriteEmployee() == -1)
     {   
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          WriteControl(2);  /* 비정상종료 */
          error_quit("ERROR ====== [작업 실패] =====\n");   /*Dsa2000*/
     }        
     else
     {
          WriteLog("< Program End......................................... >\n");
          fclose(fp);
          printf("< Program Result.................... >\n");
          printf("총  건  수   : %d\n", v_cnt_line);
          printf("과세표준금액 : %0.0f\n", v_amttot);
          printf("소득세합계   : %0.0f\n", v_amtin);
          printf("주민세합계   : %0.0f\n", v_amtju);
          
          sprintf(log_buff, "총  건  수   : %d\n", v_cnt_line);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          sprintf(log_buff, "과세표준금액 : %0.0f\n", v_amttot);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          sprintf(log_buff, "소득세합계   : %0.0f\n", v_amtin);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          sprintf(log_buff, "주민세합계   : %0.0f\n", v_amtju);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          
          sprintf(log_buff, "OK ====== [작업 완료] =====\n");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          WriteControl(1);   /* 정상종료 */  
          hinsa_exit(0,"OK ====== [작업 완료] =====\n");   /*Dsa2000*/
     }  
}

void InitVariables(void)
{
     memset(logfile, NULL, sizeof(logfile));
     memset(logfile_fullname, NULL, sizeof(logfile_fullname));
     memset(v_dt_create, NULL, sizeof(v_dt_create));
     memset(v_dt_createhms, NULL, sizeof(v_dt_createhms));
     memset(v_ym_acct, NULL, sizeof(v_ym_acct));
     memset(v_fincode, NULL, sizeof(v_fincode)); 
}

void Initialize(void)
{
     sprintf(v_ym_acct, v_paydate );
     
     /* EXEC SQL 
     SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') ,
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
       INTO :v_dt_create,
            :v_dt_createhms
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDD') ,TO_CHAR(SYSDATE,'YY\
YYMMDDHH24MISS') into :b0,:b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_dt_create;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_dt_createhms;
     sqlstm.sqhstl[1] = (unsigned long )15;
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


     
     if (sqlca.sqlcode != 0)
     {
         printf("ORA-%05d - 현재날짜 가져오기  Error\n", sqlca.sqlcode);
         fclose(fp);
         exit(1);
     }  
     
     /* EXEC SQL 
     SELECT NVL(MAX(NO_CRT_SRL)+1,1) /o1 부터 시작하도록.o/
       INTO :v_no_crt_srl  
       FROM EAI_WORKTAX
      WHERE H_YEAR||LPad(H_MONTH,2,'0') = :v_paydate
        AND CD_DATA = :v_cd_data; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL((max(NO_CRT_SRL)+1),1) into :b0  from EAI_WO\
RKTAX where ((H_YEAR||LPad(H_MONTH,2,'0'))=:b1 and CD_DATA=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
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
     sqlstm.sqhstv[1] = (unsigned char  *)v_paydate;
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
          printf("[ERRCODE : %d] %s\n",sqlca.sqlcode, SQLERRM);
          printf("ORA-%05d - MAX Seril# 가져오기  Error\n", sqlca.sqlcode);
          fclose(fp);
          exit(1);
     }   
     
     /* EXEC SQL 
     SELECT NVL(FAMIDED,1), NVL(SILVERDED2,1), NVL(OBSDED,1), NVL(EDUDED,1),NVL(CHILDNOTAX,0)  /o 공제금액으로 나누어야 하기 때문에 NULL일경우 1로 치환 o/  
       INTO :v_famided,     :v_silverded,     :v_obsded,     :v_eduded     ,:yuedunotax 
       FROM PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(FAMIDED,1) ,NVL(SILVERDED2,1) ,NVL(OBSDED,1)\
 ,NVL(EDUDED,1) ,NVL(CHILDNOTAX,0) into :b0,:b1,:b2,:b3,:b4  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_famided;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_silverded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_obsded;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_eduded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1403) && (sqlca.sqlcode != -1405)) 
     {
          printf("ORA-%05d - 공제금 기준값 가져오기 실패\n", sqlca.sqlcode);
          fclose(fp);
          exit(1);
     }  
     
     /* 20181224 jhg fincode */
     /* EXEC SQL 
     SELECT FINCODE
       INTO :v_fincode
       FROM pycdept
      WHERE ORGNUM = :v_orgnum AND DEPTCODE = :v_deptcode ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select FINCODE into :b0  from pycdept where (ORGNUM=:b1\
 and DEPTCODE=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )90;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_fincode;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_orgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_deptcode;
     sqlstm.sqhstl[2] = (unsigned long )6;
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


     
     if (sqlca.sqlcode != 0)
     {
         printf("ORA-%05d - 재무부서코드 가져오기  Error\n", sqlca.sqlcode);
         fclose(fp);
         exit(1);
     }     
      
}

void CreateLog()
{
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/log/ERPlog/");
     
     /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%spkmp2eai1%s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl); 
     
     /* 로그파일 오픈 */
     fp = fopen(logfile_fullname, "w+");
     
     if (fp == NULL) {
         printf("로그파일오픈(%s) 에러\n", logfile_fullname);
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
     
     if      (gubun == 1)  sprintf(v_st_proc, "N");
     else if (gubun == 2)  sprintf(v_st_proc, "A");
     
     WriteLog(buff);
     sprintf(buff, "v_dt_create : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data : (%s)\n", v_cd_data);
     WriteLog(buff);
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);
     sprintf(buff, "v_ym_acct : (%s)\n", v_ym_acct);
     WriteLog(buff);
     sprintf(buff, "v_ph_proc : (%s)\n", v_ph_proc);
     WriteLog(buff);
     sprintf(buff, "v_st_proc : (%s)\n", v_st_proc);
     WriteLog(buff);
     sprintf(buff, "v_cl_data_use : (%s)\n", v_cl_data_use);
     WriteLog(buff);
     sprintf(buff, "v_id_crt_user : (%s)\n", v_id_crt_user);
     WriteLog(buff);
     sprintf(buff, "v_cnt_line : (%d)\n", v_cnt_line);
     WriteLog(buff);
     
     
     sprintf(log_buff, "< WriteControl Ending (Gubun : %d) >------------------\n", gubun);
     WriteLog(log_buff);
     
     if (gubun == 1) 
     {
       printf("OK Program End......................................... >\n");
     }     
     else if (gubun == 2)
     {
       printf("Fail Program End......................................... >\n");
     }     
     
     return(0);
}


int  WriteEmployee(void)
{    
     WriteLog("< Write EAI_WORKTAX Starting >-------------------------------\n");
     
     sprintf(buff, "v_dt_create : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data : (%s)\n", v_cd_data);
     WriteLog(buff);
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);
     sprintf(buff, "v_rst_validation : (%s)\n", v_rst_validation);
     WriteLog(buff);
     
     printf("v_yyyy           : %s \n", v_yyyy);
     printf("v_mm             : %s \n", v_mm);
     printf("v_cd_data        : %s \n", v_cd_data);
     printf("v_no_crt_srl     : %d \n", v_no_crt_srl);
     printf("v_dt_createhms   : %s \n", v_dt_createhms);
     printf("v_sscode         : %s \n", v_sscode);
     printf("v_paydate        : %s \n", v_paydate);
     printf("v_rst_validation : %s \n", v_rst_validation);
     printf("v_orgnum         : %s \n", v_orgnum);
     printf("v_deptcode       : %s \n", v_deptcode); 
     printf("v_fincode        : %s \n", v_fincode); 
     
     /* EXEC SQL 
     INSERT INTO EAI_WORKTAX (
            H_YEAR              ,
            H_MONTH             ,
            MDGBN               ,
            CD_DATA             ,
            NO_CRT_SRL          ,
            IFSYS               ,
            H_SSCODE            ,
            H_JIGUB_YMD         ,
            H_EMPNO             ,
            SEQLN               ,
            IFDAT               ,
            H_UNIT              ,
            H_DEPT              ,
            H_JUMIN             ,
            H_ALIEN             ,
            H_JOSEO             ,
            H_REGISTER          ,
            H_BUNRI             ,
            H_NAME              ,
            H_POSTNO            ,
            H_ADDRESS           ,
            H_KSYMD_FROM        ,
            H_KSYMD_TO          ,
            H_KMYMD_FROM        ,
            H_KMYMD_TO          ,
            H_JOO_PAY           ,
            H_JOO_BONUS         ,
            H_JOO_INJUNG        ,
            H_JOO_TEMP1         ,
            H_JOO_TEMP2         ,
            H_JOO_TOTAL         ,
            H_FREE_OVERSEA      ,
            H_FREE_NIGHT        ,
            H_FREE_TECH         ,
            H_FREE_TEMP1        ,
            H_FREE_TEMP2        ,
            H_FREE_TEMP3        ,
            H_FREE_TOTAL        ,
            H_WOLJUNG           ,
            H_BASE_PAY          ,
            H_LABOR_GONG        ,
            H_LABOR_PAY         ,
            H_BASE_ME           ,
            H_BASE_MATE         ,
            H_BASE_SUPPORT_SU   ,
            H_BASE_SUPPORT_MONEY,
            H_BASE_TEMP1        ,
            H_BASE_TEMP2        ,
            H_BASE_TEMP3        ,
            H_BASE_TEMP4        ,
            H_BASE_TEMP5        ,
            H_BASE_TEMP6        ,
            H_ADD_OLD_SU        ,
            H_ADD_OLD_MONEY     ,
            H_ADD_JANG_SU       ,
            H_ADD_JANG_MONEY    ,
            H_ADD_SON_SU        ,
            H_ADD_SON_MONEY     ,
            H_ADD_LADY          ,
            H_ADD_TEMP1         ,
            H_ADD_TEMP2         ,
            H_ADD_TEMP3         ,
            H_ADD_TEMP4         ,
            H_ADD_TEMP5         ,
            H_ADD_TEMP6         ,
            H_SOSUGONG          ,
            H_SPECIAL_INSURANCE ,
            H_SPECIAL_MEDICAL   ,
            H_SPECIAL_EDUCATE   ,
            H_SPECIAL_HOUSE     ,
            H_SPECIAL_DONATE    ,
            H_SPECIAL_SIN       ,
            H_SPECIAL_TEMP1     ,
            H_SPECIAL_TEMP2     ,
            H_SPECIAL_TEMP3     ,
            H_SPECIAL_TEMP4     ,
            H_SPECIAL_TEMP5     ,
            H_SPECIAL_TEMP6     ,
            H_SPECIAL_TOTAL     ,
            H_CHAGAM            ,
            H_PERSON_GONG       ,
            H_WORKING_GONG      ,
            H_JOHAB_GONG        ,
            H_GONG_TEMP1        ,
            H_GONG_TEMP2        ,
            H_GONG_TEMP3        ,
            H_GONG_TEMP4        ,
            H_GONG_TEMP5        ,
            H_GONG_TEMP6        ,
            H_STANDARD          ,
            H_SANCHUL           ,
            H_SGONG_LABOR       ,
            H_SGONG_ASSETS      ,
            H_SGONG_HOUSE       ,
            H_SGONG_OVERSEA     ,
            H_SGONG_STOCK       ,
            H_SGONG_TEMP1       ,
            H_SGONG_TEMP2       ,
            H_SGONG_TEMP3       ,
            H_SGONG_TEMP4       ,
            H_SGONG_TEMP5       ,
            H_SGONG_TEMP6       ,
            H_SGONG_TOTAL       ,
            H_SGM_PAY           ,
            H_SGM_JOGAM         ,
            H_SGM_TEMP1         ,
            H_SGM_TEMP2         ,
            H_SGM_TEMP3         ,
            H_SGM_TEMP4         ,
            H_SGM_TEMP5         ,
            H_SGM_TEMP6         ,
            H_SGM_TOTAL         ,
            H_DECIDE_SO         ,
            H_DECIDE_NONG       ,
            H_DECIDE_JOO        ,
            H_DECIDE_TOTAL      ,
            H_NAP_JONG_SO       ,
            H_NAP_JONG_NONG     ,
            H_NAP_JONG_JOO      ,
            H_NAP_JONG_TOTAL    ,
            H_NAP_HYUN_SO       ,
            H_NAP_HYUN_NONG     ,
            H_NAP_HYUN_JOO      ,
            H_NAP_HYUN_TOTAL    ,
            H_SIL_SO            ,
            H_SIL_NONG          ,
            H_SIL_JOO           ,
            H_SIL_TOTAL         ,
            RST_VALIDATION      ,
            H_SPECIAL_STANDARD  ,
            H_SPECIAL_YK_BO     ,
            H_PERSON_SAVE       ,
            H_SGONG_JOHAP       ,
            H_SGONG_JUNGKEN     ,
            H_GUNMU             ,
            H_SGONG_FOREIGNER   , /oDsa2000 2004.01.29. 세법변경에 따른 칼럼 추가.(외국인 추가공제)o/
/o          H_CORPNAME        , 종근무지 자료
            H_CORPNAME1         , 종종근무지 자료
            H_CORPNO            ,
            H_CORPNO1           ,
            H_PAYSUM            ,
            H_PAYSUM1           ,
            H_BONSUM            ,
            H_BONSUM1           ,
            H_MEDAMT            ,
            H_MEDAMT1           ,
            H_HIREAMT           ,
            H_HIREAMT1          ,
            H_ANUAMT            ,
            H_ANUAMT1           ,
            H_BCOGBONSUM        ,o/
            H_FAMI70NO          ,
            H_SPECADDNO         ,
            H_SPECADDDED        ,
            H_SHOSAMT           ,
            H_HOUSEINTAMT2      ,
            CONFM               ,
            ZCONF_DATE          ,
            WT_QSCOD            ,
            MODE_FLAG           ,
            EAI_FLAG            ,
            EAI_DATE            
            )  
     SELECT   
            H_YEAR              ,
            H_MONTH             ,
            MDGBN               ,
            CD_DATA             ,
            NO_CRT_SRL          ,
            IFSYS               ,
            H_SSCODE            ,
            H_JIGUB_YMD         ,
            H_EMPNO             ,
            rownum         SEQLN,      /o라인번호o/   
            IFDAT               ,
            H_UNIT              ,
            H_DEPT              ,
            H_JUMIN             ,
            H_ALIEN              ,
            H_JOSEO             ,
            H_REGISTER          ,
            H_BUNRI             ,
            H_NAME              ,
            H_POSTNO            ,
            H_ADDRESS           ,
            H_KSYMD_FROM        ,
            H_KSYMD_TO          ,
            H_KMYMD_FROM        ,
            H_KMYMD_TO          ,
            H_JOO_PAY           ,
            H_JOO_BONUS         ,
            H_JOO_INJUNG        ,
            H_JOO_TEMP1         ,
            H_JOO_TEMP2         ,
            H_JOO_TOTAL         ,
            H_FREE_OVERSEA      ,
            H_FREE_NIGHT        ,
            H_FREE_TECH         ,
            H_FREE_TEMP1        ,
            H_FREE_TEMP2        ,
            H_FREE_TEMP3        ,
            H_FREE_TOTAL        ,
            H_WOLJUNG           ,
            H_BASE_PAY          ,
            H_LABOR_GONG        ,
            H_LABOR_PAY         ,
            H_BASE_ME           ,
            H_BASE_MATE         ,
            H_BASE_SUPPORT_SU   ,
            H_BASE_SUPPORT_MONEY,
            H_BASE_TEMP1        ,
            H_BASE_TEMP2        ,
            H_BASE_TEMP3        ,
            H_BASE_TEMP4        ,
            H_BASE_TEMP5        ,
            H_BASE_TEMP6        ,
            H_ADD_OLD_SU        ,
            H_ADD_OLD_MONEY     ,
            H_ADD_JANG_SU       ,
            H_ADD_JANG_MONEY    ,
            H_ADD_SON_SU        ,
            H_ADD_SON_MONEY     ,
            H_ADD_LADY          ,
            H_ADD_TEMP1         ,
            H_ADD_TEMP2         ,
            H_ADD_TEMP3         ,
            H_ADD_TEMP4         ,
            H_ADD_TEMP5         ,
            H_ADD_TEMP6         ,
            H_SOSUGONG          ,
            H_SPECIAL_INSURANCE ,
            H_SPECIAL_MEDICAL   ,
            H_SPECIAL_EDUCATE   ,
            H_SPECIAL_HOUSE     ,
            H_SPECIAL_DONATE    ,
            H_SPECIAL_SIN       ,
            H_SPECIAL_TEMP1     ,
            H_SPECIAL_TEMP2     ,
            H_SPECIAL_TEMP3     ,
            H_SPECIAL_TEMP4     ,
            H_SPECIAL_TEMP5     ,
            H_SPECIAL_TEMP6     ,
            H_SPECIAL_TOTAL     ,
            H_CHAGAM            ,
            H_PERSON_GONG       ,
            H_WORKING_GONG      ,
            H_JOHAB_GONG        ,
            H_GONG_TEMP1        ,
            H_GONG_TEMP2        ,
            H_GONG_TEMP3        ,
            H_GONG_TEMP4        ,
            H_GONG_TEMP5        ,
            H_GONG_TEMP6        ,
            H_STANDARD          ,
            H_SANCHUL           ,
            H_SGONG_LABOR       ,
            H_SGONG_ASSETS      ,
            H_SGONG_HOUSE       ,
            H_SGONG_OVERSEA     ,
            H_SGONG_STOCK       ,
            H_SGONG_TEMP1       ,
            H_SGONG_TEMP2       ,
            H_SGONG_TEMP3       ,
            H_SGONG_TEMP4       ,
            H_SGONG_TEMP5       ,
            H_SGONG_TEMP6       ,
            H_SGONG_TOTAL       ,
            H_SGM_PAY           ,
            H_SGM_JOGAM         ,
            H_SGM_TEMP1         ,
            H_SGM_TEMP2         ,
            H_SGM_TEMP3         ,
            H_SGM_TEMP4         ,
            H_SGM_TEMP5         ,
            H_SGM_TEMP6         ,
            H_SGM_TOTAL         ,
            H_DECIDE_SO         ,
            H_DECIDE_NONG       ,
            H_DECIDE_JOO        ,
            H_DECIDE_TOTAL      ,
            H_NAP_JONG_SO       ,
            H_NAP_JONG_NONG     ,
            H_NAP_JONG_JOO      ,
            H_NAP_JONG_TOTAL    ,
            H_NAP_HYUN_SO       ,
            H_NAP_HYUN_NONG     ,
            H_NAP_HYUN_JOO      ,
            H_NAP_HYUN_TOTAL    ,
            H_SIL_SO            ,
            H_SIL_NONG          ,
            H_SIL_JOO           ,
            H_SIL_TOTAL         ,
            RST_VALIDATION      ,
            H_SPECIAL_STANDARD  ,
            H_SPECIAL_YK_BO     ,
            H_PERSON_SAVE       ,
            H_SGONG_JOHAP       ,
            H_SGONG_JUNGKEN     ,
            H_GUNMU             ,
            H_SGONG_FOREIGNER   ,
            H_FAMI70NO          ,
            H_SPECADDNO         ,
            H_SPECADDDED        ,
            H_SHOSAMT           ,
            H_HOUSEINTAMT2      ,
            CONFM               ,
            ZCONF_DATE          ,
            WT_QSCOD            ,
            MODE_FLAG           ,
            EAI_FLAG            ,
            EAI_DATE                 
       FROM           
           (SELECT          
                   :v_yyyy                            H_YEAR,                    /o신고년o/        
                   :v_mm                              H_MONTH,                   /o신고월o/   
                   'TX'                               MDGBN,                     /o모듈구분o/
                   :v_cd_data                         CD_DATA,                    /o자료구분 'D51'o/  
                   :v_no_crt_srl                      NO_CRT_SRL,                /o순서o/   
                   'HRIS'                             IFSYS,                     /o원천구분o/
                   :v_sscode                          H_SSCODE,                   /o소득관리코드o/         
                   REPLACE(:v_paydate||'25',' ','')   H_JIGUB_YMD,               /o지급일o/  
                   A.empno                            H_EMPNO,                   /o사번o/   
                   /orownum                           SEQLN,                     /o라인번호o/
                   :v_dt_createhms                    IFDAT,                     /o생성일시 o/
                   '000'                              H_UNIT,                     /o사업장o/
                   /o MAX(decode(Substr(d.Tribegb,1,1),'2',D.FINCODE, C.FINCODE )) H_DEPT,   /o 이상용 20181113 조직개편   부서o/ 
                   Max(decode(substr(a.pstate,1,1),'7',:v_fincode, Case When (X.Tribegb='2' And Y.Tribegb='2') Then Y.Fincode Else X.Fincode End)) H_DEPT,  /o 20181204 JHG 조직개편 o/                   
                   replace(MAX(B.juminid),'-','')     H_JUMIN,                   /o주민등록번호o/
                   decode(substr(MAX(B.juminid),8,1),'5',' 9','6','9','1') H_ALIEN,   /o내외국인 구분 : 외국인(9)o/  
                   '2'                                H_JOSEO,                   /o지급조서제출구분o/  
                   '1'                                H_REGISTER,                /o거주자 구분o/   
                   '1'                                H_BUNRI,                   /o분리과세구분o/  
                   MAX(A.korname)                     H_NAME,                    /o성 명o/   
                   MAX(B.zipno)                       H_POSTNO,                  /o우편번호o/   
                   MAX(SUBSTRB(B.addr,1,70))          H_ADDRESS,                 /o주소o/   
                   REPLACE(:v_paydate||'01',' ','')   H_KSYMD_FROM,                           /o귀속일_fromo/   
                   to_char(last_day(TO_DATE(SUBSTR(paydate,1,6),'YYYYMM')),'YYYYMMDD')   H_KSYMD_TO,     /o귀속일_too/   
                   REPLACE(:v_paydate||'01',' ','')      H_KMYMD_FROM,                       /o감면일_fromo/             
                   to_char(last_day(TO_DATE(SUBSTR(paydate,1,6),'YYYYMM')),'YYYYMMDD')   H_KMYMD_TO,     /o감면일_too/            
                   SUM(NVL(TAXPAYSUM, 0))+SUM(nvl(a.yueduamt,0))-SUM(nvl(yuedutax,0)) H_JOO_PAY,  /o주사업장-급여 비과세 유치원 학자금 포함PAYSUM ->TAXPAYSUM+ 유치원학자금  o/  
                   0                                  H_JOO_BONUS,          /o주사업장-상여o/  
                   0                                  H_JOO_INJUNG,         /o주사업장-인정상여o/   
                   0                                  H_JOO_TEMP1,          /o주사업장-temp1o/  
                   0                                  H_JOO_TEMP2,          /o주사업장-temp2o/  
                   0                                  H_JOO_TOTAL,          /o주사업장-totalo/  
                   0                                  H_FREE_OVERSEA,
                   0                                  H_FREE_NIGHT,         /o비과세 야간근로o/  
                   0                                  H_FREE_TECH,          /o비과세 기술o/   
                   SUM(NVL(NOTAXPAYSUM,0))            H_FREE_TEMP1,         /o비과세 temp1o/   
                   0                                  H_FREE_TEMP2,         /o비과세 temp2o/   
                   0                                  H_FREE_TEMP3,         /o비과세 temp3o/   
                   SUM(NVL(NOTAXPAYSUM,0))            H_FREE_TOTAL,         /o비과세 계o/   
                   SUM(NVL(TAXPAYSUM,0))              H_WOLJUNG,            /o월정급여액o/   
                   SUM(NVL(TAXPAYSUM,0))              H_BASE_PAY,           /o과세대상급여o/  
                   SUM(NVL(LABINDED,0))               H_LABOR_GONG,         /o근로소득공제o/  
                   SUM(NVL(LABINAMT,0))               H_LABOR_PAY,          /o근로소득급여o/  
                   SUM(NVL(BASICDED,0))               H_BASE_ME,            /o기본 본인o/   
                   SUM(NVL(MATEDED,0))                H_BASE_MATE,          /o기본 배우자o/
                   SUM(NVL(FAMIDED,0))/:v_famided     H_BASE_SUPPORT_SU,    /o기본 부양가족 수o/                   
                   SUM(NVL(FAMIDED,0))                H_BASE_SUPPORT_MONEY, /o기본 부양가족 액o/  
                   0                                  H_BASE_TEMP1,         /o기본 TEMP1o/   
                   0                                  H_BASE_TEMP2,         /o기본 TEMP2o/   
                   0                                  H_BASE_TEMP3,         /o기본 TEMP3o/   
                   0                                  H_BASE_TEMP4,         /o기본 TEMP4o/   
                   0                                  H_BASE_TEMP5,         /o기본 TEMP5o/   
                   0                                  H_BASE_TEMP6,         /o기본 TEMP6o/   
                   SUM(NVL(SILVERDED,0))/:v_silverded H_ADD_OLD_SU,         /o추가 경로우대 수  o/
                   SUM(NVL(SILVERDED,0))              H_ADD_OLD_MONEY,      /o추가 경로우대 금액o/  
                   SUM(NVL(OBSDED,0))/:v_obsded       H_ADD_JANG_SU,        /o추가 장애자 수o/                 
                   SUM(NVL(OBSDED,0))                 H_ADD_JANG_MONEY,     /o추가 장애자 금액o/  
                   SUM(NVL(EDUDED,0))/:v_eduded       H_ADD_SON_SU,         /o추가 자녀 수o/                   
                   SUM(NVL(EDUDED,0))                 H_ADD_SON_MONEY,      /o추가 자녀 금액o/  
                   SUM(NVL(WOMANDED,0))               H_ADD_LADY,           /o추가 부녀자공제o/  
                   0                                  H_ADD_TEMP1,          /o추가 TEMP1o/   
                   0                                  H_ADD_TEMP2,          /o추가 TEMP2o/   
                   0                                  H_ADD_TEMP3,          /o추가 TEMP3o/   
                   0                                  H_ADD_TEMP4,          /o추가 TEMP4o/   
                   0                                  H_ADD_TEMP5,          /o추가 TEMP5o/   
                   0                                  H_ADD_TEMP6,          /o추가 TEMP6o/   
                   0                                  H_SOSUGONG,           /o소수공제액o/   
                   0                                  H_SPECIAL_INSURANCE,  /o특별 보험료o/   
                   0                                  H_SPECIAL_MEDICAL,    /o특별 의료비o/   
                   0                                  H_SPECIAL_EDUCATE,    /o특별 교육비o/   
                   0                                  H_SPECIAL_HOUSE,      /o특별 주택자금o/  
                   0                                  H_SPECIAL_DONATE,     /o특별 기부금o/   
                   0                                  H_SPECIAL_SIN,        /o특별 신용카드o/  
                   0                                  H_SPECIAL_TEMP1,      /o특별 TEMP1o/   
                   0                                  H_SPECIAL_TEMP2,      /o특별 TEMP2o/   
                   0                                  H_SPECIAL_TEMP3,      /o특별 TEMP3o/   
                   0                                  H_SPECIAL_TEMP4,      /o특별 TEMP4o/   
                   0                                  H_SPECIAL_TEMP5,      /o특별 TEMP5o/   
                   0                                  H_SPECIAL_TEMP6,      /o특별 TEMP6o/   
                   0                                  H_SPECIAL_TOTAL,      /o특별 계o/   
                   SUM(NVL(INDED ,0))                 H_CHAGAM,             /o차감소득o/   
                   0                                  H_PERSON_GONG,        /o개인연금 소득o/  
                   0                                  H_WORKING_GONG,       /o현장공제o/   
                   0                                  H_JOHAB_GONG,         /o조합출자공제o/  
                   0                                  H_GONG_TEMP1,         /o공제 TEMP1o/   
                   0                                  H_GONG_TEMP2,         /o공제 TEMP2o/   
                   0                                  H_GONG_TEMP3,         /o공제 TEMP3o/   
                   0                                  H_GONG_TEMP4,         /o공제 TEMP4o/   
                   0                                  H_GONG_TEMP5,         /o공제 TEMP5o/   
                   0                                  H_GONG_TEMP6,         /o공제 TEMP6o/   
                   SUM(NVL(TAXINAMT,0))               H_STANDARD,           /o과세표준o/   
                   SUM(NVL(CALCTAX ,0))               H_SANCHUL,            /o산출세액o/   
                   SUM(NVL(LABTAXDED,0))              H_SGONG_LABOR,        /o세액공제 근로소득o/  
                   0                                  H_SGONG_ASSETS,       /o세액공제 재형저축o/  
                   0                                  H_SGONG_HOUSE,        /o세액공제 주택차입o/  
                   0                                  H_SGONG_OVERSEA,      /o세액공제 외국납부o/  
                   0                                  H_SGONG_STOCK,        /o세액공제 주식저축o/  
                   0                                  H_SGONG_TEMP1,        /o세액공제 TEMP1o/  
                   0                                  H_SGONG_TEMP2,        /o세액공제 TEMP2o/  
                   0                                  H_SGONG_TEMP3,        /o세액공제 TEMP3o/  
                   0                                  H_SGONG_TEMP4,        /o세액공제 TEMP4o/  
                   0                                  H_SGONG_TEMP5,        /o세액공제 TEMP5o/  
                   0                                  H_SGONG_TEMP6,        /o세액공제 TEMP6o/  
                   SUM(NVL(LABTAXDED,0))              H_SGONG_TOTAL,        /o세액공제 TOTALo/  
                   0                                  H_SGM_PAY,            /o세액감면 소득세법o/  
                   0                                  H_SGM_JOGAM,          /o세액감면 조감법o/  
                   0                                  H_SGM_TEMP1,          /o세액감면 TEMP1o/  
                   0                                  H_SGM_TEMP2,          /o세액감면 TEMP2o/  
                   0                                  H_SGM_TEMP3,          /o세액감면 TEMP3o/  
                   0                                  H_SGM_TEMP4,          /o세액감면 TEMP4o/  
                   0                                  H_SGM_TEMP5,          /o세액감면 TEMP5o/  
                   0                                  H_SGM_TEMP6,          /o세액감면 TEMP6o/  
                   0                                  H_SGM_TOTAL,          /o세액감면 TOTALo/  
                   SUM(NVL(INTAX,0))                  H_DECIDE_SO,          /o결정 소득액o/   
                   0                                  H_DECIDE_NONG,        /o결정 농특세o/   
                   SUM(NVL(JUTAX,0))                       H_DECIDE_JOO,         /o결정 주민세o/   
                   SUM(NVL(INTAX,0)) + SUM(NVL(JUTAX,0))   H_DECIDE_TOTAL,       /oTOTALo/   
                   0                                  H_NAP_JONG_SO,        /o기납부 종 소득세o/  
                   0                                  H_NAP_JONG_NONG,      /o기납부 종 농특세o/  
                   0                                  H_NAP_JONG_JOO,       /o기납부 종 주민세o/  
                   0                                  H_NAP_JONG_TOTAL,     /o기납부 종 TOTALo/  
                   0                                  H_NAP_HYUN_SO,        /o기납부 현 소득세o/  
                   0                                  H_NAP_HYUN_NONG,      /o기납부 현 농특세o/  
                   0                                  H_NAP_HYUN_JOO,       /o기납부 현 주민세o/  
                   0                                  H_NAP_HYUN_TOTAL,     /o기납부 현 TOTALo/  
                   SUM(NVL(INTAX ,0))                 H_SIL_SO,             /o차감징수 소득세   control sum o/  
                   0                                  H_SIL_NONG,           /o차감징수 농특세o/     
                   SUM(NVL(JUTAX ,0))                      H_SIL_JOO,            /o차감징수 주민세o/     
                   SUM(NVL(INTAX ,0))+ SUM(NVL(JUTAX,0))   H_SIL_TOTAL,          /o차감징수 TOTALo/     
                   :v_rst_validation                  RST_VALIDATION,  
                   SUM(NVL(SPEDED,0))                 H_SPECIAL_STANDARD  ,  /o표준공제o/
                   0                                  H_SPECIAL_YK_BO     ,  /o연금보험o/
                   0                                  H_PERSON_SAVE       ,  /o연금저축o/
                   0                                  H_SGONG_JOHAP       ,  /o납세조합o/
                   0                                  H_SGONG_JUNGKEN     ,  /o증권저축o/  
                   MAX(NVL(B.BLDCODE, '2C'))          H_GUNMU             ,  /o근무지--널이면 본사로 : 급여마스터에서 가져가도록 수정. 2006.10.09o/
                   0                                  H_SGONG_FOREIGNER   ,  /oDsa2000 2004.01.29. 세법변경에 따른 칼럼 추가.(외국인 추가공제)o/          
                   0                                  H_FAMI70NO          ,  /o추가공제_경로우대 70세이상_수o/           
                   0                                  H_SPECADDNO         ,  /o특별추가공제(결혼.장례.이사비 공제 건수)o/
                   0                                  H_SPECADDDED        ,  /o특별추가공제(결혼.장례.이사비 공제액)o/   
                   0                                  H_SHOSAMT           ,  /o본인의료비o/                              
                   0                                  H_HOUSEINTAMT2      ,  /o주택자금이자상환액2o/                     
                   null                               CONFM               ,  /o확정구분o/                                
                   null                               ZCONF_DATE          ,  /o신고일o/                                  
                   null                               WT_QSCOD            ,  /o원천세키o/                                
                   'I'                                MODE_FLAG           ,  /oEAI추출구분(I,U,D)o/
                   'N'                                EAI_FLAG            ,  /oEAI추출여부o/
                   null                               EAI_DATE               /oEAI추출시간o/
              FROM PKHPHIS A, PKMPMAS B,  /o PYCDEPT C, PYCDEPT D o/
                  (Select Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=:v_orgnum) X, 
                  (Select Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=:v_orgnum) Y              
             WHERE SUBSTR(A.PAYDATE,1,6) = :v_paydate
               AND A.EMPNO = B.EMPNO  
              /o AND decode(substr(a.pstate,1,1),'7',:v_orgnum, a.orgnum)     = c.orgnum o/
              /o AND decode(substr(a.pstate,1,1),'7',:v_deptcode, a.deptcode) = c.deptcode o/
              /o AND decode(substr(a.pstate,1,1),'7',:v_orgnum, a.orgnum)     = d.orgnum o/
              /o AND decode(substr(a.pstate,1,1),'7',:v_deptcode, a.jobdept)  = d.deptcode o/
               And X.Deptcode = A.Deptcode 
               And Y.Deptcode = A.Jobdept 
             GROUP BY A.EMPNO, SUBSTR(A.PAYDATE,1,6) 
             UNION
            SELECT :v_yyyy                            H_YEAR,               /o신고년o/        
                   :v_mm                              H_MONTH,              /o신고월o/   
                   'TX'                               MDGBN,                /o모듈구분o/
                   :v_cd_data                         CD_DATA,              /o자료구분 'D51'o/  
                   :v_no_crt_srl                      NO_CRT_SRL,           /o순서o/   
                   'HRIS'                             IFSYS,                /o원천구분o/
                   :v_sscodeil                        H_SSCODE,              /o소득관리코드o/
                   PAYDATE                            H_JIGUB_YMD,          /o지급일o/  
                   A.empno                            H_EMPNO,              /o사번o/                   
                   /orownum                           SEQLN,                  라인번호o/                
                   :v_dt_createhms                    IFDAT,                /o생성일시 o/
                   null                               H_UNIT,                /o사업장o/
                   C.FINCODE                          H_DEPT,                /o부서o/             
                   replace(B.juminid,'-','')          H_JUMIN,              /o주민등록번호o/
                   decode(substr(B.juminid,8,1),'5','9','6','9','1') H_ALIEN, /o내외국인 구분 : 외국인(9)o/  
                   '2'                                H_JOSEO,              /o지급조서제출구분o/  
                   '1'                                H_REGISTER,           /o거주자 구분o/   
                   '1'                                H_BUNRI,              /o분리과세구분o/  
                   NVL(korname,'   ')                 H_NAME,               /o성 명o/   
                   ''                                 H_POSTNO,             /o우편번호o/   
                   SUBSTRB(addr,1,70)                 H_ADDRESS,            /o주소o/     
                   to_char(add_months(to_date(SUBSTR(paydate,1,6),'YYYYMM'), -1), 'YYYYMM')||'01'       H_KSYMD_FROM,  /o귀속일_fromo/
                   to_char(last_day(add_months(to_date(SUBSTR(paydate,1,6),'YYYYMM'), -1)), 'YYYYMMDD') H_KSYMD_TO,    /o귀속일_too/
                   to_char(add_months(to_date(SUBSTR(paydate,1,6),'YYYYMM'), -1), 'YYYYMM')||'01'       H_KMYMD_FROM,  /o감면일_fromo/             
                   to_char(last_day(add_months(to_date(SUBSTR(paydate,1,6),'YYYYMM'), -1)), 'YYYYMMDD') H_KMYMD_TO,    /o감면일_too/            
                   TAXPAYSUM                          H_JOO_PAY,            /o주사업장-급여o/  
                   0                                  H_JOO_BONUS,          /o주사업장-상여o/  
                   0                                  H_JOO_INJUNG,         /o주사업장-인정상여o/   
                   0                                  H_JOO_TEMP1,          /o주사업장-temp1o/  
                   0                                  H_JOO_TEMP2,          /o주사업장-temp2o/  
                   0                                  H_JOO_TOTAL,          /o주사업장-totalo/  
                   0                                  H_FREE_OVERSEA,      
                   0                                  H_FREE_NIGHT,         /o비과세 야간근로o/  
                   0                                  H_FREE_TECH,          /o비과세 기술o/   
                   NVL(NOTAXPAYSUM,0)                 H_FREE_TEMP1,         /o비과세 temp1o/   
                   0                                  H_FREE_TEMP2,         /o비과세 temp2o/   
                   0                                  H_FREE_TEMP3,         /o비과세 temp3o/   
                   NVL(NOTAXPAYSUM,0)                 H_FREE_TOTAL,         /o비과세 계o/   
                   NVL(TAXPAYSUM,0)                   H_WOLJUNG,            /o월정급여액o/   
                   NVL(TAXPAYSUM,0)                   H_BASE_PAY,           /o과세대상급여 LABINAMT ->TAXPAYSUM으로 변경 월차 주휴 수당 포함 작업 2010.04.26 o/  
                   NVL(INDED,0)                       H_LABOR_GONG,         /o근로소득공제o/  
                   NVL(LABINAMT - INDED,0)            H_LABOR_PAY,          /o근로소득급여o/  
                   0                                  H_BASE_ME,            /o기본 본인o/   
                   0                                  H_BASE_MATE,          /o기본 배우자o/   
                   0                                  H_BASE_SUPPORT_SU,    /o기본 부양가족 수o/  
                   0                                  H_BASE_SUPPORT_MONEY, /o기본 부양가족 액o/  
                   0                                  H_BASE_TEMP1,         /o기본 TEMP1o/   
                   0                                  H_BASE_TEMP2,         /o기본 TEMP2o/   
                   0                                  H_BASE_TEMP3,         /o기본 TEMP3o/   
                   0                                  H_BASE_TEMP4,         /o기본 TEMP4o/   
                   0                                  H_BASE_TEMP5,         /o기본 TEMP5o/   
                   0                                  H_BASE_TEMP6,         /o기본 TEMP6o/   
                   0                                  H_ADD_OLD_SU,         /o추가 경로우대 수o/
                   0                                  H_ADD_OLD_MONEY,      /o추가 경로우대 금액o/  
                   0                                  H_ADD_JANG_SU,        /o추가 장애자 수o/  
                   0                                  H_ADD_JANG_MONEY,     /o추가 장애자 금액o/  
                   0                                  H_ADD_SON_SU,         /o추가 자녀 수o/         
                   0                                  H_ADD_SON_MONEY,      /o추가 자녀 금액o/  
                   0                                  H_ADD_LADY,           /o추가 부녀자공제o/  
                   0                                  H_ADD_TEMP1,          /o추가 TEMP1o/   
                   0                                  H_ADD_TEMP2,          /o추가 TEMP2o/   
                   0                                  H_ADD_TEMP3,          /o추가 TEMP3o/   
                   0                                  H_ADD_TEMP4,          /o추가 TEMP4o/   
                   0                                  H_ADD_TEMP5,          /o추가 TEMP5o/   
                   0                                  H_ADD_TEMP6,          /o추가 TEMP6o/   
                   0                                  H_SOSUGONG,           /o소수공제액o/   
                   0                                  H_SPECIAL_INSURANCE,  /o특별 보험료o/   
                   0                                  H_SPECIAL_MEDICAL,    /o특별 의료비o/   
                   0                                  H_SPECIAL_EDUCATE,    /o특별 교육비o/   
                   0                                  H_SPECIAL_HOUSE,      /o특별 주택자금o/  
                   0                                  H_SPECIAL_DONATE,     /o특별 기부금o/   
                   0                                  H_SPECIAL_SIN,        /o특별 신용카드o/  
                   0                                  H_SPECIAL_TEMP1,      /o특별 TEMP1o/   
                   0                                  H_SPECIAL_TEMP2,      /o특별 TEMP2o/   
                   0                                  H_SPECIAL_TEMP3,      /o특별 TEMP3o/   
                   0                                  H_SPECIAL_TEMP4,      /o특별 TEMP4o/   
                   0                                  H_SPECIAL_TEMP5,      /o특별 TEMP5o/   
                   0                                  H_SPECIAL_TEMP6,      /o특별 TEMP6o/   
                   0                                  H_SPECIAL_TOTAL,      /o특별 계o/   
                   NVL(INDED ,0)                      H_CHAGAM,             /o차감소득o/   
                   0                                  H_PERSON_GONG,        /o개인연금 소득o/  
                   0                                  H_WORKING_GONG,       /o현장공제o/   
                   0                                  H_JOHAB_GONG,         /o조합출자공제o/  
                   0                                  H_GONG_TEMP1,         /o공제 TEMP1o/   
                   0                                  H_GONG_TEMP2,         /o공제 TEMP2o/   
                   0                                  H_GONG_TEMP3,         /o공제 TEMP3o/   
                   0                                  H_GONG_TEMP4,         /o공제 TEMP4o/   
                   0                                  H_GONG_TEMP5,         /o공제 TEMP5o/   
                   0                                  H_GONG_TEMP6,         /o공제 TEMP6o/   
                   NVL(TAXINAMT,0)                    H_STANDARD,           /o과세표준o/   
                   NVL(CALCTAX ,0)                    H_SANCHUL,            /o산출세액o/   
                   NVL(LABTAXDED,0)                   H_SGONG_LABOR,        /o세액공제 근로소득o/  
                   0                                  H_SGONG_ASSETS,       /o세액공제 재형저축o/  
                   0                                  H_SGONG_HOUSE,        /o세액공제 주택차입o/  
                   0                                  H_SGONG_OVERSEA,      /o세액공제 외국납부o/  
                   0                                  H_SGONG_STOCK,        /o세액공제 주식저축o/  
                   0                                  H_SGONG_TEMP1,        /o세액공제 TEMP1o/  
                   0                                  H_SGONG_TEMP2,        /o세액공제 TEMP2o/  
                   0                                  H_SGONG_TEMP3,        /o세액공제 TEMP3o/  
                   0                                  H_SGONG_TEMP4,        /o세액공제 TEMP4o/  
                   0                                  H_SGONG_TEMP5,        /o세액공제 TEMP5o/  
                   0                                  H_SGONG_TEMP6,        /o세액공제 TEMP6o/  
                   NVL(LABTAXDED,0)                   H_SGONG_TOTAL,        /o세액공제 TOTALo/  
                   0                                  H_SGM_PAY,            /o세액감면 소득세법o/  
                   0                                  H_SGM_JOGAM,          /o세액감면 조감법o/  
                   0                                  H_SGM_TEMP1,          /o세액감면 TEMP1o/  
                   0                                  H_SGM_TEMP2,          /o세액감면 TEMP2o/  
                   0                                  H_SGM_TEMP3,          /o세액감면 TEMP3o/  
                   0                                  H_SGM_TEMP4,          /o세액감면 TEMP4o/  
                   0                                  H_SGM_TEMP5,          /o세액감면 TEMP5o/  
                   0                                  H_SGM_TEMP6,          /o세액감면 TEMP6o/  
                   0                                  H_SGM_TOTAL,          /o세액감면 TOTALo/  
                   NVL(INTAX,0)                       H_DECIDE_SO,          /o결정 소득액o/   
                   0                                  H_DECIDE_NONG,        /o결정 농특세o/   
                   NVL(JUTAX,0)                       H_DECIDE_JOO,         /o결정 주민세o/   
                   NVL(INTAX,0)+NVL(JUTAX,0)          H_DECIDE_TOTAL,       /oTOTALo/   
                   0                                  H_NAP_JONG_SO,        /o기납부 종 소득세o/  
                   0                                  H_NAP_JONG_NONG,      /o기납부 종 농특세o/  
                   0                                  H_NAP_JONG_JOO,       /o기납부 종 주민세o/  
                   0                                  H_NAP_JONG_TOTAL,     /o기납부 종 TOTALo/  
                   0                                  H_NAP_HYUN_SO,        /o기납부 현 소득세o/  
                   0                                  H_NAP_HYUN_NONG,      /o기납부 현 농특세o/  
                   0                                  H_NAP_HYUN_JOO,       /o기납부 현 주민세o/  
                   0                                  H_NAP_HYUN_TOTAL,     /o기납부 현 TOTALo/  
                   NVL(INTAX,0)                       H_SIL_SO,             /o차감징수 소득세   control sum o/  
                   0                                  H_SIL_NONG,           /o차감징수 농특세o/     
                   NVL(JUTAX,0)                       H_SIL_JOO,            /o차감징수 주민세o/     
                   NVL(INTAX,0)+NVL(JUTAX,0)          H_SIL_TOTAL,          /o차감징수 TOTALo/     
                   :v_rst_validation                  RST_VALIDATION,
                   0                                  H_SPECIAL_STANDARD  ,  /o표준공제o/
                   0                                  H_SPECIAL_YK_BO     ,  /o연금보험o/
                   0                                  H_PERSON_SAVE       ,  /o연금저축o/
                   0                                  H_SGONG_JOHAP       ,  /o납세조합o/
                   0                                  H_SGONG_JUNGKEN     ,  /o증권저축o/   
                   NVL(C.PLACECODE, '2C')             H_GUNMU             ,  /o근무지--널이면 본사로 o/        
                   0                                  H_SGONG_FOREIGNER   ,  /oDsa2000 2004.01.29. 세법변경에 따른 칼럼 추가.(외국인 추가공제)o/      
                   0                                  H_FAMI70NO          ,  /o추가공제_경로우대 70세이상_수o/           
                   0                                  H_SPECADDNO         ,  /o특별추가공제(결혼.장례.이사비 공제 건수)o/
                   0                                  H_SPECADDDED        ,  /o특별추가공제(결혼.장례.이사비 공제액)o/   
                   0                                  H_SHOSAMT           ,  /o본인의료비o/                              
                   0                                  H_HOUSEINTAMT2      ,  /o주택자금이자상환액2o/                     
                   null                               CONFM               ,  /o확정구분o/                                
                   null                               ZCONF_DATE          ,  /o신고일o/                                  
                   null                               WT_QSCOD            ,  /o원천세키o/                                
                   'I'                                MODE_FLAG           ,  /oEAI추출구분(I,U,D)o/
                   'N'                                EAI_FLAG            ,  /oEAI추출여부('Y','N')o/
                   null                               EAI_DATE               /oEAI추출시간o/                
              FROM PKHILPAY A, PKHILHIS B, PYCDEPT C
             WHERE SUBSTR(A.PAYDATE,1,6) = :v_paydate   
               AND A.EMPNO    = B.EMPNO(+)
               AND A.ORGNUM   = C.ORGNUM
               AND A.DEPTCODE = C.DEPTCODE 
           ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into EAI_WORKTAX (H_YEAR,H_MONTH,MDGBN,CD_DATA,NO_CRT_SRL,IFS\
YS,H_SSCODE,H_JIGUB_YMD,H_EMPNO,SEQLN,IFDAT,H_UNIT,H_DEPT,H_JUMIN,H_ALIEN,H_\
JOSEO,H_REGISTER,H_BUNRI,H_NAME,H_POSTNO,H_ADDRESS,H_KSYMD_FROM,H_KSYMD_TO,H\
_KMYMD_FROM,H_KMYMD_TO,H_JOO_PAY,H_JOO_BONUS,H_JOO_INJUNG,H_JOO_TEMP1,H_JOO_\
TEMP2,H_JOO_TOTAL,H_FREE_OVERSEA,H_FREE_NIGHT,H_FREE_TECH,H_FREE_TEMP1,H_FRE\
E_TEMP2,H_FREE_TEMP3,H_FREE_TOTAL,H_WOLJUNG,H_BASE_PAY,H_LABOR_GONG,H_LABOR_\
PAY,H_BASE_ME,H_BASE_MATE,H_BASE_SUPPORT_SU,H_BASE_SUPPORT_MONEY,H_BASE_TEMP\
1,H_BASE_TEMP2,H_BASE_TEMP3,H_BASE_TEMP4,H_BASE_TEMP5,H_BASE_TEMP6,H_ADD_OLD\
_SU,H_ADD_OLD_MONEY,H_ADD_JANG_SU,H_ADD_JANG_MONEY,H_ADD_SON_SU,H_ADD_SON_MO\
NEY,H_ADD_LADY,H_ADD_TEMP1,H_ADD_TEMP2,H_ADD_TEMP3,H_ADD_TEMP4,H_ADD_TEMP5,H\
_ADD_TEMP6,H_SOSUGONG,H_SPECIAL_INSURANCE,H_SPECIAL_MEDICAL,H_SPECIAL_EDUCAT\
E,H_SPECIAL_HOUSE,H_SPECIAL_DONATE,H_SPECIAL_SIN,H_SPECIAL_TEMP1,H_SPECIAL_T\
EMP2,H_SPECIAL_TEMP3,H_SPECIAL_TEMP4,H_SPECIAL_TEMP5,H_SPECIAL_TEMP6,H_SPECI\
AL_TOTAL,H_CHAGAM,H_PERSON_GONG,H_WORKING_GO");
     sqlbuft((void **)0,
       "NG,H_JOHAB_GONG,H_GONG_TEMP1,H_GONG_TEMP2,H_GONG_TEMP3,H_GONG_TEMP4,\
H_GONG_TEMP5,H_GONG_TEMP6,H_STANDARD,H_SANCHUL,H_SGONG_LABOR,H_SGONG_ASSETS,\
H_SGONG_HOUSE,H_SGONG_OVERSEA,H_SGONG_STOCK,H_SGONG_TEMP1,H_SGONG_TEMP2,H_SG\
ONG_TEMP3,H_SGONG_TEMP4,H_SGONG_TEMP5,H_SGONG_TEMP6,H_SGONG_TOTAL,H_SGM_PAY,\
H_SGM_JOGAM,H_SGM_TEMP1,H_SGM_TEMP2,H_SGM_TEMP3,H_SGM_TEMP4,H_SGM_TEMP5,H_SG\
M_TEMP6,H_SGM_TOTAL,H_DECIDE_SO,H_DECIDE_NONG,H_DECIDE_JOO,H_DECIDE_TOTAL,H_\
NAP_JONG_SO,H_NAP_JONG_NONG,H_NAP_JONG_JOO,H_NAP_JONG_TOTAL,H_NAP_HYUN_SO,H_\
NAP_HYUN_NONG,H_NAP_HYUN_JOO,H_NAP_HYUN_TOTAL,H_SIL_SO,H_SIL_NONG,H_SIL_JOO,\
H_SIL_TOTAL,RST_VALIDATION,H_SPECIAL_STANDARD,H_SPECIAL_YK_BO,H_PERSON_SAVE,\
H_SGONG_JOHAP,H_SGONG_JUNGKEN,H_GUNMU,H_SGONG_FOREIGNER,H_FAMI70NO,H_SPECADD\
NO,H_SPECADDDED,H_SHOSAMT,H_HOUSEINTAMT2,CONFM,ZCONF_DATE,WT_QSCOD,MODE_FLAG\
,EAI_FLAG,EAI_DATE)select H_YEAR ,H_MONTH ,MDGBN ,CD_DATA ,NO_CRT_SRL ,IFSYS\
 ,H_SSCODE ,H_JIGUB_YMD ,H_EMPNO ,rownum SEQLN ,IFDAT ,H_UNIT ,H_DEPT ,H_JUM\
IN ,H_ALIEN ,H_JOSEO ,H_REGISTER ,H_BUNRI ,H");
     sqlbuft((void **)0,
       "_NAME ,H_POSTNO ,H_ADDRESS ,H_KSYMD_FROM ,H_KSYMD_TO ,H_KMYMD_FROM ,\
H_KMYMD_TO ,H_JOO_PAY ,H_JOO_BONUS ,H_JOO_INJUNG ,H_JOO_TEMP1 ,H_JOO_TEMP2 ,\
H_JOO_TOTAL ,H_FREE_OVERSEA ,H_FREE_NIGHT ,H_FREE_TECH ,H_FREE_TEMP1 ,H_FREE\
_TEMP2 ,H_FREE_TEMP3 ,H_FREE_TOTAL ,H_WOLJUNG ,H_BASE_PAY ,H_LABOR_GONG ,H_L\
ABOR_PAY ,H_BASE_ME ,H_BASE_MATE ,H_BASE_SUPPORT_SU ,H_BASE_SUPPORT_MONEY ,H\
_BASE_TEMP1 ,H_BASE_TEMP2 ,H_BASE_TEMP3 ,H_BASE_TEMP4 ,H_BASE_TEMP5 ,H_BASE_\
TEMP6 ,H_ADD_OLD_SU ,H_ADD_OLD_MONEY ,H_ADD_JANG_SU ,H_ADD_JANG_MONEY ,H_ADD\
_SON_SU ,H_ADD_SON_MONEY ,H_ADD_LADY ,H_ADD_TEMP1 ,H_ADD_TEMP2 ,H_ADD_TEMP3 \
,H_ADD_TEMP4 ,H_ADD_TEMP5 ,H_ADD_TEMP6 ,H_SOSUGONG ,H_SPECIAL_INSURANCE ,H_S\
PECIAL_MEDICAL ,H_SPECIAL_EDUCATE ,H_SPECIAL_HOUSE ,H_SPECIAL_DONATE ,H_SPEC\
IAL_SIN ,H_SPECIAL_TEMP1 ,H_SPECIAL_TEMP2 ,H_SPECIAL_TEMP3 ,H_SPECIAL_TEMP4 \
,H_SPECIAL_TEMP5 ,H_SPECIAL_TEMP6 ,H_SPECIAL_TOTAL ,H_CHAGAM ,H_PERSON_GONG \
,H_WORKING_GONG ,H_JOHAB_GONG ,H_GONG_TEMP1 ,H_GONG_TEMP2 ,H_GONG_TEMP3 ,H_G\
ONG_TEMP4 ,H_GONG_TEMP5 ,H_GONG_TEMP6 ,H_STA");
     sqlbuft((void **)0,
       "NDARD ,H_SANCHUL ,H_SGONG_LABOR ,H_SGONG_ASSETS ,H_SGONG_HOUSE ,H_SG\
ONG_OVERSEA ,H_SGONG_STOCK ,H_SGONG_TEMP1 ,H_SGONG_TEMP2 ,H_SGONG_TEMP3 ,H_S\
GONG_TEMP4 ,H_SGONG_TEMP5 ,H_SGONG_TEMP6 ,H_SGONG_TOTAL ,H_SGM_PAY ,H_SGM_JO\
GAM ,H_SGM_TEMP1 ,H_SGM_TEMP2 ,H_SGM_TEMP3 ,H_SGM_TEMP4 ,H_SGM_TEMP5 ,H_SGM_\
TEMP6 ,H_SGM_TOTAL ,H_DECIDE_SO ,H_DECIDE_NONG ,H_DECIDE_JOO ,H_DECIDE_TOTAL\
 ,H_NAP_JONG_SO ,H_NAP_JONG_NONG ,H_NAP_JONG_JOO ,H_NAP_JONG_TOTAL ,H_NAP_HY\
UN_SO ,H_NAP_HYUN_NONG ,H_NAP_HYUN_JOO ,H_NAP_HYUN_TOTAL ,H_SIL_SO ,H_SIL_NO\
NG ,H_SIL_JOO ,H_SIL_TOTAL ,RST_VALIDATION ,H_SPECIAL_STANDARD ,H_SPECIAL_YK\
_BO ,H_PERSON_SAVE ,H_SGONG_JOHAP ,H_SGONG_JUNGKEN ,H_GUNMU ,H_SGONG_FOREIGN\
ER ,H_FAMI70NO ,H_SPECADDNO ,H_SPECADDDED ,H_SHOSAMT ,H_HOUSEINTAMT2 ,CONFM \
,ZCONF_DATE ,WT_QSCOD ,MODE_FLAG ,EAI_FLAG ,EAI_DATE  from (select :b0 H_YEA\
R ,:b1 H_MONTH ,'TX' MDGBN ,:b2 CD_DATA ,:b3 NO_CRT_SRL ,'HRIS' IFSYS ,:b4 H\
_SSCODE ,REPLACE((:b5||'25'),' ','') H_JIGUB_YMD ,A.empno H_EMPNO ,:b6 IFDAT\
 ,'000' H_UNIT ,max(decode(substr(a.pstate,1");
     sqlbuft((void **)0,
       ",1),'7',:b7, case  when (X.Tribegb='2' and Y.Tribegb='2') then Y.Fin\
code else X.Fincode  end )) H_DEPT ,replace(max(B.juminid),'-','') H_JUMIN ,\
decode(substr(max(B.juminid),8,1),'5',' 9','6','9','1') H_ALIEN ,'2' H_JOSEO\
 ,'1' H_REGISTER ,'1' H_BUNRI ,max(A.korname) H_NAME ,max(B.zipno) H_POSTNO \
,max(SUBSTRB(B.addr,1,70)) H_ADDRESS ,REPLACE((:b5||'01'),' ','') H_KSYMD_FR\
OM ,to_char(last_day(TO_DATE(SUBSTR(paydate,1,6),'YYYYMM')),'YYYYMMDD') H_KS\
YMD_TO ,REPLACE((:b5||'01'),' ','') H_KMYMD_FROM ,to_char(last_day(TO_DATE(S\
UBSTR(paydate,1,6),'YYYYMM')),'YYYYMMDD') H_KMYMD_TO ,((sum(NVL(TAXPAYSUM,0)\
)+sum(nvl(a.yueduamt,0)))-sum(nvl(yuedutax,0))) H_JOO_PAY ,0 H_JOO_BONUS ,0 \
H_JOO_INJUNG ,0 H_JOO_TEMP1 ,0 H_JOO_TEMP2 ,0 H_JOO_TOTAL ,0 H_FREE_OVERSEA \
,0 H_FREE_NIGHT ,0 H_FREE_TECH ,sum(NVL(NOTAXPAYSUM,0)) H_FREE_TEMP1 ,0 H_FR\
EE_TEMP2 ,0 H_FREE_TEMP3 ,sum(NVL(NOTAXPAYSUM,0)) H_FREE_TOTAL ,sum(NVL(TAXP\
AYSUM,0)) H_WOLJUNG ,sum(NVL(TAXPAYSUM,0)) H_BASE_PAY ,sum(NVL(LABINDED,0)) \
H_LABOR_GONG ,sum(NVL(LABINAMT,0)) H_LABOR_P");
     sqlbuft((void **)0,
       "AY ,sum(NVL(BASICDED,0)) H_BASE_ME ,sum(NVL(MATEDED,0)) H_BASE_MATE \
,(sum(NVL(FAMIDED,0))/:b10) H_BASE_SUPPORT_SU ,sum(NVL(FAMIDED,0)) H_BASE_SU\
PPORT_MONEY ,0 H_BASE_TEMP1 ,0 H_BASE_TEMP2 ,0 H_BASE_TEMP3 ,0 H_BASE_TEMP4 \
,0 H_BASE_TEMP5 ,0 H_BASE_TEMP6 ,(sum(NVL(SILVERDED,0))/:b11) H_ADD_OLD_SU ,\
sum(NVL(SILVERDED,0)) H_ADD_OLD_MONEY ,(sum(NVL(OBSDED,0))/:b12) H_ADD_JANG_\
SU ,sum(NVL(OBSDED,0)) H_ADD_JANG_MONEY ,(sum(NVL(EDUDED,0))/:b13) H_ADD_SON\
_SU ,sum(NVL(EDUDED,0)) H_ADD_SON_MONEY ,sum(NVL(WOMANDED,0)) H_ADD_LADY ,0 \
H_ADD_TEMP1 ,0 H_ADD_TEMP2 ,0 H_ADD_TEMP3 ,0 H_ADD_TEMP4 ,0 H_ADD_TEMP5 ,0 H\
_ADD_TEMP6 ,0 H_SOSUGONG ,0 H_SPECIAL_INSURANCE ,0 H_SPECIAL_MEDICAL ,0 H_SP\
ECIAL_EDUCATE ,0 H_SPECIAL_HOUSE ,0 H_SPECIAL_DONATE ,0 H_SPECIAL_SIN ,0 H_S\
PECIAL_TEMP1 ,0 H_SPECIAL_TEMP2 ,0 H_SPECIAL_TEMP3 ,0 H_SPECIAL_TEMP4 ,0 H_S\
PECIAL_TEMP5 ,0 H_SPECIAL_TEMP6 ,0 H_SPECIAL_TOTAL ,sum(NVL(INDED,0)) H_CHAG\
AM ,0 H_PERSON_GONG ,0 H_WORKING_GONG ,0 H_JOHAB_GONG ,0 H_GONG_TEMP1 ,0 H_G\
ONG_TEMP2 ,0 H_GONG_TEMP3 ,0 H_GONG_TEMP4 ,0");
     sqlbuft((void **)0,
       " H_GONG_TEMP5 ,0 H_GONG_TEMP6 ,sum(NVL(TAXINAMT,0)) H_STANDARD ,sum(\
NVL(CALCTAX,0)) H_SANCHUL ,sum(NVL(LABTAXDED,0)) H_SGONG_LABOR ,0 H_SGONG_AS\
SETS ,0 H_SGONG_HOUSE ,0 H_SGONG_OVERSEA ,0 H_SGONG_STOCK ,0 H_SGONG_TEMP1 ,\
0 H_SGONG_TEMP2 ,0 H_SGONG_TEMP3 ,0 H_SGONG_TEMP4 ,0 H_SGONG_TEMP5 ,0 H_SGON\
G_TEMP6 ,sum(NVL(LABTAXDED,0)) H_SGONG_TOTAL ,0 H_SGM_PAY ,0 H_SGM_JOGAM ,0 \
H_SGM_TEMP1 ,0 H_SGM_TEMP2 ,0 H_SGM_TEMP3 ,0 H_SGM_TEMP4 ,0 H_SGM_TEMP5 ,0 H\
_SGM_TEMP6 ,0 H_SGM_TOTAL ,sum(NVL(INTAX,0)) H_DECIDE_SO ,0 H_DECIDE_NONG ,s\
um(NVL(JUTAX,0)) H_DECIDE_JOO ,(sum(NVL(INTAX,0))+sum(NVL(JUTAX,0))) H_DECID\
E_TOTAL ,0 H_NAP_JONG_SO ,0 H_NAP_JONG_NONG ,0 H_NAP_JONG_JOO ,0 H_NAP_JONG_\
TOTAL ,0 H_NAP_HYUN_SO ,0 H_NAP_HYUN_NONG ,0 H_NAP_HYUN_JOO ,0 H_NAP_HYUN_TO\
TAL ,sum(NVL(INTAX,0)) H_SIL_SO ,0 H_SIL_NONG ,sum(NVL(JUTAX,0)) H_SIL_JOO ,\
(sum(NVL(INTAX,0))+sum(NVL(JUTAX,0))) H_SIL_TOTAL ,:b14 RST_VALIDATION ,sum(\
NVL(SPEDED,0)) H_SPECIAL_STANDARD ,0 H_SPECIAL_YK_BO ,0 H_PERSON_SAVE ,0 H_S\
GONG_JOHAP ,0 H_SGONG_JUNGKEN ,max(NVL(B.BLD");
     sqlbuft((void **)0,
       "CODE,'2C')) H_GUNMU ,0 H_SGONG_FOREIGNER ,0 H_FAMI70NO ,0 H_SPECADDN\
O ,0 H_SPECADDDED ,0 H_SHOSAMT ,0 H_HOUSEINTAMT2 ,null  CONFM ,null  ZCONF_D\
ATE ,null  WT_QSCOD ,'I' MODE_FLAG ,'N' EAI_FLAG ,null  EAI_DATE  from PKHPH\
IS A ,PKMPMAS B ,(select Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  fro\
m Pycdept where Orgnum=:b15) X ,(select Deptcode ,Fincode ,Substr(Tribegb,1,\
1) Tribegb  from Pycdept where Orgnum=:b15) Y where (((SUBSTR(A.PAYDATE,1,6)\
=:b5 and A.EMPNO=B.EMPNO) and X.Deptcode=A.Deptcode) and Y.Deptcode=A.Jobdep\
t) group by A.EMPNO,SUBSTR(A.PAYDATE,1,6) union select :b0 H_YEAR ,:b1 H_MON\
TH ,'TX' MDGBN ,:b2 CD_DATA ,:b3 NO_CRT_SRL ,'HRIS' IFSYS ,:b22 H_SSCODE ,PA\
YDATE H_JIGUB_YMD ,A.empno H_EMPNO ,:b6 IFDAT ,null  H_UNIT ,C.FINCODE H_DEP\
T ,replace(B.juminid,'-','') H_JUMIN ,decode(substr(B.juminid,8,1),'5','9','\
6','9','1') H_ALIEN ,'2' H_JOSEO ,'1' H_REGISTER ,'1' H_BUNRI ,NVL(korname,'\
   ') H_NAME ,'' H_POSTNO ,SUBSTRB(addr,1,70) H_ADDRESS ,(to_char(add_months\
(to_date(SUBSTR(paydate,1,6),'YYYYMM'),(-1))");
     sqlbuft((void **)0,
       ",'YYYYMM')||'01') H_KSYMD_FROM ,to_char(last_day(add_months(to_date(\
SUBSTR(paydate,1,6),'YYYYMM'),(-1))),'YYYYMMDD') H_KSYMD_TO ,(to_char(add_mo\
nths(to_date(SUBSTR(paydate,1,6),'YYYYMM'),(-1)),'YYYYMM')||'01') H_KMYMD_FR\
OM ,to_char(last_day(add_months(to_date(SUBSTR(paydate,1,6),'YYYYMM'),(-1)))\
,'YYYYMMDD') H_KMYMD_TO ,TAXPAYSUM H_JOO_PAY ,0 H_JOO_BONUS ,0 H_JOO_INJUNG \
,0 H_JOO_TEMP1 ,0 H_JOO_TEMP2 ,0 H_JOO_TOTAL ,0 H_FREE_OVERSEA ,0 H_FREE_NIG\
HT ,0 H_FREE_TECH ,NVL(NOTAXPAYSUM,0) H_FREE_TEMP1 ,0 H_FREE_TEMP2 ,0 H_FREE\
_TEMP3 ,NVL(NOTAXPAYSUM,0) H_FREE_TOTAL ,NVL(TAXPAYSUM,0) H_WOLJUNG ,NVL(TAX\
PAYSUM,0) H_BASE_PAY ,NVL(INDED,0) H_LABOR_GONG ,NVL((LABINAMT-INDED),0) H_L\
ABOR_PAY ,0 H_BASE_ME ,0 H_BASE_MATE ,0 H_BASE_SUPPORT_SU ,0 H_BASE_SUPPORT_\
MONEY ,0 H_BASE_TEMP1 ,0 H_BASE_TEMP2 ,0 H_BASE_TEMP3 ,0 H_BASE_TEMP4 ,0 H_B\
ASE_TEMP5 ,0 H_BASE_TEMP6 ,0 H_ADD_OLD_SU ,0 H_ADD_OLD_MONEY ,0 H_ADD_JANG_S\
U ,0 H_ADD_JANG_MONEY ,0 H_ADD_SON_SU ,0 H_ADD_SON_MONEY ,0 H_ADD_LADY ,0 H_\
ADD_TEMP1 ,0 H_ADD_TEMP2 ,0 H_ADD_TEMP3 ,0 H");
     sqlbuft((void **)0,
       "_ADD_TEMP4 ,0 H_ADD_TEMP5 ,0 H_ADD_TEMP6 ,0 H_SOSUGONG ,0 H_SPECIAL_\
INSURANCE ,0 H_SPECIAL_MEDICAL ,0 H_SPECIAL_EDUCATE ,0 H_SPECIAL_HOUSE ,0 H_\
SPECIAL_DONATE ,0 H_SPECIAL_SIN ,0 H_SPECIAL_TEMP1 ,0 H_SPECIAL_TEMP2 ,0 H_S\
PECIAL_TEMP3 ,0 H_SPECIAL_TEMP4 ,0 H_SPECIAL_TEMP5 ,0 H_SPECIAL_TEMP6 ,0 H_S\
PECIAL_TOTAL ,NVL(INDED,0) H_CHAGAM ,0 H_PERSON_GONG ,0 H_WORKING_GONG ,0 H_\
JOHAB_GONG ,0 H_GONG_TEMP1 ,0 H_GONG_TEMP2 ,0 H_GONG_TEMP3 ,0 H_GONG_TEMP4 ,\
0 H_GONG_TEMP5 ,0 H_GONG_TEMP6 ,NVL(TAXINAMT,0) H_STANDARD ,NVL(CALCTAX,0) H\
_SANCHUL ,NVL(LABTAXDED,0) H_SGONG_LABOR ,0 H_SGONG_ASSETS ,0 H_SGONG_HOUSE \
,0 H_SGONG_OVERSEA ,0 H_SGONG_STOCK ,0 H_SGONG_TEMP1 ,0 H_SGONG_TEMP2 ,0 H_S\
GONG_TEMP3 ,0 H_SGONG_TEMP4 ,0 H_SGONG_TEMP5 ,0 H_SGONG_TEMP6 ,NVL(LABTAXDED\
,0) H_SGONG_TOTAL ,0 H_SGM_PAY ,0 H_SGM_JOGAM ,0 H_SGM_TEMP1 ,0 H_SGM_TEMP2 \
,0 H_SGM_TEMP3 ,0 H_SGM_TEMP4 ,0 H_SGM_TEMP5 ,0 H_SGM_TEMP6 ,0 H_SGM_TOTAL ,\
NVL(INTAX,0) H_DECIDE_SO ,0 H_DECIDE_NONG ,NVL(JUTAX,0) H_DECIDE_JOO ,(NVL(I\
NTAX,0)+NVL(JUTAX,0)) H_DECIDE_TOTAL ,0 H_NA");
     sqlstm.stmt = "P_JONG_SO ,0 H_NAP_JONG_NONG ,0 H_NAP_JONG_JOO ,0 H_NAP\
_JONG_TOTAL ,0 H_NAP_HYUN_SO ,0 H_NAP_HYUN_NONG ,0 H_NAP_HYUN_JOO ,0 H_NAP_HY\
UN_TOTAL ,NVL(INTAX,0) H_SIL_SO ,0 H_SIL_NONG ,NVL(JUTAX,0) H_SIL_JOO ,(NVL(I\
NTAX,0)+NVL(JUTAX,0)) H_SIL_TOTAL ,:b14 RST_VALIDATION ,0 H_SPECIAL_STANDARD \
,0 H_SPECIAL_YK_BO ,0 H_PERSON_SAVE ,0 H_SGONG_JOHAP ,0 H_SGONG_JUNGKEN ,NVL(\
C.PLACECODE,'2C') H_GUNMU ,0 H_SGONG_FOREIGNER ,0 H_FAMI70NO ,0 H_SPECADDNO ,\
0 H_SPECADDDED ,0 H_SHOSAMT ,0 H_HOUSEINTAMT2 ,null  CONFM ,null  ZCONF_DATE \
,null  WT_QSCOD ,'I' MODE_FLAG ,'N' EAI_FLAG ,null  EAI_DATE  from PKHILPAY A\
 ,PKHILHIS B ,PYCDEPT C where (((SUBSTR(A.PAYDATE,1,6)=:b5 and A.EMPNO=B.EMPN\
O(+)) and A.ORGNUM=C.ORGNUM) and A.DEPTCODE=C.DEPTCODE)) ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )117;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_mm;
     sqlstm.sqhstl[1] = (unsigned long )3;
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
     sqlstm.sqhstv[3] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)v_sscode;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)v_dt_createhms;
     sqlstm.sqhstl[6] = (unsigned long )15;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)v_fincode;
     sqlstm.sqhstl[7] = (unsigned long )6;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[8] = (unsigned long )7;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[9] = (unsigned long )7;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&v_famided;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&v_silverded;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&v_obsded;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&v_eduded;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)v_rst_validation;
     sqlstm.sqhstl[14] = (unsigned long )2;
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)v_orgnum;
     sqlstm.sqhstl[15] = (unsigned long )4;
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)v_orgnum;
     sqlstm.sqhstl[16] = (unsigned long )4;
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[17] = (unsigned long )7;
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[18] = (unsigned long )5;
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)v_mm;
     sqlstm.sqhstl[19] = (unsigned long )3;
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[20] = (unsigned long )4;
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)v_sscodeil;
     sqlstm.sqhstl[22] = (unsigned long )4;
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)v_dt_createhms;
     sqlstm.sqhstl[23] = (unsigned long )15;
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)v_rst_validation;
     sqlstm.sqhstl[24] = (unsigned long )2;
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[25] = (unsigned long )7;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
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
     {     /* 에러이면 */
          sprintf(log_buff, "ORA-%05d - Insert EAI_WORKTAX Error--------\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          
          printf(log_buff, "ORA-%05d - Insert TEMP EAI_WORKTAX Error--------\n", sqlca.sqlcode);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          /* EXEC SQL ROLLBACK WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 26;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )236;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         return(-1);
       
     } 
     else 
     {     /* 에러가 아니면 */
          v_cnt_line = sqlca.sqlerrd[2];
          WriteLog("Insert TEMP EAI_WORKTAX Success\n");
          sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          /* EXEC SQL COMMIT WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 26;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )251;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     }
     
     /*********************************************************************************/
                  
     /* EXEC SQL                
     SELECT SUM(INTAX), SUM(INTAX),  SUM(JUTAX)
       INTO :v_amttot1, :v_amtin1,  :v_amtju1
       FROM PKHPHIS A ,PKMPMAS B
      WHERE SUBSTR(A.PAYDATE,1,6) = :v_paydate
        AND A.EMPNO   = B.EMPNO; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(INTAX) ,sum(INTAX) ,sum(JUTAX) into :b0,:b1,\
:b2  from PKHPHIS A ,PKMPMAS B where (SUBSTR(A.PAYDATE,1,6)=:b3 and A.EMPNO=B\
.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )266;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_amttot1;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_amtin1;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_amtju1;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_paydate;
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

  
            
     /* EXEC SQL                
     SELECT SUM(NVL(INTAX,0)), SUM(NVL(INTAX,0)), SUM(NVL(JUTAX,0))
       INTO :v_amttot2, :v_amtin2, :v_amtju2
       FROM PKHILPAY A ,PKHILHIS B
      WHERE SUBSTR(A.PAYDATE,1,6) LIKE  :v_paydate
        AND A.EMPNO  = B.EMPNO(+); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(NVL(INTAX,0)) ,sum(NVL(INTAX,0)) ,sum(NVL(JU\
TAX,0)) into :b0,:b1,:b2  from PKHILPAY A ,PKHILHIS B where (SUBSTR(A.PAYDATE\
,1,6) like :b3 and A.EMPNO=B.EMPNO(+))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )297;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_amttot2;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_amtin2;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_amtju2;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_paydate;
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


     
     if  (sqlca.sqlcode != 0) 
     {    /* 에러이면 */
          v_cnt_line = 0;
          sprintf(log_buff, "ORA-%05d - Fetch 통계_Error\n", sqlca.sqlcode);
          printf("ORA-%05d - Fetch 통계_Error\n", sqlca.sqlcode);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          /* EXEC SQL ROLLBACK WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 26;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )328;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
          return(-1);
     }
     
     v_amttot = v_amttot1 + v_amttot2;
     v_amtin = v_amtin1 + v_amtin2;
     v_amtju = v_amtju1 + v_amtju2;         
               
     return(0);
}

int  Check_date()
{    
     /* EXEC SQL
     SELECT  nvl(PAYDATE,'000000'), SUBSTR(PAYDATE,1,4),  SUBSTR(PAYDATE, 5, 2)
       INTO  :v_yyyymm, :v_yyyy, :v_mm
       FROM  PKHPHIS
      WHERE  SUBSTR(PAYDATE,1,6) = :v_paydate
        AND  ROWNUM = 1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(PAYDATE,'000000') ,SUBSTR(PAYDATE,1,4) ,SUBS\
TR(PAYDATE,5,2) into :b0,:b1,:b2  from PKHPHIS where (SUBSTR(PAYDATE,1,6)=:b3\
 and ROWNUM=1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )343;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_yyyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_mm;
     sqlstm.sqhstl[2] = (unsigned long )3;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_paydate;
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


     
     if (sqlca.sqlcode == -1403 )
     {  
         return(-1);
     }
     if ( sqlca.sqlcode != 0 )
     {  
         return(1);
     }              
     
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
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )374;
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
     sqlstm.arrsiz = 26;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )415;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}