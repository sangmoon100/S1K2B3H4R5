
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
    "pkq4020g.pc"
};


static unsigned int sqlctx = 154131;


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
   unsigned char  *sqhstv[6];
   unsigned long  sqhstl[6];
            int   sqhsts[6];
            short *sqindv[6];
            int   sqinds[6];
   unsigned long  sqharm[6];
   unsigned long  *sqharc[6];
   unsigned short  sqadto[6];
   unsigned short  sqtdso[6];
} sqlstm = {12,6};

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

 static char *sq0044 = 
"select EMPNO ,SUBSTR(BASEDATE,1,6) BASEDATE  from PKHRCHIS where ((PAYDATE=\
:b0 and CONYN='Y') and SUBSTR(ENDTODATE,1,6)>=SUBSTR(:b0,1,6))           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,101,0,4,125,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
28,0,0,2,55,0,4,138,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
51,0,0,3,223,0,3,172,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
74,0,0,4,354,0,5,194,0,0,0,0,0,1,0,
89,0,0,5,264,0,5,216,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
112,0,0,6,476,0,5,257,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
139,0,0,7,223,0,5,281,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
162,0,0,8,41,0,4,306,0,0,1,0,0,1,0,2,97,0,0,
181,0,0,9,22,0,2,325,0,0,0,0,0,1,0,
196,0,0,10,463,0,3,336,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
219,0,0,11,249,0,5,367,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
242,0,0,12,136,0,5,389,0,0,0,0,0,1,0,
257,0,0,13,546,0,5,428,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
288,0,0,14,196,0,5,457,0,0,1,1,0,1,0,1,97,0,0,
307,0,0,15,215,0,5,491,0,0,1,1,0,1,0,1,97,0,0,
326,0,0,16,74,0,5,510,0,0,0,0,0,1,0,
341,0,0,17,69,0,5,526,0,0,2,2,0,1,0,1,4,0,0,1,4,0,0,
364,0,0,18,79,0,4,543,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
387,0,0,19,105,0,5,550,0,0,1,1,0,1,0,1,97,0,0,
406,0,0,20,49,0,5,572,0,0,0,0,0,1,0,
421,0,0,21,53,0,5,588,0,0,0,0,0,1,0,
436,0,0,22,61,0,5,655,0,0,0,0,0,1,0,
451,0,0,23,468,0,5,674,0,0,1,1,0,1,0,1,97,0,0,
470,0,0,24,63,0,5,708,0,0,0,0,0,1,0,
485,0,0,25,246,0,5,725,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
508,0,0,26,472,0,5,751,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
539,0,0,27,274,0,5,780,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
562,0,0,28,155,0,5,807,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
585,0,0,29,78,0,5,827,0,0,0,0,0,1,0,
600,0,0,30,79,0,5,843,0,0,0,0,0,1,0,
615,0,0,31,224,0,5,862,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
638,0,0,32,202,0,5,889,0,0,1,1,0,1,0,1,97,0,0,
657,0,0,33,706,0,5,950,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
696,0,0,34,174,0,4,987,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
719,0,0,35,256,0,4,995,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
742,0,0,36,0,0,24,1016,0,0,1,1,0,1,0,1,97,0,0,
761,0,0,37,640,0,5,1036,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
800,0,0,38,0,0,24,1086,0,0,1,1,0,1,0,1,97,0,0,
819,0,0,39,162,0,5,1113,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
846,0,0,40,279,0,5,1132,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
877,0,0,41,425,0,5,1155,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
916,0,0,42,145,0,5,1180,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
939,0,0,43,169,0,5,1197,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
962,0,0,44,148,0,9,1241,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
985,0,0,44,0,0,13,1256,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
1008,0,0,44,0,0,15,1261,0,0,0,0,0,1,0,
1023,0,0,45,742,0,5,1286,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1050,0,0,46,41,0,5,1332,0,0,0,0,0,1,0,
1065,0,0,47,50,0,3,1363,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1106,0,0,48,0,0,29,1373,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : pkq4020g(퇴직충당금계산)
 SYSTEM-NAME    : 급여   www.ei.go.kr 
 SUBSYSTEM-NAME : 퇴직충당금
 Programmer     : 이랑교
 Version        : 1.00
 Date           : 1999.02.25

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1999.02.25         이랑교          delphi => Pro*C
   1.01       2000.03.28         유효성        연봉차수 변경관련
   1.05       2001.03.13.        유효성        임원 연봉제에 따른 수정(기본급,직무수당 --> 월정연봉으로)   
   3.00       2001.09.06         유효성        계산시점의 실제근속기준으로 정산
                                                -->전반적 재구성 
                                              당월중간정산자는 퇴충은 쌓지만 당월누계는 0으로한다. 
   4.00      2002.06.21         유효성         임원 퇴직지급율 계산시 직위별 재임기간으로 
                                               산정하게 제도 변경됨
   4.01      2002.06.26         유효성         전(2002-2242) 재무관리팀 요청
                                               -->직급='E0'(고문)은 퇴충대상에서 제외 
             2003.07.03.    강륜종(Dsa2000)    퇴충계산의 시간단축을 위한 Sql Tunning
             2003.09.03.    강륜종(Dsa2000)    Sql Tunning(Hint 추가)...  + index(B I2_PKHPHIS)                                               
   Dsa2000   2004.02.04         강륜종         전산(2004-1280호)임원은 퇴충에서 제외(이사대우이상) 
                                               - 2004년부터 급여가 하나로에서 안나가므로.
   4.02      2004.02.24         강륜종         Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.    
   4.03      2004.04.21         강륜종         T_RETTBL 삭제후 HPER계정으로 PKRETTBL 재생성하여 사용토록 함.    
   5.00      2004.11.           강륜종(dsa2000) Rexec대체 서비스를 위한 수정작업.  
   5.01      2005.01.12         DSA2000        월차폐지 및 정보통신수당(ITAMT) 추가에 다른 수정.   
   6.00      2006.01.02         dsa2000        PIMPMAS => PKMPMAS로 변경함.
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

void   Ins_Record();
void   CalcRzAmt();  /* 퇴직충당금계산   */
void   CalcMonthamt();  /* 퇴직충당금분배액계산 */
void   CalcAvgGross(char *frempno,char *toempno,char *frdate);/* 퇴직평균임금 계산   */
void   CalcAvgGross_rest();
void   CalcExdd();  /* 근속제외계산   */
void   print_errmsg(int errcode, char *errmsg);


