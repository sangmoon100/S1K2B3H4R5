
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
    "pzo2011g.pc"
};


static unsigned int sqlctx = 161027;


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
   unsigned char  *sqhstv[7];
   unsigned long  sqhstl[7];
            int   sqhsts[7];
            short *sqindv[7];
            int   sqinds[7];
   unsigned long  sqharm[7];
   unsigned long  *sqharc[7];
   unsigned short  sqadto[7];
   unsigned short  sqtdso[7];
} sqlstm = {12,7};

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
5,0,0,1,136,0,4,91,0,0,2,1,0,1,0,2,3,0,0,1,97,0,0,
28,0,0,2,0,0,30,149,0,0,0,0,0,1,0,
43,0,0,3,0,0,17,181,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,3,0,0,45,186,0,0,0,0,0,1,0,
77,0,0,3,0,0,15,192,0,0,0,0,0,1,0,
92,0,0,3,0,0,13,209,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,
135,0,0,3,0,0,15,221,0,0,0,0,0,1,0,
150,0,0,3,0,0,15,233,0,0,0,0,0,1,0,
165,0,0,4,105,0,3,250,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
204,0,0,3,0,0,17,301,0,0,1,1,0,1,0,1,97,0,0,
223,0,0,3,0,0,45,306,0,0,0,0,0,1,0,
238,0,0,3,0,0,15,312,0,0,0,0,0,1,0,
253,0,0,3,0,0,13,328,0,0,6,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,
292,0,0,3,0,0,15,341,0,0,0,0,0,1,0,
307,0,0,3,0,0,15,351,0,0,0,0,0,1,0,
322,0,0,5,105,0,3,378,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
361,0,0,6,172,0,5,412,0,0,0,0,0,1,0,
376,0,0,7,82,0,3,436,0,0,4,4,0,2,6,76,79,71,95,68,66,1,97,0,0,1,3,0,0,1,97,0,0,
1,97,0,0,
413,0,0,8,0,0,29,446,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pzo2011g
 SYSTEM-NAME    : 종합인사관리.
 SUBSYSTEM-NAME : 외주인력 기간만료자 메일전송 및 처리
 Programmer     : 구해자
 Version        : 1.00
 Date           : 2015.09.15
 
Update Contents
   Version    date(yy.mm.dd)     programmer      description   
   1.00       2015.09.15         hjku            최초개발본    
============================================================================= */
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
 

     char  vEmpno[4+1]; 
     char  vKorname[20+1];  
     char  vEmail[60+1];
     
     char  vManagerid[4+1];
     char  vManagername[20+1];
     char  vManageremail[60+1];
     char  vEnddate[8+1];

     char  sql_stmt[5000+1];
     
     char  SendProgID[11];
     char  SendEmpno[50+1]; 
     char  RcveEmpno[50+1]; 
     char  MailBody[1500+1];
     char  MailSubject[100+1];
     char  ReceiveYN[2];   
     
     int vSend_cnt; 
     int vOut_cnt; 
     char  sqlstr[2048];
 /* EXEC SQL END  DECLARE SECTION; */ 
 


FILE *fp = stdout;

char  log_progid[16]  = "pzo2011g";
char  log_writeman[5] = "CRON";
char  log_buff[100]   = "";
int   seqno   = 0;
int   rcount  = 0;


