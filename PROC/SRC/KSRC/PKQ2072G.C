
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
    "pkq2072g.pc"
};


static unsigned int sqlctx = 154067;


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
   unsigned char  *sqhstv[35];
   unsigned long  sqhstl[35];
            int   sqhsts[35];
            short *sqindv[35];
            int   sqinds[35];
   unsigned long  sqharm[35];
   unsigned long  *sqharc[35];
   unsigned short  sqadto[35];
   unsigned short  sqtdso[35];
} sqlstm = {12,35};

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

 static char *sq0007 = 
"select A.EMPNO ,A.KORNAME ,RETDATE ,TO_CHAR((TO_DATE(RETDATE,'YYYYMMDD')+1)\
,'YYYYMMDD') RETDATE1  from PKMGBMAS_RT A ,PKMRTMAS B where ((A.EMPNO=B.EMPNO\
 and A.BONYYMM=:b0) and A.BONKIND=:b1) order by A.EMPNO            ";

 static char *sq0014 = 
"select A.empno ,A.korname ,exkind ,exfrdate ,B.kifrdate ,extodate ,B.kitoda\
te  from pkhexdd A ,PKMGBMAS_RT B where (((((bonyymm=:b0 and bonkind=:b1) and\
 A.empno=B.empno) and (kifrdate is  not null  and kitodate is  not null )) an\
d (((exfrdate>=kifrdate and exfrdate<kitodate) or (extodate>=kifrdate and ext\
odate<kitodate)) or (exfrdate<=kifrdate and extodate>=kitodate))) and upper(e\
xfixyn)='Y') order by A.empno,A.exfrdate            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,856,0,4,276,0,0,35,3,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,
0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,
160,0,0,2,25,0,2,331,0,0,0,0,0,1,0,
175,0,0,3,266,0,3,348,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
202,0,0,4,59,0,2,372,0,0,0,0,0,1,0,
217,0,0,5,132,0,5,398,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
244,0,0,6,123,0,4,424,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
271,0,0,7,219,0,9,444,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
294,0,0,7,0,0,15,451,0,0,0,0,0,1,0,
309,0,0,7,0,0,13,457,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
340,0,0,7,0,0,15,462,0,0,0,0,0,1,0,
355,0,0,7,0,0,15,471,0,0,0,0,0,1,0,
370,0,0,8,117,0,5,475,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
405,0,0,9,117,0,5,492,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
440,0,0,10,145,0,5,511,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
467,0,0,11,686,0,5,520,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
506,0,0,12,116,0,5,549,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
529,0,0,13,106,0,5,567,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
552,0,0,14,435,0,9,599,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
575,0,0,14,0,0,15,606,0,0,0,0,0,1,0,
590,0,0,14,0,0,13,612,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,
633,0,0,14,0,0,15,617,0,0,0,0,0,1,0,
648,0,0,14,0,0,15,627,0,0,0,0,0,1,0,
663,0,0,15,170,0,5,649,0,0,8,8,0,1,0,1,4,0,0,1,9,0,0,1,97,0,0,1,97,0,0,1,4,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,
710,0,0,16,94,0,5,719,0,0,5,5,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
745,0,0,17,147,0,5,778,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
768,0,0,18,98,0,5,799,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
791,0,0,19,69,0,5,814,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
814,0,0,20,109,0,5,834,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
837,0,0,21,68,0,5,850,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
860,0,0,22,167,0,5,871,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
883,0,0,23,99,0,5,879,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
906,0,0,24,75,0,5,898,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
929,0,0,25,81,0,4,926,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
956,0,0,26,50,0,3,946,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
997,0,0,27,0,0,29,956,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


 /*================= Program Header ==========================================
 PROGRAM-NAME   : pkq2072g(퇴직월 상여금 계산 )
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직금
 Programmer     : 이랑교
 Version        : 30.01
 Date           : 1999.03.19
 임시테이블 :pkmgbmas_rt

Update Contents
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  1.00     1997.12.31      허철행     최초개발본             설계명세서
  2.00     1998.06.11      김승회     수정본             전산처리요청
  10.01    1998.08.14      이랑교     평균임금변경,상여금 일할계산
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
  30.01    1999.03.19      이랑교     지급일이 설정되어 있어도 퇴직일과 비교하여
            퇴직일이 지급일보다 작을 경우는 bonyn을 "N"로 setting
  30.50    2001.03.14      유효성     임원 연봉제에 따른 수정
  30.51    2004.02.24      강륜종     Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.     
  30.10    2004.11.    강륜종(dsa2000) Rexec대체 서비스를 위한 수정작업.  
============================================================================= */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS -1*/
#define  FAIL    -2

/* ===========================================================================
  Function Prototype 정의
   ========================================================================= */
int    get_gbbas(char *);
void   del_mas();
void   calc_bonamt(char *);
float  get_days(char *,char *);
void   print_errmsg(int errcode, char *errmsg);

/* ===========================================================================
  Global Variable
   ========================================================================= */