/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    curpaydate[6+1]       = ""; /* 최종급여월 = (평균임금산정시 기준)*/
     char    baseempdate[8+1]      = ""; /* 입사기준일 = 계산기준월-1년*/
     char    BASIC_YEARPAYNUM[6+1] = ""; /* 기준 연봉차수 */
     double  avgodamt              = 0;  /* 평균자가운전 지원금 */
     double  avgroleamt            = 0;  /* 평균직책수당 */
     char    v_curpaydate[8+1]     = ""; /* */
     char    jobempno[4+1];       /* 작업자*/
     double  raiserate  = 0 ;      /* 임금인상반영시 비율로 인상   = ( 평균임금 * 999 / 100 )*/
     double  raiseamt   = 0 ;      /* 임금인상반영시 금액으로 인상 = ( 평균임금 + 999999 )   */
     int     cnt = 0 ; 
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
     
     if  (argc != 7) {   /* pkq4020g 201901 100 100000 D006 pkq2075g 2004110100000 */
          printf("[Usage] : pkq4020g 1.최종급여지급월 2.임금인상비율 3.임금인상금액 4.작업자사번 5.프로그램ID 6.시작시간 \n");  
          exit(1);
     }   
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq4020g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     memset(UserId,'\0',sizeof(UserId));
     
     sprintf(curpaydate ,"%s",argv[1]);  
     sprintf(t_raiserate,"%s",argv[2]);
     sprintf(t_raiseamt ,"%s",argv[3]);
     sprintf(jobempno   ,"%s",argv[4]);
     sprintf(UserId     ,"%s",argv[5]);
     
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"퇴직충당금 계산 시작...");            
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
      
     raiserate =  atof(t_raiserate);
     raiseamt  =  atof(t_raiseamt);  /* 2003.06.02. PARKSH   t_raiserate를 t_raiseamt 수정  */
     
     /* EXEC SQL
     SELECT to_char(last_day(add_months(to_date(:curpaydate, 'YYYYMM'),-12))+1 ,'YYYYMMDD')
       into :baseempdate
       from dual ; */ 

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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     SELECT  AVGODAMT, AVGROLEAMT 
       into  :avgodamt, :avgroleamt 
       from  PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGODAMT ,AVGROLEAMT into :b0,:b1  from PKCPBAS ";
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }  
      
     Ins_Record();   /* 대상자 추출*/
     CalcRzAmt();  /* 퇴직충당금계산 */
     CalcMonthamt();  /* 퇴직충당금분배액계산 */
     
     /* Dsa2000  2004.02.27.  hinsa_exit()에서 DB Commit & DB접속종료함 .*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [ 작 업 성 공 ] =====\n");
          Write_batlog(seqno++, log_buff); 
          hinsa_exit(0,"OK ====== [ 작 업 성 공 ] =====\n");
     }           
}

void Ins_Record()
{
     /* EXEC SQL  
     INSERT INTO PKMRZMAS 
         (EMPNO) 
          (  SELECT b.EMPNO 
               FROM PKMPMAS b  /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
               WHERE SUBSTR(b.EMPNO,1,1) <> 'Y' 
               AND   (b.ORGEMPDATE <= :baseempdate
                OR    NVL(b.GROUPEMPDATE,'99999999') <= :baseempdate)  /o 2010.01.04 kth 네트웍 입사자 처러 o/
               AND   b.EMPNO not like 'M%'  /oDSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청o/
             MINUS   /o이미 퇴직충당금테이블에 등록되어 있는 사원은 제외o/
             SELECT c.EMPNO 
               FROM PKMRZMAS c 
          ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMRZMAS (EMPNO)(select b.EMPNO  from PKMPM\
AS b where ((SUBSTR(b.EMPNO,1,1)<>'Y' and (b.ORGEMPDATE<=:b0 or NVL(b.GROUPEM\
PDATE,'99999999')<=:b0)) and b.EMPNO not like 'M%') minus select c.EMPNO  fro\
m PKMRZMAS c )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )51;
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
           print_errmsg(sqlca.sqlcode," 대상자 추출 오류");
           sprintf(log_buff, " 대상자 추출 오류");
           Write_batlog(seqno++, log_buff); 
           error_quit("작업실패...");
      }    
       
      /* EXEC SQL
      UPDATE PKMRZMAS a 
         SET (KORNAME, PAYCL, PAYGR, PAYRA, PSTATE, 
              ORGNUM, DEPTCODE, SEX, EMPDATE, RETDATE ) 
           = (SELECT KORNAME, PAYCL, PAYGR, PAYRA, PSTATE, 
                     ORGNUM, DEPTCODE, SEX, 
                     CASE WHEN (EMPNO >= '2358' AND EMPNO <=  '2499') THEN GROUPEMPDATE /o 2010.01.04 kth 네트웍 입사자 처러 o/
                     ELSE ORGEMPDATE                                                   
                     END  ORGEMPDATE,                                               
                     RETDATE
                FROM PKMPMAS b /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
               WHERE b.EMPNO = a.EMPNO ) 
      WHERE a.EMPNO IN (SELECT EMPNO FROM PKMPMAS) ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 2;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRZMAS a  set (KORNAME,PAYCL,PAYGR,PAYRA,PSTA\
TE,ORGNUM,DEPTCODE,SEX,EMPDATE,RETDATE)=(select KORNAME ,PAYCL ,PAYGR ,PAYRA \
,PSTATE ,ORGNUM ,DEPTCODE ,SEX , case  when (EMPNO>='2358' and EMPNO<='2499')\
 then GROUPEMPDATE else ORGEMPDATE  end  ORGEMPDATE ,RETDATE  from PKMPMAS b \
where b.EMPNO=a.EMPNO) where a.EMPNO in (select EMPNO  from PKMPMAS )";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )74;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


      
      if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {  
           print_errmsg(sqlca.sqlcode," 대상자 UPDATE 오류");
           sprintf(log_buff, " 대상자 UPDATE 오류");
           Write_batlog(seqno++, log_buff); 
           error_quit("작업실패...");
      }  
          
      /* EXEC SQL
      UPDATE PKMRZMAS A 
         SET A.DIVCODE = (SELECT B.BONCODE 
                            FROM PYCDEPT B 
                           WHERE A.ORGNUM   = B.ORGNUM
                             and A.DEPTCODE = B.DEPTCODE ),
             A.CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD')                             
       WHERE PSTATE  < '80' 
         AND EMPDATE <= :baseempdate 
         AND PAYCL   <>'H51'  /oinfra         AND PAYCL   <>'E0' o/
         AND EMPNO not like 'M%'; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 2;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRZMAS A  set A.DIVCODE=(select B.BONCODE  fr\
om PYCDEPT B where (A.ORGNUM=B.ORGNUM and A.DEPTCODE=B.DEPTCODE)),A.CALCDATE=\
to_char(last_day(to_date(:b0,'YYYYMM')),'YYYYMMDD') where (((PSTATE<'80' and \
EMPDATE<=:b1) and PAYCL<>'H51') and EMPNO not like 'M%')";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )89;
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
           Write_batlog(seqno++, log_buff); 
           error_quit("작업실패...");
      }  
      
      /*EXEC SQL  DSA2000 위 쿼리에 병합.   2006.12.
      UPDATE PKMRZMAS 
         SET CALCDATE = to_char(last_day(to_date(:curpaydate,'YYYYMM')), 'YYYYMMDD')
       WHERE PSTATE  < '80' 
         AND EMPDATE <= :baseempdate                                                
         AND PAYCL <>'E0'     -->직급='E0'(고문)은 퇴충대상에서제외 
         AND EMPNO not like 'M%';  DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청
       
      if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {  
       print_errmsg(sqlca.sqlcode," CALCDATE UPDATE 오류");
       sprintf(log_buff, " CALCDATE UPDATE 오류");
                 Write_batlog(seqno++, log_buff);
       error_quit("작업실패...");
      }            */ 
       
