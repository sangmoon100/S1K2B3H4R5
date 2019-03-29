
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
    "pkz4023g.pc"
};


static unsigned int sqlctx = 156483;


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
   unsigned char  *sqhstv[54];
   unsigned long  sqhstl[54];
            int   sqhsts[54];
            short *sqindv[54];
            int   sqinds[54];
   unsigned long  sqharm[54];
   unsigned long  *sqharc[54];
   unsigned short  sqadto[54];
   unsigned short  sqtdso[54];
} sqlstm = {12,54};

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

 static char *sq0001 = 
"select NVL(TAXPAYFR,0) ,NVL(TAXPAYTO,0) ,NVL(TAXRATE,0) ,NVL(YEARDED,0)  fr\
om PKCPTAX where TAXNUM=(select CTAXNUM  from PKCPBAS )           ";

 static char *sq0017 = 
"select A.* , case  when EMPDATE_CALC<='20121231' then EMPDATE_CALC else '' \
 end  EMPDATE_2012 , case  when EMPDATE_CALC<='20121231' then LEAST(RETDATE_C\
ALC,'20121231') else ''  end  RETDATE_2012 , case  when RETDATE_CALC>='201301\
01' then GREATEST(EMPDATE_CALC,'20130101') else ''  end  EMPDATE_2013 , case \
 when RETDATE_CALC>='20130101' then RETDATE_CALC else ''  end  RETDATE_2013 ,\
 case  when LIMITDATE is  not null  then GREATEST(LIMITDATE,'20120101') else \
GREATEST(EMPDATE,'20120101')  end  LIMITDATE_CALC  from (select EMPNO ,EMPDAT\
E ,RETDATE , case  when BRETFRDAY is  not null  then LEAST(EMPDATE,BRETFRDAY)\
 else EMPDATE  end  EMPDATE_CALC , case  when BRETTODAY is  not null  then GR\
EATEST(RETDATE,BRETTODAY) else RETDATE  end  RETDATE_CALC ,LIMITDATE  from PK\
ZRTMAS where EMPNO like :b0) A            ";

 static char *sq0019 = 
"select EMPNO ,NVL(REALYY_CALC,0) ,NVL(REALYY_2012,0) ,NVL(REALYY_2013,0) ,N\
VL(AVGGROSS,0) ,NVL(COMMONAMT,0) ,NVL(ADDRATE,0) ,NVL(RETRATE,0) ,NVL(LIMITAM\
T_2011,0) ,NVL(LIMITAVGPAY,0) ,NVL(LIMITMM_2012,0) ,NVL(LIMITAMT_2012,0) ,NVL\
(LIMITRETAMT,0) ,NVL(LIMITOVERAMT,0) ,NVL(RETAMT_2011,0) ,NVL(LIMITMM_2011,0)\
 ,LIMITGUBUN ,NVL(REALMM_CALC,0) ,NVL(RETAMT,0) ,NVL(BRETAMT,0) ,NVL(HORRETAM\
T,0) ,NVL(BRETINTAX,0) ,NVL(BRETJUTAX,0)  from PKZRTMAS where EMPNO like :b0 \
          ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,141,0,9,312,0,0,0,0,0,1,0,
20,0,0,1,0,0,13,323,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
51,0,0,1,0,0,15,337,0,0,0,0,0,1,0,
66,0,0,2,62,0,5,420,0,0,0,0,0,1,0,
81,0,0,3,62,0,5,424,0,0,0,0,0,1,0,
96,0,0,4,62,0,5,428,0,0,0,0,0,1,0,
111,0,0,5,62,0,5,432,0,0,0,0,0,1,0,
126,0,0,6,62,0,5,436,0,0,0,0,0,1,0,
141,0,0,7,247,0,5,440,0,0,1,1,0,1,0,1,97,0,0,
160,0,0,8,124,0,5,460,0,0,1,1,0,1,0,1,97,0,0,
179,0,0,9,112,0,5,477,0,0,1,1,0,1,0,1,97,0,0,
198,0,0,10,643,0,5,482,0,0,1,1,0,1,0,1,97,0,0,
217,0,0,11,141,0,5,517,0,0,1,1,0,1,0,1,97,0,0,
236,0,0,12,172,0,5,533,0,0,1,1,0,1,0,1,97,0,0,
255,0,0,13,221,0,5,553,0,0,1,1,0,1,0,1,97,0,0,
274,0,0,14,170,0,5,573,0,0,1,1,0,1,0,1,97,0,0,
293,0,0,15,207,0,5,591,0,0,1,1,0,1,0,1,97,0,0,
312,0,0,16,108,0,5,608,0,0,1,1,0,1,0,1,97,0,0,
331,0,0,17,810,0,9,641,0,0,1,1,0,1,0,1,97,0,0,
350,0,0,17,0,0,13,645,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
409,0,0,17,0,0,15,651,0,0,0,0,0,1,0,
424,0,0,17,0,0,15,657,0,0,0,0,0,1,0,
439,0,0,18,574,0,5,721,0,0,34,34,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,
1,97,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,
0,0,
590,0,0,19,470,0,9,780,0,0,1,1,0,1,0,1,97,0,0,
609,0,0,19,0,0,13,786,0,0,23,0,0,1,0,2,97,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,3,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,3,0,0,2,97,0,0,2,3,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
716,0,0,19,0,0,15,802,0,0,0,0,0,1,0,
731,0,0,20,1000,0,5,943,0,0,54,54,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,
97,0,0,
962,0,0,21,335,0,4,1013,0,0,6,2,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,4,0,0,
1,3,0,0,
1001,0,0,22,461,0,4,1028,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
1052,0,0,23,571,0,4,1048,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
1103,0,0,24,276,0,4,1066,0,0,5,2,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,4,0,0,1,3,0,0,
1138,0,0,25,384,0,4,1078,0,0,9,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1189,0,0,26,50,0,3,1093,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1230,0,0,27,0,0,29,1103,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkz4023g(임원 퇴직자 퇴직금 계산)  : 지급률은 HR팀에서 계산하고 있음.
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 임원 퇴직정산
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2008.12

지급율 산정  : 임원 지급율은 정규직과 달라 현업에서 받아서 pkhrtdir에 업데이트 함.(수작업)

Update Contents
   Version    date(yy.mm.dd)   programmer   description     relevant doc.no
     1.00     2008.12          강륜종       최초개발본      pkq2075g.pc 기반으로 생성.
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

     char empno[5];
     char empdate[9];
     char retdate[9];
     int  dutydd;
     int  dutymm;
     int  exdd;
     int  realdd;
     int  realmm;
     int  realyy;    
         
     int  bretmm;
     int  realyy2013;         //2013.01.01이후에 해당하는 근속년수     
    
    double avggross;
    double commonamt;
    double addrate; 
    double retrate; 
    double retamt;
    double bretamt;
    double horretamt; 
    double retamtsum;
    double fixded;
    double conded;
    double rinded;
    double rinamt;
    double taxstamt; 
    double avgtaxstamt;
    double retavgtaxstamt;
    double rettaxrate;
    double retavgtax;
    double retavgcalctax;
    double retcalctax;
    
    double calcintax;
    double calcjutax;
    
    double retintax;
    double retjutax;
    double bretintax;
    double bretjutax;
    double realretintax;
    double realretjutax;
    double yintax; 
    double yjutax; 
    double retrealamt;
    double retreal;
    char   horretyn[2];

    double tnextyearamt;     /*과세이연금 관련 추가*/
    double nrate; 
    double nintax; 
    double njutax; 

 /*2011.12.31 이전 임원 한도 변수*/    
     int   dutydd_limit1;
     int   dutymm_limit1;
     int   exdd_limit1;
     int   realdd_limit1;
     int   realmm_limit1;
     int   realyy_limit1;    

 /*2012.01.01 이후 임원 한도 변수*/    
     int   dutydd_limit2;
     int   dutymm_limit2;
     int   exdd_limit2;
     int   realdd_limit2;
     int   realmm_limit2;
     int   realyy_limit2;
     
   double  limitamt_2011;
   double  limitavgpay;
     int   limitmm_2012;
   double  limitamt_2012;
   double  limitretamt;
   double  limitoveramt;
 /*2015.12.16 기존계산방식/개정안분방식 한도계산*/   
   double  retamt_2011;
     int   limitmm_2011;
     char  limitgubun[5];
     char  realempdate[9];
     char  realretdate[9];   
     char  limitdate[9];       /* 2018.06.07 eyha add */              
     char  limitdate_calc[9];  /* 2018.06.07 eyha add */              
    
 /*정산 변수*/
     char  empdate_calc[9];
     char  retdate_calc[9];          
     int   dutydd_calc;  
     int   dutymm_calc;       
     int   exdd_calc;    
     int   realdd_calc;
     int   realmm_calc;
     int   realyy_calc;     
    
 /*2012.12.31 이전 변수*/
     char  empdate_2012[9];
     char  retdate_2012[9];          
     int   dutydd_2012;  
     int   dutymm_2012;       
     int   exdd_2012;    
     int   realdd_2012;
     int   realmm_2012;
     int   realyy_2012;   

    double taxstamt_2012; 
    double avgtaxstamt_2012;    
    double retavgtaxstamt_2012;    
    double rettaxrate_2012;
    double retavgtax_2012;
    double retavgcalctax_2012;    
    double retcalctax_2012;
    double retintax_2012;       
     
/*2013.01.01 이후 변수*/     
     char  empdate_2013[9];
     char  retdate_2013[9];          
     int   dutydd_2013;  
     int   dutymm_2013;       
     int   exdd_2013;    
     int   realdd_2013;
     int   realmm_2013;
     int   realyy_2013;    
     
    double taxstamt_2013; 
    double avgtaxstamt_2013;    
    double retavgtaxstamt_2013;    
    double rettaxrate_2013;
    double retavgtax_2013;
    double retavgcalctax_2013;    
    double retcalctax_2013;
    double retintax_2013;  

/*2016.01.01 이후 변수*/       
    double change_pay_2016;   
    double change_payded_2016;
    double taxstamt_2016;     
    double rettaxrate_2016;   
    double retavgtax_2016;    
    double retcalctax_2016;   
    double retintax_2016;     
     char  rettaxyy[5];          
    double retintax_calc;     
    
    struct
    {      double taxfr   ;
           double taxto   ;
           double taxrate ;
           double yearded ;
    } taxtbl[10];
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

