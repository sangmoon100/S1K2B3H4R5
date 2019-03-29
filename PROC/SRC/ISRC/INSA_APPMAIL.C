
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
           char  filnam[16];
};
static struct sqlcxp sqlfpn =
{
    15,
    "insa_appmail.pc"
};


static unsigned int sqlctx = 2478571;


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
5,0,0,1,1479,0,3,97,0,0,0,0,0,1,0,
20,0,0,2,1486,0,3,148,0,0,0,0,0,1,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 종합인사정보 계약직사원의 계약만료자료 갱신 메일발송 insa_appmail.pc
     PROGRM-Decription : 계약직사원의 계약만료일 도래 시 해당팀 부서장에게 메일발송
                         새벽 05시 35분
     Programmer        : 이희용ccc
     Version           : 1.00
     Date              : 2013.02.26
       
    Update Contents
     Version  date(yy.mm.dd)  programmer  description  Comments
       1.00   2013.02.26      이희용      최초작성
     Comments     
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

#define   YYMMDD      8

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

/* EXEC SQL BEGIN DECLARE SECTION; */ 


/* 인터페이스 콘트롤 테이블 변수들 */
typedef struct HINSA_ctrl_inter 
{
  /* varchar  v_dt_create  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_dt_create;
  /* 생성일자 */
  int      v_no_crt_srl;                 /* 생성 일련번호 */
  int      v_cnt_line;                   /* 라인 건수 */
} ts_ctrl_inter;
 
/* EXEC SQL END DECLARE SECTION; */ 


static ts_ctrl_inter FG_inter_ctrl;
static ts_ctrl_inter *FGP_inter_ctrl;

static int  FG_loopcnt;