/*1월이면 신년도 clear*/     
     sprintf(tempmm, "%s", curpaydate+4) ;   
     if  (strcmp(tempmm, "01") == 0)  
     {
          printf("\n 신년도 CLEAR ");
          /* EXEC SQL         
          UPDATE PKMRZMAS A 
             SET (BYEARTOT, BMONTOT, CMONTOT, CYEARTOT, RETAMT)
               = (SELECT nvl(CMONTOT,0), nvl(CMONTOT,0), 0, 0, 0 
                    FROM PKHRZHIS B 
                   WHERE A.EMPNO = B.EMPNO 
                     AND B.CALCDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%' )
           WHERE A.PSTATE < '80'
             AND EMPDATE  <= :baseempdate
             AND A.PAYCL  <> 'H51'    /oinfra          AND A.PAYCL  <> 'E0'   o/
             AND EMPNO not like 'M%'  /oDSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청o/
             AND EXISTS (SELECT 1 FROM PKHRZHIS C 
                         WHERE C.EMPNO = A.EMPNO 
                           AND C.CALCDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%') ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRZMAS A  set (BYEARTOT,BMONTOT,CMONTOT,C\
YEARTOT,RETAMT)=(select nvl(CMONTOT,0) ,nvl(CMONTOT,0) ,0 ,0 ,0  from PKHRZHI\
S B where (A.EMPNO=B.EMPNO and B.CALCDATE like (TO_CHAR(ADD_MONTHS(TO_DATE(:b\
0,'YYYYMM'),(-12)),'YYYY')||'12%'))) where ((((A.PSTATE<'80' and EMPDATE<=:b1\
) and A.PAYCL<>'H51') and EMPNO not like 'M%') and exists (select 1  from PKH\
RZHIS C where (C.EMPNO=A.EMPNO and C.CALCDATE like (TO_CHAR(ADD_MONTHS(TO_DAT\
E(:b0,'YYYYMM'),(-12)),'YYYY')||'12%'))))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )112;
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
               print_errmsg(sqlca.sqlcode," 신년도 CLEAR 1 오류");
               sprintf(log_buff, " 신년도 CLEAR 1 오류");
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...");
          }                                                   
            
            /* Dsa2000 추가  12월에 중간정산자는 전년도 누계액을 0으로 Setting 2006.02.*/
          /* EXEC SQL         
          UPDATE PKMRZMAS A 
             SET BYEARTOT = 0
           WHERE A.PSTATE <  '80'
             AND EMPDATE  <= :baseempdate
             AND A.PAYCL  <> 'H51'   /oinfra          AND A.PAYCL  <> 'E0'o/
             AND EMPNO in (SELECT empno FROM pkhmrhis 
                            WHERE mrtodate like TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM') ,-12),'YYYY')||'12%'); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRZMAS A  set BYEARTOT=0 where (((A.PSTAT\
E<'80' and EMPDATE<=:b0) and A.PAYCL<>'H51') and EMPNO in (select empno  from\
 pkhmrhis where mrtodate like (TO_CHAR(ADD_MONTHS(TO_DATE(:b1,'YYYYMM'),(-12)\
),'YYYY')||'12%')))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )139;
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


          
          if  ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
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
void  CalcRzAmt()
{
     /* EXEC SQL
     SELECT YEARPAYNUM 
       into :BASIC_YEARPAYNUM
       from PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select YEARPAYNUM into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )162;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
  
  
/* ========================================================
 1.1 대상자 추출 : 입사기준일 이전 입사자 중  재직자
======================================================== */
     printf("\n 1.1 대상자 추출 : 입사기준일 이전 입사자 중  재직자 ");
     
     /* EXEC SQL
     DELETE FROM PKRETTBL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKRETTBL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )181;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  /* DSA2000   2004.04.21.  DELETE FROM T_RETTBL; */
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1. 대상자 추출1  ERROR");
          sprintf(log_buff,"1. 대상자 추출  ERROR");
          Write_batlog(seqno++, log_buff);    
          error_quit("작업실패...");
     }
     
     
     /* EXEC SQL
     INSERT  INTO PKRETTBL 
             (EMPNO, ORGEMPDATE, EMPDATE, PAYCL, PAYGR1, PAYGR2)  /o DSA2000   2004.04.21. T_RETTBL => PKRETTBL o/
     SELECT  EMPNO, 
             CASE WHEN (EMPNO >= '2358' AND EMPNO <=  '2499') THEN GROUPEMPDATE    /o 2010.01.04 kth 네트웍 입사자 처러 o/
             ELSE ORGEMPDATE                                                   
             END  ORGEMPDATE, 
             case WHEN (EMPNO >= '2358' AND EMPNO <=  '2499') THEN GROUPEMPDATE    /o 2010.01.04 kth 네트웍 입사자 처러 o/
             ELSE ORGEMPDATE                                                   
             END  ORGEMPDATE,               
             PAYCL, PAYGR , PAYGR 
       FROM  PKMPMAS               /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
      WHERE  (ORGEMPDATE <= :baseempdate
         OR   NVL(GROUPEMPDATE,'99999999') <= :baseempdate)                       /o 2010.01.04 kth 네트웍 입사자 처러 o/
        AND  SUBSTR(EMPNO,1,1) <> 'Y' 
        AND  PSTATE < '80'
        AND  PAYCL  <>'H51'         /oinfra          AND A.PAYCL  <> 'E0' 유효성  2002.06.26  직급='E0'(고문)은 퇴충대상에서제외 o/ 
        AND  EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKRETTBL (EMPNO,ORGEMPDATE,EMPDATE,PAYCL,PA\
YGR1,PAYGR2)select EMPNO , case  when (EMPNO>='2358' and EMPNO<='2499') then \
GROUPEMPDATE else ORGEMPDATE  end  ORGEMPDATE , case  when (EMPNO>='2358' and\
 EMPNO<='2499') then GROUPEMPDATE else ORGEMPDATE  end  ORGEMPDATE ,PAYCL ,PA\
YGR ,PAYGR  from PKMPMAS where (((((ORGEMPDATE<=:b0 or NVL(GROUPEMPDATE,'9999\
9999')<=:b0) and SUBSTR(EMPNO,1,1)<>'Y') and PSTATE<'80') and PAYCL<>'H51') a\
nd EMPNO not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )196;
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

  /*DSA2000 2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"1. 대상자 추출  ERROR");
          sprintf(log_buff,"1. 대상자 추출2  ERROR");
          Write_batlog(seqno++, log_buff);    
          error_quit("작업실패...");
     }

/* ========================================================
   1.2 중간정산 반영
 ======================================================== */
     printf("\n 1.2 중간정산 반영");
     /* EXEC SQL
     UPDATE PKRETTBL  A   /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET (EMPDATE )  = (
                           SELECT TO_CHAR(TO_DATE(MAX(MRTODATE),'YYYYMMDD')+1 , 'YYYYMMDD' )
                             FROM PKHMRHIS B
                           WHERE A.EMPNO = B.EMPNO
                             AND B.MRTODATE < :curpaydate
                           GROUP BY B.EMPNO ) 
      WHERE EMPNO IN (SELECT DISTINCT EMPNO FROM PKHMRHIS 
                       WHERE MRTODATE < :curpaydate ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL A  set (EMPDATE)=(select TO_CHAR((TO_DA\
TE(max(MRTODATE),'YYYYMMDD')+1),'YYYYMMDD')  from PKHMRHIS B where (A.EMPNO=B\
.EMPNO and B.MRTODATE<:b0) group by B.EMPNO) where EMPNO in (select distinct \
EMPNO  from PKHMRHIS where MRTODATE<:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )219;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2. 중간정산 반영");  
          sprintf(log_buff,"2. 중간정산 반영");
          Write_batlog(seqno++, log_buff);   
          error_quit("작업실패...");
     }



     /* 퇴직기산일 특이자 update 추가 Start [2018-09-13 이상용] */
     /* EXEC SQL
     UPDATE PKRETTBL S SET
            EMPDATE = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO )
      WHERE EMPNO IN (SELECT EMPNO FROM PKZRTSPC ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL S  set EMPDATE=(select RETCALCDATE  fro\
m PKZRTSPC T where S.EMPNO=T.EMPNO) where EMPNO in (select EMPNO  from PKZRTS\
PC )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )242;
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
        /*printf("\n 1.3 퇴직 직급반영 : 일반사원 : 10 &&  임원이사대우: 직급그대로 ");
  EXEC SQL
  UPDATE   PKRETTBL   DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL 
  SET   RETCL = '10'
  WHERE   RETCL < '00' OR RETCL > '09' ;

  if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
  {  
   print_errmsg(sqlca.sqlcode,"3. 퇴직 직급반영");
   sprintf(log_buff,"3. 퇴직 직급반영");
             Write_batlog(seqno++, log_buff); 
   error_quit("작업실패...");  
  }*/


/* ========================================================
   1.4 임원 평균임금 산정
 ======================================================== */
     printf("\n 1.4 임원 평균임금 산정 ");
     /* EXEC SQL
     UPDATE PKRETTBL P
        SET (PAY3SUM, BON12SUM, CALMM) =
          /o(SELECT nvl(sum((ceil((nvl(fixpay,0)+nvl(bfixpay,0)+nvl(sopay,0) )*18/12)) +  o/
            (SELECT nvl(sum((ceil((nvl(fixpay,0)+nvl(bfixpay,0)+nvl(sopay,0) ))) +    /o2014.11.14 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
                             least(nvl(roleamt,0), :avgroleamt) +
                             nvl(mateamt,0)+nvl(partamt,0)+nvl(childamt,0)+
                             nvl(ovtmamt,0)+nvl(sptmamt,0)+nvl(mcaramt,0)+
                             nvl(liceamt,0)+nvl(mbonamt,0)+nvl(sobon,0)+  
                             decode(nvl(odamt,0),0,0,:avgodamt)  
                            ),0),  
                    0, 
                    COUNT(EMPNO)
               FROM PKHPHIS R
              WHERE P.EMPNO = R.EMPNO
                AND SUBSTR(R.PAYDATE,1,6)>=TO_CHAR(ADD_MONTHS(TO_DATE(:curpaydate,'YYYYMM'),-2),'YYYYMM')
                AND SUBSTR(R.PAYDATE,1,6)<=:curpaydate)
      where paycl <= 'A99'        /oinfra        where paycl <= '09'o/
        AND EMPNO like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL P  set (PAY3SUM,BON12SUM,CALMM)=(select\
 nvl(sum((((((((((((ceil(((nvl(fixpay,0)+nvl(bfixpay,0))+nvl(sopay,0)))+least\
(nvl(roleamt,0),:b0))+nvl(mateamt,0))+nvl(partamt,0))+nvl(childamt,0))+nvl(ov\
tmamt,0))+nvl(sptmamt,0))+nvl(mcaramt,0))+nvl(liceamt,0))+nvl(mbonamt,0))+nvl\
(sobon,0))+decode(nvl(odamt,0),0,0,:b1))),0) ,0 ,count(EMPNO)  from PKHPHIS R\
 where ((P.EMPNO=R.EMPNO and SUBSTR(R.PAYDATE,1,6)>=TO_CHAR(ADD_MONTHS(TO_DAT\
E(:b2,'YYYYMM'),(-2)),'YYYYMM')) and SUBSTR(R.PAYDATE,1,6)<=:b2)) where (payc\
l<='A99' and EMPNO like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )257;
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
     sqlstm.sqhstv[2] = (unsigned char  *)curpaydate;
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
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }
        
     /*임원평균임금=(기본연봉+업적연봉+중식비연간총액)/12 */
     /* EXEC SQL
     UPDATE  PKRETTBL a
        SET  AVGPAYBON =  (select ceil((nvl(totpay,0) + avgmcaramt)/12)  
                             from pkhyphis  b, pkcpbas c
                            where a.empno = b.empno
                              and b.yearpaynum(+) = :BASIC_YEARPAYNUM)
      where  paycl <= 'A99'  /oinfra        where paycl <= '09'o/
        AND  EMPNO like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL a  set AVGPAYBON=(select ceil(((nvl(tot\
pay,0)+avgmcaramt)/12))  from pkhyphis b ,pkcpbas c where (a.empno=b.empno an\
d b.yearpaynum(+)=:b0)) where (paycl<='A99' and EMPNO like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )288;
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
          print_errmsg(sqlca.sqlcode,"1.6.1 임원 통상 임금과 평균임금");
          sprintf(log_buff,"1.6.1 임원 통상 임금과 평균임금");
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...");
     }

/* ========================================================
   1.5 임원제외 평균임금 산정  
 ======================================================== */
     printf("\n 1.5 임원제외 평균임금 산정 ");
     CalcAvgGross("0000","zzzz",curpaydate);

/* ========================================================
   1.  휴직자
 ======================================================== */
     printf("\n 1.5.2 휴직자 평균임금 산정 ");
     CalcAvgGross_rest();

