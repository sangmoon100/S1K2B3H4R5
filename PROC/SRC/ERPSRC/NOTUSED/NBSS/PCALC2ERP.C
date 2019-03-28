
/* Result Sets Interface */
#ifndef SQL_CRSR
#  define SQL_CRSR
  struct sql_cursor
  {
    unsigned int curocn;
    void *ptr1;
    void *ptr2;
    unsigned long magic;
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
  1,0,0,
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
    "pcalc2erp.pc"
};


static unsigned long sqlctx = 301531;


static struct sqlexd {
   unsigned int   sqlvsn;
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
            void  **sqphsv;
   unsigned int   *sqphsl;
            int   *sqphss;
            void  **sqpind;
            int   *sqpins;
   unsigned int   *sqparm;
   unsigned int   **sqparc;
   unsigned short  *sqpadto;
   unsigned short  *sqptdso;
            void  *sqhstv[17];
   unsigned int   sqhstl[17];
            int   sqhsts[17];
            void  *sqindv[17];
            int   sqinds[17];
   unsigned int   sqharm[17];
   unsigned int   *sqharc[17];
   unsigned short  sqadto[17];
   unsigned short  sqtdso[17];
} sqlstm = {10,17};

/* SQLLIB Prototypes */
extern sqlcxt (/*_ void **, unsigned long *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlcx2t(/*_ void **, unsigned long *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlbuft(/*_ void **, char * _*/);
extern sqlgs2t(/*_ void **, char * _*/);
extern sqlorat(/*_ void **, unsigned long *, void * _*/);

