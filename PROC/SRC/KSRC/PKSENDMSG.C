
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
    "pksendmsg.pc"
};


static unsigned int sqlctx = 319907;


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
   unsigned char  *sqhstv[96];
   unsigned long  sqhstl[96];
            int   sqhsts[96];
            short *sqindv[96];
            int   sqinds[96];
   unsigned long  sqharm[96];
   unsigned long  *sqharc[96];
   unsigned short  sqadto[96];
   unsigned short  sqtdso[96];
} sqlstm = {12,96};

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
5,0,0,1,103,0,3,142,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
40,0,0,2,0,0,24,200,0,0,1,1,0,1,0,1,97,0,0,
59,0,0,3,201,0,4,227,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
82,0,0,4,742,0,4,239,0,0,8,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,1,97,0,0,
129,0,0,5,881,0,4,265,0,0,8,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,1,97,0,0,
176,0,0,6,88,0,4,358,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
199,0,0,7,5195,0,4,365,0,0,96,95,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
598,0,0,8,5195,0,4,423,0,0,96,95,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
997,0,0,9,80,0,4,482,0,0,4,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,2,4,0,0,
1028,0,0,10,96,0,4,516,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1051,0,0,11,112,0,4,524,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
1078,0,0,12,212,0,4,546,0,0,1,0,0,1,0,2,3,0,0,
1097,0,0,13,388,0,4,567,0,0,1,0,0,1,0,2,97,0,0,
1116,0,0,14,0,0,17,615,0,0,1,1,0,1,0,1,97,0,0,
1135,0,0,14,0,0,45,618,0,0,0,0,0,1,0,
1150,0,0,14,0,0,15,624,0,0,0,0,0,1,0,
1165,0,0,14,0,0,13,635,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1188,0,0,14,0,0,15,642,0,0,0,0,0,1,0,
1203,0,0,14,0,0,15,651,0,0,0,0,0,1,0,
1218,0,0,15,50,0,3,683,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
1259,0,0,16,0,0,29,693,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pksendmsg
 SYSTEM-NAME    : 종합인사관리.
 SUBSYSTEM-NAME : 연차발생 전일 MAIL/SMS 전송
 Programmer     : 구해자
 Version        : 1.00
 Date           : 2013.07.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description
   1.00       2013.07.01         hjku            최초개발본
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

     char  vCurrDate[8+1];
     char  CurrYYYY1[4+1];
     char  CurrMM[2+1];
     char  CurrDD[2+1];

     char  vNextDate1[8+1];
     char  NextYYYY1[4+1];
     char  NextMM1[2+1];
     char  NextDD1[2+1];

     char  vNextDate2[8+1];
     char  NextYYYY2[4+1];
     char  NextMM2[2+1];
     char  NextDD2[2+1];

     float vYearly_cnt;

     char  vEmpno[4+1];
     char  vKorname[20+1];
     char  vJobCode[3+1];
     char  vJobName[20+1];
     char  vConJobCode[3+1];
     char  vConJobName[20+1];
     char  vConEmpno[4+1];
     char  vHandTel[24+1];
     char  vSendTel[24+1];
     char  vMobile[24+1];
     char  vConMobile[24+1];
     char  vFlag[10+1];
     char  vSmsSubject[200+1];
     char  vSmsBody[1024+1];
     /* 팀장여부 추가 - 2018.03.08 Lee SangMoon */
     char  vLeaderYN[1+1];

     char  sql_stmt[5000+1];
     char  SendProgID[16];
     char  SendEmpno[16];
     char  RcveEmpno[16];
     char  MailBody[1024+1];
     char  MailSubject[200+1];
     char  ReceiveYN[16];

     float vSend_cnt;
     char  sqlstr[1024];
/* EXEC SQL END  DECLARE SECTION; */ 


FILE *fp = stdout;

char  log_progid[16]  = "pksendmsg";
char  log_writeman[5] = "CRON";
char  log_rundate[16] = "";
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
     hinsa_log_print(0,"SMS SEND 시작...0");
     hinsa_db_connect();  /*DB Connect 실시..*/

     /* EXEC SQL DECLARE log_db DATABASE; */ 

     hinsa_log_db_connect();


     process_message();

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else
	     {
          sprintf(log_buff, "OK ====== [연차발생 MAIL/SMS 전송 성공] =====\n");
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0,"OK ====== [연차발생 MAIL/SMS 전송 성공] =====\n");
     }
}

Send_MAIL()
{
     sprintf(SendProgID,"%s",log_progid);
     sprintf(SendEmpno, "adm");
     sprintf(RcveEmpno, "%s",vConEmpno);

     /* 팀장여부 추가 - 2018.03.08 Lee SangMoon */
     if (strcmp(vLeaderYN, "N") == 0) {        /*팀원*/
         sprintf(MailSubject, "[구성원 연차휴가 사용안내]");
     } else if (strcmp(vLeaderYN, "Y") == 0) { /*팀장*/
         sprintf(MailSubject, "[팀장 연차휴가 사용안내]");
     }
     sprintf(MailBody,  "%s%s의 연차휴가 사용 계획일은 %s월 %s일부터 %s월 %s일(%0.1f일)까지 입니다.\n계획된 휴가일에 대상자가 연차휴가를 사용함으로써 충분한 Refresh의 기회로 활용할 수 있도록 각별한 관심과 배려를 당부드립니다. "
     ,hinsa_trim(vKorname),hinsa_trim(vJobName),NextMM1,NextDD1,NextMM2,NextDD2,vYearly_cnt);
     sprintf(ReceiveYN, "N");

     /* EXEC SQL
            insert into PZHMAIL
            values (to_char(sysdate,'YYYYMMDDHHMISS'),
                    :SendProgID         ,
                    :SendEmpno          ,
                    :RcveEmpno          ,
                    ''                  ,
                    :MailSubject        ,
                    ''                  ,
                    :MailBody           ,
                    ''                  ,
                    'N'                 ,
                    'N'                 ,
                    ''                  ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PZHMAIL  values (to_char(sysdate,'YYYYMMDDH\
HMISS'),:b0,:b1,:b2,'',:b3,'',:b4,'','N','N','')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)SendProgID;
     sqlstm.sqhstl[0] = (unsigned long )16;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)SendEmpno;
     sqlstm.sqhstl[1] = (unsigned long )16;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)RcveEmpno;
     sqlstm.sqhstl[2] = (unsigned long )16;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)MailSubject;
     sqlstm.sqhstl[3] = (unsigned long )201;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)MailBody;
     sqlstm.sqhstl[4] = (unsigned long )1025;
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



     if  (sqlca.sqlcode != 0)
     {
          sprintf(log_buff, "ERROR ====== [MAIL SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);
          error_quit("ERROR ====== [MAIL SEND 실패] =====\n");
          return (FAIL);
     }
     else
          return(SUCCESS);
}

int send_SMS(char *sendtel, char *rcvtel, char *flag)
{
     sprintf(vHandTel, "%s",rcvtel);
     sprintf(vSendTel, "%s",sendtel);

     /* 팀장여부 추가 - 2018.03.08 Lee SangMoon */
     if (strcmp(vLeaderYN, "N") == 0) {        /*팀원*/
       sprintf(vSmsSubject, "[구성원 연차휴가 사용안내]");
     } else if (strcmp(vLeaderYN, "Y") == 0) { /*팀장*/
       sprintf(vSmsSubject, "[팀장 연차휴가 사용안내]");
     }
     
     if (strcmp(flag,"1") == 0) {      /*팀장*/
         sprintf(vSmsBody, "%s월 %s일부터 %s월 %s일(%0.1f일)까지 %s%s의 연차휴가 사용 계획일입니다.\n대상자가 연차휴가를 사용할 수 있도록 리더의 적극적인 관심과 배려를 당부드립니다.",
                           NextMM1,NextDD1,NextMM2,NextDD2,vYearly_cnt,hinsa_trim(vKorname),hinsa_trim(vJobName));
     }else if (strcmp(flag,"2") == 0) {/*팀원*/
         sprintf(vSmsBody, "%s월 %s일부터 %s월 %s일(%0.1f일)까지 %s%s의 연차휴가 사용 계획일입니다.\n 즐거운 휴가 보내시기 바랍니다.",
                           NextMM1,NextDD1,NextMM2,NextDD2,vYearly_cnt,hinsa_trim(vKorname),hinsa_trim(vJobName));
     }

     /*sprintf(log_buff, "HPER.SENDSMS ...[%s][%s][%s][%s][%s][%s]",vEmpno,hinsa_trim(vJobName),vConEmpno,flag,vHandTel,vSendTel);
     //Write_batlog(seqno++, log_buff);
     printf("DEBUG:%s\n",log_buff);*/

     /*장비변경으로 SMS전송 실행로직 변경 : 2014.11.05. dsa2000*/
     /*EXEC SQL EXECUTE
     BEGIN
          HPER.SENDSMS(trim(:vHandTel), trim(:vSendTel), :vSmsBody, :vSmsSubject);
     END;
     END-EXEC; */

     sprintf(sqlstr,"Call HPER.SENDSMS(trim('%s'), trim('%s'), '%s', '%s')", vHandTel,vSendTel,vSmsBody,vSmsSubject);
     /* EXEC SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )40;
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
          sprintf(log_buff, "ERROR ====== [SMS SEND 실패] ORA-%05d - \n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);
          error_quit("ERROR ====== [SMS SEND 실패] =====\n");
          return (FAIL);
     }
     else
          return(SUCCESS);
}

Send_Message()
{
    char  temp_empno[2];

    memset(vMobile    ,'\0',sizeof(vMobile));
    memset(vJobCode   ,'\0',sizeof(vJobCode));
    memset(vJobName   ,'\0',sizeof(vJobName));
    memset(vConEmpno  ,'\0',sizeof(vConEmpno));
    memset(vConMobile ,'\0',sizeof(vConMobile));
    memset(vConJobCode,'\0',sizeof(vConJobCode));
    memset(vConJobName,'\0',sizeof(vConJobName));
    memset(vLeaderYN  ,'\0',sizeof(vLeaderYN));

    /* EXEC SQL
    SELECT CASE WHEN PAYRA IN ('C11','C18','C12','C20')       THEN 'Y'   /odsa2000  2018.11  ('C11','C18') => ('C11','C18','C12','C20') o/
                WHEN PAYRA IN ('D11','D41','D91','H10','H41'
                              ,'D51','D61','H11','K11','O31') THEN 'N'
           ELSE 'N'
            END
      INTO :vLeaderYN
      FROM PIMPMAS
     WHERE EMPNO = :vEmpno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 5;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select  case  when PAYRA in ('C11','C18','C12','C20') th\
en 'Y' when PAYRA in ('D11','D41','D91','H10','H41','D51','D61','H11','K11','\
O31') then 'N' else 'N'  end  into :b0  from PIMPMAS where EMPNO=:b1";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )59;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vLeaderYN;
    sqlstm.sqhstl[0] = (unsigned long )2;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[1] = (unsigned long )5;
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



    if (strcmp(vLeaderYN, "N") == 0)
    {
         /* EXEC SQL   
         SELECT TRANSLATE(B.RETCONT,'0123456789'||B.RETCONT,'0123456789') SENDTEL,
                A.PAYRA JOBCODE,
                CASE WHEN A.PAYRA IN ('C11','C18','C12','C20')             THEN '팀장'  /o2018.11 Add  ,'C12','C20' o/
                     WHEN A.PAYRA IN ('D11')                               THEN '매니저'
                     WHEN A.PAYRA IN ('D41')                               THEN '비상계획관'
                     WHEN A.PAYRA IN ('D91','H10','H41')                   THEN '팀원'
                     WHEN A.PAYRA IN ('D51','D61','H11','K11','O31')       THEN '사원'
                     ELSE D.CODENAME END JOBNAME,
                EEMPNO,
                TRANSLATE(C.RETCONT,'0123456789'||C.RETCONT,'0123456789') CONSENDTEL,
                A.EPAYRA CONJOBCODE,
                E.CODENAME CONJOBNAME
           INTO :vMobile, :vJobCode, :vJobName,:vConEmpno, :vConMobile,:vConJobCode,:vConJobName
           FROM  PIMEEMP  A, PIMPMAS B, PIMPMAS C, PYCCODE D, PYCCODE E
          WHERE  A.EMPNO  = :vEmpno
            AND  A.EMPNO  = B.EMPNO
            AND  A.EEMPNO = C.EMPNO
            AND  D.CODEID ='I113'
            AND  A.PAYRA  = D.CODENO
            AND  E.CODEID ='I113'
            AND  A.EPAYRA = E.CODENO; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 8;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select translate(B.RETCONT,('0123456789'||B.RETCONT\
),'0123456789') SENDTEL ,A.PAYRA JOBCODE , case  when A.PAYRA in ('C11','C18'\
,'C12','C20') then '팀장' when A.PAYRA in ('D11') then '매니저' when A.PAYRA \
in ('D41') then '비상계획관' when A.PAYRA in ('D91','H10','H41') then '팀원' \
when A.PAYRA in ('D51','D61','H11','K11','O31') then '사원' else D.CODENAME  \
end  JOBNAME ,EEMPNO ,translate(C.RETCONT,('0123456789'||C.RETCONT),'01234567\
89') CONSENDTEL ,A.EPAYRA CONJOBCODE ,E.CODENAME CONJOBNAME into :b0,:b1,:b2,\
:b3,:b4,:b5,:b6  from PIMEEMP A ,PIMPMAS B ,PIMPMAS C ,PYCCODE D ,PYCCODE E w\
here ((((((A.EMPNO=:b7 and A.EMPNO=B.EMPNO) and A.EEMPNO=C.EMPNO) and D.CODEI\
D='I113') and A.PAYRA=D.CODENO) and E.CODEID='I113') and A.EPAYRA=E.CODENO)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )82;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)vMobile;
         sqlstm.sqhstl[0] = (unsigned long )25;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)vJobCode;
         sqlstm.sqhstl[1] = (unsigned long )4;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)vJobName;
         sqlstm.sqhstl[2] = (unsigned long )21;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)vConEmpno;
         sqlstm.sqhstl[3] = (unsigned long )5;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)vConMobile;
         sqlstm.sqhstl[4] = (unsigned long )25;
         sqlstm.sqhsts[4] = (         int  )0;
         sqlstm.sqindv[4] = (         short *)0;
         sqlstm.sqinds[4] = (         int  )0;
         sqlstm.sqharm[4] = (unsigned long )0;
         sqlstm.sqadto[4] = (unsigned short )0;
         sqlstm.sqtdso[4] = (unsigned short )0;
         sqlstm.sqhstv[5] = (unsigned char  *)vConJobCode;
         sqlstm.sqhstl[5] = (unsigned long )4;
         sqlstm.sqhsts[5] = (         int  )0;
         sqlstm.sqindv[5] = (         short *)0;
         sqlstm.sqinds[5] = (         int  )0;
         sqlstm.sqharm[5] = (unsigned long )0;
         sqlstm.sqadto[5] = (unsigned short )0;
         sqlstm.sqtdso[5] = (unsigned short )0;
         sqlstm.sqhstv[6] = (unsigned char  *)vConJobName;
         sqlstm.sqhstl[6] = (unsigned long )21;
         sqlstm.sqhsts[6] = (         int  )0;
         sqlstm.sqindv[6] = (         short *)0;
         sqlstm.sqinds[6] = (         int  )0;
         sqlstm.sqharm[6] = (unsigned long )0;
         sqlstm.sqadto[6] = (unsigned short )0;
         sqlstm.sqtdso[6] = (unsigned short )0;
         sqlstm.sqhstv[7] = (unsigned char  *)vEmpno;
         sqlstm.sqhstl[7] = (unsigned long )5;
         sqlstm.sqhsts[7] = (         int  )0;
         sqlstm.sqindv[7] = (         short *)0;
         sqlstm.sqinds[7] = (         int  )0;
         sqlstm.sqharm[7] = (unsigned long )0;
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


         
    }
    else if (strcmp(vLeaderYN, "Y") == 0)  //팀장도 연차 하루전에 실/부문장에게 메일발송위해 추가. 김진호M - 2018.03.05 Lee SangMoon Add
    {
         /* EXEC SQL
         SELECT TRANSLATE(B.RETCONT,'0123456789'||B.RETCONT,'0123456789') SENDTEL,
                B.PAYRA JOBCODE,
                CASE WHEN B.PAYRA IN ('C11','C18','C12','C20')            THEN '팀장'  /o2018.11 Add  ,'C12','C20' o/
                     WHEN B.PAYRA IN ('D11')                              THEN '매니저'
                     WHEN B.PAYRA IN ('D41')                              THEN '비상계획관'
                     WHEN B.PAYRA IN ('D91','H10','H41')                  THEN '팀원'
                     WHEN B.PAYRA IN ('D51','D61','H11','K11','O31')      THEN '사원'
                     ELSE D.CODENAME END JOBNAME,
                SUPEREMPCODE,
                TRANSLATE(C.RETCONT,'0123456789'||C.RETCONT,'0123456789') CONSENDTEL,
                C.PAYRA CONJOBCODE,
                E.CODENAME CONJOBNAME
           INTO :vMobile, :vJobCode, :vJobName, :vConEmpno, :vConMobile, :vConJobCode, :vConJobName
           FROM  EAI_PIMPMAS  A, PIMPMAS B, PIMPMAS C, PYCCODE D, PYCCODE E
          WHERE  A.EMPCODE  = :vEmpno
            AND  A.EMPCODE  = B.EMPNO
            AND  A.SUPEREMPCODE = C.EMPNO
            AND  D.CODEID ='I113'
            AND  B.PAYRA  = D.CODENO
            AND  E.CODEID ='I113'
            AND  C.PAYRA = E.CODENO
            AND  A.H_YEAR = TO_CHAR(SYSDATE,'YYYY')
            AND  A.EAI_DATE = (SELECT MAX(EAI_DATE) FROM EAI_PIMPMAS WHERE EMPCODE = A.EMPCODE) ; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 8;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select translate(B.RETCONT,('0123456789'||B.RETCONT\
),'0123456789') SENDTEL ,B.PAYRA JOBCODE , case  when B.PAYRA in ('C11','C18'\
,'C12','C20') then '팀장' when B.PAYRA in ('D11') then '매니저' when B.PAYRA \
in ('D41') then '비상계획관' when B.PAYRA in ('D91','H10','H41') then '팀원' \
when B.PAYRA in ('D51','D61','H11','K11','O31') then '사원' else D.CODENAME  \
end  JOBNAME ,SUPEREMPCODE ,translate(C.RETCONT,('0123456789'||C.RETCONT),'01\
23456789') CONSENDTEL ,C.PAYRA CONJOBCODE ,E.CODENAME CONJOBNAME into :b0,:b1\
,:b2,:b3,:b4,:b5,:b6  from EAI_PIMPMAS A ,PIMPMAS B ,PIMPMAS C ,PYCCODE D ,PY\
CCODE E where ((((((((A.EMPCODE=:b7 and A.EMPCODE=B.EMPNO) and A.SUPEREMPCODE\
=C.EMPNO) and D.CODEID='I113') and B.PAYRA=D.CODENO) and E.CODEID='I113') and\
 C.PAYRA=E.CODENO) and A.H_YEAR=TO_CHAR(SYSDATE,'YYYY')) and A.EAI_DATE=(sele\
ct max(EAI_DATE)  from EAI_PIMPMAS where EMPCODE=A.EMPCODE))";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )129;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)vMobile;
         sqlstm.sqhstl[0] = (unsigned long )25;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)vJobCode;
         sqlstm.sqhstl[1] = (unsigned long )4;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)vJobName;
         sqlstm.sqhstl[2] = (unsigned long )21;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)vConEmpno;
         sqlstm.sqhstl[3] = (unsigned long )5;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)vConMobile;
         sqlstm.sqhstl[4] = (unsigned long )25;
         sqlstm.sqhsts[4] = (         int  )0;
         sqlstm.sqindv[4] = (         short *)0;
         sqlstm.sqinds[4] = (         int  )0;
         sqlstm.sqharm[4] = (unsigned long )0;
         sqlstm.sqadto[4] = (unsigned short )0;
         sqlstm.sqtdso[4] = (unsigned short )0;
         sqlstm.sqhstv[5] = (unsigned char  *)vConJobCode;
         sqlstm.sqhstl[5] = (unsigned long )4;
         sqlstm.sqhsts[5] = (         int  )0;
         sqlstm.sqindv[5] = (         short *)0;
         sqlstm.sqinds[5] = (         int  )0;
         sqlstm.sqharm[5] = (unsigned long )0;
         sqlstm.sqadto[5] = (unsigned short )0;
         sqlstm.sqtdso[5] = (unsigned short )0;
         sqlstm.sqhstv[6] = (unsigned char  *)vConJobName;
         sqlstm.sqhstl[6] = (unsigned long )21;
         sqlstm.sqhsts[6] = (         int  )0;
         sqlstm.sqindv[6] = (         short *)0;
         sqlstm.sqinds[6] = (         int  )0;
         sqlstm.sqharm[6] = (unsigned long )0;
         sqlstm.sqadto[6] = (unsigned short )0;
         sqlstm.sqtdso[6] = (unsigned short )0;
         sqlstm.sqhstv[7] = (unsigned char  *)vEmpno;
         sqlstm.sqhstl[7] = (unsigned long )5;
         sqlstm.sqhsts[7] = (         int  )0;
         sqlstm.sqindv[7] = (         short *)0;
         sqlstm.sqinds[7] = (         int  )0;
         sqlstm.sqharm[7] = (unsigned long )0;
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


    }

     hinsa_trim(vMobile);
     hinsa_trim(vJobCode);
     hinsa_trim(vJobName);
     hinsa_trim(vConEmpno);
     hinsa_trim(vConMobile);
     hinsa_trim(vConJobCode);
     hinsa_trim(vConJobName);


     if  (sqlca.sqlcode != 0)
     {
          sprintf(log_buff, "Send_Message 오류...SQLCODE[%s]\n", sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     memset(temp_empno,'\0',sizeof(temp_empno));
     strncpy(temp_empno,vEmpno,1);

     /*if ((strcmp(vJobCode,"D11")==0)||
         (strcmp(vJobCode,"D91")==0)||
         (strcmp(vJobCode,"H10")==0)||
         (strcmp(vJobCode,"H11")==0)||
         (strcmp(vJobCode,"K11")==0))
     {
        memset(vJobName   ,'\0',sizeof(vJobName));

        if((strcmp(temp_empno,"P")==0)||
           (strcmp(temp_empno,"Q")==0)||
           (strcmp(temp_empno,"Y")==0)) {
              sprintf(vJobName,"사원");
        }else{
            sprintf(vJobName,"M");
        }
     } */

     /* 결재자가 CEO인 경우 제외 - 2018.07.12 Lee SangMoon */
     if (strcmp(vConJobCode, "A21") == 0)
     {
         return(FAIL);
     }

     if ((Send_MAIL() == SUCCESS) &&
         /* 담당 매니저 변경으로 발신자 번호 변경 - 2017.10.18 Lee SangMoon */
         /* 이명노M(02-6266-3035) -> 박명언M(02-6266-6875) */
         //(send_SMS("0262663035",vConMobile,"1") == SUCCESS)&&
         //(send_SMS("0262663035",vMobile   ,"2") == SUCCESS) )
         (send_SMS("0262666875",vConMobile,"1") == SUCCESS)&&
         (send_SMS("0262666875",vMobile   ,"2") == SUCCESS) )
          return(SUCCESS);
     else return(FAIL);
}