/* ========================================================
   1.6 통상 임금
 ======================================================== */
     printf("\n 1.6 통상 임금 ");
  
     /* EXEC SQL
     UPDATE  PKRETTBL  A   /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET  COMMONAMT =
/o          (SELECT NVL(NVL(B.TOTPAY,0),P.FIXPAY * 18 ) /18   통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
            (SELECT NVL(CEIL((B.TOTPAY + B.TONGAMT1 + B.TONGAMT2 + B.TONGAMT3) /12), P.FIXPAY)   /o  2014.11.14 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
               FROM PKMPMAS P, PKHYPHIS B
              WHERE A.EMPNO = B.EMPNO(+)
                AND B.YEARPAYNUM (+) = :BASIC_YEARPAYNUM 
                AND A.EMPNO = P.EMPNO
             ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL A  set COMMONAMT=(select NVL(CEIL(((((B\
.TOTPAY+B.TONGAMT1)+B.TONGAMT2)+B.TONGAMT3)/12)),P.FIXPAY)  from PKMPMAS P ,P\
KHYPHIS B where ((A.EMPNO=B.EMPNO(+) and B.YEARPAYNUM(+)=:b0) and A.EMPNO=P.E\
MPNO))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )307;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     UPDATE  PKRETTBL    /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET  AVGPAYBON = Greatest(nvl(AVGPAYBON,0),nvl(commonamt,0)) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set AVGPAYBON=Greatest(nvl(AVGPAYBON,0\
),nvl(commonamt,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )326;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
/* ========================================================
   1.7 임금인상율/액 적용
 ======================================================== */
     printf("\n 1.7 임금인상율/액 적용 ");
     /* EXEC SQL
     UPDATE  PKRETTBL     /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET  AVGPAYBON = Ceil(AVGPAYBON * (1 + :raiserate / 100 )) + :raiseamt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set AVGPAYBON=(Ceil((AVGPAYBON* (1+(:b\
0/100))))+:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )341;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
/* ==========================================================================
  1.8 근속일수 계산
 ========================================================================== */
     printf("\n 1.8.1 근속일수 계산 : 실제 근속기준으로 ");

     /* EXEC SQL
     SELECT   to_char(last_day(to_date(:curpaydate, 'yyyymm')),'yyyymmdd')
       INTO   :v_curpaydate
       FROM   DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(last_day(to_date(:b0,'yyyymm')),'yyyymmd\
d') into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )364;
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



     printf("\n 근속기준일 : [%s]",v_curpaydate);

     /* EXEC SQL
     UPDATE PKRETTBL     /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET DUTYMM = CEIL(MONTHS_BETWEEN(TO_DATE(:v_curpaydate,'YYYYMMDD') + 1 ,
                                         TO_DATE(EMPDATE,'YYYYMMDD')
                                        )
                        ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set DUTYMM=CEIL(MONTHS_BETWEEN((TO_DAT\
E(:b0,'YYYYMMDD')+1),TO_DATE(EMPDATE,'YYYYMMDD')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )387;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }

     printf("\n 1.8.2 근속제외일수 계산 ");
     CalcExdd();

/* ==========================================================================
  1.9 실근속일수계산
 ========================================================================== */
     printf("\n 1.9 실근속일수 계산 ");
     /* EXEC SQL
     UPDATE PKRETTBL     /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET REALMM = DUTYMM - NVL(EXTMM,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set REALMM=(DUTYMM-NVL(EXTMM,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )406;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }

/* ==========================================================================
  1.10 지급율계산
 ========================================================================== */
     printf("\n 1.10 지급율계산");
     /* EXEC SQL
     UPDATE PKRETTBL P    /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
     SET RETRATE =  ROUND(P.REALMM/12,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL P  set RETRATE=ROUND((P.REALMM/12),2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )421;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
  
  
/* =================================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
    4.00      2002.06.21         유효성        임원 퇴직지급율 계산시 직위별 재임기간으로 
                                               산정하게 제도 변경됨
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
      WHERE EMPNO IN (SELECT EMPNO 
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
     printf("\n 1.11.퇴직금 계산 ");
     /* EXEC SQL
     UPDATE PKRETTBL    /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
     SET RETAMT = CEIL(RETRATE * nvl(AVGPAYBON,0)) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set RETAMT=CEIL((RETRATE* nvl(AVGPAYBO\
N,0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )436;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     

/* ==========================================================================
  1.13 퇴직충당금 TABLE에 INSERT
 ========================================================================== */

     printf("\n 1.13 퇴직충당금 TABLE에 INSERT");
     
     /* EXEC SQL
     UPDATE PKMRZMAS P
        SET        (RETRATE ,PAY3SUM,  BON12SUM,  AVGGROSS   ,
                    CYEARTOT,EMPDATE,  REALMM,    EXTYY,EXTMM,
                    TOTMM,TOTYY,TOTDD,
                    PAYCL) =
            (SELECT R.RETRATE, R.PAY3SUM, R.BON12SUM, R.AVGPAYBON,
                    R.RETAMT, EMPDATE, R.REALMM, FLOOR(EXTMM/12), 
                    EXTMM-FLOOR(EXTMM/12) *12,
                    REALMM - FLOOR(REALMM/12)*12,FLOOR(REALMM/12),
                    LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')) + 1 - TO_DATE(EMPDATE,'YYYYMMDD'),
                    PAYCL
               FROM PKRETTBL R    /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
              WHERE P.EMPNO=R.EMPNO)
     WHERE EMPNO IN (SELECT EMPNO FROM PKRETTBL); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS P  set (RETRATE,PAY3SUM,BON12SUM,AVGGRO\
SS,CYEARTOT,EMPDATE,REALMM,EXTYY,EXTMM,TOTMM,TOTYY,TOTDD,PAYCL)=(select R.RET\
RATE ,R.PAY3SUM ,R.BON12SUM ,R.AVGPAYBON ,R.RETAMT ,EMPDATE ,R.REALMM ,FLOOR(\
(EXTMM/12)) ,(EXTMM-(FLOOR((EXTMM/12))* 12)) ,(REALMM-(FLOOR((REALMM/12))* 12\
)) ,FLOOR((REALMM/12)) ,((LAST_DAY(TO_DATE(:b0,'YYYYMM'))+1)-TO_DATE(EMPDATE,\
'YYYYMMDD')) ,PAYCL  from PKRETTBL R where P.EMPNO=R.EMPNO) where EMPNO in (s\
elect EMPNO  from PKRETTBL )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )451;
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
          Write_batlog(seqno++, log_buff); 
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
     printf("\n 2.1 기본값 SETTING");
     /* EXEC SQL
     UPDATE  PKMRZMAS                 
     SET   CALCYN  = 'N',         
      RETAMT  =  0 ,             
      CMONTOT = NVL(BMONTOT,0) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS  set CALCYN='N',RETAMT=0,CMONTOT=NVL(BM\
ONTOT,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )470;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    print_errmsg(sqlca.sqlcode,"2.1 기본값 SETTING");
          sprintf(log_buff,"2.1 기본값 SETTING");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
   
/* ==========================================================================
  2.2 급여지급자 설정
========================================================================== */
     printf("\n 2.2 급여지급자 설정");
     /* EXEC SQL
     UPDATE PKMRZMAS A                        
        SET A.BMONTOT = 0,                    
            A.CALCYN  = 'Y'
      WHERE A.EMPNO IN (SELECT  B.EMPNO         
                          FROM  PKMPMAS B  /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
                         WHERE  PSTATE <'80'
                           AND  RETDATE IS NULL 
                           AND  (ORGEMPDATE <= :baseempdate 
                            OR    NVL(b.GROUPEMPDATE,'99999999') <= :baseempdate)     /o 2010.01.04 kth 네트웍 입사자 처러 o/
                           AND  PAYCL <>'H51'  /o//infra                              AND PAYCL <>'E0' o/
                           AND  EMPNO not like 'M%'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS A  set A.BMONTOT=0,A.CALCYN='Y' where A\
.EMPNO in (select B.EMPNO  from PKMPMAS B where ((((PSTATE<'80' and RETDATE i\
s null ) and (ORGEMPDATE<=:b0 or NVL(b.GROUPEMPDATE,'99999999')<=:b0)) and PA\
YCL<>'H51') and EMPNO not like 'M%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )485;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.2 급여지급자 설정");
          sprintf(log_buff,"2.2 급여지급자 설정");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
   
/* ==========================================================================
  2.3 전월누계설정(당해년도)
 ========================================================================== */
      printf("\n 2.3 전월누계설정(당해년도)");
      /* 2001-10-11 유효성 :  중간정산월 이후 퇴직금만 누계시킨다.*/
      /* EXEC SQL
      UPDATE PKMRZMAS A1                                    
         SET BMONTOT = (SELECT SUM(NVL(A2.RETAMT,0))        
                          FROM PKHRZHIS A2 , PKMPMAS B      
                         WHERE A2.EMPNO = A1.EMPNO
                           AND A2.EMPNO = B.EMPNO
                           AND NVL(B.MRTODATE,'0' ) < A2.CALCDATE 
                           AND A2.CALCDATE >= SUBSTR(:curpaydate,1,4) 
                           AND A2.CALCDATE <  :curpaydate
                         GROUP BY A2.EMPNO )               
       WHERE A1.CALCYN = 'Y'
         AND A1.EMPNO IN (SELECT A3.EMPNO                   
                            FROM PKHRZHIS A3 , PKMPMAS B     
                           WHERE A3.EMPNO = B.EMPNO   
                             AND NVL(B.MRTODATE,'0') < A3.CALCDATE
                             AND (A3.CALCDATE >= SUBSTR(:curpaydate,1,4) 
                             AND  A3.CALCDATE <  :curpaydate)    
                           GROUP BY A3.EMPNO ) ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRZMAS A1  set BMONTOT=(select sum(NVL(A2.RET\
AMT,0))  from PKHRZHIS A2 ,PKMPMAS B where ((((A2.EMPNO=A1.EMPNO and A2.EMPNO\
=B.EMPNO) and NVL(B.MRTODATE,'0')<A2.CALCDATE) and A2.CALCDATE>=SUBSTR(:b0,1,\
4)) and A2.CALCDATE<:b0) group by A2.EMPNO) where (A1.CALCYN='Y' and A1.EMPNO\
 in (select A3.EMPNO  from PKHRZHIS A3 ,PKMPMAS B where ((A3.EMPNO=B.EMPNO an\
d NVL(B.MRTODATE,'0')<A3.CALCDATE) and (A3.CALCDATE>=SUBSTR(:b0,1,4) and A3.C\
ALCDATE<:b0)) group by A3.EMPNO))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )508;
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
      sqlstm.sqhstv[2] = (unsigned char  *)curpaydate;
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
     {    print_errmsg(sqlca.sqlcode,"2.3 전월누계설정");
          sprintf(log_buff,"2.3 전월누계설정");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
   /*2001-10-11 유효성 추가
   **당월중간정산자 전월누계설정 
   */
     /* EXEC SQL 
     UPDATE PKMRZMAS A1                                    
        SET BMONTOT = (SELECT SUM(NVL(A2.RETAMT,0))        
                         FROM PKHRZHIS A2 
                        WHERE (A2.EMPNO = A1.EMPNO)  AND                               
                              (A2.CALCDATE >= SUBSTR(:curpaydate,1,4) AND  
                               A2.CALCDATE <  :curpaydate )     
                        GROUP BY A2.EMPNO )               
     WHERE (A1.CALCYN = 'Y') AND                         
           (A1.EMPNO IN (SELECT empno
                           from pkhmrhis
                          where mrtodate = a1.calcdate))  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS A1  set BMONTOT=(select sum(NVL(A2.RETA\
MT,0))  from PKHRZHIS A2 where (A2.EMPNO=A1.EMPNO and (A2.CALCDATE>=SUBSTR(:b\
0,1,4) and A2.CALCDATE<:b0)) group by A2.EMPNO) where (A1.CALCYN='Y' and A1.E\
MPNO in (select empno  from pkhmrhis where mrtodate=a1.calcdate))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )539;
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


         
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.3 전월누계설정");
          sprintf(log_buff,"2.3 전월누계설정");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }                        
/******2001-10-11******/