const int LASTRET_Y = -2;
const int LASTRET_N = -3;

char cmdline[256];
char userid[10] ;
char log_rundate[16]     = ""; 
char log_progid[16]      = "";
char log_writeman[5]     = "";
char log_buff[100]       = "";
char calcempno[5]        = "";

int  id;
int  seqno = 0; 
int  taxtblcnt=0;
int  taxtblidx=0;

void main(argc,argv)
int argc;
char *argv[];
{       
     char FL_file[255];
     
     if (argc != 5) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkz4023g D006 pkz4023g % 2008123100000 */
              printf("[Usage] : pkz4023g  1.작업자사번 2.프로그램ID 3.특정사번만 계산시 사번 4.시작시간 \n");  
              exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkz4023g");
     
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }  
     
     hinsa_log_print(0,"퇴직자 퇴직금 계산 시작...");
     
     hinsa_db_connect();  /*DB Connect 실시..*/
       
     strcpy(log_writeman,   argv[1]);
     strcpy(log_progid,     argv[2]);
     strcpy(calcempno,      argv[3]);
     strcpy(log_rundate,    argv[4]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     printf("퇴직금 계산 시작...........\n");
     sprintf(log_buff, "퇴직금 계산 시작...........\n");
     Write_batlog(seqno++, log_buff); 
     
     CalcRetAmt();   
     printf("퇴직정산 기초자료 계산 끝...........\n");   
           
     /* hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [퇴직금 계산 작업성공] =====");
          Write_batlog(seqno++, log_buff); 
          hinsa_exit(0,"OK ====== [퇴직금 계산 작업성공] =====");
     }       
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

ClearVar()
{
     memset(empno,'\0',sizeof(empno));
     
     realyy_calc = realyy_2012 = realyy_2013 = 0;       
     
     avggross = commonamt = addrate = retrate = 0; 
     
     limitamt_2011=limitavgpay=limitmm_2012=limitamt_2012=limitretamt=limitoveramt=0;
     /*2015.12.16 개정안분방식 한도계산 추가*/
     retamt_2011=limitmm_2011 =0;
     memset(limitgubun,'\0',sizeof(limitgubun));
     
     retamt = bretamt = horretamt = bretintax= bretjutax = retamtsum = 0;
     fixded = conded  = rinded    = rinamt = taxstamt = 0; 
     rettaxrate = avgtaxstamt = retavgtax = retcalctax = 0;
     retintax = retjutax = bretintax = bretjutax = 0;
     realretintax = realretjutax = retrealamt = retreal = 0;
     
     memset(horretyn,'\0',sizeof(horretyn));    
     
     tnextyearamt = nrate     = nintax      = njutax         = 0;
          
     taxstamt_2012 = avgtaxstamt_2012  = retavgtaxstamt_2012 = rettaxrate_2012 = retavgtax_2012 = retavgcalctax_2012 = retcalctax_2012  = retintax_2012 = 0;
     taxstamt_2013 = avgtaxstamt_2013  = retavgtaxstamt_2013 = rettaxrate_2013 = retavgtax_2013 = retavgcalctax_2013 = retcalctax_2013  = retintax_2013 = 0;

     /*2015.12.30 jissi 2016년 개정세법 */
     change_pay_2016 = change_payded_2016 = taxstamt_2016= rettaxrate_2016 = retavgtax_2016 = retcalctax_2016 = retintax_2016 =retintax_calc = 0;
     memset(rettaxyy,'\0',sizeof(rettaxyy));

     calcintax = calcjutax = 0; /*신고대상 세액*/     
     retintax  = retjutax  = 0; /*신고대상 세액(원단위 절삭)*/
     nintax    = njutax    = 0; /*과세이연 세액*/ 
     yintax    = yjutax    = 0;    
     
}