/* EXEC SQL BEGIN DECLARE SECTION; */ 


  /* ----------------------------------------------------
   상여금 마스터 관련변수
     ---------------------------------------------------- */

     char   empno[4+1]      = "";   /* 사번    */
     char   korname[12+1]   = "";   /* 성명    */
     char   empdate[8+1]    = "";   /* 입사일   */
     char   paynum[2+1]     = "";   /* 급여차수   */
     char   paycl[4]        = "";   /* 직급    */
     float  paygr           = 0;    /* 호봉    */
     char   orgnum[3+1]     = "";   /* 조직차수   */
     char   deptcode[6+1]   = "";   /* 부서코드   */
                            
     char   bonyn[1+1]      = "";   /* 상여금 지급여부  */
                                    /* <특이사항>   */
     char   spkind[3+1]     = "";   /* 특이구분(인사상태)  */
     char   spfrdate[8+1]   = "";   /* 특이기간 from  */
     char   sptodate[8+1]   = "";   /* 특이기간 to   */
     float  spdd            = 0;    /* 특이일   */
                            
     float  bonkidd         = 0;    /* 상여기준일수   */
     char   kifrdate[8+1]   = "";   /* 근속기준일From  */
     char   kitodate[8+1]   = "";   /* 근속기준일To   */
     float  bongivedd       = 0;    /* 상여지급일수   */
     char   sufrdate[8+1]   = "";   /* 수습기간From   */
     char   sutodate[8+1]   = "";   /* 수습기간To   */
     float  sudd            = 0;    /* 수습일수   */

     char   basicyn[1+1]    = "";   /* 기본급 포함여부  */
     char   infoyn[1+1]     = "";   /* 정보통신수당 포함여부*/
     char   dutyyn[1+1]     = "";   /* 직무수당 포함여부  */
     char   promyn[1+1]     = "";   /* 업무추진비 포함여부  */
     float  standamt        = 0;    /* 기준임금   */

     float  kiamt           = 0;    /* 기준지급액   */
     float  kirate          = 0;    /* 기준지급율   */
     float  fixamt          = 0;    /* 정액지급액   */
     float  giveamt         = 0;    /* 총지급액   */

     float  holdrate        = 0;    /* 유보율   */
     float  holdamt         = 0;    /* 유보액   */
     float  realamt         = 0;    /* 실지급액   */


  /* ----------------------------------------------------
   상여금 지급기준
     ---------------------------------------------------- */

     char   bonkind[1+1]    = "";   /* 상여구분   */
     char   bonyymm[6+1]    = "";   /* 지급년월   */
     char   paytype[1+1]    = "";   /* 지급방식   */
                                    
     char   regyn[1+1]      = "";   /* 상여지급여부(정규)  */
     char   staffyn[1+1]    = "";   /* 상여지급여부(임원)  */
     char   tempyn[1+1]     = "";   /* 상여지급여부(임시)  */
                                    
     float  r_kirate        = 0;    /* 상여기준지급율(정규) */
     float  s_kirate        = 0;    /* 상여기준지급율(임원) */
     float  t_kirate        = 0;    /* 상여기준지급율(임시) */
                                    
     float  r_kiamt         = 0;    /* 상여정액지급액(정규) */
     float  s_kiamt         = 0;    /* 상여정액지급액(임원) */
     float  t_kiamt         = 0;    /* 상여정액지급액(임시) */
                                    
     char   r_kidate[8+1]   = "";   /* 지급기준근속일(정규) */
     char   s_kidate[8+1]   = "";   /* 지급기준근속일(임원) */
     char   t_kidate[8+1]   = "";   /* 지급기준근속일(임시) */
                                    
                                    
     char   r_basic[1+1]    = "";   /* 기본급포함여부(정규) */
     char   s_basic[1+1]    = "";   /* 기본급포함여부(임원) */
     char   t_basic[1+1]    = "";   /* 기본급포함여부(임시) */
                                    
     char   r_info[1+1]     = "";   /* 정보수당포함여부-정규*/
     char   s_info[1+1]     = "";   /* 정보수당포함여부-임원*/
     char   t_info[1+1]     = "";   /* 정보수당포함여부-임시*/
                                    
     char   r_duty[1+1]     = "";   /* 직무수당포함여부-정규*/
     char   s_duty[1+1]     = "";   /* 직무수당포함여부-임원*/
     char   t_duty[1+1]     = "";   /* 직무수당포함여부-임시*/
                                    
     char   r_prom[1+1]     = "";   /* 추진비포함여부-정규   */
     char   s_prom[1+1]     = "";   /* 추진비포함여부-임원  */
     char   t_prom[1+1]     = "";   /* 추진비포함여부-임시   */
                                    
     char   givekind[1+1]   = "";   /* 지급율 구분   */
     float  giverate  = 0;          /* 일괄지급율   */
                                    
     char   holdkind[1+1]   = "";   /* 유보율 구분   */
     float  b_holdrate      = 0;    /* 일괄유보율   */
     float  b_holdamt       = 0;    /* 일괄유보액   */
                                    
     char   b_kifrdate[8+1] = "";   /* 근속기준일From  */
     char   b_kitodate[8+1] = "";   /* 근속기준일To   */
     float  kidd            = 0;    /* 상여기준일수   */
                                    
     char   fixmonthyn[1+1] = "";   /* 정액제근속개월적용  */
     char   fixrateyn[1+1]  = "";   /* 정액제지급율적용  */

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련항목추가     하나로재개발
============================================================================= */
     char     fixpay[1+1]    = "";  /* 월정급여포함여부  */
     char     bondate[8+1]   = "";  /* 상여지급일자   */
     char     t_bondate[8+1] = "";  /* 상여지급일자   */
     char     retdate[8+1]   = "";  /* 퇴직일자   */
     char     retdate1[8+1]  = "";  /* 퇴직일자1   */
                               
     char     anfrdate[8+1]  = "";  /* 발령일From   */
     char     antodate[8+1]  = "";  /* 발령일To    */
     char     exfrdate[8+1]  = "";  /* 근속제외From   */
     char     extodate[8+1]  = "";  /* 근속제외To    */
     /* varchar  exkind[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } exkind;

     
     char     jobempno[4+1]  = "";  /* 작업자사번   */
              
     float    t_term;
     char     t_frdate[8+1];
     char     t_todate[8+1];
              
     char     retyy[4+1]  ="";
     char     retyymm[6+1]="";