/* ==========================================================================
  2.4 당해년도에 중간정산을 받은 경우는 전년 누계를 0으로 setting
 ========================================================================== */
     printf("\n 2.4 당해년도에 중간정산을 받은 경우는 전년 누계를 0으로 setting");
      
     /* EXEC SQL
     UPDATE PKMRZMAS
        SET BYEARTOT = 0
      WHERE EMPNO in (SELECT EMPNO FROM PKHMRHIS
                       WHERE MRTODATE LIKE SUBSTR(:curpaydate,1,4)||'%'
                         AND MRTODATE < :curpaydate )
        AND CALCYN ='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS  set BYEARTOT=0 where (EMPNO in (select\
 EMPNO  from PKHMRHIS where (MRTODATE like (SUBSTR(:b0,1,4)||'%') and MRTODAT\
E<:b0)) and CALCYN='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )562;
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


   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.4 당해년도에 중간정산을 받은경우는 전년 누계를 0으로 setting ");
          sprintf(log_buff,"2.4 당해년도에 중간정산을 받은경우는 전년 누계를 0으로 setting ");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
   
/* ==========================================================================
  2.5 전월누계
 ========================================================================== */
     printf("\n 2.5 전월누계");
     /* EXEC SQL
     UPDATE PKMRZMAS
        SET BMONTOT = NVL(BMONTOT,0) + NVL(BYEARTOT,0)
      WHERE CALCYN = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS  set BMONTOT=(NVL(BMONTOT,0)+NVL(BYEART\
OT,0)) where CALCYN='Y'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )585;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.5 전월누계");
          sprintf(log_buff, "2.5 전월누계");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }

/* ==========================================================================
  2.5.1 잔여액  설정
 ========================================================================== */
     /* EXEC SQL
     UPDATE PKMRZMAS
        SET MONTHAMT  = NVL(CYEARTOT,0) - NVL(BMONTOT,0)
      WHERE CALCYN = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS  set MONTHAMT=(NVL(CYEARTOT,0)-NVL(BMON\
TOT,0)) where CALCYN='Y'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )600;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.5.1 잔여액  설정");
          sprintf(log_buff, "2.5.1 잔여액  설정");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }  


/* ==========================================================================
  2.6 당월추계액,당년추계액 계산
 ========================================================================== */
     printf("\n 2.6 당월추계액,당년추계액 계산\n");
     
     /* EXEC   SQL
     UPDATE PKMRZMAS A
        SET CALCDATE  = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD'),
            RETAMT    = NVL(MONTHAMT,0),      /o당월충당금o/
            CMONTOT   = NVL(BMONTOT,0) + NVL(MONTHAMT,0),   /o당월충당금누계o/
            WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),
            WRITEMAN  = :jobempno
      WHERE CALCYN = 'Y' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS A  set CALCDATE=TO_CHAR(LAST_DAY(TO_DAT\
E(:b0,'YYYYMM')),'YYYYMMDD'),RETAMT=NVL(MONTHAMT,0),CMONTOT=(NVL(BMONTOT,0)+N\
VL(MONTHAMT,0)),WRITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEMAN=:b1 w\
here CALCYN='Y'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )615;
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
                           WHERE A.CALCDATE = B.MRTODATE
                             AND MRTODATE   = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD')
     ); */

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  
          print_errmsg(sqlca.sqlcode,"2.6.1 당월추계액,당년추계액 계산__정산할경우");
          sprintf(log_buff, "2.6.1 당월추계액,당년추계액 계산__정산할경우");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }

/* 2001-10-10 유효성 추가*/
/* ==========================================================================
  2.7 당월중간정산자는 당월누계를 0으로
 ========================================================================== */
     printf("\n 2.7 당월중간정산자는 당월누계를 0으로\n");
  
     /* EXEC   SQL
     UPDATE PKMRZMAS A
        SET CMONTOT   = 0 ,
            CYEARTOT  = 0 
      WHERE CALCYN = 'Y' 
        AND EMPNO IN ( SELECT  EMPNO FROM PKHMRHIS  B       
                        WHERE  A.CALCDATE = B.MRTODATE
                          AND  MRTODATE   = TO_CHAR(LAST_DAY(TO_DATE(:curpaydate,'YYYYMM')),'YYYYMMDD')
                     ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRZMAS A  set CMONTOT=0,CYEARTOT=0 where (CALC\
YN='Y' and EMPNO in (select EMPNO  from PKHMRHIS B where (A.CALCDATE=B.MRTODA\
TE and MRTODATE=TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMM')),'YYYYMMDD'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )638;
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
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }  
}
/* ======================================================= */

/* =======================================================
  퇴직 평균임금 계산
 ======================================================= */
