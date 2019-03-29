
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
    "pkz10501.pc"
};


static unsigned int sqlctx = 155971;


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
   unsigned char  *sqhstv[14];
   unsigned long  sqhstl[14];
            int   sqhsts[14];
            short *sqindv[14];
            int   sqinds[14];
   unsigned long  sqharm[14];
   unsigned long  *sqharc[14];
   unsigned short  sqadto[14];
   unsigned short  sqtdso[14];
} sqlstm = {12,14};

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

 static char *sq0004 = 
"select EMPNO ,NVL(PAYCL,' ') ,NVL(MATEDCNT,0) ,NVL(FAMIDCNT,0) ,NVL(OBSDCNT\
,0) ,NVL(SILVERDCNT1,0) ,NVL(SILVERDCNT2,0) ,NVL(WOMANDCNT,0) ,NVL(EDUDCNT,0)\
 ,NVL(CHILDDEDCNT,0) ,decode(substr(empdate,1,4),substr(:b0,1,4),((12-to_numb\
er(substr(empdate,5,2)))+1),12) paycount  from PKZMPMAS A where ((EMPNO>=:b1 \
and EMPNO<=:b2) and PAYYN='Y')           ";

 static char *sq0006 = 
"select empno  from pkzmpmas where ((upper(nvl(payyn,'N'))='Y' and empno>=:b\
0) and empno<=:b1) order by empno            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,172,0,0,0,0,0,1,0,
20,0,0,2,316,0,4,228,0,0,14,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
91,0,0,3,41,0,4,251,0,0,1,0,0,1,0,2,97,0,0,
110,0,0,4,347,0,9,272,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
137,0,0,4,0,0,15,278,0,0,0,0,0,1,0,
152,0,0,4,0,0,13,284,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
211,0,0,4,0,0,15,293,0,0,0,0,0,1,0,
226,0,0,4,0,0,15,300,0,0,0,0,0,1,0,
241,0,0,4,0,0,15,306,0,0,0,0,0,1,0,
256,0,0,5,124,0,5,348,0,0,8,8,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,97,0,0,
303,0,0,6,120,0,9,391,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
326,0,0,6,0,0,15,397,0,0,0,0,0,1,0,
341,0,0,6,0,0,13,403,0,0,1,0,0,1,0,2,97,0,0,
360,0,0,6,0,0,15,407,0,0,0,0,0,1,0,
375,0,0,6,0,0,15,414,0,0,0,0,0,1,0,
390,0,0,7,109,0,4,418,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
421,0,0,6,0,0,15,431,0,0,0,0,0,1,0,
436,0,0,8,45,0,5,443,0,0,1,1,0,1,0,1,97,0,0,
455,0,0,6,0,0,15,453,0,0,0,0,0,1,0,
470,0,0,9,523,0,5,465,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
493,0,0,10,117,0,5,488,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
516,0,0,11,46,0,4,505,0,0,1,0,0,1,0,2,97,0,0,
535,0,0,12,29,0,5,518,0,0,0,0,0,1,0,
550,0,0,13,319,0,5,525,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
577,0,0,14,118,0,5,554,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
600,0,0,15,572,0,5,569,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
623,0,0,16,50,0,3,602,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
664,0,0,17,0,0,29,612,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkz10501.pc(임원 급여생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여계산
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2008.05.

hinsacc pkz10501
mv pkz10501 ~/HINSA/proc/bin/Kbin

Update Contents
Version  date(yy.mm.dd) programmer      description     relevant doc.no
   1.00     2008.05.      강륜종        pkc10801.pc를 기준으로 임원용 개발
============================================================================= */

#include <string.h> 
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

#define  FAIL        -2

/********* Function Prototype 정의 ************/
void  Generate_Records();
void  Get_Criteria();
void  Calc_BasicGongje();
void  Update_Record3();
void  Process_Calc();
void  Get_Pays();
void  Get_DedSum();
void  print_errmsg(int errcode, char *errmsg);

/*********************************************
  Global Variable
**********************************************/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

    /* 당월급여내역  (PKMPCALC) 참조 변수                 */
    char    empno[5]        = ""; /* 사    번              */
    char    korname[13]     = ""; /* 성    명              */
    char    juminid[13+1]   = ""; /* 주민등록번호          */  
    char    paydate[9]      = ""; /* 급 여 지 급 월       */    
    char    paycl[3+1]      = ""; /* BAND                 */
    char    payra[3+1]      = ""; /* 직책                 */
    char    payyn[2]        = ""; /* 급여지급여부         */
    
    double  fixpay;               /* 월정급여             */
    double  odamt;                /* 운전지원금(총액)     */
    double  odtaxamt;             /* 운전지원금(과세)     */
    double  tmp_anudamt;          /* 국민연금 누계액      */   
    double  empldamt;             /* 고용보험료           */  
    double  dedsum;               /* 공제액계             */
    
    double  basicded;             /* 기초공제액           */
    double  mateded;              /* 배우자공제액          */
    double  famided;              /* 부양자공제액          */
    double  obsded;               /* 장애자공제액          */
    double  silverded;            /* 경로우대장애액       */
    double  womanded;             /* 부녀자공제액         */
    double  eduded;               /* 자녀양육비공제액     */
    double  speded;               /* 특별공제액           */  
    double  standded;             /* 표준공제액           */  
    double  fewded1;              /* 소수부양자공제액1     */
    double  fewded2;              /* 소수부양자공제액2     */
    double  etcded1;              /* 기타공제액1          */
    double  etcded2;              /* 기타공제액2          */
    double  etcded3;              /* 기타공제액3          */
    double  taxpay;               /* 과세급여             */
    double  notaxpay;             /* 비과세급여           */
    double  paysum;               /* 지급총액             */
    double  taxpaysum;            /* 과세급여총액          */
    double  notaxpaysum;          /* 비과세급여총액       */
        
    char    writeman[5]       = ""; /* 최종작업자           */  
    char    president_empno[5]= ""; /* 사장님사번           */  
        
    /*  급여마스터  (PKMPMAS) 참조 변수               */
    double  v_mateamt;            /* 가족수당(배우자)     */
    double  v_partamt;            /* 가족수당(존속)       */
    double  v_childamt;           /* 가족수당(비속)       */
    double  edudcnt;              /* 가족수(비속)         */
    double  matedcnt;             /* 배우자공제수         */
    double  famidcnt;             /* 부양자공제수         */
    double  obsdcnt;              /* 장애자공제수         */
    double  silverdcnt1;          /* 경로우대공제수(65)    */
    double  silverdcnt2;          /* 경로우대공제수(70)    */
    double  womandcnt;            /* 부녀자공제수         */
    double  childdedcnt;          /* 다자녀추가공제       */
    double  childded;             /* 다자녀추가공제액 */
    
    /*  급여지급기준(PKCPBAS) 참조 변수                    */
    double  cbasicded;            /* 기초공제액            */
    double  cmateded;             /* 배우자공제액          */
    double  cfamided;             /* 부양자공제액          */
    double  cobsded;              /* 장애자공제액          */
    double  csilverded;           /* 경로우대공제액(65)    */
    double  csilverded2;          /* 경로우대공제액(70)    */
    double  cwomanded;            /* 부녀자공제액          */
    double  ceduded;              /* 자녀양육비공제액      */
    double  cstdded;              /* 특별공제액            */
    double  cfewded1;             /* 소수부양자공제액1     */
    double  cfewded2;             /* 소수부양자공제액2     */
    double  cetcded1;             /* 다자녀추가공제1(2명일때 50) */
    double  cetcded2;             /* 다자녀추가공제1(2명 초과시 1인당 100)*/
    double  avgodamt;             /* O/D지원금    */
    double  csauamt;              /* 사우회비    */
    char    incentiveyn[2];       /* 상여만 따로 지급 여부*/
    double  paycount;             /* 급여받은 월수 (연간 근로소득 추정월수) */          
    char    frempno[5];
    char    toempno[5];
    double  childeduamt;          /* 자녀학자금   */
    double  medpayamt ;           /* 의료비가불금 */
    double  yuedunotax;           /* 유치원학자금 비과세 추가 dsa2000  2005.01.*/

/* EXEC SQL END   DECLARE SECTION; */ 

/* EXEC SQL INCLUDE SQLCA;
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


int   i  = 0;
char  msg[500+1] = "";
int   id ;
char  dir[80];

char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

void main(int argc, char *argv[])
{
     char FL_file[255];
                       
     if (argc != 7) {  /* pkz10501 201012 M000 Q017 D006 pkz10501 2008052500000 */
         printf("[Usage] : pkz10501 1.급여년월 2.사번fr 3.사번to 4.작업자  5.프로그램ID 6.시작시간 \n");
         exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkz10501");
     
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(paydate ,"%.8s",argv[1]);
     sprintf(frempno ,"%.4s",argv[2]);
     sprintf(toempno ,"%.4s",argv[3]);
     sprintf(writeman,"%.4s",argv[4]);
     
     hinsa_log_print(0,"급여생성 프로그램 시작...[pkz10501]");        
     hinsa_db_connect();
     
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     
     
     /* EXEC SQL 
     lock table pkzmpmas in exclusive mode nowait; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock table pkzmpmas in exclusive mode nowait";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if (sqlca.sqlcode != 0) 
     {
         print_errmsg(sqlca.sqlcode,"다른 작업자가 DB수정 작업 중입니다...");
         sprintf(log_buff, " 다른 작업자가 DB수정 작업 중입니다..."); 
         Write_batlog(seqno++, log_buff);                               
         error_quit("작업실패...");
     }
       
     sprintf(log_buff, "월급여 생성중..."); 
     Write_batlog(seqno++, log_buff);              
     
     Generate_Records();                
       
     /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); 
          Write_batlog(seqno++, log_buff);                     
          error_quit("ERROR ====== [작업 실패] =====");
     }    
     else   
     {    
          sprintf(log_buff, "OK ====== [월급여생성 작업성공] ====="); 
          Write_batlog(seqno++, log_buff);                           
          hinsa_exit(0,"OK ====== [월급여생성 작업성공] =====");
     }        
}

/*****************************************************************************
  Generate_Records()
*****************************************************************************/
void Generate_Records()
{    
     Get_Criteria(); 
     printf("급여지급기준 읽기 완료\n");
     
     Calc_BasicGongje(); /* Calc_BasicGongje()안에 Update_Record2 루틴 포함.*/
       
     Update_Record3();   /* 상여금 분할개월수을 DB에 반영하는 함수. */
     
     Get_Pays();
     printf("과세 / 비과세 Sum 계산 완료\n");
     
     Process_Calc();     /* 고용보험 계산 */
       
     Get_DedSum();
     printf("공제금 합 계산 완료\n");
}

/*****************************************************************************
    급여기준테이블에서 급여계산에 필요한 값들을 얻는 함수.
*****************************************************************************/
void  Get_Criteria()
{
     /* EXEC SQL 
     SELECT   NVL(BASICDED,0),  
              NVL(MATEDED,0),      NVL(FAMIDED,0),      NVL(OBSDED,0),      
              NVL(SILVERDED,0),    NVL(SILVERDED2,0),   NVL(WOMANDED,0),   
              NVL(EDUDED,0),       NVL(STDDED,0),     
              NVL(ETCDED1,0),      NVL(ETCDED2,0),     
              NVL(AVGODAMT,0),     NVL(SAUAMT,0),       NVL(CHILDNOTAX,0)
       INTO  :cbasicded, 
             :cmateded,           :cfamided,           :cobsded, 
             :csilverded,         :csilverded2,        :cwomanded, 
             :ceduded,            :cstdded,            
             :cetcded1,           :cetcded2,           
             :avgodamt,           :csauamt,            :yuedunotax
       FROM  PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(BASICDED,0) ,NVL(MATEDED,0) ,NVL(FAMIDED,0) \
,NVL(OBSDED,0) ,NVL(SILVERDED,0) ,NVL(SILVERDED2,0) ,NVL(WOMANDED,0) ,NVL(EDU\
DED,0) ,NVL(STDDED,0) ,NVL(ETCDED1,0) ,NVL(ETCDED2,0) ,NVL(AVGODAMT,0) ,NVL(S\
AUAMT,0) ,NVL(CHILDNOTAX,0) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10\
,:b11,:b12,:b13  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&cbasicded;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&cmateded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&cfamided;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&cobsded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&csilverded;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&csilverded2;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&cwomanded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&ceduded;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&cstdded;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&cetcded1;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&cetcded2;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&csauamt;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&yuedunotax;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
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
          print_errmsg(sqlca.sqlcode,"급여지급기준 읽기오류...");
          sprintf(log_buff, " 급여지급기준 읽기오류....");
          Write_batlog(seqno++, log_buff);                    
          error_quit("작업실패...");
     }  
     
     /* Exec SQL
     Select  incentive
       Into :incentiveyn
       From  Pkzcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select incentive into :b0  from Pkzcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )91;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)incentiveyn;
     sqlstm.sqhstl[0] = (unsigned long )2;
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


}

/*****************************************************************************
    기초 공제 내역을 계산하는 함수.
*****************************************************************************/
void  Calc_BasicGongje()
{
     /* EXEC SQL DECLARE cursor2 CURSOR FOR
     SELECT  EMPNO,              NVL(PAYCL,' '),
             NVL(MATEDCNT  ,0),  NVL(FAMIDCNT,0),     NVL(OBSDCNT,0), 
             NVL(SILVERDCNT1,0), NVL(SILVERDCNT2,0), 
             NVL(WOMANDCNT,0),   NVL(EDUDCNT,0),      NVL(CHILDDEDCNT,0),
             decode(substr(empdate,1,4),substr(:paydate,1,4),12-to_number(substr(empdate,5,2))+1,12) paycount
       FROM  PKZMPMAS A
      WHERE  EMPNO >= :frempno AND EMPNO <= :toempno
        AND  PAYYN = 'Y'; */ 

     
     /* EXEC SQL OPEN cursor2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0004;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )110;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"Calc_BasicGongje : Open Error...");
          sprintf(log_buff, "Calc_BasicGongje : Open Error...");
          Write_batlog(seqno++, log_buff);                
          /* EXEC SQL CLOSE cursor2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )137;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          error_quit("작업실패...");
     }
     
     while(1) 
     {
          /* EXEC SQL FETCH cursor2 INTO 
              :empno,       :paycl,
              :matedcnt,    :famidcnt,    :obsdcnt,   
              :silverdcnt1, :silverdcnt2, 
              :womandcnt,   :edudcnt,     :childdedcnt,
              :paycount; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )152;
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
          sqlstm.sqhstv[1] = (unsigned char  *)paycl;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&matedcnt;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&famidcnt;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&obsdcnt;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&silverdcnt1;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&silverdcnt2;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&womandcnt;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&edudcnt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&childdedcnt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&paycount;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
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
              /* EXEC SQL CLOSE cursor2; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 14;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )211;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      
              return;
          }
          
          if (sqlca.sqlcode != 0) 
          {
              print_errmsg(sqlca.sqlcode,"Cursor cursor2 Data Fetch Error...");
              /* EXEC SQL CLOSE cursor2; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 14;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )226;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              error_quit("작업실패...");
          }
          
          if (Update_Record2() == FAIL)
          {
              /* EXEC SQL CLOSE cursor2; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 14;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )241;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              error_quit("작업실패...");
          }
     }
}

/***************************************************************************
  Update_Record2() Function.
****************************************************************************/
Update_Record2()
{  
     char    emp2[2] = "";
     
     if   (odamt > 0) odamt = avgodamt;
     else             odamt = 0;
     
     /*
     basicded  = cbasicded;
     mateded   = cmateded    * matedcnt;
     famided   = cfamided    * famidcnt;
     obsded    = cobsded     * obsdcnt;
     silverded = csilverded2 * silverdcnt2;
     womanded  = cwomanded   * womandcnt;
     eduded    = ceduded     * edudcnt;
     */
     /* 다자녀추가공제 */
     /*childded        = 0;
     if      (childdedcnt == 2)  childded = cetcded1;
     else if (childdedcnt >  2)  childded = cetcded2 * (childdedcnt - 2); */
     
     basicded  = 0;
     mateded   = 0;
     famided   = 0;
     obsded    = 0;
     silverded = 0;
     womanded  = 0;
     eduded    = 0;
     childded  = 0;  
 
     
     standded = 0 ;                  
     /*********************************************************/
     /* EXEC SQL
     update  pkzmpmas
        set  basicded  = :basicded, 
             mateded   = :mateded, 
             famided   = :famided, 
             obsded    = :obsded, 
             silverded = :silverded,
             womanded  = :womanded,
             childded  = :childded
      where  empno     = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkzmpmas  set basicded=:b0,mateded=:b1,famided=:\
b2,obsded=:b3,silverded=:b4,womanded=:b5,childded=:b6 where empno=:b7";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )256;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&basicded;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&mateded;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&famided;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&obsded;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&silverded;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&womanded;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&childded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)empno;
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

  
     
     if (sqlca.sqlcode == 0) 
          return(SUCCESS);
     else 
     {
          sprintf(log_buff, " Update_Record2 : empno...: %s", empno);
          Write_batlog(seqno++, log_buff);     
              
          print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류2(Update_Record2)...");
          sprintf(log_buff, " 월급여화일 쓰기오류2(Update_Record2)...");
          Write_batlog(seqno++, log_buff);     
          return(FAIL);
     }    
}

/*****************************************************************************
  국민연금료 공제(지급이력의 평균치 * 12로 공제)
*****************************************************************************/
void  Update_Record3()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

     char  year[4+1]   = "";    
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(year,"%.4s",paydate);
     
     /* EXEC SQL DECLARE cursor3 CURSOR FOR
     select empno
       from pkzmpmas
      where upper(nvl(payyn,'N')) = 'Y'  
        and empno  >= :frempno and empno <= :toempno
      order by empno; */ 

     
     /* EXEC SQL OPEN cursor3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )303;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
         print_errmsg(sqlca.sqlcode,"Cursor cursor3 Open Error...");
         sprintf(log_buff, " Cursor cursor3 Open Error...");
         Write_batlog(seqno++, log_buff);                
         /* EXEC SQL CLOSE cursor3; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 14;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )326;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         error_quit("작업실패...");
     }
     
     while (1) 
     {
          /* EXEC SQL FETCH cursor3 INTO :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )341;
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
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 14;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )360;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          
          if (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"Cursor cursor3 Data Fetch Error...");
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 14;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )375;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          /* EXEC SQL 
          select  nvl(sum(nvl(anudamt,0)),0)
            into :tmp_anudamt
            from  pkzhphis
           where  empno   = :empno
             and  paydate > :year 
             and  paydate < :paydate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select nvl(sum(nvl(anudamt,0)),0) into :b0  from p\
kzhphis where ((empno=:b1 and paydate>:b2) and paydate<:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )390;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&tmp_anudamt;
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
          sqlstm.sqhstv[2] = (unsigned char  *)year;
          sqlstm.sqhstl[2] = (unsigned long )5;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)paydate;
          sqlstm.sqhstl[3] = (unsigned long )9;
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


          
          if (sqlca.sqlcode != 0) 
          {
              print_errmsg(sqlca.sqlcode,"급여이력읽기 오류...");
              sprintf(log_buff, " 급여이력읽기 오류...."); 
              Write_batlog(seqno++, log_buff);                
              /* EXEC SQL CLOSE cursor3; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 14;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )421;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              error_quit("작업실패...");  
          }
          
          /*연금보험료 당월까지누적분(tmp_anudamt+anudamt)/급여개월수*12에서 
            당월연금보험료 * 12 로 변경 공제
          EXEC  SQL 
          update pkzmpmas     --set      anuded    = (:tmp_anudamt + nvl(anudamt,0)) / :paycount * 12 
             set anuded = nvl(anudamt,0) * 12
           where empno  = :empno;
          */
          
          /* EXEC  SQL 
          update pkzmpmas     /oset      anuded    = (:tmp_anudamt + nvl(anudamt,0)) / :paycount * 12 o/
             set anuded = 0
           where empno  = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pkzmpmas  set anuded=0 where empno=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )436;
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



          if (sqlca.sqlcode != 0) 
          {
              print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류3...Update_Record3");
              sprintf(log_buff, " 월급여화일 쓰기오류3....Update_Record3"); 
              Write_batlog(seqno++, log_buff);                
              /* EXEC SQL CLOSE cursor3; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 14;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )455;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              error_quit("작업실패...");
          }
     
     }
}

/******************************************************************************
  과세급여, 과세상여, 비과세급여, 비과세상여를 구해 DB에 반영하는 함수. 
******************************************************************************/
void  Get_Pays()
{  
     /* EXEC SQL 
     update pkzmpmas
        set taxpaysum   = ( nvl(fixpay,0)      + nvl(mcartaxamt,0)  + nvl(sbonamt,0)     + 
                            nvl(aidamt3,0)     + nvl(bokjisupamt,0) + nvl(medsupamt,0)   +
                            nvl(selfedutax,0)  +                                            --nvl(trainsupamt,0) + 
                            nvl(taxpay1,0)     + nvl(taxpay2,0)     + nvl(taxpay3,0)     + 
                            nvl(taxpay4,0)     + nvl(taxpay5,0)     + nvl(taxpay6,0)     +
                            nvl(taxpay7,0)     + nvl(taxpay8,0)) , 
            notaxpaysum = ( nvl(mcaramt,0)     - nvl(mcartaxamt,0)  + 
                            nvl(selfeduamt,0)  - nvl(selfedutax,0)  +
                            nvl(notaxpay1,0)   + nvl(notaxpay2,0)   + 
                            nvl(notaxpay3,0)   + nvl(notaxpay4,0)    )
      where empno >= :frempno and  empno <= :toempno
        and upper(nvl(payyn,'N')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkzmpmas  set taxpaysum=((((((((((((((nvl(fixpay\
,0)+nvl(mcartaxamt,0))+nvl(sbonamt,0))+nvl(aidamt3,0))+nvl(bokjisupamt,0))+nv\
l(medsupamt,0))+nvl(selfedutax,0))+nvl(taxpay1,0))+nvl(taxpay2,0))+nvl(taxpay\
3,0))+nvl(taxpay4,0))+nvl(taxpay5,0))+nvl(taxpay6,0))+nvl(taxpay7,0))+nvl(tax\
pay8,0)),notaxpaysum=(((((((nvl(mcaramt,0)-nvl(mcartaxamt,0))+nvl(selfeduamt,\
0))-nvl(selfedutax,0))+nvl(notaxpay1,0))+nvl(notaxpay2,0))+nvl(notaxpay3,0))+\
nvl(notaxpay4,0)) where ((empno>=:b0 and empno<=:b1) and upper(nvl(payyn,'N')\
)='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )470;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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

  
                           
     if (sqlca.sqlcode != 0) 
     {
         print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류6...");
         sprintf(log_buff, " 월급여화일 쓰기오류6...");
         Write_batlog(seqno++, log_buff);                
         error_quit("작업실패...");
     }
     
     /* EXEC SQL 
     update pkzmpmas
        set paysum  = taxpaysum + notaxpaysum
      where empno  >= :frempno and empno <= :toempno
        and upper(nvl(payyn,'N')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkzmpmas  set paysum=(taxpaysum+notaxpaysum) whe\
re ((empno>=:b0 and empno<=:b1) and upper(nvl(payyn,'N'))='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )493;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


      
     if (sqlca.sqlcode != 0) 
     {
         print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류7...");
         sprintf(log_buff, " 월급여화일 쓰기오류7....");
         Write_batlog(seqno++, log_buff);                
         error_quit("작업실패...");
     }
}

void  Process_Calc()
{
     /* EXEC SQL 
     select  trim(presempno)
       into  :president_empno
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select trim(presempno) into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )516;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)president_empno;
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


       
     if (sqlca.sqlcode != 0)
     {
        print_errmsg(sqlca.sqlcode,"사장님사번을 구하는 과정에서 Error...");
        sprintf(log_buff, "사장님사번을 구하는 과정에서 Error."); 
        Write_batlog(seqno++, log_buff);                        
        error_quit("작업실패...");
     }
     
     /* EXEC SQL  /o 전체 초기화. o/
     UPDATE Pkzmpmas
        SET empamt = 0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pkzmpmas  set empamt=0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )535;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        
     /*if (strcmp(incentiveyn, "Y") != 0 )  상여만 따로 나가는때에 고용보험료 0원으로 처리. => dsa2000 2018.03. 고용보험료는 항상 공제토록 주석처리*/
     {            
     	    /* 과세총액 기준으로 계산로직 변경 2011.01.(pkcemtbl 테이블 사용하는 로직 삭제) */
          /* EXEC SQL  
          UPDATE Pkzmpmas A
             SET EMPAMT = (SELECT nvl( FLOOR( A.taxpaysum * B.emprate / 100 / 10 ) * 10 , 0 )
                             FROM pkzcpbas B )
           WHERE EMPNO  >= :frempno AND EMPNO <= :toempno
             AND PAYYN   = 'Y'
             AND '19'||substr(juminid,1,4) > to_char(add_months(to_date(empdate,'YYYYMMDD'), -780),'yyyymm') /o해당 입사월 65세 이상일경우 고용보험 징수대상에서 제외 2014.02 한정미씨 요청o/
             AND Empno         <> :president_empno                                       /o사장님   고용보험료 납부안함o/
             AND Nvl(Trim(paydunm),' ') <> '사외이사'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update Pkzmpmas A  set EMPAMT=(select nvl((FLOOR((\
((A.taxpaysum* B.emprate)/100)/10))* 10),0)  from pkzcpbas B ) where (((((EMP\
NO>=:b0 and EMPNO<=:b1) and PAYYN='Y') and ('19'||substr(juminid,1,4))>to_cha\
r(add_months(to_date(empdate,'YYYYMMDD'),(-780)),'yyyymm')) and Empno<>:b2) a\
nd Nvl(trim(paydunm),' ')<>'사외이사')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )550;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)frempno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)toempno;
          sqlstm.sqhstl[1] = (unsigned long )5;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)president_empno;
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

                                   /*사외이사 고용보험료 납부안함 dsa2000 2018.03. nvl처리 */
             /*AND Trim(paydunm) <> '사외이사';                                            사외이사 고용보험료 납부안함*/
           
          if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
              print_errmsg(sqlca.sqlcode,"8. 고용 보험료 setting Error");
              sprintf(log_buff, "8. 고용 보험료 setting Error"); 
              Write_batlog(seqno++, log_buff);                
              error_quit("작업실패...");              
          }
     }
}

/*****************************************************************************
  공제금합을 계산하는 루틴.
*****************************************************************************/
void  Get_DedSum()
{  
     /*상여만 지급시에는 국민연금/건강보험 0원으로 처리 추가 dsa2000  2018.03.*/
	   if (strcmp(incentiveyn, "Y") == 0 ) 
	   {
       /* EXEC SQL 
       update  pkzmpmas  
          set  anudamt =0, meddamt=0, longmtamt=0
        where  empno >= :frempno and empno <= :toempno
          and  upper(nvl(payyn,'N')) = 'Y'; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 14;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update pkzmpmas  set anudamt=0,meddamt=0,longmtamt=0 \
where ((empno>=:b0 and empno<=:b1) and upper(nvl(payyn,'N'))='Y')";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )577;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)frempno;
       sqlstm.sqhstl[0] = (unsigned long )5;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


                                 
       if (sqlca.sqlcode != 0) 
       {
           print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류8.5 ...");
           sprintf(log_buff, " 월급여화일 쓰기오류8.5..."); 
           Write_batlog(seqno++, log_buff);                
           error_quit("작업실패...");
       }
	   }/*================================================================*/
	   
     /* EXEC SQL 
     update  pkzmpmas  
        set  dedsum = nvl(anudamt,0)   + nvl(meddamt,0)   + nvl(longmtamt,0) + nvl(empamt,0)    +   /o longmtamt 추가 o/
                      nvl(SaveAmt3,0)  + nvl(ticketamt,0) + nvl(sauamt,0)    + nvl(igamt,0)     +
                      nvl(dedamt0,0)   +                                                            /o 기타공제0 차량대여료추가 o/
                      nvl(dedamt1,0)   + nvl(dedamt2,0)   + nvl(dedamt3,0)   + nvl(dedamt4,0)   +
                      nvl(dedamt5,0)   + nvl(dedamt6,0)   + nvl(dedamt7,0)   + nvl(dedamt8,0)   +
                      nvl(meddedamt,0) +                                                            /o 2015.01 jissi 의료비대출 공제항목 추가. 손필영M 한정미 요청o/
                      nvl(hsorgamt,0)  + nvl(hsintamt,0)  + 
                      nvl(sacorpcp,0)  + nvl(sacorpamt,0) + nvl(sabankcp,0)  + nvl(sabankamt,0) +   /o sacorpcp,sabankcp 추가 o/
                      nvl(sangamt,0)   + nvl(nbamt,0)     + nvl(intax,0)     + nvl(jutax,0)
      where  empno >= :frempno and empno <= :toempno
        and  upper(nvl(payyn,'N')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkzmpmas  set dedsum=(((((((((((((((((((((((((((\
nvl(anudamt,0)+nvl(meddamt,0))+nvl(longmtamt,0))+nvl(empamt,0))+nvl(SaveAmt3,\
0))+nvl(ticketamt,0))+nvl(sauamt,0))+nvl(igamt,0))+nvl(dedamt0,0))+nvl(dedamt\
1,0))+nvl(dedamt2,0))+nvl(dedamt3,0))+nvl(dedamt4,0))+nvl(dedamt5,0))+nvl(ded\
amt6,0))+nvl(dedamt7,0))+nvl(dedamt8,0))+nvl(meddedamt,0))+nvl(hsorgamt,0))+n\
vl(hsintamt,0))+nvl(sacorpcp,0))+nvl(sacorpamt,0))+nvl(sabankcp,0))+nvl(saban\
kamt,0))+nvl(sangamt,0))+nvl(nbamt,0))+nvl(intax,0))+nvl(jutax,0)) where ((em\
pno>=:b0 and empno<=:b1) and upper(nvl(payyn,'N'))='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )600;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
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


                               
     if (sqlca.sqlcode != 0) 
     {
         print_errmsg(sqlca.sqlcode,"월급여화일 쓰기오류9...");
         sprintf(log_buff, " 월급여화일 쓰기오류9..."); 
         Write_batlog(seqno++, log_buff);                
         error_quit("작업실패...");
     }
}
/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void   print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
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
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )623;
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
          return(FAIL);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )664;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}