void main(void)
{
     char *FL_date;
     char FL_Line[255];
     char FL_file[255];
     char worktime[6] = "";
       
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */  
     STRINIT(&FL_file);
     STRINIT(&FL_Line);
     strcpy(FL_file,"insa_appmail");
   
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
         hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
     
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */
     memset(&FG_inter_ctrl, 0x00, sizeof(ts_ctrl_inter));
   
     FGP_inter_ctrl = &FG_inter_ctrl;
     FGP_inter_ctrl->v_cnt_line = 0;
   
     /* 생성일자.. */ 
     FL_date = hinsa_sys_date(1);     
     
     STR2VCTRIM(FGP_inter_ctrl->v_dt_create, FL_date, YYMMDD);  
     
     hinsa_log_print(0,"파견사원 계약만료 안내 메일 발송(insa_appmail) 프로그램 시작...");
     hinsa_db_connect();  

     sprintf(FL_Line, "생성일자 : %s", FGP_inter_ctrl->v_dt_create.arr);
     hinsa_log_print(0, FL_Line);

    /*======================================================================================
     PZHMAIL INSERT : 계약기간이 만료되기 전(30일, 45일) 자료를 Mail 발송.
     ======================================================================================*/   

     sprintf(FL_Line, "Mail 전송 Table에 입력 시작...");
     hinsa_log_print(0, FL_Line);

    /*======================================================================================
     소소부서 팀장님에게 전송.
     ======================================================================================*/  
    /*2017.10.31 메일내역의 경로문구 변경  
	   	        '('||A.EMPNO||' : '||A.KORNAME||') 사원의 계약만료('||SUBSTR(A.OTDUTODATE,1,4)||'-'||SUBSTR(A.OTDUTODATE,5,2)||'-'||SUBSTR(A.OTDUTODATE,7,2)||')가 '
	   	        || TO_CHAR(TO_DATE(A.OTDUTODATE, 'YYYYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD'))||'일 남았습니다.' ||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          	'[종합인사정보시스템] ▶ [평가] ▶ 파견사원 평가] ▶ 파견사원 평가 에서' ||CHR(13)||CHR(10)||
	   	        '해당사원의 평가 및 충원여부를 기재바랍니다.'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||    */			    
     /* EXEC SQL	
	   INSERT INTO PZHMAIL
	         (SENDTIME,   /o 메일발송 작업시간                                         o/    
	   		    SENDPROG,   /o 발송프로그램 ID                                           o/    
	   	      SEND_PER,   /o 발신자 사번                                               o/    
	   	      RCVR_PER,   /o 수신자 사번(기업문화실(실원, 파견)은 HR 팀장으로 홍 M 요청 2013.04.23 H18 o/    
	   	      REFR_PER,   /o 불필요(종합인사)                                          o/    
	   	      SUBJECT,    /o 메일제목                                                  o/    
	   	      HEADER1,    /o 불필요(종합인사)                                          o/    
	   	      BODY1,      /o 메일내용                                                  o/    
	   	      TAIL1,      /o 불필요(종합인사)                                          o/    
	   	      RECEIVEYN,  /o 'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기 o/ 
	   	      EAI_FLAG,   /o                                                           o/    
	   	      EAI_DATE)   /o                                                           o/      			
	   SELECT 
	          TO_CHAR(SYSDATE,'YYYYMMDDHHMISS')                  SENDTIME, 
	          'CRON'                                             SENDPROG,
	          C.VALUE2                                           SEND_PER,
	          Decode(A.Empno,'YN04','M187',B.EEMPNO)             RCVR_PER, /oYN04 임시 하드코딩o/
	          ''                                                 REFR_PER,
	          '파견사원 계약만료 안내'                           SUBJECT,
	          ''                                                 HEADER1,
	          '************************************************************************************'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '('||A.EMPNO||' : '||A.KORNAME||') 사원의 계약만료('||SUBSTR(A.OTDUTODATE,1,4)||'-'||SUBSTR(A.OTDUTODATE,5,2)||'-'||SUBSTR(A.OTDUTODATE,7,2)||')가 '
	          || TO_CHAR(TO_DATE(A.OTDUTODATE, 'YYYYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD'))||'일 남았습니다.' ||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '위치 : My HR -> 평가 -> 구성원 성과관리 -> 기타 평가 에서' ||CHR(13)||CHR(10)||
	          '해당사원의 평가 및 충원여부를 기재바랍니다.'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '************************************************************************************' BODY1,
	          ''                                                 TAIL1,
	          'N'                                                ReceiveYN,
	          'N'                                                EAI_FLAG, 
	          ''                                                 EAI_DATE
	     FROM PIMPMAS A, PIMEEMP B,
	          (Select * From PEAVARI Where S_NO = '001') C
	     WHERE a.pstate < '80'
	       AND A.ORGNUM = B.ORGNUM AND A.EMPNO = B.EMPNO
	       AND SUBSTR(a.empno,1,1) IN ('Y')
         AND (TO_CHAR(TO_DATE(a.OTDUTODATE, 'YYYYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD'))) IN ('30', '45')
         AND NOT EXISTS(SELECT 1 FROM PEPYMAS WHERE EMPNO = A.EMPNO AND EXTYN IS NOT NULL); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PER,REFR_PER,SU\
BJECT,HEADER1,BODY1,TAIL1,RECEIVEYN,EAI_FLAG,EAI_DATE)select TO_CHAR(SYSDATE\
,'YYYYMMDDHHMISS') SENDTIME ,'CRON' SENDPROG ,C.VALUE2 SEND_PER ,Decode(A.Em\
pno,'YN04','M187',B.EEMPNO) RCVR_PER ,'' REFR_PER ,'파견사원 계약만료 안내' \
SUBJECT ,'' HEADER1 ,(((((((((((((((((((((((((((((('************************\
************************************************************'||CHR(13))||CHR\
(10))||CHR(13))||CHR(10))||'(')||A.EMPNO)||' : ')||A.KORNAME)||') 사원의 계약\
만료(')||SUBSTR(A.OTDUTODATE,1,4))||'-')||SUBSTR(A.OTDUTODATE,5,2))||'-')||S\
UBSTR(A.OTDUTODATE,7,2))||')가 ')||TO_CHAR((TO_DATE(A.OTDUTODATE,'YYYYMMDD')\
-TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD'))))||'일 남았습니다.')||CHR(\
13))||CHR(10))||CHR(13))||CHR(10))||'위치 : My HR -> 평가 -> 구성원 성과관리\
 -> 기타 평가 에서')||CHR(13))||CHR(10))||'해당사원의 평가 및 충원여부를 기재\
바랍니다.')||CHR(13))||CHR(10))||CHR(13))||CHR(10))||'**********************\
******************************************");
     sqlstm.stmt = "********************') BODY1 ,'' TAIL1 ,'N' ReceiveYN ,\
'N' EAI_FLAG ,'' EAI_DATE  from PIMPMAS A ,PIMEEMP B ,(select *  from PEAVARI\
 where S_NO='001') C where (((((a.pstate<'80' and A.ORGNUM=B.ORGNUM) and A.EM\
PNO=B.EMPNO) and SUBSTR(a.empno,1,1) in ('Y')) and TO_CHAR((TO_DATE(a.OTDUTOD\
ATE,'YYYYMMDD')-TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD'))) in ('30','4\
5')) and  not exists (select 1  from PEPYMAS where (EMPNO=A.EMPNO and EXTYN i\
s  not null )))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into PZHMAIL INSERT !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                
     

    /*======================================================================================
     아래는 HR팀 담당자에게 전송
     ======================================================================================*/  
     /* EXEC SQL	
	   INSERT INTO PZHMAIL
	         (SENDTIME,   /o 메일발송 작업시간                                         o/    
	   		    SENDPROG,   /o 발송프로그램 ID                                           o/    
	   	      SEND_PER,   /o 발신자 사번                                               o/    
	   	      RCVR_PER,   /o 수신자 사번                                               o/    
	   	      REFR_PER,   /o 불필요(종합인사)                                          o/    
	   	      SUBJECT,    /o 메일제목                                                  o/    
	   	      HEADER1,    /o 불필요(종합인사)                                          o/    
	   	      BODY1,      /o 메일내용                                                  o/    
	   	      TAIL1,      /o 불필요(종합인사)                                          o/    
	   	      RECEIVEYN,  /o 'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기 o/ 
	   	      EAI_FLAG,   /o                                                           o/    
	   	      EAI_DATE)   /o                                                           o/      			
	   SELECT 
	          TO_CHAR(SYSDATE,'YYYYMMDDHHMISS')                  SENDTIME, 
	          'CRON'                                             SENDPROG,
	          C.VALUE2                                           SEND_PER,
	          C.VALUE1||';'||C.VALUE2||';'||C.VALUE3             RCVR_PER, 
	          ''                                                 REFR_PER,
	          '파견사원 계약만료 안내'                           SUBJECT,
	          ''                                                 HEADER1,
	          '************************************************************************************'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '('||A.EMPNO||' : '||A.KORNAME||') 사원의 계약만료('||SUBSTR(A.OTDUTODATE,1,4)||'-'||SUBSTR(A.OTDUTODATE,5,2)||'-'||SUBSTR(A.OTDUTODATE,7,2)||')가 '
	          || TO_CHAR(TO_DATE(A.OTDUTODATE, 'YYYYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD'))||'일 남았습니다.' ||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '위치 : My HR -> 평가 -> 구성원 성과관리 -> 기타 평가 에서' ||CHR(13)||CHR(10)||
	          '해당사원의 충원여부를 확인하시기 바랍니다.'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||
	          '************************************************************************************' BODY1,
	          ''                                                 TAIL1,
	          'N'                                                ReceiveYN,
	          'N'                                                EAI_FLAG, 
	          ''                                                 EAI_DATE
	     FROM PIMPMAS A, PIMEEMP B, 
	          (Select * From PEAVARI Where S_NO = '001') C
	     WHERE a.pstate < '80'
	       AND A.ORGNUM = B.ORGNUM AND A.EMPNO = B.EMPNO
	       AND SUBSTR(a.empno,1,1) IN ('Y')
         AND (TO_CHAR(TO_DATE(a.OTDUTODATE, 'YYYYMMDD') - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD'))) IN ('30', '45')
         AND NOT EXISTS(SELECT 1 FROM PEPYMAS WHERE EMPNO = A.EMPNO AND EXTYN IS NOT NULL); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PER,REFR_PER,SU\
BJECT,HEADER1,BODY1,TAIL1,RECEIVEYN,EAI_FLAG,EAI_DATE)select TO_CHAR(SYSDATE\
,'YYYYMMDDHHMISS') SENDTIME ,'CRON' SENDPROG ,C.VALUE2 SEND_PER ,((((C.VALUE\
1||';')||C.VALUE2)||';')||C.VALUE3) RCVR_PER ,'' REFR_PER ,'파견사원 계약만료\
 안내' SUBJECT ,'' HEADER1 ,(((((((((((((((((((((((((((((('*****************\
*******************************************************************'||CHR(13\
))||CHR(10))||CHR(13))||CHR(10))||'(')||A.EMPNO)||' : ')||A.KORNAME)||') 사원\
의 계약만료(')||SUBSTR(A.OTDUTODATE,1,4))||'-')||SUBSTR(A.OTDUTODATE,5,2))||\
'-')||SUBSTR(A.OTDUTODATE,7,2))||')가 ')||TO_CHAR((TO_DATE(A.OTDUTODATE,'YYY\
YMMDD')-TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD'))))||'일 남았습니다.'\
)||CHR(13))||CHR(10))||CHR(13))||CHR(10))||'위치 : My HR -> 평가 -> 구성원 성\
과관리 -> 기타 평가 에서')||CHR(13))||CHR(10))||'해당사원의 충원여부를 확인하\
시기 바랍니다.')||CHR(13))||CHR(10))||CHR(13))||CHR(10))||'*****************\
****************************************");
     sqlstm.stmt = "***************************') BODY1 ,'' TAIL1 ,'N' Rece\
iveYN ,'N' EAI_FLAG ,'' EAI_DATE  from PIMPMAS A ,PIMEEMP B ,(select *  from \
PEAVARI where S_NO='001') C where (((((a.pstate<'80' and A.ORGNUM=B.ORGNUM) a\
nd A.EMPNO=B.EMPNO) and SUBSTR(a.empno,1,1) in ('Y')) and TO_CHAR((TO_DATE(a.\
OTDUTODATE,'YYYYMMDD')-TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD'))) in (\
'30','45')) and  not exists (select 1  from PEPYMAS where (EMPNO=A.EMPNO and \
EXTYN is  not null )))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into PZHMAIL INSERT !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                
                    
     sprintf(FL_Line, "입력 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
     
     hinsa_exit(0,"파견사원 계약만료 안내 메일 발송(insa_appmail)  프로그램 정상 처리...");
}  
