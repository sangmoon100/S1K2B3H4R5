
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
    "scho_appmail.pc"
};


static unsigned int sqlctx = 2535915;


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
   unsigned char  *sqhstv[9];
   unsigned long  sqhstl[9];
            int   sqhsts[9];
            short *sqindv[9];
            int   sqinds[9];
   unsigned long  sqharm[9];
   unsigned long  *sqharc[9];
   unsigned short  sqadto[9];
   unsigned short  sqtdso[9];
} sqlstm = {12,9};

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
5,0,0,1,96,0,4,95,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,271,0,4,104,0,0,1,0,0,1,0,2,3,0,0,
47,0,0,3,145,0,4,128,0,0,1,0,0,1,0,2,3,0,0,
66,0,0,4,241,0,5,150,0,0,0,0,0,1,0,
81,0,0,5,0,0,17,197,0,0,1,1,0,1,0,1,97,0,0,
100,0,0,5,0,0,45,199,0,0,0,0,0,1,0,
115,0,0,5,0,0,15,206,0,0,0,0,0,1,0,
130,0,0,5,0,0,13,225,0,0,9,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
181,0,0,5,0,0,15,239,0,0,0,0,0,1,0,
196,0,0,5,0,0,15,248,0,0,0,0,0,1,0,
211,0,0,6,0,0,24,254,0,0,1,1,0,1,0,1,97,0,0,
230,0,0,7,113,0,4,286,0,0,6,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,
269,0,0,8,527,0,3,307,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
308,0,0,5,0,0,17,356,0,0,1,1,0,1,0,1,97,0,0,
327,0,0,5,0,0,45,358,0,0,0,0,0,1,0,
342,0,0,5,0,0,15,365,0,0,0,0,0,1,0,
357,0,0,5,0,0,13,379,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
388,0,0,5,0,0,15,388,0,0,0,0,0,1,0,
403,0,0,5,0,0,15,397,0,0,0,0,0,1,0,
418,0,0,9,0,0,24,403,0,0,1,1,0,1,0,1,97,0,0,
437,0,0,10,50,0,3,422,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
478,0,0,11,0,0,29,431,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 학자금 신청대상자 메일발송(유치원, 초/중/고 scho_appmail.pc
     PROGRM-Decription : 학자금 신청대상자 매월 26일 메일발송
                         아침 09시 00분
     Programmer        : 이희용
     Version           : 1.00
     Date              : 2017.04.24
       
    Update Contents
     Version  date(yy.mm.dd)  programmer  description  Comments
       1.00   2017.04.24      이희용      최초작성
==================================================================================================*/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <math.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

#define  FAIL        -2

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

     char  vCurrDate[8+1];
     char  CurrYYYY1[4+1];
     char  CurrMM[2+1];
     char  CurrDD[2+1];
     
     float vYearly_cnt;

     char  vEmpno[4+1];
     char  vKorname[12+1];
     char  vFaname[12+1];
     char  vFabirthdate[8+1];
     char  vSckind[2+1];
     char  vSmstel[11+1];
     char  vNowage[2+1];     
     char  vStage[2+1];
     char  vBeage[2+1];

     char  vHandTel[24+1];
     char  vSendTel[24+1];
     char  vSmsSubject[200+1];
     char  vSmsBody[1024+1];
     
     char  sql_stmt[5000+1];
     char  sqlstr[1024];
/* EXEC SQL END  DECLARE SECTION; */ 


FILE *fp = stdout;

char  log_progid[16]  = "scho_appmail";
char  log_writeman[5] = "CRON";
char  log_rundate[16] = ""; 
char  log_buff[100]   = "";
int   seqno   = 0;
int   rcount  = 0;


void main(argc,argv)
int argc;
char *argv[];
{       
     char FL_dir[255];
     char FL_Line[255];     
     char FL_file[255];   
     int  daycode;
     int  vexists;     
     
     STRINIT(FL_file);
     STRINIT(FL_Line);
     strcpy(FL_file,log_progid);

     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }     
     
     hinsa_log_print(0,"학자금 신청 안내 메일 발송(scho_appmail) 프로그램 시작...");
     hinsa_db_connect();  

     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
    
     /* 0. 현재시간 체크 */
     /* EXEC SQL     
             SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24mmss'),TO_CHAR(SYSDATE,'YYYYMMDD')  
             INTO :log_rundate, :vCurrDate
             FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24mmss') ,TO_CHAR(SYS\
DATE,'YYYYMMDD') into :b0,:b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
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
     sqlstm.sqhstv[1] = (unsigned char  *)vCurrDate;
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

     

     hinsa_trim(log_rundate);          
     hinsa_trim(vCurrDate);                            
     
    /* 1.  금일 평일여부 체크 휴일 : 0, 평일 : 1, 매월 26일이후 평일 실행 */
     /* EXEC SQL   
            SELECT CASE WHEN (A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL) THEN 0 
                   ELSE 
                     CASE WHEN TO_CHAR(SYSDATE,'DD') < '26'  THEN 0
                     ELSE                                        1
                     END
                   END DAYCODE
            INTO :daycode
            FROM PKHCALDAYS A, PKCHOLI B
              WHERE A.YYYYMMDD = B.HOLIDATE(+)
                AND A.YYYYMMDD = TO_CHAR(SYSDATE,'YYYYMMDD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select  case  when (A.DAYCODE in ('1','7') or B.HOLIDAT\
E is  not null ) then 0 else  case  when TO_CHAR(SYSDATE,'DD')<'26' then 0 el\
se 1  end   end  DAYCODE into :b0  from PKHCALDAYS A ,PKCHOLI B where (A.YYYY\
MMDD=B.HOLIDATE(+) and A.YYYYMMDD=TO_CHAR(SYSDATE,'YYYYMMDD'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&daycode;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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


              
     /*매월 25일이전 및 휴일은 문자전송하지 않음*/
     if(daycode == 0 ) 
     {
        sprintf(log_buff, "[매월26일이후(휴일제외) 작업으로 실행취소] ORA-%05d - \n",sqlca.sqlcode);
        Write_batlog(seqno++, log_buff);             
        hinsa_log_print(0, log_buff);
        error_quit("[매월26일이후(휴일제외) 작업으로 실행취소] \n");
        hinsa_exit(0,"[매월26일이후(휴일제외) 작업으로 실행취소] \n");
     };  
     
     /* 2.  당월 전송자료 존재여부 */
     /* 전송자료 중 수동(프로그램 : PKI2110A)은 제외 */
     /* EXEC SQL     
             SELECT DECODE(COUNT(*), 0, 0, 1)
             INTO :vexists            
             FROM PNMMAIL
             WHERE WORKDATE LIKE TO_CHAR(SYSDATE,'YYYYMM')||'%'
               AND SND_YN = 'Y'
               AND WRITEMAN = 'CRON'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select DECODE(count(*) ,0,0,1) into :b0  from PNMMAIL w\
here ((WORKDATE like (TO_CHAR(SYSDATE,'YYYYMM')||'%') and SND_YN='Y') and WRI\
TEMAN='CRON')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )47;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&vexists;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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


               
     /*당월 전송자료 존재 시 문자전송하지 않음*/
     if(vexists == 1 ) 
     {
        sprintf(log_buff, "[당월 전송자료 존재로 실행취소] ORA-%05d - \n",sqlca.sqlcode);
        Write_batlog(seqno++, log_buff);             
        hinsa_log_print(0, log_buff);
        error_quit("[당월 전송자료 존재로 실행취소] \n");
        hinsa_exit(0,"[당월 전송자료 존재로 실행취소] \n");
     };               
     
	   if (process_message() == SUCCESS) 
	   {   
	   	   if ((Send_MAIL() == SUCCESS) && (Send_SMS() == SUCCESS))      
	   	   {
		         /* EXEC SQL /o 전송자료 o/
		         UPDATE PNMMAIL
		         SET SND_YN = 'Y'
		         WHERE (GUBUN, EMPNO, SCKIND, FAMINAME||FAMIJUID) IN 
		               (SELECT GUBUN, EMPNO, SCKIND, MAX(FAMINAME||FAMIJUID)        
		                FROM PNMMAIL
		                WHERE WORKDATE = TO_CHAR(SYSDATE,'YYYYMMDD')
		                  AND SND_YN  <> 'Y'
             GROUP BY GUBUN, EMPNO, SCKIND); */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 2;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "update PNMMAIL  set SND_YN='Y' where (GUBUN,EMPNO\
,SCKIND,(FAMINAME||FAMIJUID)) in (select GUBUN ,EMPNO ,SCKIND ,max((FAMINAME|\
|FAMIJUID))  from PNMMAIL where (WORKDATE=TO_CHAR(SYSDATE,'YYYYMMDD') and SND\
_YN<>'Y') group by GUBUN,EMPNO,SCKIND)";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )66;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                 
				     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
				     {
				          sprintf(log_buff, "학자금 신청 전송자료 입력 오류 : %s", SQLERRM);
				          Write_batlog(seqno++, log_buff);   
              	  hinsa_exit(0,"Error ====== [학자금 신청 전송자료 입력 오류] =====\n");
				     }
				     else
				     {                  
		              sprintf(log_buff, "OK ====== [학자금 신청 알림 MAIL/SMS 전송 성공] =====\n");
			            Write_batlog(seqno++, log_buff); 
		 	            hinsa_exit(0,"OK ====== [학자금 신청 알림  MAIL/SMS 전송 성공] =====\n");
		 	       }     
	   	   }
         else
         {
             sprintf(log_buff, "ERROR ====== [학자금 신청 알림 MAIL/SMS 전송 실패] =====\n");
	           Write_batlog(seqno++, log_buff); 
         	   hinsa_exit(0,"Error ====== [학자금 신청 알림  MAIL/SMS 전송 실패] =====\n");
         }
     }
     else
     {   sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
		     Write_batlog(seqno++, log_buff);   
		     error_quit("ERROR ====== [작업 실패] =====\n");
		     hinsa_exit(0,"Error ====== [학자금 신청 알림  MAIL/SMS 전송 실패] =====\n");
     }
}
          