/* Forms Interface */
static int IAPSUCC = 0;
static int IAPFAIL = 1403;
static int IAPFTL  = 535;
extern void sqliem(/*_ char *, int * _*/);

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{10,4242,0,0,0,
5,0,0,1,63,0,4,170,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,104,0,4,217,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
47,0,0,3,116,0,4,233,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
74,0,0,4,68,0,2,261,0,0,0,0,0,1,0,
89,0,0,5,165,0,3,321,0,0,8,8,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,
136,0,0,6,161,0,5,331,0,0,6,6,0,1,0,1,3,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,3,0,0,
175,0,0,7,116,0,5,343,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,3,0,0,
206,0,0,8,790,0,3,419,0,0,17,17,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
289,0,0,9,535,0,3,497,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,
316,0,0,10,150,0,4,569,0,0,5,3,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,3,0,0,
351,0,0,11,50,0,3,589,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
392,0,0,12,0,0,29,599,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header =====================================
 PROGRAM-NAME   : PCALC2ERP(INSA->ERP Interface Program)
 PROGRM-Decription : 월급여내역을 계정별로 전표를 생성
 USAGE          : pcalc2erp DBUserID 작업자사번 회계년월
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여
 Programmer     : 이랑교
 Version        : 1.00
 Date           : 1999.02.11

Update Contents

   Version    date(yy.mm.dd)     programmer      description
   1.00       1999.02.11         이랑교          최초작성 
   1.00       2002.03.21         유효성          신재무시스템으로 변경(ERP->HAIS)
   1.01       2004.02.24         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.    
   1.02       2004.04.26         강륜종         MIS2 장비에 맞게 경로 및 환경 설정...   
                                                EXEC SQL ROLLBACK WORK; EXEC SQL COMMIT WORK;  주석처리...      
   10.00       2004.11.     강륜종(dsa2000)     Rexec대체 서비스를 위한 수정작업.                                                
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

void CreateLog(void);
void InitVariables(void);
void Initialize(void);
void DeleteTmp(void);
void WriteLog(char *message);

int WriteControl(int gubun);
int WritePkmpcalc(void);

/* EXEC SQL INCLUDE sqlca;
 */ 
/*
 * $Header: sqlca.h,v 1.3 1994/12/12 19:27:27 jbasu Exp $ sqlca.h 
 */

/* Copyright (c) 1985,1986, 1998 by Oracle Corporation. */
 
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


/****************************************************************************** 
  Interface Control Table Variables
******************************************************************************/ 
char	v_dt_create[9];			/* 생성일자 */
char	v_cd_data[5] = "GL09";		/* 인건비 Data Code */
int	v_no_crt_srl = 0;		/* 생성 일련번호 */
char	v_ym_acct[7];			/* 회계년월 */
int	v_cnt_line = 0;			/* Line건수 */ 
char	v_ph_proc[2] = "A";		/* 처리단계 */
char	v_st_proc[2] = "P";		/* 처리상태 (P:Processing, N:Normal Termination, A:Abnormal Termination) */
char	v_cl_data_use[2] = "A";		/* Data 활용구분 */
char	v_id_crt_user[5];		/* 생성 UserID */

/****************************************************************************** 
  Interface Table Variables
******************************************************************************/ 
char	v_rst_validation[2] = "A";

/****************************************************************************** 
  CONST Variables
******************************************************************************/ 
char	v_currency[4]	= "KRW";	/*화폐명*/
char	v_corpcode[3]	= "10";		/*회사코드 하나로통신(주)*/
char	v_activity[6]	= "00000";	/*기능(활동)*/
char	v_service[5]	= "0000";	/*서비스*/
char	v_method[2]	= "0";		/*매체*/
char	v_customer[3]	= "00";		/*고객군*/
char	v_tele[4]	= "000";	/*전화국*/
char	v_outaccount[31]= "414-11-00112-0(당좌수표)";	
	/*출금계좌번호 not used 변경시 erp_accno의 acntno를 바꾼다.*/
double	v_amt_tot	= 0;		/* 대변total 금액*/
double	v_amt_tot_cr	= 0;		/* 차변total 금액*/
 
/* EXEC SQL END   DECLARE SECTION; */ 


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
/*char	logdir[100] = "/hper/insa/ERP/log/";*/
char    *HOMEDIR;
char	logfile[40];
char	logfile_fullname[140];
int	id;
char	buff[1000];
char	arg_ym_acct[7];
char	paydate[9];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[300]       = "";
int     seqno = 0; 

/***** Log File Pointer *****/
FILE *fp;	

void main(int argc, char *argv[])
{
	char curdatetime[15];
	
	/* printf("Program Start......................................... >\n");  */
	if (argc != 6) {  /* /hper8/HINSA/proc/bin/ERPbin/pcalc2erp 200410 20041025 D006 pcalc2erp 2004110100000 */
	   printf("[Usage] : pcalc2erp 1.회계년월(YYYYMM) 2.지급일 3.작업자 4.progid 5.시작시간\n");
	   fclose(fp);
	   exit(1);	 	   
	}
	
	memset(arg_ym_acct, NULL, sizeof(arg_ym_acct));
	sprintf(arg_ym_acct, "%s", argv[1]);

	memset(paydate, NULL, sizeof(paydate));
	sprintf(paydate, "%s", argv[2]);

	/* Dsa2000  2004.02.24.	**********************************/
	/* DB_connect(id,0); */
 	hinsa_log_print(0,"계정/부서별로 전표를 생성 시작...");          
        hinsa_db_connect();  /*DB Connect 실시..*/
	/*dsa2000  수정..End......................................*/ 	
	
	InitVariables();		/* 변수 초기화 */
	Initialize();			/* 초기화 루틴 */
	
	/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
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

	DeleteTmp();

	sprintf(v_id_crt_user, argv[3]);	/* 작업자사번 */

	if (WriteControl(0) == -1) {		/* 초기값 세팅 */
		fclose(fp);
		exit(1);
	}
	
	if (WritePkmpcalc() == -1)
	{
		WriteControl(2);	/* 비정상종료 */
		sprintf(log_buff, " ERROR ");
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
                error_quit("ERROR ====== [ 작업 실패 ROLLBACK ] =====\n");		/*Dsa2000*/
	}                
	else
	{
		WriteControl(1); 	/* 정상종료 */	
		sprintf(log_buff, "OK ====== [ 작업 완료 COMMIT ] =====");
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           	
           	/*** 종료시간 Print dsa2000 Add ***************************/
        	/* EXEC SQL  
        	SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
          	  INTO :curdatetime
          	  FROM DUAL; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 10;
         sqlstm.arrsiz = 1;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0\
  from DUAL ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )5;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)256;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (         void  *)curdatetime;
         sqlstm.sqhstl[0] = (unsigned int  )15;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         void  *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned int  )0;
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



        	sprintf(log_buff, "종료시간 : %.14s \n ",curdatetime);
        	WriteLog(log_buff);
        	Write_batlog(seqno++, log_buff); 
        	/*********************************************************/
        
		hinsa_exit(0,"OK ====== [ 작업 완료 COMMIT ] =====\n");		/*Dsa2000*/
		
	}

	fclose(fp);
	           	
}

void CreateLog()
{
	HOMEDIR = hinsa_home();
	strcat(HOMEDIR,"/log/ERPlog/");
	
	/* 로그파일명을 세팅 */
	sprintf(logfile_fullname, "%spcalc2erp%s%02d.log", HOMEDIR, v_dt_create, v_no_crt_srl); 
	/* 로그파일 오픈 */
	fp = fopen(logfile_fullname, "w+");

	if (fp == NULL) {
		printf("로그파일오픈(%s) 에러\n", logfile_fullname);
		sprintf(log_buff, "로그파일오픈(%s) 에러\n", logfile_fullname);
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		exit(1);
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
	/* EXEC SQL 
	SELECT	TO_CHAR(SYSDATE, 'YYYYMMDD') DT_CREATE,  
		TO_CHAR(SYSDATE, 'YYYYMM') YM_ACCT	
	INTO   	:v_dt_create, :v_ym_acct
	FROM	DUAL; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 2;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDD') DT_CREATE ,TO_CHAR(SYSDA\
TE,'YYYYMM') YM_ACCT into :b0,:b1  from DUAL ";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )24;
 sqlstm.selerr = (unsigned short)0;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)v_dt_create;
 sqlstm.sqhstl[0] = (unsigned int  )9;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
 sqlstm.sqadto[0] = (unsigned short )0;
 sqlstm.sqtdso[0] = (unsigned short )0;
 sqlstm.sqhstv[1] = (         void  *)v_ym_acct;
 sqlstm.sqhstl[1] = (unsigned int  )7;
 sqlstm.sqhsts[1] = (         int  )0;
 sqlstm.sqindv[1] = (         void  *)0;
 sqlstm.sqinds[1] = (         int  )0;
 sqlstm.sqharm[1] = (unsigned int  )0;
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



	if (strcmp(arg_ym_acct, "000000") != 0)
		sprintf(v_ym_acct, "%s", arg_ym_acct);

	if (sqlca.sqlcode != 0)
	{
		printf("ORA-%05d - 현재날짜 가져오기  Error\n", sqlca.sqlcode);
		fclose(fp);
		exit(1);
	}

	/* EXEC SQL 
	SELECT	NVL(MAX(NO_CRT_SRL),0) /oMAX(NO_CRT_SRL)o/
	INTO	:v_no_crt_srl	
	FROM	HIT_CTRL@HAIS	/o  FROM	HIT_CTRL_TEST   /o 테스트시에 사용 o/
	WHERE	DT_CREATE = TO_DATE(:v_dt_create, 'YYYYMMDD')
	  AND	CD_DATA = :v_cd_data; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 3;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "select NVL(max(NO_CRT_SRL),0) into :b0  from HIT_CTRL@HAIS \
where (DT_CREATE=TO_DATE(:b1,'YYYYMMDD') and CD_DATA=:b2)";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )47;
 sqlstm.selerr = (unsigned short)0;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)&v_no_crt_srl;
 sqlstm.sqhstl[0] = (unsigned int  )sizeof(int);
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
 sqlstm.sqadto[0] = (unsigned short )0;
 sqlstm.sqtdso[0] = (unsigned short )0;
 sqlstm.sqhstv[1] = (         void  *)v_dt_create;
 sqlstm.sqhstl[1] = (unsigned int  )9;
 sqlstm.sqhsts[1] = (         int  )0;
 sqlstm.sqindv[1] = (         void  *)0;
 sqlstm.sqinds[1] = (         int  )0;
 sqlstm.sqharm[1] = (unsigned int  )0;
 sqlstm.sqadto[1] = (unsigned short )0;
 sqlstm.sqtdso[1] = (unsigned short )0;
 sqlstm.sqhstv[2] = (         void  *)v_cd_data;
 sqlstm.sqhstl[2] = (unsigned int  )5;
 sqlstm.sqhsts[2] = (         int  )0;
 sqlstm.sqindv[2] = (         void  *)0;
 sqlstm.sqinds[2] = (         int  )0;
 sqlstm.sqharm[2] = (unsigned int  )0;
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



	if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1403) && (sqlca.sqlcode != -1405)) {
		printf("ORA-%05d - MAX Serial# 가져오기  Error\n", sqlca.sqlcode);
		sprintf(log_buff, "ORA-%05d - MAX Serial# 가져오기  Error\n", sqlca.sqlcode);
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		fclose(fp);
		exit(1);
	} 
	v_no_crt_srl++;	/* 현재날짜의 생성일련번호 + 1 */
	printf("v_no_crt_srl : %d \n",v_no_crt_srl);
}

void WriteLog(char *message)
{
	fprintf(fp, "%s", message);
}

void DeleteTmp(void)
{
	sprintf(buff, "< DeleteTmp Starting >----------------\n");
	WriteLog(buff);

	/* EXEC SQL
	DELETE FROM ERP_HGL_GL09		/o TEMP Table에서 3년이상 이상 o/
	WHERE DT_CREATE < ADD_MONTHS(SYSDATE,-36); */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 3;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "delete  from ERP_HGL_GL09  where DT_CREATE<ADD_MONTHS(SYSDA\
TE,(-36))";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )74;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  /* 지난 데이타는 삭제한다.*/

	if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
	{
		printf("Fail!! < Program failed 1.........................................%d >\n",sqlca.sqlcode);
		sprintf(log_buff, "ORA-%05d - 임시테이블삭제 Error\n", sqlca.sqlcode);
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog(log_buff);
		fclose(fp);
		exit(1);
	}

	/*EXEC SQL COMMIT WORK;
	if (sqlca.sqlcode != 0)
	{
		printf("Fail!! < Program failed2......................................... >\n");
		sprintf(buff, "ORA-%05d - 임시테이블삭제 Commit Error\n", sqlca.sqlcode);
		WriteLog(buff);
		fclose(fp);
		exit(1);
	}*/

	sprintf(buff, "< DeleteTmp Ending >----------------\n");
	WriteLog(buff);
}

int WriteControl(int gubun)
{
	sprintf(buff, "< WriteControl Starting (Gubun : %d) >----------------\n", gubun);
	WriteLog(buff);
	
	printf("gubun : %d\n",gubun);
	if (gubun == 1)
		sprintf(v_st_proc, "N");
	else if (gubun == 2)
		sprintf(v_st_proc, "A");

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

	if (gubun == 0) {	/* 작업시작시 Control Table Insert */

		/* EXEC SQL
		INSERT INTO HIT_CTRL@HAIS   /o	INSERT INTO HIT_CTRL_TEST   /o 테스트시에 사용 o/
			(DT_CREATE, CD_DATA, NO_CRT_SRL, YM_ACCT,
			PH_PROC, ST_PROC, CL_DATA_USE,  ID_CRT_USER)
		VALUES	(TO_DATE(:v_dt_create, 'YYYYMMDD'), 
			:v_cd_data, :v_no_crt_srl, :v_ym_acct,
			:v_ph_proc, :v_st_proc, :v_cl_data_use,	:v_id_crt_user); */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 10;
  sqlstm.arrsiz = 8;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "insert into HIT_CTRL@HAIS (DT_CREATE,CD_DATA,NO_CRT_SRL,YM\
_ACCT,PH_PROC,ST_PROC,CL_DATA_USE,ID_CRT_USER) values (TO_DATE(:b0,'YYYYMMDD'\
),:b1,:b2,:b3,:b4,:b5,:b6,:b7)";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )89;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)256;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (         void  *)v_dt_create;
  sqlstm.sqhstl[0] = (unsigned int  )9;
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         void  *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned int  )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (         void  *)v_cd_data;
  sqlstm.sqhstl[1] = (unsigned int  )5;
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         void  *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned int  )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (         void  *)&v_no_crt_srl;
  sqlstm.sqhstl[2] = (unsigned int  )sizeof(int);
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         void  *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned int  )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (         void  *)v_ym_acct;
  sqlstm.sqhstl[3] = (unsigned int  )7;
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         void  *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned int  )0;
  sqlstm.sqadto[3] = (unsigned short )0;
  sqlstm.sqtdso[3] = (unsigned short )0;
  sqlstm.sqhstv[4] = (         void  *)v_ph_proc;
  sqlstm.sqhstl[4] = (unsigned int  )2;
  sqlstm.sqhsts[4] = (         int  )0;
  sqlstm.sqindv[4] = (         void  *)0;
  sqlstm.sqinds[4] = (         int  )0;
  sqlstm.sqharm[4] = (unsigned int  )0;
  sqlstm.sqadto[4] = (unsigned short )0;
  sqlstm.sqtdso[4] = (unsigned short )0;
  sqlstm.sqhstv[5] = (         void  *)v_st_proc;
  sqlstm.sqhstl[5] = (unsigned int  )2;
  sqlstm.sqhsts[5] = (         int  )0;
  sqlstm.sqindv[5] = (         void  *)0;
  sqlstm.sqinds[5] = (         int  )0;
  sqlstm.sqharm[5] = (unsigned int  )0;
  sqlstm.sqadto[5] = (unsigned short )0;
  sqlstm.sqtdso[5] = (unsigned short )0;
  sqlstm.sqhstv[6] = (         void  *)v_cl_data_use;
  sqlstm.sqhstl[6] = (unsigned int  )2;
  sqlstm.sqhsts[6] = (         int  )0;
  sqlstm.sqindv[6] = (         void  *)0;
  sqlstm.sqinds[6] = (         int  )0;
  sqlstm.sqharm[6] = (unsigned int  )0;
  sqlstm.sqadto[6] = (unsigned short )0;
  sqlstm.sqtdso[6] = (unsigned short )0;
  sqlstm.sqhstv[7] = (         void  *)v_id_crt_user;
  sqlstm.sqhstl[7] = (unsigned int  )5;
  sqlstm.sqhsts[7] = (         int  )0;
  sqlstm.sqindv[7] = (         void  *)0;
  sqlstm.sqinds[7] = (         int  )0;
  sqlstm.sqharm[7] = (unsigned int  )0;
  sqlstm.sqadto[7] = (unsigned short )0;
  sqlstm.sqtdso[7] = (unsigned short )0;
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



	} else if (gubun == 1) {	/* 정상종료시 Control Table Update */

		/* EXEC SQL
		UPDATE	HIT_CTRL@HAIS   /o	UPDATE	HIT_CTRL_TEST   /o 테스트시에 사용 o/
		SET	CNT_LINE = :v_cnt_line,		/o 처리건수 o/
			AMT_TOT  = :v_amt_tot,		/o TOTAL 금액 o/
			ST_PROC  = :v_st_proc,		/o 처리상태 "N" o/	
			DT_CRT_COMP = SYSDATE		/o 작업완료일자 o/
		WHERE	DT_CREATE = TO_DATE(:v_dt_create, 'YYYYMMDD')
		  AND	CD_DATA = :v_cd_data
		  AND	NO_CRT_SRL = :v_no_crt_srl; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 10;
  sqlstm.arrsiz = 8;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "update HIT_CTRL@HAIS  set CNT_LINE=:b0,AMT_TOT=:b1,ST_PROC\
=:b2,DT_CRT_COMP=SYSDATE where ((DT_CREATE=TO_DATE(:b3,'YYYYMMDD') and CD_DAT\
A=:b4) and NO_CRT_SRL=:b5)";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )136;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)256;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (         void  *)&v_cnt_line;
  sqlstm.sqhstl[0] = (unsigned int  )sizeof(int);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         void  *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned int  )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (         void  *)&v_amt_tot;
  sqlstm.sqhstl[1] = (unsigned int  )sizeof(double);
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         void  *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned int  )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (         void  *)v_st_proc;
  sqlstm.sqhstl[2] = (unsigned int  )2;
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         void  *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned int  )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (         void  *)v_dt_create;
  sqlstm.sqhstl[3] = (unsigned int  )9;
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         void  *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned int  )0;
  sqlstm.sqadto[3] = (unsigned short )0;
  sqlstm.sqtdso[3] = (unsigned short )0;
  sqlstm.sqhstv[4] = (         void  *)v_cd_data;
  sqlstm.sqhstl[4] = (unsigned int  )5;
  sqlstm.sqhsts[4] = (         int  )0;
  sqlstm.sqindv[4] = (         void  *)0;
  sqlstm.sqinds[4] = (         int  )0;
  sqlstm.sqharm[4] = (unsigned int  )0;
  sqlstm.sqadto[4] = (unsigned short )0;
  sqlstm.sqtdso[4] = (unsigned short )0;
  sqlstm.sqhstv[5] = (         void  *)&v_no_crt_srl;
  sqlstm.sqhstl[5] = (unsigned int  )sizeof(int);
  sqlstm.sqhsts[5] = (         int  )0;
  sqlstm.sqindv[5] = (         void  *)0;
  sqlstm.sqinds[5] = (         int  )0;
  sqlstm.sqharm[5] = (unsigned int  )0;
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



	} else if (gubun == 2) {	/* 비정상종료시 Control Table Update */

		/* EXEC SQL
		UPDATE	HIT_CTRL@HAIS   /o	UPDATE	HIT_CTRL_TEST   /o 테스트시에 사용 o/
		SET	ST_PROC   = :v_st_proc	/o 처리상태를 "A"로 세팅 o/	
		WHERE	DT_CREATE = TO_DATE(:v_dt_create, 'YYYYMMDD')
		  AND	CD_DATA   = :v_cd_data
		  AND	NO_CRT_SRL = :v_no_crt_srl; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 10;
  sqlstm.arrsiz = 8;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "update HIT_CTRL@HAIS  set ST_PROC=:b0 where ((DT_CREATE=TO\
_DATE(:b1,'YYYYMMDD') and CD_DATA=:b2) and NO_CRT_SRL=:b3)";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )175;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)256;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (         void  *)v_st_proc;
  sqlstm.sqhstl[0] = (unsigned int  )2;
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         void  *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned int  )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (         void  *)v_dt_create;
  sqlstm.sqhstl[1] = (unsigned int  )9;
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         void  *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned int  )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (         void  *)v_cd_data;
  sqlstm.sqhstl[2] = (unsigned int  )5;
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         void  *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned int  )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (         void  *)&v_no_crt_srl;
  sqlstm.sqhstl[3] = (unsigned int  )sizeof(int);
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         void  *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned int  )0;
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



	}

	if (sqlca.sqlcode != 0) {
		sprintf(log_buff, "ORA-%05d - Control Table Error ( Gubun : %d )\n",sqlca.sqlcode, gubun);
		WriteLog(log_buff);
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		/*EXEC SQL ROLLBACK WORK;*/		
		return(-1);
	} else {
		sprintf(log_buff, "< WriteControl Ending (Gubun : %d) >------------------\n", gubun);
           	WriteLog(log_buff);
           	Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/

		/*EXEC SQL COMMIT WORK;*/

		if (gubun == 1) { 
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
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, " =========================================================== \n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, "                           작업결과                          \n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, "  작업일 :[%s] 자료구분[%s] 일련번호[%d]   \n", v_dt_create,v_cd_data,v_no_crt_srl);
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, " =========================================================== \n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, "      건 수    대변총액   차변총액  \n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, "        %-4d      %-15.0f    %-15.0f     \n", v_cnt_line,v_amt_tot,v_amt_tot_cr);
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, " =========================================================== \n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           		sprintf(log_buff, "OK!! < Program ended successfully.......................... >\n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
           	
		} else if (gubun == 2) {
			printf("Fail!! < Program failed.4........................................ >\n");
			sprintf(log_buff, "Fail!! < Program failed......................................... >\n");
           		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
			WriteLog("Fail!! < Program failed......................................... >\n");			
		}
		return(0);
	}
}