void CalcAvgGross(char *frempno,char *toempno,char *frdate)
{
     char argfrempno[4+1]="" ;
     char argtoempno[4+1]="" ;
     char argpaydate[6+1]="" ;
     char t_workyy[4+1] = "";   /* 과도기 구간(2017~2018년) 연차수당 기준년도*/   
     
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


     /*--------------------------------------------------------------------------------------------------------*/     

/* ================================================ *
  급여/제수당 * 3개월분   정규직(일반직 사원 연봉이 1/18 에서 1/12로 변경됨.2008.11.22)
* ================================================ */
     sprintf(argfrempno,"%s",frempno);
     sprintf(argtoempno,"%s",toempno);
     sprintf(argpaydate,"%s",frdate);
        
/*  2003.07.07. 강륜종(Dsa2000) Sql Tunning(Hint 추가)...+ index(B I2_PKHPHIS)    */

    if (strcmp(argpaydate,"201804") <= 0)  
    {
       /* EXEC SQL
       UPDATE  PKRETTBL  a
          SET  (PAY3SUM,CALMM) =
               (SELECT /o+ index(B I2_PKHPHIS) o/
                     /o  NVL(SUM(CEIL((NVL(fixpay,0)+NVL(bfixpay,0)+NVL(sopay,0))*18/12)     o/
                         NVL(SUM(case when paydate <= '201412' then CEIL((NVL(FIXPAY,0)+NVL(SOPAY,0))*18/12) else NVL(FIXPAY,0)+NVL(SOPAY,0) end   /o 2014.11.05 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)   o/
                         + LEAST(NVL(roleamt,0), :avgroleamt) /o 2018.03.14 eyha 100000 -> 기준값으로 o/  /o2001.11.1 직책수당은 평균직책수당 값 반영  nvl(roleamt,0)+o/  
                         + NVL(mateamt,0)    + NVL(partamt,0)
                         + NVL(childamt,0)   + NVL(ovtmamt,0)
                         + NVL(sptmamt,0)    + NVL(mcaramt,0)
                         + NVL(liceamt,0)    + NVL(mbonamt,0)
                         + NVL(sobon,0)      /o2000.9.28. 급여소급에따른 sobon 추가o/
                         + DECODE(NVL(odamt,0),0,0,:avgodamt) /o 2018.03.14 eyha 150000 -> 기준값으로 o/
                         + nvl(itamt,0)      /odsa2000  2005.01. 정보통신수당 추가.o/
                         ), 0)
                         , COUNT(*)
                  FROM  pkhphis b
                 WHERE  a.empno = b.empno
                   AND  substr(paydate,1,6) BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'yyyymm'),-2),'yyyymm') AND :argpaydate
                  )
        WHERE  empno between :argfrempno and :argtoempno
          AND  paycl >= 'C11'   /o/infra         AND  paycl > '09' o/
          AND  empno not like 'Q%' 
          AND  empno not like 'P%' 
          AND  PAYCL <> 'H10'; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 6;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKRETTBL a  set (PAY3SUM,CALMM)=(select  /*+  \
index(B I2_PKHPHIS)  */ NVL(sum((((((((((((( case  when paydate<='201412' the\
n CEIL((((NVL(FIXPAY,0)+NVL(SOPAY,0))* 18)/12)) else (NVL(FIXPAY,0)+NVL(SOPAY\
,0))  end +LEAST(NVL(roleamt,0),:b0))+NVL(mateamt,0))+NVL(partamt,0))+NVL(chi\
ldamt,0))+NVL(ovtmamt,0))+NVL(sptmamt,0))+NVL(mcaramt,0))+NVL(liceamt,0))+NVL\
(mbonamt,0))+NVL(sobon,0))+DECODE(NVL(odamt,0),0,0,:b1))+nvl(itamt,0))),0) ,c\
ount(*)   from pkhphis b where (a.empno=b.empno and substr(paydate,1,6) betwe\
en TO_CHAR(ADD_MONTHS(TO_DATE(:b2,'yyyymm'),(-2)),'yyyymm') and :b2)) where (\
(((empno between :b4 and :b5 and paycl>='C11') and empno not like 'Q%') and e\
mpno not like 'P%') and PAYCL<>'H10')";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )657;
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
       sqlstm.sqhstv[2] = (unsigned char  *)argpaydate;
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
       sqlstm.sqhstv[4] = (unsigned char  *)argfrempno;
       sqlstm.sqhstl[4] = (unsigned long )5;
       sqlstm.sqhsts[4] = (         int  )0;
       sqlstm.sqindv[4] = (         short *)0;
       sqlstm.sqinds[4] = (         int  )0;
       sqlstm.sqharm[4] = (unsigned long )0;
       sqlstm.sqadto[4] = (unsigned short )0;
       sqlstm.sqtdso[4] = (unsigned short )0;
       sqlstm.sqhstv[5] = (unsigned char  *)argtoempno;
       sqlstm.sqhstl[5] = (unsigned long )5;
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

        /*DSA2000  2017.01.05. J사번체계 변경에 따른 수정작업 empno not like 'J%' => PAYCL <> 'H10' */
          /*AND  empno not like 'J%'  kth 일반직 사원 연봉이 1/18 에서 1/12로 변경됨.2008.11.22 */

        if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
        {
             print_errmsg(sqlca.sqlcode,"1.5.1 급여및 제수당 3개월분...update  \n");
             sprintf(log_buff, "1.5.1 급여및 제수당 3개월분...update");
             Write_batlog(seqno++, log_buff); 
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
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select REGEXP_REPLACE(WM_CONCAT(DATAFLD),',','+') in\
to :b0  from PKCAFLD where ((PAYKIND='2' and DATAFLD in ('FIXPAY','SOPAY')) a\
nd SUBSTR(:b1,1,6) between FMONTH and TMONTH)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )696;
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
        SELECT REPLACE(REPLACE(REGEXP_REPLACE(WM_CONCAT(DATAFLD), ',', '+'),'ODAMT','DECODE(NVL(ODAMT,0),0,0,AVGODAMT)'),'ROLEAMT', 'LEAST(ROLEAMT, AVGROLEAMT)')   
          INTO :sumstr2  
          FROM PKCAFLD A, PKCPBAS B
         WHERE PAYKIND = '2'
           AND SUBSTR(:argpaydate,1,6) BETWEEN A.FMONTH AND A.TMONTH; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select REPLACE(REPLACE(REGEXP_REPLACE(WM_CONCAT(DATA\
FLD),',','+'),'ODAMT','DECODE(NVL(ODAMT,0),0,0,AVGODAMT)'),'ROLEAMT','LEAST(R\
OLEAMT, AVGROLEAMT)') into :b0  from PKCAFLD A ,PKCPBAS B where (PAYKIND='2' \
and SUBSTR(:b1,1,6) between A.FMONTH and A.TMONTH)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )719;
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


        
        sprintf(sqlstr," UPDATE  PKRETTBL  a  SET  (PAY3SUM,CALMM) = ");
        /* 2019.01.29 eyha 월정연봉을 두번 더하는 오류 수정 */
        /* sprintf(tmpstr,"(SELECT + index(B I2_PKHPHIS)  NVL(SUM(case when substr(paydate,1,6) <= '201412' then CEIL((%s)*18/12) else %s end ",sumstr1, sumstr1); */
        sprintf(tmpstr,"(SELECT /*+ index(B I2_PKHPHIS) */ NVL(SUM( ");
        strcat(sqlstr,tmpstr);
        memset(tmpstr,'\0',sizeof(tmpstr)); 
        sprintf(tmpstr," + %s ),0), COUNT(*) FROM  pkhphis b, pkcpbas c WHERE  a.empno = b.empno AND  substr(paydate,1,6) BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR('%s',1,6),'yyyymm'),-2),'yyyymm') AND SUBSTR('%s',1,6) AND B.SOPAY+B.MCARAMT+B.FIXPAY+B.ODAMT+B.ROLEAMT+B.OVTMAMT+B.SPTMAMT > 0 )",sumstr2, argpaydate, argpaydate ); /*20190124 jhg */
        strcat(sqlstr,tmpstr);
        memset(tmpstr,'\0',sizeof(tmpstr)); 
        sprintf(tmpstr," WHERE  empno between '%s' and '%s' AND  paycl >= 'C11' AND  substr(empno,1,1) <> 'Q' AND substr(empno,1,1) <> 'P' AND  PAYCL <> 'H10' ",argfrempno, argtoempno );
        strcat(sqlstr,tmpstr);
        
        /* printf("PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함1  : %s \n",sqlstr);  */
        
        /* EXEC  SQL EXECUTE IMMEDIATE :sqlstr; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )742;
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
  급여/제수당 * 3개월분   계약직(계약직 사원 연봉이 1/18 에서 1/12로 변경됨.2008.11.22)
* ================================================ */
        