int process_message()
{
     /* 메시지 전송 대상자 조회 */
     /* 중학교 제외 : 노사합의로 초등학교 등록자는 중학교까지 계속해서 지급(중도입사자 제외)*/ 
     /* 발송자 제외*/       
     sprintf(sql_stmt," SELECT EMPNO, KORNAME, FANAME, FABIRTHDATE, SCKIND, SMSTEL, NOWAGE, STAGE, BEAGE FROM HPER.V_SCHO_SMS A"
                      " WHERE A.SCKIND <> '13' "
                      "   AND NOT EXISTS(SELECT * FROM PNMMAIL  WHERE EMPNO = A.EMPNO AND FAMINAME = A.FANAME AND FAMIJUID = A.FABIRTHDATE AND SCKIND = A.SCKIND) "); 

     /* EXEC SQL PREPARE S FROM :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )81;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sql_stmt;
     sqlstm.sqhstl[0] = (unsigned long )5001;
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


     /* EXEC SQL DECLARE cursor1 CURSOR FOR S; */ 

     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )100;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != 1405))
     {
          sprintf(log_buff, "Cursor cursor1 Open Error .....");
          Write_batlog(seqno++, log_buff);
          hinsa_log_print(0, log_buff);
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )115;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
          return (FAIL);
     }
  
     rcount = 0;
     
     while(1)
     {
          memset(vEmpno,      '\0',sizeof(vEmpno));
          memset(vKorname,    '\0',sizeof(vKorname));
          memset(vFaname,     '\0',sizeof(vFaname));
          memset(vFabirthdate,'\0',sizeof(vFabirthdate));
          memset(vSckind,     '\0',sizeof(vSckind));
          memset(vSmstel,     '\0',sizeof(vSmstel));
          memset(vNowage,     '\0',sizeof(vNowage));
          memset(vStage,      '\0',sizeof(vStage));
          memset(vBeage,      '\0',sizeof(vBeage));
        
          /* EXEC SQL FETCH  cursor1 INTO  :vEmpno, :vKorname, :vFaname, :vFabirthdate, :vSckind, :vSmstel, :vNowage, :vStage, :vBeage; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )130;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)vEmpno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)vKorname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)vFaname;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)vFabirthdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)vSckind;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)vSmstel;
          sqlstm.sqhstl[5] = (unsigned long )12;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)vNowage;
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)vStage;
          sqlstm.sqhstl[7] = (unsigned long )3;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)vBeage;
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
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


          
          hinsa_trim(vEmpno);
          hinsa_trim(vKorname);      
          hinsa_trim(vFaname);
          hinsa_trim(vFabirthdate);      
          hinsa_trim(vSckind);
          hinsa_trim(vSmstel);
          hinsa_trim(vNowage);      
          hinsa_trim(vStage);      
          hinsa_trim(vBeage);      
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )181;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
               sprintf(log_buff, "처리된 작업대상자 : [%d] 명 \n",rcount);
               Write_batlog(seqno++, log_buff);               
               return 0;
          }
          
          if  (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error 1...");
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )196;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
               return 0;
          }   
 
		      sprintf(sqlstr,"Call HPER.PROC_SCHO_SMS('%s', '%s', '%s', '%s', '%s', trim('%s'), trim('%s'), trim('%s'), trim('%s'))", vEmpno, vKorname, vFaname, vFabirthdate, vSckind, vSmstel, vNowage, vStage, vBeage);
		      /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 9;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )211;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)sqlstr;
        sqlstm.sqhstl[0] = (unsigned long )1024;
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
              hinsa_log_print(0,"ERROR ====== [SMS SEND 실패] =====\n");
		          sprintf(log_buff, "ERROR ====== [SMS SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
	            Write_batlog(seqno++, log_buff);             
    	        hinsa_log_print(0, log_buff);
		          error_quit("ERROR ====== [SMS SEND 실패] =====\n");
		     }		      
		      rcount++;
     }
     return(SUCCESS);
}

Send_MAIL()
{
    char  vsend_per[100+1];
    char  vsubject[1024+1];
    char  vbody1[1024+1];   
    char  vbody2[1024+1];
    char  vbody3[1024+1];
    char  vbody4[1024+1];

    memset(vsend_per ,'\0',sizeof(vsend_per));/* 발송인   */                   
    memset(vsubject  ,'\0',sizeof(vsubject)); /* 제목     */         
    memset(vbody1    ,'\0',sizeof(vbody1));   /* 유치원   */
    memset(vbody2    ,'\0',sizeof(vbody2));   /* 초등학교 */
    memset(vbody3    ,'\0',sizeof(vbody3));   /* 중학교   */
    memset(vbody4    ,'\0',sizeof(vbody4));   /* 고등학교 */
        	
    /* 메일 전송 내용 가져오기 */
    /* EXEC SQL     
             SELECT VALUE1, VALUE2, VALUE3, VALUE4, VALUE5, VALUE6
             INTO :vsend_per, :vsubject, :vbody1, :vbody2, :vbody3, :vbody4
             FROM PEAVARI
             WHERE S_NO = '002'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE1 ,VALUE2 ,VALUE3 ,VALUE4 ,VALUE5 ,VALUE6 in\
to :b0,:b1,:b2,:b3,:b4,:b5  from PEAVARI where S_NO='002'";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )230;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vsend_per;
    sqlstm.sqhstl[0] = (unsigned long )101;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vsubject;
    sqlstm.sqhstl[1] = (unsigned long )1025;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)vbody1;
    sqlstm.sqhstl[2] = (unsigned long )1025;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)vbody2;
    sqlstm.sqhstl[3] = (unsigned long )1025;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)vbody3;
    sqlstm.sqhstl[4] = (unsigned long )1025;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)vbody4;
    sqlstm.sqhstl[5] = (unsigned long )1025;
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


   
     hinsa_trim(vsend_per);               
     hinsa_trim(vsubject);               
     hinsa_trim(vbody1);               
     hinsa_trim(vbody2);               
     hinsa_trim(vbody3);               
     hinsa_trim(vbody4);               
   
     if  (sqlca.sqlcode != 0)
     {
          sprintf(log_buff, "Send_MAIL(메일 전송내용) 오류...SQLCODE[%s]\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);           
 	        hinsa_log_print(0, log_buff);
          return(FAIL);
     }
     
     /* EXEC SQL /o 학자금 안내문(Mail) o/
     INSERT INTO PZHMAIL
             (SENDTIME, SENDPROG, SEND_PER, RCVR_PER, REFR_PER, SUBJECT, HEADER1, BODY1, TAIL1, RECEIVEYN, EAI_FLAG, EAI_DATE)   
     SELECT  TO_CHAR(SYSDATE,'YYYYMMDDHHMISS') SENDTIME, 
             'scho_appmail' SENDPROG, 
             :vsend_per     SEND_PER, 
             A.EMPNO        RCVR_PER, 
             ''             REFR_PER, 
             :vsubject      SUBJECT, 
             ''             HEADER1, 
             DECODE(A.SCKIND, '11', :vbody1, '12', :vbody2, '13', :vbody3, '14', :vbody4, '1') BODY1, 
             ''             TAIL1, 
             'N'            RECEIVEYN, 
             'N'            EAI_FLAG, 
             ''             EAI_DATE
     FROM(SELECT EMPNO, SCKIND 
          FROM PNMMAIL
          WHERE WORKDATE = TO_CHAR(SYSDATE,'YYYYMMDD')
            AND SND_YN <> 'Y'
            AND GUBUN = '1'
          GROUP BY EMPNO, SCKIND) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PE\
R,REFR_PER,SUBJECT,HEADER1,BODY1,TAIL1,RECEIVEYN,EAI_FLAG,EAI_DATE)select TO_\
CHAR(SYSDATE,'YYYYMMDDHHMISS') SENDTIME ,'scho_appmail' SENDPROG ,:b0 SEND_PE\
R ,A.EMPNO RCVR_PER ,'' REFR_PER ,:b1 SUBJECT ,'' HEADER1 ,DECODE(A.SCKIND,'1\
1',:b2,'12',:b3,'13',:b4,'14',:b5,'1') BODY1 ,'' TAIL1 ,'N' RECEIVEYN ,'N' EA\
I_FLAG ,'' EAI_DATE  from (select EMPNO ,SCKIND  from PNMMAIL where ((WORKDAT\
E=TO_CHAR(SYSDATE,'YYYYMMDD') and SND_YN<>'Y') and GUBUN='1') group by EMPNO,\
SCKIND) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )269;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)vsend_per;
     sqlstm.sqhstl[0] = (unsigned long )101;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)vsubject;
     sqlstm.sqhstl[1] = (unsigned long )1025;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)vbody1;
     sqlstm.sqhstl[2] = (unsigned long )1025;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)vbody2;
     sqlstm.sqhstl[3] = (unsigned long )1025;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)vbody3;
     sqlstm.sqhstl[4] = (unsigned long )1025;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)vbody4;
     sqlstm.sqhstl[5] = (unsigned long )1025;
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

    
              
              
     if  (sqlca.sqlcode != 0)
     {
          sprintf(log_buff, "ERROR ====== [MAIL SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);             
 	        hinsa_log_print(0, log_buff);
          error_quit("ERROR ====== [MAIL SEND 실패] =====\n");
          return (FAIL);
     }
     else
     {    
          return(SUCCESS);
     }     
}

int Send_SMS()
{
     sprintf(sql_stmt," SELECT A.RCV_ID, A.SND_ID, B.VALUE2, DECODE(A.SCKIND, '11', B.VALUE3, '12', B.VALUE4, '13', B.VALUE5, '14', B.VALUE6, '1') SND_MSG "
                      " FROM(SELECT EMPNO, SCKIND, MAX(RCV_ID) RCV_ID, MAX(SND_ID) SND_ID " 
                      "      FROM PNMMAIL "
                      "      WHERE WORKDATE = TO_CHAR(SYSDATE,'YYYYMMDD') "
                      "        AND SND_YN <> 'Y' "
                      "        AND GUBUN  = '2'  "
                      "      GROUP BY EMPNO, SCKIND) A, PEAVARI B "
                      " WHERE  B.S_NO = '003' "); 
          
          
     /* EXEC SQL PREPARE S FROM :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )308;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sql_stmt;
     sqlstm.sqhstl[0] = (unsigned long )5001;
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


     /* EXEC SQL DECLARE cursor2 CURSOR FOR S; */ 

     /* EXEC SQL OPEN cursor2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )327;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != 1405))
     {
          sprintf(log_buff, "Cursor cursor2 Open Error .....");
          Write_batlog(seqno++, log_buff);
          hinsa_log_print(0, log_buff);
          /* EXEC SQL CLOSE cursor2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )342;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
          return (FAIL);
     }
  
     rcount = 0;
     
     while(1)
     {    
          memset(vHandTel,    '\0',sizeof(vHandTel));
          memset(vSendTel,    '\0',sizeof(vSendTel));
          memset(vSmsSubject, '\0',sizeof(vSmsSubject));
          memset(vSmsBody,    '\0',sizeof(vSmsBody));
        
          /* EXEC SQL FETCH  cursor2 INTO  :vHandTel, :vSendTel, :vSmsSubject, :vSmsBody; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )357;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)vHandTel;
          sqlstm.sqhstl[0] = (unsigned long )25;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)vSendTel;
          sqlstm.sqhstl[1] = (unsigned long )25;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)vSmsSubject;
          sqlstm.sqhstl[2] = (unsigned long )201;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)vSmsBody;
          sqlstm.sqhstl[3] = (unsigned long )1025;
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


          
          hinsa_trim(vHandTel);
          hinsa_trim(vSendTel);      
          hinsa_trim(vSmsSubject);
          hinsa_trim(vSmsBody);      
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )388;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
               sprintf(log_buff, "처리된 작업대상자 : [%d] 명 \n",rcount);
               Write_batlog(seqno++, log_buff);               
               return 0;
          }
          
          if  (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor2 Data Fetch Error 1...");
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )403;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
               return 0;
          }   

			    sprintf(sqlstr,"Call HPER.SENDSMS(trim('%s'), trim('%s'), '%s', '%s')", vHandTel,vSendTel,vSmsBody,vSmsSubject);
			    /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 9;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )418;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)sqlstr;
       sqlstm.sqhstl[0] = (unsigned long )1024;
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
              hinsa_log_print(0,"ERROR ====== [SMS SEND 실패] =====\n");
		          sprintf(log_buff, "ERROR ====== [SMS SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
	            Write_batlog(seqno++, log_buff);             
    	        hinsa_log_print(0, log_buff);
		          error_quit("ERROR ====== [SMS SEND 실패] =====\n");
		     }		      
		      rcount++;
     }
     	
     return(SUCCESS);
}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )437;
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
          return(FAILURE);
     }                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )478;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
