
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
    "pkq2073g.pc"
};


static unsigned int sqlctx = 154083;


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

 static char *sq0002 = 
"select EMPNO ,RETDATE ,RETDATE  from PKMRTMAS where PAYCL>='C11' order by E\
MPNO            ";

 static char *sq0016 = 
"select EMPNO ,substr(ORGEMPDATE,1,4)  from PKMRTMAS where PAYCL>='C11' orde\
r by EMPNO            ";

 static char *sq0026 = 
"select HOLIDATE  from PKCHOLI where ((HOLIDATE>=:b0 and HOLIDATE<=:b1) and \
HOLIKIND<>'0') order by HOLIDATE            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,129,0,5,154,0,0,0,0,0,1,0,
20,0,0,2,91,0,9,290,0,0,0,0,0,1,0,
35,0,0,2,0,0,13,295,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
62,0,0,2,0,0,15,300,0,0,0,0,0,1,0,
77,0,0,3,263,0,4,352,0,0,3,1,0,1,0,2,97,0,0,2,97,0,0,1,97,0,0,
104,0,0,4,168,0,4,377,0,0,5,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,2,97,0,
0,
139,0,0,2,0,0,15,390,0,0,0,0,0,1,0,
154,0,0,5,78,0,4,401,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
181,0,0,2,0,0,15,428,0,0,0,0,0,1,0,
196,0,0,6,144,0,4,433,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
219,0,0,7,58,0,4,441,0,0,3,2,0,1,0,1,4,0,0,1,4,0,0,2,4,0,0,
246,0,0,8,281,0,5,452,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
277,0,0,9,73,0,5,479,0,0,0,0,0,1,0,
292,0,0,10,84,0,5,495,0,0,0,0,0,1,0,
307,0,0,11,88,0,5,507,0,0,0,0,0,1,0,
322,0,0,12,274,0,5,524,0,0,0,0,0,1,0,
337,0,0,13,52,0,5,542,0,0,0,0,0,1,0,
352,0,0,14,144,0,5,555,0,0,0,0,0,1,0,
367,0,0,15,52,0,5,570,0,0,0,0,0,1,0,
382,0,0,16,97,0,9,591,0,0,0,0,0,1,0,
397,0,0,16,0,0,13,595,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
420,0,0,16,0,0,15,600,0,0,0,0,0,1,0,
435,0,0,17,68,0,5,609,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
458,0,0,18,262,0,5,638,0,0,0,0,0,1,0,
473,0,0,19,94,0,5,656,0,0,0,0,0,1,0,
488,0,0,20,67,0,5,669,0,0,0,0,0,1,0,
503,0,0,21,140,0,5,689,0,0,0,0,0,1,0,
518,0,0,22,112,0,5,705,0,0,0,0,0,1,0,
533,0,0,23,271,0,5,721,0,0,0,0,0,1,0,
548,0,0,24,99,0,4,751,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
575,0,0,25,81,0,4,786,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,
602,0,0,26,119,0,9,849,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
625,0,0,26,0,0,15,855,0,0,0,0,0,1,0,
640,0,0,26,0,0,13,862,0,0,1,0,0,1,0,2,97,0,0,
659,0,0,26,0,0,15,866,0,0,0,0,0,1,0,
674,0,0,26,0,0,15,874,0,0,0,0,0,1,0,
689,0,0,27,66,0,4,897,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
712,0,0,28,117,0,4,961,0,0,3,2,0,1,0,1,97,0,0,1,3,0,0,2,97,0,0,
739,0,0,29,78,0,4,981,0,0,2,1,0,1,0,2,3,0,0,1,97,0,0,
762,0,0,30,50,0,3,1001,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
803,0,0,31,0,0,29,1011,0,0,0,0,0,2,6,76,79,71,95,68,66,
824,0,0,32,187,0,4,1044,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
855,0,0,33,55,0,4,1062,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
878,0,0,34,500,0,4,1077,0,0,5,4,0,1,0,1,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
913,0,0,35,283,0,4,1095,0,0,5,4,0,1,0,1,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
948,0,0,36,200,0,4,1110,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
971,0,0,37,0,0,17,1121,0,0,1,1,0,1,0,1,97,0,0,
990,0,0,37,0,0,45,1130,0,0,0,0,0,1,0,
1005,0,0,37,0,0,13,1138,0,0,1,0,0,1,0,2,4,0,0,
1024,0,0,37,0,0,15,1152,0,0,0,0,0,1,0,
1039,0,0,38,184,0,4,1182,0,0,5,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,2,
97,0,0,
1074,0,0,39,188,0,4,1189,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
};


/* ======================= PROGRAM HEADER ======================================
 PROGRAM-NAME   : PKQ2073G(퇴직자 연차 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 PROGRAMMER     : 이랑교
 VERSION        : 30.00
 DATE           : 1999.03.04

[USING LIB] 2016.12 avgpay_rt.pc 삭제 및 pkq2073g.pc내 포함
MIS2 : /hper/insa/HINSA/common/lib/src/hperlib/avgpay_rt.pc
*get_rtpaysum(empno, n_retdate, &paysum):3개월급여합
*get_ybonamt(empno,n_retdate,&ybonamt):12개월연차수당

[USING LIB]
MIS2 : /hper/insa/HINSA/common/lib/src/hperlib/avgpay.pc
[FUNCTION]
get_avgpay(empno, n_retdate, &paysum):평균임금

UPDATE CONTENTS
   VERSION    DATE(YY.MM.DD)     PROGRAMMER      DESCRIPTION     RELEVANT DOC.NO
   1.00       1997.02.16         이인환          최초개발본      설계명세서
   10.01      1998.08.28         이랑교          델파이를 Pro*C
   30.00      1999.03.04         이랑교          신인사제도 반영
          평균임금,통상임금 ,직급변동
   30.01      2004.02.24         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.    
   31.00      2004.06.18       강륜종(dsa2000) 직급코드값 변동에 따른 수정.  
                                            코드 10이 사외이사에서 부장으로 변경.   사외이사는 0Z로 코드 변경.   
   32.10      2004.11.         강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.                                            
   33.00      2005.01.12       DSA2000         월차폐지 및 정보통신수당(ITAMT) 추가에 다른 수정.
============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
/*#include <sqlca.h>
#include <sqlda.h>
#include <sqlcpr.h>  dsa2000  2005.01.12.*/
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS -1*/
#define  FAIL    -2

int      get_term(char *frdate, char *todate);
int      get_sundaycnt(char *frdate, char *todate);
int      get_dupholiday(char *frdate,char *todate);
void     set_to_empdate(char *to_empdate);
void     add_days(char* indate,int m, char* rdate);
void     get_dayname(char *indate,char *result);

/* 2016.12. 강륜종 /common/lib/src/hperlib/avgpay_rt.pc에 있던 Function을 옮김 : avgpay_rt.pc를 hperlib에서 삭제*/
double  get_rtpaysum(char *empno, char *retdate,double *paysum);
double  get_ybonamt(char *empno, char *retdate,double *ybonamt);
/*============================================================*/

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


     int     db;
     int     id;
     char     workyy[4+1];
     char     UserId[20];
     
     char yempno[4+1]   ="";
     char yempyy[4+1]   ="";

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     char    log_rundate[16]     = ""; 
     char    log_progid[16]      = "";
     char    log_writeman[5]     = "";
     char    log_buff[100]       = "";
     int     seqno = 0; 

