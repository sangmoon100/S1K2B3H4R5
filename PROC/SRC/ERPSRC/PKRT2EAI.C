
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
    "pkrt2eai.pc"
};


static unsigned int sqlctx = 159507;


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
5,0,0,1,96,0,4,211,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,118,0,4,225,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
55,0,0,3,6290,0,3,301,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
110,0,0,4,0,0,31,658,0,0,0,0,0,1,0,
125,0,0,5,0,0,29,668,0,0,0,0,0,1,0,
140,0,0,6,232,0,4,672,0,0,5,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
175,0,0,7,0,0,31,688,0,0,0,0,0,1,0,
190,0,0,8,0,0,29,697,0,0,0,0,0,1,0,
205,0,0,9,147,0,4,705,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
236,0,0,10,50,0,3,728,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
277,0,0,11,0,0,29,738,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : PKRT2EAI(INSA->EAI Interface Program)
 PROGRM-Decription : 퇴직테이블을 읽어서 EAI Interface 테이블에 Insert(퇴직자)  (EAI_WORKTAX)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직자 연말정산(근로소득) 
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2005.07.                                    

근로소득(EAI_WORKTAX)   : /var/mte/adapter/conf/script/PIM/PIM.PIMFI1060B.SND.sh

Update Contents
   Version    date(yy.mm.dd)     programmer      description
   1.00       2005.07.           dsa2000         SAP도입에 따른 개발(pkmp2erprt.pc를 토대로)
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

     char    v_dt_create[9];        /* 생성일자 */
     char    v_dt_createhms[15];    /* 생성일시 */
     char    v_cd_data[4] = "D51";  /* Employee Data Code */
     int     v_no_crt_srl = 0;      /* 생성 일련번호 */
     char    v_sscode[3+1] = "A15"; /* 소득관리코드(퇴직정산) */
     char    v_ym_acct[7];          /* 회계년월 */
     int     v_cnt_line = 0;        /* Line건수 */ 
     char    v_ph_proc[2] = "A";    /* 처리단계 */
     char    v_st_proc[2] = "P";    /* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
     char    v_cl_data_use[2] = "A";/* Data 활용구분 */
     char    v_id_crt_user[5];      /* 생성 UserID */
     char    v_paydate[7];          /* 지급년월 */
     char    v_yyyymm[7];           /* 지급년월 */
     char    v_yyyy[5];             /* 지급년 */
     char    v_mm[3];               /* 지급월 */
     double  v_amttot = 0;          /* 과세표준금액총액   */
     double  v_amtin  = 0;          /* 결정소득세총액   */
     double  v_amtju  = 0;          /* 결정주민세총액   */
     double  v_amtnong  = 0;        /* 결정주민세총액   */
     char    v_rst_validation[2] = "A";
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
     if  (argc != 5) 
     {    /* pkrt2eai 200507 D006 pkrt2eai 2005073100000*/ 
          printf("[Usage] : pkrt2eai 1.지급년월(YYYYMM) 2.작업자 3.progid 4.시작시간\n");
          fclose(fp);
          exit(1);
     }
     
     sprintf(v_paydate,     argv[1]);         /* 지급년월   */     
     sprintf(v_yyyy,"%4.4s",v_paydate);       /* 지급년     */     
     sprintf(v_mm  ,"%2s",  v_paydate+4);     /* 지급월     */         
     sprintf(v_id_crt_user, argv[2]);         /* 작업자사번 */
      
     hinsa_log_print(0,"ERP 인터페이스 시작...");                
     hinsa_db_connect();  /*DB Connect 실시..*/
                  
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[2]);
     strcpy(log_progid,   argv[3]);
     strcpy(log_rundate,  argv[4]); 
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
                   
     InitVariables();   /* 변수 초기화 */
     Initialize();    /* 초기화 루틴 */
     CreateLog();
      
     sprintf(buff, "프로그램명 : %s\n", argv[0]);
     WriteLog(buff);
     sprintf(buff, "지급년월  : %s\n", argv[1]);
     WriteLog(buff);         
            
     if (Check_date() != 0) 
     {
          sprintf(log_buff, "지급년월에 해당하는 자료가 없습니다. %s\n", v_paydate);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   
          fclose(fp);
          printf("지급년월에 해당하는 자료가 없습니다.\n");
          exit(1);
     }         
           
     if (WriteControl(0) == -1) 
     {   /* 초기값 세팅 */
        fclose(fp);
        exit(1);
     }
      
     if (WriteEmployee() == -1)
     {
          WriteControl(2); /* 비정상종료 */
          Write_batlog(seqno++, "ERROR" );   
          error_quit("ERROR ====== [작업 실패] =====\n");    
     }        
     else
     {
          WriteControl(1);  /* 정상종료 */ 
          Write_batlog(seqno++, "OK ====== [작업 완료] =====\n");   
          hinsa_exit(0,"OK ====== [작업 완료] =====\n");    
     }   
      
            
     WriteLog("< Program End......................................... >\n");
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
      
     if (v_cnt_line == 0)
     {
          printf("실패!!! \n");
          Write_batlog(seqno++, "실패");   
     }   
     else
     {
          printf("OK!!!\n");
          Write_batlog(seqno++, "OK 성공 ");   
      }
}


