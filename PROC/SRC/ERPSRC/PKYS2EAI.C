
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
    "pkys2eai.pc"
};


static unsigned int sqlctx = 161171;


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
   unsigned char  *sqhstv[10];
   unsigned long  sqhstl[10];
            int   sqhsts[10];
            short *sqindv[10];
            int   sqinds[10];
   unsigned long  sqharm[10];
   unsigned long  *sqharc[10];
   unsigned short  sqadto[10];
   unsigned short  sqtdso[10];
} sqlstm = {12,10};

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
55,0,0,3,75,1,3,290,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
110,0,0,4,0,0,31,656,0,0,0,0,0,1,0,
125,0,0,5,0,0,29,666,0,0,0,0,0,1,0,
140,0,0,6,158,0,4,669,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
171,0,0,7,0,0,31,682,0,0,0,0,0,1,0,
186,0,0,8,0,0,29,690,0,0,0,0,0,1,0,
201,0,0,9,50,0,3,700,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,0,
1,97,0,0,1,97,0,0,
242,0,0,10,0,0,29,710,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : pkys2eai(INSA->EAI Interface Program)
 PROGRM-Decription : 연말정산테이블을 읽어서 EAI Interface 테이블에 Insert  (EAI_WORKTAX)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 재직자 연말정산(근로소득)
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2005.07.                                    

근로소득(EAI_WORKTAX)   : /var/mte/adapter/conf/script/PIM/PIM.PIMFI1060B.SND.sh

Update Contents
   Version    date(yy.mm.dd)     programmer      description
   1.00       2005.07.           dsa2000         SAP도입에 따른 신규개발(pkmpyserp.pc를 토대로)
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

     char    v_dt_create[9];         /* 생성일자 */
     char    v_dt_createhms[15];     /* 생성일시 */
     char    v_cd_data[4]  = "D51";  /* Employee Data Code */
     int     v_no_crt_srl  = 0;      /* 생성 일련번호 */
     char    v_sscode[3+1] = "A20";  /* 소득관리코드(연말정산) */
     char    v_ym_acct[7];           /* 회계년월 */
     int     v_cnt_line = 0;         /* Line건수 */ 
     char    v_ph_proc[2] = "A";     /* 처리단계 */
     char    v_st_proc[2] = "P";     /* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
     char    v_cl_data_use[2] = "A"; /* Data 활용구분 */
     char    v_id_crt_user[5];       /* 생성 UserID */
     char    v_paydate[7];           /* 지급년월 */
     char    v_yyyymm[7];            /* 지급년월 */
     char    v_yyyy[5];              /* 지급년 */
     char    v_mm[3];                /* 지급월 */
     double  v_amttot = 0;           /* 과세표준금액총액   */
     double  v_amtin  = 0;           /* 결정소득세총액   */
     double  v_amtju  = 0;           /* 결정주민세총액   */
     double  v_amtnong  = 0;         /* 결정주민세총액   */
     char    v_orgnum[4];            /* 휴직조직차수 dsa2000 */  
     char    v_deptcode[6];          /* 휴직부서코드 dsa2000 */
     char    v_rst_validation[2] = "A";
/* EXEC SQL END   DECLARE SECTION; */ 


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
char  *HOMEDIR;
char  logfile[40];
char  logfile_fullname[140];
int    id;
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
     {    /* pkys2eai 200507 H09 IHE40 D006 pkys2eai 2005073100000 */
          printf("[Usage] : pkys2eai 1.지급년월(YYYYMM) 2.휴직자orgnum 3.휴직자deptcode 4.작업자 5.progid 6.시작시간\n");
          fclose(fp);
          exit(1);
     }        
     
     hinsa_log_print(0,"ERP 인터페이스 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     /*========================================================*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     sprintf(v_paydate, argv[1]);        /* 지급년월   */     
     sprintf(v_yyyy,"%4.4s",v_paydate);  /* 지급년   */     
     sprintf(v_mm  ,"%2s",v_paydate+4);  /* 지급월   */     
     sprintf(v_orgnum,      argv[2]);    /* 휴직자 조직차수  dsa2000  2004.01.29 추가*/     
     sprintf(v_deptcode,    argv[3]);    /* 휴직자 부서코드  dsa2000  2004.01.29 추가*/     
     sprintf(v_id_crt_user, argv[4]);    /* 작업자사번 */  
            
     InitVariables();   /* 변수 초기화 */
     
     Initialize();       /* 초기화 루틴 */
     
     CreateLog();
     
     printf("작업 시작......................................... >\n");
     
     sprintf(buff, "프로그램명 : %s\n", argv[0]);
     WriteLog(buff);
     sprintf(buff, "지급년월  : %s\n", argv[1]);
     WriteLog(buff);
     sprintf(buff, "휴직자 조직차수 : %s\n", argv[2]); /* 휴직자 조직차수  dsa2000  2004.01.29 추가*/     
     WriteLog(buff);
     sprintf(buff, "휴직자 부서코드 : %s\n", argv[3]); /* 휴직자 부서코드  dsa2000  2004.01.29 추가*/     
     WriteLog(buff);
     
     if  (WriteControl(0) == -1) 
     {     /* 초기값 세팅 */
           fclose(fp);
           exit(1);
     }
     
     if   (WriteEmployee() == -1)
     {
           WriteControl(2);  /* 비정상종료 */
           Write_batlog(seqno++, "ERROR ====== [작업 실패] =====\n");   
           error_quit("ERROR ====== [작업 실패] =====\n");   
     }         
     else 
     {    
           WriteControl(1);   /* 정상종료 */  
           fclose(fp);
           printf("총  건  수    : %d\n", v_cnt_line);
           printf("차감소득세    : %0.0f\n", v_amttot);
           printf("소득세합계    : %0.0f\n", v_amtin);
           printf("주민세합계    : %0.0f\n", v_amtju);
           printf("농특세합계    : %0.0f\n", v_amtnong);      
           
           sprintf(log_buff, "총  건  수    : %d\n", v_cnt_line);
           Write_batlog(seqno++, log_buff);   
           sprintf(log_buff, "차감소득세    : %0.0f\n", v_amttot);
           Write_batlog(seqno++, log_buff);   
           sprintf(log_buff, "소득세합계    : %0.0f\n", v_amtin);
           Write_batlog(seqno++, log_buff);   
           sprintf(log_buff, "주민세합계    : %0.0f\n", v_amtju);
           Write_batlog(seqno++, log_buff);   
           sprintf(log_buff, "농특세합계    : %0.0f\n", v_amtnong);
           Write_batlog(seqno++, log_buff);   
           
           Write_batlog(seqno++, "OK ====== [작업 완료] =====\n");   
           hinsa_exit(0,"OK ====== [작업 완료] =====\n");   /*Dsa2000*/
     }     
}              