/* EXEC SQL END DECLARE SECTION; */ 

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



char  msg[300+1]  = "";
int   id;
char  delkind[1+1]  = "";

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

void main(int argc, char *argv[])
{  
     int     i =0;
     char FL_file[255];
     
     if  (argc != 5) {  /* /hper8/HINSA/proc/bin/Kbin/pkq2072g 200411 D006 pkq2072g 2004110100000 */
          printf("[Usage] : pkq2072g  1.퇴직년월 2.작업자 3.프로그램ID 4.시작시간 \n");  
          exit(1);
     }  
      
     sprintf(retyymm,"%.6s",argv[1]);
     sprintf(retyy  ,"%.4s",argv[1]);
     sprintf(jobempno,"%.4s",argv[2]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2072g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"퇴직월 상여금 계산 시작...");         
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[2]);
     strcpy(log_progid,   argv[3]);
     strcpy(log_rundate,  argv[4]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
           del_mas();
     
     for(i= 1 ;i<= 8 ;i++)
     {
          memset(bonkind,0x00,sizeof(bonkind));
          sprintf(bonkind,"%d",i);
          if  (get_gbbas(bonkind) == -1)
               calc_bonamt(bonkind);
     }
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/  
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else 
     {
          sprintf(log_buff, "OK ====== [상여금 추출/계산작업 작업성공] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [상여금 추출/계산작업 작업성공] =====\n");
     }           

}


/* *******************************************************************
  퇴직일에 해당하는 상여의 종류를 구합니다.
   1. 정기상여 : 최종지급다음월"01" ~ 퇴직일
   2. 능률제고 : 상반기,하반기
   3. 체력단련 : 상반기(7월10일지급),
    10일 이전 : 1월 ~ 6월 + 잔여일수
    하반기(11월10일지급)
    10일 이전 : 7월 ~ 퇴직일까지
    10일 이후 : - (12월 - 퇴직일까지)
* ****************************************************************** */
 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      상여금지급기준 bondate추가
============================================================================= */
/* 1. 상여지급기준읽기   */
int  get_gbbas(char *binkind)
{
     /* EXEC SQL
     SELECT  BONYYMM,BONKIND,PAYTYPE, 
             UPPER(REGYN),UPPER(STAFFYN), UPPER(TEMPYN),
             NVL(R_KIRATE,0), NVL(S_KIRATE,0), 
             NVL(R_KIAMT ,0), NVL(S_KIAMT ,0),
             NVL(R_KIDATE,0), NVL(S_KIDATE,0), 
             UPPER(NVL(R_BASIC,'N')), UPPER(NVL(S_BASIC,'N')),
             UPPER(NVL(R_INFO ,'N')), UPPER(NVL(S_INFO ,'N')),
             UPPER(NVL(R_DUTY ,'N')), UPPER(NVL(S_DUTY ,'N')),
             UPPER(NVL(R_PROM ,'N')), UPPER(NVL(S_PROM ,'N')),   
             NVL(GIVEKIND  ,'*'), NVL(GIVERATE ,  0), NVL(HOLDKIND, ' '),NVL(HOLDRATE,0),
             NVL(HOLDAMT   ,  0), NVL(KIFRDATE ,' '), NVL(KITODATE, ' '), NVL(KIDD,0),
             NVL(FIXMONTHYN,'N'), NVL(FIXRATEYN,'N'), NVL(BONDATE,'99999999'),
             UPPER(NVL(R_FIXPAY,'N'))
       INTO  :bonyymm,  :bonkind,  :paytype,  :regyn,
             :staffyn,  :tempyn,
             :r_kirate, :s_kirate, :r_kiamt, :s_kiamt,
             :r_kidate, :s_kidate, 
             :r_basic,  :s_basic,
             :r_info,   :s_info,
             :r_duty,   :s_duty,
             :r_prom,   :s_prom,
             :givekind, :giverate,   :holdkind,   :b_holdrate,
             :b_holdamt,:b_kifrdate, :b_kitodate, :kidd,
             :fixmonthyn, :fixrateyn, :bondate, :fixpay
       FROM  PKCGBBAS
      WHERE  substr(kifrdate,1,6) <= :retyymm
        and  substr(kitodate,1,6) >= :retyymm
        and  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select BONYYMM ,BONKIND ,PAYTYPE ,UPPER(REGYN) ,UPPER(S\
TAFFYN) ,UPPER(TEMPYN) ,NVL(R_KIRATE,0) ,NVL(S_KIRATE,0) ,NVL(R_KIAMT,0) ,NVL\
(S_KIAMT,0) ,NVL(R_KIDATE,0) ,NVL(S_KIDATE,0) ,UPPER(NVL(R_BASIC,'N')) ,UPPER\
(NVL(S_BASIC,'N')) ,UPPER(NVL(R_INFO,'N')) ,UPPER(NVL(S_INFO,'N')) ,UPPER(NVL\
(R_DUTY,'N')) ,UPPER(NVL(S_DUTY,'N')) ,UPPER(NVL(R_PROM,'N')) ,UPPER(NVL(S_PR\
OM,'N')) ,NVL(GIVEKIND,'*') ,NVL(GIVERATE,0) ,NVL(HOLDKIND,' ') ,NVL(HOLDRATE\
,0) ,NVL(HOLDAMT,0) ,NVL(KIFRDATE,' ') ,NVL(KITODATE,' ') ,NVL(KIDD,0) ,NVL(F\
IXMONTHYN,'N') ,NVL(FIXRATEYN,'N') ,NVL(BONDATE,'99999999') ,UPPER(NVL(R_FIXP\
AY,'N')) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b1\
4,:b15,:b16,:b17,:b18,:b19,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,\
:b30,:b31  from PKCGBBAS where ((substr(kifrdate,1,6)<=:b32 and substr(kitoda\
te,1,6)>=:b32) and bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)paytype;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)regyn;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)staffyn;
     sqlstm.sqhstl[4] = (unsigned long )2;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)tempyn;
     sqlstm.sqhstl[5] = (unsigned long )2;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&r_kirate;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&s_kirate;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&r_kiamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&s_kiamt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)r_kidate;
     sqlstm.sqhstl[10] = (unsigned long )9;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)s_kidate;
     sqlstm.sqhstl[11] = (unsigned long )9;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)r_basic;
     sqlstm.sqhstl[12] = (unsigned long )2;
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)s_basic;
     sqlstm.sqhstl[13] = (unsigned long )2;
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)r_info;
     sqlstm.sqhstl[14] = (unsigned long )2;
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)s_info;
     sqlstm.sqhstl[15] = (unsigned long )2;
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)r_duty;
     sqlstm.sqhstl[16] = (unsigned long )2;
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)s_duty;
     sqlstm.sqhstl[17] = (unsigned long )2;
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)r_prom;
     sqlstm.sqhstl[18] = (unsigned long )2;
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)s_prom;
     sqlstm.sqhstl[19] = (unsigned long )2;
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)givekind;
     sqlstm.sqhstl[20] = (unsigned long )2;
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&giverate;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)holdkind;
     sqlstm.sqhstl[22] = (unsigned long )2;
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&b_holdrate;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&b_holdamt;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)b_kifrdate;
     sqlstm.sqhstl[25] = (unsigned long )9;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)b_kitodate;
     sqlstm.sqhstl[26] = (unsigned long )9;
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&kidd;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)fixmonthyn;
     sqlstm.sqhstl[28] = (unsigned long )2;
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)fixrateyn;
     sqlstm.sqhstl[29] = (unsigned long )2;
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)bondate;
     sqlstm.sqhstl[30] = (unsigned long )9;
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)fixpay;
     sqlstm.sqhstl[31] = (unsigned long )2;
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)retyymm;
     sqlstm.sqhstl[32] = (unsigned long )7;
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)retyymm;
     sqlstm.sqhstl[33] = (unsigned long )7;
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[34] = (unsigned long )2;
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
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



/* debug ***************************
      printf(" ========bonkind=%s [%d]\n",bonkind,sqlca.sqlcode);
* ************************** */

     if ((sqlca.sqlcode == 1403) )
     {
          /* debug ================================
           printf(" 상여구분[%s] 해당사항 없슴\n",bonkind);
          *  debug ================================ */
          return (FAIL) ;
     }
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"1. 상여지급기준읽기");
          sprintf(log_buff, "1. 상여지급기준읽기");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     return (SUCCESS) ;

}