void main(argc,argv)
int argc;
char *argv[];
{       
     char FL_file[255];
             
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,log_progid);
     
     hinsa_get_filename(1, FL_file);
     
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /*========================================================*/     
     hinsa_log_print(0,"외주인력 관리 시작...0");
     hinsa_db_connect();  /*DB Connect 실시..*/
          
     /* EXEC SQL DECLARE log_db DATABASE; */ 
  
    
     hinsa_log_db_connect();

     /*재실행 방지*/
     /* EXEC SQL 
             SELECT COUNT(*) 
               INTO :vSend_cnt
               FROM PYBATLOG
              WHERE RUNDATE LIKE to_char(sysdate,'YYYYMMDD')||'%'
                AND PROGID  =    :log_progid                          
                AND RESULT  LIKE '%OK%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PYBATLOG where ((RUNDAT\
E like (to_char(sysdate,'YYYYMMDD')||'%') and PROGID=:b1) and RESULT like '%O\
K%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&vSend_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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

   
                
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         sprintf(log_buff, "ERROR ====== [기전송여부체크] ORA-%05d - \n",sqlca.sqlcode);
         Write_batlog(seqno++, log_buff);             
         error_quit("ERROR ====== [기전송여부체크 실패] =====\n");
     };    
	                
	   if( vSend_cnt > 0 ) {
           sprintf(log_buff, "====== [금일자로 전송된 자료가 존재합니다.]\n");
           Write_batlog(seqno++, log_buff);      
           hinsa_log_print(0,log_buff);                  
           return ;     
	   }
	     
	   /* 외주인력 투입종료 일주일전 메일 발송(외주인력) */
     if (Send_mail_Outsourcing() == SUCCESS)
     {
         sprintf(log_buff, "외주인력 투입종료 일주일전 메일 발송 완료(외주인력) \n");
         Write_batlog(seqno++, log_buff);               
         hinsa_log_print(0,log_buff);                           
     }   

	   /* 외주인력 투입종료 일주일전 메일 발송(담당매니저) */
     if (Send_Mail_Manager() == SUCCESS)
     {
         sprintf(log_buff, "외주인력 투입종료 일주일전 메일 발송 완료(담당매니저) \n");
         Write_batlog(seqno++, log_buff);                                  
         hinsa_log_print(0,log_buff);                           
     }        

     /*투입종료자 처리*/
     if (process_expiration() == SUCCESS)
     {
         sprintf(log_buff, "투입종료자 처리 완료 \n");
         Write_batlog(seqno++, log_buff);   
         hinsa_log_print(0,log_buff);                                    
     }
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
	   {
          sprintf(log_buff, "OK ====== [외주인력 관리 cron 작업 성공] =====\n");
          Write_batlog(seqno++, log_buff); 
          hinsa_exit(0,"OK ====== [외주인력 관리 cron 작업 성공] =====\n");
     }
     /* EXEC SQL COMMIT WORK RELEASE; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}

clear_Mail_Message()
{
     memset(SendProgID, '\0', sizeof(SendProgID));
     memset(SendEmpno,  '\0', sizeof(SendEmpno));
     memset(RcveEmpno,  '\0', sizeof(RcveEmpno));          
     memset(MailSubject,'\0', sizeof(MailSubject));
     memset(MailBody,   '\0', sizeof(MailBody));
     memset(ReceiveYN,  '\0', sizeof(ReceiveYN));   	

     sprintf(SendProgID,"%s",    log_progid);   
     sprintf(SendEmpno, "%s",    "no-reply@skbroadband.com");      
}

/* 외주인력에 메일 전송 */
Send_mail_Outsourcing()
{    
     memset(sql_stmt,  '\0',sizeof(sql_stmt));
     
     /* 기간만료 한달전 외주인력 대상자 조회 */
     /* 2017.07.18 hjku.. 일주일전 메일 발송으로 변경 .. 윤진석M 요청
        "   AND TO_CHAR(SYSDATE,'YYYYMMDD') = to_char(add_months(to_date(A.ENDDATE,'YYYYMMDD'),-1),'YYYYMMDD')     "
     */
     sprintf(sql_stmt,"SELECT A.EMPNO, A.KORNAME, A.EMAIL, A.MANAGERID, B.KORNAME MANAGERNAME, B.SKEMAIL MANAGEREMAIL, ENDDATE   "
                      "  FROM PZMOUTMAS A, PIMPMAS B                                                                             "
                      " WHERE A.MANAGERID = B.EMPNO                                                                              "
                      "   AND TO_CHAR(SYSDATE+7,'YYYYMMDD') = a.ENDDATE                                                          "
                      "   AND TRIM(A.EMAIL) IS NOT NULL                                                                          "
                      "   AND NVL(A.STATEYN,'N')='Y'                                                                             ");                      

     /* EXEC SQL PREPARE S FROM :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )43;
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
     sqlstm.offset = (unsigned int  )62;
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
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
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



          error_quit("작업실패...");
     }
   
     rcount = 0;

     while(1)
     {
          memset(vEmpno,       '\0',sizeof(vEmpno));
          memset(vKorname,     '\0',sizeof(vKorname));
          memset(vEmail,       '\0',sizeof(vEmail));
          memset(vManagerid,   '\0',sizeof(vManagerid));
          memset(vManagername, '\0',sizeof(vManagername));
          memset(vManageremail,'\0',sizeof(vManageremail));                    
          memset(vEnddate,     '\0',sizeof(vEnddate));                   
        
          /* EXEC SQL FETCH  cursor1 INTO  :vEmpno, :vKorname, :vEmail, :vManagerid, :vManagername, :vManageremail,:vEnddate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )92;
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
          sqlstm.sqhstl[1] = (unsigned long )21;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)vEmail;
          sqlstm.sqhstl[2] = (unsigned long )61;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)vManagerid;
          sqlstm.sqhstl[3] = (unsigned long )5;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)vManagername;
          sqlstm.sqhstl[4] = (unsigned long )21;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)vManageremail;
          sqlstm.sqhstl[5] = (unsigned long )61;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)vEnddate;
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
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
          hinsa_trim(vEmail);
          hinsa_trim(vManagerid);      
          hinsa_trim(vManagername);
          hinsa_trim(vManageremail);                          
          hinsa_trim(vEnddate);                         
          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )135;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



               sprintf(log_buff, "처리된 작업대상자 : [%d] 명 \n",rcount);
               Write_batlog(seqno++, log_buff);               
               return SUCCESS;
          }
/*printf("[DEBUG:vEmpno=[%s],vKorname=[%s],vEmail=[%s],vManagerid=[%s],vManagername=[%s],vEnddate=[%s]\n",   
               vEmpno,   vKorname,   vEmail,   vManagerid,   vManagername,   vEnddate);*/        
          
          if (sqlca.sqlcode != 0)
          {
             print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error 1...");
             /* EXEC SQL CLOSE cursor1; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 7;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )150;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



             error_quit("작업실패...");
          }   

          clear_Mail_Message();     
          
          sprintf(RcveEmpno, "%s", vEmail);  
          
          sprintf(MailSubject, "[외주인력 기간 만료 도래 안내]");         
          sprintf(MailBody,  "%s(%s)님의 투입종료일이 %s로 도래하였습니다.        \n"
                             "%s(%s) 담당매니저님을 통해 기간연장해 주시기 바랍니다.\n"
                             "※ 담당 매니저님 부재시 대무 매니저님께 연락하시기 바랍니다.\n"
                             "(기간 만료시 SKB 관련 시스템 사용 제한)"
                             ,vKorname,vEmpno,vEnddate,vManagername,vManagerid);    
          sprintf(ReceiveYN, "%s","N");   
          
           /* EXEC SQL 
                 insert into PZHMAIL                         
                 values (to_char(sysdate,'YYYYMMDDHH24MISS'),
                         :SendProgID         ,
                         :SendEmpno          ,
                         :RcveEmpno          ,
                         ''                  ,
                         :MailSubject        ,
                         ''                  ,
                         :MailBody           ,
                         ''                  ,
                         :ReceiveYN          ,
                         'N'                 ,
                         ''                  ); */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 7;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "insert into PZHMAIL  values (to_char(sysdate,'YYY\
YMMDDHH24MISS'),:b0,:b1,:b2,'',:b3,'',:b4,'',:b5,'N','')";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )165;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)SendProgID;
           sqlstm.sqhstl[0] = (unsigned long )11;
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)SendEmpno;
           sqlstm.sqhstl[1] = (unsigned long )51;
           sqlstm.sqhsts[1] = (         int  )0;
           sqlstm.sqindv[1] = (         short *)0;
           sqlstm.sqinds[1] = (         int  )0;
           sqlstm.sqharm[1] = (unsigned long )0;
           sqlstm.sqadto[1] = (unsigned short )0;
           sqlstm.sqtdso[1] = (unsigned short )0;
           sqlstm.sqhstv[2] = (unsigned char  *)RcveEmpno;
           sqlstm.sqhstl[2] = (unsigned long )51;
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)MailSubject;
           sqlstm.sqhstl[3] = (unsigned long )101;
           sqlstm.sqhsts[3] = (         int  )0;
           sqlstm.sqindv[3] = (         short *)0;
           sqlstm.sqinds[3] = (         int  )0;
           sqlstm.sqharm[3] = (unsigned long )0;
           sqlstm.sqadto[3] = (unsigned short )0;
           sqlstm.sqtdso[3] = (unsigned short )0;
           sqlstm.sqhstv[4] = (unsigned char  *)MailBody;
           sqlstm.sqhstl[4] = (unsigned long )1501;
           sqlstm.sqhsts[4] = (         int  )0;
           sqlstm.sqindv[4] = (         short *)0;
           sqlstm.sqinds[4] = (         int  )0;
           sqlstm.sqharm[4] = (unsigned long )0;
           sqlstm.sqadto[4] = (unsigned short )0;
           sqlstm.sqtdso[4] = (unsigned short )0;
           sqlstm.sqhstv[5] = (unsigned char  *)ReceiveYN;
           sqlstm.sqhstl[5] = (unsigned long )2;
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
               sprintf(log_buff, "ERROR ====== [외주인력 MAIL SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
               Write_batlog(seqno++, log_buff);             
               error_quit("ERROR ====== [외주인력 MAIL SEND 실패] =====\n");
               continue;
          }

          rcount++;  
     }

     return(SUCCESS);
}


