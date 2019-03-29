
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
    "pkq2070g.pc"
};


static unsigned int sqlctx = 154035;


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
   unsigned char  *sqhstv[5];
   unsigned long  sqhstl[5];
            int   sqhsts[5];
            short *sqindv[5];
            int   sqinds[5];
   unsigned long  sqharm[5];
   unsigned long  *sqharc[5];
   unsigned short  sqadto[5];
   unsigned short  sqtdso[5];
} sqlstm = {12,5};

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

 static char *sq0011 = 
"select EMPNO ,RETDATE ,BLDCODE  from PKMRTMAS where CALYN='N'           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,394,0,5,147,0,0,0,0,0,1,0,
20,0,0,2,30,0,5,161,0,0,0,0,0,1,0,
35,0,0,3,124,0,5,165,0,0,0,0,0,1,0,
50,0,0,4,1013,0,5,198,0,0,0,0,0,1,0,
65,0,0,5,2072,0,5,247,0,0,0,0,0,1,0,
80,0,0,6,195,0,5,310,0,0,0,0,0,1,0,
95,0,0,7,81,0,5,325,0,0,0,0,0,1,0,
110,0,0,8,135,0,5,339,0,0,0,0,0,1,0,
125,0,0,9,172,0,5,356,0,0,0,0,0,1,0,
140,0,0,10,44,0,4,444,0,0,1,0,0,1,0,2,97,0,0,
159,0,0,11,72,0,9,507,0,0,0,0,0,1,0,
174,0,0,11,0,0,13,517,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
201,0,0,11,0,0,15,521,0,0,0,0,0,1,0,
216,0,0,12,120,0,5,530,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
243,0,0,13,299,0,5,549,0,0,0,0,0,1,0,
258,0,0,14,58,0,5,569,0,0,0,0,0,1,0,
273,0,0,15,254,0,5,623,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
296,0,0,16,271,0,5,639,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
319,0,0,17,449,0,5,656,0,0,1,1,0,1,0,1,97,0,0,
338,0,0,18,40,0,4,705,0,0,1,0,0,1,0,2,4,0,0,
357,0,0,19,126,0,5,724,0,0,0,0,0,1,0,
372,0,0,20,82,0,5,732,0,0,2,2,0,1,0,1,4,0,0,1,4,0,0,
395,0,0,21,262,0,5,739,0,0,0,0,0,1,0,
410,0,0,22,69,0,5,752,0,0,1,1,0,1,0,1,4,0,0,
429,0,0,23,77,0,5,778,0,0,0,0,0,1,0,
444,0,0,24,491,0,5,814,0,0,0,0,0,1,0,
459,0,0,25,358,0,5,850,0,0,0,0,0,1,0,
474,0,0,26,115,0,5,880,0,0,0,0,0,1,0,
489,0,0,27,160,0,5,913,0,0,0,0,0,1,0,
504,0,0,28,59,0,5,929,0,0,0,0,0,1,0,
519,0,0,29,116,0,5,936,0,0,0,0,0,1,0,
534,0,0,30,60,0,5,949,0,0,0,0,0,1,0,
549,0,0,31,86,0,4,993,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
572,0,0,32,75,0,4,998,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
595,0,0,33,65,0,4,1006,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
618,0,0,34,57,0,4,1013,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
641,0,0,35,295,0,5,1073,0,0,0,0,0,1,0,
656,0,0,36,43,0,5,1085,0,0,0,0,0,1,0,
671,0,0,37,192,0,5,1110,0,0,0,0,0,1,0,
686,0,0,38,190,0,5,1129,0,0,0,0,0,1,0,
701,0,0,39,191,0,5,1148,0,0,0,0,0,1,0,
716,0,0,40,191,0,5,1185,0,0,0,0,0,1,0,
731,0,0,41,50,0,3,1207,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
772,0,0,42,0,0,29,1217,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ2070G(퇴직자 월급여 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 민정숙
 Version        : 30.00
 Date           : 1999.02.28

Update Contents
 Version  date(yy.mm.dd)  programmer   description            relevant doc.no
  1.00     1997.02.16      이인환      최초개발본             설계명세서
  30.00    1999.02.28      민정숙      연봉제관련             하나로재개발
  30.01    2004.02.24      강륜종      Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. 
  31.10    2004.11.    강륜종(dsa2000) Rexec대체 서비스를 위한 수정작업.      
  32.00    2005.01.12  강륜종(dsa2000) 정보통신수당 추가 및 월차수당 폐지.

퇴직월 월차 계산     : /bin/Kbin/pkq2071g %.6s %s %s %s   ==> 2005.01부터 폐지.
퇴직월 초과근무 수당 : /bin/Kbin/pkg3070g %.6s %4s %4s %c %4s 0 %s
퇴직월 상여금 계산   : /bin/Kbin/pkq2072g 퇴직월 작업자 dbuser
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

void  update_bonus();

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

     char  workyymmdd[9];
     char  ovtmyymm[7];
     char  DayOfWeek[4];
     char   tempdate[9];
     char  LastDay[3];
     char  HoliDate[9];
     char  empno[5];
     char  bldcode[3];
     char  retdate[9];
     int   mcarday;
     char  GSempno[5];
     double  mcarnotax;
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

enum  { WEEKDAY=0, WEEKEND=1 } day[33];
char  cmdline[256];
int   db;
int   id;
char  UserId[20];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

void main(argc,argv)
int  argc;
char *argv[];
{
     char FL_file[255];
               
     if (argc != 4) {  /* /hper8/HINSA/proc/bin/Kbin/pkq2070g D006 pkq2070g 2004110100000 */
              printf("[Usage] : pkq2070g  1.작업자사번 2.프로그램ID 3.시작시간 \n");  
              exit(1);
     }
     
     memset(UserId,'\0',sizeof(UserId));
     strcpy(UserId,argv[2]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2070g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"퇴직자 월급여 계산 시작...");                       
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[2]);
     strcpy(log_rundate,  argv[3]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     sprintf(GSempno,"%4s",argv[1]);
     
     CalcPay();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/  
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [퇴직월 급여 계산 작업이 성공] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [퇴직월 급여 계산 작업이 성공] =====\n");
     }  

}