get_next_yearly_date()
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

         char  vStrtDate[8+1];
         char  vEndDate[8+1];
         char  vTempDate[8+1];
    /* EXEC SQL END  DECLARE SECTION; */ 


    memset(vStrtDate,  '\0',sizeof(vStrtDate));
    memset(vEndDate,   '\0',sizeof(vEndDate));
    memset(vTempDate,  '\0',sizeof(vTempDate));

    strcpy(vStrtDate, vNextDate1);

    /* EXEC SQL
            SELECT TO_CHAR(add_months(to_date(:vStrtDate,'YYYYMMDD'),+1),'YYYYMMDD')
              INTO :vEndDate
              FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 8;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select TO_CHAR(add_months(to_date(:b0,'YYYYMMDD'),(+1)),\
'YYYYMMDD') into :b1  from DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )176;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vEndDate;
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



    hinsa_trim(vEndDate);

    /* EXEC SQL
            SELECT MIN(YYYYMMDD)
              INTO :vTempDate
              FROM (SELECT
                          A.YYYYMMDD,
                          EMPNO,
                          CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                               THEN '0'
                               ELSE '1' END DAYCODE,
                          CASE WHEN DUTYCODE IS NULL
                               THEN (CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                               THEN '49'
                               ELSE '99' END)
                               ELSE DUTYCODE END DUTYCODE
                      FROM
                          PKHCALDAYS A,
                          PKCHOLI B,
                          (SELECT DUYYMM||'01' DUTYYYMMDD, EMPNO,  DD1 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'02' DUTYYYMMDD, EMPNO,  DD2 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'03' DUTYYYMMDD, EMPNO,  DD3 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'04' DUTYYYMMDD, EMPNO,  DD4 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'05' DUTYYYMMDD, EMPNO,  DD5 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'06' DUTYYYMMDD, EMPNO,  DD6 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'07' DUTYYYMMDD, EMPNO,  DD7 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'08' DUTYYYMMDD, EMPNO,  DD8 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'09' DUTYYYMMDD, EMPNO,  DD9 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'10' DUTYYYMMDD, EMPNO, DD10 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'11' DUTYYYMMDD, EMPNO, DD11 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'12' DUTYYYMMDD, EMPNO, DD12 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'13' DUTYYYMMDD, EMPNO, DD13 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'14' DUTYYYMMDD, EMPNO, DD14 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'15' DUTYYYMMDD, EMPNO, DD15 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'16' DUTYYYMMDD, EMPNO, DD16 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'17' DUTYYYMMDD, EMPNO, DD17 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'18' DUTYYYMMDD, EMPNO, DD18 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'19' DUTYYYMMDD, EMPNO, DD19 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'20' DUTYYYMMDD, EMPNO, DD20 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'21' DUTYYYMMDD, EMPNO, DD21 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'22' DUTYYYMMDD, EMPNO, DD22 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'23' DUTYYYMMDD, EMPNO, DD23 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'24' DUTYYYMMDD, EMPNO, DD24 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'25' DUTYYYMMDD, EMPNO, DD25 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'26' DUTYYYMMDD, EMPNO, DD26 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'27' DUTYYYMMDD, EMPNO, DD27 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'28' DUTYYYMMDD, EMPNO, DD28 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'29' DUTYYYMMDD, EMPNO, DD29 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'30' DUTYYYMMDD, EMPNO, DD30 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno UNION ALL
                           SELECT DUYYMM||'31' DUTYYYMMDD, EMPNO, DD31 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vEndDate,1,6) AND EMPNO = :vEmpno
                          )C
                       WHERE A.YYYYMMDD BETWEEN :vStrtDate AND :vEndDate
                         AND A.YYYYMMDD = B.HOLIDATE(+)
                         AND A.YYYYMMDD = C.DUTYYYMMDD(+)
              )A
              WHERE DAYCODE ='1'
                AND DUTYCODE IN ('00','99'); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 96;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "select min(YYYYMMDD) into :b0  from (select A.YYYYMMDD ,EMPNO , case \
 when (A.DAYCODE in ('1','7') or B.HOLIDATE is  not null ) then '0' else '1'\
  end  DAYCODE , case  when DUTYCODE is null  then  case  when (A.DAYCODE in\
 ('1','7') or B.HOLIDATE is  not null ) then '49' else '99'  end  else DUTYC\
ODE  end  DUTYCODE  from PKHCALDAYS A ,PKCHOLI B ,(select (DUYYMM||'01') DUT\
YYYMMDD ,EMPNO ,DD1 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'02') DUTY\
YYMMDD ,EMPNO ,DD2 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1\
,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'03') DUTYY\
YMMDD ,EMPNO ,DD3 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,\
6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'04') DUTYYY\
MMDD ,EMPNO ,DD4 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6\
) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'05') DUTYYYM\
MDD ,EMPNO ,DD5 DUTYCODE  from PKHDUTY wher");
    sqlbuft((void **)0,
      "e (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'06') DUTYYYMMDD ,EMPNO ,DD6 DUTYCODE  from PKHDUT\
Y where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) u\
nion all select (DUYYMM||'07') DUTYYYMMDD ,EMPNO ,DD7 DUTYCODE  from PKHDUTY\
 where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) un\
ion all select (DUYYMM||'08') DUTYYYMMDD ,EMPNO ,DD8 DUTYCODE  from PKHDUTY \
where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) uni\
on all select (DUYYMM||'09') DUTYYYMMDD ,EMPNO ,DD9 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'10') DUTYYYMMDD ,EMPNO ,DD10 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'11') DUTYYYMMDD ,EMPNO ,DD11 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'12') DUTYYYMMDD ,EMP");
    sqlbuft((void **)0,
      "NO ,DD12 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'13') DUTYYYMM\
DD ,EMPNO ,DD13 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'14') DUTYYYMM\
DD ,EMPNO ,DD14 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'15') DUTYYYMM\
DD ,EMPNO ,DD15 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'16') DUTYYYMM\
DD ,EMPNO ,DD16 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'17') DUTYYYMM\
DD ,EMPNO ,DD17 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'18') DUTYYYMM\
DD ,EMPNO ,DD18 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union a");
    sqlbuft((void **)0,
      "ll select (DUYYMM||'19') DUTYYYMMDD ,EMPNO ,DD19 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'20') DUTYYYMMDD ,EMPNO ,DD20 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'21') DUTYYYMMDD ,EMPNO ,DD21 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'22') DUTYYYMMDD ,EMPNO ,DD22 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'23') DUTYYYMMDD ,EMPNO ,DD23 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'24') DUTYYYMMDD ,EMPNO ,DD24 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'25') DUTYYYMMDD ,EMPNO ,DD25 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) an");
    sqlbuft((void **)0,
      "d SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'26') DUTY\
YYMMDD ,EMPNO ,DD26 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'27') DUTY\
YYMMDD ,EMPNO ,DD27 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'28') DUTY\
YYMMDD ,EMPNO ,DD28 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'29') DUTY\
YYMMDD ,EMPNO ,DD29 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'30') DUTY\
YYMMDD ,EMPNO ,DD30 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'31') DUTY\
YYMMDD ,EMPNO ,DD31 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3)) C where ((A.YYYYMMDD between :b1 an\
d :b2 and A.YYYYMMDD=B.HOLIDATE(+)) and A.Y");
    sqlstm.stmt = "YYYMMDD=C.DUTYYYMMDD(+))) A where (DAYCODE='1' and DUTYC\
ODE in ('00','99'))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )199;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[1] = (unsigned long )9;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[2] = (unsigned long )9;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[4] = (unsigned long )9;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[5] = (unsigned long )9;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[6] = (unsigned long )5;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[7] = (unsigned long )9;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[8] = (unsigned long )9;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[9] = (unsigned long )5;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[10] = (unsigned long )9;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[11] = (unsigned long )9;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[12] = (unsigned long )5;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[13] = (unsigned long )9;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[14] = (unsigned long )9;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[15] = (unsigned long )5;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[16] = (unsigned long )9;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[17] = (unsigned long )9;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[18] = (unsigned long )5;
    sqlstm.sqhsts[18] = (         int  )0;
    sqlstm.sqindv[18] = (         short *)0;
    sqlstm.sqinds[18] = (         int  )0;
    sqlstm.sqharm[18] = (unsigned long )0;
    sqlstm.sqadto[18] = (unsigned short )0;
    sqlstm.sqtdso[18] = (unsigned short )0;
    sqlstm.sqhstv[19] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[19] = (unsigned long )9;
    sqlstm.sqhsts[19] = (         int  )0;
    sqlstm.sqindv[19] = (         short *)0;
    sqlstm.sqinds[19] = (         int  )0;
    sqlstm.sqharm[19] = (unsigned long )0;
    sqlstm.sqadto[19] = (unsigned short )0;
    sqlstm.sqtdso[19] = (unsigned short )0;
    sqlstm.sqhstv[20] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[20] = (unsigned long )9;
    sqlstm.sqhsts[20] = (         int  )0;
    sqlstm.sqindv[20] = (         short *)0;
    sqlstm.sqinds[20] = (         int  )0;
    sqlstm.sqharm[20] = (unsigned long )0;
    sqlstm.sqadto[20] = (unsigned short )0;
    sqlstm.sqtdso[20] = (unsigned short )0;
    sqlstm.sqhstv[21] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[21] = (unsigned long )5;
    sqlstm.sqhsts[21] = (         int  )0;
    sqlstm.sqindv[21] = (         short *)0;
    sqlstm.sqinds[21] = (         int  )0;
    sqlstm.sqharm[21] = (unsigned long )0;
    sqlstm.sqadto[21] = (unsigned short )0;
    sqlstm.sqtdso[21] = (unsigned short )0;
    sqlstm.sqhstv[22] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[22] = (unsigned long )9;
    sqlstm.sqhsts[22] = (         int  )0;
    sqlstm.sqindv[22] = (         short *)0;
    sqlstm.sqinds[22] = (         int  )0;
    sqlstm.sqharm[22] = (unsigned long )0;
    sqlstm.sqadto[22] = (unsigned short )0;
    sqlstm.sqtdso[22] = (unsigned short )0;
    sqlstm.sqhstv[23] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[23] = (unsigned long )9;
    sqlstm.sqhsts[23] = (         int  )0;
    sqlstm.sqindv[23] = (         short *)0;
    sqlstm.sqinds[23] = (         int  )0;
    sqlstm.sqharm[23] = (unsigned long )0;
    sqlstm.sqadto[23] = (unsigned short )0;
    sqlstm.sqtdso[23] = (unsigned short )0;
    sqlstm.sqhstv[24] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[24] = (unsigned long )5;
    sqlstm.sqhsts[24] = (         int  )0;
    sqlstm.sqindv[24] = (         short *)0;
    sqlstm.sqinds[24] = (         int  )0;
    sqlstm.sqharm[24] = (unsigned long )0;
    sqlstm.sqadto[24] = (unsigned short )0;
    sqlstm.sqtdso[24] = (unsigned short )0;
    sqlstm.sqhstv[25] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[25] = (unsigned long )9;
    sqlstm.sqhsts[25] = (         int  )0;
    sqlstm.sqindv[25] = (         short *)0;
    sqlstm.sqinds[25] = (         int  )0;
    sqlstm.sqharm[25] = (unsigned long )0;
    sqlstm.sqadto[25] = (unsigned short )0;
    sqlstm.sqtdso[25] = (unsigned short )0;
    sqlstm.sqhstv[26] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[26] = (unsigned long )9;
    sqlstm.sqhsts[26] = (         int  )0;
    sqlstm.sqindv[26] = (         short *)0;
    sqlstm.sqinds[26] = (         int  )0;
    sqlstm.sqharm[26] = (unsigned long )0;
    sqlstm.sqadto[26] = (unsigned short )0;
    sqlstm.sqtdso[26] = (unsigned short )0;
    sqlstm.sqhstv[27] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[27] = (unsigned long )5;
    sqlstm.sqhsts[27] = (         int  )0;
    sqlstm.sqindv[27] = (         short *)0;
    sqlstm.sqinds[27] = (         int  )0;
    sqlstm.sqharm[27] = (unsigned long )0;
    sqlstm.sqadto[27] = (unsigned short )0;
    sqlstm.sqtdso[27] = (unsigned short )0;
    sqlstm.sqhstv[28] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[28] = (unsigned long )9;
    sqlstm.sqhsts[28] = (         int  )0;
    sqlstm.sqindv[28] = (         short *)0;
    sqlstm.sqinds[28] = (         int  )0;
    sqlstm.sqharm[28] = (unsigned long )0;
    sqlstm.sqadto[28] = (unsigned short )0;
    sqlstm.sqtdso[28] = (unsigned short )0;
    sqlstm.sqhstv[29] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[29] = (unsigned long )9;
    sqlstm.sqhsts[29] = (         int  )0;
    sqlstm.sqindv[29] = (         short *)0;
    sqlstm.sqinds[29] = (         int  )0;
    sqlstm.sqharm[29] = (unsigned long )0;
    sqlstm.sqadto[29] = (unsigned short )0;
    sqlstm.sqtdso[29] = (unsigned short )0;
    sqlstm.sqhstv[30] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[30] = (unsigned long )5;
    sqlstm.sqhsts[30] = (         int  )0;
    sqlstm.sqindv[30] = (         short *)0;
    sqlstm.sqinds[30] = (         int  )0;
    sqlstm.sqharm[30] = (unsigned long )0;
    sqlstm.sqadto[30] = (unsigned short )0;
    sqlstm.sqtdso[30] = (unsigned short )0;
    sqlstm.sqhstv[31] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[31] = (unsigned long )9;
    sqlstm.sqhsts[31] = (         int  )0;
    sqlstm.sqindv[31] = (         short *)0;
    sqlstm.sqinds[31] = (         int  )0;
    sqlstm.sqharm[31] = (unsigned long )0;
    sqlstm.sqadto[31] = (unsigned short )0;
    sqlstm.sqtdso[31] = (unsigned short )0;
    sqlstm.sqhstv[32] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[32] = (unsigned long )9;
    sqlstm.sqhsts[32] = (         int  )0;
    sqlstm.sqindv[32] = (         short *)0;
    sqlstm.sqinds[32] = (         int  )0;
    sqlstm.sqharm[32] = (unsigned long )0;
    sqlstm.sqadto[32] = (unsigned short )0;
    sqlstm.sqtdso[32] = (unsigned short )0;
    sqlstm.sqhstv[33] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[33] = (unsigned long )5;
    sqlstm.sqhsts[33] = (         int  )0;
    sqlstm.sqindv[33] = (         short *)0;
    sqlstm.sqinds[33] = (         int  )0;
    sqlstm.sqharm[33] = (unsigned long )0;
    sqlstm.sqadto[33] = (unsigned short )0;
    sqlstm.sqtdso[33] = (unsigned short )0;
    sqlstm.sqhstv[34] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[34] = (unsigned long )9;
    sqlstm.sqhsts[34] = (         int  )0;
    sqlstm.sqindv[34] = (         short *)0;
    sqlstm.sqinds[34] = (         int  )0;
    sqlstm.sqharm[34] = (unsigned long )0;
    sqlstm.sqadto[34] = (unsigned short )0;
    sqlstm.sqtdso[34] = (unsigned short )0;
    sqlstm.sqhstv[35] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[35] = (unsigned long )9;
    sqlstm.sqhsts[35] = (         int  )0;
    sqlstm.sqindv[35] = (         short *)0;
    sqlstm.sqinds[35] = (         int  )0;
    sqlstm.sqharm[35] = (unsigned long )0;
    sqlstm.sqadto[35] = (unsigned short )0;
    sqlstm.sqtdso[35] = (unsigned short )0;
    sqlstm.sqhstv[36] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[36] = (unsigned long )5;
    sqlstm.sqhsts[36] = (         int  )0;
    sqlstm.sqindv[36] = (         short *)0;
    sqlstm.sqinds[36] = (         int  )0;
    sqlstm.sqharm[36] = (unsigned long )0;
    sqlstm.sqadto[36] = (unsigned short )0;
    sqlstm.sqtdso[36] = (unsigned short )0;
    sqlstm.sqhstv[37] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[37] = (unsigned long )9;
    sqlstm.sqhsts[37] = (         int  )0;
    sqlstm.sqindv[37] = (         short *)0;
    sqlstm.sqinds[37] = (         int  )0;
    sqlstm.sqharm[37] = (unsigned long )0;
    sqlstm.sqadto[37] = (unsigned short )0;
    sqlstm.sqtdso[37] = (unsigned short )0;
    sqlstm.sqhstv[38] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[38] = (unsigned long )9;
    sqlstm.sqhsts[38] = (         int  )0;
    sqlstm.sqindv[38] = (         short *)0;
    sqlstm.sqinds[38] = (         int  )0;
    sqlstm.sqharm[38] = (unsigned long )0;
    sqlstm.sqadto[38] = (unsigned short )0;
    sqlstm.sqtdso[38] = (unsigned short )0;
    sqlstm.sqhstv[39] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[39] = (unsigned long )5;
    sqlstm.sqhsts[39] = (         int  )0;
    sqlstm.sqindv[39] = (         short *)0;
    sqlstm.sqinds[39] = (         int  )0;
    sqlstm.sqharm[39] = (unsigned long )0;
    sqlstm.sqadto[39] = (unsigned short )0;
    sqlstm.sqtdso[39] = (unsigned short )0;
    sqlstm.sqhstv[40] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[40] = (unsigned long )9;
    sqlstm.sqhsts[40] = (         int  )0;
    sqlstm.sqindv[40] = (         short *)0;
    sqlstm.sqinds[40] = (         int  )0;
    sqlstm.sqharm[40] = (unsigned long )0;
    sqlstm.sqadto[40] = (unsigned short )0;
    sqlstm.sqtdso[40] = (unsigned short )0;
    sqlstm.sqhstv[41] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[41] = (unsigned long )9;
    sqlstm.sqhsts[41] = (         int  )0;
    sqlstm.sqindv[41] = (         short *)0;
    sqlstm.sqinds[41] = (         int  )0;
    sqlstm.sqharm[41] = (unsigned long )0;
    sqlstm.sqadto[41] = (unsigned short )0;
    sqlstm.sqtdso[41] = (unsigned short )0;
    sqlstm.sqhstv[42] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[42] = (unsigned long )5;
    sqlstm.sqhsts[42] = (         int  )0;
    sqlstm.sqindv[42] = (         short *)0;
    sqlstm.sqinds[42] = (         int  )0;
    sqlstm.sqharm[42] = (unsigned long )0;
    sqlstm.sqadto[42] = (unsigned short )0;
    sqlstm.sqtdso[42] = (unsigned short )0;
    sqlstm.sqhstv[43] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[43] = (unsigned long )9;
    sqlstm.sqhsts[43] = (         int  )0;
    sqlstm.sqindv[43] = (         short *)0;
    sqlstm.sqinds[43] = (         int  )0;
    sqlstm.sqharm[43] = (unsigned long )0;
    sqlstm.sqadto[43] = (unsigned short )0;
    sqlstm.sqtdso[43] = (unsigned short )0;
    sqlstm.sqhstv[44] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[44] = (unsigned long )9;
    sqlstm.sqhsts[44] = (         int  )0;
    sqlstm.sqindv[44] = (         short *)0;
    sqlstm.sqinds[44] = (         int  )0;
    sqlstm.sqharm[44] = (unsigned long )0;
    sqlstm.sqadto[44] = (unsigned short )0;
    sqlstm.sqtdso[44] = (unsigned short )0;
    sqlstm.sqhstv[45] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[45] = (unsigned long )5;
    sqlstm.sqhsts[45] = (         int  )0;
    sqlstm.sqindv[45] = (         short *)0;
    sqlstm.sqinds[45] = (         int  )0;
    sqlstm.sqharm[45] = (unsigned long )0;
    sqlstm.sqadto[45] = (unsigned short )0;
    sqlstm.sqtdso[45] = (unsigned short )0;
    sqlstm.sqhstv[46] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[46] = (unsigned long )9;
    sqlstm.sqhsts[46] = (         int  )0;
    sqlstm.sqindv[46] = (         short *)0;
    sqlstm.sqinds[46] = (         int  )0;
    sqlstm.sqharm[46] = (unsigned long )0;
    sqlstm.sqadto[46] = (unsigned short )0;
    sqlstm.sqtdso[46] = (unsigned short )0;
    sqlstm.sqhstv[47] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[47] = (unsigned long )9;
    sqlstm.sqhsts[47] = (         int  )0;
    sqlstm.sqindv[47] = (         short *)0;
    sqlstm.sqinds[47] = (         int  )0;
    sqlstm.sqharm[47] = (unsigned long )0;
    sqlstm.sqadto[47] = (unsigned short )0;
    sqlstm.sqtdso[47] = (unsigned short )0;
    sqlstm.sqhstv[48] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[48] = (unsigned long )5;
    sqlstm.sqhsts[48] = (         int  )0;
    sqlstm.sqindv[48] = (         short *)0;
    sqlstm.sqinds[48] = (         int  )0;
    sqlstm.sqharm[48] = (unsigned long )0;
    sqlstm.sqadto[48] = (unsigned short )0;
    sqlstm.sqtdso[48] = (unsigned short )0;
    sqlstm.sqhstv[49] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[49] = (unsigned long )9;
    sqlstm.sqhsts[49] = (         int  )0;
    sqlstm.sqindv[49] = (         short *)0;
    sqlstm.sqinds[49] = (         int  )0;
    sqlstm.sqharm[49] = (unsigned long )0;
    sqlstm.sqadto[49] = (unsigned short )0;
    sqlstm.sqtdso[49] = (unsigned short )0;
    sqlstm.sqhstv[50] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[50] = (unsigned long )9;
    sqlstm.sqhsts[50] = (         int  )0;
    sqlstm.sqindv[50] = (         short *)0;
    sqlstm.sqinds[50] = (         int  )0;
    sqlstm.sqharm[50] = (unsigned long )0;
    sqlstm.sqadto[50] = (unsigned short )0;
    sqlstm.sqtdso[50] = (unsigned short )0;
    sqlstm.sqhstv[51] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[51] = (unsigned long )5;
    sqlstm.sqhsts[51] = (         int  )0;
    sqlstm.sqindv[51] = (         short *)0;
    sqlstm.sqinds[51] = (         int  )0;
    sqlstm.sqharm[51] = (unsigned long )0;
    sqlstm.sqadto[51] = (unsigned short )0;
    sqlstm.sqtdso[51] = (unsigned short )0;
    sqlstm.sqhstv[52] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[52] = (unsigned long )9;
    sqlstm.sqhsts[52] = (         int  )0;
    sqlstm.sqindv[52] = (         short *)0;
    sqlstm.sqinds[52] = (         int  )0;
    sqlstm.sqharm[52] = (unsigned long )0;
    sqlstm.sqadto[52] = (unsigned short )0;
    sqlstm.sqtdso[52] = (unsigned short )0;
    sqlstm.sqhstv[53] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[53] = (unsigned long )9;
    sqlstm.sqhsts[53] = (         int  )0;
    sqlstm.sqindv[53] = (         short *)0;
    sqlstm.sqinds[53] = (         int  )0;
    sqlstm.sqharm[53] = (unsigned long )0;
    sqlstm.sqadto[53] = (unsigned short )0;
    sqlstm.sqtdso[53] = (unsigned short )0;
    sqlstm.sqhstv[54] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[54] = (unsigned long )5;
    sqlstm.sqhsts[54] = (         int  )0;
    sqlstm.sqindv[54] = (         short *)0;
    sqlstm.sqinds[54] = (         int  )0;
    sqlstm.sqharm[54] = (unsigned long )0;
    sqlstm.sqadto[54] = (unsigned short )0;
    sqlstm.sqtdso[54] = (unsigned short )0;
    sqlstm.sqhstv[55] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[55] = (unsigned long )9;
    sqlstm.sqhsts[55] = (         int  )0;
    sqlstm.sqindv[55] = (         short *)0;
    sqlstm.sqinds[55] = (         int  )0;
    sqlstm.sqharm[55] = (unsigned long )0;
    sqlstm.sqadto[55] = (unsigned short )0;
    sqlstm.sqtdso[55] = (unsigned short )0;
    sqlstm.sqhstv[56] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[56] = (unsigned long )9;
    sqlstm.sqhsts[56] = (         int  )0;
    sqlstm.sqindv[56] = (         short *)0;
    sqlstm.sqinds[56] = (         int  )0;
    sqlstm.sqharm[56] = (unsigned long )0;
    sqlstm.sqadto[56] = (unsigned short )0;
    sqlstm.sqtdso[56] = (unsigned short )0;
    sqlstm.sqhstv[57] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[57] = (unsigned long )5;
    sqlstm.sqhsts[57] = (         int  )0;
    sqlstm.sqindv[57] = (         short *)0;
    sqlstm.sqinds[57] = (         int  )0;
    sqlstm.sqharm[57] = (unsigned long )0;
    sqlstm.sqadto[57] = (unsigned short )0;
    sqlstm.sqtdso[57] = (unsigned short )0;
    sqlstm.sqhstv[58] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[58] = (unsigned long )9;
    sqlstm.sqhsts[58] = (         int  )0;
    sqlstm.sqindv[58] = (         short *)0;
    sqlstm.sqinds[58] = (         int  )0;
    sqlstm.sqharm[58] = (unsigned long )0;
    sqlstm.sqadto[58] = (unsigned short )0;
    sqlstm.sqtdso[58] = (unsigned short )0;
    sqlstm.sqhstv[59] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[59] = (unsigned long )9;
    sqlstm.sqhsts[59] = (         int  )0;
    sqlstm.sqindv[59] = (         short *)0;
    sqlstm.sqinds[59] = (         int  )0;
    sqlstm.sqharm[59] = (unsigned long )0;
    sqlstm.sqadto[59] = (unsigned short )0;
    sqlstm.sqtdso[59] = (unsigned short )0;
    sqlstm.sqhstv[60] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[60] = (unsigned long )5;
    sqlstm.sqhsts[60] = (         int  )0;
    sqlstm.sqindv[60] = (         short *)0;
    sqlstm.sqinds[60] = (         int  )0;
    sqlstm.sqharm[60] = (unsigned long )0;
    sqlstm.sqadto[60] = (unsigned short )0;
    sqlstm.sqtdso[60] = (unsigned short )0;
    sqlstm.sqhstv[61] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[61] = (unsigned long )9;
    sqlstm.sqhsts[61] = (         int  )0;
    sqlstm.sqindv[61] = (         short *)0;
    sqlstm.sqinds[61] = (         int  )0;
    sqlstm.sqharm[61] = (unsigned long )0;
    sqlstm.sqadto[61] = (unsigned short )0;
    sqlstm.sqtdso[61] = (unsigned short )0;
    sqlstm.sqhstv[62] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[62] = (unsigned long )9;
    sqlstm.sqhsts[62] = (         int  )0;
    sqlstm.sqindv[62] = (         short *)0;
    sqlstm.sqinds[62] = (         int  )0;
    sqlstm.sqharm[62] = (unsigned long )0;
    sqlstm.sqadto[62] = (unsigned short )0;
    sqlstm.sqtdso[62] = (unsigned short )0;
    sqlstm.sqhstv[63] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[63] = (unsigned long )5;
    sqlstm.sqhsts[63] = (         int  )0;
    sqlstm.sqindv[63] = (         short *)0;
    sqlstm.sqinds[63] = (         int  )0;
    sqlstm.sqharm[63] = (unsigned long )0;
    sqlstm.sqadto[63] = (unsigned short )0;
    sqlstm.sqtdso[63] = (unsigned short )0;
    sqlstm.sqhstv[64] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[64] = (unsigned long )9;
    sqlstm.sqhsts[64] = (         int  )0;
    sqlstm.sqindv[64] = (         short *)0;
    sqlstm.sqinds[64] = (         int  )0;
    sqlstm.sqharm[64] = (unsigned long )0;
    sqlstm.sqadto[64] = (unsigned short )0;
    sqlstm.sqtdso[64] = (unsigned short )0;
    sqlstm.sqhstv[65] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[65] = (unsigned long )9;
    sqlstm.sqhsts[65] = (         int  )0;
    sqlstm.sqindv[65] = (         short *)0;
    sqlstm.sqinds[65] = (         int  )0;
    sqlstm.sqharm[65] = (unsigned long )0;
    sqlstm.sqadto[65] = (unsigned short )0;
    sqlstm.sqtdso[65] = (unsigned short )0;
    sqlstm.sqhstv[66] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[66] = (unsigned long )5;
    sqlstm.sqhsts[66] = (         int  )0;
    sqlstm.sqindv[66] = (         short *)0;
    sqlstm.sqinds[66] = (         int  )0;
    sqlstm.sqharm[66] = (unsigned long )0;
    sqlstm.sqadto[66] = (unsigned short )0;
    sqlstm.sqtdso[66] = (unsigned short )0;
    sqlstm.sqhstv[67] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[67] = (unsigned long )9;
    sqlstm.sqhsts[67] = (         int  )0;
    sqlstm.sqindv[67] = (         short *)0;
    sqlstm.sqinds[67] = (         int  )0;
    sqlstm.sqharm[67] = (unsigned long )0;
    sqlstm.sqadto[67] = (unsigned short )0;
    sqlstm.sqtdso[67] = (unsigned short )0;
    sqlstm.sqhstv[68] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[68] = (unsigned long )9;
    sqlstm.sqhsts[68] = (         int  )0;
    sqlstm.sqindv[68] = (         short *)0;
    sqlstm.sqinds[68] = (         int  )0;
    sqlstm.sqharm[68] = (unsigned long )0;
    sqlstm.sqadto[68] = (unsigned short )0;
    sqlstm.sqtdso[68] = (unsigned short )0;
    sqlstm.sqhstv[69] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[69] = (unsigned long )5;
    sqlstm.sqhsts[69] = (         int  )0;
    sqlstm.sqindv[69] = (         short *)0;
    sqlstm.sqinds[69] = (         int  )0;
    sqlstm.sqharm[69] = (unsigned long )0;
    sqlstm.sqadto[69] = (unsigned short )0;
    sqlstm.sqtdso[69] = (unsigned short )0;
    sqlstm.sqhstv[70] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[70] = (unsigned long )9;
    sqlstm.sqhsts[70] = (         int  )0;
    sqlstm.sqindv[70] = (         short *)0;
    sqlstm.sqinds[70] = (         int  )0;
    sqlstm.sqharm[70] = (unsigned long )0;
    sqlstm.sqadto[70] = (unsigned short )0;
    sqlstm.sqtdso[70] = (unsigned short )0;
    sqlstm.sqhstv[71] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[71] = (unsigned long )9;
    sqlstm.sqhsts[71] = (         int  )0;
    sqlstm.sqindv[71] = (         short *)0;
    sqlstm.sqinds[71] = (         int  )0;
    sqlstm.sqharm[71] = (unsigned long )0;
    sqlstm.sqadto[71] = (unsigned short )0;
    sqlstm.sqtdso[71] = (unsigned short )0;
    sqlstm.sqhstv[72] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[72] = (unsigned long )5;
    sqlstm.sqhsts[72] = (         int  )0;
    sqlstm.sqindv[72] = (         short *)0;
    sqlstm.sqinds[72] = (         int  )0;
    sqlstm.sqharm[72] = (unsigned long )0;
    sqlstm.sqadto[72] = (unsigned short )0;
    sqlstm.sqtdso[72] = (unsigned short )0;
    sqlstm.sqhstv[73] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[73] = (unsigned long )9;
    sqlstm.sqhsts[73] = (         int  )0;
    sqlstm.sqindv[73] = (         short *)0;
    sqlstm.sqinds[73] = (         int  )0;
    sqlstm.sqharm[73] = (unsigned long )0;
    sqlstm.sqadto[73] = (unsigned short )0;
    sqlstm.sqtdso[73] = (unsigned short )0;
    sqlstm.sqhstv[74] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[74] = (unsigned long )9;
    sqlstm.sqhsts[74] = (         int  )0;
    sqlstm.sqindv[74] = (         short *)0;
    sqlstm.sqinds[74] = (         int  )0;
    sqlstm.sqharm[74] = (unsigned long )0;
    sqlstm.sqadto[74] = (unsigned short )0;
    sqlstm.sqtdso[74] = (unsigned short )0;
    sqlstm.sqhstv[75] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[75] = (unsigned long )5;
    sqlstm.sqhsts[75] = (         int  )0;
    sqlstm.sqindv[75] = (         short *)0;
    sqlstm.sqinds[75] = (         int  )0;
    sqlstm.sqharm[75] = (unsigned long )0;
    sqlstm.sqadto[75] = (unsigned short )0;
    sqlstm.sqtdso[75] = (unsigned short )0;
    sqlstm.sqhstv[76] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[76] = (unsigned long )9;
    sqlstm.sqhsts[76] = (         int  )0;
    sqlstm.sqindv[76] = (         short *)0;
    sqlstm.sqinds[76] = (         int  )0;
    sqlstm.sqharm[76] = (unsigned long )0;
    sqlstm.sqadto[76] = (unsigned short )0;
    sqlstm.sqtdso[76] = (unsigned short )0;
    sqlstm.sqhstv[77] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[77] = (unsigned long )9;
    sqlstm.sqhsts[77] = (         int  )0;
    sqlstm.sqindv[77] = (         short *)0;
    sqlstm.sqinds[77] = (         int  )0;
    sqlstm.sqharm[77] = (unsigned long )0;
    sqlstm.sqadto[77] = (unsigned short )0;
    sqlstm.sqtdso[77] = (unsigned short )0;
    sqlstm.sqhstv[78] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[78] = (unsigned long )5;
    sqlstm.sqhsts[78] = (         int  )0;
    sqlstm.sqindv[78] = (         short *)0;
    sqlstm.sqinds[78] = (         int  )0;
    sqlstm.sqharm[78] = (unsigned long )0;
    sqlstm.sqadto[78] = (unsigned short )0;
    sqlstm.sqtdso[78] = (unsigned short )0;
    sqlstm.sqhstv[79] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[79] = (unsigned long )9;
    sqlstm.sqhsts[79] = (         int  )0;
    sqlstm.sqindv[79] = (         short *)0;
    sqlstm.sqinds[79] = (         int  )0;
    sqlstm.sqharm[79] = (unsigned long )0;
    sqlstm.sqadto[79] = (unsigned short )0;
    sqlstm.sqtdso[79] = (unsigned short )0;
    sqlstm.sqhstv[80] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[80] = (unsigned long )9;
    sqlstm.sqhsts[80] = (         int  )0;
    sqlstm.sqindv[80] = (         short *)0;
    sqlstm.sqinds[80] = (         int  )0;
    sqlstm.sqharm[80] = (unsigned long )0;
    sqlstm.sqadto[80] = (unsigned short )0;
    sqlstm.sqtdso[80] = (unsigned short )0;
    sqlstm.sqhstv[81] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[81] = (unsigned long )5;
    sqlstm.sqhsts[81] = (         int  )0;
    sqlstm.sqindv[81] = (         short *)0;
    sqlstm.sqinds[81] = (         int  )0;
    sqlstm.sqharm[81] = (unsigned long )0;
    sqlstm.sqadto[81] = (unsigned short )0;
    sqlstm.sqtdso[81] = (unsigned short )0;
    sqlstm.sqhstv[82] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[82] = (unsigned long )9;
    sqlstm.sqhsts[82] = (         int  )0;
    sqlstm.sqindv[82] = (         short *)0;
    sqlstm.sqinds[82] = (         int  )0;
    sqlstm.sqharm[82] = (unsigned long )0;
    sqlstm.sqadto[82] = (unsigned short )0;
    sqlstm.sqtdso[82] = (unsigned short )0;
    sqlstm.sqhstv[83] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[83] = (unsigned long )9;
    sqlstm.sqhsts[83] = (         int  )0;
    sqlstm.sqindv[83] = (         short *)0;
    sqlstm.sqinds[83] = (         int  )0;
    sqlstm.sqharm[83] = (unsigned long )0;
    sqlstm.sqadto[83] = (unsigned short )0;
    sqlstm.sqtdso[83] = (unsigned short )0;
    sqlstm.sqhstv[84] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[84] = (unsigned long )5;
    sqlstm.sqhsts[84] = (         int  )0;
    sqlstm.sqindv[84] = (         short *)0;
    sqlstm.sqinds[84] = (         int  )0;
    sqlstm.sqharm[84] = (unsigned long )0;
    sqlstm.sqadto[84] = (unsigned short )0;
    sqlstm.sqtdso[84] = (unsigned short )0;
    sqlstm.sqhstv[85] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[85] = (unsigned long )9;
    sqlstm.sqhsts[85] = (         int  )0;
    sqlstm.sqindv[85] = (         short *)0;
    sqlstm.sqinds[85] = (         int  )0;
    sqlstm.sqharm[85] = (unsigned long )0;
    sqlstm.sqadto[85] = (unsigned short )0;
    sqlstm.sqtdso[85] = (unsigned short )0;
    sqlstm.sqhstv[86] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[86] = (unsigned long )9;
    sqlstm.sqhsts[86] = (         int  )0;
    sqlstm.sqindv[86] = (         short *)0;
    sqlstm.sqinds[86] = (         int  )0;
    sqlstm.sqharm[86] = (unsigned long )0;
    sqlstm.sqadto[86] = (unsigned short )0;
    sqlstm.sqtdso[86] = (unsigned short )0;
    sqlstm.sqhstv[87] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[87] = (unsigned long )5;
    sqlstm.sqhsts[87] = (         int  )0;
    sqlstm.sqindv[87] = (         short *)0;
    sqlstm.sqinds[87] = (         int  )0;
    sqlstm.sqharm[87] = (unsigned long )0;
    sqlstm.sqadto[87] = (unsigned short )0;
    sqlstm.sqtdso[87] = (unsigned short )0;
    sqlstm.sqhstv[88] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[88] = (unsigned long )9;
    sqlstm.sqhsts[88] = (         int  )0;
    sqlstm.sqindv[88] = (         short *)0;
    sqlstm.sqinds[88] = (         int  )0;
    sqlstm.sqharm[88] = (unsigned long )0;
    sqlstm.sqadto[88] = (unsigned short )0;
    sqlstm.sqtdso[88] = (unsigned short )0;
    sqlstm.sqhstv[89] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[89] = (unsigned long )9;
    sqlstm.sqhsts[89] = (         int  )0;
    sqlstm.sqindv[89] = (         short *)0;
    sqlstm.sqinds[89] = (         int  )0;
    sqlstm.sqharm[89] = (unsigned long )0;
    sqlstm.sqadto[89] = (unsigned short )0;
    sqlstm.sqtdso[89] = (unsigned short )0;
    sqlstm.sqhstv[90] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[90] = (unsigned long )5;
    sqlstm.sqhsts[90] = (         int  )0;
    sqlstm.sqindv[90] = (         short *)0;
    sqlstm.sqinds[90] = (         int  )0;
    sqlstm.sqharm[90] = (unsigned long )0;
    sqlstm.sqadto[90] = (unsigned short )0;
    sqlstm.sqtdso[90] = (unsigned short )0;
    sqlstm.sqhstv[91] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[91] = (unsigned long )9;
    sqlstm.sqhsts[91] = (         int  )0;
    sqlstm.sqindv[91] = (         short *)0;
    sqlstm.sqinds[91] = (         int  )0;
    sqlstm.sqharm[91] = (unsigned long )0;
    sqlstm.sqadto[91] = (unsigned short )0;
    sqlstm.sqtdso[91] = (unsigned short )0;
    sqlstm.sqhstv[92] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[92] = (unsigned long )9;
    sqlstm.sqhsts[92] = (         int  )0;
    sqlstm.sqindv[92] = (         short *)0;
    sqlstm.sqinds[92] = (         int  )0;
    sqlstm.sqharm[92] = (unsigned long )0;
    sqlstm.sqadto[92] = (unsigned short )0;
    sqlstm.sqtdso[92] = (unsigned short )0;
    sqlstm.sqhstv[93] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[93] = (unsigned long )5;
    sqlstm.sqhsts[93] = (         int  )0;
    sqlstm.sqindv[93] = (         short *)0;
    sqlstm.sqinds[93] = (         int  )0;
    sqlstm.sqharm[93] = (unsigned long )0;
    sqlstm.sqadto[93] = (unsigned short )0;
    sqlstm.sqtdso[93] = (unsigned short )0;
    sqlstm.sqhstv[94] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[94] = (unsigned long )9;
    sqlstm.sqhsts[94] = (         int  )0;
    sqlstm.sqindv[94] = (         short *)0;
    sqlstm.sqinds[94] = (         int  )0;
    sqlstm.sqharm[94] = (unsigned long )0;
    sqlstm.sqadto[94] = (unsigned short )0;
    sqlstm.sqtdso[94] = (unsigned short )0;
    sqlstm.sqhstv[95] = (unsigned char  *)vEndDate;
    sqlstm.sqhstl[95] = (unsigned long )9;
    sqlstm.sqhsts[95] = (         int  )0;
    sqlstm.sqindv[95] = (         short *)0;
    sqlstm.sqinds[95] = (         int  )0;
    sqlstm.sqharm[95] = (unsigned long )0;
    sqlstm.sqadto[95] = (unsigned short )0;
    sqlstm.sqtdso[95] = (unsigned short )0;
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



    hinsa_trim(vTempDate);

    /* EXEC SQL
            SELECT MAX(YYYYMMDD)
            INTO :vNextDate2
            FROM (
                SELECT
                      A.YYYYMMDD,
                      EMPNO,
                      CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                           THEN '0'
                           ELSE '1' END DAYCODE,
                      CASE WHEN DUTYCODE IS NULL
                           THEN (CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                           THEN '49'
                           ELSE '99' END)
                           ELSE DUTYCODE END DUTYCODE
                  FROM
                      PKHCALDAYS A,
                      PKCHOLI B,
                      (SELECT DUYYMM||'01' DUTYYYMMDD, EMPNO,  DD1 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'02' DUTYYYMMDD, EMPNO,  DD2 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'03' DUTYYYMMDD, EMPNO,  DD3 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'04' DUTYYYMMDD, EMPNO,  DD4 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'05' DUTYYYMMDD, EMPNO,  DD5 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'06' DUTYYYMMDD, EMPNO,  DD6 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'07' DUTYYYMMDD, EMPNO,  DD7 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'08' DUTYYYMMDD, EMPNO,  DD8 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'09' DUTYYYMMDD, EMPNO,  DD9 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'10' DUTYYYMMDD, EMPNO, DD10 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'11' DUTYYYMMDD, EMPNO, DD11 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'12' DUTYYYMMDD, EMPNO, DD12 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'13' DUTYYYMMDD, EMPNO, DD13 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'14' DUTYYYMMDD, EMPNO, DD14 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'15' DUTYYYMMDD, EMPNO, DD15 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'16' DUTYYYMMDD, EMPNO, DD16 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'17' DUTYYYMMDD, EMPNO, DD17 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'18' DUTYYYMMDD, EMPNO, DD18 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'19' DUTYYYMMDD, EMPNO, DD19 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'20' DUTYYYMMDD, EMPNO, DD20 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'21' DUTYYYMMDD, EMPNO, DD21 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'22' DUTYYYMMDD, EMPNO, DD22 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'23' DUTYYYMMDD, EMPNO, DD23 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'24' DUTYYYMMDD, EMPNO, DD24 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'25' DUTYYYMMDD, EMPNO, DD25 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'26' DUTYYYMMDD, EMPNO, DD26 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'27' DUTYYYMMDD, EMPNO, DD27 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'28' DUTYYYMMDD, EMPNO, DD28 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'29' DUTYYYMMDD, EMPNO, DD29 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'30' DUTYYYMMDD, EMPNO, DD30 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno UNION ALL
                       SELECT DUYYMM||'31' DUTYYYMMDD, EMPNO, DD31 DUTYCODE FROM PKHDUTY WHERE DUYYMM BETWEEN SUBSTR(:vStrtDate,1,6) AND SUBSTR(:vTempDate,1,6) AND EMPNO = :vEmpno
                      )C
                   WHERE A.YYYYMMDD BETWEEN :vStrtDate AND :vTempDate
                     AND A.YYYYMMDD = B.HOLIDATE(+)
                     AND A.YYYYMMDD = C.DUTYYYMMDD(+)
            )A
            WHERE DAYCODE ='1'
              AND DUTYCODE IN ('63','64'); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 96;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "select max(YYYYMMDD) into :b0  from (select A.YYYYMMDD ,EMPNO , case \
 when (A.DAYCODE in ('1','7') or B.HOLIDATE is  not null ) then '0' else '1'\
  end  DAYCODE , case  when DUTYCODE is null  then  case  when (A.DAYCODE in\
 ('1','7') or B.HOLIDATE is  not null ) then '49' else '99'  end  else DUTYC\
ODE  end  DUTYCODE  from PKHCALDAYS A ,PKCHOLI B ,(select (DUYYMM||'01') DUT\
YYYMMDD ,EMPNO ,DD1 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'02') DUTY\
YYMMDD ,EMPNO ,DD2 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1\
,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'03') DUTYY\
YMMDD ,EMPNO ,DD3 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,\
6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'04') DUTYYY\
MMDD ,EMPNO ,DD4 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6\
) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'05') DUTYYYM\
MDD ,EMPNO ,DD5 DUTYCODE  from PKHDUTY wher");
    sqlbuft((void **)0,
      "e (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'06') DUTYYYMMDD ,EMPNO ,DD6 DUTYCODE  from PKHDUT\
Y where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) u\
nion all select (DUYYMM||'07') DUTYYYMMDD ,EMPNO ,DD7 DUTYCODE  from PKHDUTY\
 where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) un\
ion all select (DUYYMM||'08') DUTYYYMMDD ,EMPNO ,DD8 DUTYCODE  from PKHDUTY \
where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) uni\
on all select (DUYYMM||'09') DUTYYYMMDD ,EMPNO ,DD9 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'10') DUTYYYMMDD ,EMPNO ,DD10 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'11') DUTYYYMMDD ,EMPNO ,DD11 DUTYCODE  from PKHDUTY w\
here (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) unio\
n all select (DUYYMM||'12') DUTYYYMMDD ,EMP");
    sqlbuft((void **)0,
      "NO ,DD12 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'13') DUTYYYMM\
DD ,EMPNO ,DD13 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'14') DUTYYYMM\
DD ,EMPNO ,DD14 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'15') DUTYYYMM\
DD ,EMPNO ,DD15 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'16') DUTYYYMM\
DD ,EMPNO ,DD16 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'17') DUTYYYMM\
DD ,EMPNO ,DD17 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'18') DUTYYYMM\
DD ,EMPNO ,DD18 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,1,6)\
 and SUBSTR(:b2,1,6) and EMPNO=:b3) union a");
    sqlbuft((void **)0,
      "ll select (DUYYMM||'19') DUTYYYMMDD ,EMPNO ,DD19 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'20') DUTYYYMMDD ,EMPNO ,DD20 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'21') DUTYYYMMDD ,EMPNO ,DD21 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'22') DUTYYYMMDD ,EMPNO ,DD22 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'23') DUTYYYMMDD ,EMPNO ,DD23 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'24') DUTYYYMMDD ,EMPNO ,DD24 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) \
union all select (DUYYMM||'25') DUTYYYMMDD ,EMPNO ,DD25 DUTYCODE  from PKHDU\
TY where (DUYYMM between SUBSTR(:b1,1,6) an");
    sqlbuft((void **)0,
      "d SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'26') DUTY\
YYMMDD ,EMPNO ,DD26 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'27') DUTY\
YYMMDD ,EMPNO ,DD27 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'28') DUTY\
YYMMDD ,EMPNO ,DD28 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'29') DUTY\
YYMMDD ,EMPNO ,DD29 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'30') DUTY\
YYMMDD ,EMPNO ,DD30 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3) union all select (DUYYMM||'31') DUTY\
YYMMDD ,EMPNO ,DD31 DUTYCODE  from PKHDUTY where (DUYYMM between SUBSTR(:b1,\
1,6) and SUBSTR(:b2,1,6) and EMPNO=:b3)) C where ((A.YYYYMMDD between :b1 an\
d :b2 and A.YYYYMMDD=B.HOLIDATE(+)) and A.Y");
    sqlstm.stmt = "YYYMMDD=C.DUTYYYMMDD(+))) A where (DAYCODE='1' and DUTYC\
ODE in ('63','64'))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )598;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vNextDate2;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[1] = (unsigned long )9;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[2] = (unsigned long )9;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[4] = (unsigned long )9;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[5] = (unsigned long )9;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[6] = (unsigned long )5;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[7] = (unsigned long )9;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[8] = (unsigned long )9;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[9] = (unsigned long )5;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[10] = (unsigned long )9;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[11] = (unsigned long )9;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[12] = (unsigned long )5;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[13] = (unsigned long )9;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[14] = (unsigned long )9;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[15] = (unsigned long )5;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[16] = (unsigned long )9;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[17] = (unsigned long )9;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[18] = (unsigned long )5;
    sqlstm.sqhsts[18] = (         int  )0;
    sqlstm.sqindv[18] = (         short *)0;
    sqlstm.sqinds[18] = (         int  )0;
    sqlstm.sqharm[18] = (unsigned long )0;
    sqlstm.sqadto[18] = (unsigned short )0;
    sqlstm.sqtdso[18] = (unsigned short )0;
    sqlstm.sqhstv[19] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[19] = (unsigned long )9;
    sqlstm.sqhsts[19] = (         int  )0;
    sqlstm.sqindv[19] = (         short *)0;
    sqlstm.sqinds[19] = (         int  )0;
    sqlstm.sqharm[19] = (unsigned long )0;
    sqlstm.sqadto[19] = (unsigned short )0;
    sqlstm.sqtdso[19] = (unsigned short )0;
    sqlstm.sqhstv[20] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[20] = (unsigned long )9;
    sqlstm.sqhsts[20] = (         int  )0;
    sqlstm.sqindv[20] = (         short *)0;
    sqlstm.sqinds[20] = (         int  )0;
    sqlstm.sqharm[20] = (unsigned long )0;
    sqlstm.sqadto[20] = (unsigned short )0;
    sqlstm.sqtdso[20] = (unsigned short )0;
    sqlstm.sqhstv[21] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[21] = (unsigned long )5;
    sqlstm.sqhsts[21] = (         int  )0;
    sqlstm.sqindv[21] = (         short *)0;
    sqlstm.sqinds[21] = (         int  )0;
    sqlstm.sqharm[21] = (unsigned long )0;
    sqlstm.sqadto[21] = (unsigned short )0;
    sqlstm.sqtdso[21] = (unsigned short )0;
    sqlstm.sqhstv[22] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[22] = (unsigned long )9;
    sqlstm.sqhsts[22] = (         int  )0;
    sqlstm.sqindv[22] = (         short *)0;
    sqlstm.sqinds[22] = (         int  )0;
    sqlstm.sqharm[22] = (unsigned long )0;
    sqlstm.sqadto[22] = (unsigned short )0;
    sqlstm.sqtdso[22] = (unsigned short )0;
    sqlstm.sqhstv[23] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[23] = (unsigned long )9;
    sqlstm.sqhsts[23] = (         int  )0;
    sqlstm.sqindv[23] = (         short *)0;
    sqlstm.sqinds[23] = (         int  )0;
    sqlstm.sqharm[23] = (unsigned long )0;
    sqlstm.sqadto[23] = (unsigned short )0;
    sqlstm.sqtdso[23] = (unsigned short )0;
    sqlstm.sqhstv[24] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[24] = (unsigned long )5;
    sqlstm.sqhsts[24] = (         int  )0;
    sqlstm.sqindv[24] = (         short *)0;
    sqlstm.sqinds[24] = (         int  )0;
    sqlstm.sqharm[24] = (unsigned long )0;
    sqlstm.sqadto[24] = (unsigned short )0;
    sqlstm.sqtdso[24] = (unsigned short )0;
    sqlstm.sqhstv[25] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[25] = (unsigned long )9;
    sqlstm.sqhsts[25] = (         int  )0;
    sqlstm.sqindv[25] = (         short *)0;
    sqlstm.sqinds[25] = (         int  )0;
    sqlstm.sqharm[25] = (unsigned long )0;
    sqlstm.sqadto[25] = (unsigned short )0;
    sqlstm.sqtdso[25] = (unsigned short )0;
    sqlstm.sqhstv[26] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[26] = (unsigned long )9;
    sqlstm.sqhsts[26] = (         int  )0;
    sqlstm.sqindv[26] = (         short *)0;
    sqlstm.sqinds[26] = (         int  )0;
    sqlstm.sqharm[26] = (unsigned long )0;
    sqlstm.sqadto[26] = (unsigned short )0;
    sqlstm.sqtdso[26] = (unsigned short )0;
    sqlstm.sqhstv[27] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[27] = (unsigned long )5;
    sqlstm.sqhsts[27] = (         int  )0;
    sqlstm.sqindv[27] = (         short *)0;
    sqlstm.sqinds[27] = (         int  )0;
    sqlstm.sqharm[27] = (unsigned long )0;
    sqlstm.sqadto[27] = (unsigned short )0;
    sqlstm.sqtdso[27] = (unsigned short )0;
    sqlstm.sqhstv[28] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[28] = (unsigned long )9;
    sqlstm.sqhsts[28] = (         int  )0;
    sqlstm.sqindv[28] = (         short *)0;
    sqlstm.sqinds[28] = (         int  )0;
    sqlstm.sqharm[28] = (unsigned long )0;
    sqlstm.sqadto[28] = (unsigned short )0;
    sqlstm.sqtdso[28] = (unsigned short )0;
    sqlstm.sqhstv[29] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[29] = (unsigned long )9;
    sqlstm.sqhsts[29] = (         int  )0;
    sqlstm.sqindv[29] = (         short *)0;
    sqlstm.sqinds[29] = (         int  )0;
    sqlstm.sqharm[29] = (unsigned long )0;
    sqlstm.sqadto[29] = (unsigned short )0;
    sqlstm.sqtdso[29] = (unsigned short )0;
    sqlstm.sqhstv[30] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[30] = (unsigned long )5;
    sqlstm.sqhsts[30] = (         int  )0;
    sqlstm.sqindv[30] = (         short *)0;
    sqlstm.sqinds[30] = (         int  )0;
    sqlstm.sqharm[30] = (unsigned long )0;
    sqlstm.sqadto[30] = (unsigned short )0;
    sqlstm.sqtdso[30] = (unsigned short )0;
    sqlstm.sqhstv[31] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[31] = (unsigned long )9;
    sqlstm.sqhsts[31] = (         int  )0;
    sqlstm.sqindv[31] = (         short *)0;
    sqlstm.sqinds[31] = (         int  )0;
    sqlstm.sqharm[31] = (unsigned long )0;
    sqlstm.sqadto[31] = (unsigned short )0;
    sqlstm.sqtdso[31] = (unsigned short )0;
    sqlstm.sqhstv[32] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[32] = (unsigned long )9;
    sqlstm.sqhsts[32] = (         int  )0;
    sqlstm.sqindv[32] = (         short *)0;
    sqlstm.sqinds[32] = (         int  )0;
    sqlstm.sqharm[32] = (unsigned long )0;
    sqlstm.sqadto[32] = (unsigned short )0;
    sqlstm.sqtdso[32] = (unsigned short )0;
    sqlstm.sqhstv[33] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[33] = (unsigned long )5;
    sqlstm.sqhsts[33] = (         int  )0;
    sqlstm.sqindv[33] = (         short *)0;
    sqlstm.sqinds[33] = (         int  )0;
    sqlstm.sqharm[33] = (unsigned long )0;
    sqlstm.sqadto[33] = (unsigned short )0;
    sqlstm.sqtdso[33] = (unsigned short )0;
    sqlstm.sqhstv[34] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[34] = (unsigned long )9;
    sqlstm.sqhsts[34] = (         int  )0;
    sqlstm.sqindv[34] = (         short *)0;
    sqlstm.sqinds[34] = (         int  )0;
    sqlstm.sqharm[34] = (unsigned long )0;
    sqlstm.sqadto[34] = (unsigned short )0;
    sqlstm.sqtdso[34] = (unsigned short )0;
    sqlstm.sqhstv[35] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[35] = (unsigned long )9;
    sqlstm.sqhsts[35] = (         int  )0;
    sqlstm.sqindv[35] = (         short *)0;
    sqlstm.sqinds[35] = (         int  )0;
    sqlstm.sqharm[35] = (unsigned long )0;
    sqlstm.sqadto[35] = (unsigned short )0;
    sqlstm.sqtdso[35] = (unsigned short )0;
    sqlstm.sqhstv[36] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[36] = (unsigned long )5;
    sqlstm.sqhsts[36] = (         int  )0;
    sqlstm.sqindv[36] = (         short *)0;
    sqlstm.sqinds[36] = (         int  )0;
    sqlstm.sqharm[36] = (unsigned long )0;
    sqlstm.sqadto[36] = (unsigned short )0;
    sqlstm.sqtdso[36] = (unsigned short )0;
    sqlstm.sqhstv[37] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[37] = (unsigned long )9;
    sqlstm.sqhsts[37] = (         int  )0;
    sqlstm.sqindv[37] = (         short *)0;
    sqlstm.sqinds[37] = (         int  )0;
    sqlstm.sqharm[37] = (unsigned long )0;
    sqlstm.sqadto[37] = (unsigned short )0;
    sqlstm.sqtdso[37] = (unsigned short )0;
    sqlstm.sqhstv[38] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[38] = (unsigned long )9;
    sqlstm.sqhsts[38] = (         int  )0;
    sqlstm.sqindv[38] = (         short *)0;
    sqlstm.sqinds[38] = (         int  )0;
    sqlstm.sqharm[38] = (unsigned long )0;
    sqlstm.sqadto[38] = (unsigned short )0;
    sqlstm.sqtdso[38] = (unsigned short )0;
    sqlstm.sqhstv[39] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[39] = (unsigned long )5;
    sqlstm.sqhsts[39] = (         int  )0;
    sqlstm.sqindv[39] = (         short *)0;
    sqlstm.sqinds[39] = (         int  )0;
    sqlstm.sqharm[39] = (unsigned long )0;
    sqlstm.sqadto[39] = (unsigned short )0;
    sqlstm.sqtdso[39] = (unsigned short )0;
    sqlstm.sqhstv[40] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[40] = (unsigned long )9;
    sqlstm.sqhsts[40] = (         int  )0;
    sqlstm.sqindv[40] = (         short *)0;
    sqlstm.sqinds[40] = (         int  )0;
    sqlstm.sqharm[40] = (unsigned long )0;
    sqlstm.sqadto[40] = (unsigned short )0;
    sqlstm.sqtdso[40] = (unsigned short )0;
    sqlstm.sqhstv[41] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[41] = (unsigned long )9;
    sqlstm.sqhsts[41] = (         int  )0;
    sqlstm.sqindv[41] = (         short *)0;
    sqlstm.sqinds[41] = (         int  )0;
    sqlstm.sqharm[41] = (unsigned long )0;
    sqlstm.sqadto[41] = (unsigned short )0;
    sqlstm.sqtdso[41] = (unsigned short )0;
    sqlstm.sqhstv[42] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[42] = (unsigned long )5;
    sqlstm.sqhsts[42] = (         int  )0;
    sqlstm.sqindv[42] = (         short *)0;
    sqlstm.sqinds[42] = (         int  )0;
    sqlstm.sqharm[42] = (unsigned long )0;
    sqlstm.sqadto[42] = (unsigned short )0;
    sqlstm.sqtdso[42] = (unsigned short )0;
    sqlstm.sqhstv[43] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[43] = (unsigned long )9;
    sqlstm.sqhsts[43] = (         int  )0;
    sqlstm.sqindv[43] = (         short *)0;
    sqlstm.sqinds[43] = (         int  )0;
    sqlstm.sqharm[43] = (unsigned long )0;
    sqlstm.sqadto[43] = (unsigned short )0;
    sqlstm.sqtdso[43] = (unsigned short )0;
    sqlstm.sqhstv[44] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[44] = (unsigned long )9;
    sqlstm.sqhsts[44] = (         int  )0;
    sqlstm.sqindv[44] = (         short *)0;
    sqlstm.sqinds[44] = (         int  )0;
    sqlstm.sqharm[44] = (unsigned long )0;
    sqlstm.sqadto[44] = (unsigned short )0;
    sqlstm.sqtdso[44] = (unsigned short )0;
    sqlstm.sqhstv[45] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[45] = (unsigned long )5;
    sqlstm.sqhsts[45] = (         int  )0;
    sqlstm.sqindv[45] = (         short *)0;
    sqlstm.sqinds[45] = (         int  )0;
    sqlstm.sqharm[45] = (unsigned long )0;
    sqlstm.sqadto[45] = (unsigned short )0;
    sqlstm.sqtdso[45] = (unsigned short )0;
    sqlstm.sqhstv[46] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[46] = (unsigned long )9;
    sqlstm.sqhsts[46] = (         int  )0;
    sqlstm.sqindv[46] = (         short *)0;
    sqlstm.sqinds[46] = (         int  )0;
    sqlstm.sqharm[46] = (unsigned long )0;
    sqlstm.sqadto[46] = (unsigned short )0;
    sqlstm.sqtdso[46] = (unsigned short )0;
    sqlstm.sqhstv[47] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[47] = (unsigned long )9;
    sqlstm.sqhsts[47] = (         int  )0;
    sqlstm.sqindv[47] = (         short *)0;
    sqlstm.sqinds[47] = (         int  )0;
    sqlstm.sqharm[47] = (unsigned long )0;
    sqlstm.sqadto[47] = (unsigned short )0;
    sqlstm.sqtdso[47] = (unsigned short )0;
    sqlstm.sqhstv[48] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[48] = (unsigned long )5;
    sqlstm.sqhsts[48] = (         int  )0;
    sqlstm.sqindv[48] = (         short *)0;
    sqlstm.sqinds[48] = (         int  )0;
    sqlstm.sqharm[48] = (unsigned long )0;
    sqlstm.sqadto[48] = (unsigned short )0;
    sqlstm.sqtdso[48] = (unsigned short )0;
    sqlstm.sqhstv[49] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[49] = (unsigned long )9;
    sqlstm.sqhsts[49] = (         int  )0;
    sqlstm.sqindv[49] = (         short *)0;
    sqlstm.sqinds[49] = (         int  )0;
    sqlstm.sqharm[49] = (unsigned long )0;
    sqlstm.sqadto[49] = (unsigned short )0;
    sqlstm.sqtdso[49] = (unsigned short )0;
    sqlstm.sqhstv[50] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[50] = (unsigned long )9;
    sqlstm.sqhsts[50] = (         int  )0;
    sqlstm.sqindv[50] = (         short *)0;
    sqlstm.sqinds[50] = (         int  )0;
    sqlstm.sqharm[50] = (unsigned long )0;
    sqlstm.sqadto[50] = (unsigned short )0;
    sqlstm.sqtdso[50] = (unsigned short )0;
    sqlstm.sqhstv[51] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[51] = (unsigned long )5;
    sqlstm.sqhsts[51] = (         int  )0;
    sqlstm.sqindv[51] = (         short *)0;
    sqlstm.sqinds[51] = (         int  )0;
    sqlstm.sqharm[51] = (unsigned long )0;
    sqlstm.sqadto[51] = (unsigned short )0;
    sqlstm.sqtdso[51] = (unsigned short )0;
    sqlstm.sqhstv[52] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[52] = (unsigned long )9;
    sqlstm.sqhsts[52] = (         int  )0;
    sqlstm.sqindv[52] = (         short *)0;
    sqlstm.sqinds[52] = (         int  )0;
    sqlstm.sqharm[52] = (unsigned long )0;
    sqlstm.sqadto[52] = (unsigned short )0;
    sqlstm.sqtdso[52] = (unsigned short )0;
    sqlstm.sqhstv[53] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[53] = (unsigned long )9;
    sqlstm.sqhsts[53] = (         int  )0;
    sqlstm.sqindv[53] = (         short *)0;
    sqlstm.sqinds[53] = (         int  )0;
    sqlstm.sqharm[53] = (unsigned long )0;
    sqlstm.sqadto[53] = (unsigned short )0;
    sqlstm.sqtdso[53] = (unsigned short )0;
    sqlstm.sqhstv[54] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[54] = (unsigned long )5;
    sqlstm.sqhsts[54] = (         int  )0;
    sqlstm.sqindv[54] = (         short *)0;
    sqlstm.sqinds[54] = (         int  )0;
    sqlstm.sqharm[54] = (unsigned long )0;
    sqlstm.sqadto[54] = (unsigned short )0;
    sqlstm.sqtdso[54] = (unsigned short )0;
    sqlstm.sqhstv[55] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[55] = (unsigned long )9;
    sqlstm.sqhsts[55] = (         int  )0;
    sqlstm.sqindv[55] = (         short *)0;
    sqlstm.sqinds[55] = (         int  )0;
    sqlstm.sqharm[55] = (unsigned long )0;
    sqlstm.sqadto[55] = (unsigned short )0;
    sqlstm.sqtdso[55] = (unsigned short )0;
    sqlstm.sqhstv[56] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[56] = (unsigned long )9;
    sqlstm.sqhsts[56] = (         int  )0;
    sqlstm.sqindv[56] = (         short *)0;
    sqlstm.sqinds[56] = (         int  )0;
    sqlstm.sqharm[56] = (unsigned long )0;
    sqlstm.sqadto[56] = (unsigned short )0;
    sqlstm.sqtdso[56] = (unsigned short )0;
    sqlstm.sqhstv[57] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[57] = (unsigned long )5;
    sqlstm.sqhsts[57] = (         int  )0;
    sqlstm.sqindv[57] = (         short *)0;
    sqlstm.sqinds[57] = (         int  )0;
    sqlstm.sqharm[57] = (unsigned long )0;
    sqlstm.sqadto[57] = (unsigned short )0;
    sqlstm.sqtdso[57] = (unsigned short )0;
    sqlstm.sqhstv[58] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[58] = (unsigned long )9;
    sqlstm.sqhsts[58] = (         int  )0;
    sqlstm.sqindv[58] = (         short *)0;
    sqlstm.sqinds[58] = (         int  )0;
    sqlstm.sqharm[58] = (unsigned long )0;
    sqlstm.sqadto[58] = (unsigned short )0;
    sqlstm.sqtdso[58] = (unsigned short )0;
    sqlstm.sqhstv[59] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[59] = (unsigned long )9;
    sqlstm.sqhsts[59] = (         int  )0;
    sqlstm.sqindv[59] = (         short *)0;
    sqlstm.sqinds[59] = (         int  )0;
    sqlstm.sqharm[59] = (unsigned long )0;
    sqlstm.sqadto[59] = (unsigned short )0;
    sqlstm.sqtdso[59] = (unsigned short )0;
    sqlstm.sqhstv[60] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[60] = (unsigned long )5;
    sqlstm.sqhsts[60] = (         int  )0;
    sqlstm.sqindv[60] = (         short *)0;
    sqlstm.sqinds[60] = (         int  )0;
    sqlstm.sqharm[60] = (unsigned long )0;
    sqlstm.sqadto[60] = (unsigned short )0;
    sqlstm.sqtdso[60] = (unsigned short )0;
    sqlstm.sqhstv[61] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[61] = (unsigned long )9;
    sqlstm.sqhsts[61] = (         int  )0;
    sqlstm.sqindv[61] = (         short *)0;
    sqlstm.sqinds[61] = (         int  )0;
    sqlstm.sqharm[61] = (unsigned long )0;
    sqlstm.sqadto[61] = (unsigned short )0;
    sqlstm.sqtdso[61] = (unsigned short )0;
    sqlstm.sqhstv[62] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[62] = (unsigned long )9;
    sqlstm.sqhsts[62] = (         int  )0;
    sqlstm.sqindv[62] = (         short *)0;
    sqlstm.sqinds[62] = (         int  )0;
    sqlstm.sqharm[62] = (unsigned long )0;
    sqlstm.sqadto[62] = (unsigned short )0;
    sqlstm.sqtdso[62] = (unsigned short )0;
    sqlstm.sqhstv[63] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[63] = (unsigned long )5;
    sqlstm.sqhsts[63] = (         int  )0;
    sqlstm.sqindv[63] = (         short *)0;
    sqlstm.sqinds[63] = (         int  )0;
    sqlstm.sqharm[63] = (unsigned long )0;
    sqlstm.sqadto[63] = (unsigned short )0;
    sqlstm.sqtdso[63] = (unsigned short )0;
    sqlstm.sqhstv[64] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[64] = (unsigned long )9;
    sqlstm.sqhsts[64] = (         int  )0;
    sqlstm.sqindv[64] = (         short *)0;
    sqlstm.sqinds[64] = (         int  )0;
    sqlstm.sqharm[64] = (unsigned long )0;
    sqlstm.sqadto[64] = (unsigned short )0;
    sqlstm.sqtdso[64] = (unsigned short )0;
    sqlstm.sqhstv[65] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[65] = (unsigned long )9;
    sqlstm.sqhsts[65] = (         int  )0;
    sqlstm.sqindv[65] = (         short *)0;
    sqlstm.sqinds[65] = (         int  )0;
    sqlstm.sqharm[65] = (unsigned long )0;
    sqlstm.sqadto[65] = (unsigned short )0;
    sqlstm.sqtdso[65] = (unsigned short )0;
    sqlstm.sqhstv[66] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[66] = (unsigned long )5;
    sqlstm.sqhsts[66] = (         int  )0;
    sqlstm.sqindv[66] = (         short *)0;
    sqlstm.sqinds[66] = (         int  )0;
    sqlstm.sqharm[66] = (unsigned long )0;
    sqlstm.sqadto[66] = (unsigned short )0;
    sqlstm.sqtdso[66] = (unsigned short )0;
    sqlstm.sqhstv[67] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[67] = (unsigned long )9;
    sqlstm.sqhsts[67] = (         int  )0;
    sqlstm.sqindv[67] = (         short *)0;
    sqlstm.sqinds[67] = (         int  )0;
    sqlstm.sqharm[67] = (unsigned long )0;
    sqlstm.sqadto[67] = (unsigned short )0;
    sqlstm.sqtdso[67] = (unsigned short )0;
    sqlstm.sqhstv[68] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[68] = (unsigned long )9;
    sqlstm.sqhsts[68] = (         int  )0;
    sqlstm.sqindv[68] = (         short *)0;
    sqlstm.sqinds[68] = (         int  )0;
    sqlstm.sqharm[68] = (unsigned long )0;
    sqlstm.sqadto[68] = (unsigned short )0;
    sqlstm.sqtdso[68] = (unsigned short )0;
    sqlstm.sqhstv[69] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[69] = (unsigned long )5;
    sqlstm.sqhsts[69] = (         int  )0;
    sqlstm.sqindv[69] = (         short *)0;
    sqlstm.sqinds[69] = (         int  )0;
    sqlstm.sqharm[69] = (unsigned long )0;
    sqlstm.sqadto[69] = (unsigned short )0;
    sqlstm.sqtdso[69] = (unsigned short )0;
    sqlstm.sqhstv[70] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[70] = (unsigned long )9;
    sqlstm.sqhsts[70] = (         int  )0;
    sqlstm.sqindv[70] = (         short *)0;
    sqlstm.sqinds[70] = (         int  )0;
    sqlstm.sqharm[70] = (unsigned long )0;
    sqlstm.sqadto[70] = (unsigned short )0;
    sqlstm.sqtdso[70] = (unsigned short )0;
    sqlstm.sqhstv[71] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[71] = (unsigned long )9;
    sqlstm.sqhsts[71] = (         int  )0;
    sqlstm.sqindv[71] = (         short *)0;
    sqlstm.sqinds[71] = (         int  )0;
    sqlstm.sqharm[71] = (unsigned long )0;
    sqlstm.sqadto[71] = (unsigned short )0;
    sqlstm.sqtdso[71] = (unsigned short )0;
    sqlstm.sqhstv[72] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[72] = (unsigned long )5;
    sqlstm.sqhsts[72] = (         int  )0;
    sqlstm.sqindv[72] = (         short *)0;
    sqlstm.sqinds[72] = (         int  )0;
    sqlstm.sqharm[72] = (unsigned long )0;
    sqlstm.sqadto[72] = (unsigned short )0;
    sqlstm.sqtdso[72] = (unsigned short )0;
    sqlstm.sqhstv[73] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[73] = (unsigned long )9;
    sqlstm.sqhsts[73] = (         int  )0;
    sqlstm.sqindv[73] = (         short *)0;
    sqlstm.sqinds[73] = (         int  )0;
    sqlstm.sqharm[73] = (unsigned long )0;
    sqlstm.sqadto[73] = (unsigned short )0;
    sqlstm.sqtdso[73] = (unsigned short )0;
    sqlstm.sqhstv[74] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[74] = (unsigned long )9;
    sqlstm.sqhsts[74] = (         int  )0;
    sqlstm.sqindv[74] = (         short *)0;
    sqlstm.sqinds[74] = (         int  )0;
    sqlstm.sqharm[74] = (unsigned long )0;
    sqlstm.sqadto[74] = (unsigned short )0;
    sqlstm.sqtdso[74] = (unsigned short )0;
    sqlstm.sqhstv[75] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[75] = (unsigned long )5;
    sqlstm.sqhsts[75] = (         int  )0;
    sqlstm.sqindv[75] = (         short *)0;
    sqlstm.sqinds[75] = (         int  )0;
    sqlstm.sqharm[75] = (unsigned long )0;
    sqlstm.sqadto[75] = (unsigned short )0;
    sqlstm.sqtdso[75] = (unsigned short )0;
    sqlstm.sqhstv[76] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[76] = (unsigned long )9;
    sqlstm.sqhsts[76] = (         int  )0;
    sqlstm.sqindv[76] = (         short *)0;
    sqlstm.sqinds[76] = (         int  )0;
    sqlstm.sqharm[76] = (unsigned long )0;
    sqlstm.sqadto[76] = (unsigned short )0;
    sqlstm.sqtdso[76] = (unsigned short )0;
    sqlstm.sqhstv[77] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[77] = (unsigned long )9;
    sqlstm.sqhsts[77] = (         int  )0;
    sqlstm.sqindv[77] = (         short *)0;
    sqlstm.sqinds[77] = (         int  )0;
    sqlstm.sqharm[77] = (unsigned long )0;
    sqlstm.sqadto[77] = (unsigned short )0;
    sqlstm.sqtdso[77] = (unsigned short )0;
    sqlstm.sqhstv[78] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[78] = (unsigned long )5;
    sqlstm.sqhsts[78] = (         int  )0;
    sqlstm.sqindv[78] = (         short *)0;
    sqlstm.sqinds[78] = (         int  )0;
    sqlstm.sqharm[78] = (unsigned long )0;
    sqlstm.sqadto[78] = (unsigned short )0;
    sqlstm.sqtdso[78] = (unsigned short )0;
    sqlstm.sqhstv[79] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[79] = (unsigned long )9;
    sqlstm.sqhsts[79] = (         int  )0;
    sqlstm.sqindv[79] = (         short *)0;
    sqlstm.sqinds[79] = (         int  )0;
    sqlstm.sqharm[79] = (unsigned long )0;
    sqlstm.sqadto[79] = (unsigned short )0;
    sqlstm.sqtdso[79] = (unsigned short )0;
    sqlstm.sqhstv[80] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[80] = (unsigned long )9;
    sqlstm.sqhsts[80] = (         int  )0;
    sqlstm.sqindv[80] = (         short *)0;
    sqlstm.sqinds[80] = (         int  )0;
    sqlstm.sqharm[80] = (unsigned long )0;
    sqlstm.sqadto[80] = (unsigned short )0;
    sqlstm.sqtdso[80] = (unsigned short )0;
    sqlstm.sqhstv[81] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[81] = (unsigned long )5;
    sqlstm.sqhsts[81] = (         int  )0;
    sqlstm.sqindv[81] = (         short *)0;
    sqlstm.sqinds[81] = (         int  )0;
    sqlstm.sqharm[81] = (unsigned long )0;
    sqlstm.sqadto[81] = (unsigned short )0;
    sqlstm.sqtdso[81] = (unsigned short )0;
    sqlstm.sqhstv[82] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[82] = (unsigned long )9;
    sqlstm.sqhsts[82] = (         int  )0;
    sqlstm.sqindv[82] = (         short *)0;
    sqlstm.sqinds[82] = (         int  )0;
    sqlstm.sqharm[82] = (unsigned long )0;
    sqlstm.sqadto[82] = (unsigned short )0;
    sqlstm.sqtdso[82] = (unsigned short )0;
    sqlstm.sqhstv[83] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[83] = (unsigned long )9;
    sqlstm.sqhsts[83] = (         int  )0;
    sqlstm.sqindv[83] = (         short *)0;
    sqlstm.sqinds[83] = (         int  )0;
    sqlstm.sqharm[83] = (unsigned long )0;
    sqlstm.sqadto[83] = (unsigned short )0;
    sqlstm.sqtdso[83] = (unsigned short )0;
    sqlstm.sqhstv[84] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[84] = (unsigned long )5;
    sqlstm.sqhsts[84] = (         int  )0;
    sqlstm.sqindv[84] = (         short *)0;
    sqlstm.sqinds[84] = (         int  )0;
    sqlstm.sqharm[84] = (unsigned long )0;
    sqlstm.sqadto[84] = (unsigned short )0;
    sqlstm.sqtdso[84] = (unsigned short )0;
    sqlstm.sqhstv[85] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[85] = (unsigned long )9;
    sqlstm.sqhsts[85] = (         int  )0;
    sqlstm.sqindv[85] = (         short *)0;
    sqlstm.sqinds[85] = (         int  )0;
    sqlstm.sqharm[85] = (unsigned long )0;
    sqlstm.sqadto[85] = (unsigned short )0;
    sqlstm.sqtdso[85] = (unsigned short )0;
    sqlstm.sqhstv[86] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[86] = (unsigned long )9;
    sqlstm.sqhsts[86] = (         int  )0;
    sqlstm.sqindv[86] = (         short *)0;
    sqlstm.sqinds[86] = (         int  )0;
    sqlstm.sqharm[86] = (unsigned long )0;
    sqlstm.sqadto[86] = (unsigned short )0;
    sqlstm.sqtdso[86] = (unsigned short )0;
    sqlstm.sqhstv[87] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[87] = (unsigned long )5;
    sqlstm.sqhsts[87] = (         int  )0;
    sqlstm.sqindv[87] = (         short *)0;
    sqlstm.sqinds[87] = (         int  )0;
    sqlstm.sqharm[87] = (unsigned long )0;
    sqlstm.sqadto[87] = (unsigned short )0;
    sqlstm.sqtdso[87] = (unsigned short )0;
    sqlstm.sqhstv[88] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[88] = (unsigned long )9;
    sqlstm.sqhsts[88] = (         int  )0;
    sqlstm.sqindv[88] = (         short *)0;
    sqlstm.sqinds[88] = (         int  )0;
    sqlstm.sqharm[88] = (unsigned long )0;
    sqlstm.sqadto[88] = (unsigned short )0;
    sqlstm.sqtdso[88] = (unsigned short )0;
    sqlstm.sqhstv[89] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[89] = (unsigned long )9;
    sqlstm.sqhsts[89] = (         int  )0;
    sqlstm.sqindv[89] = (         short *)0;
    sqlstm.sqinds[89] = (         int  )0;
    sqlstm.sqharm[89] = (unsigned long )0;
    sqlstm.sqadto[89] = (unsigned short )0;
    sqlstm.sqtdso[89] = (unsigned short )0;
    sqlstm.sqhstv[90] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[90] = (unsigned long )5;
    sqlstm.sqhsts[90] = (         int  )0;
    sqlstm.sqindv[90] = (         short *)0;
    sqlstm.sqinds[90] = (         int  )0;
    sqlstm.sqharm[90] = (unsigned long )0;
    sqlstm.sqadto[90] = (unsigned short )0;
    sqlstm.sqtdso[90] = (unsigned short )0;
    sqlstm.sqhstv[91] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[91] = (unsigned long )9;
    sqlstm.sqhsts[91] = (         int  )0;
    sqlstm.sqindv[91] = (         short *)0;
    sqlstm.sqinds[91] = (         int  )0;
    sqlstm.sqharm[91] = (unsigned long )0;
    sqlstm.sqadto[91] = (unsigned short )0;
    sqlstm.sqtdso[91] = (unsigned short )0;
    sqlstm.sqhstv[92] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[92] = (unsigned long )9;
    sqlstm.sqhsts[92] = (         int  )0;
    sqlstm.sqindv[92] = (         short *)0;
    sqlstm.sqinds[92] = (         int  )0;
    sqlstm.sqharm[92] = (unsigned long )0;
    sqlstm.sqadto[92] = (unsigned short )0;
    sqlstm.sqtdso[92] = (unsigned short )0;
    sqlstm.sqhstv[93] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[93] = (unsigned long )5;
    sqlstm.sqhsts[93] = (         int  )0;
    sqlstm.sqindv[93] = (         short *)0;
    sqlstm.sqinds[93] = (         int  )0;
    sqlstm.sqharm[93] = (unsigned long )0;
    sqlstm.sqadto[93] = (unsigned short )0;
    sqlstm.sqtdso[93] = (unsigned short )0;
    sqlstm.sqhstv[94] = (unsigned char  *)vStrtDate;
    sqlstm.sqhstl[94] = (unsigned long )9;
    sqlstm.sqhsts[94] = (         int  )0;
    sqlstm.sqindv[94] = (         short *)0;
    sqlstm.sqinds[94] = (         int  )0;
    sqlstm.sqharm[94] = (unsigned long )0;
    sqlstm.sqadto[94] = (unsigned short )0;
    sqlstm.sqtdso[94] = (unsigned short )0;
    sqlstm.sqhstv[95] = (unsigned char  *)vTempDate;
    sqlstm.sqhstl[95] = (unsigned long )9;
    sqlstm.sqhsts[95] = (         int  )0;
    sqlstm.sqindv[95] = (         short *)0;
    sqlstm.sqinds[95] = (         int  )0;
    sqlstm.sqharm[95] = (unsigned long )0;
    sqlstm.sqadto[95] = (unsigned short )0;
    sqlstm.sqtdso[95] = (unsigned short )0;
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



    hinsa_trim(vNextDate2);

    /* EXEC SQL
            SELECT PAYUTIL.GET_DUTY_CNT(:vEmpno,:vNextDate1,:vNextDate2,'1') USED_YEARLY_CN
              INTO :vYearly_cnt
              FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 96;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select PAYUTIL.GET_DUTY_CNT(:b0,:b1,:b2,'1') USED_YEARLY\
_CN into :b3  from DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )997;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vEmpno;
    sqlstm.sqhstl[0] = (unsigned long )5;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vNextDate1;
    sqlstm.sqhstl[1] = (unsigned long )9;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)vNextDate2;
    sqlstm.sqhstl[2] = (unsigned long )9;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&vYearly_cnt;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(float);
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



     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
        sprintf(log_buff, "ERROR ====== [get_next_yearly_date] ORA-%05d - \n",sqlca.sqlcode);
        Write_batlog(seqno++, log_buff);
        error_quit("ERROR ====== [get_next_yearly_date] =====\n");
        return (FAIL);
     };

     return(SUCCESS);
}

int process_message()
{
    int   daycode;
    char  curryymm[6+1];
    char  nextyymm[6+1];


    memset(CurrMM,     '\0',sizeof(CurrMM));
    memset(CurrDD,     '\0',sizeof(CurrDD));
    memset(curryymm,   '\0',sizeof(curryymm));

    memset(NextYYYY1,  '\0',sizeof(NextYYYY1));
    memset(NextMM1,    '\0',sizeof(NextMM1));
    memset(NextDD1,    '\0',sizeof(NextDD1));
    memset(nextyymm,   '\0',sizeof(nextyymm));


     /* 0. 현재시간 체크 */
    /* EXEC SQL
            SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24mmss'),TO_CHAR(SYSDATE,'YYYYMMDD')
              INTO :log_rundate, :vCurrDate
              FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 96;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24mmss') ,TO_CHAR(SYSD\
ATE,'YYYYMMDD') into :b0,:b1  from DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1028;
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

    /* EXEC SQL
            SELECT COUNT(*)
              INTO :vSend_cnt
              FROM PYBATLOG
             WHERE RUNDATE LIKE :vCurrDate||'%'
               AND PROGID  =    :log_progid
               AND RESULT  LIKE '%OK%'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 96;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select count(*)  into :b0  from PYBATLOG where ((RUNDATE\
 like (:b1||'%') and PROGID=:b2) and RESULT like '%OK%')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1051;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&vSend_cnt;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
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
    sqlstm.sqhstv[2] = (unsigned char  *)log_progid;
    sqlstm.sqhstl[2] = (unsigned long )16;
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



    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        sprintf(log_buff, "ERROR ====== [기전송여부체크] ORA-%05d - \n",sqlca.sqlcode);
        Write_batlog(seqno++, log_buff);
        error_quit("ERROR ====== [기전송여부체크 실패] =====\n");
    };

	if( vSend_cnt > 0 ) {
        sprintf(log_buff, "====== [금일자로 전송된 자료가 존재합니다.]\n");
        Write_batlog(seqno++, log_buff);
        return(SUCCESS);
	}

     /* 1. 금일 평일여부 체크 */
     /* EXEC SQL
             SELECT CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                         THEN 0
                         ELSE 1 END DAYCODE
               INTO :daycode
               FROM PKHCALDAYS A,
                    PKCHOLI B
              WHERE A.YYYYMMDD = B.HOLIDATE(+)
                AND YYYYMMDD   = TO_CHAR(SYSDATE,'YYYYMMDD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select  case  when (A.DAYCODE in ('1','7') or B.HOLIDAT\
E is  not null ) then 0 else 1  end  DAYCODE into :b0  from PKHCALDAYS A ,PKC\
HOLI B where (A.YYYYMMDD=B.HOLIDATE(+) and YYYYMMDD=TO_CHAR(SYSDATE,'YYYYMMDD\
'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1078;
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



     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
        sprintf(log_buff, "ERROR ====== [평일여부체크] ORA-%05d - \n",sqlca.sqlcode);
        Write_batlog(seqno++, log_buff);
        error_quit("ERROR ====== [평일여부체크 실패] =====\n");
     };

     /*휴일은 문자전송하지 않음*/
     if(daycode == 0 ) return 0;

     /* 2. 다음 평일 조회 */
     /* EXEC SQL
             SELECT MIN(YYYYMMDD)
               INTO :vNextDate1
               FROM (SELECT A.YYYYMMDD, CASE WHEN A.DAYCODE IN ('1','7') OR B.HOLIDATE IS NOT NULL
                                             THEN 0
                                             ELSE 1 END DAYCODE
                       FROM PKHCALDAYS A,
                            PKCHOLI B
                      WHERE A.YYYYMMDD = B.HOLIDATE(+)
                        AND A.YYYYMMDD BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMMDD') AND TO_CHAR(ADD_MONTHS(SYSDATE,+1),'YYYYMMDD')
                    )
              WHERE DAYCODE =1
                AND YYYYMMDD > TO_CHAR(SYSDATE,'YYYYMMDD')   ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select min(YYYYMMDD) into :b0  from (select A.YYYYMMDD \
, case  when (A.DAYCODE in ('1','7') or B.HOLIDATE is  not null ) then 0 else\
 1  end  DAYCODE  from PKHCALDAYS A ,PKCHOLI B where (A.YYYYMMDD=B.HOLIDATE(+\
) and A.YYYYMMDD between TO_CHAR(ADD_MONTHS(SYSDATE,(-1)),'YYYYMMDD') and TO_\
CHAR(ADD_MONTHS(SYSDATE,(+1)),'YYYYMMDD'))) where (DAYCODE=1 and YYYYMMDD>TO_\
CHAR(SYSDATE,'YYYYMMDD'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1097;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)vNextDate1;
     sqlstm.sqhstl[0] = (unsigned long )9;
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



     hinsa_trim(vNextDate1);

     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         sprintf(log_buff, "ERROR ====== [다음 평일 조회] ORA-%05d - \n",sqlca.sqlcode);
         Write_batlog(seqno++, log_buff);
         error_quit("ERROR ====== [다음 평일 조회 실패] =====\n");
     };

     strncpy(curryymm,vCurrDate,6);
     strncpy(CurrMM,vCurrDate+4,2);
     strncpy(CurrDD,vCurrDate+6,2);

     strncpy(NextYYYY1,vNextDate1,4);
     strncpy(NextMM1,vNextDate1+4,2);
     strncpy(NextDD1,vNextDate1+6,2);
     strncpy(nextyymm,vNextDate1,6);



      /* 3. 메시지 전송 대상자 조회 */
      /*2015.05.06.hjku.. 메시지 전송대상자 추출시 연차 전일 모든 근태에 대해 전송.. 이명노M 요청
      sprintf(sql_stmt,"select a.empno,a.korname from pkhduty a,pimpmas b where a.empno = b.empno and b.pstate < '80' and duyymm = '%s' and nvl(dd%d,'99') in ('97','98','99','00') and exists(select 1 from pimeemp where a.empno = empno) and exists(select 1 from pkhduty where duyymm ='%s' and a.empno = empno and nvl(dd%d,'99') in ('63','64'))",
                      curryymm,atoi(CurrDD),nextyymm,atoi(NextDD1));
      */
     sprintf(sql_stmt,"select a.empno,a.korname "
                      "  from pkhduty a,pimpmas b "
                      " where a.empno = b.empno and b.pstate < '80' "
                      "   and duyymm = '%s' "
                      "   and nvl(dd%d,'99') not in ('63','64') "
                      "   and exists(select 1 from pimeemp where a.empno = empno) "
                      "   and exists(select 1 from pkhduty where duyymm ='%s' and a.empno = empno and nvl(dd%d,'99') in ('63','64'))",
                      curryymm,atoi(CurrDD),nextyymm,atoi(NextDD1));

     /* EXEC SQL PREPARE S FROM :sql_stmt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1116;
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
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1135;
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
          sqlstm.arrsiz = 96;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1150;
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
          memset(vEmpno,  '\0',sizeof(vEmpno));
          memset(vKorname,'\0',sizeof(vKorname));

          /* EXEC SQL FETCH  cursor1 INTO  :vEmpno, :vKorname; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 96;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1165;
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

          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 96;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1188;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               sprintf(log_buff, "처리된 작업대상자 : [%d] 명 \n",rcount);
               Write_batlog(seqno++, log_buff);
               return;
          }

          if  (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor1 Data Fetch Error 1...");
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 96;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1203;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }

          get_next_yearly_date();

          memset(NextYYYY2,  '\0',sizeof(NextYYYY2));
          memset(NextMM2,    '\0',sizeof(NextMM2));
          memset(NextDD2,    '\0',sizeof(NextDD2));

          strncpy(NextYYYY2,vNextDate2,4);
          strncpy(NextMM2,vNextDate2+4,2);
          strncpy(NextDD2,vNextDate2+6,2);

/*printf("DEBUG : vEmpno[%s],vKorname[%s],vNextDate1[%s],vNextDate2[%s]\n",vEmpno,vKorname,vNextDate1,vNextDate2);             */
          if(Send_Message() == SUCCESS) rcount++;
/*          else
          {
           EXEC SQL CLOSE cursor1;
           error_quit("작업실패...");
          }
*/
     }

     return 0;
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
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1218;
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
     sqlstm.arrsiz = 96;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1259;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}
