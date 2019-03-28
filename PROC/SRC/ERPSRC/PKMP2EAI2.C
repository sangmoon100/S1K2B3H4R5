
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
    "pkmp2eai2.pc"
};


static unsigned int sqlctx = 315419;


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
   unsigned char  *sqhstv[16];
   unsigned long  sqhstl[16];
            int   sqhsts[16];
            short *sqindv[16];
            int   sqinds[16];
   unsigned long  sqharm[16];
   unsigned long  *sqharc[16];
   unsigned short  sqadto[16];
   unsigned short  sqtdso[16];
} sqlstm = {12,16};

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
5,0,0,1,96,0,4,183,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,120,0,4,197,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
55,0,0,3,4355,0,3,301,0,0,16,16,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,
134,0,0,4,0,0,31,583,0,0,0,0,0,1,0,
149,0,0,5,0,0,29,593,0,0,0,0,0,1,0,
164,0,0,6,192,0,4,596,0,0,4,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
195,0,0,7,142,0,4,608,0,0,4,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
226,0,0,8,159,0,4,629,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
257,0,0,9,159,0,4,642,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
288,0,0,10,50,0,3,666,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
329,0,0,11,0,0,29,676,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : PKMP2EAI2(INSA->EAI Interface Program)
 USAGE          : pkmp2eai2 DBUserID 작업자사번 지급년월  (EAI_RETIRETAX)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직소득(퇴직금)
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2005.07.

퇴직소득(EAI_RETIRETAX) : /var/mte/adapter/conf/script/PIM/PIM.PIMFI1070B.SND.sh

Update Contents
   Version    date(yy.mm.dd)     programmer     description
   1.00       2005.07.           dsa2000         SAP도입에 따른 신규개발(pkmp2erp2.pc를 토대로)                  
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

     char    v_dt_create[9];           /* 생성일자 */
     char    v_dt_createhms[15];       /* 생성일시 */
     char    v_cd_data[4] = "D52";     /* Employee Data Code */
     int     v_no_crt_srl = 0;         /* 생성 일련번호 */
             
     char    v_sscode[3+1]  = "B10";   /* 정규직_퇴직소득세*/
     char    v_sscodeil[3+1]= "B20";   /* 일용직_퇴직소득세*/
             
     char    v_ym_acct[7];             /* 회계년월 */
     int     v_cnt_line = 0;           /* Line건수 */ 
     char    v_ph_proc[2] = "A";       /* 처리단계 */
     char    v_st_proc[2] = "P";       /* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
     char    v_cl_data_use[2] = "A";   /* Data 활용구분 */
     char    v_paydate[7];             /* 지급년월 */
     char    v_yyyymm[7];              /* 지급년월 */
     char    v_yyyy[5];                /* 지급년 */
     char    v_mm[3];                  /* 지급월 */
     double  v_amttot = 0;             /* 퇴직총액   */
     double  v_amtin  = 0;             /* 차감소득세총액   */
     double  v_amtju  = 0;             /* 차감주민세총액   */
     double  v_amttot1 = 0;            /* 총액   */
     double  v_amtin1  = 0;            /* 차감소득세총액   */
     double  v_amtju1  = 0;            /* 차감주민세총액   */
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
     
     if   (argc != 5) 
     {     /* pkmp2eai2 200507 D006 pkmp2eai2 2005073100000*/
           printf("[Usage] : pkmp2eai2 1.퇴직년월(YYYYMM) 2.작업자 3.progid 4.시작시간\n");
           fclose(fp);
           exit(1);
     }
     
     sprintf(v_paydate, argv[1]);          /* 지급년월   */     
     
     hinsa_log_print(0,"ERP 인터페이스 시작...");      
     hinsa_db_connect();  /*DB Connect 실시..*/
       
     strcpy(log_writeman, argv[2]);
     strcpy(log_progid,   argv[3]);
     strcpy(log_rundate,  argv[4]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     InitVariables();   /* 변수 초기화 */
     
     Initialize();     /* 초기화 루틴 */
     
     CreateLog();
     
     sprintf(buff, "프로그램명 : %s\n", argv[0]);
     WriteLog(buff);
     sprintf(buff, "지급년월  : %s\n", argv[1]);
     WriteLog(buff);
     
     if  (Check_date() != 0) 
     {  
          sprintf(buff, "지급년월에 해당하는 자료가 없습니다. %s\n", v_paydate);
          WriteLog(buff);
          fclose(fp);
          printf("지급년월에 해당하는 자료가 없습니다.\n");
          Write_batlog(seqno++, "지급년월에 해당하는 자료가 없습니다.\n");   
          exit(1);
     }     
     
     if  (WriteControl(0) == -1) 
     {    /* 초기값 세팅 */
           fclose(fp);
          exit(1);
     }   
         
     if  (WriteEmployee() == -1)
     {   
          WriteControl(2);  /* 비정상종료 */
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");   /*Dsa2000*/
     }        
     else
     {
          WriteLog("< Program End......................................... >\n");
          fclose(fp);
                printf("총    건    수 : %d\n", v_cnt_line);
          printf("퇴직금    합계 : %0.0f\n", v_amttot);
          printf("차감소득세합계 : %0.0f\n", v_amtin);
          printf("차감주민세합계 : %0.0f\n", v_amtju);   
          
          sprintf(log_buff, "총    건    수 : %d\n", v_cnt_line);
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "퇴직금    합계 : %0.0f\n", v_amttot);
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "차감소득세합계 : %0.0f\n", v_amtin);
          Write_batlog(seqno++, log_buff);   
          sprintf(log_buff, "차감주민세합계 : %0.0f\n", v_amtju);
          Write_batlog(seqno++, log_buff);   
          
          sprintf(log_buff, "OK ====== [작업 완료] =====\n");
          Write_batlog(seqno++, log_buff);   
          WriteControl(1);   /* 정상종료 */  
          hinsa_exit(0,"OK ====== [작업 완료] =====\n");   /*Dsa2000*/
     }
}