void del_mas()
{
     /* EXEC SQL
     DELETE  PKMGBMAS_RT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKMGBMAS_RT ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )160;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"상여금 임시테이블 자료 삭제.");
          sprintf(log_buff, "상여금 임시테이블 자료 삭제.");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}


void calc_bonamt(char *binkind)
{
     int cnt = 0 ;

     /* 2.1 상여금 대상자 추출 */
     /* EXEC SQL
     INSERT INTO PKMGBMAS_RT (
     EMPNO, KORNAME, EMPDATE, PAYNUM, PAYCL, PAYGR, ORGNUM, DEPTCODE,
     BONKIND, BONYYMM, BONYN, WRITETIME, WRITEMAN
     )
     SELECT  EMPNO, KORNAME, EMPDATE, PAYNUM, PAYCL, PAYGR, ORGNUM, DEPTCODE,
             :bonkind, :bonyymm, 'Y', to_char(sysdate,'YYYYMMDDHH24MISS'),
             :jobempno
     FROM    PKMRTMAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMGBMAS_RT (EMPNO,KORNAME,EMPDATE,PAYNUM,P\
AYCL,PAYGR,ORGNUM,DEPTCODE,BONKIND,BONYYMM,BONYN,WRITETIME,WRITEMAN)select EM\
PNO ,KORNAME ,EMPDATE ,PAYNUM ,PAYCL ,PAYGR ,ORGNUM ,DEPTCODE ,:b0 ,:b1 ,'Y' \
,to_char(sysdate,'YYYYMMDDHH24MISS') ,:b2  from PKMRTMAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )175;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
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
          print_errmsg(sqlca.sqlcode,"2.1 상여금 대상자 추출");
          sprintf(log_buff, "2.1 상여금 대상자 추출");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      임원,정규직상여종류만 제외하고 모두 삭제
  30.50    2001.03.14      유효성     임원 연봉제에 따른 수정 
============================================================================= */
     /* EXEC SQL
     DELETE  PKMGBMAS_RT
       /o        WHERE (PAYCL BETWEEN '01' AND '08' AND BONKIND BETWEEN '7' AND '8') OR
       **              (PAYCL BETWEEN '09' AND '99' AND BONKIND BETWEEN '1' AND '6');
       o/
      WHERE BONKIND BETWEEN '1' AND '6' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKMGBMAS_RT  where BONKIND between '1' and\
 '6'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )202;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
      if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
      {
           print_errmsg(sqlca.sqlcode,"상여금 임시테이블 자료 삭제.");
           sprintf(log_buff, "상여금 임시테이블 자료 삭제.");
           Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           error_quit("작업실패...");
      }
   
 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      bondate가 null이면 bonyn = 'N'으로 설정

  30.01    1999.03.19     이랑교     지급일이 설정되어 있어도 퇴직일과 비교하여
        퇴직일이 지급일보다 작을 경우는 bonyn을 "N"로 setting
============================================================================= */
        /* --------------------------------
   3.1.0 bonyn설정 
  -------------------------------- */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT
        SET  bonyn  = 'N'
      WHERE  BONYYMM  = :bonyymm
        AND  BONKIND  = :bonkind
        AND  EMPNO IN ( SELECT EMPNO FROM PKMRTMAS WHERE RETDATE  < :bondate ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set bonyn='N' where ((BONYYMM=:b0 a\
nd BONKIND=:b1) and EMPNO in (select EMPNO  from PKMRTMAS where RETDATE<:b2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )217;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bondate;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1.0 bonyn설정 ");
          sprintf(log_buff,"3.1.0 bonyn설정 ");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
  1. bonyn이 Y/N에 따라 kifrdate,kitodate설정
  2. bonyn 'N'이면 kifrdate ~ retdate   만큼 지급
  3. bonyn 'Y'이면 retdate+1 ~ kitodate 만큼 추징
============================================================================= *

  30.01    1999.03.19     이랑교     주어진 상여지급기준에 부합되는 퇴직자가
        있는지 먼저 체크하여 없으면 탈출한다.
============================================================================= */
     /* EXEC SQL 
     SELECT COUNT(*) CNT
       INTO  :cnt
       FROM PKMGBMAS_RT A,PKMRTMAS B
      WHERE A.EMPNO    = B.EMPNO
        AND A.BONYYMM  = :bonyymm
        AND A.BONKIND   = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  CNT into :b0  from PKMGBMAS_RT A ,PKMR\
TMAS B where ((A.EMPNO=B.EMPNO and A.BONYYMM=:b1) and A.BONKIND=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )244;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[2] = (unsigned long )2;
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


     
     if (cnt == 0 ) return;
     
     
     /* EXEC SQL DECLARE c1 CURSOR FOR
     SELECT A.EMPNO, A.KORNAME, RETDATE, TO_CHAR(TO_DATE(RETDATE,'YYYYMMDD')+1,'YYYYMMDD') RETDATE1
       FROM PKMGBMAS_RT A,PKMRTMAS B
      WHERE A.EMPNO     = B.EMPNO
        AND A.BONYYMM   = :bonyymm
        AND A.BONKIND   = :bonkind
      ORDER BY A.EMPNO; */ 

     
     
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )271;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          print_errmsg(sqlca.sqlcode,"Cursor c1 Open Error...");
          sprintf(log_buff, "Cursor c1 Open Error...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )294;
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
          /* EXEC SQL FETCH   c1 INTO
          :empno, :korname, :retdate, :retdate1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )309;
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
          sqlstm.sqhstv[1] = (unsigned char  *)korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
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
          sqlstm.sqhstv[3] = (unsigned char  *)retdate1;
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


          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )340;
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
               print_errmsg(sqlca.sqlcode,"Cursor c1 Data Fetch Error...");
               sprintf(log_buff, "Cursor c1 Data Fetch Error...");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )355;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT
             SET  KIFRDATE = :retdate1,
                  KITODATE = :b_kitodate
           WHERE  bonyymm  = :bonyymm
             AND  bonkind  = :bonkind
             AND  empno    = :empno
             AND  bonyn = 'Y'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT  set KIFRDATE=:b0,KITODATE=:b1 \
where (((bonyymm=:b2 and bonkind=:b3) and empno=:b4) and bonyn='Y')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )370;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)retdate1;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)b_kitodate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)empno;
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


          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
          {
               print_errmsg(sqlca.sqlcode,"3.1.1 기준일설정(지급Y)");
               sprintf(log_buff, "3.1.1 기준일설정(지급Y)");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
          
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT
          SET     KIFRDATE = :b_kifrdate,
                  KITODATE = :retdate
          WHERE   bonyymm  = :bonyymm
          AND     bonkind  = :bonkind
          AND     empno    = :empno
          AND     bonyn = 'N'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT  set KIFRDATE=:b0,KITODATE=:b1 \
where (((bonyymm=:b2 and bonkind=:b3) and empno=:b4) and bonyn='N')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )405;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)b_kifrdate;
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
          sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[3] = (unsigned long )2;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)empno;
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


          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
               print_errmsg(sqlca.sqlcode,"3.1.2 기준일설정(지급N)");
               sprintf(log_buff, "3.1.2 기준일설정(지급N)");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
     }
          
               /* 3.1.3 bonkidd 설정 */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT
        SET  bonkidd  = :kidd,
             bongivedd= (to_date(kitodate,'YYYYMMDD') -
             to_date(kifrdate,'YYYYMMDD') + 1)
      WHERE  bonyymm = :bonyymm
        AND  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set bonkidd=:b0,bongivedd=((to_date\
(kitodate,'YYYYMMDD')-to_date(kifrdate,'YYYYMMDD'))+1) where (bonyymm=:b1 and\
 bonkind=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )440;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&kidd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[2] = (unsigned long )2;
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


     
     /* 3.1.3.1 수습 설정 */
     /* EXEC SQL 
     UPDATE  PKMGBMAS_RT B
        SET  (SUFRDATE,SUTODATE,SUDD )=
             (SELECT  DECODE( GREATEST(ANFRDATE, B.KIFRDATE),B.KIFRDATE,B.KIFRDATE,ANFRDATE), 
                      TO_CHAR(ADD_MONTHS(TO_DATE(ANFRDATE,'YYYYMMDD'),2) - 1,'YYYYMMDD') ANTODATE, 
                      ADD_MONTHS(TO_DATE(ANFRDATE,'YYYYMMDD'),2)  - 
                      TO_DATE( DECODE( GREATEST(ANFRDATE, B.KIFRDATE),B.KIFRDATE,B.KIFRDATE,ANFRDATE),'YYYYMMDD' ) CAL
                FROM  PIHANNO A,  PKCGBBAS C
               where  c.bonyymm = :bonyymm
                 and  c.bonkind = :bonkind
                 and  b.bonyymm = :bonyymm
                 and  b.bonkind = :bonkind
                 and  b.empno  = a.empno 
                 and  ancode   = '111' 
                 and  (a.payra = 'D51' and bpayra is null) 
                 and  (anfrdate > to_char(add_months(to_date(c.kifrdate,'YYYYMMDD'),-1*2),'YYYYMMDD') 
                 and  anfrdate <= c.kitodate))
      where  bonyymm = :bonyymm
        and  bonkind = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT B  set (SUFRDATE,SUTODATE,SUDD)=(sel\
ect DECODE(GREATEST(ANFRDATE,B.KIFRDATE),B.KIFRDATE,B.KIFRDATE,ANFRDATE) ,TO_\
CHAR((ADD_MONTHS(TO_DATE(ANFRDATE,'YYYYMMDD'),2)-1),'YYYYMMDD') ANTODATE ,(AD\
D_MONTHS(TO_DATE(ANFRDATE,'YYYYMMDD'),2)-TO_DATE(DECODE(GREATEST(ANFRDATE,B.K\
IFRDATE),B.KIFRDATE,B.KIFRDATE,ANFRDATE),'YYYYMMDD')) CAL  from PIHANNO A ,PK\
CGBBAS C where (((((((c.bonyymm=:b0 and c.bonkind=:b1) and b.bonyymm=:b0) and\
 b.bonkind=:b1) and b.empno=a.empno) and ancode='111') and (a.payra='D51' and\
 bpayra is null )) and (anfrdate>to_char(add_months(to_date(c.kifrdate,'YYYYM\
MDD'),((-1)* 2)),'YYYYMMDD') and anfrdate<=c.kitodate))) where (bonyymm=:b0 a\
nd bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )467;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[3] = (unsigned long )2;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)bonkind;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          print_errmsg(sqlca.sqlcode,"3.1.3.1 수습 설정");
          sprintf(log_buff, "3.1.3.1 수습 설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* 3.1.3.2 수습기간이 마이너스인경우 보정 */
     /* EXEC SQL 
     UPDATE  PKMGBMAS_RT 
        SET  SUFRDATE = NULL,
             SUTODATE = NULL,
             SUDD     = 0
      where  bonyymm = :bonyymm
        and  bonkind = :bonkind
        and  nvl(sudd,0) < 0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set SUFRDATE=null ,SUTODATE=null ,S\
UDD=0 where ((bonyymm=:b0 and bonkind=:b1) and nvl(sudd,0)<0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )506;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          print_errmsg(sqlca.sqlcode,"3.1.3.2 수습기간이 마이너스인경우 보정");
          sprintf(log_buff, "3.1.3.2 수습기간이 마이너스인경우 보정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /* 3.1.3.3 수습기간이  있는 경우 bongivedd 보정 */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT 
        SET  BONGIVEDD = BONGIVEDD - NVL(SUDD ,0)
      WHERE  BONYYMM = :bonyymm
        AND  BONKIND = :bonkind
        AND  SUDD > 0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set BONGIVEDD=(BONGIVEDD-NVL(SUDD,0\
)) where ((BONYYMM=:b0 and BONKIND=:b1) and SUDD>0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )529;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
     
          print_errmsg(sqlca.sqlcode,"3.1.3.3  수습기간이  있는 경우 bongivedd 보정");
          sprintf(log_buff, "3.1.3.3  수습기간이  있는 경우 bongivedd 보정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     
           /* 3.3.1 근속제외 */
     /* EXEC SQL DECLARE c2 CURSOR FOR
     select  A.empno, A.korname, exkind, exfrdate, B.kifrdate, extodate,
             B.kitodate
       from  pkhexdd A, PKMGBMAS_RT B
      where  bonyymm = :bonyymm
        and  bonkind = :bonkind
        and  A.empno  = B.empno
        and  (kifrdate is not null and kitodate is not null)
        and ((exfrdate >= kifrdate AND exfrdate < kitodate) OR
             (extodate >= kifrdate AND extodate < kitodate) OR
             (exfrdate <= kifrdate AND extodate >= kitodate))
        and  upper(exfixyn) = 'Y'
      order  by A.empno, A.exfrdate; */ 

     
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0014;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )552;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"Cursor c2 Open Error...");
          sprintf(log_buff, "Cursor c2 Open Error...");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )575;
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
          /* EXEC SQL FETCH   c2 INTO
          :empno, :korname, :exkind, :exfrdate, :kifrdate,
          :extodate, :kitodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )590;
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
          sqlstm.sqhstv[1] = (unsigned char  *)korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)exfrdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)kifrdate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)extodate;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)kitodate;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )633;
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
               print_errmsg(sqlca.sqlcode,"Cursor c2 Data Fetch Error...");
               sprintf(log_buff, "Cursor c2 Data Fetch Error...");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )648;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               error_quit("작업실패...");
          }
          
          if  (strcmp(kifrdate,exfrdate) >= 0)
               sprintf(t_frdate,"%s",kifrdate);
          else
               sprintf(t_frdate,"%s",exfrdate);
          
          if  (strcmp(kitodate,extodate) <= 0)
               sprintf(t_todate,"%s",kitodate);
          else
               sprintf(t_todate,"%s",extodate);
          t_term = get_days(t_frdate,t_todate);
 
 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
  1. bonyn이 Y/N에 따라 kifrdate,kitodate설정
  2. bonyn 'N'이면 kifrdate ~ retdate   만큼 지급
  3. bonyn 'Y'이면 retdate+1 ~ kitodate 만큼 추징
============================================================================= */
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT
             SET  BONGIVEDD    = BONGIVEDD - :t_term,
                  SPKIND    = :exkind,
                  SPFRDATE  = :t_frdate,
                  SPTODATE  = :t_todate,
                  SPDD   = SPDD + :t_term
          WHERE  bonyymm = :bonyymm
            AND  bonkind  = :bonkind
            AND  empno  = :empno
            AND  bonyn = 'N'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT  set BONGIVEDD=(BONGIVEDD-:b0),\
SPKIND=:b1,SPFRDATE=:b2,SPTODATE=:b3,SPDD=(SPDD+:b0) where (((bonyymm=:b5 and\
 bonkind=:b6) and empno=:b7) and bonyn='N')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )663;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&exkind;
          sqlstm.sqhstl[1] = (unsigned long )6;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)t_frdate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)t_todate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&t_term;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[5] = (unsigned long )7;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[6] = (unsigned long )2;
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


          
          if  (sqlca.sqlcode != 0) 
          {
               print_errmsg(sqlca.sqlcode,"3.3.1 근속제외1");
               sprintf(log_buff, "3.3.1 근속제외1");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
     }


        /* 잠깐 ===============================================================
   휴직자는 휴직일도포함하여 제외하기 위해서 LEERK IMSI imsi leerk *
  EXEC SQL
  UPDATE  PKMGBMAS_RT
  SET  BONGIVEDD  = NVL(BONGIVEDD,0) + 1
  WHERE  bonyymm = :bonyymm
  AND  bonkind  = :bonkind
  AND     EMPNO ='0554';

  if (sqlca.sqlcode != 0)
  {
   print_errmsg(sqlca.sqlcode,"3.1.3 bonkidd 설정");
   error_quit("작업실패...");
  }
        * 잠깐 =============================================================== */

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      기준임금설정 기존루틴삭제
============================================================================= */
  /* 3.4 기준임금(standamt) 설정 */