void CreateLog()
{  
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/log/ERPlog/");
     
     /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%spkys2eai%s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl);
     printf("logfile_fullname : %s \n", logfile_fullname);
     
     fp = fopen(logfile_fullname, "w+"); /* 로그파일 오픈 */
     
     if  (fp == NULL) 
     {
           printf("로그파일오픈(%s) 에러\n", logfile_fullname);
           exit(1);
     }
}

void InitVariables(void)
{
  memset(logfile, NULL, sizeof(logfile));
  memset(logfile_fullname, NULL, sizeof(logfile_fullname));
  memset(v_dt_create, NULL, sizeof(v_dt_create));
  memset(v_dt_createhms, NULL, sizeof(v_dt_createhms));
  memset(v_ym_acct, NULL, sizeof(v_ym_acct));
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


     
     if  (sqlca.sqlcode != 0)
     {  
          printf("ORA-%05d - 현재날짜 가져오기  Error\n", sqlca.sqlcode);
          fclose(fp);
          exit(1);
     }  
     
     /* EXEC SQL 
     SELECT NVL(MAX(NO_CRT_SRL)+1,1)
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
          printf("ORA-%05d - MAX Seril# 가져오기  Error\n", sqlca.sqlcode);
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
     
     if      (gubun == 1)  sprintf(v_st_proc, "N");
     else if (gubun == 2)  sprintf(v_st_proc, "A");
     
     WriteLog(buff);
     sprintf(buff, "v_dt_create  : (%s)\n", v_dt_create);
     WriteLog(buff);             
     sprintf(buff, "v_cd_data    : (%s)\n", v_cd_data);
     WriteLog(buff);             
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);             
     sprintf(buff, "v_ym_acct    : (%s)\n", v_ym_acct);
     WriteLog(buff);             
     sprintf(buff, "v_ph_proc    : (%s)\n", v_ph_proc);
     WriteLog(buff);             
     sprintf(buff, "v_st_proc    : (%s)\n", v_st_proc);
     WriteLog(buff);
     sprintf(buff, "v_cl_data_use: (%s)\n", v_cl_data_use);
     WriteLog(buff);
     sprintf(buff, "v_id_crt_user: (%s)\n", v_id_crt_user);
     WriteLog(buff);
     sprintf(buff, "v_cnt_line   : (%d)\n", v_cnt_line);
     WriteLog(buff);
     
     if      (gubun == 1) printf("OK Program End..................................... >\n");
     else if (gubun == 2) printf("Fail Program End 1 ( Gubun : %d , sqlcode : %d).... >\n", gubun, sqlca.sqlcode);
     
     return(0);
}    
     
int  WriteEmployee(void)
{    
     WriteLog("< WriteEAI_WORKTAX Starting >-------------------------------\n");
     
     sprintf(buff, "v_dt_create : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data : (%s)\n", v_cd_data);
     WriteLog(buff);
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);
     sprintf(buff, "v_rst_validation : (%s)\n", v_rst_validation);
     WriteLog(buff);
     
       
    /* printf("v_yyyy           : %s \n", v_yyyy);
     printf("v_mm             : %s \n", v_mm);
     printf("v_cd_data        : %s \n", v_cd_data);
     printf("v_no_crt_srl     : %d \n", v_no_crt_srl);
     printf("v_dt_createhms   : %s \n", v_dt_createhms);
     printf("v_sscode         : %s \n", v_sscode);
     printf("v_paydate        : %s \n", v_paydate);
     printf("v_rst_validation : %s \n", v_rst_validation);
     printf("v_orgnum         : %s, %s\n", v_orgnum, v_deptcode); */
     
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
            H_UNIT             ,
            H_DEPT             ,
            H_JUMIN            ,
            H_ALIEN            ,
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
            H_CORPNAME          , 
            H_CORPNAME1         , 
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
            H_BCOGBONSUM        , 
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
            EAI_DATE            ,
            REFERENCE1          ,
            REFERENCE2          ,
            REFERENCE3          ,
            REFERENCE4          ,
            REFERENCE5
            )              
     SELECT   
            :v_yyyy                               H_YEAR,               /o신고년o/        
            :v_mm                                 H_MONTH,              /o신고월o/   
            'TX'                                  MDGBN,                /o모듈구분o/
            :v_cd_data                            CD_DATA,              /o자료구분 근로소득(D51) o/  
            :v_no_crt_srl                         NO_CRT_SRL,           /o순서o/   
            'HRIS'                                IFSYS,                /o원천구분o/
            :v_sscode                             H_SSCODE,             /o소득관리코드 연말정산(A20)o/    
            :v_yyyy||'0310'                       H_JIGUB_YMD,          /o지급일o/
            A.empno                               H_EMPNO,              /o사번o/   
            rownum                                SEQLN,                /o라인번호o/
            :v_dt_createhms                       IFDAT,                /o생성일시 o/                
            '000'                                 H_UNIT,               /o사업장o/