/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()
{
     int i=0;

     /* EXEC SQL DECLARE ctax CURSOR FOR
     SELECT NVL(TAXPAYFR,0), NVL(TAXPAYTO,0), NVL(TAXRATE,0), NVL(YEARDED,0)
       FROM PKCPTAX
      WHERE TAXNUM = (Select CTAXNUM From PKCPBAS); */ 


     /* EXEC SQL OPEN ctax; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0001;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
           Write_batlog(seqno++, "연세율표  fetch Error");  
           err_print(sqlca.sqlcode,"연세율표  fetch Error");
           exit(1);
     }

     while(1)
     {
          /* EXEC SQL FETCH ctax INTO
          :taxtbl[i].taxfr,     :taxtbl[i].taxto,
          :taxtbl[i].taxrate,   :taxtbl[i].yearded; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )20;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(taxtbl[i].taxfr);
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(taxtbl[i].taxto);
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(taxtbl[i].taxrate);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(taxtbl[i].yearded);
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
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
            Write_batlog(seqno++, "연말정산 기초자료   read Error");  
            err_print(sqlca.sqlcode,"연말정산 기초자료 read Error");
            exit(1);
          }

          if (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close ctax; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )51;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               taxtblcnt = i;
               break;
          }
          i++;
     }
}

double GetTax(double taxlevel)
{
     int i;
     double res;
     
     if (taxlevel <= 0 )
       return 0 ;
     
     for (i=0 ;i <taxtblcnt ; ++i)
     {
          if ((taxtbl[i].taxfr < taxlevel) && (taxtbl[i].taxto >= taxlevel))
          {
                res = taxlevel * taxtbl[i].taxrate / 100;
                res = floor(res - taxtbl[i].yearded);
                taxtblidx = i;
               return res;
          }
     }
}

/*==============================================================================*/
CalcRetAmt()
{
      int    tmpmm;
      int    p_lastret = 0;
      char   meg[2000] ;        
      char   *HOMEDIR; /*MIS2*/
      
      double avgtaxstamt_a, avgtaxstamt_b, retavgtax_a, retavgtax_b, retcalctax_a, retcalctax_b; 
      double cretcalctax, cmretcalctax;
      
      memset(meg,'\0',sizeof(meg));
      
      HOMEDIR = hinsa_home();
      strcat(HOMEDIR,"/proc");
      
      ReadTax(); 
      
      /* 대부분 임원의 최초입사일로 
      EXEC SQL
      UPDATE  PKZRTMAS A
         SET (EMPDATE, RETDATE ) 
           = (Select OrgEmpdate, NVL(RETDATE,A.RETDATE)  
                From PKZMPMAS  B
               Where A.EMPNO = B.EMPNO)
       Where  Empno like :calcempno;
    
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
          err_print(sqlca.sqlcode,"1.1 근속기간 setting Error");
          sprintf(log_buff, "1.1 근속기간 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
      }*/
      
      /*SKT에서 넘어온 임원은 SKB 입사일로 Setting.(SKT에서 정산을 하였기에) : 2009.01 김미진 요청.*/      
      /*퇴직자 추출 및 관리 프로그램에서 입력하므로 궅이 여기서 다시 넣어줄 필요가 없음 jissi
      EXEC SQL
      UPDATE  PKZRTMAS A
         SET (EMPDATE, RETDATE ) =
             (Select nvl(OrgEmpdate,Empdate),   NVL(RETDATE,A.RETDATE)  
                From PKZMPMAS  B
               Where A.EMPNO = B.EMPNO)
       Where  Empno like :calcempno; -- Where (A.empno Between 'M125' and 'M135') or (A.empno ='M095'); 
      
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
          err_print(sqlca.sqlcode,"1.1 SKB입사일로 근속기간 setting Error");
          sprintf(log_buff, "1.1 SKB입사일로 근속기간 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
      }
      */
      /*================================================================================================*/
      /* 투자회사 퇴직금 승계건으로 입사일을 변경. 2009.01.21 김미진 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A SET  EMPDATE = '20050101' Where A.empno = 'M112' ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE='20050101' where A.empn\
o='M112'";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )66;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



      /* 투자회사 퇴직금 승계건으로 입사일을 변경. 2013.02.08 박찬일 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A SET  EMPDATE = '19981207' Where A.empno = 'M141' ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE='19981207' where A.empn\
o='M141'";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )81;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


      
      /* 투자회사 퇴직금 승계건으로 입사일을 변경. 2013.12.23 손필영 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A SET  EMPDATE = '20100101' Where A.empno = 'M147' ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE='20100101' where A.empn\
o='M147'";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )96;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
            
      /* 투자회사 퇴직금 승계건으로 입사일을 변경. 2013.12.23 손필영 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A SET  EMPDATE = '20060201' Where A.empno = 'M154' ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE='20060201' where A.empn\
o='M154'";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )111;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      
      
      /* 투자회사 퇴직금 승계건으로 입사일을 변경. 2013.12.23 손필영 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A SET  EMPDATE = '20100101' Where A.empno = 'M157' ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE='20100101' where A.empn\
o='M157'";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )126;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      
      /*================================================================================================*/
      /* 중간정산 한 사람에 대해서 입사일을 중간정산지급일 다음날로 한다..*/
      /* EXEC SQL
      UPDATE PKZRTMAS A
         SET EMPDATE = (Select TO_CHAR(TO_DATE(NVL(MAX(SUBDATE),MAX(MRTODATE)),'YYYYMMDD') + 1 ,'YYYYMMDD')
                          From PKZMRHIS B  
                         Where A.EMPNO = B.EMPNO
                         GROUP BY B.EMPNO )
       /oWhere EMPNO IN (Select EMPNO From PKZMRHIS Where Mrtodate < Substr(retdate,1,4)||'0101') 올해 정산자 제외.o/
       Where EMPNO IN (Select distinct EMPNO From PKZMRHIS)
         And EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set EMPDATE=(select TO_CHAR((TO_DAT\
E(NVL(max(SUBDATE),max(MRTODATE)),'YYYYMMDD')+1),'YYYYMMDD')  from PKZMRHIS B\
 where A.EMPNO=B.EMPNO group by B.EMPNO) where (EMPNO in (select distinct EMP\
NO  from PKZMRHIS ) and EMPNO like :b0)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )141;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


    
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
        err_print(sqlca.sqlcode,"1. 중간정산자료 setting Error ");
        sprintf(log_buff, "1. 중간정산자료 setting Error ");
        Write_batlog(seqno++, log_buff); 
        exit(1);
      }  
      
      /* 명퇴시 SKB입사일 MEMPDATE 에 넣음 2010.06.23 KTH 시작  */
      /*SKT에서 넘어온 임원은 SKB 입사일로 Setting.(SKT에서 정산을 하였기에) : 2009.01 김미진 요청.*/ 
      /* EXEC SQL
      UPDATE  PKZRTMAS A
         SET  MEMPDATE = (SELECT  nvl(OrgEmpdate,Empdate)
                            FROM  PKZMPMAS  B
                           WHERE  A.EMPNO = B.EMPNO)
      Where EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set MEMPDATE=(select nvl(OrgEmpdate\
,Empdate)  from PKZMPMAS B where A.EMPNO=B.EMPNO) where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )160;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

     
      
     
      if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {
           err_print(sqlca.sqlcode,"1. 명퇴자 SKB입사일 입력  setting Error ");
           sprintf(log_buff, "1. 명퇴자 SKB입사일 입력 setting Error ");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      }     
      /*================================================================================================*/
      /*초기화.*/
      /* EXEC SQL
      UPDATE PKZRTMAS A
         SET BRETMM = 0, BRETAMT = 0, BRETINTAX = 0, BRETJUTAX = 0, BRETFRDAY = '', BRETTODAY = ''
       Where EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set BRETMM=0,BRETAMT=0,BRETINTAX=0,\
BRETJUTAX=0,BRETFRDAY='',BRETTODAY='' where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )179;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


         
      /* EXEC SQL
      UPDATE  PKZRTMAS A
         SET (BRETMM, BRETAMT, BRETINTAX, BRETJUTAX, BRETFRDAY, BRETTODAY, BRETSUBDATE ) 
           = (Select SUM(NVL(RETMM       ,0)), 
                     SUM(NVL(RETAMT      ,0)),
                     SUM(NVL(REALRETINTAX,0)), 
                     SUM(NVL(REALRETJUTAX,0)),
                     MIN(MRFRDATE)           , 
                     /o2015.12.16 jissi 중간정산 퇴직일을 중간정산지급일로 변경(소득세법시행령 43조2항)
                     MAX(MRTODATE)           ,
                     MAX(SUBDATE)             o/
                     case when MAX(SUBDATE) is not null 
                          then MAX(SUBDATE) else MAX(MRTODATE) end BRETTODAY,
                     case when MAX(SUBDATE) is not null 
                          then MAX(SUBDATE) else MAX(MRTODATE) end SUBDATE 
                From PKZMRHIS B
               Where A.EMPNO = B.EMPNO
                 /oAND SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)o/
                 AND ((NVL(A.MRALLYN,'N') ='Y') or ((NVL(A.MRALLYN,'N') ='N') and (SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4))))
               GROUP BY B.EMPNO )
       Where EMPNO IN (Select EMPNO From PKZMRHIS B
                        Where A.EMPNO = B.EMPNO
                          /oAND SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)o/ 
                       )
                          /oAnd Mrtodate < Substr(retdate,1,4)||'0101' ) 올해 정산자 제외.o/
         And  EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set (BRETMM,BRETAMT,BRETINTAX,BRETJ\
UTAX,BRETFRDAY,BRETTODAY,BRETSUBDATE)=(select sum(NVL(RETMM,0)) ,sum(NVL(RETA\
MT,0)) ,sum(NVL(REALRETINTAX,0)) ,sum(NVL(REALRETJUTAX,0)) ,min(MRFRDATE) , c\
ase  when max(SUBDATE) is  not null  then max(SUBDATE) else max(MRTODATE)  en\
d  BRETTODAY , case  when max(SUBDATE) is  not null  then max(SUBDATE) else m\
ax(MRTODATE)  end  SUBDATE  from PKZMRHIS B where (A.EMPNO=B.EMPNO and (NVL(A\
.MRALLYN,'N')='Y' or (NVL(A.MRALLYN,'N')='N' and SUBSTR(A.RETDATE,1,4)=SUBSTR\
(B.MRTODATE,1,4)))) group by B.EMPNO) where (EMPNO in (select EMPNO  from PKZ\
MRHIS B where A.EMPNO=B.EMPNO) and EMPNO like :b0)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )198;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


    
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {  
        err_print(sqlca.sqlcode,"1. 중간정산자료 setting Error 2");
        sprintf(log_buff, "1. 중간정산자료 setting Error 2");
        Write_batlog(seqno++, log_buff); 
        exit(1);
      }
            
      /* EXEC SQL
      UPDATE PKZRTMAS A
         SET BRETMM    = NVL(BRETMM    ,0),
             BRETAMT   = NVL(BRETAMT   ,0),
             BRETINTAX = NVL(BRETINTAX ,0),
             BRETJUTAX = NVL(BRETJUTAX ,0)
       WHERE EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS A  set BRETMM=NVL(BRETMM,0),BRETAMT=NV\
L(BRETAMT,0),BRETINTAX=NVL(BRETINTAX,0),BRETJUTAX=NVL(BRETJUTAX,0) where EMPN\
O like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )217;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

    
      /*================================================================================================*/
      
      /*지급율 산정 : 임원 지급율은 퇴직금 지급/공제 관리(PKZ4030A)에서 직접입력하여 계산.
        또는 현업에서 개인별 데이터를 받아 pkhrtdir에 Insert 후에 작업.(수작업) 또는 지급/공제관리 프로그램에서 담당자가 지급률 직접 입력.        
      insert into pkhrtdir (calcdate, empno, korname, empdate,  clfrdate ,  cltodate , clretrate, writetime , writeman) 
      select     '20091231' calcdate, empno, korname, empdate, '20090101', '20091231', 1.1      , '20091222', 'D006'
        from pkzmpmas
       where empno in (select empno from pkzrtmas) and empno='M133' */
      
      /* EXEC SQL
      UPDATE  PKZRTMAS P
         SET (RETRATE, ADDRATE) = (select nvl(sum(clretrate),1), 1 
                                     from pkhrtdir
                                    where p.empno   = empno 
                                      and calcdate >= '20081231'
                                    group by empno)
       WHERE  EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS P  set (RETRATE,ADDRATE)=(select nvl(s\
um(clretrate),1) ,1  from pkhrtdir where (p.empno=empno and calcdate>='200812\
31') group by empno) where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )236;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


                                               
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
          err_print(sqlca.sqlcode,"2.1 지급율 산정(1) Error");
          sprintf(log_buff, "2.1 지급율 산정(1) Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
      }
       
      /*=평균 임금 계산. ==========================================================*/           
      /* 평균임금 : 퇴직금기준 총연봉/12 로 변경 : 2009.12.22 SKT 계산기준으로 변경(100단위 올림) */
      printf("평균임금 계산사번 : %s\n",calcempno);
      /* EXEC SQL
      UPDATE PKZRTMAS a
         SET AVGGROSS  = (Select Ceil( decode(nvl(RetTotpay,0),0,Totpay,nvl(RetTotpay,0)) / 12 / 1000) * 1000
                            From pkzhyhis b, pkzcpbas C
                           Where b.yearpaynum = c.yearpaynum and a.empno = b.empno ) 
       Where EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS a  set AVGGROSS=(select (Ceil(((decode\
(nvl(RetTotpay,0),0,Totpay,nvl(RetTotpay,0))/12)/1000))* 1000)  from pkzhyhis\
 b ,pkzcpbas C where (b.yearpaynum=c.yearpaynum and a.empno=b.empno)) where E\
MPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )255;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


      
      /*EXEC SQL
      select avggross into :avggross from pkzrtmas Where EMPNO Like :calcempno;      	
      printf("평균임금 : %f.0\n",avggross); */
      
      if ( sqlca.sqlcode != 0 && sqlca.sqlcode == 1403)
      {       
          err_print(sqlca.sqlcode,"3.0 평균임금 setting Error");
          sprintf(log_buff, "3.0 평균임금 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
      }
          
      /* 통상임금 산정 */
      /* EXEC SQL
      UPDATE PKZRTMAS C  
         /oSET COMMONAMT = (Select CEIL(NVL(TOTPAY,0) / 18)     *CEIL(NVL(TOTPAY,0) / 23)에서 18로 변경  2009.03.부터.o/
         SET COMMONAMT = (Select CEIL(NVL(TOTPAY,0) / 12)      /oCEIL(NVL(TOTPAY,0) / 18)에서 12로 변경  2015.01.부터.o/ 
                            From pkzcpbas A, pkzhyhis B
                           Where A.YEARPAYNUM = B.YEARPAYNUM AND C.EMPNO      = B.EMPNO )
       WHERE EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRTMAS C  set COMMONAMT=(select CEIL((NVL(TOT\
PAY,0)/12))  from pkzcpbas A ,pkzhyhis B where (A.YEARPAYNUM=B.YEARPAYNUM and\
 C.EMPNO=B.EMPNO)) where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )274;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


       
      if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
           err_print(sqlca.sqlcode,"통상임금 setting Error");
           sprintf(log_buff, "통상임금 setting Error");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      }
      /*===========================================================================*/ 

      /* 귀속일 setting.. : YSFRDATE , YSTODATE */
      /* EXEC SQL
      UPDATE PKZRYMAS a
         SET YSFRDATE = (Select GREATEST(NVL(nvl(b.OrgEmpdate,b.Empdate),substr(b.retdate,1,4)||'0101'),
                                                                         substr(b.retdate,1,4)||'0101')
                           From PKZRTMAS b
                          Where a.empno = b.empno)
       WHERE EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRYMAS a  set YSFRDATE=(select GREATEST(NVL(n\
vl(b.OrgEmpdate,b.Empdate),(substr(b.retdate,1,4)||'0101')),(substr(b.retdate\
,1,4)||'0101'))  from PKZRTMAS b where a.empno=b.empno) where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )293;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


                      
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
           err_print(sqlca.sqlcode,"귀속일From setting Error");
           sprintf(log_buff, "귀속일From setting Error");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      }

  
      /* EXEC SQL
      UPDATE PKZRYMAS a
         SET YSTODATE = (Select RETDATE
                           From PKZRTMAS b
                          Where a.empno = b.empno)
       WHERE EMPNO Like :calcempno; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKZRYMAS a  set YSTODATE=(select RETDATE  from \
PKZRTMAS b where a.empno=b.empno) where EMPNO like :b0";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )312;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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

  
        
      if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {       
           err_print(sqlca.sqlcode,"귀속일to setting Error");
           sprintf(log_buff, "귀속일to setting Error");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      } 
      
      /* EXEC SQL DECLARE c1 CURSOR FOR
      SELECT A.*,
             CASE WHEN EMPDATE_CALC <='20121231'  THEN EMPDATE_CALC                      ELSE '' END EMPDATE_2012,
             CASE WHEN EMPDATE_CALC <='20121231'  THEN LEAST(RETDATE_CALC,'20121231')    ELSE '' END RETDATE_2012,
             CASE WHEN RETDATE_CALC >='20130101'  THEN GREATEST(EMPDATE_CALC,'20130101') ELSE '' END EMPDATE_2013,
             CASE WHEN RETDATE_CALC >='20130101'  THEN RETDATE_CALC                      ELSE '' END RETDATE_2013,      
             CASE WHEN LIMITDATE IS NOT NULL THEN GREATEST(LIMITDATE,'20120101') ELSE GREATEST(EMPDATE,'20120101') END LIMITDATE_CALC  /o 2018.06.07 eyha add o/
       FROM (           
             SELECT EMPNO,
                    EMPDATE, 
                    RETDATE,
                    CASE WHEN BRETFRDAY IS NOT NULL THEN LEAST   (EMPDATE,BRETFRDAY)  ELSE EMPDATE END EMPDATE_CALC,
                    CASE WHEN BRETTODAY IS NOT NULL THEN GREATEST(RETDATE,BRETTODAY)  ELSE RETDATE END RETDATE_CALC,
                    LIMITDATE        /o 2018.06.07 eyha add o/            	
               FROM PKZRTMAS
              WHERE EMPNO Like :calcempno  
            )A; */ 

              
      /* EXEC SQL OPEN  c1 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0017;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )331;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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



      while(1)
      {
          /* EXEC   SQL FETCH c1
          INTO  :empno, :empdate, :retdate, :empdate_calc, :retdate_calc, :limitdate, :empdate_2012, :retdate_2012,:empdate_2013, :retdate_2013, :limitdate_calc ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )350;
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
          sqlstm.sqhstv[1] = (unsigned char  *)empdate;
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
          sqlstm.sqhstv[3] = (unsigned char  *)empdate_calc;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)retdate_calc;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)limitdate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)empdate_2012;
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)retdate_2012;
          sqlstm.sqhstl[7] = (unsigned long )9;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)empdate_2013;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)retdate_2013;
          sqlstm.sqhstl[9] = (unsigned long )9;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)limitdate_calc;
          sqlstm.sqhstl[10] = (unsigned long )9;
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

 /* 2018.06.07 eyha add */


          if  (sqlca.sqlcode == 1403 )
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )409;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }

          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
                /* EXEC SQL close c1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 11;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )424;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                err_print(sqlca.sqlcode,"FETCH CURSOR c1 Error\n");
                sprintf(log_buff, "FETCH CURSOR c1 Error\n");
                Write_batlog(seqno++, log_buff); 
                exit(1);
          }       

          /* 최종분 근속 연수 */
          dutydd = dutymm = exdd = realdd = realmm = realyy = 0;

          get_RealYYMMDD(empno,empdate,retdate,&dutydd,&dutymm,&exdd,&realdd,&realmm,&realyy);


          /* 정산(합산) 근속 연수 */
          dutydd_calc = dutymm_calc = exdd_calc = realdd_calc = realmm_calc = realyy_calc = 0;

          get_RealYYMMDD(empno,empdate_calc,retdate_calc,&dutydd_calc,&dutymm_calc,&exdd_calc,&realdd_calc,&realmm_calc,&realyy_calc);


          /* 2012.12.31. 이전 근속 연수 */
          dutydd_2012 = dutymm_2012 = exdd_2012 = realdd_2012 = realmm_2012 = realyy_2012 = 0;

          if((strcmp(empdate_2012,"")!=0)&&(strcmp(retdate_2012,"")!=0)  )
             get_RealYYMMDD(empno,empdate_2012,retdate_2012,&dutydd_2012,&dutymm_2012,&exdd_2012,&realdd_2012,&realmm_2012,&realyy_2012);


          /* 2013.01.01. 이후 근속 연수 */
          dutydd_2013 = dutymm_2013 = exdd_2013 = realdd_2013 = realmm_2013 = realyy_2013 = 0;

          if((strcmp(empdate_2013,"")!=0)&&(strcmp(retdate_2013,"")!=0)  )
             get_RealYYMMDD(empno,empdate_2013,retdate_2013,&dutydd_2013,&dutymm_2013,&exdd_2013,&realdd_2013,&realmm_2013,&realyy_2013);

          /* 2011.12.31. 이전 근속 연수 - 임원 */
          dutydd_limit1 = dutymm_limit1 = exdd_limit1 = realdd_limit1 = realmm_limit1 = realyy_limit1 = 0;
          
          if ( strcmp(empdate_calc,"20111231") <= 0 )
          {
             if ( strcmp(retdate_calc, "20111231") <= 0 )
                  get_RealYYMMDD(empno,empdate_calc,retdate_calc,&dutydd_limit1,&dutymm_limit1,&exdd_limit1,&realdd_limit1,&realmm_limit1,&realyy_limit1); 
             else            	
                  get_RealYYMMDD(empno,empdate_calc,  "20111231",&dutydd_limit1,&dutymm_limit1,&exdd_limit1,&realdd_limit1,&realmm_limit1,&realyy_limit1);
          }

          /* 2012.01.01. 이후 근속 연수 - 임원 */
          dutydd_limit2 = dutymm_limit2 = exdd_limit2 = realdd_limit2 = realmm_limit2 = realyy_limit2 = 0;
          
          if ( strcmp(retdate_calc,"20120101") >= 0 )
          {
          	/* 2018.06.07 eyha 임원선임일 적용
             if ( strcmp(empdate_calc,"20120101") >= 0 )
                  get_RealYYMMDD(empno,empdate_calc,retdate_calc,&dutydd_limit2,&dutymm_limit2,&exdd_limit2,&realdd_limit2,&realmm_limit2,&realyy_limit2); 
             else            	
                  get_RealYYMMDD(empno,"20120101"  ,retdate_calc,&dutydd_limit2,&dutymm_limit2,&exdd_limit2,&realdd_limit2,&realmm_limit2,&realyy_limit2);   */

             get_RealYYMMDD(empno,limitdate_calc,retdate_calc,&dutydd_limit2,&dutymm_limit2,&exdd_limit2,&realdd_limit2,&realmm_limit2,&realyy_limit2); 
                  
                  
             /*   printf("[근속기간_debug] : empno=%s,limitdate_calc=%s,retdate_calc=%s,realyy_limit2=%f \n",empno,limitdate_calc,retdate_calc, realyy_limit2);    */

                  
          }
             
          realyy_2013   = realyy_calc - realyy_2012;
                    
          /* EXEC SQL
          UPDATE  PKZRTMAS
             SET  
                  DUTYDD       = :dutydd,
                  DUTYMM       = :dutymm,
                    EXDD       =   :exdd,
                  REALDD       = :realdd,
                  REALMM       = :realmm,
                  REALYY       = :realyy,
                  REALYY2013   = :realyy_2013,
                  EMPDATE_CALC = :empdate_calc,
                  RETDATE_CALC = :retdate_calc,                      
                  DUTYDD_CALC  = :dutydd_calc,
                  DUTYMM_CALC  = :dutymm_calc,
                    EXDD_CALC  =   :exdd_calc,
                  REALDD_CALC  = :realdd_calc,
                  REALMM_CALC  = :realmm_calc,
                  REALYY_CALC  = :realyy_calc,
                  EMPDATE_2012 = :empdate_2012,
                  RETDATE_2012 = :retdate_2012,                      
                  DUTYDD_2012  = :dutydd_2012,
                  DUTYMM_2012  = :dutymm_2012,
                    EXDD_2012  =   :exdd_2012,
                  REALDD_2012  = :realdd_2012,
                  REALMM_2012  = :realmm_2012,
                  REALYY_2012  = :realyy_2012,
                  EMPDATE_2013 = :empdate_2013,
                  RETDATE_2013 = :retdate_2013,
                  DUTYDD_2013  = :dutydd_2013,
                  DUTYMM_2013  = :dutymm_2013,
                    EXDD_2013  =   :exdd_2013,
                  REALDD_2013  = :realdd_2013,
                  REALMM_2013  = :realmm_2013,
                  REALYY_2013  = :realyy_2013,
                  LIMITGUBUN   = '안분',         /o2015.12.16 jissi 추가o/
                  LIMITMM_2011 = :realmm_limit1, /o2015.12.16 jissi 추가o/
                  LIMITMM_2012 = :realmm_limit2                                                            
           WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 34;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKZRTMAS  set DUTYDD=:b0,DUTYMM=:b1,EXDD=:b\
2,REALDD=:b3,REALMM=:b4,REALYY=:b5,REALYY2013=:b6,EMPDATE_CALC=:b7,RETDATE_CA\
LC=:b8,DUTYDD_CALC=:b9,DUTYMM_CALC=:b10,EXDD_CALC=:b11,REALDD_CALC=:b12,REALM\
M_CALC=:b13,REALYY_CALC=:b14,EMPDATE_2012=:b15,RETDATE_2012=:b16,DUTYDD_2012=\
:b17,DUTYMM_2012=:b18,EXDD_2012=:b19,REALDD_2012=:b20,REALMM_2012=:b21,REALYY\
_2012=:b22,EMPDATE_2013=:b23,RETDATE_2013=:b24,DUTYDD_2013=:b25,DUTYMM_2013=:\
b26,EXDD_2013=:b27,REALDD_2013=:b28,REALMM_2013=:b29,REALYY_2013=:b6,LIMITGUB\
UN='안분',LIMITMM_2011=:b31,LIMITMM_2012=:b32 where EMPNO=:b33";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )439;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&dutymm;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&realyy;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)empdate_calc;
          sqlstm.sqhstl[7] = (unsigned long )9;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)retdate_calc;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&dutydd_calc;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&dutymm_calc;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&exdd_calc;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&realdd_calc;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&realmm_calc;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)empdate_2012;
          sqlstm.sqhstl[15] = (unsigned long )9;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)retdate_2012;
          sqlstm.sqhstl[16] = (unsigned long )9;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&dutydd_2012;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&dutymm_2012;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&exdd_2012;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&realdd_2012;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&realmm_2012;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)empdate_2013;
          sqlstm.sqhstl[23] = (unsigned long )9;
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)retdate_2013;
          sqlstm.sqhstl[24] = (unsigned long )9;
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&dutydd_2013;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&dutymm_2013;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&exdd_2013;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&realdd_2013;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&realmm_2013;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&realmm_limit1;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&realmm_limit2;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)empno;
          sqlstm.sqhstl[33] = (unsigned long )5;
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
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
           {       
                err_print(sqlca.sqlcode,"5.1 실근속년수 산정 Error");
                sprintf(log_buff, "5.1 실근속년수 산정 Error");
                Write_batlog(seqno++, log_buff); 
                exit(1);
           }           
      } /* end of while */     
      
      
      /* EXEC SQL DECLARE c2 CURSOR FOR
      Select EMPNO,                NVL(REALYY_CALC,0),  NVL(REALYY_2012,0),  NVL(REALYY_2013,0),                             
             NVL(AVGGROSS,0),      NVL(COMMONAMT,0),    NVL(ADDRATE,0),      NVL(RETRATE,0),  
             NVL(LIMITAMT_2011,0), NVL(LIMITAVGPAY,0),  NVL(LIMITMM_2012,0), NVL(LIMITAMT_2012,0),  NVL(LIMITRETAMT,0),  NVL(LIMITOVERAMT,0),     
             NVL(RETAMT_2011,0),   NVL(LIMITMM_2011,0), LIMITGUBUN,          NVL(REALMM_CALC,0),    /o2015.12.16 jissi 추가o/
             NVL(RETAMT,0),        NVL(BRETAMT,0),      NVL(HORRETAMT,0),    NVL(BRETINTAX,0),      NVL(BRETJUTAX,0)  
        From PKZRTMAS
       Where EMPNO Like :calcempno; */ 


      /* EXEC SQL OPEN  c2 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 34;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0019;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )590;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlstm.sqhstv[0] = (unsigned char  *)calcempno;
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


      
      while(1)
      {
       	   ClearVar();
      	   
           /* EXEC SQL FETCH c2
           INTO  :empno,         :realyy_calc,  :realyy_2012,  :realyy_2013,
                 :avggross,      :commonamt,    :addrate,      :retrate,       
                 :limitamt_2011, :limitavgpay,  :limitmm_2012, :limitamt_2012, :limitretamt,  :limitoveramt,
                 :retamt_2011,   :limitmm_2011, :limitgubun,   :realmm_calc,   /o2015.12.16 jissi 추가o/
                 :retamt,        :bretamt,      :horretamt,    :bretintax,     :bretjutax; */ 

{
           struct sqlexd sqlstm;
           sqlstm.sqlvsn = 12;
           sqlstm.arrsiz = 34;
           sqlstm.sqladtp = &sqladt;
           sqlstm.sqltdsp = &sqltds;
           sqlstm.iters = (unsigned int  )1;
           sqlstm.offset = (unsigned int  )609;
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
           sqlstm.sqhstv[1] = (unsigned char  *)&realyy_calc;
           sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[1] = (         int  )0;
           sqlstm.sqindv[1] = (         short *)0;
           sqlstm.sqinds[1] = (         int  )0;
           sqlstm.sqharm[1] = (unsigned long )0;
           sqlstm.sqadto[1] = (unsigned short )0;
           sqlstm.sqtdso[1] = (unsigned short )0;
           sqlstm.sqhstv[2] = (unsigned char  *)&realyy_2012;
           sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[2] = (         int  )0;
           sqlstm.sqindv[2] = (         short *)0;
           sqlstm.sqinds[2] = (         int  )0;
           sqlstm.sqharm[2] = (unsigned long )0;
           sqlstm.sqadto[2] = (unsigned short )0;
           sqlstm.sqtdso[2] = (unsigned short )0;
           sqlstm.sqhstv[3] = (unsigned char  *)&realyy_2013;
           sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[3] = (         int  )0;
           sqlstm.sqindv[3] = (         short *)0;
           sqlstm.sqinds[3] = (         int  )0;
           sqlstm.sqharm[3] = (unsigned long )0;
           sqlstm.sqadto[3] = (unsigned short )0;
           sqlstm.sqtdso[3] = (unsigned short )0;
           sqlstm.sqhstv[4] = (unsigned char  *)&avggross;
           sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[4] = (         int  )0;
           sqlstm.sqindv[4] = (         short *)0;
           sqlstm.sqinds[4] = (         int  )0;
           sqlstm.sqharm[4] = (unsigned long )0;
           sqlstm.sqadto[4] = (unsigned short )0;
           sqlstm.sqtdso[4] = (unsigned short )0;
           sqlstm.sqhstv[5] = (unsigned char  *)&commonamt;
           sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[5] = (         int  )0;
           sqlstm.sqindv[5] = (         short *)0;
           sqlstm.sqinds[5] = (         int  )0;
           sqlstm.sqharm[5] = (unsigned long )0;
           sqlstm.sqadto[5] = (unsigned short )0;
           sqlstm.sqtdso[5] = (unsigned short )0;
           sqlstm.sqhstv[6] = (unsigned char  *)&addrate;
           sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[6] = (         int  )0;
           sqlstm.sqindv[6] = (         short *)0;
           sqlstm.sqinds[6] = (         int  )0;
           sqlstm.sqharm[6] = (unsigned long )0;
           sqlstm.sqadto[6] = (unsigned short )0;
           sqlstm.sqtdso[6] = (unsigned short )0;
           sqlstm.sqhstv[7] = (unsigned char  *)&retrate;
           sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[7] = (         int  )0;
           sqlstm.sqindv[7] = (         short *)0;
           sqlstm.sqinds[7] = (         int  )0;
           sqlstm.sqharm[7] = (unsigned long )0;
           sqlstm.sqadto[7] = (unsigned short )0;
           sqlstm.sqtdso[7] = (unsigned short )0;
           sqlstm.sqhstv[8] = (unsigned char  *)&limitamt_2011;
           sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[8] = (         int  )0;
           sqlstm.sqindv[8] = (         short *)0;
           sqlstm.sqinds[8] = (         int  )0;
           sqlstm.sqharm[8] = (unsigned long )0;
           sqlstm.sqadto[8] = (unsigned short )0;
           sqlstm.sqtdso[8] = (unsigned short )0;
           sqlstm.sqhstv[9] = (unsigned char  *)&limitavgpay;
           sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[9] = (         int  )0;
           sqlstm.sqindv[9] = (         short *)0;
           sqlstm.sqinds[9] = (         int  )0;
           sqlstm.sqharm[9] = (unsigned long )0;
           sqlstm.sqadto[9] = (unsigned short )0;
           sqlstm.sqtdso[9] = (unsigned short )0;
           sqlstm.sqhstv[10] = (unsigned char  *)&limitmm_2012;
           sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[10] = (         int  )0;
           sqlstm.sqindv[10] = (         short *)0;
           sqlstm.sqinds[10] = (         int  )0;
           sqlstm.sqharm[10] = (unsigned long )0;
           sqlstm.sqadto[10] = (unsigned short )0;
           sqlstm.sqtdso[10] = (unsigned short )0;
           sqlstm.sqhstv[11] = (unsigned char  *)&limitamt_2012;
           sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[11] = (         int  )0;
           sqlstm.sqindv[11] = (         short *)0;
           sqlstm.sqinds[11] = (         int  )0;
           sqlstm.sqharm[11] = (unsigned long )0;
           sqlstm.sqadto[11] = (unsigned short )0;
           sqlstm.sqtdso[11] = (unsigned short )0;
           sqlstm.sqhstv[12] = (unsigned char  *)&limitretamt;
           sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[12] = (         int  )0;
           sqlstm.sqindv[12] = (         short *)0;
           sqlstm.sqinds[12] = (         int  )0;
           sqlstm.sqharm[12] = (unsigned long )0;
           sqlstm.sqadto[12] = (unsigned short )0;
           sqlstm.sqtdso[12] = (unsigned short )0;
           sqlstm.sqhstv[13] = (unsigned char  *)&limitoveramt;
           sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[13] = (         int  )0;
           sqlstm.sqindv[13] = (         short *)0;
           sqlstm.sqinds[13] = (         int  )0;
           sqlstm.sqharm[13] = (unsigned long )0;
           sqlstm.sqadto[13] = (unsigned short )0;
           sqlstm.sqtdso[13] = (unsigned short )0;
           sqlstm.sqhstv[14] = (unsigned char  *)&retamt_2011;
           sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[14] = (         int  )0;
           sqlstm.sqindv[14] = (         short *)0;
           sqlstm.sqinds[14] = (         int  )0;
           sqlstm.sqharm[14] = (unsigned long )0;
           sqlstm.sqadto[14] = (unsigned short )0;
           sqlstm.sqtdso[14] = (unsigned short )0;
           sqlstm.sqhstv[15] = (unsigned char  *)&limitmm_2011;
           sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[15] = (         int  )0;
           sqlstm.sqindv[15] = (         short *)0;
           sqlstm.sqinds[15] = (         int  )0;
           sqlstm.sqharm[15] = (unsigned long )0;
           sqlstm.sqadto[15] = (unsigned short )0;
           sqlstm.sqtdso[15] = (unsigned short )0;
           sqlstm.sqhstv[16] = (unsigned char  *)limitgubun;
           sqlstm.sqhstl[16] = (unsigned long )5;
           sqlstm.sqhsts[16] = (         int  )0;
           sqlstm.sqindv[16] = (         short *)0;
           sqlstm.sqinds[16] = (         int  )0;
           sqlstm.sqharm[16] = (unsigned long )0;
           sqlstm.sqadto[16] = (unsigned short )0;
           sqlstm.sqtdso[16] = (unsigned short )0;
           sqlstm.sqhstv[17] = (unsigned char  *)&realmm_calc;
           sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
           sqlstm.sqhsts[17] = (         int  )0;
           sqlstm.sqindv[17] = (         short *)0;
           sqlstm.sqinds[17] = (         int  )0;
           sqlstm.sqharm[17] = (unsigned long )0;
           sqlstm.sqadto[17] = (unsigned short )0;
           sqlstm.sqtdso[17] = (unsigned short )0;
           sqlstm.sqhstv[18] = (unsigned char  *)&retamt;
           sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[18] = (         int  )0;
           sqlstm.sqindv[18] = (         short *)0;
           sqlstm.sqinds[18] = (         int  )0;
           sqlstm.sqharm[18] = (unsigned long )0;
           sqlstm.sqadto[18] = (unsigned short )0;
           sqlstm.sqtdso[18] = (unsigned short )0;
           sqlstm.sqhstv[19] = (unsigned char  *)&bretamt;
           sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[19] = (         int  )0;
           sqlstm.sqindv[19] = (         short *)0;
           sqlstm.sqinds[19] = (         int  )0;
           sqlstm.sqharm[19] = (unsigned long )0;
           sqlstm.sqadto[19] = (unsigned short )0;
           sqlstm.sqtdso[19] = (unsigned short )0;
           sqlstm.sqhstv[20] = (unsigned char  *)&horretamt;
           sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[20] = (         int  )0;
           sqlstm.sqindv[20] = (         short *)0;
           sqlstm.sqinds[20] = (         int  )0;
           sqlstm.sqharm[20] = (unsigned long )0;
           sqlstm.sqadto[20] = (unsigned short )0;
           sqlstm.sqtdso[20] = (unsigned short )0;
           sqlstm.sqhstv[21] = (unsigned char  *)&bretintax;
           sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[21] = (         int  )0;
           sqlstm.sqindv[21] = (         short *)0;
           sqlstm.sqinds[21] = (         int  )0;
           sqlstm.sqharm[21] = (unsigned long )0;
           sqlstm.sqadto[21] = (unsigned short )0;
           sqlstm.sqtdso[21] = (unsigned short )0;
           sqlstm.sqhstv[22] = (unsigned char  *)&bretjutax;
           sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
           sqlstm.sqhsts[22] = (         int  )0;
           sqlstm.sqindv[22] = (         short *)0;
           sqlstm.sqinds[22] = (         int  )0;
           sqlstm.sqharm[22] = (unsigned long )0;
           sqlstm.sqadto[22] = (unsigned short )0;
           sqlstm.sqtdso[22] = (unsigned short )0;
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
                Write_batlog(seqno++, "퇴직정산 기초자료 read Error");  
                err_print(sqlca.sqlcode,"퇴직정산 기초자료 read Error");
                exit(1);
           }      

           if (sqlca.sqlcode == 1403 )
           {
                /* EXEC SQL close c2; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 34;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )716;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                break;
           }
           
           /* 퇴직금 산정 */ 
           /* 2015.12.21 jissi HR팀 김보배씨 요청 할증율 삭제
           retamt  = (fmax(avggross, commonamt) * (retrate * addrate)); */
           retamt  = (fmax(avggross, commonamt) *  retrate );
           
           /*2015.12.16 jissi 안분개정방식 한도 계산 기본*/
           limitamt_2011 = trunc(limitretamt * limitmm_2011/realmm_calc);
                
           /* 2012년이후 퇴직한도금 */
           limitamt_2012 = trunc(limitavgpay * 1/10 * limitmm_2012 / 12 * 3);
           
           /* 한도계산 실퇴직금계 : 되직금 + 중간정산퇴직금 + 명예퇴직금 */
           limitretamt = retamt  + bretamt + horretamt;
           
           /* 한도초과액 근로소득간주 */
           limitoveramt = fmax((limitretamt - (limitamt_2011 + limitamt_2012)),0);
           
           if (limitoveramt > 0)
                retamtsum = limitretamt - limitoveramt;
           else
                retamtsum = limitretamt;
           
           /* 과세이연금이 있는 경우 */
           if (tnextyearamt > 0)
                nrate     = trunc(tnextyearamt / retamtsum * 100);
           
           /* =======  퇴직소득공제 : 2011년(45%=>40%로 변경) 2011.02.01 / 2006년(50%=>45%로 변경) ======= */
           
           CalcTaxstamt(retamtsum, realyy_calc, &fixded, &conded, &rinded, &taxstamt);
           
           /* 세금계산 */
           /* 2012년 이전 산출 세액 */
           if ((realyy_calc > 0) && (realyy_2012 > 0)) 
           { 
                taxstamt_2012 = round(taxstamt * realyy_2012 / realyy_calc);
                
                CalcTax2012(realyy_calc,realyy_2012,taxstamt_2012,
                            &avgtaxstamt_2012, &retavgtaxstamt_2012, &rettaxrate_2012, &retavgtax_2012, &retavgcalctax_2012, &retcalctax_2012);
           }

           /* 2013년 이후 산출 세액 */
           if ((realyy_calc > 0) && (realyy_2013 > 0)) 
           {
                taxstamt_2013 = taxstamt - taxstamt_2012;
                
                CalcTax2013(realyy_calc,realyy_2013,taxstamt_2013,
                            &avgtaxstamt_2013, &retavgtaxstamt_2013, &rettaxrate_2013, &retavgtax_2013, &retavgcalctax_2013, &retcalctax_2013);
           }
           
           retintax_2012 = retcalctax_2012 - bretintax;
           retintax_2013 = retcalctax_2013;                     
           
           avgtaxstamt   = floor(taxstamt / realyy_calc);  
           retavgtaxstamt= retavgtaxstamt_2013;
           retavgtax     = retavgtax_2013;
           retavgcalctax = trunc(retavgcalctax_2012 + retavgcalctax_2013);
           retcalctax    = trunc(retcalctax_2012  + retcalctax_2013);   
           
           /*2015.12.30 jissi 2016년 개정세법*/
           sprintf(rettaxyy , "%.4s", retdate) ; 
           if (strcmp(rettaxyy, "2016") >= 0)
           {
                change_pay_2016 = floor((retamtsum - conded) / realyy_calc) * 12;
                
                if      (change_pay_2016 <=   8000000)
                     change_payded_2016  =  change_pay_2016;
                else if (change_pay_2016 <=  70000000)
                     change_payded_2016  =    8000000 + floor((change_pay_2016 -   8000000)*60/100);
                else if (change_pay_2016 <= 100000000)
                     change_payded_2016  =   45200000 + floor((change_pay_2016 -  70000000)*55/100);
                else if (change_pay_2016 <= 300000000)
                     change_payded_2016  =   61700000 + floor((change_pay_2016 - 100000000)*45/100);
                else if (change_pay_2016  > 300000000)
                     change_payded_2016  =  151700000 + floor((change_pay_2016 - 300000000)*35/100);
                     
                taxstamt_2016   =  change_pay_2016 - change_payded_2016;  
                
                CalcTax2016(realyy_calc, taxstamt_2016, &rettaxrate_2016, &retavgtax_2016, &retcalctax_2016); 
                
                retintax_2016      = retcalctax_2016  - bretintax;  
           }

           if (strcmp(rettaxyy, "2015") <= 0)
                retintax_calc = retcalctax; 
           else if (strcmp(rettaxyy, "2016") == 0)
                retintax_calc = floor(retcalctax*80/100)+floor(retcalctax_2016*20/100);
           else if (strcmp(rettaxyy, "2017") == 0)
                retintax_calc = floor(retcalctax*60/100)+floor(retcalctax_2016*40/100);
           else if (strcmp(rettaxyy, "2018") == 0)
                retintax_calc = floor(retcalctax*40/100)+floor(retcalctax_2016*60/100);
           else if (strcmp(rettaxyy, "2019") == 0)
                retintax_calc = floor(retcalctax*20/100)+floor(retcalctax_2016*80/100);
           else if (strcmp(rettaxyy, "2020") >= 0)
                retintax_calc = retcalctax_2016;
           /************************************************************************************************/
           
           /*calcintax     = retcalctax  - bretintax;*/
           calcintax     = retintax_calc  - bretintax;
           calcjutax     = trunc(calcintax / 10);
           
           /*retintax      = retcalctax  - bretintax;*/
           retintax      = retintax_calc  - bretintax;
           retintax      = trunc(retintax / 10) * 10;
           retjutax      = trunc(retintax /100) * 10;
           
           /* 과세이연금이 있는 경우 */
           if (tnextyearamt > 0)
           {   
           	    nintax   = fmax(round(calcintax * tnextyearamt / retamtsum), 0); 
                njutax   = floor(nintax / 100) * 10 ;
           }

           /* 퇴직소득세, 퇴직주민세 */
           yintax        = trunc((retintax - nintax) / 10) * 10;
           yjutax        = trunc((retjutax - njutax) / 10) * 10;
           
           realretintax  = retintax;
           realretjutax  = retjutax;
           
           /* 실지급 퇴직금 */
           retrealamt = retamtsum - retintax - retjutax; 
           
           /* 중간정산반영후 실퇴직금 */
           retreal    = retamt + horretamt - realretintax - realretjutax;
           
           UpdateResult();
           
      } /* end of while */
      
      /*===========================================================================*/
}