void main(argc,argv)
int argc;
char *argv[];
{
     char FL_file[255];

     if (argc != 4) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkq2073g D006 pkq2073g 2004110100000 */
          printf("[Usage] : pkq2073g  1.작업자 2.프로그램ID 3.시작시간 \n");     
          exit(1);
     }     
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2073g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }        
     sprintf(workyy,"%s",argv[1]);

     /* Dsa2000  2004.02.24.     **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"퇴직자 연차 계산 시작...");                
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[2]);
     strcpy(log_rundate,  argv[3]);     
   
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     Calc_Year();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/     
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else     
     {
          sprintf(log_buff, "OK ====== [퇴직자 연차 계산 작업성공] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [퇴직자 연차 계산 작업성공] =====\n");     
     }
           
}

Calc_Year()
{
     char   t_empdate[8+1]="";
     char   empno[4+1]   ="";
     char   empdate[8+1] ="";            
     char   retyymm[6+1] ="";
     char   retdate[8+1] ="";
     char   n_retdate[8+1] ="";
     char   t_workyy[4+1] = "";   /* 과도기 구간(2017~2018년) 연차수당 기준년도*/        
     
     double avggross   = 0 ;
     double termdd     = 0 ;
     double paymm   = 0;     
     double cpaymm  = 0;
     double paysum  = 0;
     double ybonamt = 0;
     double pay3sum = 0;
     double bon12sum = 0;
        
     /* 초기화 */
     /* EXEC SQL
     UPDATE      PKMRTMAS 
        SET      YEARDAY=0, ADDDAY =0, USEYEAR=0,CALMON =0, YEDEPOSIT=0, 
                 YENAMT=0,  MONDAY=0, MONDEPOSIT=0, MONGIGUB=0, MONAMT=0, ITAMT=0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set YEARDAY=0,ADDDAY=0,USEYEAR=0,CALMO\
N=0,YEDEPOSIT=0,YENAMT=0,MONDAY=0,MONDEPOSIT=0,MONGIGUB=0,MONAMT=0,ITAMT=0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   /*ITAMT 추가  2005.01.12.*/

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"1. 초기값 세팅에서 오류...");
          sprintf(log_buff, "1. 초기값 세팅에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 


     /* 퇴직 전월 연월차 안쓴사람 
   전월근태가 등록되지 않았으면 만근처리 
*     EXEC SQL
*     UPDATE      PKMRTMAS P 
*     SET      MONDAY = 1 
*     WHERE      EMPNO IN (     SELECT      EMPNO  
*                       FROM       PKHDUTY R 
*                  WHERE      P.EMPNO=R.EMPNO 
*                  AND        TO_CHAR(ADD_MONTHS(TO_DATE(P.RETDATE,
           'YYYYMMDD'),-1),'YYYYMM')=R.DUYYMM
*                  AND      YMDEDCNT=0);
     ******************************************************* */
     
     /* dsa2000 2005.01. 월차폐지에 따른 삭제.
     EXEC SQL
     UPDATE      PKMRTMAS P 
     SET      MONDAY = 1 
     WHERE      EMPNO IN (SELECT NVL(R.EMPNO ,P.EMPNO)
                         FROM  PKHDUTY R ,PKMRTMAS P 
                  WHERE P.EMPNO = R.EMPNO(+) 
                    AND TO_CHAR(ADD_MONTHS(TO_DATE(P.RETDATE,'YYYYMMDD'), -1),'YYYYMM') =
                 NVL(R.DUYYMM(+),TO_CHAR(ADD_MONTHS(TO_DATE(P.RETDATE,'YYYYMMDD'),-1),'YYYYMM') ) 
             AND NVL(YMDEDCNT(+),0)=0)
     AND     PAYCL > '09';
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"2. MONDAY UPDATE에서 오류...");
   sprintf(log_buff, "2. MONDAY UPDATE에서 오류...");
               error_quit("작업실패...");
     } */
     

     /* 급여지급 월차 적치일  : dsa2000 2005.01. 월차폐지에 따른 삭제.
     EXEC SQL
     UPDATE      PKMRTMAS P 
     SET      MONDEPOSIT = (SELECT MONDPSDD-MONGIVEDD +
      DECODE(SUBSTR(RETDATE,5,2),'01',0,'02',0,1 )
                            FROM PKHMOHIS R 
                            WHERE P.EMPNO=R.EMPNO 
        AND SUBSTR(P.RETDATE,1,6)=R.WORKYYMM) 
     WHERE CALYN='Y' AND EMPNO IN (SELECT EMPNO 
                                FROM PKHMOHIS T
                                WHERE  SUBSTR(P.RETDATE,1,6)= T.WORKYYMM);
                                
         if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"3. MONDEPOSIT UPDATE에서 오류1...");
   sprintf(log_buff, "3. MONDEPOSIT UPDATE에서 오류1...");
                error_quit("작업실패...");
     } */
     

     /* 퇴직당월월차 적치일 : dsa2000 2005.01. 월차폐지에 따른 삭제.
     EXEC SQL
     UPDATE PKMRTMAS P 
     SET MONDEPOSIT = (SELECT MONDPSDD 
                       FROM T_PKMRTMO R 
                         WHERE P.EMPNO=R.EMPNO 
            AND TO_CHAR(ADD_MONTHS(TO_DATE(P.RETDATE,'YYYYMMDD'),
         -1),
      'YYYYMM')=R.WORKYYMM
        )
     WHERE CALYN='N';
        if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"4. MONDEPOSIT UPDATE에서 오류2...");
   sprintf(log_buff, "4. MONDEPOSIT UPDATE에서 오류2...");
                error_quit("작업실패...");
     }      
        
     EXEC SQL
     UPDATE      PKMRTMAS 
     SET      MONDEPOSIT = NVL(MONDEPOSIT,0);  */

     /* 지급월차 적치일 : dsa2000 2005.01. 월차폐지에 따른 삭제.     
     EXEC SQL     
     UPDATE      PKMRTMAS P 
     SET      CALMON = MONDAY + MONDEPOSIT;
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"5. CALMON UPDATE에서 오류...");
   sprintf(log_buff, "5. CALMON UPDATE에서 오류...");
                error_quit("작업실패...");
     } */

     /* 지급월차 적치일 : dsa2000 2005.01. 월차폐지에 따른 삭제.     
     EXEC SQL   
     UPDATE      PKMRTMAS 
     SET      MONGIGUB = CALMON 
     WHERE      CALMON>=0;

     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"6. MONGIGUB UPDATE에서 오류...");
   sprintf(log_buff, "6. MONGIGUB UPDATE에서 오류...");
                error_quit("작업실패...");
     } 
     
     EXEC SQL
     UPDATE PKMRTMAS 
     SET    CALMON=0 
     WHERE  CALMON>0;     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
   print_errmsg(sqlca.sqlcode,"7. CALMON UPDATE에서 오류...");
   sprintf(log_buff, "7. CALMON UPDATE에서 오류...");
                error_quit("작업실패...");
     } */
     /* 평균임금 function call */

     avggross  = 0;
     termdd   = 0;

     /* 임원제외 */
     /* EXEC SQL DECLARE c1 CURSOR FOR 
     SELECT      EMPNO,RETDATE, RETDATE
       FROM     PKMRTMAS      
      WHERE   PAYCL >='C11' /oinfra     WHERE   PAYCL >'09'o/
      ORDER BY EMPNO; */ 


     /* EXEC SQL OPEN  c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0002;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     while(1)
     {

          /* EXEC SQL FETCH c1
                INTO  :empno, :retyymm, :retdate ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )35;
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
          sqlstm.sqhstv[1] = (unsigned char  *)retyymm;
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)retdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
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
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 3;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )62;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                /* return(SUCCESS);  */
               break;
          }

         /* ===========================================================================
         *  30.00      1999.03.04         이랑교          신인사제도 반영
         *          평균임금,통상임금 ,직급변동
         *  ===========================================================================
         * lib avgpay_rt.pc
         *
         *     SELECT     SUM( NVL(FIXPAY,0) +NVL(ROLEAMT,0)+NVL(LICEAMT,0)+
         *        NVL(OVTMAMT,0)+NVL(MATEAMT ,0)+NVL(PARTAMT,0)+
         *                     NVL(CHILDAMT,0)+NVL(SPTMAMT,0)+NVL(MBONAMT,0)+
         *                     NVL(SOPAY,0)+NVL(MCARAMT,0)+NVL(ODAMT,0))
         *     INTO     :sum
         *     FROM     PKHPHIS
         *     WHERE     EMPNO = :empno
         *     AND      PAYDATE >= TO_CHAR(ADD_MONTHS(TO_DATE(:retyymm,'YYYYMM'),-2),
         *      'YYYYMM')
         *     AND     PAYDATE <= :retyymm;
         *
         *
         *   get_pay3sum(empno,retdate,&pay3sum,&termdd);
         *   get_bon12sum(empno,retdate,&bon12sum);
         *
         *   EXEC SQL
         *   UPDATE      PKMRTMAS A
         *   SET      ( PAY3SUM, BON12SUM ,AVGPAY ,AVGBON ,COMMONAMT ) =
         *         ( SELECT      :pay3sum, :bon12sum, ROUND(:pay3sum  / :termdd * 30 , 0), 
         *           round(:bon12sum / 12,0),
         *           NVL(BASICAMT)+NVL(INFOCAMT)+NVL(DUTYAMT)   
         *              FROM   PKMPMAS B
         *              WHERE     A.EMPNO = B.EMPNO
         *         );
         *============================================================================= */
         
         /* ============================================================= ******
             말일 퇴사면 당월 포함한 평균임금을 사용하고
               그렇지 않으면 전월부터 포함한 평균임금을 사용합니다.
         
            EXEC SQL
            SELECT  DECODE(TO_DATE(RETDATE,'YYYYMMDD'),
                 LAST_DAY(TO_DATE(RETDATE,'YYYYMMDD')),
               SUBSTR(RETDATE,1,6),
                 TO_CHAR(ADD_MONTHS(TO_DATE(RETDATE,'YYYYMMDD'),-1),
                  'YYYYMM')
               )||'01'
            INTO    :retdate
            FROM     PKMRTMAS
            WHERE     EMPNO =:empno;
          ================================================================== */
          /* EXEC SQL
          SELECT  B.EMPDATE,
                  DECODE(TO_DATE(A.RETDATE,'YYYYMMDD'),
                      LAST_DAY(TO_DATE(A.RETDATE,'YYYYMMDD')),
                      SUBSTR(A.RETDATE,1,6),TO_CHAR(ADD_MONTHS(TO_DATE(A.RETDATE,'YYYYMMDD'),-1),'YYYYMM')
                     )
            INTO  :empdate,:retyymm
            FROM  PIMPMAS B, PKMRTMAS A
           WHERE  A.EMPNO =:empno
             AND  A.EMPNO = B.EMPNO; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select B.EMPDATE ,DECODE(TO_DATE(A.RETDATE,'YYYYMM\
DD'),LAST_DAY(TO_DATE(A.RETDATE,'YYYYMMDD')),SUBSTR(A.RETDATE,1,6),TO_CHAR(AD\
D_MONTHS(TO_DATE(A.RETDATE,'YYYYMMDD'),(-1)),'YYYYMM')) into :b0,:b1  from PI\
MPMAS B ,PKMRTMAS A where (A.EMPNO=:b2 and A.EMPNO=B.EMPNO)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )77;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)empdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)retyymm;
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


          /* ================================
          get_paysum( empno,retdate,&pay3sum);
          get_ybonamt(empno,retdate,&bon12sum);
          
          get_rtpaysum( empno,retdate,&pay3sum);
          get_ybonamt(empno,retdate,&bon12sum);
          월차수당계산과 동일한 로직 반영   
          * ================================*/
          
          /*====================================
          2000-10-27 퇴직 전전월 월차수당계산과 동일한 로직 반영-->인사팀요청         
          get_avgpay(empno,retyymm,empdate,&avggross);
          =====================================*/
