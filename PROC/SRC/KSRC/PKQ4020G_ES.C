
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
           char  filnam[15];
};
static struct sqlcxp sqlfpn =
{
    14,
    "pkq4020g_es.pc"
};


static unsigned int sqlctx = 1234979;


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

 static char *sq0050 = 
"select A.EMPNO ,max(C.PAYDATE)  from PKHPHIS_ES C ,PKRETTBL_ES A ,PKMPMAS_E\
S B where (((((A.EMPNO=B.EMPNO and A.EMPNO=C.EMPNO) and B.PSTATE like '7%') a\
nd C.paydate<:b0) and B.BASEDATE=:b1) and C.BASEDATE=:b1) group by A.EMPNO   \
        ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,101,0,4,111,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
28,0,0,2,76,0,4,124,0,0,3,1,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,
55,0,0,3,69,0,4,159,0,0,1,0,0,1,0,2,97,0,0,
74,0,0,4,235,0,3,166,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
101,0,0,5,674,0,5,189,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
124,0,0,6,267,0,5,220,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
147,0,0,7,69,0,4,246,0,0,1,0,0,1,0,2,97,0,0,
166,0,0,8,542,0,5,252,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
205,0,0,9,241,0,5,281,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
232,0,0,10,62,0,4,308,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
255,0,0,11,69,0,4,326,0,0,1,0,0,1,0,2,97,0,0,
274,0,0,12,25,0,2,332,0,0,0,0,0,1,0,
289,0,0,13,271,0,3,343,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
312,0,0,14,69,0,4,367,0,0,1,0,0,1,0,2,97,0,0,
331,0,0,15,263,0,5,374,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
354,0,0,16,139,0,5,396,0,0,0,0,0,1,0,
369,0,0,17,69,0,4,439,0,0,1,0,0,1,0,2,97,0,0,
388,0,0,18,635,0,5,445,0,0,5,5,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
423,0,0,19,223,0,5,477,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
446,0,0,20,69,0,4,501,0,0,1,0,0,1,0,2,97,0,0,
465,0,0,21,69,0,4,512,0,0,1,0,0,1,0,2,97,0,0,
484,0,0,22,69,0,4,523,0,0,1,0,0,1,0,2,97,0,0,
503,0,0,23,228,0,5,529,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
526,0,0,24,77,0,5,549,0,0,0,0,0,1,0,
541,0,0,25,69,0,4,564,0,0,1,0,0,1,0,2,97,0,0,
560,0,0,26,72,0,5,570,0,0,2,2,0,1,0,1,4,0,0,1,4,0,0,
583,0,0,27,69,0,4,585,0,0,1,0,0,1,0,2,97,0,0,
602,0,0,28,79,0,4,591,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
625,0,0,29,108,0,5,598,0,0,1,1,0,1,0,1,97,0,0,
644,0,0,30,52,0,5,620,0,0,0,0,0,1,0,
659,0,0,31,56,0,5,637,0,0,0,0,0,1,0,
674,0,0,32,64,0,5,705,0,0,0,0,0,1,0,
689,0,0,33,496,0,5,723,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
712,0,0,34,85,0,5,758,0,0,1,1,0,1,0,1,97,0,0,
731,0,0,35,248,0,5,779,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
758,0,0,36,556,0,5,831,0,0,9,9,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
809,0,0,37,293,0,5,867,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
836,0,0,38,177,0,5,895,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
863,0,0,39,100,0,5,917,0,0,1,1,0,1,0,1,97,0,0,
882,0,0,40,101,0,5,934,0,0,1,1,0,1,0,1,97,0,0,
901,0,0,41,246,0,5,953,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
928,0,0,42,224,0,5,981,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
951,0,0,43,694,0,5,1045,0,0,7,7,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
994,0,0,44,174,0,4,1082,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
1017,0,0,45,290,0,4,1090,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
1040,0,0,46,0,0,24,1110,0,0,1,1,0,1,0,1,97,0,0,
1059,0,0,47,321,0,5,1126,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1094,0,0,48,148,0,5,1150,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1117,0,0,49,172,0,5,1168,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1140,0,0,50,237,0,9,1208,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1167,0,0,50,0,0,13,1223,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1190,0,0,50,0,0,15,1228,0,0,0,0,0,1,0,
1205,0,0,51,925,0,5,1253,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,
1248,0,0,52,44,0,5,1306,0,0,0,0,0,1,0,
1263,0,0,53,50,0,3,1337,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1304,0,0,54,0,0,29,1347,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkq4020g_es(퇴직충당금계산_예산추정을 위한 작업)
 SYSTEM-NAME    : 급여   www.ei.go.kr 
 SUBSYSTEM-NAME : 퇴직충당금_예산추정
 Programmer     : 강륜종
 Version        : 1.00
 Date           : 2006.11.
 Select Table   : PYCDEPT PKHMRHIS 
                  PKCPBAS_ES PKMPMAS_ES PKHPHIS_ES PKMRZMAS_ES PKHRZHIS_ES
 DML    Table   : PKRETTBL_ES(Update Delete Insert)
                  PKMRZMAS_ES(Update Insert)  

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00      2006.11.13         Dsa2000        pkq4020g.pc 를 기반으로 테이블명 수정하여 예산추정을 위한 작업하게끔 함.
============================================================================= */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

void  Ins_Record();
void  CalcRzAmt();                                           /* 퇴직충당금계산   */
void  CalcMonthamt();                                        /* 퇴직충당금분배액계산 */
void  CalcAvgGross(char *frempno,char *toempno,char *frdate);/* 퇴직평균임금 계산   */
void  CalcAvgGross_rest();
void  CalcExdd();                                            /* 근속제외계산   */
void  print_errmsg(int errcode, char *errmsg);


/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    curpaydate[6+1]       = "";    /* 최종급여월 = (평균임금산정시 기준)*/
     char    basedate[6+1]         = "";    /* 기준년월*/
     char    baseempdate[8+1]      = "";    /* 입사기준일 = 계산기준월-1년*/
     char    BASIC_YEARPAYNUM[6+1] = "";    /* 기준 연봉차수 */
     double  avgodamt              = 0;     /* 평균자가운전 지원금 */
     double  avgroleamt            = 0;     /* 평균직책수당 */
     char    v_curpaydate[8+1]     = "";    /* */
     char    jobempno[4+1];                 /* 작업자*/
     double  raiserate             = 0 ;    /* 임금인상반영시 비율로 인상   = ( 평균임금 * 999 / 100 )*/
     double  raiseamt              = 0 ;    /* 임금인상반영시 금액으로 인상 = ( 평균임금 + 999999 )   */
     int     cnt                   = 0 ; 
/* EXEC SQL END   DECLARE SECTION; */ 


int     id;
char    UserId[10+1];
char    t_raiserate[5+1];  /*임금인상반영시 비율로 인상   = ( 평균임금 * 999 / 100 )  */
char    t_raiseamt[12+1];  /*임금인상반영시 금액으로 인상 = ( 평균임금 + 999999 )     */
char    tempmm[2+1] ="" ;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 
char    cur_time[25]        = "";

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