/* 담당매니저에 메일 전송 */
Send_Mail_Manager()
{
     memset(sql_stmt,  '\0',sizeof(sql_stmt));
     
     /* 기간만료 한달전 외주인력 대상자 조회 */
     /* 2017.07.18 hjku.. 일주일전 메일 발송으로 변경 .. 윤진석M 요청
        "       WHERE TO_CHAR(SYSDATE,'YYYYMMDD') = TO_CHAR(ADD_MONTHS(TO_DATE(A.ENDDATE,'YYYYMMDD'),-1),'YYYYMMDD')    "
     */     
     sprintf(sql_stmt,"SELECT A.EMPNO, B.KORNAME, A.CNT, A.MANAGERID, C.KORNAME MANAGERNAME, A.ENDDATE                                "
                      "FROM (SELECT A.MANAGERID, ENDDATE,MIN(EMPNO) EMPNO,COUNT(*)-1 CNT                                              "
                      "        FROM PZMOUTMAS A                                                                                       "
                      "       WHERE TO_CHAR(SYSDATE+7,'YYYYMMDD') = a.ENDDATE                                                         "
                      "         AND NVL(A.STATEYN,'N')='Y'                                                                            "
                      "       GROUP BY MANAGERID,ENDDATE) A,                                                                          "
                      "      PZMOUTMAS B,                                                                                             "
                      "      PIMPMAS C                                                                                                "
                      "WHERE A.EMPNO     = B.EMPNO                                                                                    "
                      "  AND B.MANAGERID = C.EMPNO                                                                                    "
                      "  and c.pstate < '80'                                                                                          ");                      

     /* EXEC SQL PREPARE S FROM :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )204;
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
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )223;
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
          /* EXEC SQL CLOSE cursor2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )238;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



          error_quit("작업실패...");
     }
   
     rcount = 0;

     while(1)
     {          
     	    vOut_cnt        = 0;
          memset(vEmpno,       '\0',sizeof(vEmpno));
          memset(vKorname,     '\0',sizeof(vKorname));
          memset(vManagerid,   '\0',sizeof(vManagerid));
          memset(vManagername, '\0',sizeof(vManagername));
          memset(vEnddate,     '\0',sizeof(vEnddate));   
     
          /* EXEC SQL FETCH  cursor2 INTO  :vEmpno, :vKorname, :vOut_cnt, :vManagerid, :vManagername,:vEnddate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )253;
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
          sqlstm.sqhstl[1] = (unsigned long )21;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&vOut_cnt;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)vManagerid;
          sqlstm.sqhstl[3] = (unsigned long )5;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)vManagername;
          sqlstm.sqhstl[4] = (unsigned long )21;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)vEnddate;
          sqlstm.sqhstl[5] = (unsigned long )9;
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


        
          hinsa_trim(vEmpno);
          hinsa_trim(vKorname);      
          hinsa_trim(vManagerid);      
          hinsa_trim(vManagername);
          hinsa_trim(vEnddate);       

/*printf("[DEBUG:vEmpno=[%s],vKorname=[%s],vOut_cnt=[%d],vManagerid=[%s],vManagername=[%s],vEnddate=[%s]\n",   
               vEmpno,   vKorname,   vOut_cnt,   vManagerid,   vManagername,   vEnddate);*/        
               
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )292;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



               sprintf(log_buff, "처리된 작업대상자 : [%d] 명 \n",rcount);
               Write_batlog(seqno++, log_buff);               
               return SUCCESS;
          }
          
          if (sqlca.sqlcode != 0)
          {
             print_errmsg(sqlca.sqlcode,"Cursor cursor2 Data Fetch Error 1...");
             /* EXEC SQL CLOSE cursor2; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 7;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )307;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



             error_quit("작업실패...");
          }   

          clear_Mail_Message();
          	
          sprintf(RcveEmpno, "%s",vManagerid);  
          
          sprintf(MailSubject, "[외주인력 기간 만료 도래 안내]");         
          
          if(vOut_cnt == 0) {
               sprintf(MailBody,  "%s(%s)님의 투입종료일이 %s로 도래하였습니다.\n"
                                  "담당 매니저님은 아래 항목에서 기간 연장 해주시기 바랍니다.\n"
																	": MyHR -> 인사 -> 외주인력 -> 외주인력 기간연장"
                                 ,vKorname,vEmpno,vEnddate);    
          } 
          else 
          {
               sprintf(MailBody,  "%s(%s)님 외 %d명의 투입종료일이 %s로 도래하였습니다.\n"
                                  "담당 매니저님은 아래 항목에서 기간 연장 해주시기 바랍니다.\n"
																	": MyHR -> 인사 -> 외주인력 -> 외주인력 기간연장"
                                 ,vKorname,vEmpno,vOut_cnt,vEnddate);    
          }  

          sprintf(ReceiveYN, "%s","N"); 

           /* EXEC SQL 
                 insert into PZHMAIL                         
                 values (to_char(sysdate,'YYYYMMDDHH24MISS'),
                         :SendProgID         ,
                         :SendEmpno          ,
                         :RcveEmpno          ,
                         ''                  ,
                         :MailSubject        ,
                         ''                  ,
                         :MailBody           ,
                         ''                  ,
                         :ReceiveYN          ,
                         'N'                 ,
                         ''                  ); */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 7;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "insert into PZHMAIL  values (to_char(sysdate,'YYY\
YMMDDHH24MISS'),:b0,:b1,:b2,'',:b3,'',:b4,'',:b5,'N','')";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )322;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)SendProgID;
           sqlstm.sqhstl[0] = (unsigned long )11;
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)SendEmpno;
           sqlstm.sqhstl[1] = (unsigned long )51;
           sqlstm.sqhsts[1] = (         int  )0;
           sqlstm.sqindv[1] = (         short *)0;
           sqlstm.sqinds[1] = (         int  )0;
           sqlstm.sqharm[1] = (unsigned long )0;
           sqlstm.sqadto[1] = (unsigned short )0;
           sqlstm.sqtdso[1] = (unsigned short )0;
           sqlstm.sqhstv[2] = (unsigned char  *)RcveEmpno;
           sqlstm.sqhstl[2] = (unsigned long )51;
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)MailSubject;
           sqlstm.sqhstl[3] = (unsigned long )101;
           sqlstm.sqhsts[3] = (         int  )0;
           sqlstm.sqindv[3] = (         short *)0;
           sqlstm.sqinds[3] = (         int  )0;
           sqlstm.sqharm[3] = (unsigned long )0;
           sqlstm.sqadto[3] = (unsigned short )0;
           sqlstm.sqtdso[3] = (unsigned short )0;
           sqlstm.sqhstv[4] = (unsigned char  *)MailBody;
           sqlstm.sqhstl[4] = (unsigned long )1501;
           sqlstm.sqhsts[4] = (         int  )0;
           sqlstm.sqindv[4] = (         short *)0;
           sqlstm.sqinds[4] = (         int  )0;
           sqlstm.sqharm[4] = (unsigned long )0;
           sqlstm.sqadto[4] = (unsigned short )0;
           sqlstm.sqtdso[4] = (unsigned short )0;
           sqlstm.sqhstv[5] = (unsigned char  *)ReceiveYN;
           sqlstm.sqhstl[5] = (unsigned long )2;
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
               sprintf(log_buff, "ERROR ====== [Manager MAIL SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
               Write_batlog(seqno++, log_buff);             
               error_quit("ERROR ====== [Manager MAIL SEND 실패] =====\n");
               continue;
          }
          
          rcount++;  
     }
          
     return(SUCCESS);	
}