void InitVariables(void)
{
     memset(logfile, NULL, sizeof(logfile));
     memset(logfile_fullname, NULL, sizeof(logfile_fullname));    
     memset(v_dt_create, NULL, sizeof(v_dt_create));
     memset(v_ym_acct, NULL, sizeof(v_ym_acct));
}


void Initialize(void)
{
     sprintf(v_ym_acct, v_paydate );
     
     /* EXEC SQL
     SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD') ,
             TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
       INTO   :v_dt_create,
             :v_dt_createhms
       FROM  DUAL; */ 

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
       FROM EAI_RETIRETAX
      WHERE H_YEAR||LPad(H_MONTH,2,'0') = :v_paydate
        AND CD_DATA = :v_cd_data; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL((max(NO_CRT_SRL)+1),1) into :b0  from EAI_RE\
TIRETAX where ((H_YEAR||LPad(H_MONTH,2,'0'))=:b1 and CD_DATA=:b2)";
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


     
     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1403) && (sqlca.sqlcode != -1405)) 
     {   
          printf("ORA-%05d - MAX Seril# 가져오기  Error\n", sqlca.sqlcode);
          fclose(fp);
          exit(1);
     }    
}


void CreateLog()
{  
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/log/ERPlog/");
     
     /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%spkmp2eai2%s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl);
     
     /* 로그파일 오픈 */
     fp = fopen(logfile_fullname, "w+");
     
     if (fp == NULL) 
     {
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
     sprintf(buff, "v_cnt_line : (%d)\n", v_cnt_line);
     WriteLog(buff);
     
     if (gubun == 1) 
     {
          printf("OK Program End......................................... >\n");
          sprintf(log_buff, "OK Program End......................................... >\n");
          Write_batlog(seqno++, log_buff);   
     }     
     else if (gubun == 2)
     {
          printf("Fail Program End......................................... >\n");   
          sprintf(log_buff, "Fail Program End......................................... >\n");
          Write_batlog(seqno++, log_buff);   
     }     
     return(0);    
}