void main(int argc,char *argv[])
{
     char FL_file[255];
     
     if  (argc != 8) {   /* pkq4020g_es 200611 200610 0 0 D006 pkq2075g 2004110100000 */
          printf("[Usage] : pkq4020g_es 1.기준년월 2.최종급여지급월 3.임금인상비율 4.임금인상금액 5.작업자사번 6.프로그램ID 7.시작시간 \n");  
          exit(1);
     }   
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq4020g_es");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     memset(UserId,'\0',sizeof(UserId));
     
     sprintf(basedate   ,"%s",argv[1]);  
     sprintf(curpaydate ,"%s",argv[2]);  
     sprintf(t_raiserate,"%s",argv[3]);
     sprintf(t_raiseamt ,"%s",argv[4]);
     sprintf(jobempno   ,"%s",argv[5]);
     sprintf(UserId     ,"%s",argv[6]);
     
     hinsa_log_print(0,"퇴직충당금 계산 시작...");            
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[5]);
     strcpy(log_progid,   argv[6]);
     strcpy(log_rundate,  argv[7]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     printf("\n Test : [%s]", hinsa_sys_date(4) );    
     raiserate =  atof(t_raiserate);
     raiseamt  =  atof(t_raiseamt);  /* 2003.06.02. PARKSH   t_raiserate를 t_raiseamt 수정  */
     
     /* EXEC SQL
     SELECT  to_char(last_day(add_months(to_date(:curpaydate, 'YYYYMM'),-12))+1 ,'YYYYMMDD')
       into  :baseempdate
       from  dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char((last_day(add_months(to_date(:b0,'YYYYMM\
'),(-12)))+1),'YYYYMMDD') into :b1  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)baseempdate;
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


           
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"입사일 기준일 읽기 오류");
          sprintf(log_buff, "입사일 기준일 읽기 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     SELECT  AVGODAMT, AVGROLEAMT 
       into  :avgodamt, :avgroleamt 
       from  PKCPBAS_ES 
      Where  BASEDATE =:basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGODAMT ,AVGROLEAMT into :b0,:b1  from PKCPBAS_\
ES where BASEDATE=:b2";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )28;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&avgroleamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
     {  
          print_errmsg(sqlca.sqlcode," 평균자가운전지원금 기준읽기 오류");
          sprintf(log_buff, " 평균자가운전지원금 기준읽기 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
      
     Ins_Record();   /* 대상자 추출*/
     CalcRzAmt();  /* 퇴직충당금계산 */
     CalcMonthamt();  /* 퇴직충당금분배액계산 */
     
     /* Dsa2000  2004.02.27.  hinsa_exit()에서 DB Commit & DB접속종료함 .*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/  
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [ 작 업 성 공 ] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [ 작 업 성 공 ] =====\n");
     }           
}

void Ins_Record()
{
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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


     
     printf("\n 0.0 퇴충마스터에 대상자 추출 : [%s]", hinsa_sys_date(4) );    
     
     /* EXEC SQL  
     INSERT INTO PKMRZMAS_ES 
            (BASEDATE, EMPNO) 
            (SELECT :basedate , EMPNO 
               FROM PKMPMAS_ES b  /o 2006.01.02  PIMPMAS => PKMPMAS_ES로 변경함.o/
              WHERE EMPDATE <= :baseempdate
                AND EMPNO not like 'Y%'
                AND EMPNO not like 'M%'  /oDSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청o/
                AND BASEDATE = :basedate
                AND NOT EXISTS (SELECT 1 FROM PKMRZMAS_ES WHERE B.EMPNO = EMPNO) /oDSA2000 Tunning Modufyo/
             /oMINUS /o이미 퇴직충당금테이블에 등록되어 있는 사원은 제외
             SELECT EMPNO 
                 FROM PKMRZMAS_ESo/
            ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMRZMAS_ES (BASEDATE,EMPNO)(select :b0 ,EM\
PNO  from PKMPMAS_ES b where ((((EMPDATE<=:b1 and EMPNO not like 'Y%') and EM\
PNO not like 'M%') and BASEDATE=:b0) and  not exists (select 1  from PKMRZMAS\
_ES where B.EMPNO=EMPNO)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )74;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)baseempdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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


      
     if  (sqlca.sqlcode != 0 )
     {  
          print_errmsg(sqlca.sqlcode," 대상자 추출 오류");
          sprintf(log_buff, " 대상자 추출 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }    
       
     /* EXEC SQL
     UPDATE PKMRZMAS_ES a 
        SET (KORNAME, PAYCL, PAYGR, PAYRA, PSTATE, 
             ORGNUM, DEPTCODE, SEX, EMPDATE, RETDATE ) 
          = (SELECT KORNAME, PAYCL, PAYGR, PAYRA, PSTATE, 
                    ORGNUM, 
                    /o DECODE(SUBSTR(d.TRIBEGB,1,1),'2',d.DEPTCODE, c.DEPTCODE ) DEPTCODE, o/
                    Case When (XX.Tribegb='2' And YY.Tribegb='2') Then YY.deptcode Else XX.deptcode End  DEPTCODE, /o 20181204 JHG 조직개편 o/                    
                    SEX, EMPDATE, RETDATE
               FROM PKMPMAS_ES b, /o PYCDEPT c, PYCDEPT d o/
                   (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) XX,  /o 20181204 JHG 조직개편 o/  
                   (Select Orgnum, Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept ) YY   /o 20181204 JHG 조직개편 o/                
              WHERE b.EMPNO    = a.EMPNO
                AND b.BASEDATE = :basedate               	
               /o AND b.ORGNUM   = c.ORGNUM
                AND b.DEPTCODE = c.DEPTCODE         
                AND b.ORGNUM   = d.ORGNUM
                AND b.JOBDEPT  = d.DEPTCODE o/
                AND (XX.Deptcode = b.Deptcode AND XX.ORGNUM = b.ORGNUM)  /o 20181204 JHG 조직개편 o/  
                AND (YY.Deptcode = b.Jobdept  AND YY.ORGNUM = b.ORGNUM)  /o 20181204 JHG 조직개편 o/                 
           	 ) 
      WHERE a.EMPNO IN (SELECT EMPNO FROM PKMPMAS_ES WHERE BASEDATE = :basedate); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES a  set (KORNAME,PAYCL,PAYGR,PAYRA,PS\
TATE,ORGNUM,DEPTCODE,SEX,EMPDATE,RETDATE)=(select KORNAME ,PAYCL ,PAYGR ,PAYR\
A ,PSTATE ,ORGNUM , case  when (XX.Tribegb='2' and YY.Tribegb='2') then YY.de\
ptcode else XX.deptcode  end  DEPTCODE ,SEX ,EMPDATE ,RETDATE  from PKMPMAS_E\
S b ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  from Pyc\
dept ) XX ,(select Orgnum ,Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  fr\
om Pycdept ) YY where (((b.EMPNO=a.EMPNO and b.BASEDATE=:b0) and (XX.Deptcode\
=b.Deptcode and XX.ORGNUM=b.ORGNUM)) and (YY.Deptcode=b.Jobdept and YY.ORGNUM\
=b.ORGNUM))) where a.EMPNO in (select EMPNO  from PKMPMAS_ES where BASEDATE=:\
b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )101;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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


      
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode," 대상자 UPDATE 오류");
          sprintf(log_buff, " 대상자 UPDATE 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
          
     /* EXEC SQL
     UPDATE PKMRZMAS_ES A 
        SET A.DIVCODE = (SELECT B.BONCODE 
                           FROM PYCDEPT B 
                          WHERE A.ORGNUM   = B.ORGNUM
                            and A.DEPTCODE = B.DEPTCODE ),
            A.CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD')                             
      WHERE PSTATE  < '80' 
        AND EMPDATE <= :baseempdate 
        //infra         AND PAYCL   <>'E0'
        AND PAYCL   <>'H51' 
        AND EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A  set A.DIVCODE=(select B.BONCODE  \
from PYCDEPT B where (A.ORGNUM=B.ORGNUM and A.DEPTCODE=B.DEPTCODE)),A.CALCDAT\
E=to_char(last_day(to_date(:b0,'YYYYMM')),'YYYYMMDD') where (((PSTATE<'80' an\
d EMPDATE<=:b1) and PAYCL<>'H51') and EMPNO not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )124;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)baseempdate;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode," DIVCODE UPDATE 오류");
          sprintf(log_buff, " DIVCODE UPDATE 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  

       
/*1월이면 신년도 clear*/     
     sprintf(tempmm, "%s", curpaydate+4) ;   
     if  (strcmp(tempmm, "01") == 0)  
     {
          /* EXEC SQL  
          SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
            into :cur_time
            from dual ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') i\
nto :b0  from dual ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )147;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
          sqlstm.sqhstl[0] = (unsigned long )25;
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


          
          printf("\n 신년도 CLEAR  : [%s]", hinsa_sys_date(4) );
          /* EXEC SQL         
          UPDATE  PKMRZMAS_ES A 
             SET (BYEARTOT, BMONTOT, CMONTOT, CYEARTOT, RETAMT)  
               = (SELECT nvl(CMONTOT,0), nvl(CMONTOT,0), 0, 0, 0 
                    FROM PKHRZHIS_ES B 
                   WHERE A.EMPNO  = B.EMPNO 
                     AND BASEDATE = :basedate
                     AND B.CALCDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%' )
          WHERE (A.PSTATE < '80')        
            AND (EMPDATE <= :baseempdate ) 
            //infra         AND (A.PAYCL <> 'E0') 
            AND (A.PAYCL <> 'H51')
            AND EMPNO not like 'M%'/oDSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청o/
            AND BASEDATE = :basedate
            AND EXISTS (SELECT 1 FROM PKHRZHIS_ES C 
                         WHERE C.EMPNO = A.EMPNO 
                           AND BASEDATE = :basedate
                           AND C.CALCDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%') ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 6;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRZMAS_ES A  set (BYEARTOT,BMONTOT,CMONTO\
T,CYEARTOT,RETAMT)=(select nvl(CMONTOT,0) ,nvl(CMONTOT,0) ,0 ,0 ,0  from PKHR\
ZHIS_ES B where ((A.EMPNO=B.EMPNO and BASEDATE=:b0) and B.CALCDATE like (TO_C\
HAR(ADD_MONTHS(TO_DATE(:b1,'YYYYMM'),(-12)),'YYYY')||'12%'))) where (((((A.PS\
TATE<'80' and EMPDATE<=:b2) and A.PAYCL<>'H51') and EMPNO not like 'M%') and \
BASEDATE=:b0) and exists (select 1  from PKHRZHIS_ES C where ((C.EMPNO=A.EMPN\
O and BASEDATE=:b0) and C.CALCDATE like (TO_CHAR(ADD_MONTHS(TO_DATE(:b1,'YYYY\
MM'),(-12)),'YYYY')||'12%'))))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )166;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)basedate;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)baseempdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)basedate;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)basedate;
          sqlstm.sqhstl[4] = (unsigned long )7;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)curpaydate;
          sqlstm.sqhstl[5] = (unsigned long )7;
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

 
                         
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {  
               print_errmsg(sqlca.sqlcode," 신년도 CLEAR 1 오류");
               sprintf(log_buff, " 신년도 CLEAR 1 오류");
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }                                                   
/* Dsa2000 End..................................................................*/
       
            /* Dsa2000 추가  12월에 중간정산자는 전년도 누계액을 0으로 Setting 2006.02.*/
          /* EXEC SQL         
          UPDATE PKMRZMAS_ES A 
             SET BYEARTOT = 0
           WHERE PSTATE   <  '80'
           //infra          AND PAYCL    <> 'E0'
             AND PAYCL    <> 'H51'
             AND EMPDATE  <= :baseempdate
             AND BASEDATE  = :basedate
             AND EMPNO in (SELECT empno FROM PKHMRHIS 
                            WHERE mrtodate like TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%'); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 6;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRZMAS_ES A  set BYEARTOT=0 where ((((PST\
ATE<'80' and PAYCL<>'H51') and EMPDATE<=:b0) and BASEDATE=:b1) and EMPNO in (\
select empno  from PKHMRHIS where mrtodate like (TO_CHAR(ADD_MONTHS(TO_DATE(:\
b2,'YYYYMM'),(-12)),'YYYY')||'12%')))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )205;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)baseempdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)basedate;
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)curpaydate;
          sqlstm.sqhstl[2] = (unsigned long )7;
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
          {  
               print_errmsg(sqlca.sqlcode," 신년도 CLEAR 2 오류");
               sprintf(log_buff, " 신년도 CLEAR 2 오류");
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }                           
     } 

}  

/* ========================================================
  퇴직충당금계산
======================================================== */
void CalcRzAmt()
{
     /* EXEC SQL
     SELECT YEARPAYNUM 
       into :BASIC_YEARPAYNUM
       from PKCPBAS_ES 
      where BASEDATE =:basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select YEARPAYNUM into :b0  from PKCPBAS_ES where BASED\
ATE=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )232;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)BASIC_YEARPAYNUM;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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


           
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode," 연봉차수 기준읽기 오류");
          sprintf(log_buff," 연봉차수 기준읽기 오류");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
  
/* ========================================================
 1.1 대상자 추출 : 입사기준일 이전 입사자 중  재직자
======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )255;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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


     
     printf("\n 1.1 대상자 추출 : 입사기준일 이전 입사자 중  재직자  : [%s]", hinsa_sys_date(4) );
     /* EXEC SQL
     DELETE FROM PKRETTBL_ES; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKRETTBL_ES ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )274;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1. 대상자 추출1  ERROR");
          sprintf(log_buff,"1. 대상자 추출  ERROR");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
     
     /* EXEC SQL
     INSERT  INTO PKRETTBL_ES 
             (EMPNO, ORGEMPDATE, EMPDATE, PAYCL, PAYGR1, PAYGR2)
     SELECT  EMPNO, ORGEMPDATE, EMPDATE, PAYCL, PAYGR , PAYGR 
       FROM  PKMPMAS_ES  
      WHERE  EMPDATE <= :baseempdate
        AND  SUBSTR(EMPNO,1,1) <> 'Y' 
        AND  PSTATE <'80'
        //infra           AND  PAYCL <>'E0'
        AND  PAYCL <>'H51'
        AND  BASEDATE = :basedate
        AND  EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKRETTBL_ES (EMPNO,ORGEMPDATE,EMPDATE,PAYCL\
,PAYGR1,PAYGR2)select EMPNO ,ORGEMPDATE ,EMPDATE ,PAYCL ,PAYGR ,PAYGR  from P\
KMPMAS_ES where (((((EMPDATE<=:b0 and SUBSTR(EMPNO,1,1)<>'Y') and PSTATE<'80'\
) and PAYCL<>'H51') and BASEDATE=:b1) and EMPNO not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )289;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)baseempdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1. 대상자 추출  ERROR");
          sprintf(log_buff,"1. 대상자 추출2  ERROR");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/   
          error_quit("작업실패...");
     }
     
/* ========================================================
   1.2 중간정산 반영
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )312;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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


     
     printf("\n 1.2 중간정산 반영 : [%s]", hinsa_sys_date(4) ); 
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES  A  SET (EMPDATE )  
         = (SELECT TO_CHAR(TO_DATE(MAX(MRTODATE),'YYYYMMDD')+1 , 'YYYYMMDD' )
                    FROM PKHMRHIS B
             WHERE A.EMPNO    = B.EMPNO
               AND B.MRTODATE < :curpaydate
             GROUP BY B.EMPNO ) 
      WHERE Exists (SELECT 1 FROM PKHMRHIS B
                     WHERE A.EMPNO    = B.EMPNO
                       AND B.MRTODATE < :curpaydate ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES A  set (EMPDATE)=(select TO_CHAR((TO\
_DATE(max(MRTODATE),'YYYYMMDD')+1),'YYYYMMDD')  from PKHMRHIS B where (A.EMPN\
O=B.EMPNO and B.MRTODATE<:b0) group by B.EMPNO) where exists (select 1  from \
PKHMRHIS B where (A.EMPNO=B.EMPNO and B.MRTODATE<:b0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )331;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
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

          
      /*WHERE EMPNO IN (SELECT DISTINCT EMPNO FROM PKHMRHIS 
                       WHERE MRTODATE < :curpaydate );         dsa2000 Tunning Modify*/
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2. 중간정산 반영");  
          sprintf(log_buff,"2. 중간정산 반영");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/  
          error_quit("작업실패...");
     }
     
     /* 퇴직기산일 특이자 update 추가 Start [2018-09-13 이상용] */
     /* EXEC SQL
     UPDATE PKRETTBL_ES S SET
            EMPDATE = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO )
      WHERE EMPNO IN (SELECT EMPNO FROM PKZRTSPC ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES S  set EMPDATE=(select RETCALCDATE  \
from PKZRTSPC T where S.EMPNO=T.EMPNO) where EMPNO in (select EMPNO  from PKZ\
RTSPC )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )354;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          print_errmsg(sqlca.sqlcode,"퇴직기산일 특이자  setting Error ");  
          sprintf(log_buff, "퇴직기산일 특이자 setting Error ");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     /* 퇴직기산일 특이자 update 추가 End [2018-09-13 이상용] */

     

/* ======================================================== 
   1.3 퇴직 직급반영 : 일반사원 : 10 &&  임원이사대우: 직급그대로 
   2009.03.27 kth 단수제로 변경 retcl 을 사용 하지 않음.
 ======================================================== */
  /*EXEC SQL  
        SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
        into :cur_time
        from dual ;     
        printf("\n 1.3 퇴직 직급반영 : 일반사원 : 10 &&  임원이사대우: 직급그대로 : [%s]", hinsa_sys_date(4) );         
             
  EXEC SQL
  UPDATE   PKRETTBL_ES 
     SET   RETCL = '10'
   WHERE   RETCL < '00' OR RETCL > '09' ;

  if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
  {  
   print_errmsg(sqlca.sqlcode,"3. 퇴직 직급반영");
   sprintf(log_buff,"3. 퇴직 직급반영");
             Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
   error_quit("작업실패...");  
  }*/


/* ========================================================
   1.4 임원 평균임금 산정
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )369;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.4 임원 평균임금 산정 : [%s]", hinsa_sys_date(4) );         
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES P 
        SET (PAY3SUM, BON12SUM, CALMM) =
/o2014.11.18 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)    o/
/o            (SELECT nvl(sum((ceil((nvl(fixpay,0)+nvl(bfixpay,0)+nvl(sopay,0) )*18/12)) +  o/
            (SELECT nvl(sum(  (case when paydate <= '201412' then (ceil((nvl(fixpay,0)+nvl(bfixpay,0)+nvl(sopay,0) )*18/12)) else NVL(FIXPAY,0)+NVL(SOPAY,0) end) +
                              least(nvl(roleamt,0), :avgroleamt) +/o2001.11.1 직책수당은 평균직책수당 값 반영 nvl(roleamt,0)+o/
                              nvl(mateamt,0)+nvl(partamt,0)+nvl(childamt,0)+
                              nvl(ovtmamt,0)+nvl(sptmamt,0)+nvl(mcaramt,0)+
                              nvl(liceamt,0)+nvl(mbonamt,0)+nvl(sobon,0)+  
                              decode(nvl(odamt,0),0,0,:avgodamt)  
                            ),0),  
                    0, 
                    COUNT(EMPNO)
               FROM PKHPHIS_ES R
              WHERE P.EMPNO    = R.EMPNO
                AND R.BASEDATE = :basedate
                AND R.PAYDATE >= TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM'),-2),'YYYYMM')
                AND R.PAYDATE <= :curpaydate)
                //infra         where paycl <= '09'
      where paycl <= 'A99'
        AND EMPNO like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES P  set (PAY3SUM,BON12SUM,CALMM)=(sel\
ect nvl(sum(((((((((((( case  when paydate<='201412' then ceil(((((nvl(fixpay\
,0)+nvl(bfixpay,0))+nvl(sopay,0))* 18)/12)) else (NVL(FIXPAY,0)+NVL(SOPAY,0))\
  end +least(nvl(roleamt,0),:b0))+nvl(mateamt,0))+nvl(partamt,0))+nvl(childam\
t,0))+nvl(ovtmamt,0))+nvl(sptmamt,0))+nvl(mcaramt,0))+nvl(liceamt,0))+nvl(mbo\
namt,0))+nvl(sobon,0))+decode(nvl(odamt,0),0,0,:b1))),0) ,0 ,count(EMPNO)  fr\
om PKHPHIS_ES R where (((P.EMPNO=R.EMPNO and R.BASEDATE=:b2) and R.PAYDATE>=T\
O_CHAR(ADD_MONTHS(TO_DATE(:b3,'YYYYMM'),(-2)),'YYYYMM')) and R.PAYDATE<=:b3))\
 where (paycl<='A99' and EMPNO like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )388;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&avgroleamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)curpaydate;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"4. 임원 평균임금 산정 ");
          sprintf(log_buff,"4. 임원 평균임금 산정 ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
           
     /*임원평균임금=(기본연봉+업적연봉+중식비연간총액)/12*/      
     /* EXEC SQL
     UPDATE  PKRETTBL_ES a  
        SET  AVGPAYBON = (select ceil((nvl(totpay,0) + avgmcaramt)/12)  
                            from pkhyphis  b, PKCPBAS_ES c
                           where a.empno = b.empno
                             and b.yearpaynum(+) = :BASIC_YEARPAYNUM
                             and c.BASEDATE =:basedate)
        //infra         where paycl <= '09'
      where paycl <= 'A99'
        AND EMPNO like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES a  set AVGPAYBON=(select ceil(((nvl(\
totpay,0)+avgmcaramt)/12))  from pkhyphis b ,PKCPBAS_ES c where ((a.empno=b.e\
mpno and b.yearpaynum(+)=:b0) and c.BASEDATE=:b1)) where (paycl<='A99' and EM\
PNO like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )423;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)BASIC_YEARPAYNUM;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
/* 2002.3.19 이사대우까지 임원 계산로직 반영 
         WHERE   PAYCL <'09';                      */       

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1.6.1 임원 통상 임금과 평균임금");
          sprintf(log_buff,"1.6.1 임원 통상 임금과 평균임금");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  

/* ========================================================
   1.5 임원제외 평균임금 산정  
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )446;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.5 임원제외 평균임금 산정 : [%s]", hinsa_sys_date(4) );         
     
     CalcAvgGross("0000","zzzz",curpaydate);
     
/* ========================================================
   1.  휴직자
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )465;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.5.2 휴직자 평균임금 산정 : [%s]", hinsa_sys_date(4) );
     
     CalcAvgGross_rest();

/* ========================================================
   1.6 통상 임금
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )484;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.6 통상 임금 : [%s]", hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES  A 
/o   2014.11.18 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)   o/ 
/o        SET COMMONAMT = (SELECT NVL(NVL(B.TOTPAY,0),P.FIXPAY * 18 ) /18       통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
        SET COMMONAMT = (SELECT CEIL((B.TOTPAY + B.TONGAMT1 + B.TONGAMT2 + B.TONGAMT3) /12)     
                           FROM PKMPMAS_ES P, PKHYPHIS B
                          WHERE A.EMPNO    = B.EMPNO(+)
                            AND B.YEARPAYNUM (+) = :BASIC_YEARPAYNUM 
                            AND A.EMPNO    = P.EMPNO
                            AND P.BASEDATE = :basedate
                         ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES A  set COMMONAMT=(select CEIL(((((B.\
TOTPAY+B.TONGAMT1)+B.TONGAMT2)+B.TONGAMT3)/12))  from PKMPMAS_ES P ,PKHYPHIS \
B where (((A.EMPNO=B.EMPNO(+) and B.YEARPAYNUM(+)=:b0) and A.EMPNO=P.EMPNO) a\
nd P.BASEDATE=:b1))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )503;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)BASIC_YEARPAYNUM;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1.6.2 통상 임금");
          sprintf(log_buff,"1.6.2 통상 임금");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     UPDATE  PKRETTBL_ES 
        SET  AVGPAYBON = Greatest(nvl(AVGPAYBON,0),nvl(commonamt,0)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set AVGPAYBON=Greatest(nvl(AVGPAYBO\
N,0),nvl(commonamt,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )526;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

        
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1.6.1 통상 임금과 평균임금");
          sprintf(log_buff,"1.6.1 통상 임금과 평균임금");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ========================================================
   1.7 임금인상율/액 적용
 ======================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )541;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.7 임금인상율/액 적용 : [%s]", hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE  PKRETTBL_ES   
        SET  AVGPAYBON = Ceil(AVGPAYBON * (1 + :raiserate / 100 )) + :raiseamt ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set AVGPAYBON=(Ceil((AVGPAYBON* (1+\
(:b0/100))))+:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )560;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&raiserate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&raiseamt;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1.7 임금인상율/액 적용 ");
          sprintf(log_buff,"1.7 임금인상율/액 적용 ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  1.8 근속일수 계산
 ========================================================================== */
     /* EXEC SQL  
     SELECT to_char(sysdate, 'YYYY-MM-DD  HH24:MI:SS')
       into :cur_time
       from dual ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYY-MM-DD  HH24:MI:SS') into :\
b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )583;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)cur_time;
     sqlstm.sqhstl[0] = (unsigned long )25;
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

     
     printf("\n 1.8.1 근속일수 계산 : 실제 근속기준으로 : [%s]", hinsa_sys_date(4) );
     
     /* EXEC SQL
     SELECT  to_char(last_day(to_date(:curpaydate, 'yyyymm')),'yyyymmdd')
       INTO  :v_curpaydate
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(last_day(to_date(:b0,'yyyymm')),'yyyymmd\
d') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )602;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_curpaydate;
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


     
     printf(" ==== 근속기준일 : [%s] ===== ",v_curpaydate);
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES  
        SET DUTYMM = CEIL(MONTHS_BETWEEN(TO_DATE(:v_curpaydate,'YYYYMMDD') + 1 ,
                                         TO_DATE(EMPDATE,'YYYYMMDD') ) ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set DUTYMM=CEIL(MONTHS_BETWEEN((TO_\
DATE(:b0,'YYYYMMDD')+1),TO_DATE(EMPDATE,'YYYYMMDD')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )625;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_curpaydate;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     { 
          print_errmsg(sqlca.sqlcode,"8. 근속일수 계산 ");
          sprintf(log_buff,"8. 근속일수 계산 ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

     printf("\n 1.8.2 근속제외일수 계산 : [%s]",  hinsa_sys_date(4) );
        
     CalcExdd();

/* ==========================================================================
  1.9 실근속일수계산
 ========================================================================== */
     printf("\n 1.9 실근속일수 계산 : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES  
        SET REALMM = DUTYMM - NVL(EXTMM,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set REALMM=(DUTYMM-NVL(EXTMM,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )644;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"9.실근속일수계산");
          sprintf(log_buff,"9.실근속일수계산");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

/* ==========================================================================
  1.10 지급율계산
 ========================================================================== */
     printf("\n 1.10 지급율계산 : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES P 
        SET RETRATE =  ROUND(P.REALMM/12,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES P  set RETRATE=ROUND((P.REALMM/12),2\
)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )659;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

            /* 누진제에서 단수제로 전환작업 RETRATE ->  ROUND(REALMM/12,2) kth 2009.03.17*/
     
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"10.지급율계산");
          sprintf(log_buff,"10.지급율계산");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     
/* =================================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
    4.00      2002.06.21         유효성        임원 퇴직지급율 계산시 직위별 재임기간으로 
    5.00      2004.04.09.        강륜종        임원 퇴직금 계산 안하므로 삭제                                                
==================================================================================== */     
     /* dsa2000  2004.04.09. 임원 퇴직금 계산 안하므로 삭제 
     EXEC SQL
     SELECT COUNT(*)
     INTO  :cnt
     FROM PKHRTDIR
     WHERE CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD') ;
        
     if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
  print_errmsg(sqlca.sqlcode," 임원퇴직금 계산여부 읽기 오류");
  sprintf(log_buff," 임원퇴직금 계산여부 읽기 오류");
        Write_batlog(seqno++, log_buff); 
  error_quit("작업실패...");
     }
     
     if (cnt == 0) 
     {
        print_errmsg(sqlca.sqlcode,"임원 퇴직 지급율 계산 내역 없음");
  error_quit("작업실패...");  
     }

     EXEC SQL
     UPDATE PKRETTBL A    
     SET RETRATE = (SELECT NVL(SUM(NVL(B.CLRETRATE,0)),0) 
                      FROM PKHRTDIR B       
                     WHERE A.EMPNO = B.EMPNO
          AND B.CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD')
                     GROUP BY B.EMPNO)
     WHERE  EMPNO IN (SELECT EMPNO 
                        FROM PKHRTDIR
                       WHERE CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD')
          GROUP BY EMPNO) ;

    if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
  {  print_errmsg(sqlca.sqlcode,"11.퇴직금계산_임원지급율");
   sprintf(log_buff,"11.퇴직금계산_임원지급율");
          Write_batlog(seqno++, log_buff);
   error_quit("작업실패...");
  }  */
    
/**Ver 4.00 추가 END**/

  

/* ==========================================================================
  1.11 퇴직금 계산 
 ========================================================================== */
     printf("\n 1.11.퇴직금 계산 : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKRETTBL_ES  
        SET RETAMT = CEIL(RETRATE * nvl(AVGPAYBON,0)) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set RETAMT=CEIL((RETRATE* nvl(AVGPA\
YBON,0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )674;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"11.퇴직금계산");
          sprintf(log_buff,"11.퇴직금계산");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     

/* ==========================================================================
  1.13 퇴직충당금 TABLE에 INSERT
 ========================================================================== */
     printf("\n 1.13 퇴직충당금 TABLE에 INSERT : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE  PKMRZMAS_ES P
        SET  (RETRATE ,PAY3SUM  ,BON12SUM  ,AVGGROSS   ,
              CYEARTOT,EMPDATE,REALMM,EXTYY,EXTMM,
              TOTMM,TOTYY,TOTDD, PAYCL) =
             (SELECT  R.RETRATE, R.PAY3SUM, R.BON12SUM, R.AVGPAYBON,
                          R.RETAMT, EMPDATE, R.REALMM, FLOOR(EXTMM/12), 
                          EXTMM-FLOOR(EXTMM/12) *12,
                          REALMM - FLOOR(REALMM/12)*12,FLOOR(REALMM/12),
                          LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')) + 1 - TO_DATE(EMPDATE,'YYYYMMDD'),
                          PAYCL
                FROM  PKRETTBL_ES R 
               WHERE  P.EMPNO=R.EMPNO)
      WHERE EMPNO IN (SELECT EMPNO FROM PKRETTBL_ES)
        AND BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES P  set (RETRATE,PAY3SUM,BON12SUM,AVG\
GROSS,CYEARTOT,EMPDATE,REALMM,EXTYY,EXTMM,TOTMM,TOTYY,TOTDD,PAYCL)=(select R.\
RETRATE ,R.PAY3SUM ,R.BON12SUM ,R.AVGPAYBON ,R.RETAMT ,EMPDATE ,R.REALMM ,FLO\
OR((EXTMM/12)) ,(EXTMM-(FLOOR((EXTMM/12))* 12)) ,(REALMM-(FLOOR((REALMM/12))*\
 12)) ,FLOOR((REALMM/12)) ,((LAST_DAY(TO_DATE(:b0,'YYYYMM'))+1)-TO_DATE(EMPDA\
TE,'YYYYMMDD')) ,PAYCL  from PKRETTBL_ES R where P.EMPNO=R.EMPNO) where (EMPN\
O in (select EMPNO  from PKRETTBL_ES ) and BASEDATE=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )689;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"13.퇴직충당금 TABLE에 INSERT");
          sprintf(log_buff,"13.퇴직충당금 TABLE에 INSERT");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}

/* ==========================================================================
  퇴직충당금 분배액 계산
 ========================================================================== */
void CalcMonthamt()
{
/* ==========================================================================
  2.1 기본값 SETTING
 ========================================================================== */
     printf("\n 2.1 기본값 SETTING : [%s]",  hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE  PKMRZMAS_ES                 
        SET  CALCYN  = 'N',         
             RETAMT  =  0 ,             
             CMONTOT = NVL(BMONTOT,0) 
      Where  BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES  set CALCYN='N',RETAMT=0,CMONTOT=NVL\
(BMONTOT,0) where BASEDATE=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )712;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
          print_errmsg(sqlca.sqlcode,"2.1 기본값 SETTING");
          sprintf(log_buff,"2.1 기본값 SETTING");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  2.2 급여지급자 설정
========================================================================== */
     printf("\n 2.2 급여지급자 설정 : [%s]",  hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKMRZMAS_ES A                        
        SET A.BMONTOT = 0,                    
            A.CALCYN  = 'Y'
      WHERE A.EMPNO IN (SELECT B.EMPNO         
                          FROM PKMPMAS_ES B
                         WHERE PSTATE <'80'
                           AND RETDATE IS NULL 
                           AND EMPDATE <= :baseempdate 
                           //infra                              AND PAYCL <>'E0' 
                           AND PAYCL <>'H51'
                           AND BASEDATE = :basedate
                           AND EMPNO not like 'M%')  /oDSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청o/
        AND A.BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A  set A.BMONTOT=0,A.CALCYN='Y' wher\
e (A.EMPNO in (select B.EMPNO  from PKMPMAS_ES B where (((((PSTATE<'80' and R\
ETDATE is null ) and EMPDATE<=:b0) and PAYCL<>'H51') and BASEDATE=:b1) and EM\
PNO not like 'M%')) and A.BASEDATE=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )731;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)baseempdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
     {  
          print_errmsg(sqlca.sqlcode,"2.2 급여지급자 설정");
          sprintf(log_buff,"2.2 급여지급자 설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  2.3 전월누계설정(당해년도)
 ========================================================================== */
     printf("\n 2.3 전월누계설정(당해년도) : [%s]" , hinsa_sys_date(4) );
              
  /* 2001-10-11 유효성 중간정산월 이후 퇴직금만 누계시킨다.*/
  
  /* dsa2000 Tunning  2006.11.27.
   EXEC SQL
   UPDATE PKMRZMAS_ES A1                                    
      SET BMONTOT = (SELECT SUM(NVL(A2.RETAMT,0))        
                       FROM PKHRZHIS_ES A2 , PKMPMAS_ES B      
                      WHERE A2.EMPNO = A1.EMPNO
                        AND A2.EMPNO = B.EMPNO 
                        AND NVL(B.MRTODATE,'0' ) < A2.CALCDATE 
                        AND A2.CALCDATE >= SUBSTR(:curpaydate,1,4)
                        AND A2.CALCDATE <  :curpaydate
                        AND B.PAYDATE    = :basedate
                       GROUP BY A2.EMPNO )               
   WHERE A1.CALCYN = 'Y'
     AND A1.EMPNO IN (SELECT A2.EMPNO                   
                         FROM PKHRZHIS_ES A2 , PKMPMAS_ES B     
                        WHERE A2.EMPNO = B.EMPNO
                          AND NVL(B.MRTODATE,'0') < A2.CALCDATE 
                          AND A2.CALCDATE >= SUBSTR(:curpaydate,1,4)
                          AND A2.CALCDATE <  :curpaydate
                          AND B.PAYDATE    = :basedate
                        GROUP BY A2.EMPNO) ;
*/
     /* EXEC SQL
     UPDATE PKMRZMAS_ES A1                                    
        SET BMONTOT = (SELECT SUM(NVL(RETAMT,0))        
                         FROM PKHRZHIS_ES A2      
                        WHERE EMPNO = A1.EMPNO
                          AND CALCDATE > (select Greatest(SUBSTR(:curpaydate,1,4), NVL(MRTODATE,'0')) 
                                            from PKMPMAS_ES 
                                           where BASEDATE = :basedate 
                                             and A2.empno = empno)  
                          AND CALCDATE < :curpaydate
                          AND BASEDATE = :basedate
                        GROUP BY EMPNO )               
      WHERE A1.CALCYN = 'Y'
        AND A1.EMPNO IN (SELECT EMPNO                   
                           FROM PKHRZHIS_ES A2
                          WHERE CALCDATE > (select Greatest(SUBSTR(:curpaydate,1,4), NVL(MRTODATE,'0')) 
                                              from PKMPMAS_ES 
                                             where BASEDATE = :basedate 
                                               and A2.empno = empno)  
                            AND CALCDATE < :curpaydate
                            AND BASEDATE = :basedate
                          GROUP BY EMPNO) 
        AND A1.BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A1  set BMONTOT=(select sum(NVL(RETA\
MT,0))  from PKHRZHIS_ES A2 where (((EMPNO=A1.EMPNO and CALCDATE>(select Grea\
test(SUBSTR(:b0,1,4),NVL(MRTODATE,'0'))  from PKMPMAS_ES where (BASEDATE=:b1 \
and A2.empno=empno))) and CALCDATE<:b0) and BASEDATE=:b1) group by EMPNO) whe\
re ((A1.CALCYN='Y' and A1.EMPNO in (select EMPNO  from PKHRZHIS_ES A2 where (\
(CALCDATE>(select Greatest(SUBSTR(:b0,1,4),NVL(MRTODATE,'0'))  from PKMPMAS_E\
S where (BASEDATE=:b1 and A2.empno=empno)) and CALCDATE<:b0) and BASEDATE=:b1\
) group by EMPNO)) and A1.BASEDATE=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )758;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)basedate;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)basedate;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[6] = (unsigned long )7;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)basedate;
     sqlstm.sqhstl[7] = (unsigned long )7;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)basedate;
     sqlstm.sqhstl[8] = (unsigned long )7;
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

          
        
                          
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.3 전월누계설정");
          sprintf(log_buff,"2.3 전월누계설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/*2001-10-11 유효성 추가
**당월중간정산자 전월누계설정 
*/    
     /* EXEC SQL 
     UPDATE PKMRZMAS_ES A1                                    
        SET BMONTOT = (SELECT SUM(NVL(A2.RETAMT,0))        
                         FROM PKHRZHIS_ES A2 
                        WHERE A2.EMPNO     = A1.EMPNO
                          AND A2.CALCDATE >= SUBSTR(:curpaydate,1,4)
                          AND A2.CALCDATE <  :curpaydate     
                        GROUP BY A2.EMPNO )               
      WHERE CALCYN   = 'Y'                          
        AND BASEDATE = :basedate
        AND EMPNO IN (SELECT empno
                        from PKHMRHIS
                       where mrtodate = a1.calcdate); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A1  set BMONTOT=(select sum(NVL(A2.R\
ETAMT,0))  from PKHRZHIS_ES A2 where ((A2.EMPNO=A1.EMPNO and A2.CALCDATE>=SUB\
STR(:b0,1,4)) and A2.CALCDATE<:b0) group by A2.EMPNO) where ((CALCYN='Y' and \
BASEDATE=:b2) and EMPNO in (select empno  from PKHMRHIS where mrtodate=a1.cal\
cdate))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )809;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
         print_errmsg(sqlca.sqlcode,"2.3 전월누계설정");
         sprintf(log_buff,"2.3 전월누계설정");
         Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
         error_quit("작업실패...");
     }  
/******2001-10-11******/

/* ==========================================================================
  2.4 당해년도에 중간정산을 받은 경우는 전년 누계를 0으로 setting
 ========================================================================== */
     printf("\n 2.4 당해년도에 중간정산을 받은 경우는 전년 누계를 0으로 setting : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL
     UPDATE PKMRZMAS_ES
        SET BYEARTOT = 0
      WHERE EMPNO in (SELECT EMPNO FROM PKHMRHIS
                       WHERE MRTODATE LIKE SUBSTR(:curpaydate,1,4)||'%'
                         AND MRTODATE < :curpaydate )
        AND CALCYN ='Y'
        AND BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES  set BYEARTOT=0 where ((EMPNO in (se\
lect EMPNO  from PKHMRHIS where (MRTODATE like (SUBSTR(:b0,1,4)||'%') and MRT\
ODATE<:b0)) and CALCYN='Y') and BASEDATE=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )836;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
     {  
          print_errmsg(sqlca.sqlcode,"2.4 당해년도에 중간정산을 받은경우는 전년 누계를 0으로 setting ");
          sprintf(log_buff,"2.4 당해년도에 중간정산을 받은경우는 전년 누계를 0으로 setting ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  2.5 전월누계
 ========================================================================== */
     printf("\n 2.5 전월누계 : [%s]" , hinsa_sys_date(4) );
         
     /* EXEC SQL
     UPDATE PKMRZMAS_ES
        SET BMONTOT = NVL(BMONTOT,0) + NVL(BYEARTOT,0)
      WHERE CALCYN = 'Y'
        AND BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES  set BMONTOT=(NVL(BMONTOT,0)+NVL(BYE\
ARTOT,0)) where (CALCYN='Y' and BASEDATE=:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )863;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
          print_errmsg(sqlca.sqlcode,"2.5 전월누계");
          sprintf(log_buff, "2.5 전월누계");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  2.5.1 잔여액  설정
 ========================================================================== */
     /* EXEC SQL
     UPDATE PKMRZMAS_ES
        SET MONTHAMT  = NVL(CYEARTOT,0) - NVL(BMONTOT,0)
      WHERE CALCYN = 'Y'
        AND BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES  set MONTHAMT=(NVL(CYEARTOT,0)-NVL(B\
MONTOT,0)) where (CALCYN='Y' and BASEDATE=:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )882;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
          print_errmsg(sqlca.sqlcode,"2.5.1 잔여액  설정");
          sprintf(log_buff, "2.5.1 잔여액  설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }  
     
     
/* ==========================================================================
  2.6 당월추계액,당년추계액 계산
 ========================================================================== */
     printf("\n 2.6 당월추계액,당년추계액 계산\n");       
     /* EXEC   SQL
     UPDATE PKMRZMAS_ES A
        SET CALCDATE  = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD'),
            RETAMT    = NVL(MONTHAMT,0),      /o당월충당금o/
            CMONTOT   = NVL(BMONTOT,0) + NVL(MONTHAMT,0),   /o당월충당금누계o/
            WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),
            WRITEMAN  = :jobempno
      WHERE CALCYN = 'Y' 
        AND BASEDATE = :basedate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A  set CALCDATE=TO_CHAR(LAST_DAY(TO_\
DATE(:b0,'YYYYMM')),'YYYYMMDD'),RETAMT=NVL(MONTHAMT,0),CMONTOT=(NVL(BMONTOT,0\
)+NVL(MONTHAMT,0)),WRITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEMAN=:b\
1 where (CALCYN='Y' and BASEDATE=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )901;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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


        /*AND   EMPNO NOT IN ( SELECT EMPNO FROM PKHMRHIS  B       당월 중간정산자는 충당안함 
                      WHERE  A.CALCDATE = B.MRTODATE
                      AND    MRTODATE   = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD')
          ); */
   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.6.1 당월추계액,당년추계액 계산__정산할경우");
          sprintf(log_buff, "2.6.1 당월추계액,당년추계액 계산__정산할경우");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

/* 2001-10-10 유효성 추가*/
/* ==========================================================================
  2.7 당월중간정산자는 당월누계를 0으로
 ========================================================================== */
     printf("\n 2.7 당월중간정산자는 당월누계를 0으로 : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC   SQL
     UPDATE PKMRZMAS_ES A
        SET CMONTOT   = 0 ,
            CYEARTOT  = 0 
      WHERE CALCYN = 'Y' 
        AND BASEDATE = :basedate
        AND EMPNO IN ( SELECT EMPNO FROM PKHMRHIS  B       
                        WHERE A.CALCDATE = B.MRTODATE
                          AND MRTODATE   = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD')
                     ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS_ES A  set CMONTOT=0,CYEARTOT=0 where ((\
CALCYN='Y' and BASEDATE=:b0) and EMPNO in (select EMPNO  from PKHMRHIS B wher\
e (A.CALCDATE=B.MRTODATE and MRTODATE=TO_CHAR(LAST_DAY(TO_DATE(:b1,'YYYYMM'))\
,'YYYYMMDD'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )928;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
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

 
  
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.7  당월중간정산자는 당월누계를 0으로");
          sprintf(log_buff, "2.7  당월중간정산자는 당월누계를 0으로");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
  
}

/* =======================================================



 ======================================================= */

/* =======================================================
  퇴직 평균임금 계산
 ======================================================= */
void CalcAvgGross(char *frempno,char *toempno,char *frdate)
{
     char argfrempno[4+1]="" ;
     char argtoempno[4+1]="" ;
     char argpaydate[6+1]="" ;

     /*--------------------------------------------------------------------------------------------------------*/     
     /* PKCAFLD(통상평균임금항목관리) 테이블적용을 위한 Sql문을 저장하는 변수선언 및 Clear [2018-09-13 이상용] */
     /*--------------------------------------------------------------------------------------------------------*/     
     char   sqlstr[1024];
     char   tmpstr[256];
     char   sqlstr1[1024];
     char   tmpstr1[256];
     char   sumstr1[128];
     char   sumstr2[128];
     
     memset(sqlstr,'\0',sizeof(sqlstr));
     memset(tmpstr,'\0',sizeof(tmpstr));   
     memset(sumstr1,'\0',sizeof(sumstr1));   
     memset(sumstr2,'\0',sizeof(sumstr2));   
     memset(sqlstr1,'\0',sizeof(sqlstr1));
     memset(tmpstr1,'\0',sizeof(tmpstr1));   


/* ================================================ *
  급여/제수당 * 3개월분
* ================================================ */
     sprintf(argfrempno,"%s",frempno);
     sprintf(argtoempno,"%s",toempno);
     sprintf(argpaydate,"%s",frdate);
     
/*  2003.07.07. 강륜종(Dsa2000) Sql Tunning(Hint 추가)...+ index(B I2_PKHPHIS_ES)    */
    if (strcmp(argpaydate,"201804") <= 0)
    {
       /* EXEC SQL
       UPDATE  PKRETTBL_ES  a 
          SET  (PAY3SUM,CALMM) =
               (SELECT /o+ index(B I2_PKHPHIS_ES) o/
       /o2014.11.18 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)    o/
       /o                    NVL(SUM(CEIL((NVL(fixpay,0)+NVL(bfixpay,0)+NVL(sopay,0))*18/12)                   o/
                        nvl(sum(  (case when paydate <= '201412' then (ceil((nvl(fixpay,0)+nvl(bfixpay,0)+nvl(sopay,0) )*18/12)) else NVL(FIXPAY,0)+NVL(SOPAY,0) end) 
                        + LEAST(NVL(roleamt,0), :avgroleamt)  /o2001.11.1 직책수당은 평균직책수당 값 반영  nvl(roleamt,0)+o/
                        + NVL(mateamt,0)    + NVL(partamt,0)
                        + NVL(childamt,0)   + NVL(ovtmamt,0)
                        + NVL(sptmamt,0)    + NVL(mcaramt,0)
                        + NVL(liceamt,0)    + NVL(mbonamt,0)
                        + NVL(sobon,0)      /o2000.9.28. 급여소급에따른 sobon 추가o/
                        + DECODE(NVL(odamt,0),0,0,:avgodamt) /o 2018.03.14 eyha 150000 -> 기준값으로 o/
                        + nvl(itamt,0)      /odsa2000  2005.01. 정보통신수당 추가.o/
                        ), 0)
                        , COUNT(*)
                  FROM  PKHPHIS_ES b
                 WHERE  a.empno = b.empno
                   AND  BASEDATE = :basedate
                   AND  paydate BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'yyyymm'),-2),'yyyymm') AND :argpaydate
               )
        WHERE  empno between :argfrempno and :argtoempno  
         //infra          AND  paycl > '09'          /o paycl >='09';  o/
          AND  paycl >= 'C11' 
          AND  EMPNO not like 'M%'; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 9;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKRETTBL_ES a  set (PAY3SUM,CALMM)=(select  /*\
+  index(B I2_PKHPHIS_ES)  */ nvl(sum((((((((((((( case  when paydate<='20141\
2' then ceil(((((nvl(fixpay,0)+nvl(bfixpay,0))+nvl(sopay,0))* 18)/12)) else (\
NVL(FIXPAY,0)+NVL(SOPAY,0))  end +LEAST(NVL(roleamt,0),:b0))+NVL(mateamt,0))+\
NVL(partamt,0))+NVL(childamt,0))+NVL(ovtmamt,0))+NVL(sptmamt,0))+NVL(mcaramt,\
0))+NVL(liceamt,0))+NVL(mbonamt,0))+NVL(sobon,0))+DECODE(NVL(odamt,0),0,0,:b1\
))+nvl(itamt,0))),0) ,count(*)   from PKHPHIS_ES b where ((a.empno=b.empno an\
d BASEDATE=:b2) and paydate between TO_CHAR(ADD_MONTHS(TO_DATE(:b3,'yyyymm'),\
(-2)),'yyyymm') and :b3)) where ((empno between :b5 and :b6 and paycl>='C11')\
 and EMPNO not like 'M%')";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )951;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)&avgroleamt;
       sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)&avgodamt;
       sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
       sqlstm.sqhsts[1] = (         int  )0;
       sqlstm.sqindv[1] = (         short *)0;
       sqlstm.sqinds[1] = (         int  )0;
       sqlstm.sqharm[1] = (unsigned long )0;
       sqlstm.sqadto[1] = (unsigned short )0;
       sqlstm.sqtdso[1] = (unsigned short )0;
       sqlstm.sqhstv[2] = (unsigned char  *)basedate;
       sqlstm.sqhstl[2] = (unsigned long )7;
       sqlstm.sqhsts[2] = (         int  )0;
       sqlstm.sqindv[2] = (         short *)0;
       sqlstm.sqinds[2] = (         int  )0;
       sqlstm.sqharm[2] = (unsigned long )0;
       sqlstm.sqadto[2] = (unsigned short )0;
       sqlstm.sqtdso[2] = (unsigned short )0;
       sqlstm.sqhstv[3] = (unsigned char  *)argpaydate;
       sqlstm.sqhstl[3] = (unsigned long )7;
       sqlstm.sqhsts[3] = (         int  )0;
       sqlstm.sqindv[3] = (         short *)0;
       sqlstm.sqinds[3] = (         int  )0;
       sqlstm.sqharm[3] = (unsigned long )0;
       sqlstm.sqadto[3] = (unsigned short )0;
       sqlstm.sqtdso[3] = (unsigned short )0;
       sqlstm.sqhstv[4] = (unsigned char  *)argpaydate;
       sqlstm.sqhstl[4] = (unsigned long )7;
       sqlstm.sqhsts[4] = (         int  )0;
       sqlstm.sqindv[4] = (         short *)0;
       sqlstm.sqinds[4] = (         int  )0;
       sqlstm.sqharm[4] = (unsigned long )0;
       sqlstm.sqadto[4] = (unsigned short )0;
       sqlstm.sqtdso[4] = (unsigned short )0;
       sqlstm.sqhstv[5] = (unsigned char  *)argfrempno;
       sqlstm.sqhstl[5] = (unsigned long )5;
       sqlstm.sqhsts[5] = (         int  )0;
       sqlstm.sqindv[5] = (         short *)0;
       sqlstm.sqinds[5] = (         int  )0;
       sqlstm.sqharm[5] = (unsigned long )0;
       sqlstm.sqadto[5] = (unsigned short )0;
       sqlstm.sqtdso[5] = (unsigned short )0;
       sqlstm.sqhstv[6] = (unsigned char  *)argtoempno;
       sqlstm.sqhstl[6] = (unsigned long )5;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
  
       if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
       {
            print_errmsg(sqlca.sqlcode,"1.5.1 급여및 제수당 3개월분...update  \n");
            sprintf(log_buff, "1.5.1 급여및 제수당 3개월분...update");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       }
     } else
     { 
        /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함 Start [2018-09-13 이상용] */
        /* EXEC SQL 
        SELECT REGEXP_REPLACE(WM_CONCAT(DATAFLD), ',', '+')
          INTO :sumstr1  
          FROM PKCAFLD
         WHERE PAYKIND = '2'
           AND DATAFLD IN ('FIXPAY', 'SOPAY')     
           AND SUBSTR(:argpaydate,1,6) BETWEEN FMONTH AND TMONTH; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 9;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select REGEXP_REPLACE(WM_CONCAT(DATAFLD),',','+') in\
to :b0  from PKCAFLD where ((PAYKIND='2' and DATAFLD in ('FIXPAY','SOPAY')) a\
nd SUBSTR(:b1,1,6) between FMONTH and TMONTH)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )994;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)sumstr1;
        sqlstm.sqhstl[0] = (unsigned long )128;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)argpaydate;
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


        
        /* EXEC SQL 
        SELECT REPLACE(REPLACE(REGEXP_REPLACE(WM_CONCAT(DATAFLD), ',', '+'),'ODAMT','DECODE(ODAMT,0,0,AVGODAMT)'),'ROLEAMT', 'LEAST(ROLEAMT, AVGROLEAMT)')   
          INTO :sumstr2  
          FROM PKCAFLD A, PKCPBAS B
         WHERE PAYKIND = '2'
           AND DATAFLD NOT IN ('FIXPAY', 'SOPAY')     
           AND SUBSTR(:argpaydate,1,6) BETWEEN A.FMONTH AND A.TMONTH; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 9;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select REPLACE(REPLACE(REGEXP_REPLACE(WM_CONCAT(DATA\
FLD),',','+'),'ODAMT','DECODE(ODAMT,0,0,AVGODAMT)'),'ROLEAMT','LEAST(ROLEAMT,\
 AVGROLEAMT)') into :b0  from PKCAFLD A ,PKCPBAS B where ((PAYKIND='2' and DA\
TAFLD not  in ('FIXPAY','SOPAY')) and SUBSTR(:b1,1,6) between A.FMONTH and A.\
TMONTH)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1017;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)sumstr2;
        sqlstm.sqhstl[0] = (unsigned long )128;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)argpaydate;
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


        
        sprintf(sqlstr," UPDATE  PKRETTBL_ES  a  SET  (PAY3SUM,CALMM) = ");
        sprintf(tmpstr,"(SELECT /*+ index(B I2_PKHPHIS_ES) */ NVL(SUM(case when substr(paydate,1,6) <= '201412' then CEIL((%s)*18/12) else %s end ",sumstr1, sumstr1);
        strcat(sqlstr,tmpstr);
        memset(tmpstr,'\0',sizeof(tmpstr)); 
        sprintf(tmpstr," + %s ),0), COUNT(*) FROM  PKHPHIS_ES b, pkcpbas c WHERE  a.empno = b.empno AND   BASEDATE = '%s' AND substr(paydate,1,6) BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR('%s',1,6),'yyyymm'),-2),'yyyymm') AND SUBSTR('%s',1,6) )",sumstr2, basedate, argpaydate, argpaydate );
        strcat(sqlstr,tmpstr);
        memset(tmpstr,'\0',sizeof(tmpstr)); 
        sprintf(tmpstr," WHERE  a.empno between '%s' and '%s' AND  paycl >= 'C11' AND  substr(a.empno,1,1) <> 'M' ",argfrempno, argtoempno );
        strcat(sqlstr,tmpstr);
        
/*        printf("PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함1  : %s \n",sqlstr); */
        
        /* EXEC  SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 9;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1040;
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


        /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함 End [2018-09-13 이상용] */
        if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
        {
             print_errmsg(sqlca.sqlcode,"1.5.1 급여및 제수당 3개월분...update  \n");
             sprintf(log_buff, "1.5.1 급여및 제수당 3개월분...update");
             Write_batlog(seqno++, log_buff); 
             error_quit("작업실패...");
        }
/*        printf("PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함2 \n"); */
     } 

/* ================================================ *
  연차수당
* ================================================ */
 /*  2003.09.03. 강륜종(Dsa2000) Sql Tunning(Hint 추가)...  + index(B I2_PKHPHIS_ES)   */        
       /* EXEC SQL
       UPDATE  PKRETTBL_ES  a  
          SET  BON12SUM =
              (SELECT  /o+ index(B I2_PKHPHIS_ES) o/ 
                       SUM( NVL(YBONAMT,0) ) 
                 FROM  PKHPHIS_ES  B
                WHERE  A.EMPNO = B.EMPNO
                  AND  BASEDATE = :basedate
                  AND  PAYDATE BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'YYYYMM'),-11),'YYYYMM')
                  AND  :argpaydate    )
        WHERE  empno between :argfrempno and :argtoempno  
       //infra        and   paycl > '09'
         and  paycl >= 'C11' 
         AND  EMPNO not like 'M%'; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 9;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKRETTBL_ES a  set BON12SUM=(select  /*+  inde\
x(B I2_PKHPHIS_ES)  */ sum(NVL(YBONAMT,0))  from PKHPHIS_ES B where ((A.EMPNO\
=B.EMPNO and BASEDATE=:b0) and PAYDATE between TO_CHAR(ADD_MONTHS(TO_DATE(:b1\
,'YYYYMM'),(-11)),'YYYYMM') and :b1)) where ((empno between :b3 and :b4 and p\
aycl>='C11') and EMPNO not like 'M%')";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )1059;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)basedate;
       sqlstm.sqhstl[0] = (unsigned long )7;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)argpaydate;
       sqlstm.sqhstl[1] = (unsigned long )7;
       sqlstm.sqhsts[1] = (         int  )0;
       sqlstm.sqindv[1] = (         short *)0;
       sqlstm.sqinds[1] = (         int  )0;
       sqlstm.sqharm[1] = (unsigned long )0;
       sqlstm.sqadto[1] = (unsigned short )0;
       sqlstm.sqtdso[1] = (unsigned short )0;
       sqlstm.sqhstv[2] = (unsigned char  *)argpaydate;
       sqlstm.sqhstl[2] = (unsigned long )7;
       sqlstm.sqhsts[2] = (         int  )0;
       sqlstm.sqindv[2] = (         short *)0;
       sqlstm.sqinds[2] = (         int  )0;
       sqlstm.sqharm[2] = (unsigned long )0;
       sqlstm.sqadto[2] = (unsigned short )0;
       sqlstm.sqtdso[2] = (unsigned short )0;
       sqlstm.sqhstv[3] = (unsigned char  *)argfrempno;
       sqlstm.sqhstl[3] = (unsigned long )5;
       sqlstm.sqhsts[3] = (         int  )0;
       sqlstm.sqindv[3] = (         short *)0;
       sqlstm.sqinds[3] = (         int  )0;
       sqlstm.sqharm[3] = (unsigned long )0;
       sqlstm.sqadto[3] = (unsigned short )0;
       sqlstm.sqtdso[3] = (unsigned short )0;
       sqlstm.sqhstv[4] = (unsigned char  *)argtoempno;
       sqlstm.sqhstl[4] = (unsigned long )5;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
      
       if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
       {
            print_errmsg(sqlca.sqlcode,"1.5.2 연차수당...update  \n");
            sprintf(log_buff, "1.5.2 연차수당...update ");
            Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
            error_quit("작업실패...");
       }

        /*printf("\n 1.5.2 연차수당...update   End.... \n");*/
     /* EXEC SQL
     UPDATE  PKRETTBL_ES 
        SET  PAY3SUM  = nvl(PAY3SUM,0),
             BON12SUM = nvl(BON12SUM,0)
      WHERE  empno between :argfrempno and :argtoempno
       //infra           AND  paycl > '09'
       and   paycl >= 'C11' 
       AND  EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set PAY3SUM=nvl(PAY3SUM,0),BON12SUM\
=nvl(BON12SUM,0) where ((empno between :b0 and :b1 and paycl>='C11') and EMPN\
O not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1094;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)argfrempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)argtoempno;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/

     if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
     {
          print_errmsg(sqlca.sqlcode,"1.5.3 null...update  \n");
          sprintf(log_buff, "1.5.2 연차수당...update ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

        /*printf("\n 1.5.3 null...update   End.... \n");*/
     /* EXEC SQL
     UPDATE  PKRETTBL_ES   
        set  AVGPAYBON = ceil(pay3sum/decode(calmm,0,1,calmm)) +
                         ceil(bon12sum/12)
      WHERE  empno between :argfrempno and :argtoempno  
       //infra           AND  paycl > '09'
        and  paycl >= 'C11' 
        AND  EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES  set AVGPAYBON=(ceil((pay3sum/decode\
(calmm,0,1,calmm)))+ceil((bon12sum/12))) where ((empno between :b0 and :b1 an\
d paycl>='C11') and EMPNO not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1117;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)argfrempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)argtoempno;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/

     if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
     {
          print_errmsg(sqlca.sqlcode,"1.5.4 평균임금...update  \n");
          sprintf(log_buff, "1.5.4 평균임금...update  ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}

        /*printf("\n 1.5.4 평균임금...update   End.... \n");*/

/* =======================================================
  퇴직 평균임금 계산  : 휴직자 
 ======================================================= */
void CalcAvgGross_rest()
{
     char  p_empno[4+1]="";
     char  p_maxpaydate[6+1]="";
     printf("\n [퇴직 평균임금 계산  : 휴직자] 1 : [%s]" , hinsa_sys_date(4) );
     
     /* EXEC SQL DECLARE cur2 CURSOR FOR
     SELECT  A.EMPNO, MAX(C.PAYDATE)
       FROM  PKHPHIS_ES C, PKRETTBL_ES A, PKMPMAS_ES B 
      WHERE  A.EMPNO = B.EMPNO               
        AND  A.EMPNO = C.EMPNO
        AND  B.PSTATE  LIKE '7%'
        AND  C.paydate < :curpaydate
        AND  B.BASEDATE = :basedate
        AND  C.BASEDATE = :basedate
      GROUP BY A.EMPNO; */ 

     
     /* EXEC SQL OPEN cur2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0050;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1140;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"1.5.2.1 휴직자 평균 임금 계산중...Open\n");
          sprintf(log_buff, "1.5.2.1 휴직자 평균 임금 계산중...Open ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
           /*printf("\n 1.5.2.1 휴직자 평균 임금 계산   End.... \n");*/
     
     while (1)
     {
          /* EXEC SQL  FETCH  cur2
          INTO :p_empno ,:p_maxpaydate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1167;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)p_empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)p_maxpaydate;
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


     
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cur2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1190;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
          {
               print_errmsg(sqlca.sqlcode,"1.5.2.2 평균 임금 계산중...Cursor\n");
               sprintf(log_buff, "1.5.2.2 평균 임금 계산중...Cursor ");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
          sprintf(p_empno,"%.4s",p_empno);
          sprintf(p_maxpaydate,"%.6s",p_maxpaydate);
          
          /*  printf("\n ~~~ empno[%s],paydate[%s] ",p_empno,p_maxpaydate);*/
          
          CalcAvgGross(p_empno,p_empno,p_maxpaydate);
     }
}

/* ==========================================================================
  근속제외월 계산
 ========================================================================== */
void CalcExdd()
{
     /* EXEC SQL
     UPDATE PKRETTBL_ES R 
        SET
            EXTMM =
            (
            SELECT sum(FLOOR(
                   MONTHS_BETWEEN(
                   TO_DATE(LEAST(A.EXTODATE,:v_curpaydate) ,'YYYYMMDD')+1,
                   TO_DATE(GREATEST(A.EXFRDATE,NVL(BMRTODATE,A.EXFRDATE)),'YYYYMMDD'))))                
              FROM PKMPMAS_ES C, PKHEXDD A,
                   (
                        SELECT EMPNO BEMPNO, MAX(MRTODATE) BMRTODATE 
                          FROM PKHMRHIS
                         WHERE MRTODATE < :curpaydate
                           and empno in (select empno from PKMPMAS_ES where BASEDATE = :basedate) /odsa2000 Tunning Addo/
                         GROUP BY EMPNO
                   )  
             WHERE EXFIXYN ='Y'
               AND A.EMPNO = BEMPNO(+)
               AND A.EMPNO = C.EMPNO
               AND A.EMPNO = R.EMPNO
               AND RETDATE IS NULL
               AND A.EXTODATE  >= NVL(BMRTODATE,A.EXFRDATE)   
               AND C.BASEDATE = :basedate
            )
      WHERE EMPNO IN
            (
            SELECT A.EMPNO
              FROM  PKMPMAS_ES C, PKHEXDD A,
                    (
                      SELECT EMPNO BEMPNO, MAX(MRTODATE) BMRTODATE 
                        FROM PKHMRHIS
                       WHERE MRTODATE < :curpaydate
                         and empno in (select empno from PKMPMAS_ES where BASEDATE = :basedate) /odsa2000 Tunning Addo/
                       GROUP BY EMPNO
                    ) 
             WHERE  EXFIXYN ='Y'
               AND  A.EMPNO = BEMPNO(+)
               AND  A.EMPNO = C.EMPNO      
               AND  RETDATE IS NULL
               AND  A.EXTODATE  >= NVL(BMRTODATE,A.EXFRDATE)      
               AND  C.BASEDATE = :basedate
            ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES R  set EXTMM=(select sum(FLOOR(MONTH\
S_BETWEEN((TO_DATE(LEAST(A.EXTODATE,:b0),'YYYYMMDD')+1),TO_DATE(GREATEST(A.EX\
FRDATE,NVL(BMRTODATE,A.EXFRDATE)),'YYYYMMDD'))))  from PKMPMAS_ES C ,PKHEXDD \
A ,(select EMPNO BEMPNO ,max(MRTODATE) BMRTODATE  from PKHMRHIS where (MRTODA\
TE<:b1 and empno in (select empno  from PKMPMAS_ES where BASEDATE=:b2)) group\
 by EMPNO) where ((((((EXFIXYN='Y' and A.EMPNO=BEMPNO(+)) and A.EMPNO=C.EMPNO\
) and A.EMPNO=R.EMPNO) and RETDATE is null ) and A.EXTODATE>=NVL(BMRTODATE,A.\
EXFRDATE)) and C.BASEDATE=:b2)) where EMPNO in (select A.EMPNO  from PKMPMAS_\
ES C ,PKHEXDD A ,(select EMPNO BEMPNO ,max(MRTODATE) BMRTODATE  from PKHMRHIS\
 where (MRTODATE<:b1 and empno in (select empno  from PKMPMAS_ES where BASEDA\
TE=:b2)) group by EMPNO) where (((((EXFIXYN='Y' and A.EMPNO=BEMPNO(+)) and A.\
EMPNO=C.EMPNO) and RETDATE is null ) and A.EXTODATE>=NVL(BMRTODATE,A.EXFRDATE\
)) and C.BASEDATE=:b2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1205;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_curpaydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)basedate;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)basedate;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)curpaydate;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)basedate;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)basedate;
     sqlstm.sqhstl[6] = (unsigned long )7;
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

   
     
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          print_errmsg(sqlca.sqlcode,"근속제외월수1 계산 중...\n");
          sprintf(log_buff, "근속제외월수 계산 중...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     UPDATE  PKRETTBL_ES R  
        SET  EXTMM = NVL(EXTMM,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL_ES R  set EXTMM=NVL(EXTMM,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1248;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          print_errmsg(sqlca.sqlcode,"근속제외월수2 계산 중...\n");
          sprintf(log_buff, "근속제외월수 계산 중...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

}

/***************************************************************************
  print_errmsg  Function.
 ***************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf("[ERRCODE : %d] %s\n", errcode,errmsg);
/*  printf(" [ERR_CODE] : (%d)\n", errcode);
  printf(" [ERR_POSITION] : (%s)\n",errmsg);

  EXEC SQL
  ROLLBACK WORK RELEASE;
*/  
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
     sqlstm.offset = (unsigned int  )1263;
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
     sqlstm.offset = (unsigned int  )1304;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}