void CreateLog()
{
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/log/ERPlog/");
     
     /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%spkrt2eai%s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl);
     
     /* 로그파일 오픈 */
     fp = fopen(logfile_fullname, "w+");
      
     if (fp == NULL) {
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


      
     if (sqlca.sqlcode != 0)
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
     
     if      (gubun == 1) sprintf(v_st_proc, "N");
     else if (gubun == 2) sprintf(v_st_proc, "A");
      
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
      
     if      (gubun == 1) printf("OK Program End  ......................................... >\n");
     else if (gubun == 2) printf("Fail Program End......................................... >\n");
      
     return(0);       
}

int  WriteEmployee(void)
{
     WriteLog("< Write EAI_RETIRETAX Starting >-------------------------------\n");
     sprintf(buff, "v_dt_create  : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data    : (%s)\n", v_cd_data);
     WriteLog(buff);
     sprintf(buff, "v_no_crt_srl : (%d)\n", v_no_crt_srl);
     WriteLog(buff);
     sprintf(buff, "v_rst_validation : (%s)\n", v_rst_validation);
     WriteLog(buff);
     /*
     printf("v_yyyy           : %s \n", v_yyyy);
     printf("v_mm             : %s \n", v_mm);
     printf("v_cd_data        : %s \n", v_cd_data);
     printf("v_no_crt_srl     : %d \n", v_no_crt_srl);
     printf("v_dt_createhms   : %s \n", v_dt_createhms);
     printf("v_sscode         : %s \n", v_sscode);
     printf("v_paydate        : %s \n", v_paydate);
     printf("v_rst_validation : %s \n", v_rst_validation);
     */
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
            H_CORPNAME          , /o종근무지 자료 2004년 귀속  dsa2000  2005.02.addo/
            H_CORPNO            , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/         
            H_PAYSUM            , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/         
            H_BONSUM            , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/         
            H_MEDAMT            , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/         
            H_HIREAMT           , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/         
            H_ANUAMT            , /o종근무지 자료 2004년 귀속  dsa2000  2005.02. addo/                  
          /oH_CORPNAME1         ,   종종근무지 자료
            H_CORPNO1           ,
            H_PAYSUM1           ,
            H_BONSUM1           ,
            H_MEDAMT1          ,
            H_HIREAMT1          ,
            H_ANUAMT1           , 
            H_BCOGBONSUM        , /o종전근무지 인정상여 총액 o/
            H_FAMI70NO          , /o2004년 귀속  dsa2000  2005.02. addo/         
            H_SPECADDNO         , /o2004년 귀속  dsa2000  2005.02. addo/         
            H_SPECADDDED        , /o2004년 귀속  dsa2000  2005.02. addo/         
            H_SHOSAMT           , /o2004년 귀속  dsa2000  2005.02. addo/         
            H_HOUSEINTAMT2      , /o2004년 귀속  dsa2000  2005.02. addo/        
            CONFM               ,
            ZCONF_DATE          ,
            WT_QSCOD            ,
            MODE_FLAG           ,
            EAI_FLAG            ,
            EAI_DATE            
            )            
     SELECT  
           :v_yyyy                     H_YEAR,                 /o신고년o/        
           :v_mm                       H_MONTH,                /o신고월o/   
            'TX'                       MDGBN,                  /o모듈구분o/
           :v_cd_data                  CD_DATA,                /o자료구분 'D51'o/ 
           :v_no_crt_srl               NO_CRT_SRL,             /o순서o/   
            'HRIS'                     IFSYS,                  /o원천구분o/
           :v_sscode                   H_SSCODE,               /o소득관리코드o/        
            A.SUBDATE                  H_JIGUB_YMD,            /o지급일o//odsa2000 2004.04.06. 회의결과에 따라 v_paydate  => A.subdate로 변경o/
            A.empno                    H_EMPNO,               /o사번o/   
            rownum                     SEQLN,                  /o라인번호o/
           :v_dt_createhms             IFDAT,                  /o생성일시 o/
            '000'                      H_UNIT,                 /o사업장o/
         /o   C.FINCODE                  H_DEPT,                 부서o/   
         /o   DECODE(SUBSTR(D.TRIBEGB,1,1),'2',D.FINCODE, C.FINCODE ) H_DEPT,  /o 이상용 20181113 조직개편 o/         
            Case When (XX.Tribegb='2' And YY.Tribegb='2') Then YY.Fincode Else XX.Fincode End  H_DEPT, /o 20181204 JHG 조직개편 o/ 
            replace(B.juminid,'-','')  H_JUMIN,                /o주민등록번호o/
            decode(substr(B.juminid,8,1),'5','9','6','9','1') H_ALIEN, /o내외국인 구분 : 외국인(9)o/ 
            '2'                        H_JOSEO,                /o지급조서제출구분o/ 
            '1'                        H_REGISTER,             /o거주자 구분o/   
            '1'                        H_BUNRI,                /o분리과세구분o/ 
            A.korname                  H_NAME,                 /o성 명o/   
            Y.zipno                    H_POSTNO,               /o우편번호o/   
            SUBSTRB(Y.ADDR,1,70)       H_ADDRESS,              /o주소o/   
            NVL(Y.YSFRDATE, :v_yyyy||'0101') H_KSYMD_FROM,     /o귀속일_fromo/   
            NVL(Y.YSTODATE, A.RETDATE)       H_KSYMD_TO,       /o귀속일_too/   
            NVL(Y.YSFRDATE, :v_yyyy||'0101') H_KMYMD_FROM,     /o감면일_fromo/             
            NVL(Y.YSTODATE, A.RETDATE)       H_KMYMD_TO,       /o감면일_too/   
            /o 2014.11.11 하은영 주사업장급여에 비과세금액을 빼게 되어있었음, 주급여에서는 과세총액그대로 표시되어져야함           
            NVL(MPAYSUM, 0) +
            (NVL(NOTAX,0)-NVL(NOTAXEXCEPT,0)) H_JOO_PAY,         주사업장-급여 인정상여 및  o/
            NVL(MPAYSUM, 0)            H_JOO_PAY,              /o주사업장-급여 인정상여 및  o/
            NVL(MBONSUM, 0)            H_JOO_BONUS,            /o주사업장-상여o/ 
            NVL(MCOGBONSUM, 0)         H_JOO_INJUNG,           /o주사업장-인정상여o/  
            0                          H_JOO_TEMP1,            /o주사업장-temp1o/ 
            0                          H_JOO_TEMP2,            /o주사업장-temp2o/ 
            /o 2014.11.11 하은영 주사업장급여에 비과세금액을 빼게 되어있었음, 주급여에서는 과세총액그대로 표시되어져야함           
            NVL(MPAYSUM,0) + NVL(MBONSUM,0) + NVL(MCOGBONSUM,0)+
            (NVL(NOTAX,0)-NVL(NOTAXEXCEPT,0)) H_JOO_TOTAL,          주사업장-totalo/ 
            NVL(MPAYSUM,0) + NVL(MBONSUM,0) + NVL(MCOGBONSUM,0) H_JOO_TOTAL,     /o주사업장-totalo/ 
            0                          H_FREE_OVERSEA,
            0                          H_FREE_NIGHT,           /o비과세 야간근로o/ 
            0                          H_FREE_TECH,            /o비과세 기술o/   
            NVL(MNOTAX,0)              H_FREE_TEMP1,           /o비과세 temp1o/   
            0                          H_FREE_TEMP2,           /o비과세 temp2o/   
            0                          H_FREE_TEMP3,           /o비과세 temp3o/   
            NVL(NOTAX,0)               H_FREE_TOTAL,           /o비과세 계o/   
            NVL(LASTMONPAY,0)          H_WOLJUNG,              /o월정급여액o/   
            NVL(TAXGROSS,0)            H_BASE_PAY,             /o과세대상급여o/ 
            NVL(LABORDED,0)            H_LABOR_GONG,           /o근로소득공제o/ 
            NVL(LABORAMT,0)            H_LABOR_PAY,            /o근로소득급여o/ 
            NVL(SELFDED,0)             H_BASE_ME,              /o기본 본인o/   
            NVL(MATEDED,0)             H_BASE_MATE,            /o기본 배우자o/   
          /oNVL(FAMIDED,0)/1000000     H_BASE_SUPPORT_SU,        기본 부양가족 수o/
            NVL(FAMILYNO,0)            H_BASE_SUPPORT_SU,      /o기본 부양가족 수 2009년o/
            NVL(FAMIDED,0)             H_BASE_SUPPORT_MONEY,   /o기본 부양가족 액o/ 
            0                          H_BASE_TEMP1,           /o기본 TEMP1o/   
            0                          H_BASE_TEMP2,           /o기본 TEMP2o/   
            0                          H_BASE_TEMP3,           /o기본 TEMP3o/   
            0                          H_BASE_TEMP4,           /o기본 TEMP4o/   
            0                          H_BASE_TEMP5,           /o기본 TEMP5o/   
            0                          H_BASE_TEMP6,           /o기본 TEMP6o/   
          /o(FAMI65NO+FAMI70NO)        H_ADD_OLD_SU,             추가 경로우대 수o/   
            FAMI70NO                   H_ADD_OLD_SU,           /o추가 경로우대 수 : 65세 경로우대 폐지.2009년.o/   
            NVL(OLDDED,0)              H_ADD_OLD_MONEY,        /o추가 경로우대 금액o/ 
          /oNVL(OBSDED,0)/2000000      H_ADD_JANG_SU,            추가 장애자 수o/ 
            Nvl(OBSTACLENO,0)          H_ADD_JANG_SU,          /o추가 장애자 수 2009년o/ 
            NVL(OBSDED,0)              H_ADD_JANG_MONEY,       /o추가 장애자 금액o/ 
            NVL(CHILDNO,0)             H_ADD_SON_SU,           /o추가 자녀 수o/        
            NVL(CHILDDED,0)            H_ADD_SON_MONEY,        /o추가 자녀 금액o/ 
            NVL(WOMANDED,0)            H_ADD_LADY,             /o추가 부녀자공제o/ 
            0                          H_ADD_TEMP1,            /o추가 TEMP1o/   
            0                          H_ADD_TEMP2,            /o추가 TEMP2o/   
            0                          H_ADD_TEMP3,            /o추가 TEMP3o/   
            0                          H_ADD_TEMP4,            /o추가 TEMP4o/   
            0                          H_ADD_TEMP5,            /o추가 TEMP5o/   
            0                          H_ADD_TEMP6,            /o추가 TEMP6o/   
            NVL(FEWDED, 0)             H_SOSUGONG,             /o소수공제액o/   
            NVL(INSDED ,0)             H_SPECIAL_INSURANCE,    /o특별 보험료o/   
            NVL(HOSDED, 0)             H_SPECIAL_MEDICAL,      /o특별 의료비o/   
            NVL(Y.EDUDED, 0)           H_SPECIAL_EDUCATE,      /o특별 교육비o/   
            NVL(HOUSEDED,0)            H_SPECIAL_HOUSE,        /o특별 주택자금o/ 
            NVL(GIVEDED,0)             H_SPECIAL_DONATE,       /o특별 기부금o/   
            NVL(CREDITDED, 0)          H_SPECIAL_SIN,          /o특별 신용카드o/ 
            0                          H_SPECIAL_TEMP1,        /o특별 TEMP1o/   
            0                          H_SPECIAL_TEMP2,        /o특별 TEMP2o/   
            0                          H_SPECIAL_TEMP3,        /o특별 TEMP3o/   
            0                          H_SPECIAL_TEMP4,        /o특별 TEMP4o/   
            0                          H_SPECIAL_TEMP5,        /o특별 TEMP5o/   
            0                          H_SPECIAL_TEMP6,        /o특별 TEMP6o/   
            NVL(SPECIALDED,0)          H_SPECIAL_TOTAL,        /o특별 계o/   
            0                          H_CHAGAM,               /o차감소득o/   
            NVL(PENDED, 0)             H_PERSON_GONG,          /o개인연금 소득o/ 
            0                          H_WORKING_GONG,         /o현장공제o/   
            nvl(investded,0)           H_JOHAB_GONG,           /o조합출자공제o/ 
            0                          H_GONG_TEMP1,           /o공제 TEMP1o/   
            0                          H_GONG_TEMP2,           /o공제 TEMP2o/   
            0                          H_GONG_TEMP3,           /o공제 TEMP3o/   
            0                          H_GONG_TEMP4,           /o공제 TEMP4o/   
            0                          H_GONG_TEMP5,           /o공제 TEMP5o/   
            0                          H_GONG_TEMP6,           /o공제 TEMP6o/   
            NVL(TAXLEVEL ,0)           H_STANDARD,             /o과세표준o/   
            NVL(CALCTAX ,0)            H_SANCHUL,              /o산출세액o/   
            NVL(INCOMTDED,0)           H_SGONG_LABOR,          /o세액공제 근로소득o/ 
            NVL(PROPDED, 0)            H_SGONG_ASSETS,         /o세액공제 재형저축o/ 
            NVL(HLOANDED, 0)           H_SGONG_HOUSE,          /o세액공제 주택차입o/ 
            NVL(FORIDED, 0)            H_SGONG_OVERSEA,        /o세액공제 외국납부o/ 
            NVL(STKDED , 0)            H_SGONG_STOCK,          /o세액공제 주식저축o/ 
            0                          H_SGONG_TEMP1,          /o세액공제 TEMP1o/ 
            0                          H_SGONG_TEMP2,          /o세액공제 TEMP2o/ 
            0                          H_SGONG_TEMP3,          /o세액공제 TEMP3o/ 
            nvl(Y.polided,0)           H_SGONG_TEMP4,          /o세액공제 정치자금 dsa2000  2004 add o/
            0                          H_SGONG_TEMP5,          /o세액공제 TEMP5o/ 
            0                          H_SGONG_TEMP6,          /o세액공제 TEMP6o/ 
            NVL(TDEDSUM,0)             H_SGONG_TOTAL,          /o세액공제 TOTALo/ 
            0                          H_SGM_PAY,              /o세액감면 소득세법o/ 
            0                          H_SGM_JOGAM,            /o세액감면 조감법o/ 
            0                          H_SGM_TEMP1,            /o세액감면 TEMP1o/ 
            0                          H_SGM_TEMP2,            /o세액감면 TEMP2o/ 
            0                          H_SGM_TEMP3,            /o세액감면 TEMP3o/ 
            0                          H_SGM_TEMP4,            /o세액감면 TEMP4o/ 
            0                          H_SGM_TEMP5,            /o세액감면 TEMP5o/ 
            0                          H_SGM_TEMP6,            /o세액감면 TEMP6o/ 
            0                          H_SGM_TOTAL,            /o세액감면 TOTALo/ 
            NVL(DINTAX,0)              H_DECIDE_SO,            /o결정 소득액o/   
            NVL(DNONGTAX, 0)           H_DECIDE_NONG,          /o결정 농특세o/   
            NVL(DJUTAX,0)              H_DECIDE_JOO,           /o결정 주민세o/   
            NVL(DINTAX,0) + NVL(DJUTAX,0) + nvl(DNONGTAX,0)     H_DECIDE_TOTAL,       /oTOTALo/   
            NVL(BINTAX,0)              H_NAP_JONG_SO,          /o기납부 종 소득세o/ 
            NVL(BNONGTAX,0)            H_NAP_JONG_NONG,        /o기납부 종 농특세o/ 
            NVL(BJUTAX,0)              H_NAP_JONG_JOO,         /o기납부 종 주민세o/   
            NVL(BINTAX,0) + NVL(BJUTAX, 0) + NVL(BNONGTAX, 0)   H_NAP_JONG_TOTAL,     /o기납부 종 TOTALo/ 
            NVL(MINTAX,0)              H_NAP_HYUN_SO,          /o기납부 현 소득세o/ 
            NVL(MNONGTAX,0)            H_NAP_HYUN_NONG,        /o기납부 현 농특세o/ 
            NVL(MJUTAX ,0)             H_NAP_HYUN_JOO,         /o기납부 현 주민세o/ 
            NVL(MINTAX,0) + NVL(MJUTAX, 0) + NVL(MNONGTAX, 0)   H_NAP_HYUN_TOTAL,     /o기납부 현 TOTALo/ 
            /o2013.05.06.hjku. 2013 퇴직정산 반영으로 인한 오류 수정o/
            NVL(Y.YINTAX ,0)             H_SIL_SO,               /o차감징수 소득세   control sum o/ 
            NVL(Y.YNONGTAX, 0)           H_SIL_NONG,             /o차감징수 농특세o/    
            NVL(Y.YJUTAX ,0)             H_SIL_JOO,              /o차감징수 주민세o/    
            NVL(Y.YINTAX, 0)+ NVL(Y.YJUTAX,0) + NVL(Y.YNONGTAX,0)     H_SIL_TOTAL,          /o차감징수 TOTALo/     
           :v_rst_validation           RST_VALIDATION    ,
            NVL(STANDDED,0)            H_SPECIAL_STANDARD  ,   /o표준공제o/
            NVL(ANUDED,0)              H_SPECIAL_YK_BO     ,   /o연금보험o/
            NVL(NPENDED,0)             H_PERSON_SAVE       ,   /o연금저축o/
            0                          H_SGONG_JOHAP       ,   /o납세조합o/
            NVL(LSTKDED,0)             H_SGONG_JUNGKEN     ,   /o증권저축o/ 
            NVL(B.BLDCODE, '2C')       H_GUNMU             ,   /o근무지--널이면 본사로 : 급여마스터에서 가져가도록 수정. 2006.10.09o/
            NVL(FOREIGNDED,0)          H_SGONG_FOREIGNER   ,   /oDsa2000 2004.01.29. 세법변경에 따른 칼럼 추가.(외국인 추가공제)o/
            NVL(BCORPNAME,'')          H_CORPNAME          ,   /o2004년 귀속  dsa2000  2005.02.addo/
            NVL(BCORPNO,'')            H_CORPNO            ,   /o2004년 귀속  dsa2000  2005.02. addo/         
            NVL(BPAYSUM,0)             H_PAYSUM            ,   /o2004년 귀속  dsa2000  2005.02. addo/         
            NVL(BBONSUM,0)             H_BONSUM            ,   /o2004년 귀속  dsa2000  2005.02. addo/         
            NVL(BMEDAMT,0)             H_MEDAMT            ,   /o2004년 귀속  dsa2000  2005.02. addo/         
            NVL(BHIREAMT,0)            H_HIREAMT           ,   /o2004년 귀속  dsa2000  2005.02. addo/         
            NVL(BANUAMT,0)             H_ANUAMT            ,   /o2004년 귀속  dsa2000  2005.02. addo/                  
            NVL(FAMI70NO,0)            H_FAMI70NO          ,   /o추가공제_경로우대 70세이상_수o/          
            NVL(SPECADDNO,0)           H_SPECADDNO         ,   /o특별추가공제(결혼.장례.이사비 공제 건수)o/  
            NVL(SPECADDDED,0)          H_SPECADDDED        ,   /o특별추가공제(결혼.장례.이사비 공제액)o/  
            NVL(SHOSAMT,0)             H_SHOSAMT           ,   /o본인의료비o/       
            NVL(HOUSEINTAMT2,0)        H_HOUSEINTAMT2      ,   /o주택자금이자상환액2o/         
            null                       CONFM               ,   /o확정구분o/                                
            null                       ZCONF_DATE          ,   /o신고일o/                                  
            null                       WT_QSCOD            ,   /o원천세키o/                                
            'I'                        MODE_FLAG           ,   /oEAI추출구분(I,U,D)o/
            'N'                        EAI_FLAG            ,   /oEAI추출여부o/
            null                       EAI_DATE                /oEAI추출시간o/
       FROM PKHRTHIS A, PKHRYHIS Y, PKMPMAS B, 
         /o   PYCDEPT C, PYCDEPT D 20181204 JHG 조직개편 o/
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) XX,  /o 20181204 JHG 조직개편 o/  
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) YY   /o 20181204 JHG 조직개편 o/ 
      WHERE A.EMPNO   = B.EMPNO
        and A.empno   = Y.empno
        and A.subdate like :v_paydate||'%' 
		    and A.retdate = Y.retdate /o2013.03.06. hjku. 퇴직근로정산이나 퇴직정산이 두개이상인 대상자 전송오류 발생하여 수정 정문선Mo/