int WritePkmpcalc(void)
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

	/* EXEC SQL INSERT INTO ERP_HGL_GL09 (	/o Write TEMP Pkmpcalc Table o/
		DT_CREATE,
		CD_DATA,
		NO_CRT_SRL,
		HEADER_NAME,
		DT_ACCOUNTING,
		NO_LINE,
		CURRENCY,
		SEGMENT1,
		SEGMENT2,
		SEGMENT3,
		SEGMENT4,
		SEGMENT5,
		SEGMENT6,
		SEGMENT7,
		SEGMENT8,
		ENTERED_DR,
		ENTERED_CR,
		OUT_ACCOUNT,
		RST_VALIDATION )
	SELECT
 		TO_DATE(:v_dt_create, 'YYYYMMDD') DT_CREATE,
		:v_cd_data CD_DATA,                                  
		:v_no_crt_srl,                                       
	/o2000.7.14. 7월,11월 체단비는 header name을 체단비로 변경...	
	        :v_cd_data||'-'||substr(:paydate,1,6)||decode(
							substr(:paydate,7,2),'10','-명절연봉','-급여'),  o/
		:v_cd_data||'-'||substr(:paydate,1,6)||decode(
		                                        substr(:paydate,7,2),'10',
		                                         decode(substr(:paydate,5,2),'07','-체단비','11','-체단비','-명절연봉'),'-급여'), 					
		TO_DATE(:paydate, 'YYYYMMDD'),  
		rownum,                                              
		:v_currency,                                         
		:v_corpcode,                                         
		fincode,                                             
		:v_activity,                                         
		accno,                                               
		:v_service,                                          
		:v_method,                                           
		:v_customer,                                         
		:v_tele,                                             
		decode(debityn,'0',nvl(accnosum,0),0) debit,         
		decode(debityn,'1',nvl(accnosum,0),0) credit,        
/o 02/29/2000 9:21오전 계정이 현금.당좌일때만 출금계좌가 나타나게 
		:v_outaccount,           o/
		decode(accno,'111120',:v_outaccount,''),
		:v_rst_validation RST_VALIDATION  
	FROM	V_ERP_ACCNO A,                                      
		 (	SELECT ACCNO ACCNOB ,MAX(DEBITYN)  DEBITYN  
			FROM ERP_ACCNO GROUP BY ACCNO )
	WHERE   A.ACCNO = ACCNOB
/o =====================================================================
   Version    date(yy.mm.dd)     programmer      description
   30.00      2000.01.25           유효성       (-) 금액 포함 
============================================================================= o/
	/o AND	NVL(ACCNOSUM,0) > 0 ; o/
	AND	NVL(ACCNOSUM,0) <> 0 ; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 17;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "insert into ERP_HGL_GL09 (DT_CREATE,CD_DATA,NO_CRT_SRL,HEAD\
ER_NAME,DT_ACCOUNTING,NO_LINE,CURRENCY,SEGMENT1,SEGMENT2,SEGMENT3,SEGMENT4,SE\
GMENT5,SEGMENT6,SEGMENT7,SEGMENT8,ENTERED_DR,ENTERED_CR,OUT_ACCOUNT,RST_VALID\
ATION)select TO_DATE(:b0,'YYYYMMDD') DT_CREATE ,:b1 CD_DATA ,:b2 ,(((:b1||'-'\
)||substr(:b4,1,6))||decode(substr(:b4,7,2),'10',decode(substr(:b4,5,2),'07',\
'-체단비','11','-체단비','-명절연봉'),'-급여')) ,TO_DATE(:b4,'YYYYMMDD') ,row\
num ,:b8 ,:b9 ,fincode ,:b10 ,accno ,:b11 ,:b12 ,:b13 ,:b14 ,decode(debityn,'\
0',nvl(accnosum,0),0) debit ,decode(debityn,'1',nvl(accnosum,0),0) credit ,de\
code(accno,'111120',:b15,'') ,:b16 RST_VALIDATION  from V_ERP_ACCNO A ,(selec\
t ACCNO ACCNOB ,max(DEBITYN) DEBITYN  from ERP_ACCNO  group by ACCNO) where (\
A.ACCNO=ACCNOB and NVL(ACCNOSUM,0)<>0)";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )206;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)v_dt_create;
 sqlstm.sqhstl[0] = (unsigned int  )9;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
 sqlstm.sqadto[0] = (unsigned short )0;
 sqlstm.sqtdso[0] = (unsigned short )0;
 sqlstm.sqhstv[1] = (         void  *)v_cd_data;
 sqlstm.sqhstl[1] = (unsigned int  )5;
 sqlstm.sqhsts[1] = (         int  )0;
 sqlstm.sqindv[1] = (         void  *)0;
 sqlstm.sqinds[1] = (         int  )0;
 sqlstm.sqharm[1] = (unsigned int  )0;
 sqlstm.sqadto[1] = (unsigned short )0;
 sqlstm.sqtdso[1] = (unsigned short )0;
 sqlstm.sqhstv[2] = (         void  *)&v_no_crt_srl;
 sqlstm.sqhstl[2] = (unsigned int  )sizeof(int);
 sqlstm.sqhsts[2] = (         int  )0;
 sqlstm.sqindv[2] = (         void  *)0;
 sqlstm.sqinds[2] = (         int  )0;
 sqlstm.sqharm[2] = (unsigned int  )0;
 sqlstm.sqadto[2] = (unsigned short )0;
 sqlstm.sqtdso[2] = (unsigned short )0;
 sqlstm.sqhstv[3] = (         void  *)v_cd_data;
 sqlstm.sqhstl[3] = (unsigned int  )5;
 sqlstm.sqhsts[3] = (         int  )0;
 sqlstm.sqindv[3] = (         void  *)0;
 sqlstm.sqinds[3] = (         int  )0;
 sqlstm.sqharm[3] = (unsigned int  )0;
 sqlstm.sqadto[3] = (unsigned short )0;
 sqlstm.sqtdso[3] = (unsigned short )0;
 sqlstm.sqhstv[4] = (         void  *)paydate;
 sqlstm.sqhstl[4] = (unsigned int  )9;
 sqlstm.sqhsts[4] = (         int  )0;
 sqlstm.sqindv[4] = (         void  *)0;
 sqlstm.sqinds[4] = (         int  )0;
 sqlstm.sqharm[4] = (unsigned int  )0;
 sqlstm.sqadto[4] = (unsigned short )0;
 sqlstm.sqtdso[4] = (unsigned short )0;
 sqlstm.sqhstv[5] = (         void  *)paydate;
 sqlstm.sqhstl[5] = (unsigned int  )9;
 sqlstm.sqhsts[5] = (         int  )0;
 sqlstm.sqindv[5] = (         void  *)0;
 sqlstm.sqinds[5] = (         int  )0;
 sqlstm.sqharm[5] = (unsigned int  )0;
 sqlstm.sqadto[5] = (unsigned short )0;
 sqlstm.sqtdso[5] = (unsigned short )0;
 sqlstm.sqhstv[6] = (         void  *)paydate;
 sqlstm.sqhstl[6] = (unsigned int  )9;
 sqlstm.sqhsts[6] = (         int  )0;
 sqlstm.sqindv[6] = (         void  *)0;
 sqlstm.sqinds[6] = (         int  )0;
 sqlstm.sqharm[6] = (unsigned int  )0;
 sqlstm.sqadto[6] = (unsigned short )0;
 sqlstm.sqtdso[6] = (unsigned short )0;
 sqlstm.sqhstv[7] = (         void  *)paydate;
 sqlstm.sqhstl[7] = (unsigned int  )9;
 sqlstm.sqhsts[7] = (         int  )0;
 sqlstm.sqindv[7] = (         void  *)0;
 sqlstm.sqinds[7] = (         int  )0;
 sqlstm.sqharm[7] = (unsigned int  )0;
 sqlstm.sqadto[7] = (unsigned short )0;
 sqlstm.sqtdso[7] = (unsigned short )0;
 sqlstm.sqhstv[8] = (         void  *)v_currency;
 sqlstm.sqhstl[8] = (unsigned int  )4;
 sqlstm.sqhsts[8] = (         int  )0;
 sqlstm.sqindv[8] = (         void  *)0;
 sqlstm.sqinds[8] = (         int  )0;
 sqlstm.sqharm[8] = (unsigned int  )0;
 sqlstm.sqadto[8] = (unsigned short )0;
 sqlstm.sqtdso[8] = (unsigned short )0;
 sqlstm.sqhstv[9] = (         void  *)v_corpcode;
 sqlstm.sqhstl[9] = (unsigned int  )3;
 sqlstm.sqhsts[9] = (         int  )0;
 sqlstm.sqindv[9] = (         void  *)0;
 sqlstm.sqinds[9] = (         int  )0;
 sqlstm.sqharm[9] = (unsigned int  )0;
 sqlstm.sqadto[9] = (unsigned short )0;
 sqlstm.sqtdso[9] = (unsigned short )0;
 sqlstm.sqhstv[10] = (         void  *)v_activity;
 sqlstm.sqhstl[10] = (unsigned int  )6;
 sqlstm.sqhsts[10] = (         int  )0;
 sqlstm.sqindv[10] = (         void  *)0;
 sqlstm.sqinds[10] = (         int  )0;
 sqlstm.sqharm[10] = (unsigned int  )0;
 sqlstm.sqadto[10] = (unsigned short )0;
 sqlstm.sqtdso[10] = (unsigned short )0;
 sqlstm.sqhstv[11] = (         void  *)v_service;
 sqlstm.sqhstl[11] = (unsigned int  )5;
 sqlstm.sqhsts[11] = (         int  )0;
 sqlstm.sqindv[11] = (         void  *)0;
 sqlstm.sqinds[11] = (         int  )0;
 sqlstm.sqharm[11] = (unsigned int  )0;
 sqlstm.sqadto[11] = (unsigned short )0;
 sqlstm.sqtdso[11] = (unsigned short )0;
 sqlstm.sqhstv[12] = (         void  *)v_method;
 sqlstm.sqhstl[12] = (unsigned int  )2;
 sqlstm.sqhsts[12] = (         int  )0;
 sqlstm.sqindv[12] = (         void  *)0;
 sqlstm.sqinds[12] = (         int  )0;
 sqlstm.sqharm[12] = (unsigned int  )0;
 sqlstm.sqadto[12] = (unsigned short )0;
 sqlstm.sqtdso[12] = (unsigned short )0;
 sqlstm.sqhstv[13] = (         void  *)v_customer;
 sqlstm.sqhstl[13] = (unsigned int  )3;
 sqlstm.sqhsts[13] = (         int  )0;
 sqlstm.sqindv[13] = (         void  *)0;
 sqlstm.sqinds[13] = (         int  )0;
 sqlstm.sqharm[13] = (unsigned int  )0;
 sqlstm.sqadto[13] = (unsigned short )0;
 sqlstm.sqtdso[13] = (unsigned short )0;
 sqlstm.sqhstv[14] = (         void  *)v_tele;
 sqlstm.sqhstl[14] = (unsigned int  )4;
 sqlstm.sqhsts[14] = (         int  )0;
 sqlstm.sqindv[14] = (         void  *)0;
 sqlstm.sqinds[14] = (         int  )0;
 sqlstm.sqharm[14] = (unsigned int  )0;
 sqlstm.sqadto[14] = (unsigned short )0;
 sqlstm.sqtdso[14] = (unsigned short )0;
 sqlstm.sqhstv[15] = (         void  *)v_outaccount;
 sqlstm.sqhstl[15] = (unsigned int  )31;
 sqlstm.sqhsts[15] = (         int  )0;
 sqlstm.sqindv[15] = (         void  *)0;
 sqlstm.sqinds[15] = (         int  )0;
 sqlstm.sqharm[15] = (unsigned int  )0;
 sqlstm.sqadto[15] = (unsigned short )0;
 sqlstm.sqtdso[15] = (unsigned short )0;
 sqlstm.sqhstv[16] = (         void  *)v_rst_validation;
 sqlstm.sqhstl[16] = (unsigned int  )2;
 sqlstm.sqhsts[16] = (         int  )0;
 sqlstm.sqindv[16] = (         void  *)0;
 sqlstm.sqinds[16] = (         int  )0;
 sqlstm.sqharm[16] = (unsigned int  )0;
 sqlstm.sqadto[16] = (unsigned short )0;
 sqlstm.sqtdso[16] = (unsigned short )0;
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

	if (sqlca.sqlcode != 0) {	/* 에러이면 */
		sprintf(log_buff, "ORA-%05d - Insert TEMP 인건비 Error--------\n", sqlca.sqlcode);
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog(log_buff);
		/*EXEC SQL ROLLBACK WORK;*/
		return(-1);
	} else {			/* 에러가 아니면 */
		v_cnt_line = sqlca.sqlerrd[2];
		WriteLog("Insert TEMP 인건비 Success\n");
		sprintf(log_buff, "Process Count : %d\n", v_cnt_line);
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog(log_buff);
		/*EXEC SQL COMMIT WORK;*/
	}

	/* **********************************************************************
	* Write ERP 인건비 Table *
	* **********************************************************************/
	/* EXEC SQL INSERT INTO HGL_GL09@HAIS (    /oEXEC SQL INSERT INTO HGL_GL09 (  /o 테스트시에 사용 o/
		DT_CREATE,
		CD_DATA,
		NO_CRT_SRL,
		HEADER_NAME,
		DT_ACCOUNTING,
		NO_LINE,
		CURRENCY,
		SEGMENT1,
		SEGMENT2,
		SEGMENT3,
		SEGMENT4,
		SEGMENT5,
		SEGMENT6,
		SEGMENT7,
		SEGMENT8,
		ENTERED_DR,
		ENTERED_CR,
		OUT_ACCOUNT,
		RST_VALIDATION
	) SELECT
		DT_CREATE,
		CD_DATA,
		NO_CRT_SRL,
		HEADER_NAME,
		DT_ACCOUNTING,
		NO_LINE,
		CURRENCY,
		SEGMENT1,
		SEGMENT2,
		SEGMENT3,
		SEGMENT4,
		SEGMENT5,
		SEGMENT6,
		SEGMENT7,
		SEGMENT8,
		ENTERED_DR,
		ENTERED_CR,
		OUT_ACCOUNT,
		RST_VALIDATION
	FROM	ERP_HGL_GL09
	WHERE	DT_CREATE = TO_DATE(:v_dt_create, 'YYYYMMDD')
	  AND	CD_DATA    = :v_cd_data
	  AND	NO_CRT_SRL = :v_no_crt_srl; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 17;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "insert into HGL_GL09@HAIS (DT_CREATE,CD_DATA,NO_CRT_SRL,HEA\
DER_NAME,DT_ACCOUNTING,NO_LINE,CURRENCY,SEGMENT1,SEGMENT2,SEGMENT3,SEGMENT4,S\
EGMENT5,SEGMENT6,SEGMENT7,SEGMENT8,ENTERED_DR,ENTERED_CR,OUT_ACCOUNT,RST_VALI\
DATION)select DT_CREATE ,CD_DATA ,NO_CRT_SRL ,HEADER_NAME ,DT_ACCOUNTING ,NO_\
LINE ,CURRENCY ,SEGMENT1 ,SEGMENT2 ,SEGMENT3 ,SEGMENT4 ,SEGMENT5 ,SEGMENT6 ,S\
EGMENT7 ,SEGMENT8 ,ENTERED_DR ,ENTERED_CR ,OUT_ACCOUNT ,RST_VALIDATION  from \
ERP_HGL_GL09 where ((DT_CREATE=TO_DATE(:b0,'YYYYMMDD') and CD_DATA=:b1) and N\
O_CRT_SRL=:b2)";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )289;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)v_dt_create;
 sqlstm.sqhstl[0] = (unsigned int  )9;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
 sqlstm.sqadto[0] = (unsigned short )0;
 sqlstm.sqtdso[0] = (unsigned short )0;
 sqlstm.sqhstv[1] = (         void  *)v_cd_data;
 sqlstm.sqhstl[1] = (unsigned int  )5;
 sqlstm.sqhsts[1] = (         int  )0;
 sqlstm.sqindv[1] = (         void  *)0;
 sqlstm.sqinds[1] = (         int  )0;
 sqlstm.sqharm[1] = (unsigned int  )0;
 sqlstm.sqadto[1] = (unsigned short )0;
 sqlstm.sqtdso[1] = (unsigned short )0;
 sqlstm.sqhstv[2] = (         void  *)&v_no_crt_srl;
 sqlstm.sqhstl[2] = (unsigned int  )sizeof(int);
 sqlstm.sqhsts[2] = (         int  )0;
 sqlstm.sqindv[2] = (         void  *)0;
 sqlstm.sqinds[2] = (         int  )0;
 sqlstm.sqharm[2] = (unsigned int  )0;
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




	if (sqlca.sqlcode != 0) {	/* 에러이면 */
		v_cnt_line = 0;

		sprintf(log_buff, "ORA-%05d - Insert ERP 인건비 Error\n", sqlca.sqlcode);
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog(log_buff);
		/*EXEC SQL ROLLBACK WORK;*/
		return(-1);
	} else {			/* 에러가 아니면 */
		if (v_cnt_line != sqlca.sqlerrd[2]) {
			sprintf(log_buff, "TEMP/ERP테이블에 Insert된 건수가 다릅니다.\n");
			Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
			WriteLog("TEMP/ERP테이블에 Insert된 건수가 다릅니다.\n");
			/*EXEC SQL ROLLBACK WORK;*/
			return(-1);

		}
		WriteLog("Insert ERP 인건비 Success\n");
		sprintf(log_buff, "Insert ERP 인건비 : Process Count : %d\n", v_cnt_line);
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog(log_buff);
		/*EXEC SQL COMMIT WORK;*/

		v_amt_tot = 0;
		v_amt_tot_cr = 0;

		/* EXEC SQL 
		SELECT	SUM(ENTERED_DR),SUM(ENTERED_CR)
		INTO   	:v_amt_tot  ,:v_amt_tot_cr
		FROM	ERP_HGL_GL09
		WHERE	DT_CREATE = TO_DATE(:v_dt_create, 'YYYYMMDD')
		  AND	CD_DATA    = :v_cd_data
		  AND	NO_CRT_SRL = :v_no_crt_srl; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 10;
  sqlstm.arrsiz = 17;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select sum(ENTERED_DR) ,sum(ENTERED_CR) into :b0,:b1  from\
 ERP_HGL_GL09 where ((DT_CREATE=TO_DATE(:b2,'YYYYMMDD') and CD_DATA=:b3) and \
NO_CRT_SRL=:b4)";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )316;
  sqlstm.selerr = (unsigned short)0;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)256;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (         void  *)&v_amt_tot;
  sqlstm.sqhstl[0] = (unsigned int  )sizeof(double);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         void  *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned int  )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (         void  *)&v_amt_tot_cr;
  sqlstm.sqhstl[1] = (unsigned int  )sizeof(double);
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         void  *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned int  )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (         void  *)v_dt_create;
  sqlstm.sqhstl[2] = (unsigned int  )9;
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         void  *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned int  )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (         void  *)v_cd_data;
  sqlstm.sqhstl[3] = (unsigned int  )5;
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         void  *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned int  )0;
  sqlstm.sqadto[3] = (unsigned short )0;
  sqlstm.sqtdso[3] = (unsigned short )0;
  sqlstm.sqhstv[4] = (         void  *)&v_no_crt_srl;
  sqlstm.sqhstl[4] = (unsigned int  )sizeof(int);
  sqlstm.sqhsts[4] = (         int  )0;
  sqlstm.sqindv[4] = (         void  *)0;
  sqlstm.sqinds[4] = (         int  )0;
  sqlstm.sqharm[4] = (unsigned int  )0;
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
		Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
		WriteLog("< Write 인건비 Ending >-------------------------\n");
		return(0);
	}

}

/*=== dsa2000 2004.10. Rexec대체 서비스를 위한 Write_batlog()  ===================*/
int Write_batlog(int seqno, char *message)
{
	
        /* EXEC SQL AT log_db 
        INSERT INTO PYBATLOG
        VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 17;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )351;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)log_rundate;
        sqlstm.sqhstl[0] = (unsigned int  )16;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)log_progid;
        sqlstm.sqhstl[1] = (unsigned int  )16;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (         void  *)&seqno;
        sqlstm.sqhstl[2] = (unsigned int  )sizeof(int);
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         void  *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned int  )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (         void  *)log_writeman;
        sqlstm.sqhstl[3] = (unsigned int  )5;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         void  *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned int  )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (         void  *)message;
        sqlstm.sqhstl[4] = (unsigned int  )0;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         void  *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned int  )0;
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
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 17;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )392;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

	
}