int  WriteEmployee(void)
{    
     WriteLog("< Write EAI_RETIRETAX Starting >-------------------------------\n");
     
     sprintf(buff, "v_dt_create : (%s)\n", v_dt_create);
     WriteLog(buff);
     sprintf(buff, "v_cd_data : (%s)\n", v_cd_data);
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
     printf("v_rst_validation : %s \n", v_rst_validation); */  
       
     /* -----------------------퇴직이력 ---------------------------------------- */
     /* EXEC SQL 
     INSERT INTO EAI_RETIRETAX (
            H_YEAR         ,
            H_MONTH        ,
            MDGBN          ,
            CD_DATA        ,
            NO_CRT_SRL     ,
            IFSYS          ,
            H_SSCODE       ,
            H_EMPNO        ,
            H_DEDAT        ,                
            SEQLN          ,                
            IFDAT          ,                
            H_UNIT         ,                
            H_DEPT         ,
            H_ENAME        ,
            H_JOSGU        ,
            H_RETIRE       ,
            H_MYUNG        ,
            H_BOHUM        ,
            H_TOTAL        ,
            H_GONG         ,
            H_STANDARD     ,
            H_STNDYY       ,
            H_TAXYY        ,
            H_SANTAX       ,
            H_GONGTAX      ,
            H_FIXTAX       ,
            H_FIXNONG      ,
            H_FIXJUMIN     ,
            H_FIXTOTAL     ,
            H_NAPTAX       ,
            H_NAPNONG      ,
            H_NAPHUMIN     ,
            H_NAPTOTAL     ,
            H_WONTAX       ,
            H_WONNONG      ,
            H_WONJUMIN     ,
            H_WONTOTAL     ,
            RST_VALIDATION ,
            DESC_VALIDATION,
            H_IDAY         ,
            H_TDAY         ,
            H_WOL          ,
            H_KS_FROM      ,
            H_KS_TO        , /o
            H_KEUNSOK      ,
            H_JUNA_COMPANY ,
            H_JUNA_SAUP    ,
            H_JUNA_PAY     ,
            H_JUNA_SOO     ,
            H_JUNA_BO      ,
            H_JUNA_TEMP1   ,
            H_JUNA_TEMP2   ,
            H_JUNA_TOTAL   ,o/
            H_GUNMU        ,
            H_JUMINID      ,
            H_HORRETAMNT   ,
            H_DUTYMM       ,
            H_DUTYYY       ,
            H_BRETFRDAY    ,
            CONFM          ,
            ZCONF_DATE     ,
            WT_QSCOD       ,
            MODE_FLAG      ,
            EAI_FLAG       ,
            EAI_DATE       )
     SELECT 
            H_YEAR         ,
            H_MONTH        ,
            MDGBN          ,
            CD_DATA        ,
            NO_CRT_SRL     ,
            IFSYS          ,
            H_SSCODE       ,
            H_EMPNO        ,
            H_DEDAT        ,                
            rownum   SEQLN ,                
            IFDAT          ,                
            H_UNIT         ,                
            H_DEPT         ,
            H_ENAME        ,
            H_JOSGU        ,
            H_RETIRE       ,
            H_MYUNG        ,
            H_BOHUM        ,
            H_TOTAL        ,
            H_GONG         ,
            H_STANDARD     ,
            H_STNDYY       ,
            H_TAXYY        ,
            H_SANTAX       ,
            H_GONGTAX      ,
            H_FIXTAX       ,
            H_FIXNONG      ,
            H_FIXJUMIN     ,
            H_FIXTOTAL     ,
            H_NAPTAX       ,
            H_NAPNONG      ,
            H_NAPHUMIN     ,
            H_NAPTOTAL     ,
            H_WONTAX       ,
            H_WONNONG      ,
            H_WONJUMIN     ,
            H_WONTOTAL     ,
            RST_VALIDATION ,
            DESC_VALIDATION,
            H_IDAY         ,
            H_TDAY         ,
            H_WOL          ,
            H_KS_FROM      ,
            H_KS_TO        ,
            H_GUNMU        ,
            H_JUMINID      ,
            H_HORRETAMNT   ,
            H_DUTYMM       ,
            H_DUTYYY       ,
            H_BRETFRDAY    ,
            CONFM          ,
            ZCONF_DATE     ,
            WT_QSCOD       ,
            MODE_FLAG      ,
            EAI_FLAG       ,
            EAI_DATE       
       FROM                                     
           (SELECT  --+ORDERED
                  :v_yyyy                         H_YEAR,    /o신고년o/        
                  :v_mm                           H_MONTH,   /o신고월o/   
                   'TX'                           MDGBN,     /o모듈구분o/
                   :v_cd_data                     CD_DATA,   /o자료구분 D52o/  
                   :v_no_crt_srl                  NO_CRT_SRL,/o순서o/   
                   'HRIS'                         IFSYS,     /o원천구분o/
                   :v_sscode                      H_SSCODE,   /o소득관리코드 'B10'o/
                   A.EMPNO                        H_EMPNO,
                   A.SUBDATE                      H_DEDAT,   /o지급일o/ /o :v_paydate  H_DEDAT,    -- by man yhs 2000.01.06o/                
                   /o rownum                      SEQLN,     /o라인번호o/                
                  :v_dt_createhms                 IFDAT,     /o생성일시 o/             
                   null                           H_UNIT, 
                   /o NVL(B.FINCODE, 'xxxxx')        H_DEPT, o/
                   /o DECODE(SUBSTR(C.TRIBEGB,1,1),'2',C.FINCODE, B.FINCODE ) H_DEPT,  /o 이상용 20181113 조직개편 o/
                   NVL(Case When (X.Tribegb='2' And Y.Tribegb='2') Then Y.Fincode Else X.Fincode End, 'xxxxx') H_DEPT, /o 20181204 JHG 조직개편 o/
                   A.KORNAME                      H_ENAME,
                   'Y'                            H_JOSGU,
                   /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
                   A.RETAMT+A.HORRETAMT           H_RETIRE,  *A.RETAMTSUM  => A.RETAMT+A.HORRETAMT : 년도중 중간정산금액 배제키위해 DSA2000 2005.07. o/
                   A.RETAMTSUM                    H_RETIRE,  
                   0                              H_MYUNG,   /o0  => A.HORRETAMT dsa2000  2006.01.o/
                   0                              H_BOHUM,
                   /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
                   A.RETAMT+A.HORRETAMT           H_TOTAL,   *A.RETAMTSUM  => A.RETAMT+A.HORRETAMT : 년도중 중간정산금액 배제키위해 DSA2000 2005.07. o/
                   A.RETAMTSUM                    H_TOTAL,   
                   A.RINDED                       H_GONG,
                   A.TAXSTAMT                     H_STANDARD,
                   A.AVGTAXSTAMT                  H_STNDYY,
                   A.RETAVGTAX                    H_TAXYY,
                   A.RETCALCTAX                   H_SANTAX,
                   A.RETTAXDED                    H_GONGTAX,
                   A.REALRETINTAX                 H_FIXTAX,    /oA.RETINTAX => A.REALRETINTAX : DSA2000  2005.07o/
                   0                              H_FIXNONG,
                   A.REALRETJUTAX                 H_FIXJUMIN,  /oA.RETJUTAX => A.REALRETJUTAX : DSA2000  2005.07o/
                   A.REALRETINTAX+A.REALRETJUTAX  H_FIXTOTAL, /oA.RETINTAX+A.RETJUTAX => REALRETINTAX+A.REALRETJUTAX   : DSA2000  2005.07o/
                   A.BRETINTAX                    H_NAPTAX,
                   0                              H_NAPNONG,
                   A.BRETJUTAX                    H_NAPHUMIN,
                   A.BRETINTAX +A.BRETJUTAX       H_NAPTOTAL,
                   A.RETINTAX                     H_WONTAX,/o2013.04.24.hjku. 2013년 퇴직세법 변경 적용후 수정. A.RETINTAX - A.BRETINTAX       H_WONTAX,o/
                   0                              H_WONNONG,
                   A.RETJUTAX                     H_WONJUMIN,/o2013.04.24.hjku. 2013년 퇴직세법 변경 적용후 수정. A.RETJUTAX - A.BRETJUTAX       H_WONJUMIN,o/
                   A.RETINTAX + A.RETJUTAX        H_WONTOTAL,/o2013.04.24.hjku. 2013년 퇴직세법 변경 적용후 수정. A.RETINTAX - A.BRETINTAX + A.RETJUTAX - A.BRETJUTAX   H_WONTOTAL,o/                   
                   :v_rst_validation              RST_VALIDATION,
                   null                           DESC_VALIDATION,
                   A.EMPDATE                      H_IDAY,
                   A.RETDATE                      H_TDAY,
                   A.REALMM                       H_WOL,
                   GREATEST(NVL(A.ORGEMPDATE, SUBSTR(A.RETDATE,1,4)||'0101'), SUBSTR(A.RETDATE,1,4)||'0101')  H_KS_FROM,
                   A.RETDATE                      H_KS_TO,
                   NVL(M.BLDCODE, '2C')           H_GUNMU,   /o근무지--널이면 본사로 o/    /o2019.01.29 eyha sap 전송시 인사마스터에서 급여마스터로 전송 o/          
                   replace(M.juminid,'-','')      H_JUMINID      ,
                   A.HORRETAMT                    H_HORRETAMNT   ,
                   A.DUTYMM                       H_DUTYMM       ,
                   ceil(dutymm/12)                H_DUTYYY       ,
                   A.BRETFRDAY                    H_BRETFRDAY    ,
                   null                           CONFM          ,
                   null                           ZCONF_DATE     ,
                   null                           WT_QSCOD       ,
                   'I'                            MODE_FLAG      ,
                   'N'                            EAI_FLAG       ,
                   null                           EAI_DATE       
              FROM PKHRTHIS A, PKMPMAS M, /o2019.01.29 eyha sap 전송시 인사마스터에서 급여마스터로 전송 o/
                  /o  PYCDEPT B, PYCDEPT C o/
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) X,  /o 20181204 JHG 조직개편 o/  
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) Y   /o 20181204 JHG 조직개편 o/     
             WHERE A.EMPNO    = M.EMPNO
             /o  AND A.DEPTCODE = B.DEPTCODE o/
             /o  AND A.ORGNUM   = B.ORGNUM o/
             /o  AND M.ORGNUM   = C.ORGNUM o/
             /o  AND M.JOBDEPT  = C.DEPTCODE o/
               AND SUBSTR(A.SUBDATE,1,6)  = :v_paydate
               AND A.RETAMTSUM > 0 
               AND NOT A.EMPNO IN ('2545', '2742','0149','2911')      /o 2017.01.20 eyha 전출자 인터페이스되지않도록 홍M 요청 o/
               AND (X.Deptcode = M.Deptcode AND X.ORGNUM = M.ORGNUM)  /o 20181204 JHG 조직개편 o/  
               AND (Y.Deptcode = M.Jobdept  AND Y.ORGNUM = M.ORGNUM)  /o 20181204 JHG 조직개편 o/ 
/o    -----------------------중간퇴직이력 ---------------------------------------- o/
             UNION
            SELECT  --+ORDERED
                  :v_yyyy                        H_YEAR,                      /o신고년o/        
                  :v_mm                          H_MONTH,                     /o신고월o/   
                   'TX'                          MDGBN,                       /o모듈구분o/
                   :v_cd_data                    CD_DATA,                      /o자료구분 D52o/  
                   :v_no_crt_srl                 NO_CRT_SRL,                  /o순서o/   
                   'HRIS'                        IFSYS,                       /o원천구분o/
                  :v_sscode                      H_SSCODE,                     /o소득관리코드 'B10'o/
                   A.EMPNO                       H_EMPNO,
                   A.SUBDATE                     H_DEDAT,                     /o지급일o/ /o :v_paydate  H_DEDAT,    -- by man yhs 2000.01.06o/                
                   /o rownum                     SEQLN,                       /o라인번호o/                
                  :v_dt_createhms                IFDAT,                       /o생성일시 o/             
                   null                          H_UNIT,                     
                   /o NVL(B.FINCODE, 'xxxxx')       H_DEPT, o/
                   NVL(Case When (X.Tribegb='2' And Y.Tribegb='2') Then Y.Fincode Else X.Fincode End, 'xxxxx') H_DEPT, /o 20181204 JHG 조직개편 o/
                   A.KORNAME                     H_ENAME,   
                   'Y'                           H_JOSGU,
                   /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
                   A.RETAMT                      H_RETIRE,  *A.RETAMTSUM  => A.RETAMT : 년도중 중간정산금액 배제키위해 DSA2000 2005.07. o/
                   A.RETAMTSUM                   H_RETIRE, 
                   0                             H_MYUNG,
                   0                             H_BOHUM,
                   /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
                   A.RETAMT                      H_TOTAL,  *A.RETAMTSUM  => A.RETAMT : 년도중 중간정산금액 배제키위해 DSA2000 2005.07. o/
                   A.RETAMTSUM                   H_TOTAL,  
                   A.RINDED                      H_GONG,
                   A.TAXSTAMT                    H_STANDARD,
                   A.AVGTAXSTAMT                 H_STNDYY,
                   A.RETAVGTAX                   H_TAXYY,
                   A.RETCALCTAX                  H_SANTAX,
                   A.RETTAXDED                   H_GONGTAX,
                   A.REALRETINTAX                H_FIXTAX,    /oA.RETINTAX => A.REALRETINTAX : DSA2000  2005.07o/
                   0                             H_FIXNONG,
                   A.REALRETJUTAX                H_FIXJUMIN,  /oA.RETJUTAX => A.REALRETJUTAX : DSA2000  2005.07o/
                   A.REALRETINTAX+A.REALRETJUTAX H_FIXTOTAL, /oA.RETINTAX+A.RETJUTAX => REALRETINTAX+A.REALRETJUTAX   : DSA2000  2005.07o/
                   0                             H_NAPTAX,
                   0                             H_NAPNONG,
                   0                             H_NAPHUMIN,
                   0                             H_NAPTOTAL,
                   A.RETINTAX                    H_WONTAX,
                   0                             H_WONNONG,
                   A.RETJUTAX                    H_WONJUMIN,
                   A.RETINTAX + A.RETJUTAX       H_WONTOTAL,
                   :v_rst_validation             RST_VALIDATION,
                   null                          DESC_VALIDATION,
                   A.MRFRDATE                    H_IDAY,
                   A.MRTODATE                    H_TDAY,
                   A.RETMM                         H_WOL,
                   GREATEST(A.MRFRDATE, SUBSTR(A.MRTODATE,1,4)||'0101')    H_KS_FROM,  
                   A.MRTODATE                      H_KS_TO,
                   NVL(M.BLDCODE, '2C')          H_GUNMU,   /o근무지--널이면 본사로 o/              
                   replace(M.juminid,'-','')     H_JUMINID      ,
                   0                             H_HORRETAMNT   ,
                   A.DUTYMM                      H_DUTYMM       ,
                   A.DUTYYY                      H_DUTYYY       ,
                   A.BRETFRDAY                   H_BRETFRDAY    ,
                   null                          CONFM          ,
                   null                          ZCONF_DATE     ,
                   null                          WT_QSCOD       ,
                   'I'                           MODE_FLAG      ,
                   'N'                           EAI_FLAG       ,
                   null                          EAI_DATE           
              FROM PKHMRHIS A, PKMPMAS M, /o PYCDEPT B, o/  /o2019.01.29 eyha sap 전송시 인사마스터에서 급여마스터로 전송 o/
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) X,  /o 20181204 JHG 조직개편 o/  
                  (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) Y   /o 20181204 JHG 조직개편 o/                
             WHERE A.EMPNO    = M.EMPNO
               AND SUBSTR(A.subdate,1,6)  = :v_paydate
              /o AND A.DEPTCODE = B.DEPTCODE o/
              /o AND A.ORGNUM   = B.ORGNUM o/
               AND (X.Deptcode = M.Deptcode AND X.ORGNUM = M.ORGNUM)  /o 20181204 JHG 조직개편 o/  
               AND (Y.Deptcode = M.Jobdept  AND Y.ORGNUM = M.ORGNUM)  /o 20181204 JHG 조직개편 o/  
          ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into EAI_RETIRETAX (H_YEAR,H_MONTH,MDGBN,CD_DATA,NO_CRT_SRL,I\
FSYS,H_SSCODE,H_EMPNO,H_DEDAT,SEQLN,IFDAT,H_UNIT,H_DEPT,H_ENAME,H_JOSGU,H_RE\
TIRE,H_MYUNG,H_BOHUM,H_TOTAL,H_GONG,H_STANDARD,H_STNDYY,H_TAXYY,H_SANTAX,H_G\
ONGTAX,H_FIXTAX,H_FIXNONG,H_FIXJUMIN,H_FIXTOTAL,H_NAPTAX,H_NAPNONG,H_NAPHUMI\
N,H_NAPTOTAL,H_WONTAX,H_WONNONG,H_WONJUMIN,H_WONTOTAL,RST_VALIDATION,DESC_VA\
LIDATION,H_IDAY,H_TDAY,H_WOL,H_KS_FROM,H_KS_TO,H_GUNMU,H_JUMINID,H_HORRETAMN\
T,H_DUTYMM,H_DUTYYY,H_BRETFRDAY,CONFM,ZCONF_DATE,WT_QSCOD,MODE_FLAG,EAI_FLAG\
,EAI_DATE)select H_YEAR ,H_MONTH ,MDGBN ,CD_DATA ,NO_CRT_SRL ,IFSYS ,H_SSCOD\
E ,H_EMPNO ,H_DEDAT ,rownum SEQLN ,IFDAT ,H_UNIT ,H_DEPT ,H_ENAME ,H_JOSGU ,\
H_RETIRE ,H_MYUNG ,H_BOHUM ,H_TOTAL ,H_GONG ,H_STANDARD ,H_STNDYY ,H_TAXYY ,\
H_SANTAX ,H_GONGTAX ,H_FIXTAX ,H_FIXNONG ,H_FIXJUMIN ,H_FIXTOTAL ,H_NAPTAX ,\
H_NAPNONG ,H_NAPHUMIN ,H_NAPTOTAL ,H_WONTAX ,H_WONNONG ,H_WONJUMIN ,H_WONTOT\
AL ,RST_VALIDATION ,DESC_VALIDATION ,H_IDAY ,H_TDAY ,H_WOL ,H_KS_FROM ,H_KS_\
TO ,H_GUNMU ,H_JUMINID ,H_HORRETAMNT ,H_DUTY");
     sqlbuft((void **)0,
       "MM ,H_DUTYYY ,H_BRETFRDAY ,CONFM ,ZCONF_DATE ,WT_QSCOD ,MODE_FLAG ,E\
AI_FLAG ,EAI_DATE  from (select  /*+ ORDERED */ :b0 H_YEAR ,:b1 H_MONTH ,'TX\
' MDGBN ,:b2 CD_DATA ,:b3 NO_CRT_SRL ,'HRIS' IFSYS ,:b4 H_SSCODE ,A.EMPNO H_\
EMPNO ,A.SUBDATE H_DEDAT ,:b5 IFDAT ,null  H_UNIT ,NVL( case  when (X.Tribeg\
b='2' and Y.Tribegb='2') then Y.Fincode else X.Fincode  end ,'xxxxx') H_DEPT\
 ,A.KORNAME H_ENAME ,'Y' H_JOSGU ,A.RETAMTSUM H_RETIRE ,0 H_MYUNG ,0 H_BOHUM\
 ,A.RETAMTSUM H_TOTAL ,A.RINDED H_GONG ,A.TAXSTAMT H_STANDARD ,A.AVGTAXSTAMT\
 H_STNDYY ,A.RETAVGTAX H_TAXYY ,A.RETCALCTAX H_SANTAX ,A.RETTAXDED H_GONGTAX\
 ,A.REALRETINTAX H_FIXTAX ,0 H_FIXNONG ,A.REALRETJUTAX H_FIXJUMIN ,(A.REALRE\
TINTAX+A.REALRETJUTAX) H_FIXTOTAL ,A.BRETINTAX H_NAPTAX ,0 H_NAPNONG ,A.BRET\
JUTAX H_NAPHUMIN ,(A.BRETINTAX+A.BRETJUTAX) H_NAPTOTAL ,A.RETINTAX H_WONTAX \
,0 H_WONNONG ,A.RETJUTAX H_WONJUMIN ,(A.RETINTAX+A.RETJUTAX) H_WONTOTAL ,:b6\
 RST_VALIDATION ,null  DESC_VALIDATION ,A.EMPDATE H_IDAY ,A.RETDATE H_TDAY ,\
A.REALMM H_WOL ,GREATEST(NVL(A.ORGEMPDATE,(S");
     sqlbuft((void **)0,
       "UBSTR(A.RETDATE,1,4)||'0101')),(SUBSTR(A.RETDATE,1,4)||'0101')) H_KS\
_FROM ,A.RETDATE H_KS_TO ,NVL(M.BLDCODE,'2C') H_GUNMU ,replace(M.juminid,'-'\
,'') H_JUMINID ,A.HORRETAMT H_HORRETAMNT ,A.DUTYMM H_DUTYMM ,ceil((dutymm/12\
)) H_DUTYYY ,A.BRETFRDAY H_BRETFRDAY ,null  CONFM ,null  ZCONF_DATE ,null  W\
T_QSCOD ,'I' MODE_FLAG ,'N' EAI_FLAG ,null  EAI_DATE  from PKHRTHIS A ,PKMPM\
AS M ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  from P\
ycdept ) X ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  \
from Pycdept ) Y where (((((A.EMPNO=M.EMPNO and SUBSTR(A.SUBDATE,1,6)=:b7) a\
nd A.RETAMTSUM>0) and  not A.EMPNO in ('2545','2742','0149','2911')) and (X.\
Deptcode=M.Deptcode and X.ORGNUM=M.ORGNUM)) and (Y.Deptcode=M.Jobdept and Y.\
ORGNUM=M.ORGNUM)) union select  /*+ ORDERED */ :b0 H_YEAR ,:b1 H_MONTH ,'TX'\
 MDGBN ,:b2 CD_DATA ,:b3 NO_CRT_SRL ,'HRIS' IFSYS ,:b4 H_SSCODE ,A.EMPNO H_E\
MPNO ,A.SUBDATE H_DEDAT ,:b5 IFDAT ,null  H_UNIT ,NVL( case  when (X.Tribegb\
='2' and Y.Tribegb='2') then Y.Fincode else ");
     sqlbuft((void **)0,
       "X.Fincode  end ,'xxxxx') H_DEPT ,A.KORNAME H_ENAME ,'Y' H_JOSGU ,A.R\
ETAMTSUM H_RETIRE ,0 H_MYUNG ,0 H_BOHUM ,A.RETAMTSUM H_TOTAL ,A.RINDED H_GON\
G ,A.TAXSTAMT H_STANDARD ,A.AVGTAXSTAMT H_STNDYY ,A.RETAVGTAX H_TAXYY ,A.RET\
CALCTAX H_SANTAX ,A.RETTAXDED H_GONGTAX ,A.REALRETINTAX H_FIXTAX ,0 H_FIXNON\
G ,A.REALRETJUTAX H_FIXJUMIN ,(A.REALRETINTAX+A.REALRETJUTAX) H_FIXTOTAL ,0 \
H_NAPTAX ,0 H_NAPNONG ,0 H_NAPHUMIN ,0 H_NAPTOTAL ,A.RETINTAX H_WONTAX ,0 H_\
WONNONG ,A.RETJUTAX H_WONJUMIN ,(A.RETINTAX+A.RETJUTAX) H_WONTOTAL ,:b6 RST_\
VALIDATION ,null  DESC_VALIDATION ,A.MRFRDATE H_IDAY ,A.MRTODATE H_TDAY ,A.R\
ETMM H_WOL ,GREATEST(A.MRFRDATE,(SUBSTR(A.MRTODATE,1,4)||'0101')) H_KS_FROM \
,A.MRTODATE H_KS_TO ,NVL(M.BLDCODE,'2C') H_GUNMU ,replace(M.juminid,'-','') \
H_JUMINID ,0 H_HORRETAMNT ,A.DUTYMM H_DUTYMM ,A.DUTYYY H_DUTYYY ,A.BRETFRDAY\
 H_BRETFRDAY ,null  CONFM ,null  ZCONF_DATE ,null  WT_QSCOD ,'I' MODE_FLAG ,\
'N' EAI_FLAG ,null  EAI_DATE  from PKHMRHIS A ,PKMPMAS M ,(select Orgnum ,De\
ptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb");
     sqlstm.stmt = "  from Pycdept ) X ,(select Orgnum ,Deptcode ,Fincode ,\
Substr(Tribegb,1,1) Tribegb  from Pycdept ) Y where (((A.EMPNO=M.EMPNO and SU\
BSTR(A.subdate,1,6)=:b7) and (X.Deptcode=M.Deptcode and X.ORGNUM=M.ORGNUM)) a\
nd (Y.Deptcode=M.Jobdept and Y.ORGNUM=M.ORGNUM))) ";
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
     sqlstm.sqhstv[6] = (unsigned char  *)v_rst_validation;
     sqlstm.sqhstl[6] = (unsigned long )2;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[7] = (unsigned long )7;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)v_yyyy;
     sqlstm.sqhstl[8] = (unsigned long )5;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)v_mm;
     sqlstm.sqhstl[9] = (unsigned long )3;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)v_cd_data;
     sqlstm.sqhstl[10] = (unsigned long )4;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&v_no_crt_srl;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)v_sscode;
     sqlstm.sqhstl[12] = (unsigned long )4;
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)v_dt_createhms;
     sqlstm.sqhstl[13] = (unsigned long )15;
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
     sqlstm.sqhstv[15] = (unsigned char  *)v_paydate;
     sqlstm.sqhstl[15] = (unsigned long )7;
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
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
          sprintf(buff, "ORA-%05d - Insert TEMP EAI_RETIRETAX Error-------- 중간\n", sqlca.sqlcode);
          WriteLog(buff);
          /* EXEC SQL ROLLBACK WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 16;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )134;
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
          v_cnt_line = v_cnt_line + sqlca.sqlerrd[2];
          WriteLog("Insert TEMP EAI_RETIRETAX Success\n");
          sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff);   
          /* EXEC SQL COMMIT WORK; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 16;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )149;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     }
     
     /* EXEC SQL
     /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
     SELECT nvl(sum(RETAMT+HORRETAMT),0),        *nvl(sum(RETAMTSUM),0),  dsa2000 2005.07.o/     
     SELECT nvl(sum(RETAMTSUM),0),        
            nvl(sum(REALRETINTAX),0),            /onvl(sum(RETINTAX),0),  nvl(sum(RETJUTAX),0)o/
            nvl(sum(REALRETJUTAX),0)
       INTO :v_amttot, :v_amtin, :v_amtju
       FROM PKHRTHIS
      WHERE SUBSTR(SUBDATE,1,6) = :v_paydate
        AND NOT EMPNO IN ('2545', '2742','0149','2911')    /o 2017.01.20 eyha 전출자 인터페이스되지않도록 홍M 요청 o/
      	; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(sum(RETAMTSUM),0) ,nvl(sum(REALRETINTAX),0) \
,nvl(sum(REALRETJUTAX),0) into :b0,:b1,:b2  from PKHRTHIS where (SUBSTR(SUBDA\
TE,1,6)=:b3 and  not EMPNO in ('2545','2742','0149','2911'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )164;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_amttot;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_amtin;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_amtju;
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
     /o 2017.01.20 eyha 퇴직금 전송시 중간정산금액도 합산 요청 홍M  근거 : SR-1701-0932 
     SELECT nvl(sum(RETAMT),0),  o/
     SELECT nvl(sum(RETAMTSUM),0),
            nvl(sum(REALRETINTAX),0),            /oA.RETINTAX => A.REALRETINTAX : DSA2000  2005.07o/
            nvl(sum(REALRETJUTAX),0)
       INTO :v_amttot1, :v_amtin1, :v_amtju1
       FROM PKHMRHIS
      WHERE SUBSTR(subdate,1,6) = :v_paydate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(sum(RETAMTSUM),0) ,nvl(sum(REALRETINTAX),0) \
,nvl(sum(REALRETJUTAX),0) into :b0,:b1,:b2  from PKHMRHIS where SUBSTR(subdat\
e,1,6)=:b3";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )195;
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


        
     v_amttot = v_amttot+ v_amttot1;
     v_amtin  = v_amtin + v_amtin1;
     v_amtju  = v_amtju + v_amtju1;
     return(0); 
}


int  Check_date()
{    
     int cnt =0;    
     
     /* EXEC SQL   
     SELECT substr(SUBDATE, 1,6), SUBSTR(SUBDATE, 1,4) retyyyy,  SUBSTR(SUBDATE, 5, 2) retmm
       INTO :v_yyyymm, :v_yyyy, :v_mm
       FROM PKHRTHIS  /o by man yhs 2000.01.06 o/
      WHERE SUBSTR(SUBDATE,1,6) = :v_paydate
        AND ROWNUM = 1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select substr(SUBDATE,1,6) ,SUBSTR(SUBDATE,1,4) retyyyy\
 ,SUBSTR(SUBDATE,5,2) retmm into :b0,:b1,:b2  from PKHRTHIS where (SUBSTR(SUB\
DATE,1,6)=:b3 and ROWNUM=1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )226;
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


     
     cnt = sqlca.sqlerrd[2];
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {  
         return(1);
     }
     
     /* EXEC SQL  
     SELECT substr(subdate,1,6), SUBSTR(subdate, 1,4) retyyyy,  
            SUBSTR(subdate, 5, 2) retmm
       INTO :v_yyyymm, :v_yyyy, :v_mm
       FROM PKHMRHIS
      WHERE SUBSTR(subdate,1,6) = :v_paydate  
        AND ROWNUM = 1 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select substr(subdate,1,6) ,SUBSTR(subdate,1,4) retyyyy\
 ,SUBSTR(subdate,5,2) retmm into :b0,:b1,:b2  from PKHMRHIS where (SUBSTR(sub\
date,1,6)=:b3 and ROWNUM=1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )257;
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


     
     cnt = cnt + sqlca.sqlerrd[2];    /*  printf("\n================== cnt %d",cnt);  */
     if ( cnt == 0 )   {  
          return(-1); 
     }
     
     if (( sqlca.sqlcode != 0 ) && (sqlca.sqlcode !=1403 ))
     {   /* printf("\n in the sqlcode[%d] ",sqlca.sqlcode);*/
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
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )288;
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
     sqlstm.arrsiz = 16;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )329;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}