/*  2003.07.07. 강륜종(Dsa2000) Sql Tunning(Hint 추가)...+ index(B I2_PKHPHIS)    */
    if (strcmp(argpaydate,"201804") <= 0)
    {
        /* EXEC SQL
        UPDATE  PKRETTBL  a
           SET  (PAY3SUM,CALMM) =
                (SELECT  /o+ index(B I2_PKHPHIS) o/
                         NVL(SUM(CEIL((NVL(fixpay,0))+NVL(bfixpay,0)+NVL(sopay,0))  
                         + LEAST(NVL(roleamt,0), :avgroleamt)  /o 2018.03.14 eyha 100000 -> 기준값으로 o/ /o2001.11.1 직책수당은 평균직책수당 값 반영  nvl(roleamt,0)+o/
                         + NVL(mateamt,0)    + NVL(partamt,0)
                         + NVL(childamt,0)   + NVL(ovtmamt,0)
                         + NVL(sptmamt,0)    + NVL(mcaramt,0)
                         + NVL(liceamt,0)    + NVL(mbonamt,0)
                         + NVL(sobon,0)      /o2000.9.28. 급여소급에따른 sobon 추가o/
                         + DECODE(NVL(odamt,0),0,0,:avgodamt) /o 2018.03.14 eyha 150000 -> 기준값으로 o/
                         + nvl(itamt,0)      /odsa2000  2005.01. 정보통신수당 추가.o/
                         ), 0)
                         , COUNT(*)
                   FROM  pkhphis b
                  WHERE  a.empno = b.empno              
                    AND  paydate BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'yyyymm'),-2),'yyyymm') AND :argpaydate
                )
        WHERE  empno between :argfrempno and :argtoempno
          AND  paycl >= 'C11'      /o//infra           AND  paycl > '09'o/
          AND  EMPNO not like 'M%'
          AND  (empno like 'Q%' or empno like 'P%' or paycl='H10'); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PKRETTBL a  set (PAY3SUM,CALMM)=(select  /*+ \
 index(B I2_PKHPHIS)  */ NVL(sum(((((((((((((CEIL(((NVL(fixpay,0)+NVL(bfixpay\
,0))+NVL(sopay,0)))+LEAST(NVL(roleamt,0),:b0))+NVL(mateamt,0))+NVL(partamt,0)\
)+NVL(childamt,0))+NVL(ovtmamt,0))+NVL(sptmamt,0))+NVL(mcaramt,0))+NVL(liceam\
t,0))+NVL(mbonamt,0))+NVL(sobon,0))+DECODE(NVL(odamt,0),0,0,:b1))+nvl(itamt,0\
))),0) ,count(*)   from pkhphis b where (a.empno=b.empno and paydate between \
TO_CHAR(ADD_MONTHS(TO_DATE(:b2,'yyyymm'),(-2)),'yyyymm') and :b2)) where (((e\
mpno between :b4 and :b5 and paycl>='C11') and EMPNO not like 'M%') and ((emp\
no like 'Q%' or empno like 'P%') or paycl='H10'))";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )761;
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
        sqlstm.sqhstv[2] = (unsigned char  *)argpaydate;
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
        sqlstm.sqhstv[4] = (unsigned char  *)argfrempno;
        sqlstm.sqhstl[4] = (unsigned long )5;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)argtoempno;
        sqlstm.sqhstl[5] = (unsigned long )5;
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

 /*DSA2000  2017.01.05. J사번체계 변경에 따른 수정작업 'J%' => PAYCL='H10' */
        /*AND  (empno like 'Q%' or empno like 'P%' or empno like 'J%')  kth 일반직 사원 연봉이 1/18 에서 1/12로 변경됨.2008.11.22 */

        if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
        {
             print_errmsg(sqlca.sqlcode,"1.5.1 급여및 제수당 3개월분...update  \n");
             sprintf(log_buff, "1.5.1 급여및 제수당 3개월분...update");
             Write_batlog(seqno++, log_buff); 
             error_quit("작업실패...");
        }

    } else
    {
        /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 계약직 평균임금 구함 Start [2018-09-13 이상용] */
        sprintf(sqlstr1," UPDATE PKRETTBL  a SET  (PAY3SUM,CALMM) = ");
        /* 2019.01.29 eyha 월정연봉을 두번 더하는 오류 수정 */        
        /*sprintf(tmpstr1," (SELECT + index(B I2_PKHPHIS)  NVL(SUM(CEIL((%s) + %s)), 0), COUNT(*) FROM pkhphis b, pkcpbas c WHERE a.empno = b.empno ", sumstr1, sumstr2 );             */
        sprintf(tmpstr1," (SELECT /*+ index(B I2_PKHPHIS) */  NVL(SUM(CEIL(+ %s)), 0), COUNT(*) FROM pkhphis b, pkcpbas c WHERE a.empno = b.empno ", sumstr2 );             
        strcat(sqlstr1,tmpstr1);
        memset(tmpstr1,'\0',sizeof(tmpstr1)); 
        sprintf(tmpstr1," AND substr(paydate,1,6) BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(substr('%s',1,6),'yyyymm'),-2),'yyyymm') AND substr('%s',1,6) AND B.SOPAY+B.MCARAMT+B.FIXPAY+B.ODAMT+B.ROLEAMT+B.OVTMAMT+B.SPTMAMT > 0 )",argpaydate, argpaydate); /* 20190124 jhg */
        strcat(sqlstr1,tmpstr1);
        memset(tmpstr1,'\0',sizeof(tmpstr1)); 
        sprintf(tmpstr1," WHERE empno between '%s' and '%s' AND  paycl >= 'C11' AND  substr(empno,1,1) <> 'M' AND (substr(empno,1,1) = 'Q' or substr(empno,1,1) = 'P' or paycl='H10') ", argfrempno, argtoempno );
        strcat(sqlstr1,tmpstr1);

        /* printf("PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함3  : %s \n",sqlstr1); */
        
        /* EXEC  SQL EXECUTE IMMEDIATE :sqlstr1; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )800;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)sqlstr1;
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


        /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 계약직 평균임금 구함 End [2018-09-13 이상용] */
          
        if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
        {
             print_errmsg(sqlca.sqlcode,"1.5.1 급여및 제수당 3개월분...update  \n");
             sprintf(log_buff, "1.5.1 급여및 제수당 3개월분...update");
             Write_batlog(seqno++, log_buff); 
             error_quit("작업실패...");
        }
/*        printf("PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 정규직 평균임금 구함4 \n"); */
     }
     
     memset(sqlstr,'\0',sizeof(sqlstr));
     memset(tmpstr,'\0',sizeof(tmpstr));   
     memset(sumstr1,'\0',sizeof(sumstr1));   
     memset(sumstr2,'\0',sizeof(sumstr2));   
     memset(sqlstr1,'\0',sizeof(sqlstr1));
     memset(tmpstr1,'\0',sizeof(tmpstr1));   

     /* ================================================ *
       연차수당
     * ================================================ */
     /*2017.01.  dsa2000 임단협 결정으로 연차수당 후지급으로 변경에 따른 과도기 구간(2017~2018년) 루틴 추가. */
     if ((strcmp(argpaydate,"201701") >= 0) && (strcmp(argpaydate,"201812") <= 0)) 
     {
         sprintf(t_workyy,"%.4s",argpaydate);
         /* EXEC SQL
         UPDATE  PKRETTBL A
            SET  BON12SUM = (SELECT Nvl(Ybonamt,0)
                               FROM Pkbonsim B
                              WHERE A.Empno = B.Empno AND Workyy =:t_workyy)
          WHERE  empno between :argfrempno and :argtoempno  
            AND  paycl >= 'C11'; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 6;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "update PKRETTBL A  set BON12SUM=(select Nvl(Ybonamt\
,0)  from Pkbonsim B where (A.Empno=B.Empno and Workyy=:b0)) where (empno bet\
ween :b1 and :b2 and paycl>='C11')";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )819;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)t_workyy;
         sqlstm.sqhstl[0] = (unsigned long )5;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)argfrempno;
         sqlstm.sqhstl[1] = (unsigned long )5;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)argtoempno;
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


     
         if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)) 
         {
             printf("임단협 기준 : %s\n",t_workyy);
             print_errmsg(sqlca.sqlcode,"1.5.2 임단협 기준 : 연차수당...update  \n");
             sprintf(log_buff, "1.5.2 임단협 기준 : 연차수당...update ");
             Write_batlog(seqno++, log_buff); 
             error_quit("작업실패...");
         }
     }
     else /*정상기간 루틴*/
     {   /*  2003.09.03. 강륜종(Dsa2000) Sql Tunning(Hint 추가)...  + index(B I2_PKHPHIS)   */        
         /* EXEC SQL
         UPDATE  PKRETTBL  a 
            SET  BON12SUM =
                (SELECT   /o+ index(B I2_PKHPHIS) o/ 
                         SUM( NVL(YBONAMT,0) ) 
                   FROM  PKHPHIS  B
                  WHERE  A.EMPNO = B.EMPNO
                    AND  SUBSTR(PAYDATE,1,6) BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'YYYYMM'),-12),'YYYYMM')
                    AND  :argpaydate    )
          WHERE  empno between :argfrempno and :argtoempno  
            AND  paycl >= 'C11'; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 6;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "update PKRETTBL a  set BON12SUM=(select  /*+  index\
(B I2_PKHPHIS)  */ sum(NVL(YBONAMT,0))  from PKHPHIS B where (A.EMPNO=B.EMPNO\
 and SUBSTR(PAYDATE,1,6) between TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'YYYYMM'),(-1\
2)),'YYYYMM') and :b0)) where (empno between :b2 and :b3 and paycl>='C11')";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )846;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)argpaydate;
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
         sqlstm.sqhstv[2] = (unsigned char  *)argfrempno;
         sqlstm.sqhstl[2] = (unsigned long )5;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)argtoempno;
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


           
         if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
         {
              print_errmsg(sqlca.sqlcode,"1.5.2 연차수당...update  \n");
              sprintf(log_buff, "1.5.2 연차수당...update ");
              Write_batlog(seqno++, log_buff); 
              error_quit("작업실패...");
         }         
         
         /* 2011.08.03 kth 휴직자 연차금액 수정 */     
         /* 휴직자 휴직전에 급여로 계산되고 연차는 계산년도가 다르기 때문에  */     
         /* 연차는 수정해서 넣어 줘야 됨.  */     
         /* EXEC SQL
         UPDATE  PKRETTBL  a
            SET  BON12SUM =
                (SELECT   /o+ index(B I2_PKHPHIS) o/ 
                         SUM( NVL(YBONAMT,0) ) 
                   FROM  PKHPHIS  B
                  WHERE  A.EMPNO = B.EMPNO
                    AND  SUBSTR(PAYDATE,1,6) BETWEEN :argpaydate 
                    AND  TO_CHAR(ADD_MONTHS(TO_DATE(:argpaydate,'YYYYMM'),12),'YYYYMM')    )
          WHERE  empno between :argfrempno and :argtoempno 
            AND  EMPNO in  (SELECT EMPNO FROM PKHRCHIS WHERE PAYDATE =:curpaydate 
                               AND CONYN   = 'Y' 
                               AND SUBSTR(BASEDATE,1,4) <> SUBSTR(:curpaydate,1,4) ) 
            AND  paycl >= 'C11'   /o//infra         AND  paycl > '09'o/
            AND  EMPNO not like 'M%'; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 6;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "update PKRETTBL a  set BON12SUM=(select  /*+  index\
(B I2_PKHPHIS)  */ sum(NVL(YBONAMT,0))  from PKHPHIS B where (A.EMPNO=B.EMPNO\
 and SUBSTR(PAYDATE,1,6) between :b0 and TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'YYYY\
MM'),12),'YYYYMM'))) where (((empno between :b2 and :b3 and EMPNO in (select \
EMPNO  from PKHRCHIS where ((PAYDATE=:b4 and CONYN='Y') and SUBSTR(BASEDATE,1\
,4)<>SUBSTR(:b4,1,4)))) and paycl>='C11') and EMPNO not like 'M%')";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )877;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)argpaydate;
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
         sqlstm.sqhstv[2] = (unsigned char  *)argfrempno;
         sqlstm.sqhstl[2] = (unsigned long )5;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         short *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned long )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (unsigned char  *)argtoempno;
         sqlstm.sqhstl[3] = (unsigned long )5;
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

  /*DSA2000   2004.02.04. 임원은 퇴충계산에서 제외(이사대우 까지) 재무팀 요청*/
            
         if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
         {
              print_errmsg(sqlca.sqlcode,"1.5.2.1 연차수당...update  \n");
              sprintf(log_buff, "1.5.2.1 연차수당...update ");
              Write_batlog(seqno++, log_buff); 
              error_quit("작업실패...");
         }  /*printf("\n 1.5.2 연차수당...update   End.... \n");*/   
     }

     /* EXEC SQL
     UPDATE  PKRETTBL
        SET  PAY3SUM  = nvl(PAY3SUM,0),
             BON12SUM = nvl(BON12SUM,0)
      WHERE  empno between :argfrempno and :argtoempno
        AND  PAYCL   >= 'C11'
        AND  EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set PAY3SUM=nvl(PAY3SUM,0),BON12SUM=nv\
l(BON12SUM,0) where ((empno between :b0 and :b1 and PAYCL>='C11') and EMPNO n\
ot like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )916;
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



     if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
     {
          print_errmsg(sqlca.sqlcode,"1.5.3 null...update  \n");
          sprintf(log_buff, "1.5.2 연차수당...update ");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     /*printf("\n 1.5.3 null...update   End.... \n");*/

     /* EXEC SQL
     UPDATE PKRETTBL
        SET AVGPAYBON = ceil(pay3sum/decode(calmm,0,1,calmm)) +
                        ceil(bon12sum/12)
      WHERE empno between :argfrempno and :argtoempno          
        AND PAYCL   >= 'C11'  /oAND paycl > '09'o/
        AND EMPNO not like 'M%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL  set AVGPAYBON=(ceil((pay3sum/decode(ca\
lmm,0,1,calmm)))+ceil((bon12sum/12))) where ((empno between :b0 and :b1 and P\
AYCL>='C11') and EMPNO not like 'M%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )939;
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



     if ((sqlca.sqlcode != 0 ) && (sqlca.sqlcode != 1403 ))
     {
          print_errmsg(sqlca.sqlcode,"1.5.4 평균임금...update  \n");
          sprintf(log_buff, "1.5.4 평균임금...update  ");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
}       /*printf("\n 1.5.4 평균임금...update   End.... \n");*/