/*===============추가시작=====================================*/
                        
          /* EXEC SQL
          SELECT  DECODE(TO_CHAR(LAST_DAY(TO_DATE(:retdate,'YYYYMMDD')),'YYYYMMDD'),
                        :retdate,:retdate,
                        TO_CHAR(ADD_MONTHS(LAST_DAY(TO_DATE(:retdate,'YYYYMMDD')),-1),'YYYYMMDD')
                        )
            INTO  :n_retdate
            FROM  DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select DECODE(TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMM\
DD')),'YYYYMMDD'),:b0,:b0,TO_CHAR(ADD_MONTHS(LAST_DAY(TO_DATE(:b0,'YYYYMMDD')\
),(-1)),'YYYYMMDD')) into :b4  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )104;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)retdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
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
          sqlstm.sqhstv[2] = (unsigned char  *)retdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)retdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)n_retdate;
          sqlstm.sqhstl[4] = (unsigned long )9;
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


          
          get_rtpaysum( empno, n_retdate, &paysum);     
          pay3sum = paysum ;
          
          if  (pay3sum == FAIL)
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )139;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
                  
          /*get_ybonamt( empno,n_retdate, &ybonamt); */
          /*2016.12.임단협 결정으로 연차수당 후지급으로 변경에 따른 과도기 구간(2017~2018년) 추가 printf("%s\n",retdate);*/
          if ((strcmp(retdate,"20170101") >= 0) && (strcmp(retdate,"20181231") <= 0)) 
          {
               ybonamt = 0;
               sprintf(t_workyy,"%.4s",retdate);    /*printf("Pkbonsim 기준년도 :%s\n",t_workyy);*/

               /* EXEC SQL
               Select Nvl(Ybonamt,0)
                 into :ybonamt
                 From Pkbonsim
                Where Empno  = :empno
                  And Workyy = :t_workyy; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select Nvl(Ybonamt,0) into :b0  from Pkbonsim\
 where (Empno=:b1 and Workyy=:b2)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )154;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&ybonamt;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
               sqlstm.sqhstv[2] = (unsigned char  *)t_workyy;
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



          	   /*printf("신규 : %s %s %f\n",empno,retdate, ybonamt)   ;       	   */
                  
               if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
               {
                   printf(" Module Name : 임단협 연차수당 \n");
                   printf(" SQL STATEMENT : SELECT [%d]\n",sqlca.sqlcode);
                   return(FAIL);
               };
          }    /*2016.12.*/
          else 
          {    /* 정상루틴 */
          	   get_ybonamt( empno, n_retdate, &ybonamt);
          	  
          	   /*printf("기존 : %s %s %f\n",empno,retdate, ybonamt)   ;       	    */
          }
          
          bon12sum = ybonamt;  /*printf("%s %f\n",empno,bon12sum);*/
          
          if  (bon12sum == FAIL)
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
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


               return(FAIL);
          }           
          
            
          /* EXEC  SQL
          SELECT     LEAST(FLOOR(MONTHS_BETWEEN(TO_DATE(RETDATE,'YYYYMMDD')+1, 
                                             TO_DATE(A.EMPDATE,'YYYYMMDD'))),3)     
          INTO    :cpaymm
          FROM    PKMRTMAS A
          WHERE     A.EMPNO =:empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select LEAST(FLOOR(MONTHS_BETWEEN((TO_DATE(RETDATE\
,'YYYYMMDD')+1),TO_DATE(A.EMPDATE,'YYYYMMDD'))),3) into :b0  from PKMRTMAS A \
where A.EMPNO=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )196;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&cpaymm;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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


          
          
          /* EXEC SQL
          SELECT  CEIL(:pay3sum/3)+CEIL(:bon12sum /12)
          INTO    :avggross
          FROM    DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select (CEIL((:b0/3))+CEIL((:b1/12))) into :b2  fr\
om DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )219;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&pay3sum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&bon12sum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&avggross;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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

     
 /*=================추가끝=====================================*/   
   