/o            decode(a.orgnum , :v_orgnum, e.fincode , :v_deptcode)   H_DEPT,  휴직자 부서: HR운영팀o/    
/o            decode(a.orgnum , :v_orgnum, decode(substr(f.tribegb,1,1),'2',f.fincode, e.fincode ), :v_deptcode)   H_DEPT,  /o 이상용 20181114 휴직자 부서: HR운영팀o/    
            DECODE(A.orgnum , :v_orgnum, Case When (XX.Tribegb='2' And YY.Tribegb='2') Then YY.Fincode Else XX.Fincode End , :v_deptcode) H_DEPT,  /o20181203 JHG 조직개편 o/
            replace(B.juminid,'-','')             H_JUMIN,                  /o주민등록번호o/
            decode(substr(B.juminid,8,1),'5','9','6','9','1')      H_ALIEN, /o내외국인 구분 : 외국인(9)o/  
            '2'                                   H_JOSEO,              /o지급조서제출구분o/  
            '1'                                   H_REGISTER,           /o거주자 구분o/   
            '1'                                   H_BUNRI,              /o분리과세구분o/  
            A.korname                             H_NAME,               /o성 명o/   
            A.zipno                               H_POSTNO,             /o우편번호o/   
            SUBSTRB(A.ADDR1,1,70)                 H_ADDRESS,            /o주소o/   
            C.SDATE                               H_KSYMD_FROM,         /o귀속일_fromo/   
            C.EDATE                               H_KSYMD_TO,           /o귀속일_too/   
            C.SDATE                               H_KMYMD_FROM,         /o감면일_fromo/             
            C.EDATE                               H_KMYMD_TO,           /o감면일_too/             
            NVL(A.MPAYSUM, 0)                     H_JOO_PAY,            /o주사업장-급여o/  
            NVL(A.MBONSUM, 0)                     H_JOO_BONUS,          /o주사업장-상여o/  
            NVL(A.MCOGBONSUM, 0)                  H_JOO_INJUNG,         /o주사업장-인정상여o/   
            NVL(A.MGITASODK, 0)                   H_JOO_TEMP1,          /o주사업장-temp1o/  
            0                                     H_JOO_TEMP2,          /o주사업장-temp2o/  
            NVL(A.MPAYSUM,0) + NVL(A.MBONSUM,0)+ NVL(A.MCOGBONSUM,0)+ NVL(A.MGITASODK,0)  H_JOO_TOTAL,  /o주사업장-totalo/  
            0                                     H_FREE_OVERSEA,
            0                                     H_FREE_NIGHT,         /o비과세 야간근로o/  
            0                                     H_FREE_TECH,          /o비과세 기술o/   
            NVL(A.MNOTAX,0)                       H_FREE_TEMP1,         /o비과세 temp1o/   
            0                                     H_FREE_TEMP2,         /o비과세 temp2o/   
            0                                     H_FREE_TEMP3,         /o비과세 temp3o/   
            NVL(A.MNOTAX,0)                       H_FREE_TOTAL,         /o비과세 계o/   
            0                                     H_WOLJUNG,            /o월정급여액o/   
            NVL(TO_NUMBER(C.TAX21),0)             H_BASE_PAY,           /o과세대상급여o/  
            NVL(TO_NUMBER(C.TAX22),0)             H_LABOR_GONG,         /o근로소득공제o/  
            NVL(TO_NUMBER(C.TAX23),0)             H_LABOR_PAY,          /o근로소득급여o/  
            NVL(TO_NUMBER(C.DEDUCT_ME),0)         H_BASE_ME,            /o기본 본인o/   
            NVL(TO_NUMBER(C.DEDUCT_PARTNER),0)    H_BASE_MATE,          /o기본 배우자o/   
            NVL(TO_NUMBER(C.DEDUCT_FAMILY_M),0)   H_BASE_SUPPORT_SU,    /o기본 부양가족 수 2009년o/
            NVL(TO_NUMBER(C.DEDUCT_FAMILY),0)     H_BASE_SUPPORT_MONEY, /o기본 부양가족 액o/                                                                          
            0                                     H_BASE_TEMP1,         /o기본 TEMP1o/   
            0                                     H_BASE_TEMP2,         /o기본 TEMP2o/   
            0                                     H_BASE_TEMP3,         /o기본 TEMP3o/   
            0                                     H_BASE_TEMP4,         /o기본 TEMP4o/   
            0                                     H_BASE_TEMP5,         /o기본 TEMP5o/   
            0                                     H_BASE_TEMP6,         /o기본 TEMP6o/               
            NVL(TO_NUMBER(C.DEDUCT_OLD_M),0)      H_ADD_OLD_SU,         /o추가 경로우대 수 : 70세o/    
            NVL(TO_NUMBER(C.DEDUCT_OLD),0)        H_ADD_OLD_MONEY,      /o추가 경로우대 금액o/  
            NVL(TO_NUMBER(C.DEDUCT_HANDY_M),0)    H_ADD_JANG_SU,        /o추가 장애자 수   o/  
            NVL(TO_NUMBER(C.DEDUCT_HANDY),0)      H_ADD_JANG_MONEY,     /o추가 장애자 금액 o/              
            NVL(TO_NUMBER(C.CHILD_SIX_M),0)       H_ADD_SON_SU,         /o추가 6세이하자녀 수o/         
            0                                     H_ADD_SON_MONEY,      /o추가 6세이하자녀 금액o/  
            NVL(TO_NUMBER(C.DEDUCT_WIFE),0)       H_ADD_LADY,           /o추가 부녀자공제o/  
            0                                     H_ADD_TEMP1,          /o추가 TEMP1o/   
            0                                     H_ADD_TEMP2,          /o추가 TEMP2o/   
            0                                     H_ADD_TEMP3,          /o추가 TEMP3o/   
            0                                     H_ADD_TEMP4,          /o추가 TEMP4o/   
            0                                     H_ADD_TEMP5,          /o추가 TEMP5o/   
            0                                     H_ADD_TEMP6,          /o추가 TEMP6o/               
            0                                     H_SOSUGONG,           /o소수공제액o/   
            NVL(TO_NUMBER(C.INSU_A01_AMO),0) + NVL(TO_NUMBER(C.INSU_A02_AMO),0)   H_SPECIAL_INSURANCE,  /o특별 보험료o/                                   
            NVL(TO_NUMBER(C.MEDI_AMO),0)          H_SPECIAL_MEDICAL,    /o특별 의료비o/               
            NVL(TO_NUMBER(C.EDUC_AMO),0)          H_SPECIAL_EDUCATE,    /o특별 교육비o/   
            NVL(TO_NUMBER(C.HOUSE_J01),0)         H_SPECIAL_HOUSE,      /o특별 주택자금o/  
            NVL(TO_NUMBER(C.DONA_20_UNDER_AMO),0)+ NVL(TO_NUMBER(C.DONA_20_OVER_AMO),0) + NVL(TO_NUMBER(C.DONA_10_TAX_AMO),0) + NVL(TO_NUMBER(C.DONA_40_TAX_AMO),0) + NVL(TO_NUMBER(C.DONA_41_TAX_AMO),0) H_SPECIAL_DONATE,     /o특별 기부금o/               
            NVL(TO_NUMBER(C.CARD),0)              H_SPECIAL_SIN,        /o특별 신용카드o/                  
            0                                     H_SPECIAL_TEMP1,      /o특별 TEMP1o/   
            0                                     H_SPECIAL_TEMP2,      /o특별 TEMP2o/   
            0                                     H_SPECIAL_TEMP3,      /o특별 TEMP3o/   
            0                                     H_SPECIAL_TEMP4,      /o특별 TEMP4o/   
            0                                     H_SPECIAL_TEMP5,      /o특별 TEMP5o/   
            0                                     H_SPECIAL_TEMP6,      /o특별 TEMP6o/   
            NVL(TO_NUMBER(C.SUM_EXTRA),0)         H_SPECIAL_TOTAL,      /o특별 계o/               
            NVL(TO_NUMBER(C.WITH_INCOME),0)       H_CHAGAM,             /o차감소득o/   
            NVL(TO_NUMBER(C.PENS_D01),0)          H_PERSON_GONG,        /o개인연금 소득o/              
            0                                     H_WORKING_GONG,       /o현장공제o/   
            NVL(TO_NUMBER(C.ETC_X20),0)           H_JOHAB_GONG,         /o투자조합출자공제o/                          
            0                                     H_GONG_TEMP1,         /o공제 TEMP1o/   
            0                                     H_GONG_TEMP2,         /o공제 TEMP2o/   
            0                                     H_GONG_TEMP3,         /o공제 TEMP3o/   
            0                                     H_GONG_TEMP4,         /o공제 TEMP4o/   
            0                                     H_GONG_TEMP5,         /o공제 TEMP5o/   
            0                                     H_GONG_TEMP6,         /o공제 TEMP6o/              
            NVL(TO_NUMBER(C.WITH_TAXABLE),0)      H_STANDARD,           /o과세표준o/   
            NVL(TO_NUMBER(C.WITHCULATED),0)       H_SANCHUL,            /o산출세액o/   
            NVL(TO_NUMBER(C.WITH_WAGE),0)         H_SGONG_LABOR,        /o세액공제 근로소득o/  
            0                                     H_SGONG_ASSETS,       /o세액공제 재형저축o/  
            NVL(TO_NUMBER(C.CRED_HOUSE),0)        H_SGONG_HOUSE,        /o세액공제 주택차입o/  
            NVL(TO_NUMBER(C.CRED_FOREIGN),0)      H_SGONG_OVERSEA,      /o세액공제 외국납부o/                          
            0                                     H_SGONG_STOCK,        /o세액공제 주식저축o/  
            0                                     H_SGONG_TEMP1,        /o세액공제 TEMP1o/  
            0                                     H_SGONG_TEMP2,        /o세액공제 TEMP2o/  
            0                                     H_SGONG_TEMP3,        /o세액공제 TEMP3o/  
            0                                     H_SGONG_TEMP4,        /o세액공제 정치자금 dsa2000  2004 add o/
            0                                     H_SGONG_TEMP5,        /o세액공제 TEMP5o/  
            0                                     H_SGONG_TEMP6,        /o세액공제 TEMP6o/  
            NVL(TO_NUMBER(C.SUM_TAX),0)           H_SGONG_TOTAL,        /o세액공제 TOTALo/  
            0                                     H_SGM_PAY,            /o세액감면 소득세법o/  
            0                                     H_SGM_JOGAM,          /o세액감면 조감법o/  
            0                                     H_SGM_TEMP1,          /o세액감면 TEMP1o/  
            0                                     H_SGM_TEMP2,          /o세액감면 TEMP2o/  
            0                                     H_SGM_TEMP3,          /o세액감면 TEMP3o/  
            0                                     H_SGM_TEMP4,          /o세액감면 TEMP4o/  
            0                                     H_SGM_TEMP5,          /o세액감면 TEMP5o/  
            0                                     H_SGM_TEMP6,          /o세액감면 TEMP6o/  
            0                                     H_SGM_TOTAL,          /o세액감면 TOTALo/              
            NVL(TO_NUMBER(C.INCOME_FIX_TAX),0)    H_DECIDE_SO,          /o결정 소득액o/               
            NVL(TO_NUMBER(C.INCOME_FIX_RURAL),0)  H_DECIDE_NONG,        /o결정 농특세o/               
            NVL(TO_NUMBER(C.INCOME_FIX_LOCAL),0)  H_DECIDE_JOO,         /o결정 주민세o/               
            NVL(TO_NUMBER(C.INCOME_FIX_TAX),0)  + NVL(TO_NUMBER(C.INCOME_FIX_RURAL),0)   + NVL(TO_NUMBER(C.INCOME_FIX_LOCAL),0)   H_DECIDE_TOTAL,      /oTOTALo/   
            NVL(TO_NUMBER(C.INCOME_PRE_TAX),0)    H_NAP_JONG_SO,        /o기납부 종 소득세o/  
            NVL(TO_NUMBER(C.INCOME_PRE_RURAL),0)  H_NAP_JONG_NONG,      /o기납부 종 농특세o/  
            NVL(TO_NUMBER(C.INCOME_PRE_LOCAL),0)  H_NAP_JONG_JOO,       /o기납부 종 주민세o/              
            NVL(TO_NUMBER(C.INCOME_PRE_TAX),0)   + NVL(TO_NUMBER(C.INCOME_PRE_RURAL),0) + NVL(TO_NUMBER(C.INCOME_PRE_LOCAL),0)  H_NAP_JONG_TOTAL,    /o기납부 종 TOTALo/
            NVL(TO_NUMBER(C.INCOME_WORK_TAX),0)   H_NAP_HYUN_SO,        /o기납부 현 소득세o/  
            NVL(TO_NUMBER(C.INCOME_WORK_RURAL),0) H_NAP_HYUN_NONG,      /o기납부 현 농특세o/  
            NVL(TO_NUMBER(C.INCOME_WORK_LOCAL),0) H_NAP_HYUN_JOO,        /o기납부 현 주민세o/             
            NVL(TO_NUMBER(C.INCOME_WORK_TAX),0)   + NVL(TO_NUMBER(C.INCOME_WORK_RURAL),0)  + NVL(TO_NUMBER(C.INCOME_WORK_LOCAL),0)   H_NAP_HYUN_TOTAL,     /o기납부 현 TOTALo/              
            NVL(TO_NUMBER(C.INCOME_DUE_TAX),0)    H_SIL_SO,              /o차감징수 소득세   control sum o/  
            NVL(TO_NUMBER(C.INCOME_DUE_RURAL),0)  H_SIL_NONG,            /o차감징수 농특세o/     
            NVL(TO_NUMBER(C.INCOME_DUE_LOCAL),0)  H_SIL_JOO,             /o차감징수 주민세o/     
            NVL(TO_NUMBER(C.INCOME_DUE_TAX),0)  + NVL(TO_NUMBER(C.INCOME_DUE_RURAL),0)   + NVL(TO_NUMBER(C.INCOME_DUE_LOCAL),0)    H_SIL_TOTAL,          /o차감징수 TOTALo/     
            :v_rst_validation                     RST_VALIDATION,            
            NVL(TO_NUMBER(C.WITH_STANDARD),0)     H_SPECIAL_STANDARD  ,  /o표준공제o/
            NVL(TO_NUMBER(C.PENS_0183),0)         H_SPECIAL_YK_BO     ,  /o연금보험o/
            NVL(TO_NUMBER(C.PENS_E01_AMO),0)      H_PERSON_SAVE       ,  /o연금저축o/                                                           
            0                                     H_SGONG_JOHAP       ,  /o납세조합o/            
            0                                     H_SGONG_JUNGKEN     ,  /o증권저축 parksh 20030129 LSTKDED->TLSTKDEDo/  
            NVL(B.BLDCODE, '2C')                  H_GUNMU             ,  /o근무지--널이면 본사로 : 급여마스터에서 가져가도록 수정. 2006.10.09o/                        
            0                                     H_SGONG_FOREIGNER   , /o외국인 추가공제o/
            NVL(D.BFCOMNAME,'')                   H_CORPNAME          ,  /o전근무지 상호명o/
            ''                                    H_CORPNAME1         ,  
            REPLACE(NVL(D.BFBUSNID,''),'-','')    H_CORPNO            ,  /o전근무지 사업자등록번호o/         
            ''                                    H_CORPNO1           ,      
            NVL(TO_NUMBER(D.PAY_13),0)            H_PAYSUM            ,  /o전근무지 급여합o/         
            0                                     H_PAYSUM1           ,
            NVL(TO_NUMBER(D.PAY_14),0)            H_BONSUM            ,  /o전근무지 상여합o/         
            0                                     H_BONSUM1           ,  
            NVL(TO_NUMBER(D.PAY_0181),0)          H_MEDAMT            ,  /o전근무지 국민건강보험합o/         
            0                                     H_MEDAMT1           ,  
            NVL(TO_NUMBER(D.PAY_0184),0)          H_HIREAMT           ,  /o전근무지 고용보험합o/         
            0                                     H_HIREAMT1          ,  
            NVL(TO_NUMBER(D.PAY_0183),0)          H_ANUAMT            ,  /o전근무지 국민연금합o/         
            0                                     H_ANUAMT1           ,  
            NVL(TO_NUMBER(D.PAY_15),0)            H_BCOGBONSUM        ,  /o전근무지 인정상여o/            
            NVL(TO_NUMBER(C.DEDUCT_OLD_M),0)      H_FAMI70NO          ,  /o추가공제_경로우대 70세이상_수o/          
            0                                     H_SPECADDNO         ,  /o특별추가공제(결혼.장례.이사비 공제 건수)o/  
            0                                     H_SPECADDDED        ,  /o특별추가공제(결혼.장례.이사비 공제액)o/  
            0                                     H_SHOSAMT           ,  /o본인의료비o/       
            NVL(TO_NUMBER(C.HOUSE_11_THI),0)      H_HOUSEINTAMT2      ,  /o주택자금이자상환액2o/                     
            null                                  CONFM               ,  /o확정구분o/                                
            NULL                                  ZCONF_DATE          ,  /o신고일o/                                  
            NULL                                  WT_QSCOD            ,  /o원천세키o/                                
            'I'                                   MODE_FLAG           ,  /oEAI추출구분(I,U,D)o/
            'N'                                   EAI_FLAG            ,  /oEAI추출여부o/
            NULL                                  EAI_DATE            ,  /oEAI추출시간o/
            0                                     REFERENCE1          ,  /o현금영수증사용액 o/
            A.COSTOCKTAX                          REFERENCE2          ,  /o우리사주인출과세액o/
            NVL(TO_NUMBER(C.CHILD_TAX_M),0)       REFERENCE3          ,  /o다자녀추가공제수 o/            
            0                                     REFERENCE4          ,  /o신용카드등 의료기관 사용액o/
            NVL(TO_NUMBER(C.ETC_X02),0)           REFERENCE5             /o우리사주 조합 출연공제금.o/  
       FROM PKMYSAPP A, PKMPMAS B,  YETAF_RESULT C,
            (SELECT ATT_YEAR, USERID, MAX(BFCOMNAME) BFCOMNAME,MAX(BFBUSNID) BFBUSNID,            
                    SUM(NVL(TO_NUMBER(PAY_13),0)) PAY_13, SUM(NVL(TO_NUMBER(PAY_14),0)) PAY_14, 
                    SUM(NVL(TO_NUMBER(PAY_0181),0)) PAY_0181, SUM(NVL(TO_NUMBER(PAY_0184),0)) PAY_0184, 
                    SUM(NVL(TO_NUMBER(PAY_0183),0)) PAY_0183, SUM(NVL(TO_NUMBER(PAY_15),0)) PAY_15                    
             FROM YETAF_CURRENT 
             GROUP BY ATT_YEAR, USERID) D, /o PYCDEPT E, PYCDEPT F              o/
            (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) XX,  /o 20181204 JHG 조직개편 o/  
            (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) YY   /o 20181204 JHG 조직개편 o/              
      WHERE A.EMPNO    = B.EMPNO 
        AND A.WORKYY   = C.ATT_YEAR
        AND A.EMPNO    = C.USERID
        AND A.WORKYY   = D.ATT_YEAR(+)
        AND A.EMPNO    = D.USERID(+)        
       /o AND A.ORGNUM   = E.ORGNUM(+)
        AND A.DEPTCODE = E.DEPTCODE(+)
        AND B.ORGNUM   = F.ORGNUM(+)
        AND B.JOBDEPT  = F.DEPTCODE(+)o/
        AND (XX.Deptcode = B.Deptcode AND XX.ORGNUM = B.ORGNUM)   /o 20181204 JHG 조직개편 o/  
        AND (YY.Deptcode = B.Jobdept  AND YY.ORGNUM = B.ORGNUM); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
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
H_SGONG_JOHAP,H_SGONG_JUNGKEN,H_GUNMU,H_SGONG_FOREIGNER,H_CORPNAME,H_CORPNAM\
E1,H_CORPNO,H_CORPNO1,H_PAYSUM,H_PAYSUM1,H_BONSUM,H_BONSUM1,H_MEDAMT,H_MEDAM\
T1,H_HIREAMT,H_HIREAMT1,H_ANUAMT,H_ANUAMT1,H_BCOGBONSUM,H_FAMI70NO,H_SPECADD\
NO,H_SPECADDDED,H_SHOSAMT,H_HOUSEINTAMT2,CONFM,ZCONF_DATE,WT_QSCOD,MODE_FLAG\
,EAI_FLAG,EAI_DATE,REFERENCE1,REFERENCE2,REF");
     sqlbuft((void **)0,
       "ERENCE3,REFERENCE4,REFERENCE5)select :b0 H_YEAR ,:b1 H_MONTH ,'TX' M\
DGBN ,:b2 CD_DATA ,:b3 NO_CRT_SRL ,'HRIS' IFSYS ,:b4 H_SSCODE ,(:b0||'0310')\
 H_JIGUB_YMD ,A.empno H_EMPNO ,rownum SEQLN ,:b6 IFDAT ,'000' H_UNIT ,DECODE\
(A.orgnum,:b7, case  when (XX.Tribegb='2' and YY.Tribegb='2') then YY.Fincod\
e else XX.Fincode  end ,:b8) H_DEPT ,replace(B.juminid,'-','') H_JUMIN ,deco\
de(substr(B.juminid,8,1),'5','9','6','9','1') H_ALIEN ,'2' H_JOSEO ,'1' H_RE\
GISTER ,'1' H_BUNRI ,A.korname H_NAME ,A.zipno H_POSTNO ,SUBSTRB(A.ADDR1,1,7\
0) H_ADDRESS ,C.SDATE H_KSYMD_FROM ,C.EDATE H_KSYMD_TO ,C.SDATE H_KMYMD_FROM\
 ,C.EDATE H_KMYMD_TO ,NVL(A.MPAYSUM,0) H_JOO_PAY ,NVL(A.MBONSUM,0) H_JOO_BON\
US ,NVL(A.MCOGBONSUM,0) H_JOO_INJUNG ,NVL(A.MGITASODK,0) H_JOO_TEMP1 ,0 H_JO\
O_TEMP2 ,(((NVL(A.MPAYSUM,0)+NVL(A.MBONSUM,0))+NVL(A.MCOGBONSUM,0))+NVL(A.MG\
ITASODK,0)) H_JOO_TOTAL ,0 H_FREE_OVERSEA ,0 H_FREE_NIGHT ,0 H_FREE_TECH ,NV\
L(A.MNOTAX,0) H_FREE_TEMP1 ,0 H_FREE_TEMP2 ,0 H_FREE_TEMP3 ,NVL(A.MNOTAX,0) \
H_FREE_TOTAL ,0 H_WOLJUNG ,NVL(TO_NUMBER(C.T");
     sqlbuft((void **)0,
       "AX21),0) H_BASE_PAY ,NVL(TO_NUMBER(C.TAX22),0) H_LABOR_GONG ,NVL(TO_\
NUMBER(C.TAX23),0) H_LABOR_PAY ,NVL(TO_NUMBER(C.DEDUCT_ME),0) H_BASE_ME ,NVL\
(TO_NUMBER(C.DEDUCT_PARTNER),0) H_BASE_MATE ,NVL(TO_NUMBER(C.DEDUCT_FAMILY_M\
),0) H_BASE_SUPPORT_SU ,NVL(TO_NUMBER(C.DEDUCT_FAMILY),0) H_BASE_SUPPORT_MON\
EY ,0 H_BASE_TEMP1 ,0 H_BASE_TEMP2 ,0 H_BASE_TEMP3 ,0 H_BASE_TEMP4 ,0 H_BASE\
_TEMP5 ,0 H_BASE_TEMP6 ,NVL(TO_NUMBER(C.DEDUCT_OLD_M),0) H_ADD_OLD_SU ,NVL(T\
O_NUMBER(C.DEDUCT_OLD),0) H_ADD_OLD_MONEY ,NVL(TO_NUMBER(C.DEDUCT_HANDY_M),0\
) H_ADD_JANG_SU ,NVL(TO_NUMBER(C.DEDUCT_HANDY),0) H_ADD_JANG_MONEY ,NVL(TO_N\
UMBER(C.CHILD_SIX_M),0) H_ADD_SON_SU ,0 H_ADD_SON_MONEY ,NVL(TO_NUMBER(C.DED\
UCT_WIFE),0) H_ADD_LADY ,0 H_ADD_TEMP1 ,0 H_ADD_TEMP2 ,0 H_ADD_TEMP3 ,0 H_AD\
D_TEMP4 ,0 H_ADD_TEMP5 ,0 H_ADD_TEMP6 ,0 H_SOSUGONG ,(NVL(TO_NUMBER(C.INSU_A\
01_AMO),0)+NVL(TO_NUMBER(C.INSU_A02_AMO),0)) H_SPECIAL_INSURANCE ,NVL(TO_NUM\
BER(C.MEDI_AMO),0) H_SPECIAL_MEDICAL ,NVL(TO_NUMBER(C.EDUC_AMO),0) H_SPECIAL\
_EDUCATE ,NVL(TO_NUMBER(C.HOUSE_J01),0) H_SP");
     sqlbuft((void **)0,
       "ECIAL_HOUSE ,((((NVL(TO_NUMBER(C.DONA_20_UNDER_AMO),0)+NVL(TO_NUMBER\
(C.DONA_20_OVER_AMO),0))+NVL(TO_NUMBER(C.DONA_10_TAX_AMO),0))+NVL(TO_NUMBER(\
C.DONA_40_TAX_AMO),0))+NVL(TO_NUMBER(C.DONA_41_TAX_AMO),0)) H_SPECIAL_DONATE\
 ,NVL(TO_NUMBER(C.CARD),0) H_SPECIAL_SIN ,0 H_SPECIAL_TEMP1 ,0 H_SPECIAL_TEM\
P2 ,0 H_SPECIAL_TEMP3 ,0 H_SPECIAL_TEMP4 ,0 H_SPECIAL_TEMP5 ,0 H_SPECIAL_TEM\
P6 ,NVL(TO_NUMBER(C.SUM_EXTRA),0) H_SPECIAL_TOTAL ,NVL(TO_NUMBER(C.WITH_INCO\
ME),0) H_CHAGAM ,NVL(TO_NUMBER(C.PENS_D01),0) H_PERSON_GONG ,0 H_WORKING_GON\
G ,NVL(TO_NUMBER(C.ETC_X20),0) H_JOHAB_GONG ,0 H_GONG_TEMP1 ,0 H_GONG_TEMP2 \
,0 H_GONG_TEMP3 ,0 H_GONG_TEMP4 ,0 H_GONG_TEMP5 ,0 H_GONG_TEMP6 ,NVL(TO_NUMB\
ER(C.WITH_TAXABLE),0) H_STANDARD ,NVL(TO_NUMBER(C.WITHCULATED),0) H_SANCHUL \
,NVL(TO_NUMBER(C.WITH_WAGE),0) H_SGONG_LABOR ,0 H_SGONG_ASSETS ,NVL(TO_NUMBE\
R(C.CRED_HOUSE),0) H_SGONG_HOUSE ,NVL(TO_NUMBER(C.CRED_FOREIGN),0) H_SGONG_O\
VERSEA ,0 H_SGONG_STOCK ,0 H_SGONG_TEMP1 ,0 H_SGONG_TEMP2 ,0 H_SGONG_TEMP3 ,\
0 H_SGONG_TEMP4 ,0 H_SGONG_TEMP5 ,0 H_SGONG_");
     sqlbuft((void **)0,
       "TEMP6 ,NVL(TO_NUMBER(C.SUM_TAX),0) H_SGONG_TOTAL ,0 H_SGM_PAY ,0 H_S\
GM_JOGAM ,0 H_SGM_TEMP1 ,0 H_SGM_TEMP2 ,0 H_SGM_TEMP3 ,0 H_SGM_TEMP4 ,0 H_SG\
M_TEMP5 ,0 H_SGM_TEMP6 ,0 H_SGM_TOTAL ,NVL(TO_NUMBER(C.INCOME_FIX_TAX),0) H_\
DECIDE_SO ,NVL(TO_NUMBER(C.INCOME_FIX_RURAL),0) H_DECIDE_NONG ,NVL(TO_NUMBER\
(C.INCOME_FIX_LOCAL),0) H_DECIDE_JOO ,((NVL(TO_NUMBER(C.INCOME_FIX_TAX),0)+N\
VL(TO_NUMBER(C.INCOME_FIX_RURAL),0))+NVL(TO_NUMBER(C.INCOME_FIX_LOCAL),0)) H\
_DECIDE_TOTAL ,NVL(TO_NUMBER(C.INCOME_PRE_TAX),0) H_NAP_JONG_SO ,NVL(TO_NUMB\
ER(C.INCOME_PRE_RURAL),0) H_NAP_JONG_NONG ,NVL(TO_NUMBER(C.INCOME_PRE_LOCAL)\
,0) H_NAP_JONG_JOO ,((NVL(TO_NUMBER(C.INCOME_PRE_TAX),0)+NVL(TO_NUMBER(C.INC\
OME_PRE_RURAL),0))+NVL(TO_NUMBER(C.INCOME_PRE_LOCAL),0)) H_NAP_JONG_TOTAL ,N\
VL(TO_NUMBER(C.INCOME_WORK_TAX),0) H_NAP_HYUN_SO ,NVL(TO_NUMBER(C.INCOME_WOR\
K_RURAL),0) H_NAP_HYUN_NONG ,NVL(TO_NUMBER(C.INCOME_WORK_LOCAL),0) H_NAP_HYU\
N_JOO ,((NVL(TO_NUMBER(C.INCOME_WORK_TAX),0)+NVL(TO_NUMBER(C.INCOME_WORK_RUR\
AL),0))+NVL(TO_NUMBER(C.INCOME_WORK_LOCAL),0");
     sqlbuft((void **)0,
       ")) H_NAP_HYUN_TOTAL ,NVL(TO_NUMBER(C.INCOME_DUE_TAX),0) H_SIL_SO ,NV\
L(TO_NUMBER(C.INCOME_DUE_RURAL),0) H_SIL_NONG ,NVL(TO_NUMBER(C.INCOME_DUE_LO\
CAL),0) H_SIL_JOO ,((NVL(TO_NUMBER(C.INCOME_DUE_TAX),0)+NVL(TO_NUMBER(C.INCO\
ME_DUE_RURAL),0))+NVL(TO_NUMBER(C.INCOME_DUE_LOCAL),0)) H_SIL_TOTAL ,:b9 RST\
_VALIDATION ,NVL(TO_NUMBER(C.WITH_STANDARD),0) H_SPECIAL_STANDARD ,NVL(TO_NU\
MBER(C.PENS_0183),0) H_SPECIAL_YK_BO ,NVL(TO_NUMBER(C.PENS_E01_AMO),0) H_PER\
SON_SAVE ,0 H_SGONG_JOHAP ,0 H_SGONG_JUNGKEN ,NVL(B.BLDCODE,'2C') H_GUNMU ,0\
 H_SGONG_FOREIGNER ,NVL(D.BFCOMNAME,'') H_CORPNAME ,'' H_CORPNAME1 ,REPLACE(\
NVL(D.BFBUSNID,''),'-','') H_CORPNO ,'' H_CORPNO1 ,NVL(TO_NUMBER(D.PAY_13),0\
) H_PAYSUM ,0 H_PAYSUM1 ,NVL(TO_NUMBER(D.PAY_14),0) H_BONSUM ,0 H_BONSUM1 ,N\
VL(TO_NUMBER(D.PAY_0181),0) H_MEDAMT ,0 H_MEDAMT1 ,NVL(TO_NUMBER(D.PAY_0184)\
,0) H_HIREAMT ,0 H_HIREAMT1 ,NVL(TO_NUMBER(D.PAY_0183),0) H_ANUAMT ,0 H_ANUA\
MT1 ,NVL(TO_NUMBER(D.PAY_15),0) H_BCOGBONSUM ,NVL(TO_NUMBER(C.DEDUCT_OLD_M),\
0) H_FAMI70NO ,0 H_SPECADDNO ,0 H_SPECADDDED");
     sqlbuft((void **)0,
       " ,0 H_SHOSAMT ,NVL(TO_NUMBER(C.HOUSE_11_THI),0) H_HOUSEINTAMT2 ,null\
  CONFM ,null  ZCONF_DATE ,null  WT_QSCOD ,'I' MODE_FLAG ,'N' EAI_FLAG ,null\
  EAI_DATE ,0 REFERENCE1 ,A.COSTOCKTAX REFERENCE2 ,NVL(TO_NUMBER(C.CHILD_TAX\
_M),0) REFERENCE3 ,0 REFERENCE4 ,NVL(TO_NUMBER(C.ETC_X02),0) REFERENCE5  fro\
m PKMYSAPP A ,PKMPMAS B ,YETAF_RESULT C ,(select ATT_YEAR ,USERID ,max(BFCOM\
NAME) BFCOMNAME ,max(BFBUSNID) BFBUSNID ,sum(NVL(TO_NUMBER(PAY_13),0)) PAY_1\
3 ,sum(NVL(TO_NUMBER(PAY_14),0)) PAY_14 ,sum(NVL(TO_NUMBER(PAY_0181),0)) PAY\
_0181 ,sum(NVL(TO_NUMBER(PAY_0184),0)) PAY_0184 ,sum(NVL(TO_NUMBER(PAY_0183)\
,0)) PAY_0183 ,sum(NVL(TO_NUMBER(PAY_15),0)) PAY_15  from YETAF_CURRENT  gro\
up by ATT_YEAR,USERID) D ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb,\
1,1) Tribegb  from Pycdept ) XX ,(select Orgnum ,Deptcode ,Fincode ,Substr(T\
ribegb,1,1) Tribegb  from Pycdept ) YY where ((((((A.EMPNO=B.EMPNO and A.WOR\
KYY=C.ATT_YEAR) and A.EMPNO=C.USERID) and A.WORKYY=D.ATT_YEAR(+)) and A.EMPN\
O=D.USERID(+)) and (XX.Deptcode=B.Deptcode a");
     sqlstm.stmt = "nd XX.ORGNUM=B.ORGNUM)) and (YY.Deptcode=B.Jobdept and \
YY.ORGNUM=B.ORGNUM))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
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
     sqlstm.sqhstv[5] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[5] = (unsigned long )5;
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
     sqlstm.sqhstv[7] = (unsigned char  *)v_orgnum;
     sqlstm.sqhstl[7] = (unsigned long )4;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)v_deptcode;
     sqlstm.sqhstl[8] = (unsigned long )6;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)v_rst_validation;
     sqlstm.sqhstl[9] = (unsigned long )2;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
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

  /* 20181204 JHG 조직개편 */        

     if  (sqlca.sqlcode != 0) 
     {     /* 에러이면 */
          sprintf(log_buff, "ORA-%05d - Insert TEMP EAI_WORKTAX Error--------\n", sqlca.sqlcode);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   
          /* EXEC SQL ROLLBACK WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )110;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(-1);   
     } 
     else 
     {      /* 에러가 아니면 */
          v_cnt_line = sqlca.sqlerrd[2];
          WriteLog("Insert TEMP EAI_WORKTAX Success\n");
          sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   
          /* EXEC SQL COMMIT WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )125;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     }     
     
     /* EXEC SQL                
     SELECT SUM(NVL(YINTAX,0)), SUM(NVL(YJUTAX,0)),SUM(NVL(YNONGTAX,0)), SUM(NVL(yintax,0))
       INTO :v_amtin, :v_amtju, :v_amtnong, :v_amttot
       FROM PKMYSMAS A ,PKMPMAS B
      WHERE A.EMPNO = B.EMPNO; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(NVL(YINTAX,0)) ,sum(NVL(YJUTAX,0)) ,sum(NVL(\
YNONGTAX,0)) ,sum(NVL(yintax,0)) into :b0,:b1,:b2,:b3  from PKMYSMAS A ,PKMPM\
AS B where A.EMPNO=B.EMPNO";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )140;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_amtin;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_amtju;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_amtnong;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_amttot;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
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

  
     /* AND A.WORKYY  = SUBSTR(:v_paydate, 1,4)  년도 비교작업 삭제 .2007.02*/
                 
     if  (sqlca.sqlcode != 0) 
     {     /* 에러이면 */
           v_cnt_line = 0;
           sprintf(log_buff, "ORA-%05d - Fetch 통계_Error\n", sqlca.sqlcode);
           WriteLog(log_buff);
           Write_batlog(seqno++, log_buff);   
           /* EXEC SQL ROLLBACK WORK; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 10;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )171;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
           return(-1);
     }          
     
     WriteLog("Insert HAIS EAI_WORKTAX Success\n");
     sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);   
     /* EXEC SQL COMMIT WORK; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
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


     
     WriteLog("< WriteEAI_WORKTAX Ending >-------------------------\n");
           
     return(0);  
}

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 Write_batlog()  ===================*/
int  Write_batlog(int seqno, char *message)
{ 
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )201;
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
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )242;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}


/*int Check_date()
{
     EXEC SQL
     SELECT  nvl(PAYDATE,'000000'), SUBSTR(PAYDATE,1,4),  SUBSTR(PAYDATE, 5, 2)
     INTO  :v_yyyymm, :v_yyyy, :v_mm
     FROM  PKHPHIS
           WHERE   PAYDATE = :v_paydate
       AND  ROWNUM = 1;
     
     if ( sqlca.sqlcode == -1403 )
     {  
       return(-1);
     }
     if ( sqlca.sqlcode != 0 )
     {  
       return(1);
     }              
                  return(0);
} */