/* =====================================================================
        계산결과를 반영.
* ===================================================================== */
UpdateResult()
{  
     /* EXEC SQL
     UPDATE PKZRTMAS
        set LIMITAMT_2012       = :limitamt_2012, 
            LIMITRETAMT         = :limitretamt, 
            LIMITOVERAMT        = :limitoveramt,
            LIMITAMT_2011       = :limitamt_2011, /o2015.12.16 jissi 기존계산방식/개정안분방식 한도계산o/
            RETAMT              = :retamt,
            RETAMTSUM           = :retamtsum,
            FIXDED              = :fixded, 
            CONDED              = :conded,
            RINDED              = :rinded,
            RINAMT              = :rinamt,
            TAXSTAMT_2012       = :taxstamt_2012,      
            AVGTAXSTAMT_2012    = :avgtaxstamt_2012,   
            RETAVGTAXSTAMT_2012 = :retavgtaxstamt_2012,
            RETTAXRATE_2012     = :rettaxrate_2012,    
            RETAVGTAX_2012      = :retavgtax_2012,     
            RETAVGCALCTAX_2012  = :retavgcalctax_2012, 
            RETCALCTAX_2012     = :retcalctax_2012,    
            TAXSTAMT_2013       = :taxstamt_2013,      
            AVGTAXSTAMT_2013    = :avgtaxstamt_2013,   
            RETAVGTAXSTAMT_2013 = :retavgtaxstamt_2013,
            RETTAXRATE_2013     = :rettaxrate_2013,    
            RETAVGTAX_2013      = :retavgtax_2013,     
            RETAVGCALCTAX_2013  = :retavgcalctax_2013, 
            RETCALCTAX_2013     = :retcalctax_2013,    
            TAXSTAMT            = :taxstamt,      
            AVGTAXSTAMT         = :avgtaxstamt,
            RETAVGTAXSTAMT      = :retavgtaxstamt,
            RETAVGTAX           = :retavgtax, 
            RETAVGCALCTAX       = :retavgcalctax,
            RETCALCTAX          = :retcalctax,
            CHANGE_PAY_2016     = :change_pay_2016,    
            CHANGE_PAYDED_2016  = :change_payded_2016, 
            TAXSTAMT_2016       = :taxstamt_2016,      
            RETTAXRATE_2016     = :rettaxrate_2016,    
            RETAVGTAX_2016      = :retavgtax_2016,     
            RETCALCTAX_2016     = :retcalctax_2016,    
            RETINTAX_2016       = :retintax_2016,     
            RETTAXYY            = :rettaxyy,           
            RETINTAX_CALC	      = :retintax_calc,	    
            CALCINTAX           = :calcintax, 
            CALCJUTAX           = :calcjutax,
            RETINTAX            = :retintax, 
            RETJUTAX            = :retjutax,
            YINTAX              = :yintax, 
            YJUTAX              = :yjutax,
            REALRETINTAX        = :realretintax,
            REALRETJUTAX        = :realretjutax,
            RETREALAMT          = :retrealamt,
            RETREAL             = :retreal,
            NRATE               = :nrate, 
            NINTAX              = :nintax,
            NJUTAX              = :njutax, 
            WRITEMAN            = :log_writeman,
            WRITETIME           = to_char(sysdate,'yyyymmddhh24miss')
      WHERE EMPNO               = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKZRTMAS  set LIMITAMT_2012=:b0,LIMITRETAMT=:b1,\
LIMITOVERAMT=:b2,LIMITAMT_2011=:b3,RETAMT=:b4,RETAMTSUM=:b5,FIXDED=:b6,CONDED\
=:b7,RINDED=:b8,RINAMT=:b9,TAXSTAMT_2012=:b10,AVGTAXSTAMT_2012=:b11,RETAVGTAX\
STAMT_2012=:b12,RETTAXRATE_2012=:b13,RETAVGTAX_2012=:b14,RETAVGCALCTAX_2012=:\
b15,RETCALCTAX_2012=:b16,TAXSTAMT_2013=:b17,AVGTAXSTAMT_2013=:b18,RETAVGTAXST\
AMT_2013=:b19,RETTAXRATE_2013=:b20,RETAVGTAX_2013=:b21,RETAVGCALCTAX_2013=:b2\
2,RETCALCTAX_2013=:b23,TAXSTAMT=:b24,AVGTAXSTAMT=:b25,RETAVGTAXSTAMT=:b26,RET\
AVGTAX=:b27,RETAVGCALCTAX=:b28,RETCALCTAX=:b29,CHANGE_PAY_2016=:b30,CHANGE_PA\
YDED_2016=:b31,TAXSTAMT_2016=:b32,RETTAXRATE_2016=:b33,RETAVGTAX_2016=:b34,RE\
TCALCTAX_2016=:b35,RETINTAX_2016=:b36,RETTAXYY=:b37,RETINTAX_CALC=:b38,CALCIN\
TAX=:b39,CALCJUTAX=:b40,RETINTAX=:b41,RETJUTAX=:b42,YINTAX=:b43,YJUTAX=:b44,R\
EALRETINTAX=:b45,REALRETJUTAX=:b46,RETREALAMT=:b47,RETREAL=:b48,NRATE=:b49,NI\
NTAX=:b50,NJUTAX=:b51,WRITEMAN=:b52,WRITETIME=to_char(sysdate,'yyyymmddhh24mi\
ss') where EMPNO=:b53";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )731;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&limitamt_2012;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&limitretamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&limitoveramt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&limitamt_2011;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&retamt;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&retamtsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&fixded;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&conded;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&rinded;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&rinamt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&taxstamt_2012;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&avgtaxstamt_2012;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&retavgtaxstamt_2012;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&rettaxrate_2012;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&retavgtax_2012;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&retavgcalctax_2012;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&retcalctax_2012;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&taxstamt_2013;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&avgtaxstamt_2013;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&retavgtaxstamt_2013;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&rettaxrate_2013;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&retavgtax_2013;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&retavgcalctax_2013;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&retcalctax_2013;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&taxstamt;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&avgtaxstamt;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&retavgtaxstamt;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&retavgtax;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&retavgcalctax;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&retcalctax;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&change_pay_2016;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&change_payded_2016;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&taxstamt_2016;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&rettaxrate_2016;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&retavgtax_2016;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&retcalctax_2016;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)&retintax_2016;
     sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)rettaxyy;
     sqlstm.sqhstl[37] = (unsigned long )5;
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)&retintax_calc;
     sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&calcintax;
     sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)&calcjutax;
     sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)&retintax;
     sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)&retjutax;
     sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)&yintax;
     sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)&yjutax;
     sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqhstv[45] = (unsigned char  *)&realretintax;
     sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[45] = (         int  )0;
     sqlstm.sqindv[45] = (         short *)0;
     sqlstm.sqinds[45] = (         int  )0;
     sqlstm.sqharm[45] = (unsigned long )0;
     sqlstm.sqadto[45] = (unsigned short )0;
     sqlstm.sqtdso[45] = (unsigned short )0;
     sqlstm.sqhstv[46] = (unsigned char  *)&realretjutax;
     sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[46] = (         int  )0;
     sqlstm.sqindv[46] = (         short *)0;
     sqlstm.sqinds[46] = (         int  )0;
     sqlstm.sqharm[46] = (unsigned long )0;
     sqlstm.sqadto[46] = (unsigned short )0;
     sqlstm.sqtdso[46] = (unsigned short )0;
     sqlstm.sqhstv[47] = (unsigned char  *)&retrealamt;
     sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[47] = (         int  )0;
     sqlstm.sqindv[47] = (         short *)0;
     sqlstm.sqinds[47] = (         int  )0;
     sqlstm.sqharm[47] = (unsigned long )0;
     sqlstm.sqadto[47] = (unsigned short )0;
     sqlstm.sqtdso[47] = (unsigned short )0;
     sqlstm.sqhstv[48] = (unsigned char  *)&retreal;
     sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[48] = (         int  )0;
     sqlstm.sqindv[48] = (         short *)0;
     sqlstm.sqinds[48] = (         int  )0;
     sqlstm.sqharm[48] = (unsigned long )0;
     sqlstm.sqadto[48] = (unsigned short )0;
     sqlstm.sqtdso[48] = (unsigned short )0;
     sqlstm.sqhstv[49] = (unsigned char  *)&nrate;
     sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[49] = (         int  )0;
     sqlstm.sqindv[49] = (         short *)0;
     sqlstm.sqinds[49] = (         int  )0;
     sqlstm.sqharm[49] = (unsigned long )0;
     sqlstm.sqadto[49] = (unsigned short )0;
     sqlstm.sqtdso[49] = (unsigned short )0;
     sqlstm.sqhstv[50] = (unsigned char  *)&nintax;
     sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[50] = (         int  )0;
     sqlstm.sqindv[50] = (         short *)0;
     sqlstm.sqinds[50] = (         int  )0;
     sqlstm.sqharm[50] = (unsigned long )0;
     sqlstm.sqadto[50] = (unsigned short )0;
     sqlstm.sqtdso[50] = (unsigned short )0;
     sqlstm.sqhstv[51] = (unsigned char  *)&njutax;
     sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[51] = (         int  )0;
     sqlstm.sqindv[51] = (         short *)0;
     sqlstm.sqinds[51] = (         int  )0;
     sqlstm.sqharm[51] = (unsigned long )0;
     sqlstm.sqadto[51] = (unsigned short )0;
     sqlstm.sqtdso[51] = (unsigned short )0;
     sqlstm.sqhstv[52] = (unsigned char  *)log_writeman;
     sqlstm.sqhstl[52] = (unsigned long )5;
     sqlstm.sqhsts[52] = (         int  )0;
     sqlstm.sqindv[52] = (         short *)0;
     sqlstm.sqinds[52] = (         int  )0;
     sqlstm.sqharm[52] = (unsigned long )0;
     sqlstm.sqadto[52] = (unsigned short )0;
     sqlstm.sqtdso[52] = (unsigned short )0;
     sqlstm.sqhstv[53] = (unsigned char  *)empno;
     sqlstm.sqhstl[53] = (unsigned long )5;
     sqlstm.sqhsts[53] = (         int  )0;
     sqlstm.sqindv[53] = (         short *)0;
     sqlstm.sqinds[53] = (         int  )0;
     sqlstm.sqharm[53] = (unsigned long )0;
     sqlstm.sqadto[53] = (unsigned short )0;
     sqlstm.sqtdso[53] = (unsigned short )0;
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

           
      
     
     if ( sqlca.sqlcode != 0 )
     {                 
          err_print(sqlca.sqlcode,"저장중 ERROR");
          printf("Empno : %s || ERROR_CODE : %d || 저장중 ERROR. \n", empno, sqlca.sqlcode);    
          Write_batlog(seqno++,   "저장중 ERROR");  
          exit(1);
     }
}

CalcTaxstamt(double m_retamtsum, int  m_realyy_calc, double *m_fixded, double *m_conded, double *m_rinded, double *m_taxstamt)                      
{                                                                                                        
     /* EXEC SQL                                                                                     
     SELECT RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED,                                            
            Decode(RETAMTSUM,0,0,RETUTIL.GET_CONDED(REALYY_CALC)) CONDED,                                          
            Decode(RETAMTSUM,0,0,RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC)) RINDED,                                
            GREATEST((RETAMTSUM -RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC)),0) TAXSTAMT      
      INTO  :m_fixded[0], :m_conded[0], :m_rinded[0], :m_taxstamt[0]                                           
      FROM (select :m_retamtsum RETAMTSUM, :m_realyy_calc REALYY_CALC from dual
           ) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED ,Decode(RET\
AMTSUM,0,0,RETUTIL.GET_CONDED(REALYY_CALC)) CONDED ,Decode(RETAMTSUM,0,0,RETU\
TIL.GET_RINDED(RETAMTSUM,REALYY_CALC)) RINDED ,GREATEST((RETAMTSUM-RETUTIL.GE\
T_RINDED(RETAMTSUM,REALYY_CALC)),0) TAXSTAMT into :b0,:b1,:b2,:b3  from (sele\
ct :b4 RETAMTSUM ,:b5 REALYY_CALC  from dual ) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )962;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&m_fixded[0];
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_conded[0];
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_rinded[0];
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_taxstamt[0];
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&m_retamtsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&m_realyy_calc;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
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

                                                                               
}                                                                                                        
                                                                                                    
CalcTax2012(   int  m_realyy_calc,        int  m_realyy_2012,         double  m_taxstamt_2012,   
            double *m_avgtaxstamt_2012,double *m_retavgtaxstamt_2012,    
            double *m_rettaxrate_2012, double *m_retavgtax_2012,      double *m_retavgcalctax_2012,    
            double *m_retcalctax_2012)
{
     /* EXEC SQL    
     SELECT AVGTAXSTAMT_2012,
            RETAVGTAXSTAMT_2012,
            RETUTIL.GET_RETTAXRATE(AVGTAXSTAMT_2012)             RETTAXRATE_2012,
            0                                                    RETAVGTAX_2012,
            RETUTIL.GET_RETAVGTAX(AVGTAXSTAMT_2012)              RETAVGCALCTAX_2012,
           (RETUTIL.GET_RETAVGTAX(AVGTAXSTAMT_2012)*REALYY_2012) RETCALCTAX_2012   
      INTO :m_avgtaxstamt_2012[0], :m_retavgtaxstamt_2012[0], :m_rettaxrate_2012[0], :m_retavgtax_2012[0], :m_retavgcalctax_2012[0], :m_retcalctax_2012[0]
      FROM (SELECT A.*,
                   FLOOR(TAXSTAMT_2012/REALYY_2012) AVGTAXSTAMT_2012,
                   0 RETAVGTAXSTAMT_2012
              FROM (SELECT :m_taxstamt_2012 TAXSTAMT_2012, :m_realyy_calc REALYY_CALC, :m_realyy_2012 REALYY_2012 FROM DUAL)A
           ) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGTAXSTAMT_2012 ,RETAVGTAXSTAMT_2012 ,RETUTIL.G\
ET_RETTAXRATE(AVGTAXSTAMT_2012) RETTAXRATE_2012 ,0 RETAVGTAX_2012 ,RETUTIL.GE\
T_RETAVGTAX(AVGTAXSTAMT_2012) RETAVGCALCTAX_2012 ,(RETUTIL.GET_RETAVGTAX(AVGT\
AXSTAMT_2012)* REALYY_2012) RETCALCTAX_2012 into :b0,:b1,:b2,:b3,:b4,:b5  fro\
m (select A.* ,FLOOR((TAXSTAMT_2012/REALYY_2012)) AVGTAXSTAMT_2012 ,0 RETAVGT\
AXSTAMT_2012  from (select :b6 TAXSTAMT_2012 ,:b7 REALYY_CALC ,:b8 REALYY_201\
2  from DUAL ) A ) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1001;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2012[0];
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2012[0];
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2012[0];
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2012[0];
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2012[0];
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2012[0];
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2012;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2012;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}

CalcTax2013(   int  m_realyy_calc,        int  m_realyy_2013,         double m_taxstamt_2013,   
            double *m_avgtaxstamt_2013,double *m_retavgtaxstamt_2013,    
            double *m_rettaxrate_2013, double *m_retavgtax_2013,      double *m_retavgcalctax_2013,    
            double *m_retcalctax_2013)
{
     /* EXEC SQL    
     SELECT AVGTAXSTAMT_2013,
            RETAVGTAXSTAMT_2013,
            RETUTIL.GET_RETTAXRATE(RETAVGTAXSTAMT_2013)          RETTAXRATE_2013,
            RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)           RETAVGTAX_2013,
            FLOOR(RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5)  RETAVGCALCTAX_2013,
           (FLOOR(RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5)*REALYY_2013) RETCALCTAX_2013   
      INTO :m_avgtaxstamt_2013[0], :m_retavgtaxstamt_2013[0], :m_rettaxrate_2013[0], :m_retavgtax_2013[0], :m_retavgcalctax_2013[0], :m_retcalctax_2013[0]
      FROM (SELECT A.*,
                   FLOOR(TAXSTAMT_2013/REALYY_2013) AVGTAXSTAMT_2013,
                   FLOOR(TAXSTAMT_2013/REALYY_2013)*5 RETAVGTAXSTAMT_2013
              FROM (SELECT :m_taxstamt_2013 TAXSTAMT_2013, :m_realyy_calc REALYY_CALC, :m_realyy_2013 REALYY_2013 FROM DUAL)A
           ) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGTAXSTAMT_2013 ,RETAVGTAXSTAMT_2013 ,RETUTIL.G\
ET_RETTAXRATE(RETAVGTAXSTAMT_2013) RETTAXRATE_2013 ,RETUTIL.GET_RETAVGTAX(RET\
AVGTAXSTAMT_2013) RETAVGTAX_2013 ,FLOOR((RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT\
_2013)/5)) RETAVGCALCTAX_2013 ,(FLOOR((RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2\
013)/5))* REALYY_2013) RETCALCTAX_2013 into :b0,:b1,:b2,:b3,:b4,:b5  from (se\
lect A.* ,FLOOR((TAXSTAMT_2013/REALYY_2013)) AVGTAXSTAMT_2013 ,(FLOOR((TAXSTA\
MT_2013/REALYY_2013))* 5) RETAVGTAXSTAMT_2013  from (select :b6 TAXSTAMT_2013\
 ,:b7 REALYY_CALC ,:b8 REALYY_2013  from DUAL ) A ) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1052;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2013[0];
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2013[0];
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2013[0];
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2013[0];
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2013[0];
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2013[0];
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2013;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2013;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}

CalcTax2016(   int  m_realyy_calc,     double m_taxstamt_2016,   
            double *m_rettaxrate_2016, double *m_retavgtax_2016,      double *m_retcalctax_2016)
{
     /* EXEC SQL    
     SELECT 
            RETUTIL.GET_RETTAXRATE(TAXSTAMT_2016)                      RETTAXRATE_2016,
            RETUTIL.GET_RETAVGTAX(TAXSTAMT_2016)                       RETAVGTAX_2016,
            /oFLOOR(RETUTIL.GET_RETAVGTAX(TAXSTAMT_2016)/12)*REALYY_CALC RETCALCTAX_2016     엑셀프로그램이 ROUNDDOWN(환산산출세액/12,0)*근속연수 일 경우o/
            FLOOR(RETUTIL.GET_RETAVGTAX(TAXSTAMT_2016)/12*REALYY_CALC) RETCALCTAX_2016     /o엑셀프로그램이 ROUNDDOWN(환산산출세액/12*근속연수,0) 일 경우o/
      INTO :m_rettaxrate_2016[0], :m_retavgtax_2016[0], :m_retcalctax_2016[0]
      FROM (SELECT :m_taxstamt_2016 TAXSTAMT_2016, :m_realyy_calc REALYY_CALC FROM DUAL) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select RETUTIL.GET_RETTAXRATE(TAXSTAMT_2016) RETTAXRATE\
_2016 ,RETUTIL.GET_RETAVGTAX(TAXSTAMT_2016) RETAVGTAX_2016 ,FLOOR(((RETUTIL.G\
ET_RETAVGTAX(TAXSTAMT_2016)/12)* REALYY_CALC)) RETCALCTAX_2016 into :b0,:b1,:\
b2  from (select :b3 TAXSTAMT_2016 ,:b4 REALYY_CALC  from DUAL ) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1103;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&m_rettaxrate_2016[0];
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtax_2016[0];
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_retcalctax_2016[0];
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_taxstamt_2016;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&m_realyy_calc;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
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

int get_RealYYMMDD(char *m_empno,char *m_empdate,char *m_retdate, int *m_dutydd, int *m_dutymm, int *m_exdd, int *m_realdd, int *m_realmm, int *m_realyy)
{
     /* EXEC SQL
     SELECT RETUTIL.GET_DUTYDD(       EMPDATE, RETDATE)   DUTYDD,                                                                                     
            RETUTIL.GET_DUTYMM(       EMPDATE, RETDATE)   DUTYMM,
            RETUTIL.GET_EXDD  (EMPNO, EMPDATE, RETDATE)     EXDD,                                                                                    
            RETUTIL.GET_REALDD(EMPNO, EMPDATE, RETDATE)   REALDD,
            RETUTIL.GET_REALMM(EMPNO, EMPDATE, RETDATE)   REALMM,
            RETUTIL.GET_REALYY(EMPNO, EMPDATE, RETDATE)   REALYY
       INTO m_dutydd, m_dutymm, m_exdd, m_realdd, m_realmm, m_realyy                
       FROM (SELECT :m_empno EMPNO, :m_empdate EMPDATE, :m_retdate RETDATE FROM DUAL) A; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 54;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select RETUTIL.GET_DUTYDD(EMPDATE,RETDATE) DUTYDD ,RETU\
TIL.GET_DUTYMM(EMPDATE,RETDATE) DUTYMM ,RETUTIL.GET_EXDD(EMPNO,EMPDATE,RETDAT\
E) EXDD ,RETUTIL.GET_REALDD(EMPNO,EMPDATE,RETDATE) REALDD ,RETUTIL.GET_REALMM\
(EMPNO,EMPDATE,RETDATE) REALMM ,RETUTIL.GET_REALYY(EMPNO,EMPDATE,RETDATE) REA\
LYY into :b0,:b1,:b2,:b3,:b4,:b5  from (select :b6 EMPNO ,:b7 EMPDATE ,:b8 RE\
TDATE  from DUAL ) A ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1138;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_dutydd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)m_dutymm;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)m_exdd;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)m_realdd;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)m_realmm;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)m_realyy;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)m_empno;
     sqlstm.sqhstl[6] = (unsigned long )0;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)m_empdate;
     sqlstm.sqhstl[7] = (unsigned long )0;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[8] = (unsigned long )0;
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


     
     return 0;
}

int Write_batlog(int seqno, char *message)
{  
      /* EXEC SQL AT log_db 
      INSERT INTO PYBATLOG
      VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 54;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1189;
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
      sqlstm.arrsiz = 54;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1230;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