/*debug ******************************** *
     printf("\n[%s] [%s],%13f.0",empno,retdate,avggross);
     printf("\n********* :bonmm %4f retdate %s [%d]",paymm,retdate,sqlca.sqlcode);     
*/

          /* EXEC SQL
          UPDATE  PKMRTMAS A
             SET  ( pay3sum, bon12sum, AVGGROSSYM ,COMMONAMT ) =
                       ( SELECT  :pay3sum, :bon12sum, :avggross,
/o                                 NVL(TOTPAY/18,0)          통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
                                 CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.10 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
                           FROM  PKMPMAS B, PKHYPHIS C
                          WHERE  A.EMPNO = B.EMPNO
                            AND  B.EMPNO = C.EMPNO
                            AND  A.EMPNO = C.EMPNO
                            AND  B.YEARPAYNUM = C.YEARPAYNUM
                       )
           WHERE  A.EMPNO =:empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS A  set (pay3sum,bon12sum,AVGGROSSY\
M,COMMONAMT)=(select :b0 ,:b1 ,:b2 ,CEIL(((((TOTPAY+TONGAMT1)+TONGAMT2)+TONGA\
MT3)/12))  from PKMPMAS B ,PKHYPHIS C where (((A.EMPNO=B.EMPNO and B.EMPNO=C.\
EMPNO) and A.EMPNO=C.EMPNO) and B.YEARPAYNUM=C.YEARPAYNUM)) where A.EMPNO=:b3";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )246;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&pay3sum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&bon12sum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&avggross;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)empno;
          sqlstm.sqhstl[3] = (unsigned long )5;
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


          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
          {
               print_errmsg(sqlca.sqlcode," AVGGROSSYM UPDATE에서 오류...");
               sprintf(log_buff, " AVGGROSSYM UPDATE에서 오류...");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          } 
      /* ============================================================ END OF Ver 30.00*/     
     termdd    = 0;
     avggross  = 0;
     }
     
     /* 월차수당 계산 */
     /* EXEC SQL     
     /o2016.12.20 eyha 통상임금 적용 변경  184 -> 209
     UPDATE PKMRTMAS 
     SET    MONAMT=CEIL(NVL(MONGIGUB,0) * GREATEST(AVGGROSSYM,COMMONAMT)*8/184) ;  o/
     UPDATE PKMRTMAS 
     SET    MONAMT=CEIL(NVL(MONGIGUB,0) * COMMONAMT*8/209) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set MONAMT=CEIL((((NVL(MONGIGUB,0)* CO\
MMONAMT)* 8)/209))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )277;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"MONAMT UPDATE에서 오류...");
          sprintf(log_buff, "MONAMT UPDATE에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 
       
       /*정보통신수당 신규추가. 2005.01.12  DSA2000 ====================================*/
       /* EXEC SQL
       UPDATE  PKMRTMAS p
          SET  ITAMT = ( SELECT NVL(ITAMT,0) FROM PKMPMAS WHERE EMPNO = P.EMPNO); */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS p  set ITAMT=(select NVL(ITAMT,0)  fr\
om PKMPMAS where EMPNO=P.EMPNO)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )292;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
       if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
       {    print_errmsg(sqlca.sqlcode,"7. 정보통신수당 setting Error");
            sprintf(log_buff, "7. 정보통신수당 setting Error");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            exit(1);
       }
       /*==============================================================================*/
       
       /* 최초입사일 */     
       /* EXEC SQL     
       UPDATE  PKMRTMAS A
          SET  ORGEMPDATE = ( SELECT  EMPDATE 
                                FROM  PIMPMAS B
                               WHERE  A.EMPNO = B.EMPNO
                            ); */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS A  set ORGEMPDATE=(select EMPDATE  fr\
om PIMPMAS B where A.EMPNO=B.EMPNO)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )307;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
       if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
       {
            print_errmsg(sqlca.sqlcode," ORGEMPDATE UPDATE에서 오류...");
            sprintf(log_buff, " ORGEMPDATE UPDATE에서 오류...");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       } 
     
       
       /* 입사년도 근속일 /퇴사년도 근속일수 */     
       /* EXEC SQL     
       UPDATE PKMRTMAS 
          SET EMPYEARDD = TO_DATE(CONCAT(SUBSTR(ORGEMPDATE,1,4),'1231'),'YYYYMMDD')
                          - TO_DATE(ORGEMPDATE,'YYYYMMDD') + 1,
              RETYEARDD = TO_DATE(RETDATE,'YYYYMMDD')
                         - TO_DATE(CONCAT(SUBSTR(RETDATE,1,4),'0101'),'YYYYMMDD') +1 
        WHERE SUBSTR(ORGEMPDATE,1,4) <> SUBSTR(RETDATE,1,4); */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS  set EMPYEARDD=((TO_DATE(CONCAT(SUBST\
R(ORGEMPDATE,1,4),'1231'),'YYYYMMDD')-TO_DATE(ORGEMPDATE,'YYYYMMDD'))+1),RETY\
EARDD=((TO_DATE(RETDATE,'YYYYMMDD')-TO_DATE(CONCAT(SUBSTR(RETDATE,1,4),'0101'\
),'YYYYMMDD'))+1) where SUBSTR(ORGEMPDATE,1,4)<>SUBSTR(RETDATE,1,4)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )322;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
       if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
       {
            print_errmsg(sqlca.sqlcode,"EMPYEARDD, RETYEARDD UPDATE에서 오류...");
            sprintf(log_buff, "EMPYEARDD, RETYEARDD UPDATE에서 오류...");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       } 
     
     
       /* 입사년도 근속일 +퇴사년도 근속일수 */     
       /* EXEC SQL   
       UPDATE PKMRTMAS 
          SET TOTYEARDD = EMPYEARDD+RETYEARDD; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS  set TOTYEARDD=(EMPYEARDD+RETYEARDD)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )337;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
       if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
       {
            print_errmsg(sqlca.sqlcode,"TOTYEARDD UPDATE에서 오류1...");
            sprintf(log_buff, "TOTYEARDD UPDATE에서 오류1...");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       } 
     
       /* 총근속일 :입사년도에 퇴직 */     
       /* EXEC SQL   
       UPDATE  PKMRTMAS 
          SET  TOTYEARDD = TO_DATE(RETDATE,'YYYYMMDD') - TO_DATE(ORGEMPDATE,'YYYYMMDD') + 1 
        WHERE  SUBSTR(ORGEMPDATE,1,4) = SUBSTR(RETDATE,1,4); */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS  set TOTYEARDD=((TO_DATE(RETDATE,'YYY\
YMMDD')-TO_DATE(ORGEMPDATE,'YYYYMMDD'))+1) where SUBSTR(ORGEMPDATE,1,4)=SUBST\
R(RETDATE,1,4)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )352;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
       if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
       {
            print_errmsg(sqlca.sqlcode,"TOTYEARDD UPDATE에서 오류2...");
            sprintf(log_buff, "TOTYEARDD UPDATE에서 오류2...");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       } 
     
     
       /* 1년 이상 연차 :10개 */     
       /* EXEC SQL     
       UPDATE  PKMRTMAS 
          SET  YEARDAY=10 
        WHERE  TOTYEARDD>=365; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 5;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMRTMAS  set YEARDAY=10 where TOTYEARDD>=365";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )367;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
       if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
       {
            print_errmsg(sqlca.sqlcode,"YEARDAY UPDATE에서 오류1...");
            sprintf(log_buff, "YEARDAY UPDATE에서 오류1...");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       } 

/*=2000-06-14 9:32오전 추가======*/
     /* EXEC SQL DECLARE c8 CURSOR FOR 
     SELECT  EMPNO,substr(ORGEMPDATE,1,4)
       FROM  PKMRTMAS
      /o infra     WHERE   PAYCL >'09'o/
      WHERE  PAYCL >='C11'     
      ORDER  BY EMPNO; */ 


     /* EXEC SQL OPEN  c8; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0016;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )382;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     while(1)
     {
          /* EXEC SQL FETCH c8
          INTO  :yempno, :yempyy; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )397;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)yempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)yempyy;
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

 
          
          if (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c8; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )420;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                /* return(SUCCESS);  */
               break;
          }
            
          set_to_empdate(t_empdate);  
          
          
          /* 총근로일수가 90%이하인 사람 */     
          /* EXEC SQL     
          UPDATE PKMRTMAS 
             SET YEARDAY=0 
           WHERE ORGEMPDATE <= :t_empdate
             AND EMPNO  =:yempno  ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS  set YEARDAY=0 where (ORGEMPDATE<=\
:b0 and EMPNO=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )435;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)t_empdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)yempno;
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


            
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
          {
               print_errmsg(sqlca.sqlcode,"YEARDAY UPDATE에서 오류2...");
               sprintf(log_buff, "YEARDAY UPDATE에서 오류2...");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          } 
     
     }


/* debug ***********************
printf("\n*************t_empdate %s",t_empdate);

     연차 사용일수 *******************************************
     EXEC SQL   
        UPDATE PKMRTMAS P 
     SET USEYEAR=(SELECT YEAR 
                  FROM   PKHDUSUM R 
                  WHERE  P.EMPNO=R.EMPNO AND SUBSTR(P.RETDATE,1,4)=R.DUYY)
     WHERE  EMPNO IN (SELECT EMPNO FROM PKHDUSUM T 
        WHERE  SUBSTR(P.RETDATE,1,4)=T.DUYY);
        ******************************************* */
     /* EXEC SQL   
     UPDATE  PKMRTMAS P 
        SET  USEYEAR=( SELECT SUM(NVL(YEAR ,0)+NVL(YEARHALF,0) *.5 )
                         FROM  PKHDUTY R 
                        WHERE  P.EMPNO=R.EMPNO 
                          AND  SUBSTR(P.RETDATE,1,4)=SUBSTR(R.DUYYMM,1,4))
     WHERE  EMPNO IN (SELECT EMPNO FROM PKHDUTY T 
                       WHERE  SUBSTR(P.RETDATE,1,4)=SUBSTR(T.DUYYMM,1,4)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set USEYEAR=(select sum((NVL(YEAR,0)\
+(NVL(YEARHALF,0)* .5)))  from PKHDUTY R where (P.EMPNO=R.EMPNO and SUBSTR(P.\
RETDATE,1,4)=SUBSTR(R.DUYYMM,1,4))) where EMPNO in (select EMPNO  from PKHDUT\
Y T where SUBSTR(P.RETDATE,1,4)=SUBSTR(T.DUYYMM,1,4))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )458;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"USEYEAR UPDATE에서 오류...");
          sprintf(log_buff, "USEYEAR UPDATE에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 

     /* 지급년차일수 */     
     /* EXEC SQL   
     UPDATE PKMRTMAS 
        SET YEDEPOSIT=  NVL(YEARDAY,0) + NVL(ADDDAY,0) - NVL(USEYEAR,0)+NVL(CALMON,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set YEDEPOSIT=(((NVL(YEARDAY,0)+NVL(AD\
DDAY,0))-NVL(USEYEAR,0))+NVL(CALMON,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )473;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"YEDEPOSIT UPDATE에서 오류...");
          sprintf(log_buff, "YEDEPOSIT UPDATE에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 

     /* 지급년차수당 */     
     /* EXEC SQL   
     /o2016.12.20 eyha 통상임금 적용 변경  184 -> 209     
     UPDATE  PKMRTMAS 
        SET  YENAMT=CEIL(YEDEPOSIT*GREATEST(AVGGROSSYM,COMMONAMT)*8/184) ;  o/
     UPDATE  PKMRTMAS 
        SET  YENAMT=CEIL(YEDEPOSIT*COMMONAMT*8/209) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set YENAMT=CEIL((((YEDEPOSIT* COMMONAM\
T)* 8)/209))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )488;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"YENAMT UPDATE에서 오류...");
          sprintf(log_buff, "YENAMT UPDATE에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 

/* ======================================================= ver 30.00 start
*  30.00      1999.03.04         이랑교          신인사제도 반영
*          평균임금,통상임금 ,직급변동
* ======================================================================= */
     /* 임원은 0으로 */
     /* EXEC SQL     
     UPDATE  PKMRTMAS 
        SET  YEARDAY=0, ADDDAY =0, USEYEAR=0,    CALMON =0,  YEDEPOSIT=0, 
             YENAMT=0,  MONDAY=0,  MONDEPOSIT=0, MONGIGUB=0, MONAMT=0
           /oinfra         WHERE      (paycl <= '09' ) ;o/
      WHERE  (paycl <= 'A99' ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set YEARDAY=0,ADDDAY=0,USEYEAR=0,CALMO\
N=0,YEDEPOSIT=0,YENAMT=0,MONDAY=0,MONDEPOSIT=0,MONGIGUB=0,MONAMT=0 where payc\
l<='A99'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )503;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
        
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
          print_errmsg(sqlca.sqlcode,"임원 UPDATE에서 오류...");
          sprintf(log_buff, "임원 UPDATE에서 오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 
     
     /* 2001-02-12 계약직은 월차수당을 0으로 */
     /* EXEC SQL     
     UPDATE PKMRTMAS 
        SET CALMON =0, MONDAY=0, MONDEPOSIT=0, MONGIGUB=0, MONAMT=0
        /oWHERE (paycl not between '11' and '93') ; 2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.o/
        /oinfra        WHERE (paycl not between '10' and '93') ;o/
      WHERE (paycl not between 'C11' and 'D41') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set CALMON=0,MONDAY=0,MONDEPOSIT=0,MON\
GIGUB=0,MONAMT=0 where paycl not  between 'C11' and 'D41'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )518;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
        
      if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
     {
           print_errmsg(sqlca.sqlcode,"계약직 UPDATE에서 오류...");
           sprintf(log_buff, "계약직 UPDATE에서 오류...");
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           error_quit("작업실패...");
     } 

     /* null 값 조정 */
     /* EXEC SQL     
     UPDATE  PKMRTMAS 
        SET  YEARDAY  =NVL(YEARDAY  ,0),   ADDDAY    =NVL(ADDDAY     ,0),
             USEYEAR  =NVL(USEYEAR  ,0),   CALMON    =NVL(CALMON     ,0),
             YEDEPOSIT=NVL(YEDEPOSIT,0),   YENAMT    =NVL(YENAMT     ,0),
             MONDAY   =NVL(MONDAY   ,0),   MONDEPOSIT=NVL(MONDEPOSIT ,0),
             MONGIGUB =NVL(MONGIGUB ,0),   MONAMT    =NVL(MONAMT     ,0),
             ITAMT    =NVL(ITAMT    ,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set YEARDAY=NVL(YEARDAY,0),ADDDAY=NVL(\
ADDDAY,0),USEYEAR=NVL(USEYEAR,0),CALMON=NVL(CALMON,0),YEDEPOSIT=NVL(YEDEPOSIT\
,0),YENAMT=NVL(YENAMT,0),MONDAY=NVL(MONDAY,0),MONDEPOSIT=NVL(MONDEPOSIT,0),MO\
NGIGUB=NVL(MONGIGUB,0),MONAMT=NVL(MONAMT,0),ITAMT=NVL(ITAMT,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )533;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   /*DSA2000   2005.01.*/
/*  ========================================================end of Ver 30.00 */
}
     