/o		and a.paysum <> 280150
		and a.paysum <> 434751     임시 주석 KTH   o/
       /o AND A.ORGNUM   = C.ORGNUM
        AND A.DEPTCODE = C.DEPTCODE         
        AND B.ORGNUM   = D.ORGNUM
        AND B.JOBDEPT  = D.DEPTCODE  20181204 JHG 조직개편  o/
        AND (XX.Deptcode = B.Deptcode AND XX.ORGNUM = B.ORGNUM)  /o 20181204 JHG 조직개편 o/  
        AND (YY.Deptcode = B.Jobdept  AND YY.ORGNUM = B.ORGNUM)  /o 20181204 JHG 조직개편 o/
        AND TAXGROSS  <>  0; */ 

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
H_SGONG_JOHAP,H_SGONG_JUNGKEN,H_GUNMU,H_SGONG_FOREIGNER,H_CORPNAME,H_CORPNO,\
H_PAYSUM,H_BONSUM,H_MEDAMT,H_HIREAMT,H_ANUAMT,H_FAMI70NO,H_SPECADDNO,H_SPECA\
DDDED,H_SHOSAMT,H_HOUSEINTAMT2,CONFM,ZCONF_DATE,WT_QSCOD,MODE_FLAG,EAI_FLAG,\
EAI_DATE)select :b0 H_YEAR ,:b1 H_MONTH ,'TX' MDGBN ,:b2 CD_DATA ,:b3 NO_CRT\
_SRL ,'HRIS' IFSYS ,:b4 H_SSCODE ,A.SUBDATE ");
     sqlbuft((void **)0,
       "H_JIGUB_YMD ,A.empno H_EMPNO ,rownum SEQLN ,:b5 IFDAT ,'000' H_UNIT \
, case  when (XX.Tribegb='2' and YY.Tribegb='2') then YY.Fincode else XX.Fin\
code  end  H_DEPT ,replace(B.juminid,'-','') H_JUMIN ,decode(substr(B.jumini\
d,8,1),'5','9','6','9','1') H_ALIEN ,'2' H_JOSEO ,'1' H_REGISTER ,'1' H_BUNR\
I ,A.korname H_NAME ,Y.zipno H_POSTNO ,SUBSTRB(Y.ADDR,1,70) H_ADDRESS ,NVL(Y\
.YSFRDATE,(:b0||'0101')) H_KSYMD_FROM ,NVL(Y.YSTODATE,A.RETDATE) H_KSYMD_TO \
,NVL(Y.YSFRDATE,(:b0||'0101')) H_KMYMD_FROM ,NVL(Y.YSTODATE,A.RETDATE) H_KMY\
MD_TO ,NVL(MPAYSUM,0) H_JOO_PAY ,NVL(MBONSUM,0) H_JOO_BONUS ,NVL(MCOGBONSUM,\
0) H_JOO_INJUNG ,0 H_JOO_TEMP1 ,0 H_JOO_TEMP2 ,((NVL(MPAYSUM,0)+NVL(MBONSUM,\
0))+NVL(MCOGBONSUM,0)) H_JOO_TOTAL ,0 H_FREE_OVERSEA ,0 H_FREE_NIGHT ,0 H_FR\
EE_TECH ,NVL(MNOTAX,0) H_FREE_TEMP1 ,0 H_FREE_TEMP2 ,0 H_FREE_TEMP3 ,NVL(NOT\
AX,0) H_FREE_TOTAL ,NVL(LASTMONPAY,0) H_WOLJUNG ,NVL(TAXGROSS,0) H_BASE_PAY \
,NVL(LABORDED,0) H_LABOR_GONG ,NVL(LABORAMT,0) H_LABOR_PAY ,NVL(SELFDED,0) H\
_BASE_ME ,NVL(MATEDED,0) H_BASE_MATE ,NVL(FA");
     sqlbuft((void **)0,
       "MILYNO,0) H_BASE_SUPPORT_SU ,NVL(FAMIDED,0) H_BASE_SUPPORT_MONEY ,0 \
H_BASE_TEMP1 ,0 H_BASE_TEMP2 ,0 H_BASE_TEMP3 ,0 H_BASE_TEMP4 ,0 H_BASE_TEMP5\
 ,0 H_BASE_TEMP6 ,FAMI70NO H_ADD_OLD_SU ,NVL(OLDDED,0) H_ADD_OLD_MONEY ,Nvl(\
OBSTACLENO,0) H_ADD_JANG_SU ,NVL(OBSDED,0) H_ADD_JANG_MONEY ,NVL(CHILDNO,0) \
H_ADD_SON_SU ,NVL(CHILDDED,0) H_ADD_SON_MONEY ,NVL(WOMANDED,0) H_ADD_LADY ,0\
 H_ADD_TEMP1 ,0 H_ADD_TEMP2 ,0 H_ADD_TEMP3 ,0 H_ADD_TEMP4 ,0 H_ADD_TEMP5 ,0 \
H_ADD_TEMP6 ,NVL(FEWDED,0) H_SOSUGONG ,NVL(INSDED,0) H_SPECIAL_INSURANCE ,NV\
L(HOSDED,0) H_SPECIAL_MEDICAL ,NVL(Y.EDUDED,0) H_SPECIAL_EDUCATE ,NVL(HOUSED\
ED,0) H_SPECIAL_HOUSE ,NVL(GIVEDED,0) H_SPECIAL_DONATE ,NVL(CREDITDED,0) H_S\
PECIAL_SIN ,0 H_SPECIAL_TEMP1 ,0 H_SPECIAL_TEMP2 ,0 H_SPECIAL_TEMP3 ,0 H_SPE\
CIAL_TEMP4 ,0 H_SPECIAL_TEMP5 ,0 H_SPECIAL_TEMP6 ,NVL(SPECIALDED,0) H_SPECIA\
L_TOTAL ,0 H_CHAGAM ,NVL(PENDED,0) H_PERSON_GONG ,0 H_WORKING_GONG ,nvl(inve\
stded,0) H_JOHAB_GONG ,0 H_GONG_TEMP1 ,0 H_GONG_TEMP2 ,0 H_GONG_TEMP3 ,0 H_G\
ONG_TEMP4 ,0 H_GONG_TEMP5 ,0 H_GONG_TEMP6 ,N");
     sqlbuft((void **)0,
       "VL(TAXLEVEL,0) H_STANDARD ,NVL(CALCTAX,0) H_SANCHUL ,NVL(INCOMTDED,0\
) H_SGONG_LABOR ,NVL(PROPDED,0) H_SGONG_ASSETS ,NVL(HLOANDED,0) H_SGONG_HOUS\
E ,NVL(FORIDED,0) H_SGONG_OVERSEA ,NVL(STKDED,0) H_SGONG_STOCK ,0 H_SGONG_TE\
MP1 ,0 H_SGONG_TEMP2 ,0 H_SGONG_TEMP3 ,nvl(Y.polided,0) H_SGONG_TEMP4 ,0 H_S\
GONG_TEMP5 ,0 H_SGONG_TEMP6 ,NVL(TDEDSUM,0) H_SGONG_TOTAL ,0 H_SGM_PAY ,0 H_\
SGM_JOGAM ,0 H_SGM_TEMP1 ,0 H_SGM_TEMP2 ,0 H_SGM_TEMP3 ,0 H_SGM_TEMP4 ,0 H_S\
GM_TEMP5 ,0 H_SGM_TEMP6 ,0 H_SGM_TOTAL ,NVL(DINTAX,0) H_DECIDE_SO ,NVL(DNONG\
TAX,0) H_DECIDE_NONG ,NVL(DJUTAX,0) H_DECIDE_JOO ,((NVL(DINTAX,0)+NVL(DJUTAX\
,0))+nvl(DNONGTAX,0)) H_DECIDE_TOTAL ,NVL(BINTAX,0) H_NAP_JONG_SO ,NVL(BNONG\
TAX,0) H_NAP_JONG_NONG ,NVL(BJUTAX,0) H_NAP_JONG_JOO ,((NVL(BINTAX,0)+NVL(BJ\
UTAX,0))+NVL(BNONGTAX,0)) H_NAP_JONG_TOTAL ,NVL(MINTAX,0) H_NAP_HYUN_SO ,NVL\
(MNONGTAX,0) H_NAP_HYUN_NONG ,NVL(MJUTAX,0) H_NAP_HYUN_JOO ,((NVL(MINTAX,0)+\
NVL(MJUTAX,0))+NVL(MNONGTAX,0)) H_NAP_HYUN_TOTAL ,NVL(Y.YINTAX,0) H_SIL_SO ,\
NVL(Y.YNONGTAX,0) H_SIL_NONG ,NVL(Y.YJUTAX,0");
     sqlbuft((void **)0,
       ") H_SIL_JOO ,((NVL(Y.YINTAX,0)+NVL(Y.YJUTAX,0))+NVL(Y.YNONGTAX,0)) H\
_SIL_TOTAL ,:b8 RST_VALIDATION ,NVL(STANDDED,0) H_SPECIAL_STANDARD ,NVL(ANUD\
ED,0) H_SPECIAL_YK_BO ,NVL(NPENDED,0) H_PERSON_SAVE ,0 H_SGONG_JOHAP ,NVL(LS\
TKDED,0) H_SGONG_JUNGKEN ,NVL(B.BLDCODE,'2C') H_GUNMU ,NVL(FOREIGNDED,0) H_S\
GONG_FOREIGNER ,NVL(BCORPNAME,'') H_CORPNAME ,NVL(BCORPNO,'') H_CORPNO ,NVL(\
BPAYSUM,0) H_PAYSUM ,NVL(BBONSUM,0) H_BONSUM ,NVL(BMEDAMT,0) H_MEDAMT ,NVL(B\
HIREAMT,0) H_HIREAMT ,NVL(BANUAMT,0) H_ANUAMT ,NVL(FAMI70NO,0) H_FAMI70NO ,N\
VL(SPECADDNO,0) H_SPECADDNO ,NVL(SPECADDDED,0) H_SPECADDDED ,NVL(SHOSAMT,0) \
H_SHOSAMT ,NVL(HOUSEINTAMT2,0) H_HOUSEINTAMT2 ,null  CONFM ,null  ZCONF_DATE\
 ,null  WT_QSCOD ,'I' MODE_FLAG ,'N' EAI_FLAG ,null  EAI_DATE  from PKHRTHIS\
 A ,PKHRYHIS Y ,PKMPMAS B ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb\
,1,1) Tribegb  from Pycdept ) XX ,(select Orgnum ,Deptcode ,Fincode ,Substr(\
Tribegb,1,1) Tribegb  from Pycdept ) YY where ((((((A.EMPNO=B.EMPNO and A.em\
pno=Y.empno) and A.subdate like (:b9||'%')) ");
     sqlstm.stmt = "and A.retdate=Y.retdate) and (XX.Deptcode=B.Deptcode an\
d XX.ORGNUM=B.ORGNUM)) and (YY.Deptcode=B.Jobdept and YY.ORGNUM=B.ORGNUM)) an\
d TAXGROSS<>0)";
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
     sqlstm.sqhstv[5] = (unsigned char  *)v_dt_createhms;
     sqlstm.sqhstl[5] = (unsigned long )15;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[6] = (unsigned long )5;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)v_rst_validation;
     sqlstm.sqhstl[8] = (unsigned long )2;
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
     {     /* 에러이면 */
          sprintf(log_buff, "ORA-%05d - Insert EAI_WORKTAX Error--------\n", sqlca.sqlcode);
          printf(log_buff, "ORA-%05d - Insert EAI_WORKTAX Error--------\n", sqlca.sqlcode);
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
     {    /* 에러가 아니면 */
          v_cnt_line = sqlca.sqlerrd[2];
          WriteLog("Insert EAI_RETIRETAX Success\n");
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
     
     /******************************************************************************************/   
     /* EXEC SQL                
     SELECT SUM(NVL(Y.YINTAX,0)),  SUM(NVL(Y.YJUTAX,0)),  SUM(NVL(Y.YNONGTAX,0)),  SUM(NVL(Y.yintax,0))
       INTO :v_amtin,           :v_amtju,            :v_amtnong,            :v_amttot
       FROM PKhrthis A ,PKMPMAS B, PKHRYHIS Y
      WHERE A.subdate  like :v_paydate||'%'
        AND A.EMPNO = B.EMPNO
        AND A.EMPNO = Y.EMPNO ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(NVL(Y.YINTAX,0)) ,sum(NVL(Y.YJUTAX,0)) ,sum(\
NVL(Y.YNONGTAX,0)) ,sum(NVL(Y.yintax,0)) into :b0,:b1,:b2,:b3  from PKhrthis \
A ,PKMPMAS B ,PKHRYHIS Y where ((A.subdate like (:b4||'%') and A.EMPNO=B.EMPN\
O) and A.EMPNO=Y.EMPNO)";
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
     sqlstm.sqhstv[4] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[4] = (unsigned long )7;
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


     
            
     if   (sqlca.sqlcode != 0) 
     {    /* 에러이면 */
          v_cnt_line = 0;
          sprintf(log_buff, "ORA-%05d - Fetch 통계_Error\n", sqlca.sqlcode);
          printf("ORA-%05d - Fetch 통계_Error\n", sqlca.sqlcode);
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
          sqlstm.offset = (unsigned int  )175;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
          return(-1);
     }          
     
     WriteLog("Insert ERP EAI_RETIRETAX Success\n");
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
     sqlstm.offset = (unsigned int  )190;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     WriteLog("< Write EAI_RETIRETAX Ending >-------------------------\n");
                    
     return(0);
}

int Check_date()
{
   /* EXEC SQL
   SELECT nvl(subdate,'000000'), SUBSTR(subdate,1,4),  SUBSTR(subdate, 5, 2)
     INTO :v_yyyymm, :v_yyyy, :v_mm
     FROM PKHRTHIS
    WHERE subdate like :v_paydate||'%'
      AND ROWNUM = 1; */ 

{
   struct sqlexd sqlstm;
   sqlstm.sqlvsn = 12;
   sqlstm.arrsiz = 10;
   sqlstm.sqladtp = &sqladt;
   sqlstm.sqltdsp = &sqltds;
   sqlstm.stmt = "select nvl(subdate,'000000') ,SUBSTR(subdate,1,4) ,SUBSTR\
(subdate,5,2) into :b0,:b1,:b2  from PKHRTHIS where (subdate like (:b3||'%') \
and ROWNUM=1)";
   sqlstm.iters = (unsigned int  )1;
   sqlstm.offset = (unsigned int  )205;
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


    
   if ( sqlca.sqlcode == -1403 )
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
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )236;
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
     sqlstm.offset = (unsigned int  )277;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}