/* =======================================================
  퇴직 평균임금 계산  : 휴직자 
 ======================================================= */
void CalcAvgGross_rest()
{
     char  p_empno[4+1]="";
     char  p_maxpaydate[6+1]="";
     
      /*  2003.09.03. 강륜종(Dsa2000) 시간단축을 위한 Sql Tunning(Hint 추가)  +use_nl (a,b,c) 
          2011.07.28 KTH 주석 처러 PKHRCHIS 테이블로 관리 변경
     EXEC SQL DECLARE cur2 CURSOR FOR
     SELECT   use_nl (a,b,c)  
             A.EMPNO, MAX(C.PAYDATE)
       FROM  PKHPHIS C, PKRETTBL A, PKMPMAS B    DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL 
      WHERE  A.EMPNO = B.EMPNO                   2006.01.02  PIMPMAS => PKMPMAS로 변경함.
        AND  A.EMPNO = C.EMPNO
        AND  B.PSTATE  LIKE '7%'
      GROUP  BY A.EMPNO;   */
      
     /* 2011.07.28 KTH  PKHRCHIS 테이블로 관리 처리 */
     /* EXEC SQL DECLARE cur2 CURSOR FOR 
     SELECT EMPNO,SUBSTR(BASEDATE,1,6) BASEDATE  
       FROM PKHRCHIS
      WHERE PAYDATE =:curpaydate
        AND CONYN   = 'Y'  
        AND SUBSTR(ENDTODATE,1,6) >= SUBSTR(:curpaydate,1,6); */ 
      
             
     /* EXEC SQL OPEN cur2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0044;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )962;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"1.5.2.1 휴직자 평균 임금 계산중...Open\n");
          sprintf(log_buff, "1.5.2.1 휴직자 평균 임금 계산중...Open ");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
     
           /*printf("\n 1.5.2.1 휴직자 평균 임금 계산   End.... \n");*/
     
     while(1)
     {
          /* EXEC SQL  FETCH  cur2
          INTO    :p_empno ,:p_maxpaydate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 6;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )985;
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
               sqlstm.arrsiz = 6;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1008;
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
               Write_batlog(seqno++, log_buff); 
               error_quit("작업실패...");
          }
          sprintf(p_empno,"%.4s",p_empno);
          sprintf(p_maxpaydate,"%.6s",p_maxpaydate);
          
/*          printf("\n ~~~ empno[%s],paydate[%s] ",p_empno,p_maxpaydate); */
          
          CalcAvgGross(p_empno,p_empno,p_maxpaydate);
     }
}

/* ==========================================================================
  근속제외월 계산
 ========================================================================== */
void CalcExdd()
{
     /* EXEC SQL
     UPDATE PKRETTBL R   /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET EXTMM = ( SELECT sum( FLOOR( MONTHS_BETWEEN( TO_DATE(LEAST(A.EXTODATE,:v_curpaydate) ,'YYYYMMDD')+1,
                                                         TO_DATE(GREATEST(A.EXFRDATE,NVL(BMRTODATE,A.EXFRDATE)),'YYYYMMDD') 
                                                        )
                                        )
                                 )                 
                        FROM PKMPMAS C, PKHEXDD A,  /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
                             ( SELECT EMPNO BEMPNO, MAX(MRTODATE) BMRTODATE 
                                 FROM PKHMRHIS
                                WHERE MRTODATE < :curpaydate
                                GROUP BY EMPNO
                             )  
                       WHERE EXFIXYN ='Y'
                         AND A.EMPNO = BEMPNO(+)
                         AND A.EMPNO = C.EMPNO
                         AND A.EMPNO = R.EMPNO
                         AND RETDATE IS NULL
                         AND A.EXTODATE  >= NVL(BMRTODATE,A.EXFRDATE)   
                    )
      WHERE EMPNO IN
            (
              SELECT A.EMPNO
                FROM PKMPMAS C, PKHEXDD A, /o 2006.01.02  PIMPMAS => PKMPMAS로 변경함.o/
                    (
                     SELECT EMPNO BEMPNO, MAX(MRTODATE) BMRTODATE 
                       FROM PKHMRHIS
                      WHERE MRTODATE < :curpaydate
                      GROUP BY EMPNO
                     ) 
               WHERE  EXFIXYN ='Y'
                 AND  A.EMPNO = BEMPNO(+)
                 AND  A.EMPNO = C.EMPNO      
                 AND  RETDATE IS NULL
                 AND A.EXTODATE  >= NVL(BMRTODATE,A.EXFRDATE)      
            ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL R  set EXTMM=(select sum(FLOOR(MONTHS_B\
ETWEEN((TO_DATE(LEAST(A.EXTODATE,:b0),'YYYYMMDD')+1),TO_DATE(GREATEST(A.EXFRD\
ATE,NVL(BMRTODATE,A.EXFRDATE)),'YYYYMMDD'))))  from PKMPMAS C ,PKHEXDD A ,(se\
lect EMPNO BEMPNO ,max(MRTODATE) BMRTODATE  from PKHMRHIS where MRTODATE<:b1 \
group by EMPNO) where (((((EXFIXYN='Y' and A.EMPNO=BEMPNO(+)) and A.EMPNO=C.E\
MPNO) and A.EMPNO=R.EMPNO) and RETDATE is null ) and A.EXTODATE>=NVL(BMRTODAT\
E,A.EXFRDATE))) where EMPNO in (select A.EMPNO  from PKMPMAS C ,PKHEXDD A ,(s\
elect EMPNO BEMPNO ,max(MRTODATE) BMRTODATE  from PKHMRHIS where MRTODATE<:b1\
 group by EMPNO) where ((((EXFIXYN='Y' and A.EMPNO=BEMPNO(+)) and A.EMPNO=C.E\
MPNO) and RETDATE is null ) and A.EXTODATE>=NVL(BMRTODATE,A.EXFRDATE)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1023;
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
          print_errmsg(sqlca.sqlcode,"근속제외월수1 계산 중...\n");
          sprintf(log_buff, "근속제외월수 계산 중...");
          Write_batlog(seqno++, log_buff); 
          error_quit("작업실패...");
     }
   
     /* EXEC SQL
     UPDATE PKRETTBL R    /o DSA2000   2004.04.21. 테이블 이름 변경 T_RETTBL => PKRETTBL o/
        SET EXTMM = NVL(EXTMM,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKRETTBL R  set EXTMM=NVL(EXTMM,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1050;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         print_errmsg(sqlca.sqlcode,"근속제외월수2 계산 중...\n");
         sprintf(log_buff, "근속제외월수 계산 중...");
         Write_batlog(seqno++, log_buff); 
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
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1065;
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
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1106;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