/*
  EXEC SQL
  UPDATE  PKMGBMAS_RT
  SET  BASICYN = :r_basic,
   INFOYN  = :r_info,
   DUTYYN  = :r_duty,
   PROMYN  = :r_prom,
   KIRATE  = :r_kirate,
   FIXAMT  = :r_kiamt
  WHERE  bonyymm = :bonyymm
  AND  bonkind  = :bonkind
  AND  (paycl between '10' and '99');
  if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
  {
   print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정1");
   error_quit("작업실패...");
  }
*/

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      기준임금설정항목변경
  30.50    2001.03.14      유효성     임원 연봉제에 따른 수정 
============================================================================= */
/*mjs basicyn => fixpayyn */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT
        SET  FIXPAYYN = :fixpay,
             KIRATE   = :r_kirate,
             FIXAMT   = :r_kiamt
     WHERE   bonyymm = :bonyymm
       AND   bonkind  = :bonkind ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set FIXPAYYN=:b0,KIRATE=:b1,FIXAMT=\
:b2 where (bonyymm=:b3 and bonkind=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )710;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)fixpay;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&r_kirate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&r_kiamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[4] = (unsigned long )2;
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


/*  AND     paycl between '09' and '99';*/
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정1");
          sprintf(log_buff, "3.4 기준임금(standamt) 설정1");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }


/*  EXEC SQL
**  UPDATE  PKMGBMAS_RT
**  SET  BASICYN = :s_basic,
**   INFOYN  = :s_info,
**   DUTYYN  = :s_duty,
**   PROMYN  = :s_prom,
**   KIRATE  = :s_kirate,
**   FIXAMT  = :s_kiamt
**  WHERE  bonyymm = :bonyymm
**  AND  bonkind  = :bonkind
**  AND  paycl between '01' and '08';
**  if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
**  {
**   print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정2");
**   error_quit("작업실패...");
**  }
**       
**      EXEC SQL
**  UPDATE  PKMGBMAS_RT A
**  SET  STANDAMT =
**     (
**     SELECT  DECODE(basicyn,'Y',basicamt,0)  +
**      DECODE(infoyn,'Y',infoamt,0)  +
**      DECODE(dutyyn,'Y',dutyamt,0)  +
**      DECODE(promyn,'Y',promamt,0)
**     FROM  PKMPMAS B
**     WHERE  A.EMPNO = B.EMPNO
**     )
**  WHERE  bonyymm = :bonyymm
**  AND  bonkind  = :bonkind;
**  if (sqlca.sqlcode != 0)
**  {
**   print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정4");
**   error_quit("작업실패...");
**  }
*/ 

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      기준임금설정항목변경
============================================================================= */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT A
        SET  STANDAMT =
                       (
                       SELECT  DECODE(fixpayyn,'Y',fixpay,0)
                         FROM  PKMPMAS B
                        WHERE  A.EMPNO = B.EMPNO
                       )
      WHERE  bonyymm = :bonyymm
        AND  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT A  set STANDAMT=(select DECODE(fixpa\
yyn,'Y',fixpay,0)  from PKMPMAS B where A.EMPNO=B.EMPNO) where (bonyymm=:b0 a\
nd bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )745;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정4");
          sprintf(log_buff, "3.4 기준임금(standamt) 설정4");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     if ((strcmp(paytype,"1") == 0) || (strcmp(paytype,"3") == 0))
     {
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT A
             SET  KIAMT = CEIL(STANDAMT * KIRATE / 100)
           WHERE  bonyymm = :bonyymm
             AND  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT A  set KIAMT=CEIL(((STANDAMT* K\
IRATE)/100)) where (bonyymm=:b0 and bonkind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )768;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[1] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정5");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정5");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
     }
     else
     {
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT A
             SET  KIAMT = 0
           WHERE  bonyymm = :bonyymm
             AND  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT A  set KIAMT=0 where (bonyymm=:\
b0 and bonkind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )791;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[1] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정5");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정5");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
     }
     
     
     if ((strcmp(paytype,"2") == 0) || (strcmp(paytype,"3") == 0))
     {
     
          if  (strcmp(fixrateyn,"Y") == 0)
          {
               /* EXEC SQL
               UPDATE  PKMGBMAS_RT
                  SET  FIXAMT   = CEIL(FIXAMT * ((bongivedd+sudd)/bonkidd))
                WHERE  bonyymm = :bonyymm
                  AND  bonkind  = :bonkind; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 35;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMGBMAS_RT  set FIXAMT=CEIL((FIXAMT* \
((bongivedd+sudd)/bonkidd))) where (bonyymm=:b0 and bonkind=:b1)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )814;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
               sqlstm.sqhstl[0] = (unsigned long )7;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
               sqlstm.sqhstl[1] = (unsigned long )2;
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
                    print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정6");
                    sprintf(log_buff, "3.4 기준임금(standamt) 설정6");
                    Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
                    error_quit("작업실패...");
               }
          }
     }
     else
     {
          /* EXEC SQL
          UPDATE  PKMGBMAS_RT
             SET  FIXAMT = 0
           WHERE  bonyymm = :bonyymm
             AND  bonkind  = :bonkind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 35;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMGBMAS_RT  set FIXAMT=0 where (bonyymm=:b\
0 and bonkind=:b1)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )837;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
          sqlstm.sqhstl[1] = (unsigned long )2;
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
               print_errmsg(sqlca.sqlcode,"3.4 기준임금(standamt) 설정6");
               sprintf(log_buff, "3.4 기준임금(standamt) 설정6");
               Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
               error_quit("작업실패...");
          }
     }

 /*===========================================================================
 Version  date(yy.mm.dd)  programmer  description            relevant doc.no
  30.00    1999.02.28      민정숙     연봉제관련             하나로재개발
                                      기준임금설정항목변경
                                      bonyn 'Y'이면 (-), bonyn 'N'이면 (+)
============================================================================= */
     /* 3.5 총지급액(giveamt) 설정 */
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT
        SET  giveamt = ceil(kiamt * ((bongivedd/bonkidd)+
             decode(kitodate,NULL,1,0.8)*(nvl(sudd,0)/bonkidd))) +
             fixamt
     WHERE   bonyymm = :bonyymm
       AND   bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set giveamt=(ceil((kiamt* ((bongive\
dd/bonkidd)+(decode(kitodate,null ,1,0.8)* (nvl(sudd,0)/bonkidd)))))+fixamt) \
where (bonyymm=:b0 and bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )860;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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
     UPDATE  PKMGBMAS_RT
        SET  giveamt = giveamt*(-1)
      WHERE  bonyymm = :bonyymm
        AND  bonkind  = :bonkind
        AND  bonyn = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set giveamt=(giveamt* (-1)) where (\
(bonyymm=:b0 and bonkind=:b1) and bonyn='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )883;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"3.5 총지급액(giveamt) 설정");
          sprintf(log_buff, "3.5 총지급액(giveamt) 설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     
     /* 3.7 실지급액 설정
            default : 유보는 없는 걸로 */
     
     /* EXEC SQL
     UPDATE  PKMGBMAS_RT
        SET  realamt = giveamt
      WHERE  bonyymm = :bonyymm
        AND  bonkind  = :bonkind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMGBMAS_RT  set realamt=giveamt where (bonyymm=\
:b0 and bonkind=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )906;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bonyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bonkind;
     sqlstm.sqhstl[1] = (unsigned long )2;
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
          print_errmsg(sqlca.sqlcode,"3.7 실지급액 설정");
          sprintf(log_buff, "3.7 실지급액 설정");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
}

/************************************************************
  시작일과 종료일까지의 기간을 일단위로 구하는 함수.
 *************************************************************/
float get_days(char *frdate, char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[8+1] = "";
          char  t2_date[8+1] = "";
          float  result;
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
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select ((TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD'\
))+1) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )929;
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
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
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

/***************************************************************************
  print_errmsg  Function.
 ***************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf(" [ERR_CODE] : (%d)\n", errcode);
     printf(" [ERR_POSITION] : (%s)\n",errmsg);
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
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )956;
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
     sqlstm.arrsiz = 35;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )997;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