err_print(errcode,str)
int  errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련항목추가      하나로재개발
============================================================================= */
CalcPay()
{
     char *HOMEDIR;
     HOMEDIR = hinsa_home();  /* "/hper/insa/HINSA" 읽어오기...dsa2000 */
     strcat(HOMEDIR,"/proc");
     
     printf("\n 1. 기본사항 갱신 중 ....");
     sprintf(log_buff, "\n 1. 기본사항 갱신 중 ....");
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     /* EXEC   SQL
     UPDATE  PKMRTMAS
        SET  PAYSUM     = 0, BASICAMT   = 0, INFOAMT    = 0, DUTYAMT     = 0,
             PROMAMT    = 0, FAMIAMT    = 0, LICEAMT    = 0, MCARAMT     = 0,
             OVTMAMT    = 0, SPTMAMT    = 0, BOKJISPAMT = 0, AIDAMT1     = 0,
             AIDAMT2    = 0, AIDAMT3    = 0, MBONAMT    = 0, BONUSAMT    = 0,
             INCENTAMT  = 0, TRAINAMT   = 0, WINTERAMT  = 0, SBONAMT     = 0,
             DEDTOT     = 0, MEDAMT1    = 0, EMPLAMT    = 0, ANUSELFAMT  = 0,
             TICKETAMT  = 0, REALPAY    = 0, ODAMT      = 0, ODTAXAMT    = 0,
             MCARTAXAMT = 0, TAXPAY     = 0, NOTAXPAY   = 0,
             FIXPAY     = 0, QUATERPAY  = 0, HOLIPAY    = 0, ROLEAMT     = 0,
             ITAMT      = 0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set PAYSUM=0,BASICAMT=0,INFOAMT=0,DUTY\
AMT=0,PROMAMT=0,FAMIAMT=0,LICEAMT=0,MCARAMT=0,OVTMAMT=0,SPTMAMT=0,BOKJISPAMT=\
0,AIDAMT1=0,AIDAMT2=0,AIDAMT3=0,MBONAMT=0,BONUSAMT=0,INCENTAMT=0,TRAINAMT=0,W\
INTERAMT=0,SBONAMT=0,DEDTOT=0,MEDAMT1=0,EMPLAMT=0,ANUSELFAMT=0,TICKETAMT=0,RE\
ALPAY=0,ODAMT=0,ODTAXAMT=0,MCARTAXAMT=0,TAXPAY=0,NOTAXPAY=0,FIXPAY=0,QUATERPA\
Y=0,HOLIPAY=0,ROLEAMT=0,ITAMT=0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  /*정보통신수당 추가 2005.01. DSA2000 */
     
     /*  퇴직자의 퇴직월 급여가 계산되었으면 급여정산여부를 'Y'로 셋팅한다  */
     /* EXEC SQL
     UPDATE  PKMRTMAS
        SET  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set CALYN='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET  CALYN = 'Y'
      WHERE  EMPNO IN (SELECT EMPNO
                        FROM   PKHPHIS
                       WHERE   SUBSTR(PAYDATE,1,6) = SUBSTR(P.RETDATE,1,6)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set CALYN='Y' where EMPNO in (select\
 EMPNO  from PKHPHIS where SUBSTR(PAYDATE,1,6)=SUBSTR(P.RETDATE,1,6))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 /* 이상용 */
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {    err_print(sqlca.sqlcode,"1. 급여 정산 check ERROR");
          sprintf(log_buff, "1. 급여 정산 check ERROR");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     /*
       급여마스터로부터 직무수당, 업무추진비, 가족수당, 자격수당,
              의료보험료,국민연금, 복지연금지원금을 셋팅한다.
     */
     
     printf("\n 2. 지급금 갱신 중 ....");
     sprintf(log_buff, "\n 2. 지급금 갱신 중 ....");
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
  /* ********************************************************
     중도퇴사자 경우 급여마스터의
    급여액(기본급,정보통신, 직무수당, 업무추진비)을 일할계산합니다. 확인 요청
   ******************************************************** */

/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제                 하나로재개발
                                      FIXPAY, FAMIAMT 일할계산 추가
                                      ITAMT  일할계산 추가 KTH 2010.08.10
============================================================================= */
     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET  (BASICAMT, INFOAMT, DUTYAMT, PROMAMT, FIXPAY, FAMIAMT,ITAMT )
            =
             (SELECT CEIL(NVL(BASICAMT,0)*
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ),
                     CEIL(NVL(INFOAMT,0) *
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) ,
                     CEIL(NVL(DUTYAMT,0) *
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')  /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ),
                     CEIL(NVL(PROMAMT ,0) *
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ),
                     CEIL(NVL(FIXPAY ,0) *
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ),
                     CEIL(NVL(FAMIAMT ,0)*
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ),
                     CEIL(NVL(ITAMT ,0)*
                          TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         )
      FROM  PKMPMAS R
     WHERE  P.EMPNO=R.EMPNO)
     WHERE  CALYN='N'        ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set (BASICAMT,INFOAMT,DUTYAMT,PROMAM\
T,FIXPAY,FAMIAMT,ITAMT)=(select CEIL(((NVL(BASICAMT,0)* TO_CHAR(TO_DATE(P.RET\
DATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')\
)) ,CEIL(((NVL(INFOAMT,0)* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CH\
AR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))) ,CEIL(((NVL(DUTYAMT,0)* TO\
_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE\
,'YYYYMMDD')),'DD'))) ,CEIL(((NVL(PROMAMT,0)* TO_CHAR(TO_DATE(P.RETDATE,'YYYY\
MMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))) ,CEIL((\
(NVL(FIXPAY,0)* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY\
(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))) ,CEIL(((NVL(FAMIAMT,0)* TO_CHAR(TO_DA\
TE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD'\
)),'DD'))) ,CEIL(((NVL(ITAMT,0)* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))\
/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))  from PKMPMAS R wher\
e P.EMPNO=R.EMPNO) where CALYN='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )50;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {    err_print(sqlca.sqlcode,"2. 인사자료 갱신 ERROR");
          sprintf(log_buff, "2. 인사자료 갱신 ERROR");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }

/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.03    1999.04.06      이랑교     급여를 받은후 환수부분이 빠짐
                                      FIXPAY, FAMIAMT 일할계산 추가
                                      퇴직일이 말일이 아닌 경우만 급여환수를 한다.
                                      ITAMT  일할계산 추가 KTH 2010.08.10
============================================================================= */
     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET  (BASICAMT  ,INFOAMT   ,DUTYAMT, PROMAMT, FIXPAY, FAMIAMT ,MCARAMT ,ODAMT,ITAMT)
          =
             (SELECT CEIL(SUM(NVL(BASICAMT,0))*
                          /o 2000-06-26 변경 : +1부분 해제, 퇴직일 다음날부터 말일까지의 급여분 환수 
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)  o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') ) /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                          ) * -1 ,
                     CEIL(SUM(NVL(INFOAMT,0))  *
                          /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)  o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                          ) * -1,
                     CEIL(SUM(NVL(DUTYAMT,0))  *
                           /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)  o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') ) /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL(SUM(NVL(PROMAMT ,0)) *
                          /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)  o/
                         (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL(SUM(NVL(FIXPAY ,0)) *
                          /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)   o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL((SUM(NVL(MATEAMT,0))+SUM(NVL(CHILDAMT,0)) +SUM(NVL(PARTAMT,0))) *
                          /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)    o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL(SUM(NVL(MCARAMT ,0)) *
                     /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)    o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL(SUM(NVL(ODAMT ,0))*
                     /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)     o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') ) /
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1,
                     CEIL(SUM(NVL(ITAMT ,0)) *
                     /o  (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') + 1)     o/
                          (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') - TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') )/
                          TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')
                         ) * -1
                FROM  PKHPHIS R
               WHERE  P.EMPNO = R.EMPNO
                 AND  SUBSTR(PAYDATE,1,6) = SUBSTR(P.RETDATE,1,6)) /o 이상용 o/
      WHERE  CALYN='Y'
        AND  RETDATE <> TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(RETDATE,1,6),'YYYYMM')),'YYYYMMDD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "update PKMRTMAS p  set (BASICAMT,INFOAMT,DUTYAMT,PROMAMT,FIXPAY,FAMI\
AMT,MCARAMT,ODAMT,ITAMT)=(select (CEIL(((sum(NVL(BASICAMT,0))* (TO_CHAR(LAST\
_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMD\
D'),'DD')))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,\
(CEIL(((sum(NVL(INFOAMT,0))* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')\
),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')))/TO_CHAR(LAST_DAY(TO_DA\
TE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,(CEIL(((sum(NVL(DUTYAMT,0))* (TO_C\
HAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,\
'YYYYMMDD'),'DD')))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))*\
 (-1)) ,(CEIL(((sum(NVL(PROMAMT,0))* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YY\
YYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')))/TO_CHAR(LAST_D\
AY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,(CEIL(((sum(NVL(FIXPAY,0))\
* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.R\
ETDATE,'YYYYMMDD'),'DD')))/TO_CHAR(LAST_DAY(");
     sqlbuft((void **)0,
       "TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,(CEIL(((((sum(NVL(MAT\
EAMT,0))+sum(NVL(CHILDAMT,0)))+sum(NVL(PARTAMT,0)))* (TO_CHAR(LAST_DAY(TO_DA\
TE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))\
)/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,(CEIL(((su\
m(NVL(MCARAMT,0))* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO\
_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDA\
TE,'YYYYMMDD')),'DD')))* (-1)) ,(CEIL(((sum(NVL(ODAMT,0))* (TO_CHAR(LAST_DAY\
(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),\
'DD')))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))* (-1)) ,(CEI\
L(((sum(NVL(ITAMT,0))* (TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'\
)-TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')))/TO_CHAR(LAST_DAY(TO_DATE(P.R\
ETDATE,'YYYYMMDD')),'DD')))* (-1))  from PKHPHIS R where (P.EMPNO=R.EMPNO an\
d SUBSTR(PAYDATE,1,6)=SUBSTR(P.RETDATE,1,6))) where (CALYN='Y' and RETDATE<>\
TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(RETDATE,1,6)");
     sqlstm.stmt = ",'YYYYMM')),'YYYYMMDD'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )65;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {    err_print(sqlca.sqlcode,"2.2 인사자료 갱신 ERROR 지급한 급여환수 ");
          sprintf(log_buff, "2.2 인사자료 갱신 ERROR 지급한 급여환수 ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }

     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET (LICEAMT , ANUSELFAMT , BOKJISPAMT, ROLEAMT ) /oMEDAMT1, o/
         =  (SELECT  NVL(LICEAMT ,0), NVL(ANUSELFAMT,0), NVL(BOKJISUPAMT,0), NVL(ROLEAMT,0) /oNVL(MEDAMT,0), o/
               FROM  PKMPMAS R
              WHERE  P.EMPNO=R.EMPNO)
      WHERE  CALYN='N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set (LICEAMT,ANUSELFAMT,BOKJISPAMT,R\
OLEAMT)=(select NVL(LICEAMT,0) ,NVL(ANUSELFAMT,0) ,NVL(BOKJISUPAMT,0) ,NVL(RO\
LEAMT,0)  from PKMPMAS R where P.EMPNO=R.EMPNO) where CALYN='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )80;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {    err_print(sqlca.sqlcode,"3. 인사자료 갱신 ERROR");
          sprintf(log_buff, "3. 인사자료 갱신 ERROR");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }

  /*  퇴사일이 14일 이전이면 복지연금지원금을 0으로 한다*/
     /* EXEC SQL
     UPDATE  PKMRTMAS
        SET  BOKJISPAMT = 0
      WHERE  SUBSTR(RETDATE,7,2) <= '14'
        AND  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set BOKJISPAMT=0 where (SUBSTR(RETDATE\
,7,2)<='14' and CALYN='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )95;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.0 복지연금 setting Error");
          sprintf(log_buff, "3.0 복지연금 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     
  /* 사우회비 지급 비과세 급여로 반영 작업 2011.05.18 kth */
     /* EXEC SQL
     UPDATE PKMRTMAS T 
        SET NOTAXPAY = (SELECT YSUMAMT 
                          FROM PSSAUHIS S
                         WHERE T.EMPNO = S.EMPNO  
                           AND SYEAR = (SELECT MAX(SYEAR) FROM PSSAUHIS)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS T  set NOTAXPAY=(select YSUMAMT  from P\
SSAUHIS S where (T.EMPNO=S.EMPNO and SYEAR=(select max(SYEAR)  from PSSAUHIS \
)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )110;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        
        
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.01 사우회비  setting Error");
          sprintf(log_buff, "3.01 사우회비 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }     
     
     
     /* 사우회비 급여테이블 업데이트  2011.05.18 kth */
     /* EXEC SQL
     UPDATE PKMRTMAS T 
        SET NOTAXPAY  =
                       (SELECT sum(nvl(SAUAMT,0)) +T.NOTAXPAY  
                           FROM PKHPHIS H  
                          WHERE H.EMPNO =T.EMPNO 
                            AND SUBSTR(PAYDATE,1,4) > (SELECT MAX(SYEAR) FROM PSSAUHIS)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS T  set NOTAXPAY=(select (sum(nvl(SAUAMT\
,0))+T.NOTAXPAY)  from PKHPHIS H where (H.EMPNO=T.EMPNO and SUBSTR(PAYDATE,1,\
4)>(select max(SYEAR)  from PSSAUHIS )))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )125;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.02 사우회비 급여  setting Error");
          sprintf(log_buff, "3.01 사우회비 급여 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }        
                       
 /* 사우회비 지급 비과세 급여로 반영 작업 2011.05.18 kth  끝 */     
     

/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련       직책수당로직변경(15일단위 50000/100000)
============================================================================= */
  /*  퇴사일이 14일 이전이면 직책수당, 자격수당이 50000 이후 100000으로 한다   20120706 KTH 직책수당 폐지로 주석
     EXEC SQL
     UPDATE  PKMRTMAS
        SET  ROLEAMT = 50000
      WHERE  SUBSTR(RETDATE,7,2) <= '14'
        AND  CALYN = 'N'
        AND  ROLEAMT > 0;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.1 직책수당 setting Error");
          sprintf(log_buff, "3.1 직책수당 setting Error");
          Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
          exit(1);
     }
*/
/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련          직책수당로직변경(15일단위 50000/100000)
============================================================================= 
     EXEC SQL                 20120706 KTH 직책수당 폐지로 주석
     UPDATE  PKMRTMAS
        SET  ROLEAMT = 100000
      WHERE  SUBSTR(RETDATE,7,2) > '14'
        AND  CALYN = 'N'
        AND  ROLEAMT > 0;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.2 직책수당 setting Error");
          sprintf(log_buff, "3.2 직책수당 setting Error");
          Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
          exit(1);
     }
     */
/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련         자격수당로직변경(15일단위 20000/10000)
============================================================================= 
     EXEC SQL        20120706 KTH 자격수당 폐지로 주석
     UPDATE  PKMRTMAS
        SET  LICEAMT = 10000
      WHERE  SUBSTR(RETDATE,7,2) <= '14'
        AND  CALYN = 'N'
        AND  LICEAMT > 0;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.3 자격수당 setting Error");
          sprintf(log_buff, "3.3 자격수당 setting Error");
          Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
          exit(1);
     }*/
     
/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련        자격수당로직변경(15일단위 20000/10000)
============================================================================= 
     EXEC SQL                             20120706 KTH 자격수당 폐지로 주석
     UPDATE  PKMRTMAS
        SET  LICEAMT = 20000
      WHERE  SUBSTR(RETDATE,7,2) > '14'
        AND  CALYN = 'N'
        AND  LICEAMT > 0;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"3.4 자격수당 setting Error");
          sprintf(log_buff, "3.4 자격수당 setting Error");
          Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
          exit(1);
     }
     */
     
     /* EXEC SQL
     SELECT  MAX(RETDATE) INTO :workyymmdd
       FROM  PKMRTMAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(RETDATE) into :b0  from PKMRTMAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )140;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymmdd;
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


     if  (sqlca.sqlcode != 0 )
     {    err_print(sqlca.sqlcode,"4. 퇴직월 추출 Error");
          sprintf(log_buff, "4. 퇴직월 추출 Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     SetCalendar(workyymmdd);

     printf("\n 3. 지급금(수당) 갱신 중 ....");
     sprintf(log_buff, "\n 3. 지급금(수당) 갱신 중 ....");
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/


  /*  *********************************************
    월차수당을 구한다    DSA2000  2005.01.12 2005년부터 월차수당 폐지.
  *********************************************   */
  /*memset(cmdline,'\0',256);
  
    sprintf(cmdline,"%s/bin/Kbin/pkq2071g %.6s %s %s %s", HOMEDIR,workyymmdd,"1",GSempno,UserId); dsa2000  2004.11.*/
  /*sprintf(cmdline,"%s/bin/Kbin/pkq2071g %.6s %s %s %s %s", 
                  HOMEDIR,workyymmdd,"1",GSempno,log_progid,log_rundate); 
  system(cmdline);

  EXEC SQL
  UPDATE PKMRTMAS p
  SET  MBONAMT = (SELECT MONTHAMT
      FROM T_PKMRTMO R
      WHERE P.EMPNO=R.EMPNO)
  WHERE  CALYN='N';

  if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
  {  err_print(sqlca.sqlcode,"월차 추출 Error");
    sprintf(log_buff, "월차 추출 Error");
          exit(1);
  }
  ====================================================================================================================*/
  
  
  /*  식대교통비를 계산한다. 식대교통비는 퇴직월 1일 부터 퇴직일까지의
     일수를 구하고 이에서 공휴일과일요일을 제외한 날수에 식대교통비
     기준금액에 곱하여 구한다.*/
     
     /*2014.04.21.hjku. 퇴직자 개별적으로 계산하도록 하단으로 이동(일괄계산으로 인한 기존 정산자료가 변경되는 오류가 발생함)... 홍원영M 요청
       초과근무수당을 계산한다  
     sprintf(cmdline,"%s/bin/Kbin/pkg3070g %.6s 0000 Y000 Y %4s 0 %s %s",  
                                  HOMEDIR, ovtmyymm, GSempno, log_progid, log_rundate);                                   
     system(cmdline); */     
     
     /* 초과근무수당을 계산한다           
     sprintf(cmdline,"%s/bin/Kbin/pkg3070g %.6s %4s %4s %c %4s 0 %s %s", 
                            HOMEDIR,ovtmyymm,'0000','Y000','Y',GSempno,log_progid,log_rundate);                      
     system(cmdline);     */
     
     
     /* EXEC   SQL DECLARE  c1 CURSOR FOR
     SELECT  EMPNO, RETDATE, BLDCODE
       FROM  PKMRTMAS
      WHERE  CALYN='N'; */ 

     
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0011;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )159;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"5. 퇴직일 Read Error");
          sprintf(log_buff, "5. 퇴직일 Read Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     while(1)
     {
          /* EXEC  SQL FETCH c1 into
          :empno, :retdate, :bldcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )174;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)retdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)bldcode;
          sqlstm.sqhstl[2] = (unsigned long )3;
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


          
          if  (sqlca.sqlcode == 1403)
          {    /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 3;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )201;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          /*2014.04.21.hjku. 퇴직자 개별적으로 계산하도록 수정... 홍원영M 요청*/
          memset(cmdline,'\0',sizeof(cmdline));
          sprintf(cmdline,"%s/bin/Kbin/pkg3070g %.6s %s %s Y 0 %4s %s %s",  
                                  HOMEDIR, ovtmyymm, empno,empno,GSempno, log_progid, log_rundate);                                   
          system(cmdline);    
          
          /* EXEC SQL
          UPDATE  PKMRTMAS p
             SET  OVTMAMT = (SELECT NVL(OVTMAMT,0)
                               FROM PKHOTSUM
                              WHERE EMPNO=:empno AND OVTMYYMM = :ovtmyymm)
           WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set OVTMAMT=(select NVL(OVTMAMT\
,0)  from PKHOTSUM where (EMPNO=:b0 and OVTMYYMM=:b1)) where EMPNO=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )216;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)ovtmyymm;
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)empno;
          sqlstm.sqhstl[2] = (unsigned long )5;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode," 초과근무 setting Error");
               sprintf(log_buff, " 초과근무 setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }
          
          
     /* =========================================================================
      Version  date(yy.mm.dd)  programmer  description            relevant doc.no
       30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                           식대교통비계산로직추가
     ============================================================================= */
          /* EXEC SQL
          UPDATE   PKMRTMAS P
             SET  (ODAMT,ODTAXAMT) = (
                                      SELECT  CEIL(NVL(ODAMT ,0) *
                                              TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') /
                                              TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')),
                                              NVL(ODTAXAMT,0)
                                        FROM  PKMPMAS R
                                       WHERE  P.EMPNO=R.EMPNO)
           WHERE  EMPNO IN (SELECT EMPNO FROM PKMPMAS WHERE ODAMT > 0)
             AND  CALYN='N'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS P  set (ODAMT,ODTAXAMT)=(select CE\
IL(((NVL(ODAMT,0)* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_\
DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))) ,NVL(ODTAXAMT,0)  from PKMPMAS R w\
here P.EMPNO=R.EMPNO) where (EMPNO in (select EMPNO  from PKMPMAS where ODAMT\
>0) and CALYN='N')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )243;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"7. odamt setting Error");
               sprintf(log_buff, "7. odamt setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }
         
          /* 자가운전은 200,000 까지   */
          /* EXEC SQL
          UPDATE  PKMRTMAS  p
             SET  ODTAXAMT = GREATEST( 0 , ODAMT - 200000 ) ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set ODTAXAMT=GREATEST(0,(ODAMT-\
200000))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )258;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"7.1 odtaxamt setting Error");
               sprintf(log_buff, "7.1 odtaxamt setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }

/* *********************************
    mcarday = CalMcarday(retdate);

    printf(" mcarday %d",mcarday);

    if (mcarday > 25)
      mcarday = 25;

    EXEC SQL
    UPDATE  PKMRTMAS
    SET  FCARDAY = :mcarday
    WHERE  EMPNO   = :empno;
    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {  err_print(sqlca.sqlcode,"6. 식교비 setting Error");
      exit(1);
    }

    EXEC SQL
    UPDATE   PKMRTMAS p
    SET   MCARAMT =
           (SELECT (LUNCHAMT+TRAFAMT+LUNCHADD+TRAFADD+
              TICKETAMT)*:mcarday
            FROM PKCPBLD
            WHERE BLDCODE = :bldcode)
    WHERE  EMPNO = :empno ;
    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {  err_print(sqlca.sqlcode,"6. 식교비 setting Error");
      exit(1);
    }

    EXEC SQL
    UPDATE   PKMRTMAS p
    SET   MCARAMT =
           (SELECT (NVL(LUNCHAMT,0)+NVL(LUNCHADD,0)+NVL(TICKETAMT,0))*:mcarday
            FROM   PKCPBLD R
            WHERE BLDCODE = :bldcode)
    WHERE  EMPNO = :empno and ODAMT>0;
    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {  err_print(sqlca.sqlcode,"7. 식교비 setting Error");
      exit(1);
    }
* ******************************** */
        
          /* EXEC SQL
          UPDATE  PKMRTMAS p
             SET  MCARAMT =
                 (SELECT CEIL((LUNCHAMT+TRAFAMT+LUNCHADD+TRAFADD+TICKETAMT)*
                         TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD') 
                       / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') * 25 )
                    FROM PKCPBLD
                   WHERE BLDCODE = :bldcode)
           WHERE  EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set MCARAMT=(select CEIL(((((((\
(LUNCHAMT+TRAFAMT)+LUNCHADD)+TRAFADD)+TICKETAMT)* TO_CHAR(TO_DATE(P.RETDATE,'\
YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))* 25)\
)  from PKCPBLD where BLDCODE=:b0) where EMPNO=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )273;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bldcode;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)empno;
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


          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"6. 식교비 setting Error");
               sprintf(log_buff, "6. 식교비 setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }
          
          /* EXEC SQL
          UPDATE   PKMRTMAS p
             SET   MCARAMT =
                          (SELECT  CEIL((NVL(LUNCHAMT,0)+NVL(LUNCHADD,0)+NVL(TICKETAMT,0))*
                                     TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')
                                   / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') * 25 )
                             FROM   PKCPBLD R
                            WHERE  BLDCODE = :bldcode)
           WHERE  EMPNO = :empno and ODAMT>0; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set MCARAMT=(select CEIL((((((N\
VL(LUNCHAMT,0)+NVL(LUNCHADD,0))+NVL(TICKETAMT,0))* TO_CHAR(TO_DATE(P.RETDATE,\
'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))* 25\
))  from PKCPBLD R where BLDCODE=:b0) where (EMPNO=:b1 and ODAMT>0)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )296;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bldcode;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)empno;
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


              
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"7. 식교비 setting Error");
               sprintf(log_buff, "7. 식교비 setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }
          
          /* EXEC SQL
          UPDATE  PKMRTMAS p
             SET  MCARAMT  =   CEIL(250000*
                                TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')
                              / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')  ),
                  ODAMT    =   CEIL(350000 *
                                TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')
                              / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') )  ,
                  ODTAXAMT =   GREATEST( 0 , CEIL(350000 *
                                TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD')
                              / TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD') )                        
                              - 200000 ) 
          WHERE  EMPNO = :empno            
            AND  PAYCL <='A99'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS p  set MCARAMT=CEIL(((250000* TO_C\
HAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'\
YYYYMMDD')),'DD'))),ODAMT=CEIL(((350000* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'\
),'DD'))/TO_CHAR(LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD'))),ODTAXAMT=GRE\
ATEST(0,(CEIL(((350000* TO_CHAR(TO_DATE(P.RETDATE,'YYYYMMDD'),'DD'))/TO_CHAR(\
LAST_DAY(TO_DATE(P.RETDATE,'YYYYMMDD')),'DD')))-200000)) where (EMPNO=:b0 and\
 PAYCL<='A99')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )319;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
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

 //infra    AND  PAYCL <='09';   
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"6. 식교비 setting Error");
               sprintf(log_buff, "6. 식교비 setting Error");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               exit(1);
          }

     }  /* END OF */
  
  /*정보통신수당 신규추가. 2005.01.12  DSA2000 ==================================== kth 2010.08.12 주석처리
     EXEC SQL
     UPDATE   PKMRTMAS p
        SET   ITAMT = ( SELECT NVL(ITAMT,0) FROM PKMPMAS WHERE EMPNO = P.EMPNO);  
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"7. 정보통신수당 setting Error");
          sprintf(log_buff, "7. 정보통신수당 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
  ==============================================================================*/
    
    
  /* -----------식교비 특이자는 0으로 -----------
  임원식교비는 225000
  EXEC SQL
  UPDATE   PKMRTMAS p
  SET   MCARAMT = 0
  WHERE  EMPNO = :empno 
  AND  EMPNO IN (SELECT EMPNO FROM PKCMCSPE);
  
  if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
  {  err_print(sqlca.sqlcode,"7. 식교비 특이자는 0으로 setting Error");
    exit(1);
  }
  */
     /* EXEC SQL
     SELECT   MCARNOTAX
       INTO  :mcarnotax
       FROM  PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select MCARNOTAX into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )338;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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



/* =====================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      계약직계산삭제
======================================================================== */
/* =====================================================================
MJS DELETE
  EXEC SQL
  UPDATE PKMRTMAS p
  SET   MCARAMT = 0
  WHERE   PAYCL IN ('00','A1','A2','A3')
        AND     CALYN = 'N';
======================================================================= */

     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET  MCARAMT   = NVL(MCARAMT,0),
             ODAMT     = NVL(ODAMT,0),
             OVTMAMT   = NVL(OVTMAMT,0),
             MBONAMT   = NVL(MBONAMT,0)
             WHERE   CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set MCARAMT=NVL(MCARAMT,0),ODAMT=NVL\
(ODAMT,0),OVTMAMT=NVL(OVTMAMT,0),MBONAMT=NVL(MBONAMT,0) where CALYN='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )357;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* EXEC SQL
     UPDATE  PKMRTMAS p
        SET  MCARTAXAMT = MCARAMT - :mcarnotax
      WHERE  MCARAMT >= :mcarnotax
        AND  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set MCARTAXAMT=(MCARAMT-:b0) where (\
MCARAMT>=:b0 and CALYN='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )372;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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


     
     /*식당소재지역  100%과세 */
     /* EXEC SQL
     UPDATE PKMRTMAS P
        SET MCARTAXAMT = (SELECT  MCARAMT
                            FROM  PKMRTMAS A, PKCPBLD B
                           WHERE  A.BLDCODE = B.BLDCODE
                             AND  A.EMPNO   = P.EMPNO
                             AND  RESTYN    = 'Y' )
                           WHERE  EMPNO IN (SELECT  A.EMPNO
                                              FROM  PKMRTMAS A, PKCPBLD B
                                             WHERE  A.BLDCODE = B.BLDCODE
                                               AND  RESTYN ='Y' )
                             AND  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set MCARTAXAMT=(select MCARAMT  from\
 PKMRTMAS A ,PKCPBLD B where ((A.BLDCODE=B.BLDCODE and A.EMPNO=P.EMPNO) and R\
ESTYN='Y')) where (EMPNO in (select A.EMPNO  from PKMRTMAS A ,PKCPBLD B where\
 (A.BLDCODE=B.BLDCODE and RESTYN='Y')) and CALYN='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )395;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* EXEC SQL
     UPDATE  PKMRTMAS P
        SET  MCARTAXAMT = 0
      WHERE  MCARAMT < :mcarnotax
        AND  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set MCARTAXAMT=0 where (MCARAMT<:b0 \
and CALYN='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )410;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&mcarnotax;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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




/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      상여금계산로직변경
============================================================================= */
/* 급여 항목추가 ****************************************************************
  EXEC   SQL
  UPDATE  PKMRTMAS
  SET  paysum = basicamt   + infoamt   + dutyamt  + promamt   + famiamt +
       liceamt    + mcaramt   + odamt    + ovtmamt   + sptmamt +
       bokjispamt + aidamt1   + aidamt2  + aidamt3   + mbonamt +
       bonusamt   + incentamt + trainamt + winteramt + sbonamt ;
* 급여 항목추가 *************************************************************** */

/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      정규직/임원분리 항목 CLEAR
============================================================================= */
     /* EXEC  SQL
     UPDATE  PKMRTMAS
        SET  BASICAMT = 0, INFOAMT   = 0, DUTYAMT    = 0, PROMAMT    = 0
      WHERE  CALYN='N' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set BASICAMT=0,INFOAMT=0,DUTYAMT=0,PRO\
MAMT=0 where CALYN='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )429;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


           /*AND   PAYCL BETWEEN '09' AND '99' ;  2002. 10. 29. 유효성 주석처리--> 임원,정규직 모두 연봉제이기때문에...*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode," clear Error");
          sprintf(log_buff, "clear Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }

     printf("\n 4. 상여금 갱신 중 ....");
     sprintf(log_buff, "\n 4. 상여금 갱신 중 ....");
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
        
  /*  상여금을 구한다
      정기상여,능률제고,체력단련,분기연봉,명절연봉 */
     memset(cmdline,'\0',sizeof(cmdline));

  /*sprintf(cmdline,"%s/bin/Kbin/pkq2072g %.6s %s %s", 
                  HOMEDIR,workyymmdd,GSempno,UserId);   dsa2000   2004.11.*/
     sprintf(cmdline,"%s/bin/Kbin/pkq2072g %.6s %s %s %s", 
                     HOMEDIR,workyymmdd,GSempno,log_progid,log_rundate);
     system(cmdline);

     /* debug ========================= *  printf("\n [%s][%s]",cmdline,UserId);        * debug ========================= */
                
     update_bonus();


/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      계산항목clear추가
============================================================================= */
     /* EXEC   SQL
     UPDATE  PKMRTMAS
     SET  PAYSUM = NVL(BASICAMT,0) + NVL(INFOAMT,0)   + NVL(DUTYAMT,0)  +
                   NVL(PROMAMT,0)  + NVL(FAMIAMT,0)   + NVL(LICEAMT,0)  +
                   NVL(MCARAMT,0)  + NVL(ODAMT,0)     + NVL(OVTMAMT,0)  +
                   NVL(SPTMAMT,0)  + NVL(BOKJISPAMT,0)+ NVL(AIDAMT1,0)  +
                   NVL(AIDAMT2,0)  + NVL(AIDAMT3,0)   + NVL(MBONAMT,0)  +
                   NVL(BONUSAMT,0) + NVL(INCENTAMT,0) + NVL(TRAINAMT,0) +
                   NVL(WINTERAMT,0)+ NVL(SBONAMT,0)   + NVL(TAXPAY,0)   +  /oWINTERAMT 영업인센티브로 사용 2006.04.o/
                   NVL(NOTAXPAY,0) + NVL(FIXPAY,0)    + NVL(QUATERPAY,0)+
                   NVL(HOLIPAY,0)  + NVL(ROLEAMT,0)   + NVL(ITAMT,0) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set PAYSUM=((((((((((((((((((((((((((N\
VL(BASICAMT,0)+NVL(INFOAMT,0))+NVL(DUTYAMT,0))+NVL(PROMAMT,0))+NVL(FAMIAMT,0)\
)+NVL(LICEAMT,0))+NVL(MCARAMT,0))+NVL(ODAMT,0))+NVL(OVTMAMT,0))+NVL(SPTMAMT,0\
))+NVL(BOKJISPAMT,0))+NVL(AIDAMT1,0))+NVL(AIDAMT2,0))+NVL(AIDAMT3,0))+NVL(MBO\
NAMT,0))+NVL(BONUSAMT,0))+NVL(INCENTAMT,0))+NVL(TRAINAMT,0))+NVL(WINTERAMT,0)\
)+NVL(SBONAMT,0))+NVL(TAXPAY,0))+NVL(NOTAXPAY,0))+NVL(FIXPAY,0))+NVL(QUATERPA\
Y,0))+NVL(HOLIPAY,0))+NVL(ROLEAMT,0))+NVL(ITAMT,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )444;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 /*DSA2000 2005.01 ITAMT 추가*/
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"7. 급여총액 setting Error");
          sprintf(log_buff, "7. 급여총액 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     printf("\n 5. 공제금  갱신 중 ....");
     sprintf(log_buff, "\n 5. 공제금  갱신 중 ....");
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
       /* **********************************************************************
       EXEC  SQL
       UPDATE  PKMRTMAS
       SET  emplamt = (paysum - famiamt - bokjispamt) * 0.003;
       if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
       {  err_print(sqlca.sqlcode,"8. 고용 보험료 setting Error");
         exit(1);
       } */
    
     /* ==================================================================================================== 
        건강보험료 계산 2012.07. Add 
        (급여이력의 총과세 + 퇴직월급여 과세) * 건강보험요율.
      ************************************************ */
      /* EXEC SQL /o 건강보험료 o/
      Update  Pkmrtmas A
         Set  Medamt1
           = (Select floor( ( (H.Taxpaysum + Paysum - (Odamt-odtaxamt) - (Mcaramt-mcartaxamt) - Notaxpay) / 12
                      * Medirate / 100) /10 ) * 10
                From Pkcmdbas B,
				            (Select C.Empno, Sum(C.Taxpaysum) Taxpaysum
             	         From Pkhphis C, Pkmrtmas D
                      Where C.Paydate Like Substr(D.Retdate,1,4)||'%'
                        And C.Empno = D.Empno
                      Group By C.Empno
             	      ) H
               Where A.Empno = H.Empno
              ); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 3;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update Pkmrtmas A  set Medamt1=(select (floor(((((((((\
H.Taxpaysum+Paysum)-(Odamt-odtaxamt))-(Mcaramt-mcartaxamt))-Notaxpay)/12)* Me\
dirate)/100)/10))* 10)  from Pkcmdbas B ,(select C.Empno ,sum(C.Taxpaysum) Ta\
xpaysum  from Pkhphis C ,Pkmrtmas D where (C.Paydate like (Substr(D.Retdate,1\
,4)||'%') and C.Empno=D.Empno) group by C.Empno) H where A.Empno=H.Empno)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )459;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            
      if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {  err_print(sqlca.sqlcode,"7. 건강 보험료1 setting Error");
        exit(1);
      }
      
      /* 2014.04.11.hjku. 오류로 수정...
         건강보험료 = 건강보험료 + 장기요양보험료 
      EXEC SQL 
      Update  Pkmrtmas A
         Set  Medamt1 
           =  Medamt1 +
             (Select floor( (A.Medamt1 * Longmtrate / 100) /10 ) * 10
                From Pkcmdbas B
              );*/
            
      /* EXEC SQL 
      Update  Pkmrtmas A
         Set  Medamt1 
           =  (Select Medamt1 +
                      floor( (A.Medamt1 * Longmtrate / 100) /10 ) * 10
                From Pkcmdbas B
              ); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 3;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update Pkmrtmas A  set Medamt1=(select (Medamt1+(floor\
((((A.Medamt1* Longmtrate)/100)/10))* 10))  from Pkcmdbas B )";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )474;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

            
      if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {  err_print(sqlca.sqlcode,"7. 건강 보험료2 setting Error");
        exit(1);
      }      
     /* ==================================================================================================== */
      
     /* ********************************************** *
        고용보험료 계산
      ************************************************ */
     set_emplamt();

     /* =====================================================================================
       변경전 : 중도퇴사면  0,말일퇴사면 공제
           *  국민연금 계산  ***************************************** *
       EXEC  SQL
       UPDATE  PKMRTMAS
       SET  ANUSELFAMT = 0
       WHERE  SUBSTR(RETDATE,7,2) <> :LastDay;
       if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
       {  err_print(sqlca.sqlcode,"9. 국민연금 setting Error");
         exit(1);
       }     
       변경후 : 급여마스터기준_중도건,말일이건 무조건 공제
     ======================================================================================== */

     /*  식권금액 계산  **************************************************** */
     /* EXEC  SQL
     UPDATE  PKMRTMAS p
        SET  TICKETAMT = (SELECT   NVL(TCKGIVEAMT,0)
                            FROM   PKMMCMAS R
                           WHERE  P.EMPNO = R.EMPNO)
     WHERE  EMPNO IN (SELECT EMPNO FROM PKMMCMAS)
       AND  CALYN = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set TICKETAMT=(select NVL(TCKGIVEAMT\
,0)  from PKMMCMAS R where P.EMPNO=R.EMPNO) where (EMPNO in (select EMPNO  fr\
om PKMMCMAS ) and CALYN='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )489;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"10. 식권금액 setting Error");
          sprintf(log_buff, "10. 식권금액 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     
     /* EXEC  SQL
     UPDATE  PKMRTMAS P
        SET  TICKETAMT = 0
      WHERE  TICKETAMT IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set TICKETAMT=0 where TICKETAMT is n\
ull ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )504;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



       /*  공제총액 계산  **************************************************** *
     급여지급후 퇴사시를 고려하여 정산여부가 Y인 경우도 */
     /* EXEC  SQL
     UPDATE  PKMRTMAS p
        SET  DEDTOT =   NVL(MEDAMT1,0) + NVL(EMPLAMT,0) + NVL(ANUSELFAMT,0) + NVL(TICKETAMT,0) + NVL(ETCAMT,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set DEDTOT=((((NVL(MEDAMT1,0)+NVL(EM\
PLAMT,0))+NVL(ANUSELFAMT,0))+NVL(TICKETAMT,0))+NVL(ETCAMT,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )519;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        /*        WHERE   CALYN = 'N';  */
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"11. 공제총액 setting Error");
          sprintf(log_buff, "11. 공제총액 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
   
          /*  실지급액 계산  **************************************************** *
        급여지급후 퇴사시를 고려하여 정산여부가 Y인 경우도 */
     /* EXEC  SQL
     UPDATE  PKMRTMAS p
        SET  REALPAY = NVL(PAYSUM,0) - NVL(DEDTOT,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS p  set REALPAY=(NVL(PAYSUM,0)-NVL(DEDTO\
T,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )534;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   /*        WHERE     CALYN = 'N'; */
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"12. 실지급액 setting Error");
          sprintf(log_buff, "12. 실지급액 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
   
          /*  이미 당월급여를 계산한 사람은 0으로  ****************************
     EXEC   SQL
     UPDATE  PKMRTMAS
     SET  PAYSUM     = 0, BASICAMT = 0, INFOAMT   = 0, DUTYAMT    = 0,
       PROMAMT    = 0, FAMIAMT  = 0, LICEAMT   = 0, MCARAMT    = 0,
       OVTMAMT    = 0, SPTMAMT  = 0, BOKJISPAMT= 0, AIDAMT1    = 0,
       AIDAMT2    = 0, AIDAMT3  = 0, MBONAMT   = 0, BONUSAMT   = 0,
       INCENTAMT  = 0, TRAINAMT = 0, WINTERAMT = 0, SBONAMT    = 0,
       DEDTOT     = 0, MEDAMT1  = 0, EMPLAMT   = 0, ANUSELFAMT = 0,
       TICKETAMT  = 0, REALPAY  = 0, ODAMT     = 0, ODTAXAMT   = 0,
       MCARTAXAMT = 0
     WHERE   CALYN='Y' ;
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  err_print(sqlca.sqlcode," clear Error");
       exit(1);
     }
           ******************************* CLOSE PART : 상여일할을 0으로 SET */
}

SetCalendar(workdate)
char *workdate;
{
     int i;
     
     for (i=0 ; i< 33 ; ++i)
          day[i] = WEEKDAY;
     
     memset(tempdate,'\0',sizeof(tempdate));
     memset(DayOfWeek,'\0',sizeof(DayOfWeek));
     memset(LastDay,'\0',sizeof(LastDay));
     memset(ovtmyymm,'\0',sizeof(ovtmyymm));
     sprintf(tempdate,"%.6s%02d",workdate,1);
     
     /* EXEC  SQL
     SELECT  to_char(add_months(to_date(:tempdate,'YYYYMMDD'),-1),'YYYYMM')
       INTO  :ovtmyymm
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(add_months(to_date(:b0,'YYYYMMDD'),(-1))\
,'YYYYMM') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )549;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tempdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ovtmyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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


     
     /* EXEC   SQL
     SELECT  to_char(last_day(to_date(:tempdate,'YYYYMMDD')),'DD')
       INTO  :LastDay
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(last_day(to_date(:b0,'YYYYMMDD')),'DD') \
into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )572;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tempdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)LastDay;
     sqlstm.sqhstl[1] = (unsigned long )3;
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


     
     for ( i = 1 ; i <= atoi(LastDay) ; ++i)
     {
           sprintf(tempdate,"%.6s%02d",workdate,i);
           /* EXEC   SQL
           SELECT   to_char(to_date(:tempdate,'YYYYMMDD'),'DY')
             INTO   :DayOfWeek
             FROM   DUAL; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 3;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "select to_char(to_date(:b0,'YYYYMMDD'),'DY') into\
 :b1  from DUAL ";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )595;
           sqlstm.selerr = (unsigned short)0;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)tempdate;
           sqlstm.sqhstl[0] = (unsigned long )9;
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)DayOfWeek;
           sqlstm.sqhstl[1] = (unsigned long )4;
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


           if  (strcmp(DayOfWeek,"SUN")==0)
                day[i] = WEEKEND;
           
           /* EXEC   SQL
           SELECT  HOLIDATE
             INTO  :HoliDate
             FROM  PKCHOLI
            WHERE  HOLIDATE = :tempdate; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 3;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.stmt = "select HOLIDATE into :b0  from PKCHOLI where HOLI\
DATE=:b1";
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )618;
           sqlstm.selerr = (unsigned short)0;
           sqlstm.cud = sqlcud0;
           sqlstm.sqlest = (unsigned char  *)&sqlca;
           sqlstm.sqlety = (unsigned short)4352;
           sqlstm.occurs = (unsigned int  )0;
           sqlstm.sqhstv[0] = (unsigned char  *)HoliDate;
           sqlstm.sqhstl[0] = (unsigned long )9;
           sqlstm.sqhsts[0] = (         int  )0;
           sqlstm.sqindv[0] = (         short *)0;
           sqlstm.sqinds[0] = (         int  )0;
           sqlstm.sqharm[0] = (unsigned long )0;
           sqlstm.sqadto[0] = (unsigned short )0;
           sqlstm.sqtdso[0] = (unsigned short )0;
           sqlstm.sqhstv[1] = (unsigned char  *)tempdate;
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


           
           if  (sqlca.sqlcode == 0)
                day[i] = WEEKEND;
     
     }

}

/*  퇴직일까지 식교비 일수 계산  ***************************** */
CalMcarday(workdate)
char *workdate;
{
     char  tempday[3];
     int  carday;
     int  i;
     
     memset(tempday,'\0',sizeof(tempday));
     sprintf(tempday,"%.2s",workdate+6);
     
     carday = atoi(tempday);
     
     for (i = 1; i <= atoi(tempday); ++i)
     {
          if  (day[i] == WEEKEND)
               carday --;
     }
     
     return carday;
}


/* ===============================================================================
    변경사유 : 고용보험료 산정 관련 프로그램 변경/추가 요청
    변경일자 : 1998.07.10
    변경자   : 김승회

    [변경내용] ===>
  1. 기존방식은 프로그램내에서 고용보험료 산정에 계산되는 항목들을 관리.
  2. 고용보험 계산항목테이블(PKCEMTBL)에 등록된 기준에 따라 고용보험를
     계산.

  * 참고사항 1998.08.24
    퇴직금필드가 넘치는 관계로 모든 항목을 급여항목과 똑같이 추가할수가 없었음
    차후 항목추가가 필요할 경우
    필요없는 항목을 없애고 다시 생성해야함
    주석 안의 항목은 이름이 바뀌었거나 없는항목을 표기

1999.04.07 이미 지급된 고용보험료는 환수 할수 없으므로 급여지급이 안된사람만 계산한다. 정세영 생각
 ================================================================================ */
/* ================================================================================
   Version    date(yy.mm.dd)     programmer    description        relevant doc.no
   30.00      1999.02.24         유미나        Y2K(주민번호관련)  하나로인사재개발
================================================================================= */
set_emplamt()
{
     /* EXEC SQL
     UPDATE PKMRTMAS B
        SET EMPLAMT 
        /o 2014.05.22 하은영 고용보험 계산시 비과세급여 총액은 차감해서 계산되도록 수정  
         = (SELECT  FLOOR(PAYSUM * EMPLDRATE  /10  ) * 10   o/ 
         = (SELECT  FLOOR((PAYSUM - (Odamt-odtaxamt) - (Mcaramt-mcartaxamt) - Notaxpay) * EMPLDRATE  /10  ) * 10  
              FROM  PKMRTMAS A, PKCEMTBL, PKCPBAS
             WHERE  concat(decode( substr(juminid,8,1),'1', '19','2','19','3','20','4','20'),SUBSTR(JUMINID,1,4)) > EXFRYYMM
               AND  A.EMPNO = B.EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS B  set EMPLAMT=(select (FLOOR((((((PAYS\
UM-(Odamt-odtaxamt))-(Mcaramt-mcartaxamt))-Notaxpay)* EMPLDRATE)/10))* 10)  f\
rom PKMRTMAS A ,PKCEMTBL ,PKCPBAS where (concat(decode(substr(juminid,8,1),'1\
','19','2','19','3','20','4','20'),SUBSTR(JUMINID,1,4))>EXFRYYMM and A.EMPNO=\
B.EMPNO))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )641;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
   /*  WHERE  CALYN ='N';  퇴직월급여계산대상자가 아니더라도
   *       명절,분기연봉은 환수 또는 지급하므로 모두 계산하도록 한다.*/
   
     /* EXEC SQL
     UPDATE PKMRTMAS
        SET emplamt = NVL(emplamt,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set emplamt=NVL(emplamt,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )656;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"8. 고용 보험료 setting Error");
          sprintf(log_buff, "8. 고용 보험료 setting Error");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          exit(1);
     }
}

/************************************************************************
 function :  update_bonus
 임시테이블에서 계산한 자료를 퇴직정산 마스터의 상여금 항목에
 입력합니다.
 *************************************************************************/
/* =========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      상여금계산로직변경(추징,환급) 일할
============================================================================= */
void  update_bonus()
{
     /* 분기연봉 : 7 */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  QUATERPAY =  ( SELECT REALAMT
                              FROM   PKMGBMAS_RT B
                             WHERE  A.EMPNO = B.EMPNO
                               AND    BONKIND ='7' )
      WHERE  EMPNO IN ( SELECT  EMPNO FROM PKMGBMAS_RT
                         WHERE  BONKIND ='7'
                           AND  REALAMT <> 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set QUATERPAY=(select REALAMT  from \
PKMGBMAS_RT B where (A.EMPNO=B.EMPNO and BONKIND='7')) where EMPNO in (select\
 EMPNO  from PKMGBMAS_RT where (BONKIND='7' and REALAMT<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )671;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


  
    if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403) 
    {
         err_print(sqlca.sqlcode," 분기 연봉 설정");
         /*sprintf(log_buff, " 분기 연봉 설정");
               Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
         exit(1);
    }
  
           /* 명절연봉 : 8 */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  HOLIPAY =  ( SELECT  REALAMT
                            FROM  PKMGBMAS_RT B
                           WHERE  A.EMPNO = B.EMPNO
                             AND  BONKIND ='8' )
     WHERE  EMPNO IN ( SELECT  EMPNO FROM PKMGBMAS_RT
                        WHERE  BONKIND ='8'
                          AND  REALAMT <> 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set HOLIPAY=(select REALAMT  from PK\
MGBMAS_RT B where (A.EMPNO=B.EMPNO and BONKIND='8')) where EMPNO in (select E\
MPNO  from PKMGBMAS_RT where (BONKIND='8' and REALAMT<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )686;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


  
    if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403) 
    {
         err_print(sqlca.sqlcode," 명절 연봉 설정");
         /*sprintf(log_buff, " 명절 연봉 설정");
               Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
         exit(1);
    }
  
     /* 정기상여 : 1 */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  BONUSAMT = ( SELECT  REALAMT
                           FROM  PKMGBMAS_RT B
                          WHERE  A.EMPNO = B.EMPNO
                            AND  BONKIND ='1' )
     WHERE  EMPNO IN ( SELECT  EMPNO FROM PKMGBMAS_RT
                        WHERE  BONKIND ='1'
                          AND  REALAMT <> 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set BONUSAMT=(select REALAMT  from P\
KMGBMAS_RT B where (A.EMPNO=B.EMPNO and BONKIND='1')) where EMPNO in (select \
EMPNO  from PKMGBMAS_RT where (BONKIND='1' and REALAMT<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )701;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


  
    if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
    {
         err_print(sqlca.sqlcode," 정기 상여 설정");
         /*sprintf(log_buff, " 정기 상여 설정");
               Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
         exit(1);
    }
  
     /* 능률상여 : 2 ***************
        leerk  1999.03.19  해당자 없슴
     EXEC SQL
     UPDATE PKMRTMAS A
     SET    INCENTAMT = ( SELECT REALAMT
             FROM   R_PKMGBMAS B
             WHERE  A.EMPNO = B.EMPNO
             AND    BONKIND ='2' )
     WHERE  EMPNO IN ( SELECT EMPNO FROM PKMGBMAS_RT
           WHERE  BONKIND ='2'
           AND    REALAMT <> 0);
    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403) {
      err_print(sqlca.sqlcode," 능률 상여 설정");
      exit(1);
    }
  
       ************************************ */
  
     /* 체단상여 : 3 */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  TRAINAMT = ( SELECT  REALAMT
                            FROM  PKMGBMAS_RT B
                           WHERE  A.EMPNO = B.EMPNO
                             AND  BONKIND ='3' )
      WHERE  EMPNO IN ( SELECT  EMPNO FROM PKMGBMAS_RT
                        WHERE  BONKIND ='3'
                          AND  REALAMT <> 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set TRAINAMT=(select REALAMT  from P\
KMGBMAS_RT B where (A.EMPNO=B.EMPNO and BONKIND='3')) where EMPNO in (select \
EMPNO  from PKMGBMAS_RT where (BONKIND='3' and REALAMT<>0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )716;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


  
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403) 
     {
          err_print(sqlca.sqlcode," 체단 상여 설정");
          /*sprintf(log_buff, " 체단 상여 설정");
                Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
          exit(1);
     }
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )731;
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
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )772;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