/*****************************************************************************
     연간근로일수를 구하는 함수.     
 *****************************************************************************/
int  get_yytotdd(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          int    count;
          char   t1_date[8+1] = "";
          char   t2_date[8+1] = "";
     /* EXEC SQL END DECLARE SECTION; */ 


     int     result = 0;     
     int     tmp = 0;

     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     result = get_term(t1_date,t2_date);
     
     
     /* EXEC SQL
     SELECT  COUNT(*)
       INTO  :count
       FROM  PKCHOLI     
      WHERE  (HOLIDATE >= :t1_date AND HOLIDATE <= :t2_date) 
        AND   HOLIKIND <> '0' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKCHOLI where ((HOLIDAT\
E>=:b1 and HOLIDATE<=:b2) and HOLIKIND<>'0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )548;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)t2_date;
     sqlstm.sqhstl[2] = (unsigned long )9;
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


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"당해년도 휴일총일수 읽기오류...");
          sprintf(log_buff, "당해년도 휴일총일수 읽기오류...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }

     if ((tmp=get_dupholiday(frdate,todate)) == FAIL)
          return(FAIL);
     
     result = result - (count + get_sundaycnt(frdate,todate)-tmp); 
     return(result);
}

/*****************************************************************************
     시작일과 종료일까지의 기간을 일단위로 구하는 함수.     
 *****************************************************************************/
int     get_term(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
          int   result;
     /* EXEC SQL END DECLARE SECTION; */ 


     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);

     /* EXEC SQL
     SELECT  TO_DATE(:t2_date,'YYYYMMDD') - TO_DATE(:t1_date,'YYYYMMDD') + 1
       INTO  :result
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select ((TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD'\
))+1) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )575;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t2_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&result;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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



     return(result);
} 

/*****************************************************************************
     기준년도의 일요일수를 구하는 함수.
 *****************************************************************************/
int  get_sundaycnt(char *frdate, char *todate)
{
     char     fr_date[8+1]      = ""; 
     char     to_date[8+1]      = "";
     char     buf[50]             = "";
     int     tmp;
     int     count;

     sprintf(fr_date,"%s",frdate);
     sprintf(to_date,"%s",todate);
     while(1)
     {
          get_dayname(fr_date,buf);
          if  (strcmp(buf,"SUNDAY") == 0)
               break;
          add_days(fr_date,1,fr_date);     
     }

     while(1)
     {
          get_dayname(to_date,buf);
          if  (strcmp(buf,"SUNDAY") == 0)
               break;
          add_days(to_date,-1,to_date);
     }

     count = get_term(fr_date,to_date) / 7 + 1;
     return(count);
}

/*****************************************************************************
     근태에 등록된 휴일 중 일요일의 수를 구하는 함수.
 *****************************************************************************/
int  get_dupholiday(char *frdate,char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          int  count;
          char     t1_date[8+1]      = "";
          char     t2_date[8+1]      = "";
          char     holidate[8+1]     = "";
          char     buf[50+1]     = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t1_date,"%s",frdate);
     sprintf(t2_date,"%s",todate);
     /* EXEC SQL DECLARE c4 CURSOR FOR
     SELECT  HOLIDATE
       FROM  PKCHOLI
      WHERE  (HOLIDATE >= :t1_date AND HOLIDATE <= :t2_date) 
        AND  HOLIKIND <> '0'
      ORDER  BY HOLIDATE; */ 

     
     /* EXEC SQL OPEN c4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0026;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )602;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t2_date;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
     {
          print_errmsg(sqlca.sqlcode,"Cursor c4 Open Error...");
          sprintf(log_buff, "Cursor c4 Open Error...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )625;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     count = 0;
     while(1)
     {
          /* EXEC SQL FETCH c4
          INTO  :holidate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )640;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)holidate;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )659;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(count);
          }
          else if (sqlca.sqlcode != 0)
          {
               print_errmsg(sqlca.sqlcode,"Cursor c4 Data Fetch Error...");
               sprintf(log_buff, "Cursor c4 Data Fetch Error...");
                /*Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 5;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )674;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          get_dayname(holidate,buf);
          if  (strcmp(buf,"SUNDAY") == 0)
               count++;     
     }
}


/****************************************************************************
       요일명을 구하는 함수.
 ***************************************************************************/
void get_dayname(char *indate,char *result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char idate[8+1]        = "";
          char ddname[20]      = "";
     /* EXEC SQL END   DECLARE SECTION; */ 

     int count;
     
     sprintf(idate,"%s",indate);
     /* EXEC SQL 
     SELECT      TO_CHAR(TO_DATE(:idate,'YYYYMMDD'),'DAY')
       INTO     :ddname
       FROM     DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'DAY') into :b1 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )689;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)idate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ddname;
     sqlstm.sqhstl[1] = (unsigned long )20;
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



     count = 0;
     while (ddname[count] != ' ')
          count++;
     ddname[count] = '\0';
     sprintf(result,"%s",ddname);
}


/*****************************************************************************
     set_to_empdate function
 *****************************************************************************/
void set_to_empdate(char *to_empdate)
{
     int    totdd,i,j,k;     
     char   t1_date[8+1]     = "";
     char   t2_date[8+1]     = "";
     char   buf[50+1]     = "";

     sprintf(t1_date,"%s",yempyy);
     sprintf(t2_date,"%s",yempyy);
     sprintf(t1_date+4,"0101");
     sprintf(t2_date+4,"1231");
     
     totdd = get_yytotdd(t1_date,t2_date);
     totdd = totdd * 10 /100 ;

     i = j = k = 0;
     while (j < totdd)
     {
          get_dayname(t1_date,buf);
          i = is_holiday(t1_date);
          if  (i == FAIL)
          {
               printf(" 작업실패...");
               exit(0);
          }
          if ((strcmp(buf,"SUNDAY") != 0) && (i == 0))
               j++;
          add_days(t1_date,1,t1_date);
     }
     add_days(t1_date,-1,t1_date);
     sprintf(to_empdate,"%.8s",t1_date);
/* debug=====     printf("===> %.8s",to_empdate);=========== */
}


/*****************************************************************************
     기준일+M 일을 구하는 함수.   **
 *****************************************************************************/
void add_days(char* indate,int m, char* rdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char     t_date[8+1]     = "";
          int     t_adddays;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t_date,"%s",indate);
     t_adddays = m;
     
     /* EXEC SQL
     SELECT  TO_CHAR(TO_DATE(TO_CHAR(TO_DATE(:t_date,'YYYYMMDD')+
                     :t_adddays,'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD')
       INTO  :t_date
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )712;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_adddays;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)t_date;
     sqlstm.sqhstl[2] = (unsigned long )9;
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


     
     sprintf(rdate,"%s",t_date);
}

/*****************************************************************************
     is_holiday() function. **
 *****************************************************************************/
is_holiday(char *pdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          int      count;
          char     t_date[8+1] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     sprintf(t_date,"%s",pdate);

     /* EXEC SQL
     SELECT  COUNT(*)
       INTO  :count
       FROM  PKCHOLI     
      WHERE  HOLIDATE = :t_date 
        AND  HOLIKIND <> '0' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKCHOLI where (HOLIDATE\
=:b1 and HOLIKIND<>'0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )739;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t_date;
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


     if  (sqlca.sqlcode != 0)
     {
          print_errmsg(sqlca.sqlcode,"휴일테이블 읽기오류...");
          printf(" 대상날짜 : [%s] \n",t_date);
          sprintf(log_buff, "휴일테이블 읽기오류..대상날짜 : [%s] \n",t_date);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     return(count);
}

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int  Write_batlog(int seqno, char *message)
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
     sqlstm.offset = (unsigned int  )762;
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
     sqlstm.offset = (unsigned int  )803;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
}

/*****************************************************************************
  3개월 급여합을 구하는 함수.: 2016.12 avgpay_rt.pc 삭제 및 pkq2073g.pc내 포함
 *****************************************************************************/
double  get_rtpaysum(empno, retdate, paysum)
char   *empno;
char   *retdate;
double *paysum;
{
     char   retyymm[6+1];
     double sum =0 ;
     double count=0;
     double tmp=0;
     double t_avg_odamt=0;
     double t_avg_roleamt =0;
     float  t_fixpay11 = 0.0;
     char   t_empnochk[2] = "" ;  

     /*--------------------------------------------------------------------------------------------------------*/     
     /* PKCAFLD(통상평균임금항목관리) 테이블적용을 위한 Sql문을 저장하는 변수선언 및 Clear [2018-09-13 이상용] */
     /*--------------------------------------------------------------------------------------------------------*/     
     char   sqlstr[1024];
     char   tmpstr[256];
     char   sumstr[128];
     memset(sqlstr,'\0',sizeof(sqlstr));
     memset(tmpstr,'\0',sizeof(tmpstr));   
     memset(sumstr,'\0',sizeof(sumstr));   
     /*--------------------------------------------------------------------------------------------------------*/     
   
     sprintf(retyymm,"%.6s",retdate);     /* printf("retyymm %.6s,empno %s",retyymm,empno);   ********************** */
   
     /* EXEC SQL
     SELECT COUNT(SUBSTR(PAYDATE,1,6))
       INTO :count
       FROM PKHPHIS
      WHERE EMPNO = :empno
        AND SUBSTR(PAYDATE,1,6) >= TO_CHAR(ADD_MONTHS(TO_DATE(:retyymm,'YYYYMM'),-2),'YYYYMM')
        AND SUBSTR(PAYDATE,1,6) <= :retyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(SUBSTR(PAYDATE,1,6)) into :b0  from PKHPHI\
S where ((EMPNO=:b1 and SUBSTR(PAYDATE,1,6)>=TO_CHAR(ADD_MONTHS(TO_DATE(:b2,'\
YYYYMM'),(-2)),'YYYYMM')) and SUBSTR(PAYDATE,1,6)<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )824;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)empno;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)retyymm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)retyymm;
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


   
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
         printf(" Module Name : get_rtpaysum() ***1\n");
         printf(" SQL STATEMENT : SELECT CNT[%d]\n",sqlca.sqlcode);
         return(FAIL);
     }
   
     if (count == 0)  return(0);
   
     /*평균자가운전지원금 Read : 평균임금에 반영되는 직책수당은 pkcpbas의 avgroleamt */
     /* EXEC SQL
     SELECT AVGODAMT, AVGROLEAMT 
       into :t_avg_odamt, :t_avg_roleamt
       FROM PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGODAMT ,AVGROLEAMT into :b0,:b1  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )855;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&t_avg_odamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_avg_roleamt;
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


   
     if (sqlca.sqlcode != 0)
     {
         print_errmsg(sqlca.sqlcode,"평균자가운전지원금 Read Error...");
         return(-1);
     }
        
     /* 1. 만근일 경우 */
     if (strcmp(retyymm,"201612") <= 0) /*2016.12.30. 2016년12월까지 루틴 분리 dsa2000 : */
     {   
         /*평균임금 칼럼정리 및 2015년1월부터 평균임금제도 변경(/18 => /12) : 2014.11.06. dsa2000 */
         /* EXEC SQL
         SELECT NVL(SUM(DECODE(SUBSTR(EMPNO,1,1),'P',((nvl(FIXPAY,0)+nvl(SOPAY,0))),
                                                 'J',((nvl(FIXPAY,0)+nvl(SOPAY,0))),
                                                 'Q',((nvl(FIXPAY,0)+nvl(SOPAY,0))),    
                               Case When paydate <= '201412' then (CEIL((NVL(FIXPAY,0)+NVL(SOPAY,0))*18/12)) Else (NVL(FIXPAY,0)+NVL(SOPAY,0)) End
                               ) +
                        NVL(OVTMAMT,0) + 
                        NVL(MCARAMT,0) +
                        DECODE(NVL(ODAMT,0),0,0,:t_avg_odamt) +
                        NVL(SPTMAMT,0) ), 0)
           INTO :sum
           FROM PKHPHIS
          WHERE EMPNO = :empno
            AND SUBSTR(PAYDATE,1,6) >= TO_CHAR(ADD_MONTHS(TO_DATE(:retyymm,'YYYYMM'),-2),'YYYYMM')
            AND SUBSTR(PAYDATE,1,6) <= :retyymm; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select NVL(sum(((((DECODE(SUBSTR(EMPNO,1,1),'P',(nv\
l(FIXPAY,0)+nvl(SOPAY,0)),'J',(nvl(FIXPAY,0)+nvl(SOPAY,0)),'Q',(nvl(FIXPAY,0)\
+nvl(SOPAY,0)), case  when paydate<='201412' then CEIL((((NVL(FIXPAY,0)+NVL(S\
OPAY,0))* 18)/12)) else (NVL(FIXPAY,0)+NVL(SOPAY,0))  end )+NVL(OVTMAMT,0))+N\
VL(MCARAMT,0))+DECODE(NVL(ODAMT,0),0,0,:b0))+NVL(SPTMAMT,0))),0) into :b1  fr\
om PKHPHIS where ((EMPNO=:b2 and SUBSTR(PAYDATE,1,6)>=TO_CHAR(ADD_MONTHS(TO_D\
ATE(:b3,'YYYYMM'),(-2)),'YYYYMM')) and SUBSTR(PAYDATE,1,6)<=:b3)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )878;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&t_avg_odamt;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)&sum;
         sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)empno;
         sqlstm.sqhstl[2] = (unsigned long )0;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)retyymm;
         sqlstm.sqhstl[3] = (unsigned long )7;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)retyymm;
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


     }
     else if ((strcmp(retyymm,"201612") > 0) && (strcmp(retyymm,"201804") <= 0))
     {   /*사번 하드코딩제거 및 평균임금 쿼리 정리 2016.12.30 dsa2000 : 2017년~ 루틴 */
         /* EXEC SQL
         SELECT NVL(SUM(NVL(FIXPAY,0)  + NVL(SOPAY,0) + 
                        NVL(OVTMAMT,0) + 
                        NVL(MCARAMT,0) +
                        DECODE(NVL(ODAMT,0),0,0,:t_avg_odamt) +
                        NVL(SPTMAMT,0) ),0)
           INTO :sum
           FROM PKHPHIS
          WHERE EMPNO = :empno
            AND SUBSTR(PAYDATE,1,6) >= TO_CHAR(ADD_MONTHS(TO_DATE(:retyymm,'YYYYMM'),-2),'YYYYMM')
            AND SUBSTR(PAYDATE,1,6) <= :retyymm; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select NVL(sum((((((NVL(FIXPAY,0)+NVL(SOPAY,0))+NVL\
(OVTMAMT,0))+NVL(MCARAMT,0))+DECODE(NVL(ODAMT,0),0,0,:b0))+NVL(SPTMAMT,0))),0\
) into :b1  from PKHPHIS where ((EMPNO=:b2 and SUBSTR(PAYDATE,1,6)>=TO_CHAR(A\
DD_MONTHS(TO_DATE(:b3,'YYYYMM'),(-2)),'YYYYMM')) and SUBSTR(PAYDATE,1,6)<=:b3\
)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )913;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&t_avg_odamt;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)&sum;
         sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)empno;
         sqlstm.sqhstl[2] = (unsigned long )0;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)retyymm;
         sqlstm.sqhstl[3] = (unsigned long )7;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)retyymm;
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


     }
     else
     {   
         /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 평균임금 구함 Start [2018-09-13 이상용] */
         /* EXEC SQL
         SELECT REPLACE(REGEXP_REPLACE(WM_CONCAT(A.DATAFLD), ',', '+'),'ODAMT','DECODE(NVL(ODAMT,0),0,0,AVGODAMT)')
           INTO :sumstr  
           FROM PKCAFLD A, PKCPBAS B
          WHERE A.PAYKIND = '2'
            AND :retyymm BETWEEN A.FMONTH AND A.TMONTH; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select REPLACE(REGEXP_REPLACE(WM_CONCAT(A.DATAFLD),\
',','+'),'ODAMT','DECODE(NVL(ODAMT,0),0,0,AVGODAMT)') into :b0  from PKCAFLD \
A ,PKCPBAS B where (A.PAYKIND='2' and :b1 between A.FMONTH and A.TMONTH)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )948;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)sumstr;
         sqlstm.sqhstl[0] = (unsigned long )128;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)retyymm;
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

     
     
         sprintf(sqlstr," SELECT SUM(%s) FROM PKHPHIS A, PKCPBAS B ",sumstr );
         sprintf(tmpstr,"  WHERE EMPNO = '%s' AND SUBSTR(PAYDATE,1,6) >= TO_CHAR(ADD_MONTHS(TO_DATE('%s','YYYYMM'),-2),'YYYYMM') AND SUBSTR(PAYDATE,1,6) <= '%s' ", empno, retyymm, retyymm);          
         strcat(sqlstr,tmpstr);

         /* EXEC SQL PREPARE AVG_PAY_PRE FROM :sqlstr; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )971;
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



         if(SQLCODE != 0) {
            printf(" SQL STATEMENT : SELECT SUM [%d]\n",sqlca.sqlcode);
            return(FAIL);
         }

         /* EXEC SQL DECLARE AVG_PAY_CUR CURSOR FOR AVG_PAY_PRE; */ 

          
         /* EXEC SQL OPEN AVG_PAY_CUR; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )990;
         sqlstm.selerr = (unsigned short)1;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqcmod = (unsigned int )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



         if(SQLCODE != 0) {
            printf(" cursor open error [%d]\n",sqlca.sqlcode);
            return(FAIL);
         }

         while(1) {
             /* EXEC SQL FETCH AVG_PAY_CUR
                 INTO :sum 
             ; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 5;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )1005;
             sqlstm.selerr = (unsigned short)1;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlstm.sqfoff = (         int )0;
             sqlstm.sqfmod = (unsigned int )2;
             sqlstm.sqhstv[0] = (unsigned char  *)&sum;
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


      
             if(SQLCODE != 0) {
                 if(SQLCODE == 1403) {
                     break;
                 }
                 printf(" cursor fetch error [%d]\n",sqlca.sqlcode); 
                 return(FAIL);
             }
             printf("\n empno[%s] pay3sum[%10f.0]", empno, sum);
         }
      
         /* EXEC SQL CLOSE AVG_PAY_CUR; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 5;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )1024;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

          
         /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 평균임금 구함 End [2018-09-13 이상용] */         
     }
     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
         printf(" Module Name : get_pay3fullsum() \n");
         printf(" TABLE ID : PKHPHIS  \n");
         printf(" SQL STATEMENT : SELECT SUM[%d]\n",sqlca.sqlcode);
         return(FAIL);
     }
     
     *paysum = sum;
     return(sum);
}



/*****************************************************************************
        퇴직일기준 연차수당을 계산하는 함수
  중도퇴사자의 경우는 퇴직월 제외기준 연차 : 2016.12 avgpay_rt.pc 삭제 및 pkq2073g.pc내 포함
 *****************************************************************************/
double get_ybonamt(empno,retdate,ybonamt)
char *empno;
char *retdate;
double *ybonamt;
{
     char   retyymm[6+1];
     double  sum    = 0 ;
     
     /* EXEC SQL
     SELECT DECODE(SUBSTR(:retdate,7,2), TO_CHAR(LAST_DAY(TO_DATE(:retdate,'YYYYMMDD')),'DD'), 
                   SUBSTR(:retdate,1,6), TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(:retdate,1,6), 'YYYYMM'),-1),'YYYYMM')
                  )
       INTO :retyymm
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select DECODE(SUBSTR(:b0,7,2),TO_CHAR(LAST_DAY(TO_DATE(\
:b0,'YYYYMMDD')),'DD'),SUBSTR(:b0,1,6),TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(:b0,\
1,6),'YYYYMM'),(-1)),'YYYYMM')) into :b4  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1039;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)retdate;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)retdate;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)retdate;
     sqlstm.sqhstl[2] = (unsigned long )0;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)retdate;
     sqlstm.sqhstl[3] = (unsigned long )0;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)retyymm;
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


     
     /* EXEC SQL
     SELECT NVL(SUM(NVL(YBONAMT ,0)),0)
       INTO :sum
       FROM PKHPHIS
      WHERE EMPNO = :empno
        AND SUBSTR(PAYDATE,1,6) >= TO_CHAR(ADD_MONTHS(TO_DATE(:retyymm,'YYYYMM'),-11),'YYYYMM')
        AND SUBSTR(PAYDATE,1,6) <= :retyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(sum(NVL(YBONAMT,0)),0) into :b0  from PKHPHI\
S where ((EMPNO=:b1 and SUBSTR(PAYDATE,1,6)>=TO_CHAR(ADD_MONTHS(TO_DATE(:b2,'\
YYYYMM'),(-11)),'YYYYMM')) and SUBSTR(PAYDATE,1,6)<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1074;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&sum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)empno;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)retyymm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)retyymm;
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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
         printf(" Module Name : get_bon12sum() \n");
         printf(" SQL STATEMENT : SELECT [%d]\n",sqlca.sqlcode);
         return(FAIL);
     };

     *ybonamt = sum ;
}