int process_expiration()
{     
     /* 외주인력 투입종료 대상자 처리 */     
     hinsa_log_print(0, "외주인력 투입종료 대상자 작업 시작...");

     /* EXEC SQL 
          UPDATE PZMOUTMAS  
             SET STATEYN   = 'N',
                 WRITEMAN  = '0000',
                 WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDD')
           WHERE NVL(ENDDATE,'99999999') < TO_CHAR(SYSDATE,'YYYYMMDD')
             AND NVL(STATEYN,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PZMOUTMAS  set STATEYN='N',WRITEMAN='0000',WRITE\
TIME=TO_CHAR(SYSDATE,'YYYYMMDD') where (NVL(ENDDATE,'99999999')<TO_CHAR(SYSDA\
TE,'YYYYMMDD') and NVL(STATEYN,'N')='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )361;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(log_buff, "외주인력 투입종료 대상자 작업 에러 : %s", SQLERRM);
          Write_batlog(seqno++, log_buff);   
          return (FAILURE);
     }     
     
     sprintf(log_buff, "외주인력 투입종료 대상자 수 : %d", SQL_PROCESS_COUNT);
     Write_batlog(seqno++, log_buff);              

     return SUCCESS;
}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (TO_CHAR(SYSDATE,'YYYYMMDD\
HH24MISS'),:b0,:b1,:b2,:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )376;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)log_progid;
     sqlstm.sqhstl[0] = (unsigned long )16;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&seqno;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)log_writeman;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)message;
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


     	
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     {  
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);   
          return(FAILURE);
     }                       
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )413;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}
